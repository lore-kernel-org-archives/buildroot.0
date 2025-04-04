Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85889C36010
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 16:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14DDA60D93;
	Fri,  4 Apr 2025 16:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLgPGVh8YDGd; Fri,  4 Apr 2025 16:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F214260B3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F214260B3F;
	Fri,  4 Apr 2025 16:55:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48A45117
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EEBC812EF
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLeb0zDDRa3J for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 16:55:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.25.9;
 helo=smtp-1909.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2DE82812ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DE82812ED
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch
 [185.125.25.9])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DE82812ED
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:55:11 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10:40ca:feff:fe05:1])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZTl0X4V9hzxhl;
 Fri,  4 Apr 2025 18:48:12 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZTl0X0vnWzlFp; Fri,  4 Apr 2025 18:48:12 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Fri, 04 Apr 2025 18:47:39 +0200
MIME-Version: 1.0
Message-Id: <20250404-libcamera-0-5-0-v1-8-e2ca9d029aeb@cherry.de>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
In-Reply-To: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 8/9] package/libpisp: add new package
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

From: Quentin Schulz <quentin.schulz@cherry.de>

A helper library to generate run-time configuration for the Raspberry Pi
ISP (PiSP), consisting of the Frontend and Backend hardware components.

This PiSP is found on the Raspberry Pi 5.

This will be a dependency of the PiSP pipeline in libcamera in a future
commit.

https://github.com/raspberrypi/libpisp

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/Config.in            |  1 +
 package/libpisp/Config.in    | 22 ++++++++++++++++++++++
 package/libpisp/libpisp.hash | 11 +++++++++++
 package/libpisp/libpisp.mk   | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 67 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 291e784f269c90d4b88fdebeba8f4add101c113a..d704e9d6b099e1832fbe574c571be6106c93b700 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1987,6 +1987,7 @@ menu "Multimedia"
 	source "package/libopenaptx/Config.in"
 	source "package/libopenh264/Config.in"
 	source "package/libopusenc/Config.in"
+	source "package/libpisp/Config.in"
 	source "package/libtheora/Config.in"
 	source "package/libudfread/Config.in"
 	source "package/libvpx/Config.in"
diff --git a/package/libpisp/Config.in b/package/libpisp/Config.in
new file mode 100644
index 0000000000000000000000000000000000000000..8586c31f42914a219538e04fe93b62de38e0daab
--- /dev/null
+++ b/package/libpisp/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_LIBPISP
+	bool "libpisp"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_JSON_FOR_MODERN_CPP
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 # V4L2_BUF_TYPE_META_OUTPUT
+	help
+	  A helper library to generate run-time configuration for the
+	  Raspberry Pi ISP (PiSP), consisting of the Frontend and
+	  Backend hardware components.
+
+	  https://github.com/raspberrypi/libpisp
+
+if BR2_PACKAGE_LIBPISP
+
+config BR2_PACKAGE_LIBPISP_LOGGING
+	bool "enable logging"
+	depends on BR2_PACKAGE_BOOST_LOG
+	help
+	  Enable logging
+endif
diff --git a/package/libpisp/libpisp.hash b/package/libpisp/libpisp.hash
new file mode 100644
index 0000000000000000000000000000000000000000..3ec1628651cb17c96625b519901d4e156816e4dc
--- /dev/null
+++ b/package/libpisp/libpisp.hash
@@ -0,0 +1,11 @@
+# Locally computed
+sha256  13862de722511f202ea204644504ca5e6bd616b6a463932e7bc114767a68224d  libpisp-1.2.0.tar.xz
+
+# license files
+sha256  8e68f95d973a272ea3da17d6542ba3991cc012f55ff1263af1e5b24d849c11a2  LICENSE
+sha256  8e68f95d973a272ea3da17d6542ba3991cc012f55ff1263af1e5b24d849c11a2  LICENSES/BSD-2-Clause.txt
+sha256  6a573fb2f9082662978cf21fb153096df0a1981deaea7dbc10a11046fe005d9f  LICENSES/CC0-1.0.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  606aa26338f69ce178f1cbc648b7574aec4b5bbaeb20f4df36ff49010cb8fbbd  LICENSES/GPL-2.0-or-later.txt
+sha256  e5bcf7b9fdd1313047e4edb2160d5bcb928e211b4ed311b8c543e70764739945  LICENSES/Linux-syscall-note.txt
+sha256  364ad36bdcd4c01dbd8c230a07ae6e8bdee7b4418a7d16c42205d3f2b6fceefd  LICENSES/MIT.txt
diff --git a/package/libpisp/libpisp.mk b/package/libpisp/libpisp.mk
new file mode 100644
index 0000000000000000000000000000000000000000..66a44c0d14c52bf64cecd8eea77b7c3237a815a4
--- /dev/null
+++ b/package/libpisp/libpisp.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# libpisp
+#
+################################################################################
+
+LIBPISP_VERSION = 1.2.0
+# The manually generated tarball has version.gen in it which is required for
+# version detection outside of git repos
+LIBPISP_SITE = https://github.com/raspberrypi/libpisp/releases/download/v$(LIBPISP_VERSION)
+LIBPISP_SOURCE = libpisp-$(LIBPISP_VERSION).tar.xz
+LIBPISP_LICENSE = BSD-2-Clause
+LIBPISP_LICENSE_FILES = \
+	LICENSE \
+	LICENSES/BSD-2-Clause.txt \
+	LICENSES/CC0-1.0.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-2.0-or-later.txt \
+	LICENSES/Linux-syscall-note.txt \
+	LICENSES/MIT.txt
+LIBPISP_CONF_OPTS = \
+	-Dauto_features=disabled
+LIBPISP_INSTALL_STAGING = YES
+LIBPISP_DEPENDENCIES = \
+	host-pkgconf \
+	json-for-modern-cpp
+
+ifeq ($(BR2_PACKAGE_LIBPISP_LOGGING),y)
+LIBPISP_CONF_OPTS += -Dlogging=enabled
+LIBPISP_DEPENDENCIES += boost
+endif
+
+$(eval $(meson-package))

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
