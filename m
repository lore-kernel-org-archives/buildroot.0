From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 24 Feb 2020 09:03:56 +0100
Subject: [Buildroot] [PATCH v3 05/12] support/scripts/pkg-stats: add
 package status
In-Reply-To: <124f4a69-9050-5062-cf67-e89d0d8e3233@railnova.eu>
References: <20200222085715.23769-1-heiko.thiery@gmail.com>
 <20200222085715.23769-6-heiko.thiery@gmail.com>
 <124f4a69-9050-5062-cf67-e89d0d8e3233@railnova.eu>
Message-ID: <CAEyMn7Yt5n_cSeQKq1F8mDcsKd5J6TL-JbM+hwOAeCHzLgEQMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am So., 23. Feb. 2020 um 16:19 Uhr schrieb Titouan Christophe
<titouan.christophe@railnova.eu>:
>
> Heiko, all,
>
> First of all, I really like this idea, as it makes the status checks
> quite easier to extend !
>
> On 2/22/20 9:57 AM, Heiko Thiery wrote:
> > Unify the status check information. The status is stored in a tuple. The
> > first entry is the status that can be 'ok', 'warning' or 'error'. The
> > second entry is a verbose message.
> >
> > The following checks are performed:
> > - url: status of the URL check
> > - license: status of the license presence check
> > - license-files: status of the license file check
> > - hash: status of the hash file presence check
> > - patches: status of the patches count check
> > - pkg-check: status of the check-package script result
> > - developers: status if a package has developers in the DEVELOPERS file
> > - version: status of the version check
> >
> > With that status information the following variables are replaced:
> > has_license, has_license_files, has_hash, url_status
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> >   support/scripts/pkg-stats | 104 +++++++++++++++++++++++++-------------
> >   1 file changed, 69 insertions(+), 35 deletions(-)
> >
> > diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> > index ebaf04465e..7c8cc81cf2 100755
> > --- a/support/scripts/pkg-stats
> > +++ b/support/scripts/pkg-stats
> > @@ -66,18 +66,15 @@ class Package:
> >           self.path = path
> >           self.infras = None
> >           self.license = None
> > -        self.has_license = False
> > -        self.has_license_files = False
> > -        self.has_hash = False
> >           self.patch_count = 0
> >           self.patch_files = []
> >           self.warnings = 0
> >           self.current_version = None
> >           self.url = None
> > -        self.url_status = None
> >           self.url_worker = None
> >           self.cves = list()
> >           self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
> > +        self.status = {}
> >
> >       def pkgvar(self):
> >           return self.name.upper().replace("-", "_")
> > @@ -86,17 +83,17 @@ class Package:
> >           """
> >           Fills in the .url field
> >           """
> > -        self.url_status = "No Config.in"
> > +        self.status['url'] = ("warning", "no Config.in")
> >           for filename in os.listdir(os.path.dirname(self.path)):
> >               if fnmatch.fnmatch(filename, 'Config.*'):
> >                   fp = open(os.path.join(os.path.dirname(self.path), filename), "r")
> >                   for config_line in fp:
> >                       if URL_RE.match(config_line):
> >                           self.url = config_line.strip()
> > -                        self.url_status = "Found"
> > +                        self.status['url'] = ("ok", "found")
> >                           fp.close()
> >                           return
> > -                self.url_status = "Missing"
> > +                self.status['url'] = ("warning", "missing")
>
> I would set ("error", "missing") for consistency with what is done elsewhere

Yes I will change that.

By the way I have no glue what is correct. What is an error and what
is only a warning? I think this has to be a separate threat.

e.g. for the version check. Is it an error when a newer package is
available and "only" a warning if the version cannot be checked
against release monitoring version?

>
> >                   fp.close()
> >
> >       def set_infra(self):
>
> [-- SNIP --]
>
> > @@ -496,6 +517,18 @@ def check_package_latest_version(packages):
> >           pkg.latest_version['status'] = r[0]
> >           pkg.latest_version['version'] = r[1]
> >           pkg.latest_version['id'] = r[2]
> > +
> > +        if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
> > +            pkg.status['version'] = ('warning', 'RM API error')
> > +        elif pkg.latest_version['status'] == RM_API_STATUS_NOT_FOUND:
> > +            pkg.status['version'] = ('warning', 'RM package not found')
> > +
> > +        if pkg.latest_version['version'] is None:
> > +            pkg.status['version'] = ('warning', 'no upstream version available')
> > +        elif pkg.latest_version['version'] != pkg.current_version:
> > +            pkg.status['version'] = ('error', 'package needs update')
>
> We can make the messages a bit more explicit:
> * "Release Monitoring API error"
> * "Package not found on Release Monitoring"
> * "The newer version {} is available
> upstream".format(pkg.latest_version['version'])
>

ok

> > +        else:
> > +            pkg.status['version'] = ('ok', 'up-to-date')
> >       del http_pool
> >
> >
>
> [-- SNIP --]
>
> > @@ -746,12 +779,13 @@ def dump_html_pkg(f, pkg):
> >
> >       # URL status
> >       td_class = ["centered"]
> > -    url_str = pkg.url_status
> > -    if pkg.url_status == "Missing" or pkg.url_status == "No Config.in":
> > +    url_str = pkg.status['url'][1]
> > +    if pkg.status['url'][0] == "warning":
> > +        td_class.append("missing_url")
> > +    elif pkg.status['url'][0] == "error":
> >           td_class.append("missing_url")
>
> The above 2 conditions can be simplified like:
>
> +    if pkg.status['url'][0] in ("error", "warning"):
> +        td_class.append("missing_url")

But then I have to change this to:

@@ -778,10 +778,9 @@ def dump_html_pkg(f, pkg):
     # URL status
     td_class = ["centered"]
     url_str = pkg.status['url'][1]
-    if pkg.status['url'][0] == "warning":
-        td_class.append("missing_url")
-    elif pkg.status['url'][0] == "error":
+    if pkg.status['url'][0] in ("error", "warning"):
         td_class.append("missing_url")
+    if pkg.status['url'][0] == "error":
         td_class.append("invalid_url")
         url_str = "<a href=%s>%s</a>" % (pkg.url, pkg.status['url'][1])
     else:

So the invalid_url class is set only in case of status 'error'. Right?

> > -    elif pkg.url_status.startswith("Invalid"):
> >           td_class.append("invalid_url")
> > -        url_str = "<a href=%s>%s</a>" % (pkg.url, pkg.url_status)
> > +        url_str = "<a href=%s>%s</a>" % (pkg.url, pkg.status['url'][1])
> >       else:
> >           td_class.append("good_url")
> >           url_str = "<a href=%s>Link</a>" % pkg.url
> >
>
>
> Best regards,
>
> Titouan

Thank you,
Heiko
