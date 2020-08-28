From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 11:03:34 +0200
Subject: [Buildroot] [PATCH v3 4/8] support/script: Make CVE class
 independent of the Pacakage class
In-Reply-To: <20200724154356.2607639-5-gregory.clement@bootlin.com>
References: <20200724154356.2607639-1-gregory.clement@bootlin.com>
 <20200724154356.2607639-5-gregory.clement@bootlin.com>
Message-ID: <20200828110334.72a8944e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Typo in the commit title: Pacakage -> Package

On Fri, 24 Jul 2020 17:43:52 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> The affects method of the CVE use the Package class defined in
> pkg-stats. The purpose of migrating the CVE class outside of pkg-stats
> was to be able to reuse it from other scripts. So let's remove the
> Package dependency and only use the needed information.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

I've applied to next, with a few changes. See below.

> +        if (self.identifier in cve_ignore_list):

No parenthesis needed.

> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 58847f9ca6..f073e866cb 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -242,11 +242,12 @@ class Package:
>                      self.status['pkg-check'] = ("error", "{} warnings".format(self.warnings))
>                  return
>  
> -    def is_cve_ignored(self, cve):
> +    def cve_ignored_list(self):

Renamed to just ignored_cves(self), and more importantly, added the
@property statement, since really that's what it is: a property of the
class. This allows to reference it like this: pkg.ignored_cves as if it
was a normal property of the class, not a function.

> +        print(self.all_ignored_cves.get(self.pkgvar(), []))

Spurious debug message.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
