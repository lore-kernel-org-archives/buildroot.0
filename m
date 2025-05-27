Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E10C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 17:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F5C1616A2;
	Wed,  4 Jun 2025 17:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iq-f7Xu1JEgI; Wed,  4 Jun 2025 17:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54C846130B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54C846130B;
	Wed,  4 Jun 2025 17:20:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E06BDA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6603480DD1
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k5nIngc9qvvn for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 17:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F87080B42
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F87080B42
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:20:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D932878DD; Wed,  4 Jun 2025 17:20:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:24:15 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 47713b4ac9a38c57d6e38601c0c6a030ee777b7e
X-Git-Newrev: 09f0d9843406dd49bae9f442ae30649adde26b3c
X-Patchwork-Hint: ignore
Message-Id: <20250604172010.1D932878DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bluez5_utils: fix
 build w/ HoG and w/o HID
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=09f0d9843406dd49bae9f442ae30649adde26b3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 57eb26837b971e969a37e07b87e57bf4e9df9f34)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0003-input-fix-HID-compilation-w-o-HoG.patch   | 140 +++++++++++++++++++++
 .../0004-input-fix-HoG-compilation-w-o-HID.patch   | 120 ++++++++++++++++++
 2 files changed, 260 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
