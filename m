From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 22:42:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/ustr: Fix musl build by forcing
 glibc detection to true
In-Reply-To: <1463848097-26113-1-git-send-email-bernd.kuhls@t-online.de>
References: <1463848097-26113-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160522224216.38058be5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 May 2016 18:28:17 +0200, Bernd Kuhls wrote:

> +--- ustr-1.0.4/configure.ac.orig	2016-05-21 18:08:02.000000000 +0200
> ++++ ustr-1.0.4/configure.ac	2016-05-21 18:18:47.170881727 +0200
> +@@ -24,7 +24,7 @@
> + int version = __GLIBC__;
> + 	]])],
> + 	[AC_MSG_RESULT([yes]); GLIBC_USED=1;],
> +-	[AC_MSG_RESULT([no]); GLIBC_USED=0;])
> ++	[AC_MSG_RESULT([no]); GLIBC_USED=1;])

I know this is the easiest/shortest fix, but it's not very pretty. The
good solution IMHO is to remove this glibc check completely, and
instead use AC_CACHE_VAL() so that a cache variable allows to override
the result of the AC_TRY_RUN() test.

That being said, you said in a reply that libsemanage, which is the
only package that uses ustr, does not build with musl due to
getpwent_r() being missing. getpwent_r() is a glibc-specific extension,
so it will most likely not be implemented by musl. So either
libsemanage can be changed to use getpwent() (making sure that
libsemanage didn't need the reentrant characteristic of getpwent_r), or
we should simply make libsemanage/ustr not available on musl.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
