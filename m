From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 14:57:59 +0200
Subject: [Buildroot] [PATCH buildroot-test 1/4] utils/daily-mail: add
 information about version that may need an update
In-Reply-To: <20190708081406.28215-2-victor.huesca@bootlin.com>
References: <20190708081406.28215-1-victor.huesca@bootlin.com>
 <20190708081406.28215-2-victor.huesca@bootlin.com>
Message-ID: <20190801145759.3ccb5fc3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  8 Jul 2019 10:14:03 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

>  def show_results(results, show_status, show_orphan=False):
>      contents = ""
>      for r in results:
> @@ -157,33 +176,55 @@ def show_results(results, show_status, show_orphan=False):
>              orphan_str = ""
>          url = http_baseurl + "/results/" + r['identifier']
>          if show_status:
> -            contents += "%12s | %30s | %3s | %40s" % (arch, reason, status_str, url)
> +            contents += "%12s | %30s | %3s | %79s" % (arch, reason, status_str, url)
>          else:
> -            contents += "%12s | %30s | %40s" % (arch, reason, url)
> +            contents += "%12s | %30s | %79s" % (arch, reason, url)

These two changes are not related to this commit.

>          if show_orphan:
>              contents += " | %4s\n" % (orphan_str)
>          else:
>              contents += "\n"
>      return contents
>  
> +def show_outdated(packages, show_orphan=False, show_header=False):

To be honest, I'm not so sure about all the show_header stuff. Just
make it unconditional, i.e show headers all the time. I don't think the
extra complexity is really worth it.

> +    contents = ''
> +    if show_header:
> +        contents += '{:^30} | {:^8} | {:^44} | {:^12} | {:^12}'.format('name', 'found by', 
> +                                                                     'link to release-moinotring.org', 

Typo on "link to release-moinotring.org".

> +                                                                     'version', 'upstream')
> +        if show_orphan:
> +            contents += ' | {:^5}'.format('orph?')
> +        contents += '\n{0:-^30}-+-{0:-^8}-+-{0:-^44}-+-{0:-^12}-+-{0:-^12}-'.format('')
> +        if show_orphan:
> +            contents += '+-{:-^5}-'.format('')
> +        contents += '\n'

For consistency with the rest of the code, you should use "%12s" style,
or have a preparation commit that converts the existing code to
the .format() thing. But mixing both is not nice.

> +    for pkg in packages:
> +        pkg_str = { k: (v[:9] + '...' if k in ('version', 'upstream') and len(v) > 12 else v) for k, v in pkg.items() }

Meh, that's a bit quirky. It at least deserves a comment I believe.

> +        orphan_str = 'ORHP' if 'orphan' in pkg and pkg['orphan'] else ''
> +        contents += '{name:>30} | {from:^8} | https://release-monitoring.org/project/{id:0>5} | {version:12} | {upstream:12}'.format(**pkg_str)
> +        if show_orphan:
> +            contents += ' | {:4}'.format(orphan_str)
> +        contents += '\n'
> +    return contents
> +
>  # Send the e-mails to the individual developers
>  def developers_email(smtp, branches, notifications, datestr, dry_run):
> -    for k, v in notifications.iteritems():
> -        to = k.name
> +    for dev, notif in notifications.iteritems():

The change from k, v to dev, notif should be in a separate commit. It's
a good change, but it's unrelated.

> +        to = dev.name
>          email_from = localconfig.fromaddr
>          subject = "[%s] Your build results for %s" % (baseurl, datestr)
>          contents = "Hello,\n\n"
>          contents += textwrap.fill("This is the list of Buildroot build failures that occured on %s, and for which you are a registered architecture developer or package developer. Please help us improving the quality of Buildroot by investigating those build failures and sending patches to fix them. Thanks!" % datestr)

We will probably want to change this text, because the e-mail will no
longer be just about build failures.

>          contents += "\n\n"
> -        show_orphan = k.name == ORPHAN_DEVELOPER
> +        show_orphan = dev.name == ORPHAN_DEVELOPER
>  
>          for branch in branches:
> -            if v.arch_notifications.has_key(branch):
> -                archs = v.arch_notifications[branch]
> +            if notif.arch_notifications.has_key(branch):
> +                archs = notif.arch_notifications[branch]
>              else:
>                  archs = []
> -            if v.package_notifications.has_key(branch):
> -                packages = v.package_notifications[branch]
> +            if notif.package_notifications.has_key(branch):
> +                packages = notif.package_notifications[branch]

All these changes are unrelated to the outdated package change, they
are related to the k,v -> dev,notif change, which should be in a
separate commit.

>              else:
>                  packages = []
>  
> @@ -203,6 +244,12 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
>  
>              contents += "\n"
>  
> +        outdated = notif.package_version_notification

I think we should call this notif.outdated_package_notifications

> +        if len(outdated) != 0:
> +            contents += "Packages you maintain that have a new upstream version:\n\n"
> +            contents += show_outdated(outdated, show_orphan=show_orphan)
> +            contents += '\n'
> +
>          contents += "-- \n"
>          contents += http_baseurl
>          if dry_run:
> @@ -220,7 +267,7 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
>              msg['From'] = email_from
>              msg['Date'] = formatdate()
>              smtp.sendmail(email_from, to, msg.as_string())
> -            print "To: %s" % k.name
> +            print "To: %s" % dev.name

Same as above: should be in a separate commit.

> +def get_outdated_pkg(path):
> +    with open(path, 'r') as f:
> +        stats = json.load(f)
> +    s = []
> +    for name, pkg in stats['packages'].items():
> +        status, latest_ver, p_id = pkg['latest_version']
> +        cur_ver = pkg['current_version']
> +        if  status in (2, 3) and cur_ver and latest_ver and not RE_HASH_40.match(cur_ver) \
> +                             and version.parse(str(cur_ver)) < version.parse(str(latest_ver)):

Can we do it like this:

		if status not in (2, 3):
			continue

		if cur_ver is None or latest_ver is None:
			continue

		if RE_HASH_40.match(cur_ver):
			continue

		if version.parse(str(cur_ver)) >= version.parse(str(latest_ver)):
			continue

and then append to the list.

>  def __main__():
>      yesterday = date.today() - timedelta(1)
>      yesterday_str = yesterday.strftime('%Y-%m-%d')
> @@ -327,7 +396,8 @@ def __main__():
>      overall_stats = get_overall_stats(db, yesterday_str, branches)
>      results = get_build_results(db, yesterday_str, branches)
>      results_by_reason = get_build_results_grouped_by_reason(db, yesterday_str, branches)
> -    notifications = calculate_notifications(results)
> +    outdated_pkg = get_outdated_pkg(localconfig.pkg_stats)
> +    notifications = calculate_notifications(results, outdated_pkg)

The new notifications don't get used anywhere, because global_email()
is never passed the outdated package details. This is due to the patch
ordering issue. Once you fix the patch ordering/organization problem,
you'll be able to add the outdated package support in one patch
properly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
