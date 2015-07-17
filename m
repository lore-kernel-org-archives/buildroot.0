From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jul 2015 00:54:15 +0200
Subject: [Buildroot] [PATCH] ARC: update tools to arc-2015.06 release
In-Reply-To: <20150717222354.GE3637@free.fr>
References: <1436964678-24352-1-git-send-email-abrodkin@synopsys.com>
 <55A8EAF7.5060506@openwide.fr> <20150717222354.GE3637@free.fr>
Message-ID: <20150717225415.GF3637@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-07-18 00:23 +0200, Yann E. MORIN spake thusly:
> On 2015-07-17 13:45 +0200, Romain Naour spake thusly:
> [--SNIP--]
> > Your patch looks good, but I have a build failure with uclibc:
> > 
> > make O=test/arc/ toolchain 2>&1 | tee build-arc-toolchain.log
[--SNIP--]
> OK, I was able to reproduce the error. [...]

Here's a patch that does fix the issue.

Tested on-top of master, with:
  - in-tree build
  - out-of-tree build without makefile wrapper (Romain's use-case)
  - out-of-tree build with makefile wrapper (my use-case)

They all worked at least so far as to build uclibc (make uclibc);
nothing more was attempted).

The change is not unlike what we already had to test where O was coming
from, but we just reverse the logic to keep only what we're interested
in, and we forcibly unexport O.

I'm not really happy with the patch to start with (hence I'm not
officially pushing it):

    diff --git a/Makefile b/Makefile
    index 531ac5d..5abca65 100644
    --- a/Makefile
    +++ b/Makefile
    @@ -29,11 +29,16 @@ UMASK=0022
     ifneq ($(shell umask),$(UMASK))
     .PHONY: all $(MAKECMDGOALS)
     
    +ifeq ($(origin O),command line)
    +EXTRAMAKEARGS = O=$(O)
    +endif
    +unexport O
    +
     all:
    -	@umask $(UMASK) && $(MAKE  ) --no-print-directory
    +	@umask $(UMASK) && $(MAKE) $(EXTRAMAKEARGS) -- no-print-directory
     
     $(MAKECMDGOALS):
    -	@umask $(UMASK) && $(MAKE) --n o-print-directory $@
    +	@umask $(UMASK) && $(MAKE) $(EXTRAMAKEARGS) --no   -print-directory $@
     
     else # umask
     

I'll let a night pass by on this and maybe I'll have a cleaner solution
tomorrow.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
