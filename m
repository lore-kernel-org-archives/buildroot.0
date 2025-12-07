Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E8BD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F80B605A2;
	Sun,  7 Dec 2025 14:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x86RKofL1kET; Sun,  7 Dec 2025 14:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C99760755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118834;
	bh=OQq/S2Cwqi7PHXRMdysT595N1OQy3tGJvOAbpno+UaE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RDastMt973+TQi93fPA9CON2Cnnvb1/2HCYoriYTv27uCxkAUohLrGBWiGI001IQF
	 woPyT1wwR7hWXjRCnbPBbXD6pZB9J0+UNAUSuYzC0q+o3CQsVqa00+sYUv5yhl12uJ
	 2Jl7xPYNFzS3JDK/2f8lKoe44Z9L/JdoC5xh3tHY8NEbMtObOohCLDC+I+UJIoJToS
	 McAs/mT6hyEZKfHOPawEM+7KvlIQ/lEsB/B1scR6hzqL/z1jK4/nKNBW4k7DUCUkwb
	 QmeEF9HT61Wpwz9BbKbsipQ2u2Hv60kYtUgmavBIO/6lFs/U/QjeBpFIJneK8CRq1I
	 dhWC3sM5aqQqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C99760755;
	Sun,  7 Dec 2025 14:47:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6BAB151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CFAE60755
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vRZe8OiqvLp for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:47:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6542B605A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6542B605A2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6542B605A2
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:47:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 91EB0A4C0C38;
 Sun,  7 Dec 2025 15:42:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyH-00000000416-3dp5;
 Sun, 07 Dec 2025 14:42:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:32 +0100
Message-ID: <20251207144243.3696572-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ---
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118578;
 bh=vVOi4ng0xwXfue9wJDZ3N7zjfN3UqbjTFfm4mACnYMA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=vekjBSR6JSIhslhIgFTyqfc+jbze0Q7qjkjt7ceR0LS1vF/KFfUdSB6rU6ju2q46v
 Y4LPpeKYVXLNVeG3vgOdbWjxfEbNp2Gom0KSRt0PMPCdCUPe3vy3K1FiZPSj15v0c0
 6iHqj6K/HV6TCeJRc/vipvmXz9PizONd8wUduONKAyXnKW1hWRAAICYZt2W03HdaRL
 qGsC7BCpb4K88VRc1zV2QcikxYa0fN6qsf+ToBcM679luZ/osK6lWDNAuIvusMfqF2
 QFBXx1EgsRK05Kc8R3oxDRNjclYD/dY5o0kKPHT2WJjs75jwR9Lyr2vznwpbkK0NZi
 yE6mPJXD3Nklw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vekjBSR6
Subject: [Buildroot] [PATCH/next 23/33] package/linknx: bump version to
 0.0.1.39
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/linknx/linknx/compare/0.0.1.38...0.0.1.39

Removed patches which are included in this release.

Fixes:
https://autobuild.buildroot.net/results/492/492b46b997758bbe6b8ec8510e5b2e2bad2aa704/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  2 -
 ...nfigure-ac-tweak-CPPUNIT-conditional.patch | 47 -------------------
 ...Makefile.am-fix-linking-with-log4cpp.patch | 37 ---------------
 package/linknx/linknx.hash                    |  2 +-
 package/linknx/linknx.mk                      |  4 +-
 5 files changed, 2 insertions(+), 90 deletions(-)
 delete mode 100644 package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch
 delete mode 100644 package/linknx/0002-src-Makefile.am-fix-linking-with-log4cpp.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 98b87b8f75..3b3726bf04 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -615,8 +615,6 @@ package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch lib_patc
 package/libyuv/0001-i386-sse2.patch lib_patch.Upstream
 package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch lib_patch.Upstream
 package/lighttpd/S50lighttpd Shellcheck lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
-package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch lib_patch.Upstream
-package/linknx/0002-src-Makefile.am-fix-linking-with-log4cpp.patch lib_patch.Upstream
 package/linux-zigbee/0001-test-serial-Remove-test-serial.patch lib_patch.Upstream
 package/linux-zigbee/0002-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch lib_patch.Upstream
 package/linuxptp/S65ptp4l Shellcheck lib_sysv.Indent
diff --git a/package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch b/package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch
deleted file mode 100644
index 733e2927dd..0000000000
--- a/package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 8e7da14647dada5eee8f583b0814bffb31d1b91e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 21 Apr 2019 23:17:34 +0200
-Subject: [PATCH] configure.ac: tweak CPPUNIT conditional
-
-Following review of buildroot's patch
-(http://patchwork.ozlabs.org/patch/1088520), tweak CPPUNIT to move call
-to AM_CONDITIONAL outside condition
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/linknx/linknx/commit/8e7da14647dada5eee8f583b0814bffb31d1b91e]
----
- configure.ac | 10 ++++------
- 1 file changed, 4 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 51d8ae66..4d9d8efa 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -135,22 +135,20 @@ if test x"$WITH_CPPUNIT" != xno; then
-       AC_DEFINE([HAVE_CPPUNIT], [1], [cppunit])
-       AC_SUBST(CPPUNIT_CFLAGS)
-       AC_SUBST(CPPUNIT_LIBS)
--      AM_CONDITIONAL(CPPUNIT, true)
-+      found_cppunit=yes
-     ],[
-       AC_MSG_RESULT([no])
--      AM_CONDITIONAL(CPPUNIT, false)
-     ])
-   else
-     PKG_CHECK_MODULES(CPPUNIT, $CPPUNITPC >= 1.9.6, [
-       AC_DEFINE([HAVE_CPPUNIT], [1], [cppunit])
-       AC_SUBST(CPPUNIT_CFLAGS)
-       AC_SUBST(CPPUNIT_LIBS)
--      AM_CONDITIONAL([CPPUNIT], true)
--    ],[AM_CONDITIONAL([CPPUNIT], false)])
-+      found_cppunit=yes
-+    ])
-   fi
--else
--  AM_CONDITIONAL([CPPUNIT], false)
- fi
-+AM_CONDITIONAL([CPPUNIT], [test x"$found_cppunit" = xyes])
- 
- dnl #########################################################################
- dnl Check if using log4cpp
diff --git a/package/linknx/0002-src-Makefile.am-fix-linking-with-log4cpp.patch b/package/linknx/0002-src-Makefile.am-fix-linking-with-log4cpp.patch
deleted file mode 100644
index 4f1a8e4356..0000000000
--- a/package/linknx/0002-src-Makefile.am-fix-linking-with-log4cpp.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 048b9ae8f3c07be217f1738c35ab995ab6394453 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 8 Mar 2020 10:02:07 +0100
-Subject: [PATCH] src/Makefile.am: fix linking with log4cpp
-
-linknx fails to build with log4cpp because LOG4CPP_CFLAGS (which
-contains -pthread) is added to AM_CPPFLAGS (which is not used at link
-time) instead of AM_CXXFLAGS:
-
-/home/buildroot/autobuild/instance-0/output/host/bin/mipsel-linux-g++  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os     -o linknx linknx.o logger.o ruleserver.o objectcontroller.o eibclient.o threads.o timermanager.o persistentstorage.o xmlserver.o smsgateway.o emailgateway.o knxconnection.o services.o suncalc.o luacondition.o ioport.o ../ticpp/libticpp.a  -L/home/buildroot/autobuild/instance-0/output/host/mipsel-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib -lpthsem  -L/home/buildroot/autobuild/instance-0/output/host/bin/../mipsel-buildroot-linux-gnu/sysroot/usr/lib -llog4cpp     -lm
-/home/buildroot/autobuild/instance-0/output/host/mipsel-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib/liblog4cpp.so: undefined reference to `pthread_key_create'
-
-So move LOG4CPP_CFLAGS to AM_CXXFLAGS
-
-Fixes:
- - http://autobuild.buildroot.org/results/1863f8f27041bc15ca68e786ba3b8e4764c40574
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/linknx/linknx/commit/048b9ae8f3c07be217f1738c35ab995ab6394453]
----
- src/Makefile.am | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 6e0dc03b..5065c248 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -6,6 +6,7 @@ else
- B64_CFLAGS=
- B64_LIBS=
- endif
--AM_CPPFLAGS=-I$(top_srcdir)/include -I$(top_srcdir)/ticpp $(B64_CFLAGS) $(PTH_CPPFLAGS) $(LIBCURL_CPPFLAGS) $(LOG4CPP_CFLAGS) $(LUA_CFLAGS) $(MYSQL_CFLAGS) $(ESMTP_CFLAGS)
-+AM_CPPFLAGS=-I$(top_srcdir)/include -I$(top_srcdir)/ticpp $(B64_CFLAGS) $(PTH_CPPFLAGS) $(LIBCURL_CPPFLAGS) $(LUA_CFLAGS) $(MYSQL_CFLAGS) $(ESMTP_CFLAGS)
-+AM_CXXFLAGS=$(LOG4CPP_CFLAGS)
- linknx_LDADD=$(top_srcdir)/ticpp/libticpp.a $(LIBICONV) $(B64_LIBS) $(PTH_LDFLAGS) $(PTH_LIBS) $(LIBCURL) $(LOG4CPP_LIBS) $(LUA_LIBS) $(MYSQL_LIBS) $(ESMTP_LIBS) -lm
- linknx_SOURCES=linknx.cpp logger.cpp ruleserver.cpp objectcontroller.cpp eibclient.c threads.cpp timermanager.cpp  persistentstorage.cpp xmlserver.cpp smsgateway.cpp emailgateway.cpp knxconnection.cpp services.cpp suncalc.cpp  luacondition.cpp ioport.cpp ruleserver.h objectcontroller.h threads.h timermanager.h persistentstorage.h xmlserver.h smsgateway.h emailgateway.h knxconnection.h services.h suncalc.h luacondition.h ioport.h logger.h
diff --git a/package/linknx/linknx.hash b/package/linknx/linknx.hash
index 86ec522809..d12d4aa8f2 100644
--- a/package/linknx/linknx.hash
+++ b/package/linknx/linknx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  00c53776c2e871295459ede922402d8ad0208367d2364781fdb92ddafad94d3d  linknx-0.0.1.38.tar.gz
+sha256  d07199875c6e3f90871308989dd7d4240b67ce971d5908cb39592690341f8d0a  linknx-0.0.1.39.tar.gz
 sha256  c03cea027b4b40e4402fabd08557736727ec3d5bc54ad64ab6472de432198cad  LICENSE
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index 683e0c49cb..d67f010093 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-LINKNX_VERSION = 0.0.1.38
+LINKNX_VERSION = 0.0.1.39
 LINKNX_SITE = $(call github,linknx,linknx,$(LINKNX_VERSION))
 LINKNX_LICENSE = GPL-2.0+
 LINKNX_LICENSE_FILES = LICENSE
 LINKNX_INSTALL_STAGING = YES
-# We're patching configure.ac
-LINKNX_AUTORECONF = YES
 LINKNX_CONF_OPTS = \
 	--without-cppunit \
 	--without-pth-test \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
