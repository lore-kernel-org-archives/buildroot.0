From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Nov 2011 00:10:30 +0000
Subject: [Buildroot] [PATCH 1 of 5 v2] Makefile.package.in: add utility
	functions find*clauses and notfirstword
In-Reply-To: <b6579582d02dd802adca.1321557990@devws108>
References: <patchbomb.1321557989@devws108>
 <b6579582d02dd802adca.1321557990@devws108>
Message-ID: <201111180010.30871.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 17 November 2011 19:41:48 Thomas De Schampheleire wrote:
> # HG changeset patch
> # User Thomas De Schampheleire <thomas.de_schampheleire@alcatel-lucent.com>
> # Date 1318518890 -7200
> # Node ID b6579582d02dd802adca94e2b38972cc19cd8b76
> # Parent  baa870774b887fb01a9de0cc69161f250553f896
> Makefile.package.in: add utility functions find*clauses and notfirstword

 Is it possible to tell hg to remove these lines?  git-am will include them
in the commit message...

> 
> This patch adds a few utility functions to Makefile.package.in.
> 
> Functions finddirclauses and findfileclauses help in building a find command
> that skips a set of directories and performs operations on a set of files.
> This pattern can for example be used to keep certain files or directories from
> being stripped, or to remove certain files from a package installation.
> 
> The notfirstword function is the inverse of the 'firstword' function in make:
> it returns all but the first word.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 I think you could safely have added a
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 And to ThomasP: this helper does simplify patch 3/5 a lot.  Even though
the macros look a bit ugly indeed.

 Regards,
 Arnout

> 
> ---
> v2: integrate _cont variants in main find*clauses functions. Thanks, Arnout.
> 
>  package/Makefile.package.in |  11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -87,6 +87,17 @@ MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)
>  TERM_BOLD := $(shell tput smso)
>  TERM_RESET := $(shell tput rmso)
>  
> +# Utility functions for 'find'
> +# findfileclauses: creates "-name 'X' -o -name 'Y'"
> +# [1:namelist]
> +findfileclauses=-name '$(firstword $(1))' $(patsubst %,-o -name '%',$(call notfirstword,$(1)))
> +# finddirclauses: creates "-wholename 'basedir/dirX' -o -wholename 'basedir/dirY'"
> +# [1:basedir, 2:namelist]
> +finddirclauses=-wholename '$(firstword $(2))' $(patsubst %,-o -wholename '$(1)/%',$(call notfirstword,$(2)))
> +
> +# Miscellaneous utility functions
> +notfirstword=$(wordlist 2,$(words $(1)),$(1))
> +
>  # Download method commands
>  WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
>  SVN:=$(call qstrip,$(BR2_SVN))
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
