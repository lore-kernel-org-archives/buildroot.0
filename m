Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A51BCD98DE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 10:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF8C440B68;
	Mon, 15 Jun 2026 10:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wB3Yqnz8ga6E; Mon, 15 Jun 2026 10:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85A8E40B79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781517994;
	bh=mgEeF4HYbgEyoQcjxSAJqOfHgwV+Zq12hvyq1IxU7tg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=dvzEYR1iV9Mwow7lh+nRmsAfsCNxWKIQ5Vi1fcw96AzIJxj28eSgoUz5G1qhK0glc
	 PmwHf7BJtKyKfKB/wdx0yGgvW5O/tThW7wc062BaPXD2koPsqWeo6I8GziGQXhdfKz
	 XJ2/FpcWAKKhWbcuxD0wLbh6qiJAHyHL/OAQqsM+wleAWBW3n39/BHZz/11G/5PuYJ
	 7Lmpl1ennqXApJf1rp4mkA/EAo+7vLzw9maUnH0uUleO7+XF1mwu6LD+lrI0Q3tAZx
	 rdM6mXl9D/5khMlqfZ8svC8FoU2xZHpNJJhapQKIMu8CFIWR8ev/ru1IXYu2uXQ/e4
	 Up7Dh000v7LUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85A8E40B79;
	Mon, 15 Jun 2026 10:06:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 528F8DE
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 10:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38AA24012B
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 10:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTSP1envhnwP for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 10:06:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9927E400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9927E400FE
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9927E400FE
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 10:06:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 09B471814BE; Mon, 15 Jun 2026 12:06:27 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 12:06:16 +0200
Message-ID: <20260615100619.1061672-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1781517988; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=NH8VNRuTgBv2g+S8bbFGTWEO9Gkez0M4LfuuPYae+ok=;
 b=sGTAorH4OOzt/+skhzXOj/RBMuqaOKMEjVGKEYNmSvrvCgMCkRkdEqB2ivqQ1LCHR7LLRM
 1YcgM8Ik7MFRYKArqFVuYSIaSGBsea3YZxdVx4ryh0GNxYzEcMsf/jIvqOzAQWZ0x4TyUj
 xsYnwf4yTvy0UU3+WtmKsONlgQCPFMA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=sGTAorH4
Subject: [Buildroot] [PATCH] package/bluez5_utils{,
 -headers}: bump to version 5.86
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- plugins sap and health have been removed
- headers moved to bluetooth subfolder
- drop upstreamed patches

Changelog:
https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/ChangeLog?h=5.86

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 Config.in.legacy                              |  12 ++
 .../bluez5_utils-headers.mk                   |   4 +-
 ...0001-gdbus-define-MAX_INPUT-for-musl.patch |  33 -----
 ...eave-config-files-writable-for-owner.patch |  35 -----
 ...03-input-fix-HID-compilation-w-o-HoG.patch | 140 ------------------
 ...04-input-fix-HoG-compilation-w-o-HID.patch | 120 ---------------
 package/bluez5_utils/Config.in                |  10 --
 package/bluez5_utils/bluez5_utils.hash        |   2 +-
 package/bluez5_utils/bluez5_utils.mk          |  16 +-
 9 files changed, 16 insertions(+), 356 deletions(-)
 delete mode 100644 package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch
 delete mode 100644 package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch
 delete mode 100644 package/bluez5_utils/0003-input-fix-HID-compilation-w-o-HoG.patch
 delete mode 100644 package/bluez5_utils/0004-input-fix-HoG-compilation-w-o-HID.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index ee2e34822b..b8a95fd812 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,18 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
+config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP
+	bool "bluez sap plugin removed"
+	select BR2_LEGACY
+	help
+	  Build plugin for SAP profile.
+
+config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
+	bool "bluez health plugin removed"
+	select BR2_LEGACY
+	help
+	  Build plugin for health profiles.
+
 config BR2_GCC_VERSION_13_X
 	bool "gcc 13.x support removed"
 	select BR2_LEGACY
diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index 7acf62b226..71027b45ba 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.79
+BLUEZ5_UTILS_HEADERS_VERSION = 5.86
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
@@ -19,7 +19,7 @@ BLUEZ5_UTILS_HEADERS_INSTALL_TARGET = NO
 
 define BLUEZ5_UTILS_HEADERS_INSTALL_STAGING_CMDS
 	$(INSTALL) -d $(STAGING_DIR)/usr/include/bluetooth/
-	$(INSTALL) -m 644 $(@D)/lib/*.h $(STAGING_DIR)/usr/include/bluetooth/
+	$(INSTALL) -m 644 $(@D)/lib/bluetooth/*.h $(STAGING_DIR)/usr/include/bluetooth/
 endef
 
 $(eval $(generic-package))
diff --git a/package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch b/package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch
deleted file mode 100644
index dc823e9277..0000000000
--- a/package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 9d69dba21f1e46b34cdd8ae27fec11d0803907ee Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
-Date: Sat, 2 Nov 2024 16:10:18 +0000
-Subject: [PATCH] gdbus: define MAX_INPUT for musl
-
-This is the same solution as was done in src/shared/util.c
-
-Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9d69dba21f1e46b34cdd8ae27fec11d0803907ee
-Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
----
- gdbus/object.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/gdbus/object.c b/gdbus/object.c
-index 84f116bf1..7b0476f1a 100644
---- a/gdbus/object.c
-+++ b/gdbus/object.c
-@@ -20,6 +20,12 @@
- #include <dbus/dbus.h>
- 
- #include "gdbus.h"
-+
-+/* define MAX_INPUT for musl */
-+#ifndef MAX_INPUT
-+#define MAX_INPUT _POSIX_MAX_INPUT
-+#endif
-+
- #include "src/shared/util.h"
- 
- #define info(fmt...)
--- 
-2.45.2
-
diff --git a/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch b/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch
deleted file mode 100644
index 09ebe5edf1..0000000000
--- a/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From b1fd409960001a77cda2a09ecc00147ebd9c3667 Mon Sep 17 00:00:00 2001
-From: Fiona Klute <fiona.klute@gmx.de>
-Date: Mon, 9 Dec 2024 16:40:43 +0100
-Subject: [PATCH BlueZ] build: Leave config files writable for owner
-
-This is needed for builds running as non-root users, so the build
-process and any distribution tools can create/move/delete files in the
-config directory without adjusting permissions separately. Limiting
-writes from the running service needs to be done in the systemd unit
-(already the case) or init script.
-
-See also: https://lore.kernel.org/linux-bluetooth/4d1206df-598b-4a68-8655-74981b62ecca@gmx.de/T/
-Reviewed-by: Bastien Nocera <hadess@hadess.net>
-Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=b1fd409960001a77cda2a09ecc00147ebd9c3667
-Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 297d0774c..29018a91c 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -32,7 +32,7 @@ confdir = $(sysconfdir)/bluetooth
- statedir = $(localstatedir)/lib/bluetooth
- 
- bluetoothd-fix-permissions:
--	install -dm555 $(DESTDIR)$(confdir)
-+	install -dm755 $(DESTDIR)$(confdir)
- 	install -dm700 $(DESTDIR)$(statedir)
- 
- if DATAFILES
--- 
-2.45.2
-
diff --git a/package/bluez5_utils/0003-input-fix-HID-compilation-w-o-HoG.patch b/package/bluez5_utils/0003-input-fix-HID-compilation-w-o-HoG.patch
deleted file mode 100644
index 941e9fb68f..0000000000
--- a/package/bluez5_utils/0003-input-fix-HID-compilation-w-o-HoG.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-From b111b5e15eb74e08b74cb3c7e91bcb21f54be4c7 Mon Sep 17 00:00:00 2001
-From: Thomas Perale <thomas.perale@mind.be>
-Date: Thu, 1 May 2025 18:35:35 +0200
-Subject: input: fix HID compilation w/o HoG
-
-Commit [1] introduced a dependency with the HID plugin in the HoG code
-As a result, building with --enable-hid --disable-hog caused linker
-errors due to undefined references to HoG-related functions:
-
-```
-> ./configure --enable-hid --disable-hog
-...
-> make
-...
-  CCLD     src/bluetoothd
-/usr/bin/ld: profiles/input/bluetoothd-manager.o: in function `input_init':
-/home/../bluez/profiles/input/manager.c:122:(.text.input_init+0x1c8): undefined reference to `input_set_auto_sec'
-collect2: error: ld returned 1 exit status
-make[1]: *** [Makefile:6376: src/bluetoothd] Error 1
-```
-
-This patch moves the reading of the HOG specific configuration of the
-'input.conf' file: LEAutoSecurity, to the HoG plugin file.
-
-[1] f2778f587 input: Add LEAutoSecurity setting to input.conf
-
-Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=b111b5e15eb74e08b74cb3c7e91bcb21f54be4c7
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- profiles/input/device.h  |  1 -
- profiles/input/hog.c     | 40 +++++++++++++++++++++++++++++++++++-----
- profiles/input/manager.c | 11 +----------
- 3 files changed, 36 insertions(+), 16 deletions(-)
-
-diff --git a/profiles/input/device.h b/profiles/input/device.h
-index 7b87ce5903..036a88980e 100644
---- a/profiles/input/device.h
-+++ b/profiles/input/device.h
-@@ -25,7 +25,6 @@ void input_set_userspace_hid(char *state);
- uint8_t input_get_userspace_hid(void);
- void input_set_classic_bonded_only(bool state);
- bool input_get_classic_bonded_only(void);
--void input_set_auto_sec(bool state);
- 
- int input_device_register(struct btd_service *service);
- void input_device_unregister(struct btd_service *service);
-diff --git a/profiles/input/hog.c b/profiles/input/hog.c
-index 017e320f07..f82648fec8 100644
---- a/profiles/input/hog.c
-+++ b/profiles/input/hog.c
-@@ -57,11 +57,6 @@ static gboolean suspend_supported = FALSE;
- static bool auto_sec = true;
- static struct queue *devices = NULL;
- 
--void input_set_auto_sec(bool state)
--{
--	auto_sec = state;
--}
--
- static void hog_device_accept(struct hog_device *dev, struct gatt_db *db)
- {
- 	char name[248];
-@@ -228,10 +223,45 @@ static struct btd_profile hog_profile = {
- 	.auto_connect	= true,
- };
- 
-+static void hog_read_config(void)
-+{
-+	const char filename[] = CONFIGDIR "/input.conf";
-+	GKeyFile *config;
-+	GError *err = NULL;
-+	bool config_auto_sec;
-+
-+	config = g_key_file_new();
-+	if (!config) {
-+		error("Failed to allocate memory for config");
-+		return;
-+	}
-+
-+	if (!g_key_file_load_from_file(config, filename, 0, &err)) {
-+		if (!g_error_matches(err, G_FILE_ERROR, G_FILE_ERROR_NOENT))
-+			error("Parsing %s failed: %s", filename, err->message);
-+		g_error_free(err);
-+		g_key_file_free(config);
-+		return;
-+	}
-+
-+	config_auto_sec = g_key_file_get_boolean(config, "General",
-+					"LEAutoSecurity", &err);
-+	if (!err) {
-+		DBG("input.conf: LEAutoSecurity=%s",
-+				config_auto_sec ? "true" : "false");
-+		auto_sec = config_auto_sec;
-+	} else
-+		g_clear_error(&err);
-+
-+	g_key_file_free(config);
-+}
-+
- static int hog_init(void)
- {
- 	int err;
- 
-+	hog_read_config();
-+
- 	err = suspend_init(suspend_callback, resume_callback);
- 	if (err < 0)
- 		error("Loading suspend plugin failed: %s (%d)", strerror(-err),
-diff --git a/profiles/input/manager.c b/profiles/input/manager.c
-index 95ca0a7ee5..1c0b6122a1 100644
---- a/profiles/input/manager.c
-+++ b/profiles/input/manager.c
-@@ -85,7 +85,7 @@ static int input_init(void)
- 	config = load_config_file(CONFIGDIR "/input.conf");
- 	if (config) {
- 		int idle_timeout;
--		gboolean classic_bonded_only, auto_sec;
-+		gboolean classic_bonded_only;
- 		char *uhid_enabled;
- 
- 		idle_timeout = g_key_file_get_integer(config, "General",
-@@ -115,15 +115,6 @@ static int input_init(void)
- 		} else
- 			g_clear_error(&err);
- 
--		auto_sec = g_key_file_get_boolean(config, "General",
--						"LEAutoSecurity", &err);
--		if (!err) {
--			DBG("input.conf: LEAutoSecurity=%s",
--					auto_sec ? "true" : "false");
--			input_set_auto_sec(auto_sec);
--		} else
--			g_clear_error(&err);
--
- 	}
- 
- 	btd_profile_register(&input_profile);
--- 
-cgit 1.2.3-korg
-
diff --git a/package/bluez5_utils/0004-input-fix-HoG-compilation-w-o-HID.patch b/package/bluez5_utils/0004-input-fix-HoG-compilation-w-o-HID.patch
deleted file mode 100644
index b2824e5e18..0000000000
--- a/package/bluez5_utils/0004-input-fix-HoG-compilation-w-o-HID.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From 9c52188d753002a6afd6ae145f921a2ff52c1c81 Mon Sep 17 00:00:00 2001
-From: Thomas Perale <thomas.perale@mind.be>
-Date: Thu, 1 May 2025 18:35:36 +0200
-Subject: input: fix HoG compilation w/o HID
-
-Commit [1] introduced a dependency with the HID plugin in the HoG code
-As a result, building with --disable-hid --enable-hog caused linker
-errors due to undefined references to HID-related functions:
-
-```
-> ./configure --disable-hid --enable-hog
-> make
-/usr/bin/ld: profiles/input/bluetoothd-hog.o: in function `hog_accept':
-/home/../bluez/profiles/input/hog.c:184:(.text.hog_accept+0xbb): undefined reference to `input_get_auto_sec'
-/usr/bin/ld: profiles/input/bluetoothd-hog.o: in function `hog_disconnect':
-/home/../bluez/profiles/input/hog.c:205:(.text.hog_disconnect+0x12): undefined reference to `input_get_userspace_hid'
-collect2: error: ld returned 1 exit status
-make[1]: *** [Makefile:6344: src/bluetoothd] Error 1
-make: *** [Makefile:4695: all] Error 2
-```
-
-This patch duplicate the read of the 'UserspaceHID=persist' config entry
-in the HoG plugin file to remove the dependency on the HID plugin files.
-
-[1] 1782bfd79 input: Add support for UserspaceHID=persist
-
-Fixes: https://github.com/bluez/bluez/issues/1228
-
-Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9c52188d753002a6afd6ae145f921a2ff52c1c81
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- profiles/input/device.c |  5 -----
- profiles/input/device.h |  1 -
- profiles/input/hog.c    | 14 ++++++++++++--
- 3 files changed, 12 insertions(+), 8 deletions(-)
-
-diff --git a/profiles/input/device.c b/profiles/input/device.c
-index a7bc4d44fa..3642cc3267 100644
---- a/profiles/input/device.c
-+++ b/profiles/input/device.c
-@@ -112,11 +112,6 @@ void input_set_userspace_hid(char *state)
- 		error("Unknown value '%s'", state);
- }
- 
--uint8_t input_get_userspace_hid(void)
--{
--	return uhid_state;
--}
--
- void input_set_classic_bonded_only(bool state)
- {
- 	classic_bonded_only = state;
-diff --git a/profiles/input/device.h b/profiles/input/device.h
-index 036a88980e..9056695026 100644
---- a/profiles/input/device.h
-+++ b/profiles/input/device.h
-@@ -22,7 +22,6 @@ struct input_conn;
- 
- void input_set_idle_timeout(int timeout);
- void input_set_userspace_hid(char *state);
--uint8_t input_get_userspace_hid(void);
- void input_set_classic_bonded_only(bool state);
- bool input_get_classic_bonded_only(void);
- 
-diff --git a/profiles/input/hog.c b/profiles/input/hog.c
-index f82648fec8..a3c876cf9f 100644
---- a/profiles/input/hog.c
-+++ b/profiles/input/hog.c
-@@ -40,7 +40,6 @@
- #include "src/shared/gatt-client.h"
- #include "src/plugin.h"
- 
--#include "device.h"
- #include "suspend.h"
- #include "attrib/att.h"
- #include "attrib/gattrib.h"
-@@ -55,6 +54,7 @@ struct hog_device {
- 
- static gboolean suspend_supported = FALSE;
- static bool auto_sec = true;
-+static bool uhid_state_persist = false;
- static struct queue *devices = NULL;
- 
- static void hog_device_accept(struct hog_device *dev, struct gatt_db *db)
-@@ -203,7 +203,7 @@ static int hog_disconnect(struct btd_service *service)
- {
- 	struct hog_device *dev = btd_service_get_user_data(service);
- 
--	if (input_get_userspace_hid() == UHID_PERSIST)
-+	if (uhid_state_persist)
- 		bt_hog_detach(dev->hog, false);
- 	else
- 		bt_hog_detach(dev->hog, true);
-@@ -229,6 +229,7 @@ static void hog_read_config(void)
- 	GKeyFile *config;
- 	GError *err = NULL;
- 	bool config_auto_sec;
-+	char *uhid_enabled;
- 
- 	config = g_key_file_new();
- 	if (!config) {
-@@ -253,6 +254,15 @@ static void hog_read_config(void)
- 	} else
- 		g_clear_error(&err);
- 
-+	uhid_enabled = g_key_file_get_string(config, "General",
-+					"UserspaceHID", &err);
-+	if (!err) {
-+		DBG("input.conf: UserspaceHID=%s", uhid_enabled);
-+		uhid_state_persist = strcasecmp(uhid_enabled, "persist") == 0;
-+		free(uhid_enabled);
-+	} else
-+		g_clear_error(&err);
-+
- 	g_key_file_free(config);
- }
- 
--- 
-cgit 1.2.3-korg
-
diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 2fe25466b4..58c6213364 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -72,11 +72,6 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO
 	help
 	  Build plugins for audio profiles (for A2DP and AVRCP).
 
-config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
-	bool "build health plugin"
-	help
-	  Build plugin for health profiles.
-
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID
 	bool "build hid plugin"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
@@ -126,11 +121,6 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_NFC
 	help
 	  Build plugin for NFC pairing.
 
-config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP
-	bool "build sap plugin"
-	help
-	  Build plugin for SAP profile.
-
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SIXAXIS
 	bool "build sixaxis plugin"
 	depends on BR2_PACKAGE_HAS_UDEV
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 9b39b19c08..fdfb7edb3a 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  4164a5303a9f71c70f48c03ff60be34231b568d93a9ad5e79928d34e6aa0ea8a  bluez-5.79.tar.xz
+sha256  99f144540c6070591e4c53bcb977eb42664c62b7b36cb35a29cf72ded339621d  bluez-5.86.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index e3b47e1e80..38fe9a523f 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.79
+BLUEZ5_UTILS_VERSION = 5.86
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
@@ -86,13 +86,6 @@ BLUEZ5_UTILS_CONF_OPTS += \
 	--disable-vcp
 endif
 
-# enable health plugin
-ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH),y)
-BLUEZ5_UTILS_CONF_OPTS += --enable-health
-else
-BLUEZ5_UTILS_CONF_OPTS += --disable-health
-endif
-
 # enable hid plugin
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-hid
@@ -137,13 +130,6 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-nfc
 endif
 
-# enable sap plugin
-ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP),y)
-BLUEZ5_UTILS_CONF_OPTS += --enable-sap
-else
-BLUEZ5_UTILS_CONF_OPTS += --disable-sap
-endif
-
 # enable sixaxis plugin
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SIXAXIS),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-sixaxis
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
