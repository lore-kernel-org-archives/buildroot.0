From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Apr 2015 18:34:49 +0200
Subject: [Buildroot] Advice on how to build TGT
In-Reply-To: <003c01d079ea$52d2a8b0$f877fa10$@go-unified.com>
References: <003c01d079ea$52d2a8b0$f877fa10$@go-unified.com>
Message-ID: <20150418163449.GB4538@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Benedikt, All,

On 2015-04-18 16:14 +0100, Benedikt Riedel spake thusly:
> I am trying to get this application into my buildroot to provide and manage iSCSI targets
> 
> [1]http://stgt.sourceforge.net/
> 
> 
> 
> The package is compiling/installing, however I am not able to run the service or the binary.
> 
> 
> 
> # tgtd
> 
> -sh: tgtd: not found
> 
> 
> 
> 
> 
> The config.in is fairly simple:
> 
> 
> 
> STGT_VERSION= 1.0.57
> 
> STGT_SOURCE = v1.0.57.tar.gz
> 
> STGT_SITE = https://github.com/fujita/tgt/archive/

Please use the github helper. See the manual:
    http://buildroot.net/downloads/manual/manual.html#github-download-url

> STGT_AUTORECONF = NO

Unneeded since that's the default. Anyway, wrong since it's not an
autotools package (see below).

> STGT_INSTALL_STAGING = NO
> STGT_INSTALL_TARGET = YES

Unneeded, that's the default.

> STGT_DEPENDENCIES = uclibc

Incorrect. And anyway, the dependency on the toolchain is automatic.

> $(eval $(autotools-package))

I'm very surprised this works, since tgt does not have configure, nor
does it have configure.ac or Makefile.am or the other autotools-related
files.

What you want to use is the generic-package infrastructure. See the
manual.

> Any suggestion on what I am missing or an alternative iSCSI target
> that works with kernel >3.18 would be appreciated.

Well, I've had a quick look at tgt, and it seems it will be hard (very
hard) to cross-compile, given the way the Makefiles are written. For
example, there's a ton of things like (in usr/Makefile):

    ifneq ($(shell test -e /usr/include/linux/signalfd.h && echo 1),)
    CFLAGS += -DUSE_SIGNALFD
    endif

which are clearly wrong for cross-compilation.

tgt would indeed be a nice addition, but it would need quite some love
and care... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
