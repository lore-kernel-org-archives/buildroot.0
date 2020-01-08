From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Jan 2020 23:01:50 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "package/libnss: fix build
 failure on RHEL 7"
In-Reply-To: <20200108170745.99342-1-giulio.benetti@benettiengineering.com>
References: <20200108170745.99342-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200108220150.GE17943@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2020-01-08 18:07 +0100, Giulio Benetti spake thusly:
> After discussing upstream here:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1603398
> it turned out that my patch to fix the bug is wrong. The best way to fix
> it is to append -DLINUX to NATIVE_FLAGS in libnss.mk. Next patch is
> going to fix this.
> 
> This reverts commit fe4b47a12181b89eecb9a8e324f1ad053147f948.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

I've applied both to master, but as a single commit.

Indeed, this comit removing a patch that fixes a build failure, so all
alone, it breaks the build again.

And in case the second patch is not applied, the build stays broken.

and indeed, the two are in fact a single semantic patch: revert a change
that upstream deemed incorrect, and aply a fix that upstream suggested
as a replqacement for the incorrect patch.

So, I merged both commit in a single one, adapted the commit log, and
pushed. Thanks!

Regards,
Yann E. MORIN.

> ---
>  ...-nsinstall.c-build-failure-on-RHEL-7.patch | 29 -------------------
>  1 file changed, 29 deletions(-)
>  delete mode 100644 package/libnss/0003-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch
> 
> diff --git a/package/libnss/0003-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch b/package/libnss/0003-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch
> deleted file mode 100644
> index 631d97d11f..0000000000
> --- a/package/libnss/0003-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 1ba8516045bc8a13fd72e1a85206a04b29d96758 Mon Sep 17 00:00:00 2001
> -From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> -Date: Thu, 12 Dec 2019 12:57:29 +0100
> -Subject: [PATCH] Bug 1603398 - Fix nsinstall.c build failure on RHEL 7
> -
> -In Linux.mk -DLINUX and -Dlinux must be passed to DEFINES, not
> -OS_CFLAGS.
> -
> -Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ----
> - nss/coreconf/Linux.mk | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/nss/coreconf/Linux.mk b/nss/coreconf/Linux.mk
> -index d07f8a3c5..4b45a6054 100644
> ---- a/nss/coreconf/Linux.mk
> -+++ b/nss/coreconf/Linux.mk
> -@@ -132,7 +132,7 @@ endif
> - 
> - OS_CFLAGS		= $(DSO_CFLAGS) $(OS_REL_CFLAGS) $(ARCHFLAG) -pipe -ffunction-sections -fdata-sections -DHAVE_STRERROR
> - ifeq ($(KERNEL),Linux)
> --	OS_CFLAGS	+= -DLINUX -Dlinux
> -+	DEFINES		+= -DLINUX -Dlinux
> - endif
> - OS_LIBS			= $(OS_PTHREAD) -ldl -lc
> - 
> --- 
> -2.20.1
> -
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
