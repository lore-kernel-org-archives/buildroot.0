From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Mar 2012 23:19:22 +0100
Subject: [Buildroot] [PATCH 10/20] nbd: bump to version 3.0
In-Reply-To: <1331502489-5036-10-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 11 Mar 2012 18:47:59 -0300")
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
 <1331502489-5036-10-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87r4wywzkl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/nbd/nbd-fix-non-lfs.patch         |   37 -----------------------------
 Gustavo>  package/nbd/nbd-server-susv3-legacy.patch |   11 --------
 Gustavo>  package/nbd/nbd.mk                        |    5 +++-
 Gustavo>  3 files changed, 4 insertions(+), 49 deletions(-)
 Gustavo>  delete mode 100644 package/nbd/nbd-fix-non-lfs.patch
 Gustavo>  delete mode 100644 package/nbd/nbd-server-susv3-legacy.patch

 Gustavo> diff --git a/package/nbd/nbd-fix-non-lfs.patch b/package/nbd/nbd-fix-non-lfs.patch
 Gustavo> deleted file mode 100644
 Gustavo> index 41a80cd..0000000
 Gustavo> --- a/package/nbd/nbd-fix-non-lfs.patch
 Gustavo> +++ /dev/null
 Gustavo> @@ -1,37 +0,0 @@
 Gustavo> -From 8dd182693e9995bc1aeb907f9fd4ec06c18fc56f Mon Sep 17 00:00:00 2001
 Gustavo> -From: Peter Korsgaard <jacmet@sunsite.dk>
 Gustavo> -Date: Mon, 5 Dec 2011 23:27:30 +0100
 Gustavo> -Subject: [PATCH] lfs.h: fix !LFS builds
 Gustavo> -
 Gustavo> -Commit 448637fba4 (Fix 32/64 bit confusion) broke !LFS builds as it
 Gustavo> -added the PARAM_OFFT defines inside the wrong conditional.
 Gustavo> -
 Gustavo> -Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 Gustavo> ----
 Gustavo> - lfs.h |    4 ++--
 Gustavo> - 1 files changed, 2 insertions(+), 2 deletions(-)
 Gustavo> -
 Gustavo> -diff --git a/lfs.h b/lfs.h
 Gustavo> -index 64a03de..68d3b81 100644
 Gustavo> ---- a/lfs.h
 Gustavo> -+++ b/lfs.h
 Gustavo> -@@ -6,14 +6,14 @@
 Gustavo> - #define _FILE_OFFSET_BITS 64
 Gustavo> - #ifndef _LARGEFILE_SOURCE
 Gustavo> - #define _LARGEFILE_SOURCE
 Gustavo> -+#endif
 Gustavo> - #define PARAM_OFFT PARAM_INT64
 Gustavo> - #else
 Gustavo> - #define PARAM_OFFT PARAM_INT
 Gustavo> --#endif
 Gustavo> -+#endif /* NBD_LFS */
 Gustavo> - #ifdef HAVE_SYNC_FILE_RANGE
 Gustavo> - #define USE_SYNC_FILE_RANGE
 Gustavo> - #define _GNU_SOURCE
 Gustavo> - #endif /* HAVE_SYNC_FILE_RANGE */
 Gustavo> --#endif /* NBD_LFS */
 Gustavo> - 
 Gustavo> - #endif /* LFS_H */
 Gustavo> --- 
 Gustavo> -1.7.7.1
 Gustavo> -
 Gustavo> diff --git a/package/nbd/nbd-server-susv3-legacy.patch b/package/nbd/nbd-server-susv3-legacy.patch
 Gustavo> deleted file mode 100644
 Gustavo> index 58d38e1..0000000
 Gustavo> --- a/package/nbd/nbd-server-susv3-legacy.patch
 Gustavo> +++ /dev/null
 Gustavo> @@ -1,11 +0,0 @@
 Gustavo> ---- nbd-2.9.11/nbd-server.c	2009-10-01 16:10:15.000000000 +0200
 Gustavo> -+++ nbd-2.9.11/nbd-server.c	2009-10-01 16:10:32.000000000 +0200
 Gustavo> -@@ -264,7 +264,7 @@
 Gustavo> -   
 Gustavo> -   	inet_aton(opts->clientname, &client);
 Gustavo> - 	while (fgets(line,LINELEN,f)!=NULL) {
 Gustavo> --		if((tmp=index(line, '/'))) {
 Gustavo> -+		if((tmp=strchr(line, '/'))) {
 Gustavo> - 			if(strlen(line)<=tmp-line) {
 Gustavo> - 				msg4(LOG_CRIT, ERRMSG, line, opts->server->authname);
 Gustavo> - 				return 0;
 Gustavo> diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
 Gustavo> index d9d0a85..21071fa 100644
 Gustavo> --- a/package/nbd/nbd.mk
 Gustavo> +++ b/package/nbd/nbd.mk
 Gustavo> @@ -4,11 +4,14 @@
 Gustavo>  #
 Gustavo>  #############################################################
 
 Gustavo> -NBD_VERSION = 2.9.24
 Gustavo> +NBD_VERSION = 3.0
 Gustavo>  NBD_SOURCE = nbd-$(NBD_VERSION).tar.bz2
 Gustavo>  NBD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/nbd/
 Gustavo>  NBD_CONF_OPT = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
 Gustavo>  NBD_DEPENDENCIES = libglib2
 Gustavo> +# We have linux/falloc.h
 Gustavo> +# but uClibc lacks fallocate(2) which is a glibc-ism
 Gustavo> +NBD_CONF_ENV = ac_cv_header_linux_falloc_h=no

I but this in a:

ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)

conditional. Other that that it looks fine, committed - Thanks.

-- 
Bye, Peter Korsgaard
