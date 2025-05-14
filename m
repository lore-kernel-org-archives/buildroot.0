Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEA4C3ABDD
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 16:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 262D6605C9;
	Wed, 14 May 2025 16:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLrvQMcbo4dI; Wed, 14 May 2025 16:39:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1740A60739
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1740A60739;
	Wed, 14 May 2025 16:39:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C4DAA153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B58C540E1A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEbHzhWqef42 for <buildroot@buildroot.org>;
 Wed, 14 May 2025 16:38:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 60A7E40E1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60A7E40E1E
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60A7E40E1E
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:38:57 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a1fa0d8884so3486943f8f.3
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747240736; x=1747845536;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Htm4+x3x9vihtHauXONp8rieUF58wphV9yAODmQtiQg=;
 b=opTfLsgYzsKFAVIMwtdoyKQfhyJTEVSkpwwEClB5CWiqmDJJOSidD7aNAyUzmw5zeX
 RUOciTt7mUYLJ08EyUC4ejX9w4f3lgAx66vmqO8u6KPXRy9+Z/Hp78epJUDpc1aagUBD
 +cILoBDDULfrDOX6ygmDHg7vBX/io+ouS25/pvxtNBdO+X/2vprS9meaYs+mnk/jZU0U
 d17OPhpNF/YvAOkwFyo7S75G9c4IcWtdvXX3It/ra0vugqDoEYOfeXirG/vyyY4n0XCO
 PGWB022Vz/JO3iWuCjhOkhSnrcVQVlk5lPyoOcL2GOA+y+Spe7oYGg89XTCoDodSxlus
 Owjg==
X-Gm-Message-State: AOJu0YzhRRIMLDxOilPQ9autQDeQIoD7723hbWQgeOqwbNA66Y8wOiM0
 bKe6EtcicSFumhfdDpK+98R3zEJjQw3SQAhuY0C5p3BKIgdl1khnOMT3Z2zU+OsEyDdtsUj5xR9
 yetM=
X-Gm-Gg: ASbGnctFSBpgOEj07qi8CSnHCxjBn/z0uoaZFJALeJWxfcCyvEOk15qgW4CnCuYoAXZ
 QA7zP5olg3HzjklrYKeH700fBC6qxqRVqu0Ru7giUBBdohVERQVj193Znk++X5KTtQm6HyFUgEM
 G4NWNNso2wMLZs9b62kVnhsTR1L6maaRIbRQqT6qV8LLXUMJ8z0J1ZcWWe932D1KlsClpf49PtG
 8UGBXyp5Q6I2Vgl+g9nhDgLaw44q2Y9Xt3sVVCfGyHy/zSgQXpW7w5nPadhA04hFm49MI1KJrTv
 rqFKkti0h5IhGT9vhKbi0ZHohh9mZZgRayWRWsxQCKhCMc0L1x3jQz8wyDCYpqxNQQ==
X-Google-Smtp-Source: AGHT+IFDp3hXZtEdsMcUIrBT+iESvXbCHaQLOqgflw5eA/os9NwCo0FrlO4xTmtGrm6OvwTazwTiwQ==
X-Received: by 2002:a05:6000:4201:b0:3a0:ad5a:58f5 with SMTP id
 ffacd0b85a97d-3a349694d5amr3316640f8f.8.1747240735622; 
 Wed, 14 May 2025 09:38:55 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a2d2f4sm20143845f8f.78.2025.05.14.09.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:38:55 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Marcin Bis <marcin@bis.org.pl>,
	Thomas Perale <thomas.perale@mind.be>
Date: Wed, 14 May 2025 18:38:36 +0200
Message-ID: <20250514163836.984647-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1747240736; x=1747845536; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Htm4+x3x9vihtHauXONp8rieUF58wphV9yAODmQtiQg=;
 b=Eiig6KraTTHhqipQWROAMwUdCqJQCOO4gEnqlWqFlIsKqmZRrY+FZJXSwfZlVq1VCI
 gYY+27hOZDe+EOSbVUReAe/BCANn4jw1beYMiacWqxt+pKHK8elK4bwtcnf1Dw8Rmp8/
 SP4aADkpmM8YsMTEBFfB/DbrFHhg+yLGVcTOBIGUYDEEVdQ3AHNO8cVndjqDbvFSuB6K
 fgZwk20M5HeW6R+yNcni77CXRCrBZsfrNZU4f6I4WT3pMtmUNP3lImJ1Ti/FUtbaMpOG
 ufO6zDw8Y0KGqUVHbK66755+e0iN8HNN28cz5c0ye1gdGJOYNURO/IC9NUQVoyjeg3Zm
 95zQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Eiig6Kra
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix build w/ HoG and
 w/o HID
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building the bluez5_utils package with HoG plugin without enabling
the HID plugin the following linker error would occur:

```
/workdir/instance-0/output-1/per-package/bluez5_utils/host/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/13.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: profiles/input/bluetoothd-hog.o: in function `hog_disconnect':
hog.c:(.text.hog_disconnect+0x12): undefined reference to `input_get_userspace_hid'
collect2: error: ld returned 1 exit status
```

This patch adds two upstream commits that decouple both the HID
and the HoG plugin.

As a consequence of this patch the HID plugin can be compiled without
the HoG one as well but to keep the compatibility the same in buildroot
the selection of the HoG plugin is kept when selecting the HID plugin.

The error can be reproduced with the following defconfig

```
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_BLUEZ5_UTILS=y
BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HOG=y
```

Fixes: https://autobuild.buildroot.org/results/78e/78ed7664f3a2dd5858fd71bd63836c822c106cc0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...03-input-fix-HID-compilation-w-o-HoG.patch | 140 ++++++++++++++++++
 ...04-input-fix-HoG-compilation-w-o-HID.patch | 120 +++++++++++++++
 2 files changed, 260 insertions(+)
 create mode 100644 package/bluez5_utils/0003-input-fix-HID-compilation-w-o-HoG.patch
 create mode 100644 package/bluez5_utils/0004-input-fix-HoG-compilation-w-o-HID.patch

diff --git a/package/bluez5_utils/0003-input-fix-HID-compilation-w-o-HoG.patch b/package/bluez5_utils/0003-input-fix-HID-compilation-w-o-HoG.patch
new file mode 100644
index 0000000000..941e9fb68f
--- /dev/null
+++ b/package/bluez5_utils/0003-input-fix-HID-compilation-w-o-HoG.patch
@@ -0,0 +1,140 @@
+From b111b5e15eb74e08b74cb3c7e91bcb21f54be4c7 Mon Sep 17 00:00:00 2001
+From: Thomas Perale <thomas.perale@mind.be>
+Date: Thu, 1 May 2025 18:35:35 +0200
+Subject: input: fix HID compilation w/o HoG
+
+Commit [1] introduced a dependency with the HID plugin in the HoG code
+As a result, building with --enable-hid --disable-hog caused linker
+errors due to undefined references to HoG-related functions:
+
+```
+> ./configure --enable-hid --disable-hog
+...
+> make
+...
+  CCLD     src/bluetoothd
+/usr/bin/ld: profiles/input/bluetoothd-manager.o: in function `input_init':
+/home/../bluez/profiles/input/manager.c:122:(.text.input_init+0x1c8): undefined reference to `input_set_auto_sec'
+collect2: error: ld returned 1 exit status
+make[1]: *** [Makefile:6376: src/bluetoothd] Error 1
+```
+
+This patch moves the reading of the HOG specific configuration of the
+'input.conf' file: LEAutoSecurity, to the HoG plugin file.
+
+[1] f2778f587 input: Add LEAutoSecurity setting to input.conf
+
+Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=b111b5e15eb74e08b74cb3c7e91bcb21f54be4c7
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ profiles/input/device.h  |  1 -
+ profiles/input/hog.c     | 40 +++++++++++++++++++++++++++++++++++-----
+ profiles/input/manager.c | 11 +----------
+ 3 files changed, 36 insertions(+), 16 deletions(-)
+
+diff --git a/profiles/input/device.h b/profiles/input/device.h
+index 7b87ce5903..036a88980e 100644
+--- a/profiles/input/device.h
++++ b/profiles/input/device.h
+@@ -25,7 +25,6 @@ void input_set_userspace_hid(char *state);
+ uint8_t input_get_userspace_hid(void);
+ void input_set_classic_bonded_only(bool state);
+ bool input_get_classic_bonded_only(void);
+-void input_set_auto_sec(bool state);
+ 
+ int input_device_register(struct btd_service *service);
+ void input_device_unregister(struct btd_service *service);
+diff --git a/profiles/input/hog.c b/profiles/input/hog.c
+index 017e320f07..f82648fec8 100644
+--- a/profiles/input/hog.c
++++ b/profiles/input/hog.c
+@@ -57,11 +57,6 @@ static gboolean suspend_supported = FALSE;
+ static bool auto_sec = true;
+ static struct queue *devices = NULL;
+ 
+-void input_set_auto_sec(bool state)
+-{
+-	auto_sec = state;
+-}
+-
+ static void hog_device_accept(struct hog_device *dev, struct gatt_db *db)
+ {
+ 	char name[248];
+@@ -228,10 +223,45 @@ static struct btd_profile hog_profile = {
+ 	.auto_connect	= true,
+ };
+ 
++static void hog_read_config(void)
++{
++	const char filename[] = CONFIGDIR "/input.conf";
++	GKeyFile *config;
++	GError *err = NULL;
++	bool config_auto_sec;
++
++	config = g_key_file_new();
++	if (!config) {
++		error("Failed to allocate memory for config");
++		return;
++	}
++
++	if (!g_key_file_load_from_file(config, filename, 0, &err)) {
++		if (!g_error_matches(err, G_FILE_ERROR, G_FILE_ERROR_NOENT))
++			error("Parsing %s failed: %s", filename, err->message);
++		g_error_free(err);
++		g_key_file_free(config);
++		return;
++	}
++
++	config_auto_sec = g_key_file_get_boolean(config, "General",
++					"LEAutoSecurity", &err);
++	if (!err) {
++		DBG("input.conf: LEAutoSecurity=%s",
++				config_auto_sec ? "true" : "false");
++		auto_sec = config_auto_sec;
++	} else
++		g_clear_error(&err);
++
++	g_key_file_free(config);
++}
++
+ static int hog_init(void)
+ {
+ 	int err;
+ 
++	hog_read_config();
++
+ 	err = suspend_init(suspend_callback, resume_callback);
+ 	if (err < 0)
+ 		error("Loading suspend plugin failed: %s (%d)", strerror(-err),
+diff --git a/profiles/input/manager.c b/profiles/input/manager.c
+index 95ca0a7ee5..1c0b6122a1 100644
+--- a/profiles/input/manager.c
++++ b/profiles/input/manager.c
+@@ -85,7 +85,7 @@ static int input_init(void)
+ 	config = load_config_file(CONFIGDIR "/input.conf");
+ 	if (config) {
+ 		int idle_timeout;
+-		gboolean classic_bonded_only, auto_sec;
++		gboolean classic_bonded_only;
+ 		char *uhid_enabled;
+ 
+ 		idle_timeout = g_key_file_get_integer(config, "General",
+@@ -115,15 +115,6 @@ static int input_init(void)
+ 		} else
+ 			g_clear_error(&err);
+ 
+-		auto_sec = g_key_file_get_boolean(config, "General",
+-						"LEAutoSecurity", &err);
+-		if (!err) {
+-			DBG("input.conf: LEAutoSecurity=%s",
+-					auto_sec ? "true" : "false");
+-			input_set_auto_sec(auto_sec);
+-		} else
+-			g_clear_error(&err);
+-
+ 	}
+ 
+ 	btd_profile_register(&input_profile);
+-- 
+cgit 1.2.3-korg
+
diff --git a/package/bluez5_utils/0004-input-fix-HoG-compilation-w-o-HID.patch b/package/bluez5_utils/0004-input-fix-HoG-compilation-w-o-HID.patch
new file mode 100644
index 0000000000..b2824e5e18
--- /dev/null
+++ b/package/bluez5_utils/0004-input-fix-HoG-compilation-w-o-HID.patch
@@ -0,0 +1,120 @@
+From 9c52188d753002a6afd6ae145f921a2ff52c1c81 Mon Sep 17 00:00:00 2001
+From: Thomas Perale <thomas.perale@mind.be>
+Date: Thu, 1 May 2025 18:35:36 +0200
+Subject: input: fix HoG compilation w/o HID
+
+Commit [1] introduced a dependency with the HID plugin in the HoG code
+As a result, building with --disable-hid --enable-hog caused linker
+errors due to undefined references to HID-related functions:
+
+```
+> ./configure --disable-hid --enable-hog
+> make
+/usr/bin/ld: profiles/input/bluetoothd-hog.o: in function `hog_accept':
+/home/../bluez/profiles/input/hog.c:184:(.text.hog_accept+0xbb): undefined reference to `input_get_auto_sec'
+/usr/bin/ld: profiles/input/bluetoothd-hog.o: in function `hog_disconnect':
+/home/../bluez/profiles/input/hog.c:205:(.text.hog_disconnect+0x12): undefined reference to `input_get_userspace_hid'
+collect2: error: ld returned 1 exit status
+make[1]: *** [Makefile:6344: src/bluetoothd] Error 1
+make: *** [Makefile:4695: all] Error 2
+```
+
+This patch duplicate the read of the 'UserspaceHID=persist' config entry
+in the HoG plugin file to remove the dependency on the HID plugin files.
+
+[1] 1782bfd79 input: Add support for UserspaceHID=persist
+
+Fixes: https://github.com/bluez/bluez/issues/1228
+
+Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9c52188d753002a6afd6ae145f921a2ff52c1c81
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ profiles/input/device.c |  5 -----
+ profiles/input/device.h |  1 -
+ profiles/input/hog.c    | 14 ++++++++++++--
+ 3 files changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/profiles/input/device.c b/profiles/input/device.c
+index a7bc4d44fa..3642cc3267 100644
+--- a/profiles/input/device.c
++++ b/profiles/input/device.c
+@@ -112,11 +112,6 @@ void input_set_userspace_hid(char *state)
+ 		error("Unknown value '%s'", state);
+ }
+ 
+-uint8_t input_get_userspace_hid(void)
+-{
+-	return uhid_state;
+-}
+-
+ void input_set_classic_bonded_only(bool state)
+ {
+ 	classic_bonded_only = state;
+diff --git a/profiles/input/device.h b/profiles/input/device.h
+index 036a88980e..9056695026 100644
+--- a/profiles/input/device.h
++++ b/profiles/input/device.h
+@@ -22,7 +22,6 @@ struct input_conn;
+ 
+ void input_set_idle_timeout(int timeout);
+ void input_set_userspace_hid(char *state);
+-uint8_t input_get_userspace_hid(void);
+ void input_set_classic_bonded_only(bool state);
+ bool input_get_classic_bonded_only(void);
+ 
+diff --git a/profiles/input/hog.c b/profiles/input/hog.c
+index f82648fec8..a3c876cf9f 100644
+--- a/profiles/input/hog.c
++++ b/profiles/input/hog.c
+@@ -40,7 +40,6 @@
+ #include "src/shared/gatt-client.h"
+ #include "src/plugin.h"
+ 
+-#include "device.h"
+ #include "suspend.h"
+ #include "attrib/att.h"
+ #include "attrib/gattrib.h"
+@@ -55,6 +54,7 @@ struct hog_device {
+ 
+ static gboolean suspend_supported = FALSE;
+ static bool auto_sec = true;
++static bool uhid_state_persist = false;
+ static struct queue *devices = NULL;
+ 
+ static void hog_device_accept(struct hog_device *dev, struct gatt_db *db)
+@@ -203,7 +203,7 @@ static int hog_disconnect(struct btd_service *service)
+ {
+ 	struct hog_device *dev = btd_service_get_user_data(service);
+ 
+-	if (input_get_userspace_hid() == UHID_PERSIST)
++	if (uhid_state_persist)
+ 		bt_hog_detach(dev->hog, false);
+ 	else
+ 		bt_hog_detach(dev->hog, true);
+@@ -229,6 +229,7 @@ static void hog_read_config(void)
+ 	GKeyFile *config;
+ 	GError *err = NULL;
+ 	bool config_auto_sec;
++	char *uhid_enabled;
+ 
+ 	config = g_key_file_new();
+ 	if (!config) {
+@@ -253,6 +254,15 @@ static void hog_read_config(void)
+ 	} else
+ 		g_clear_error(&err);
+ 
++	uhid_enabled = g_key_file_get_string(config, "General",
++					"UserspaceHID", &err);
++	if (!err) {
++		DBG("input.conf: UserspaceHID=%s", uhid_enabled);
++		uhid_state_persist = strcasecmp(uhid_enabled, "persist") == 0;
++		free(uhid_enabled);
++	} else
++		g_clear_error(&err);
++
+ 	g_key_file_free(config);
+ }
+ 
+-- 
+cgit 1.2.3-korg
+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
