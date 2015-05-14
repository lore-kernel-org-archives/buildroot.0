From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 15 May 2015 01:00:20 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "package/ola: fix autoreconf
 issue for host-ola"
In-Reply-To: <1431637036-8089-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1431637036-8089-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1431637036-8089-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <55552904.4080605@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all

Le 14/05/2015 22:57, Thomas Petazzoni a ?crit :
> This reverts commit 884af65fd5ddc548f19a26162f905a32ef0b53b3. Thanks
> to the change of the installation path of host-autoconf-archive
> macros, host-ola will no longer see them when doing its autoreconf, so
> the patch that was added by the commit being reverted here is no
> longer needed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain

> ---
>  ...on-t-overwrite-CC-and-CXX-with-ACX_PTHREA.patch | 51 ----------------------
>  1 file changed, 51 deletions(-)
>  delete mode 100644 package/ola/0002-autotools-don-t-overwrite-CC-and-CXX-with-ACX_PTHREA.patch
> 
> diff --git a/package/ola/0002-autotools-don-t-overwrite-CC-and-CXX-with-ACX_PTHREA.patch b/package/ola/0002-autotools-don-t-overwrite-CC-and-CXX-with-ACX_PTHREA.patch
> deleted file mode 100644
> index 80d21bc..0000000
> --- a/package/ola/0002-autotools-don-t-overwrite-CC-and-CXX-with-ACX_PTHREA.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 991eef9f84a5ef58eaab8ea0a85f3b4bce7b00a3 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@openwide.fr>
> -Date: Sat, 2 May 2015 01:50:14 +0200
> -Subject: [PATCH] autotools: don't overwrite CC and CXX with ACX_PTHREAD
> - success
> -
> -If ACX_PTHREAD sucess, CC and CXX value are overwriten respectively
> -to PTHREAD_CC and PTHREAD_CXX. But ACX_PTHREAD has been hacked to
> -set PTHREAD_CXX variable for the C++ compiler and configure.ac has
> -been modified accordingly.
> -
> -If ax_pthread.m4 wich provide standard AX_PTHREAD macro (and it's
> -alias ACX_PTHREAD and AX_PTHREAD), is installed on the system by
> -autoconf-archive package, then ax_pthread.m4 is used during
> -autoreconf instread of acx_pthread.m4 bundled with ola.
> -
> -AX_PTHREAD macro from ax_pthread.m4 check only the thread support
> -with the C compiler. As a result, the C++ compiler variable
> -PTHREAD_CXX is not initialized, so CXX become empy and the build
> -fail during resolv.h check.
> -
> -configure:19945: checking for 2-arg pthread_setname_np
> -configure:19965:  -o conftest -O2 [snip -I and -L] conftest.cpp  -ldl  >&5
> -./configure: line 2037: -o: command not found
> -
> -In the Buildroot use case, it's safe to remove CC and CXX overwrite
> -since only gcc/g++ compiler are used.
> -
> -Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ----
> - configure.ac | 4 +---
> - 1 file changed, 1 insertion(+), 3 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index b1946b6..ef85af5 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -303,9 +303,7 @@ AM_CONDITIONAL([HAVE_NCURSES], [test "x$have_ncurses" = xyes])
> - ACX_PTHREAD([
> -              LIBS="$PTHREAD_LIBS $LIBS"
> -              CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
> --             CXXFLAGS="$CXXFLAGS $PTHREAD_CXXFLAGS"
> --             CC="$PTHREAD_CC"
> --             CXX="$PTHREAD_CXX"],
> -+             CXXFLAGS="$CXXFLAGS $PTHREAD_CXXFLAGS"],
> -             [AC_MSG_ERROR([Missing pthread, please install it])])
> - 
> - # pthread_setname_np can take either 1 or 2 arguments.
> --- 
> -1.9.3
> -
> 
