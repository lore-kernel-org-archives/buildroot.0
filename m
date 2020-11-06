From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 06 Nov 2020 15:59:35 +0100
Subject: [Buildroot] [PATCH 0/5] Extend pkg-stats to replace cve-checker
In-Reply-To: <20201105163024.1387248-1-thomas.petazzoni@bootlin.com>
References: <20201105163024.1387248-1-thomas.petazzoni@bootlin.com>
Message-ID: <874km28rag.fsf@BL-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Hello,
>
> We recently introduced cve-checker (commit
> fafa3e4e293faabc0d38a714eb88a25252936a99). But thinking more about it,
> what it does is in fact very similar to pkg-stats. It even largely
> borrows from pkg-stats structure and logic.
>
> The main difference is that pkg-stats was originally written as a
> Buildroot maintainer-oriented tool, where the goal is to keep an eye
> on the entire set of Buildroot packages. On the other hand,
> cve-checker was written as a tool mainly for a Buildroot user, to keep
> an eye on the CVEs affecting just the packages currently enabled in
> the current configuration.
>
> So, what this patch series does is extend pkg-stats so that instead of
> producing its output only for all Buildroot packages, it can be done
> just for the set of packages enabled in the current configuration.


Your series looks good and I think it is a good things to finally remove
cve-checker. I introduced cve.py in order to share code between
cve-checker and pkg-stats but in the end there was sill a lot of
duplicate code, and each evolution was really painful, as it was needed
to duplicate it in each script but with very few difference.

Gregory

>
> Here is how it goes:
>
>  - PATCH 1 makes pkg-stats usable outside of the Buildroot top-level
>    directory. This will be useful to be able to run it from any output
>    directory.
>
>  - PATCH 2 really allows pkg-satts to generate its details based on
>    the set of currently configured packages. This mode is enabled
>    using the new -c option.
>
>  - PATCH 3 drops cve-checker
>
>  - PATCH 4 promotes the pkg-stats functionality as a Makefile
>    target. Note that only the "pkg-stats -c" mode is used here: we
>    target the use of pkg-stats by Buildroot users, who want results
>    based on their configuration. The use of pkg-stats as a maintainer
>    tool is different, and we assume maintainers will know how to run
>    pkg-stats.
>
>  - PATCH 5 adds some mentions of "make show-info" and "make pkg-stats"
>    in the Buildroot manual.
>
> Note: I think this series should be merged in master, not in
> next. Indeed, cve-checker is new in 2020.11-rc1, so it would probably
> be a bit silly to release 2020.11 with cve-checker and remove it right
> after.
>
> Thanks,
>
> Thomas
>
> Thomas Petazzoni (5):
>   support/scripts/pkg-stats: allow to run script outside of the
>     top-level directory
>   support/scripts/pkg-stats: support generating stats based on
>     configured packages
>   support/scripts/cve-checker: remove script
>   Makefile: add pkg-stats target
>   docs/manual: add some minimal documentation about show-info and
>     pkg-stats
>
>  Makefile                     |   9 ++
>  docs/manual/common-usage.txt |  23 ++++
>  support/scripts/cve-checker  | 196 -----------------------------------
>  support/scripts/pkg-stats    |  48 ++++++---
>  4 files changed, 63 insertions(+), 213 deletions(-)
>  delete mode 100755 support/scripts/cve-checker
>
> -- 
> 2.26.2
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
