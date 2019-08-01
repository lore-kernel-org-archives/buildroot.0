From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 15:01:25 +0200
Subject: [Buildroot] [PATCH buildroot-test 4/4] utils/daily-mail: add
 multiple argument to ease modularity of the script
In-Reply-To: <20190708081406.28215-5-victor.huesca@bootlin.com>
References: <20190708081406.28215-1-victor.huesca@bootlin.com>
 <20190708081406.28215-5-victor.huesca@bootlin.com>
Message-ID: <20190801150125.7f1568a6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Jul 2019 10:14:06 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> Options added:
> - Include out-to-date packages
> - Specify a custom date instead of today
> - Enable/disable a header for tables displayed
> - Specify branches to include instead of reading the 'branches' file
> - Allow to send emails to developers only / to the maillist only
> 
> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>

As I replied to the cover letter, this is doing too many things at
once. Please do this argument parsing addition at the beginning of the
series, one argument at a time.


>  # Send the global e-mail to the mailing list
> -def global_email(smtp, results, results_by_reason, datestr, overall, dry_run, outdated=None):
> +def global_email(smtp, results, results_by_reason, datestr, overall, outdated, dry_run, show_header=False):
>      to = "buildroot at buildroot.org"
>      email_from = localconfig.fromaddr
>      subject = "[%s] Build results for %s" % (baseurl, datestr)
>      contents = "Hello,\n\n"
>      contents += "Build statistics for %s\n" % datestr
>      contents += "===============================\n\n"
> -    contents += "      branch |  OK | NOK | TIM | TOT |\n"
> +    contents += "      branch |  OK | NOK | TIM | TOT\n"

This change is not really related.

> +    if show_header:
> +        contents += "-------------+-----+-----+-----+-----\n"

This is also not related to adding argument parsing, but related to
adding headers to existing tables. Should be a separate commit.

>      for branch in sorted(overall.iterkeys()):
>          stats = overall[branch]
>          if stats[3] == 0:
>              continue
> -        contents += "  %10s | %3d | %3d | %3d | %3d |\n" % \
> +        contents += "  %10s | %3d | %3d | %3d | %3d\n" % \
>                      (branch, stats[0], stats[1], stats[2], stats[3])

Ditto, unrelated to argument parsing.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
