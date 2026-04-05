Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9175FE64019
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 11:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AC0F81253;
	Sun,  5 Apr 2026 11:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTRqlmGC4oMb; Sun,  5 Apr 2026 11:54:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6838881258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775390052;
	bh=1ivNt1SrQhDRdmRBEGUT676+W/CNrCePgOo8izSuJ7w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o0QfSN8n9N8sG3xk5J5CIlNcdFTlJ+zReT67NdeIU9V/A9+6ieqZwVnUbv0IrOa8/
	 XqTkOVsnZG6Pqy+8YvSMESPTiZvcGgtAER5yrwgFnqVCpfXX6npW77xUS4DWZJltgB
	 BHOLyt1iocbvuuxcOIzCNUe2iSWbSB3N0kFHRZK2uEIa+FV7xiKTMyHjl9xf3Yxh1I
	 oEv8aT1s4kijMMcLEYA9BnYZ8S4mKK6KzxjC5YoFFLxwQoSkrg4ILxikLN+hSjvnK4
	 /cXaFhu6xVvKHUTlbRxkp2B/pZn4PncabdFBAKQXZFPM8fbvdkujVY1LKmtee2GcUJ
	 UDC7fVwfwn1gQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6838881258;
	Sun,  5 Apr 2026 11:54:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC0402EF
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 11:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E3F360C09
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 11:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ngLV0VYmgxl for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 11:54:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6DE1A60BD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DE1A60BD9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DE1A60BD9
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 11:54:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 14A91A4C3823;
 Sun,  5 Apr 2026 13:53:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35810)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9M37-000000003vI-2xZM;
 Sun, 05 Apr 2026 11:53:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  5 Apr 2026 13:53:52 +0200
Message-ID: <20260405115353.2468900-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260405115353.2468900-1-bernd@kuhls.net>
References: <20260405115353.2468900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775390034;
 bh=/Vr4094UxsjQSP4kB+8HIIgnoVAfxQwkKbTL4tTSLWM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=AtPqQUvkRd9hZopt/nitNRBMWb0QQd/04FfU5z7RETSe+vcOZ1SzjdxM+GUP38ZOM
 IsLhNRMl6jRGkqzuAxu2/1DLypo4SfNtSmn+KlgRmTDK3cjbLlnxFzcfbUR0lGDRdS
 LD+i48UEv25jdv7VxfI3PJOtZSUfTI0dLu0GDZKb/cfgsCf2CFQQCQ+KUfP07aFsTp
 8CFTHDFhDiclUTkbYCduP842TSusPitMS2BYsALH0XMrNOiI7jCpBx07xHyshQuRCp
 EHSoF02p4nZDPpDC95hODzePv4zH7IN87tlboFZ6hoXI17/8VgLV9u56tOFPTdvNk/
 PehnzwhfuluBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=AtPqQUvk
Subject: [Buildroot] [PATCH 2/3] package/zix: new package
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

Needed for the upcoming bump of sord from 0.16.12 to 0.16.22:
https://gitlab.com/drobilla/sord/-/commit/ec186c111b2079aa2bb52f44b01b874e46ba4577

Build-tested using this defconfig:

BR2_PACKAGE_ZIX=y

                             arm-aarch64 [ 1/32]: OK
                   bootlin-aarch64-glibc [ 2/32]: OK
               bootlin-aarch64-glibc-old [ 3/32]: OK
               bootlin-arcle-hs38-uclibc [ 4/32]: OK
                    bootlin-armv5-uclibc [ 5/32]: OK
                     bootlin-armv7-glibc [ 6/32]: OK
                   bootlin-armv7m-uclibc [ 7/32]: OK
                      bootlin-armv7-musl [ 8/32]: OK
                bootlin-m68k-5208-uclibc [ 9/32]: OK
               bootlin-m68k-68040-uclibc [10/32]: OK
             bootlin-microblazeel-uclibc [11/32]: OK
                  bootlin-mips64el-glibc [12/32]: OK
                bootlin-mipsel32r6-glibc [13/32]: OK
                   bootlin-mipsel-uclibc [14/32]: OK
                 bootlin-openrisc-uclibc [15/32]: OK
        bootlin-powerpc64le-power8-glibc [16/32]: OK
           bootlin-powerpc-e500mc-uclibc [17/32]: OK
                   bootlin-riscv32-glibc [18/32]: OK
                   bootlin-riscv64-glibc [19/32]: OK
                    bootlin-riscv64-musl [20/32]: OK
                 bootlin-s390x-z13-glibc [21/32]: OK
                      bootlin-sh4-uclibc [22/32]: OK
                   bootlin-sparc64-glibc [23/32]: OK
                    bootlin-sparc-uclibc [24/32]: OK
                    bootlin-x86-64-glibc [25/32]: OK
                     bootlin-x86-64-musl [26/32]: OK
                   bootlin-x86-64-uclibc [27/32]: OK
                   bootlin-x86-i686-musl [28/32]: OK
                   bootlin-xtensa-uclibc [29/32]: OK
                            br-arm-basic [30/32]: OK
                    br-arm-full-nothread [31/32]: OK
                      br-arm-full-static [32/32]: OK

32 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/zix/Config.in |  6 ++++++
 package/zix/zix.hash  |  4 ++++
 package/zix/zix.mk    | 22 ++++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/zix/Config.in
 create mode 100644 package/zix/zix.hash
 create mode 100644 package/zix/zix.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f9ad3e62a8..e1b5f9334d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -538,6 +538,7 @@ F:	package/x264/
 F:	package/x265/
 F:	package/xmrig/
 F:	package/ytree/
+F:	package/zix/
 F:	package/znc/
 F:	support/testing/tests/package/test_perl_html_parser.py
 
diff --git a/package/Config.in b/package/Config.in
index 83b5c4bf92..d00d1eb52a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1915,6 +1915,7 @@ menu "JSON/XML"
 	source "package/xml-security-c/Config.in"
 	source "package/yajl/Config.in"
 	source "package/yaml-cpp/Config.in"
+	source "package/zix/Config.in"
 endmenu
 
 menu "Logging"
diff --git a/package/zix/Config.in b/package/zix/Config.in
new file mode 100644
index 0000000000..35e3a398fb
--- /dev/null
+++ b/package/zix/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ZIX
+	bool "zix"
+	help
+	  A lightweight C library for reading and writing RDF
+
+	  https://gitlab.com/drobilla/zix
diff --git a/package/zix/zix.hash b/package/zix/zix.hash
new file mode 100644
index 0000000000..3472f5de71
--- /dev/null
+++ b/package/zix/zix.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking signature
+# https://download.drobilla.net/zix-0.8.0.tar.xz.sig
+sha256  e9b6fe3ede984fa53f2edcebdabb35fb99ace807722772156aea49c079cad191  zix-0.8.0.tar.xz
+sha256  1314cc14fb947491491c517c533ac7de4f6798585f922a472358082c25ac1881  COPYING
diff --git a/package/zix/zix.mk b/package/zix/zix.mk
new file mode 100644
index 0000000000..e4d89b5104
--- /dev/null
+++ b/package/zix/zix.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# zix
+#
+################################################################################
+
+ZIX_VERSION = 0.8.0
+ZIX_SITE = https://download.drobilla.net
+ZIX_SOURCE = zix-$(ZIX_VERSION).tar.xz
+ZIX_LICENSE = ISC
+ZIX_LICENSE_FILES = COPYING
+ZIX_INSTALL_STAGING = YES
+
+ZIX_CONF_OPTS += -Dbenchmarks=disabled -Ddocs=disabled -Dtests=disabled
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ZIX_CONF_OPTS += -Dthreads=enabled
+else
+ZIX_CONF_OPTS += -Dthreads=disabled
+endif
+
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
