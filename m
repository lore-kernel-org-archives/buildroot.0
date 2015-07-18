From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Sat, 18 Jul 2015 00:17:58 -0300
Subject: [Buildroot] [PATCH] ARC: update tools to arc-2015.06 release
In-Reply-To: <20150717225415.GF3637@free.fr>
References: <1436964678-24352-1-git-send-email-abrodkin@synopsys.com>
 <55A8EAF7.5060506@openwide.fr> <20150717222354.GE3637@free.fr>
 <20150717225415.GF3637@free.fr>
Message-ID: <20150718031758.GA21884@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

On Sat, Jul 18, 2015 at 12:54:15AM +0200, Yann E. MORIN wrote:
> Romain, All,
> 
> On 2015-07-18 00:23 +0200, Yann E. MORIN spake thusly:
> > On 2015-07-17 13:45 +0200, Romain Naour spake thusly:
> > [--SNIP--]
> > > Your patch looks good, but I have a build failure with uclibc:
> > > 
> > > make O=test/arc/ toolchain 2>&1 | tee build-arc-toolchain.log
> [--SNIP--]
> > OK, I was able to reproduce the error. [...]
> 
> Here's a patch that does fix the issue.
> 
> Tested on-top of master, with:
>   - in-tree build
>   - out-of-tree build without makefile wrapper (Romain's use-case)
>   - out-of-tree build with makefile wrapper (my use-case)
> 
> They all worked at least so far as to build uclibc (make uclibc);
> nothing more was attempted).
> 
> The change is not unlike what we already had to test where O was coming
> from, but we just reverse the logic to keep only what we're interested
> in, and we forcibly unexport O.
> 
> I'm not really happy with the patch to start with (hence I'm not
> officially pushing it):
> 
>     diff --git a/Makefile b/Makefile
>     index 531ac5d..5abca65 100644
>     --- a/Makefile
>     +++ b/Makefile
>     @@ -29,11 +29,16 @@ UMASK=0022
>      ifneq ($(shell umask),$(UMASK))
>      .PHONY: all $(MAKECMDGOALS)
>      
>     +ifeq ($(origin O),command line)
>     +EXTRAMAKEARGS = O=$(O)
>     +endif
>     +unexport O
>     +
>      all:
>     -	@umask $(UMASK) && $(MAKE  ) --no-print-directory
>     +	@umask $(UMASK) && $(MAKE) $(EXTRAMAKEARGS) -- no-print-directory
>      
>      $(MAKECMDGOALS):
>     -	@umask $(UMASK) && $(MAKE) --n o-print-directory $@
>     +	@umask $(UMASK) && $(MAKE) $(EXTRAMAKEARGS) --no   -print-directory $@
>      
>      else # umask

This works OK. But I think something like:

	diff --git a/Makefile b/Makefile
	index afdf554..df52c85 100644
	--- a/Makefile
	+++ b/Makefile
	@@ -329,6 +329,7 @@ unexport CONFIG_SITE
	 unexport QMAKESPEC
	 unexport TERMINFO
	 unexport MACHINE
	+unexport O

	 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)

does too. Maybe I'm missing something, but I don't think we would ever
want to export $(O) to any of the package Makefiles, the same way we
don't export $(CC).

Note that $(origin O) will still be "command line" in the sub-make after
setting the umask, since "O=..." will be set in $(MAKEFLAGS), thus there
shouldn't be a difference in the run.

I tested those 3 cases you mentioned and they work OK, but I'll run full
builds in a minute.

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
