Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403D6C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 17:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB5D180E70;
	Sun, 18 May 2025 17:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsEOLl9zp_8e; Sun, 18 May 2025 17:39:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08AE880EC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08AE880EC3;
	Sun, 18 May 2025 17:39:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CFEC1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DE8C4077C
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9yKJN1r9j8Fv for <buildroot@buildroot.org>;
 Sun, 18 May 2025 17:39:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F3CB7404EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3CB7404EF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3CB7404EF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:39:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B6F18A4C2059
 for <buildroot@buildroot.org>; Sun, 18 May 2025 19:39:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56904)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGhz1-000000002fg-3rnR
 for buildroot@buildroot.org; Sun, 18 May 2025 17:39:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 19:39:32 +0200
Message-Id: <20250518173932.2148232-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747589972;
 bh=dKQiBEPYFWn29VjJ+dWVXqS9oyiBOnkwBacjUvYtijw=;
 h=From:To:Subject:Date:From;
 b=ECp6hnu+A2eLH43xgKw/VE71490OKwuYMLw8TVpfX38CjKZn6BVaAOBhNYhawMXRU
 5OdhKfdZiGBuhQYeLyBfs//pje/uePbbp6BcyiignMKCnnTvFH/u9QGQemYf45qRH5
 SeSnkebLNczWs7F2fLqIEJyI+Y4XRpziFCSVrOarhYqHluasRN3pRaL+FUntegETXA
 1GVXdDlFyp+54wB9fvjWw0tDpfeB2JngOC3CyBm0OY45dB0AhXkVA4STgeWSP6TJln
 fuDDPPocbKkX1s/8e44ybpdr7uq/sb5OfVLncfGABTsVpGGOv6CJvywzAvgc18jfJe
 BugUBQJ4yB0ng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=ECp6hnu+
Subject: [Buildroot] [PATCH 1/1] package/privoxy: bump version to 4.0.0
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

Changelog:
https://www.privoxy.org/gitweb/?p=privoxy.git;a=blob;f=ChangeLog;h=a7bffc52b8996c327a23ee562627841550ed90e9;hb=6adadda85067fb7d4cc8663fbfbcacb4b0206615

Removed patches which are included in this release.

Added support for pcre2 which was added upstream in the release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...on-t-exit-if-configuration-files-are.patch | 30 ----------------
 ...0002-GNUMakefile.in-fix-root-install.patch | 35 -------------------
 package/privoxy/Config.in                     |  2 +-
 package/privoxy/privoxy.hash                  |  6 ++--
 package/privoxy/privoxy.mk                    |  4 +--
 5 files changed, 6 insertions(+), 71 deletions(-)
 delete mode 100644 package/privoxy/0001-GNUmakefile-in-Don-t-exit-if-configuration-files-are.patch
 delete mode 100644 package/privoxy/0002-GNUMakefile.in-fix-root-install.patch

diff --git a/package/privoxy/0001-GNUmakefile-in-Don-t-exit-if-configuration-files-are.patch b/package/privoxy/0001-GNUmakefile-in-Don-t-exit-if-configuration-files-are.patch
deleted file mode 100644
index e04d191ce0..0000000000
--- a/package/privoxy/0001-GNUmakefile-in-Don-t-exit-if-configuration-files-are.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4b3b267db159dc23314de3062859481b7c397e32 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 17 Mar 2024 12:36:31 +0100
-Subject: [PATCH] GNUmakefile.in: Don't exit if configuration files are
- installed as root
-
-... as this can be considered acceptable when cross-compiling
-Privoxy inside an autobuilder with only a root user.
-
-Upstream: https://www.privoxy.org/gitweb/?p=privoxy.git;a=commit;h=4b3b267db159dc23314de3062859481b7c397e32
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- GNUmakefile.in | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/GNUmakefile.in b/GNUmakefile.in
-index 04cceb15..cf79aae1 100644
---- a/GNUmakefile.in
-+++ b/GNUmakefile.in
-@@ -927,7 +927,6 @@ install: CONF_DEST LOG_DEST PID_DEST check_doc GROUP_T
- 					$(ECHO)  " and to install the config files as that user and/or group!" ;\
- 					$(ECHO)  " Please read INSTALL, and create a privoxy user and group!" ;\
- 					$(ECHO)  "*******************************************************************" ;\
--					exit 1 ;\
- 				fi ;\
- 			else \
- 				GROUP_T=$(GROUP) ;\
--- 
-2.39.2
-
diff --git a/package/privoxy/0002-GNUMakefile.in-fix-root-install.patch b/package/privoxy/0002-GNUMakefile.in-fix-root-install.patch
deleted file mode 100644
index 89347c214e..0000000000
--- a/package/privoxy/0002-GNUMakefile.in-fix-root-install.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 25bd5ae1664f5603c05c72b2c38525602f33da0a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 31 Mar 2024 19:17:45 +0200
-Subject: [PATCH] GNUMakefile.in: fix root install
-
-Set GROUP_T when installing configuration files as root to avoid the
-following build failure since commit
-4b3b267db159dc23314de3062859481b7c397e32:
-
-/usr/bin/install: missing destination file operand after '/home/buildroot/instance-0/output-1/target/etc'
-
-Fixes:
- - http://autobuild.buildroot.org/results/eb4ccf248c9c5048e9b71058bb0311b1e0763883
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://lists.privoxy.org/pipermail/privoxy-devel/2024-March/000760.html
----
- GNUmakefile.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/GNUmakefile.in b/GNUmakefile.in
-index cf79aae1..db1bab59 100644
---- a/GNUmakefile.in
-+++ b/GNUmakefile.in
-@@ -927,6 +927,7 @@ install: CONF_DEST LOG_DEST PID_DEST check_doc GROUP_T
- 					$(ECHO)  " and to install the config files as that user and/or group!" ;\
- 					$(ECHO)  " Please read INSTALL, and create a privoxy user and group!" ;\
- 					$(ECHO)  "*******************************************************************" ;\
-+					GROUP_T=$(GROUP) ;\
- 				fi ;\
- 			else \
- 				GROUP_T=$(GROUP) ;\
--- 
-2.43.0
-
diff --git a/package/privoxy/Config.in b/package/privoxy/Config.in
index accb48dfc2..4138c0d281 100644
--- a/package/privoxy/Config.in
+++ b/package/privoxy/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PRIVOXY
 	bool "privoxy"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2 if !BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_ZLIB
 	help
 	  A non-caching web proxy with advanced filtering capabilities
diff --git a/package/privoxy/privoxy.hash b/package/privoxy/privoxy.hash
index 67a44f2c94..3c96c5644e 100644
--- a/package/privoxy/privoxy.hash
+++ b/package/privoxy/privoxy.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/ijbswa/files/Sources/3.0.34%20%28stable%29/
-sha1  e65298c4ee235320ea9ddfb689187bda29a63bbb  privoxy-3.0.34-stable-src.tar.gz
+# From https://sourceforge.net/projects/ijbswa/files/Sources/4.0.0%20%28stable%29/
+sha1  d302cb0bf23536e67a1b5505d01486a335d9c4c0  privoxy-4.0.0-stable-src.tar.gz
 # Locally computed
-sha256  e6ccbca1656f4e616b4657f8514e33a70f6697e9d7294356577839322a3c5d2c  privoxy-3.0.34-stable-src.tar.gz
+sha256  c08e2ba0049307017bf9d8a63dd2a0dfb96aa0cdeb34ae007776e63eba62a26f  privoxy-4.0.0-stable-src.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
index e1353ef0c7..64e8fb24db 100644
--- a/package/privoxy/privoxy.mk
+++ b/package/privoxy/privoxy.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PRIVOXY_VERSION = 3.0.34
+PRIVOXY_VERSION = 4.0.0
 PRIVOXY_SITE = https://downloads.sourceforge.net/project/ijbswa/Sources/$(PRIVOXY_VERSION)%20%28stable%29
 PRIVOXY_SOURCE = privoxy-$(PRIVOXY_VERSION)-stable-src.tar.gz
 # configure not shipped
 PRIVOXY_AUTORECONF = YES
-PRIVOXY_DEPENDENCIES = pcre zlib
+PRIVOXY_DEPENDENCIES = $(if $(BR2_PACKAGE_PCRE2),pcre2,pcre) zlib
 PRIVOXY_LICENSE = GPL-2.0+
 PRIVOXY_LICENSE_FILES = LICENSE
 PRIVOXY_CPE_ID_VENDOR = privoxy
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
