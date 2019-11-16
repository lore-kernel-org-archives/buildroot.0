From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Nov 2019 17:23:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/kmod: fix build with python 3.8
In-Reply-To: <20191116114519.21768-1-fontaine.fabrice@gmail.com>
References: <20191116114519.21768-1-fontaine.fabrice@gmail.com>
Message-ID: <20191116162307.GD32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-11-16 12:45 +0100, Fabrice Fontaine spake thusly:
> Replace second patch that adds -Wl,-z,undefs by a patch that remove
> -Wl,--no-undefined as some ld versions are ignoring this flag:

Alas, I'm afraid this patch will not be upstreamable, especially since
upstream did accept Thomas' patch.

> diff --git a/package/kmod/0002-Do-not-check-for-undefined-symbols-when-building-the.patch b/package/kmod/0002-Do-not-check-for-undefined-symbols-when-building-the.patch
> deleted file mode 100644
> index 3be40d4993..0000000000
> --- a/package/kmod/0002-Do-not-check-for-undefined-symbols-when-building-the.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -From 55a0a0aac503f5012ff2df7af37107544c757f19 Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Date: Tue, 22 Oct 2019 09:56:32 +0200
> -Subject: [PATCH kmod] Do not check for undefined symbols when building the
> - Python modules
[--SNIP--]
> -Upstream: https://lore.kernel.org/linux-modules/20191024174710.9441-1-thomas.petazzoni at bootlin.com/

Applied upstream:
    https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/commit/?id=1d14ef82f4a3be741bcdf6b1c6d51ce9dce43567

> -diff --git a/Makefile.am b/Makefile.am
> -index c5c2f06..8e9c90d 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -173,7 +173,7 @@ CPYTHON_MODULE_CFLAGS = \
> - 	$(AM_CFLAGS) -DCPYTHON_COMPILING_IN_PYPY=0 \
> - 	$(PYTHON_NOWARN) $(PYTHON_CFLAGS) \
> - 	-fvisibility=default
> --CPYTHON_MODULE_LDFLAGS = $(AM_LDFLAGS) -module -avoid-version -shared
> -+CPYTHON_MODULE_LDFLAGS = $(AM_LDFLAGS) -module -avoid-version -shared -Wl,-z,undefs

What about this hack:

    CPYTHON_MODULE_LDFLAGS = (subst -Wl,--no-undefined,,$(AM_LDFLAGS)) ...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
