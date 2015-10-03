From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 3 Oct 2015 15:31:49 +0200
Subject: [Buildroot] [PATCH 0/6 RFC] toolchain/external: use generic
 extract commands (branch yem/extract-cmds)
In-Reply-To: <cover.1441233378.git.yann.morin.1998@free.fr>
References: <cover.1441233378.git.yann.morin.1998@free.fr>
Message-ID: <560FD8C5.1060803@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 03/09/2015 00:51, Yann E. MORIN a ?crit :
> Hello All!
> 
> This series is an attempt at simplifying the way external toolchains are
> extracted.
> 
> Currently, external toolchains use custom extract commands, because they
> want to exclude a bumch of files during extraction, so as to save a bit
> of space (locales in some toolchains can account for up to 80% of the
> size of the toolchain as a whole).
> 
> And it turns out, gcc also wants to exclude a bunch of files (java and
> go, testsuites).
> 
> Using custom extract commands means that those packages (and critical
> ones, at that) can not benefit from the enhancements and fixes made to
> the generic commands, like the automatic triiping of components.
> 
> In this series:
> 
>   - we first introduce the support for the exclusion list
>   - we always break/dereference hardlinks
>   - we make gcc use the exclusion list
>   - we then make the external toolchains use it (in two passes: one for
>     the non-Blackfin case, one for it, as it is 'seecial')
>   - finaly, we introduce the Codescape MTI toolchain from Vincent
> 
> Thomas, there is a question for you in the second commit: would you
> care to explain what your goal was when you added --hard-dereference
> when extracting the Blackfin toolchains?
> 

What do you think about a new Kconfig option that allow users to define a list
of excluded files or directories.
Some toolchains (ie SourceryCodeBench standard) can bundle eclipse or other
stuff that are not used in the build process.

Something like:

config BR2_TOOLCHAIN_EXTERNAL_EXCLUDES
	string "Exclude unwanted directories from the toolchain archive"
	default ""
	help
	  If some directories in the toolchain archive are not intended
	  to be used in the build process, this option define a
	  space-separated list of patterns to exclude when extracting
	  the archive.

ifneq ($(BR2_TOOLCHAIN_EXTERNAL_EXCLUDES),)
TOOLCHAIN_EXTERNAL_EXCLUDES = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_EXCLUDES))
endif

Thoughts ?

Best regards,
Romain

> Regards,
> Yann E. MORIN.
