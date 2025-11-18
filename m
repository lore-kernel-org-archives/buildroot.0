Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978C0CEE34D
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 21:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BE5B6073A;
	Tue, 18 Nov 2025 21:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsgflhcTv76S; Tue, 18 Nov 2025 21:11:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B52D6605CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B52D6605CA;
	Tue, 18 Nov 2025 21:11:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC16B37D
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 21:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8E4D605CA
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 21:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJUouuBvpi1f for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 21:11:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71746605A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71746605A9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71746605A9
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 21:11:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 926A8A4C7252;
 Tue, 18 Nov 2025 22:11:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36560)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vLSzN-000000006mj-0G88;
 Tue, 18 Nov 2025 21:11:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 18 Nov 2025 22:11:49 +0100
Message-ID: <20251118211149.2013582-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763500309;
 bh=1p5jWeMz2hkiuZ93V+crLtjHVci8Y4VvPjArY5kFrYY=;
 h=From:To:Cc:Subject:Date:From;
 b=SGm4iMnyHOG/HVhCOeVbYg5JInxV0AXPAr4lwdnCBBqwxk2/fnGQZI+jQyXlgGWsN
 q8I6f+AiQtA5ffpQzSpzbCmgopFlfkIyd0dMwMTlk/U+PIMS8/IIHpchfjFVWN2v1M
 ceEA0eumUo++yb+OKUPQ0RCvzdrb7XW18P9EKPGd5IRzl1w43SjCYiEZwYHs3ZjX6n
 jPEfpLafOJsnmv5GTv1xGKCfePTrngPgJyl8ArLO0pCMxPGZA9abkLz4N4Ut4IJ5ff
 tVgreTFynRkDLz3/3EKznzkEJ5on3voGVXvmEjPv5cDdykQOhiCNYwxocPJb7vow5r
 mXSg4Urqc2LhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=SGm4iMny
Subject: [Buildroot] [PATCH 1/1] package/xinetd: bump version to 2.3.15.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switched to maintained fork:
https://github.com/xinetd-org/xinetd/issues/30

Removed all patches, they are either included in this release or not
needed anymore.

uClibc builds are broken due to missing ecvt/fcvt functions:
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/include/stdlib.h?h=v1.0.55#n830
needed by
https://github.com/openSUSE/xinetd/blob/master/src/sio/sprint.c#L176

Added -std=gnu17 to CFLAGS as per upstream recommendation to fix build
errors with newer gcc: https://github.com/openSUSE/xinetd/issues/49

Fixes:
https://autobuild.buildroot.net/results/399/399108140f1932e867e2907c5fa1be2add53beab/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  5 --
 package/xinetd/0001-ar.patch                  | 74 -------------------
 package/xinetd/0002-destdir.patch             | 55 --------------
 package/xinetd/0003-rpc-fix.patch             | 26 -------
 package/xinetd/0004-configure-rlim_t.patch    | 18 -----
 ...netd-ignores-user-and-group-directiv.patch | 29 --------
 package/xinetd/Config.in                      |  7 +-
 package/xinetd/xinetd.hash                    |  4 +-
 package/xinetd/xinetd.mk                      | 15 +++-
 9 files changed, 19 insertions(+), 214 deletions(-)
 delete mode 100644 package/xinetd/0001-ar.patch
 delete mode 100644 package/xinetd/0002-destdir.patch
 delete mode 100644 package/xinetd/0003-rpc-fix.patch
 delete mode 100644 package/xinetd/0004-configure-rlim_t.patch
 delete mode 100644 package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 2554347bd7..8cfb183835 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1140,11 +1140,6 @@ package/xen/0001-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch lib_patch.
 package/xen/0002-Fix-build-with-64-bits-time_t.patch lib_patch.Upstream
 package/xen/0003-libs-light-fix-tv_sec-printf-format.patch lib_patch.Upstream
 package/xen/0004-libs-light-fix-tv_sec-fprintf-format.patch lib_patch.Upstream
-package/xinetd/0001-ar.patch lib_patch.Upstream
-package/xinetd/0002-destdir.patch lib_patch.Upstream
-package/xinetd/0003-rpc-fix.patch lib_patch.Upstream
-package/xinetd/0004-configure-rlim_t.patch lib_patch.Upstream
-package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch lib_patch.Upstream
 package/xl2tp/xl2tpd lib_shellscript.TrailingSpace
 package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch lib_patch.Upstream
 package/yajl/0001-Let-the-shared-and-the-static-library-have-the-same-.patch lib_patch.Upstream
diff --git a/package/xinetd/0001-ar.patch b/package/xinetd/0001-ar.patch
deleted file mode 100644
index 566f2f75ee..0000000000
--- a/package/xinetd/0001-ar.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-This patch changes all of the hard-coded invocations of "ar" to $(AR), to
-support a cross-compilation toolchain.
-
-The content of this patch was copied from the OpenWrt project:
-https://dev.openwrt.org/browser/packages/net/xinetd/patches/001-ar.patch
-
-Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
-
---- a/libs/src/misc/Makefile.in
-+++ b/libs/src/misc/Makefile.in
-@@ -62,7 +62,7 @@
- 
- 
- $(LIBNAME): $(OBJECTS)
--	ar r $@ $?
-+	$(AR) r $@ $?
- 	$(RANLIB) $@
- 
- install: $(LIBNAME)
---- a/libs/src/portable/Makefile.in
-+++ b/libs/src/portable/Makefile.in
-@@ -57,7 +57,7 @@
- 
- 
- $(LIBNAME): $(OBJECTS)
--	ar r $@ $?
-+	$(AR) r $@ $?
- 	$(RANLIB) $@
- 
- install: $(LIBNAME)
---- a/libs/src/pset/Makefile.in
-+++ b/libs/src/pset/Makefile.in
-@@ -53,7 +53,7 @@
- 	mv $(LIBNAME) $(LIBDIR)/optimized
- 
- $(LIBNAME): $(OBJECTS)
--	ar r $@ $?
-+	$(AR) r $@ $?
- 	$(RANLIB) $@
- 
- install: $(LIBNAME)
---- a/libs/src/sio/Makefile.in
-+++ b/libs/src/sio/Makefile.in
-@@ -52,7 +52,7 @@
- 	$(INSTALL) $(FMODE) $(LIBNAME) $(LIBDIR)/optimized
- 
- $(LIBNAME): $(OBJECTS)
--	ar r $@ $?
-+	$(AR) r $@ $?
- 	$(RANLIB) $@
- 
- install: $(LIBNAME)
---- a/libs/src/str/Makefile.in
-+++ b/libs/src/str/Makefile.in
-@@ -63,7 +63,7 @@
- 	$(INSTALL) $(FMODE) $(LIBNAME) $(LIBDIR)-O
- 
- $(LIBNAME): $(OBJECTS)
--	ar r $@ $?
-+	$(AR) r $@ $?
- 	$(RANLIB) $@
- 
- LINT_IGNORE=possible pointer alignment|RCSid unused
---- a/libs/src/xlog/Makefile.in
-+++ b/libs/src/xlog/Makefile.in
-@@ -58,7 +58,7 @@
- 	$(INSTALL) $(FMODE) $(LIBNAME) $(LIBDIR)/optimized
- 
- $(LIBNAME): $(OBJECTS)
--	ar r $@ $?
-+	$(AR) r $@ $?
- 	$(RANLIB) $@
- 
- install: $(LIBNAME)
diff --git a/package/xinetd/0002-destdir.patch b/package/xinetd/0002-destdir.patch
deleted file mode 100644
index 7a323eb68a..0000000000
--- a/package/xinetd/0002-destdir.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-This patch adds $(DESTDIR) to xinetd's installation paths, to support 
-installation to a cross-compiled RFS area.
-
-The content of this patch was inspired by the OpenWrt project:
-https://dev.openwrt.org/browser/packages/net/xinetd/patches/002-destdir.patch
-
-Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
-
-diff -urN xinetd-2.3.15.ORIG/Makefile.in xinetd-2.3.15/Makefile.in
---- xinetd-2.3.15.ORIG/Makefile.in	2007-09-20 13:01:52.000000000 -0400
-+++ xinetd-2.3.15/Makefile.in	2012-06-18 10:20:00.540864388 -0400
-@@ -75,27 +75,27 @@
- 
- install: build
- 	for i in $(DAEMONDIR) $(BINDIR) $(MANDIR)/man5 $(MANDIR)/man8 ; do \
--	   test -d $$i || mkdir -p $$i ; done
--	$(INSTALL_CMD) -m 755 xinetd/xinetd $(DAEMONDIR)
--	$(INSTALL_CMD) -m 755 xinetd/itox $(DAEMONDIR)
--	$(INSTALL_CMD) -m 755 $(SRCDIR)/xinetd/xconv.pl $(DAEMONDIR)
--	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/xinetd.conf.man $(MANDIR)/man5/xinetd.conf.5
--	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/xinetd.log.man $(MANDIR)/man8/xinetd.log.8
--	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/xinetd.man $(MANDIR)/man8/xinetd.8
--	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/itox.8 $(MANDIR)/man8/itox.8
--	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/xconv.pl.8 $(MANDIR)/man8/xconv.pl.8
-+	   test -d $(DESTDIR)$$i || mkdir -p $(DESTDIR)$$i ; done
-+	$(INSTALL_CMD) -m 755 xinetd/xinetd $(DESTDIR)$(DAEMONDIR)
-+	$(INSTALL_CMD) -m 755 xinetd/itox $(DESTDIR)$(DAEMONDIR)
-+	$(INSTALL_CMD) -m 755 $(SRCDIR)/xinetd/xconv.pl $(DESTDIR)$(DAEMONDIR)
-+	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/xinetd.conf.man $(DESTDIR)$(MANDIR)/man5/xinetd.conf.5
-+	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/xinetd.log.man $(DESTDIR)$(MANDIR)/man8/xinetd.log.8
-+	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/xinetd.man $(DESTDIR)$(MANDIR)/man8/xinetd.8
-+	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/itox.8 $(DESTDIR)$(MANDIR)/man8/itox.8
-+	$(INSTALL_CMD) -m 644 $(SRCDIR)/xinetd/xconv.pl.8 $(DESTDIR)$(MANDIR)/man8/xconv.pl.8
- 	@echo "You must put your xinetd.conf in /etc/xinetd.conf"
- 	@echo "There is a sample config file in xinetd/sample.conf and you can"
- 	@echo "use xconv.pl to convert your old inetd.conf file to an xinetd format"
- 
- uninstall:
--	rm -f $(DAEMONDIR)/xinetd
--	rm -f $(DAEMONDIR)/itox
--	rm -f $(DAEMONDIR)/xconv.pl
--	rm -f $(MANDIR)/man5/xinetd.conf.5
--	rm -f $(MANDIR)/man8/xinetd.log.8
--	rm -f $(MANDIR)/man8/xinetd.8
--	rm -f $(MANDIR)/man8/itox.8
-+	rm -f $(DESTDIR)$(DAEMONDIR)/xinetd
-+	rm -f $(DESTDIR)$(DAEMONDIR)/itox
-+	rm -f $(DESTDIR)$(DAEMONDIR)/xconv.pl
-+	rm -f $(DESTDIR)$(MANDIR)/man5/xinetd.conf.5
-+	rm -f $(DESTDIR)$(MANDIR)/man8/xinetd.log.8
-+	rm -f $(DESTDIR)$(MANDIR)/man8/xinetd.8
-+	rm -f $(DESTDIR)$(MANDIR)/man8/itox.8
-  
- distclean: clean
- 	rm -f config.cache config.log Makefile config.status xinetd/itox
diff --git a/package/xinetd/0003-rpc-fix.patch b/package/xinetd/0003-rpc-fix.patch
deleted file mode 100644
index 6c32b7291e..0000000000
--- a/package/xinetd/0003-rpc-fix.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-This patch fixes compiling xinetd without RPC support.
-
-The content of this patch was copied from the OpenWrt project:
-https://dev.openwrt.org/browser/packages/net/xinetd/patches/003-rpc_fix.patch
-
-Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
-
---- a/xinetd/confparse.c
-+++ b/xinetd/confparse.c
-@@ -745,7 +745,7 @@ static status_e check_entry( struct serv
- 	   }
-    }
- 
--/* #ifndef NO_RPC */
-+#ifndef NO_RPC
- #if defined(HAVE_RPC_RPCENT_H) || defined(HAVE_NETDB_H)
-    if ( SC_IS_RPC( scp ) && !SC_IS_UNLISTED( scp ) )
-    {
-@@ -759,6 +759,7 @@ static status_e check_entry( struct serv
-       SC_RPCDATA( scp )->rd_program_number = rep->r_number ;
-    }
-    else
-+#endif
- #endif   /* ! NO_RPC */
-    {
-        if ( !SC_IS_UNLISTED( scp ) ) 
diff --git a/package/xinetd/0004-configure-rlim_t.patch b/package/xinetd/0004-configure-rlim_t.patch
deleted file mode 100644
index e1cb48ac6a..0000000000
--- a/package/xinetd/0004-configure-rlim_t.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Have the configure script look for rlim_t in <sys/resource.h>
-
-That's where POSIX says it should be. Some libcs will include its
-definition via <sys/types.h> as well, but musl doesn't.
-
-Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
-
---- xinetd-2.3.15.orig/configure	2007-09-20 16:58:27.000000000 +0200
-+++ xinetd-2.3.15/configure	2014-09-16 17:20:22.787665449 +0200
-@@ -7909,7 +7909,7 @@
- cat confdefs.h >>conftest.$ac_ext
- cat >>conftest.$ac_ext <<_ACEOF
- /* end confdefs.h.  */
--#include <sys/types.h>
-+#include <sys/resource.h>
- #if STDC_HEADERS
- #include <stdlib.h>
- #endif
diff --git a/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch b/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
deleted file mode 100644
index bb2ee1fc9a..0000000000
--- a/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 91e2401a219121eae15244a6b25d2e79c1af5864 Mon Sep 17 00:00:00 2001
-From: Thomas Swan <thomas.swan@gmail.com>
-Date: Wed, 2 Oct 2013 23:17:17 -0500
-Subject: [PATCH] CVE-2013-4342: xinetd: ignores user and group directives for
- TCPMUX services
-
-Originally reported to Debian in 2005 <http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=324678> and rediscovered <https://bugzilla.redhat.com/show_bug.cgi?id=1006100>, xinetd would execute TCPMUX services without dropping privilege to match the service configuration allowing the service to run with same privilege as the xinetd process (root).
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- xinetd/builtins.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/xinetd/builtins.c b/xinetd/builtins.c
-index 3b85579..34a5bac 100644
---- a/xinetd/builtins.c
-+++ b/xinetd/builtins.c
-@@ -617,7 +617,7 @@ static void tcpmux_handler( const struct server *serp )
-    if( SC_IS_INTERNAL( scp ) ) {
-       SC_INTERNAL(scp, nserp);
-    } else {
--      exec_server(nserp);
-+      child_process(nserp);
-    }
- }
- 
--- 
-2.20.1
-
diff --git a/package/xinetd/Config.in b/package/xinetd/Config.in
index 3bf3043d03..f509905f1c 100644
--- a/package/xinetd/Config.in
+++ b/package/xinetd/Config.in
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_XINETD
 	bool "xinetd"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no ecvt/fcvt
 	help
 	  xinetd is a secure replacement for inetd. It was originally
 	  written by panos@cs.colorado.edu.
 
-	  http://www.xinetd.org
+	  https://github.com/openSUSE/xinetd
+
+comment "xinetd needs a glibc or musl toolchain"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/xinetd/xinetd.hash b/package/xinetd/xinetd.hash
index ce5a93f571..5290a9be02 100644
--- a/package/xinetd/xinetd.hash
+++ b/package/xinetd/xinetd.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  620b25f4ab4d72fdf32b13797156ea40df2049f1c07e640177e5fec544e9a94c  xinetd-2.3.15.tar.gz
-sha256  2f3dd19831b1837f7360f80a7700a130c04a59e387d4359299d6df712308bbed  COPYRIGHT
+sha256  2baa581010bc70361abdfa37f121e92aeb9c5ce67f9a71913cebd69359cc9654  xinetd-2.3.15.4.tar.xz
+sha256  71c945b960d8f0666009d0486f0ac1f710c881c2b97b155187adbc98e07644da  COPYRIGHT
diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index f63a8a2251..1542e44b6b 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -4,18 +4,25 @@
 #
 ################################################################################
 
-XINETD_VERSION = 2.3.15
-XINETD_SITE = \
-	$(call github,xinetd-org,xinetd,xinetd-$(subst .,-,$(XINETD_VERSION)))
+XINETD_VERSION = 2.3.15.4
+XINETD_SOURCE = xinetd-$(XINETD_VERSION).tar.xz
+XINETD_SITE = https://github.com/openSUSE/xinetd/releases/download/$(XINETD_VERSION)
 XINETD_LICENSE = xinetd license
 XINETD_LICENSE_FILES = COPYRIGHT
 XINETD_CPE_ID_VENDOR = xinetd
 
-# 0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
+# https://github.com/openSUSE/xinetd/commit/91e2401a219121eae15244a6b25d2e79c1af5864
 XINETD_IGNORE_CVES += CVE-2013-4342
 
 XINETD_CFLAGS = $(TARGET_CFLAGS)
 
+# gcc-15 defaults to -std=gnu23 which introduces build failures.
+# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
+# versions will work, since they are using the older standard.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+XINETD_CFLAGS += -std=gnu17
+endif
+
 # Three cases here:
 #  1. We have libtirpc, use it by passing special flags
 #  2. We have native RPC support, use it, no need to pass special
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
