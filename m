Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40B7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 16:34:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CAEB60EE7
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 16:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CAEB60EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C424F4010E;
	Sat, 13 Nov 2021 16:34:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-lrMjls04Sk; Sat, 13 Nov 2021 16:34:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91C8F4010F;
	Sat, 13 Nov 2021 16:34:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 791EA1BF20B
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 16:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6841E4029B
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 16:34:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4UJ_FxNXa1Az for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 16:34:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF98640244
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 16:34:48 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s13so21337768wrb.3
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 08:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ha28VaZ3JidpC6rG0FAIAJ671jsXjx3CimYBOpgh5x4=;
 b=Mh7AEPALgr7iLpPmj+TfiWIA7Gjo6AeLCp4Oeqzd5N7HzU6zRaD/JemigDNWzFWiUR
 ttcaSmfPABwpOxubOfmWGOzMYPBKvuD+V/CvdU9WCORkObzk8vVzBIL1LezAyUJjAB/4
 9d/QU5u86xpMKR8wsKDVEwLBbCpEk+IpZEDAiLudymFTIVRy4FbCOq8GmoQ78WYwwhQP
 hKf0Mxa7mlo3DA/S508VSJfEurkN5bR8GkGoUUpvklaeOtrjAzZIWvLACFLnMnGvV1rn
 mxQOIrre65N6bYd9h/Lx5+5oqJQ8EL0FM8NbCJiWxRrCRc5/Auj90y2BDTVM16jH3/on
 Kv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ha28VaZ3JidpC6rG0FAIAJ671jsXjx3CimYBOpgh5x4=;
 b=Jhp6xO3F5K35LRd9pYv9apQzVb+taD/GIHQxj4jCWXceQ6Zq8wGlqVSiyc4+EBYPwF
 EvBOOsQGOJpn+KO1Pa86Lr4GhCESv6T0CbVWY6I4x4kC7t3gSOGd49m6dbFSfNxneXe5
 44P2bbuM0kIL/uoYRqx1tge1jMRFVQdQW4xWrjp6Hci77agpkiwzVsh5egMeIIABYcbQ
 DrSR7ySbM/FrEf7+bw+hHpZDKt+nPr+Ei9hhWiULRjYNbL6xm4UmeZcJOO2o7fwco9Vb
 E7bJFX3KAfZN3xn2P27/lBFloOId8aD1GpK3RUrw0d33VGRU0OgRHFh01/cZ7xF9YH3b
 48WQ==
X-Gm-Message-State: AOAM531uEW33B2hoMzh6uqMX770rgju+LhV6irfXmfVJERD2LqPEYv6L
 77Xz49/7K5LlGhyvT44uaKXUJbl+fH4=
X-Google-Smtp-Source: ABdhPJyMQtkrj8JnJjYhBUn07tFkOO7JFncq42arVPVYTBNxo5Wu6etInmp6XroKm9XssTKznqVffg==
X-Received: by 2002:adf:eb52:: with SMTP id u18mr29626047wrn.90.1636821286653; 
 Sat, 13 Nov 2021 08:34:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id h15sm9251499wml.9.2021.11.13.08.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 08:34:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 17:32:41 +0100
Message-Id: <20211113163241.547023-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: security bump to
 version 5.62
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop second patch (already in version)
- Fix CVE-2021-43400: An issue was discovered in gatt-database.c in BlueZ
  5.61. A use-after-free can occur when a client disconnects during D-Bus
  processing of a WriteValue call.

http://www.bluez.org/release-of-bluez-5-62

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../bluez5_utils-headers.mk                   |  2 +-
 ...-profiles-audio-media.c-rename-pause.patch | 52 -------------------
 package/bluez5_utils/bluez5_utils.hash        |  2 +-
 package/bluez5_utils/bluez5_utils.mk          |  2 +-
 4 files changed, 3 insertions(+), 55 deletions(-)
 delete mode 100644 package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index f4c7fc3cbb..e671431093 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.61
+BLUEZ5_UTILS_HEADERS_VERSION = 5.62
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch b/package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch
deleted file mode 100644
index a7fabc9edd..0000000000
--- a/package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 0bb5785a68a2799db003364770be3764af9b9034 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 12 Sep 2021 13:55:49 +0200
-Subject: [PATCH] profiles/audio/media.c: rename pause
-
-Rename pause to media_player_pause to avoid the following build failure:
-
-profiles/audio/media.c:1284:13: error: conflicting types for 'pause'
- 1284 | static bool pause(void *user_data)
-      |             ^~~~~
-In file included from /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/bits/sigstksz.h:24,
-                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/signal.h:328,
-                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib/gbacktrace.h:36,
-                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib.h:34,
-                 from profiles/audio/media.c:21:
-/tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/unistd.h:489:12: note: previous declaration of 'pause' was here
-  489 | extern int pause (void);
-      |            ^~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/c4fbface34be8815838fd7201621d7a8fddd32c5
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- profiles/audio/media.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/profiles/audio/media.c b/profiles/audio/media.c
-index 267722542..f93b74e67 100644
---- a/profiles/audio/media.c
-+++ b/profiles/audio/media.c
-@@ -1281,7 +1281,7 @@ static bool stop(void *user_data)
- 	return media_player_send(mp, "Stop");
- }
- 
--static bool pause(void *user_data)
-+static bool media_player_pause(void *user_data)
- {
- 	struct media_player *mp = user_data;
- 
-@@ -1331,7 +1331,7 @@ static struct avrcp_player_cb player_cb = {
- 	.set_volume = set_volume,
- 	.play = play,
- 	.stop = stop,
--	.pause = pause,
-+	.pause = media_player_pause,
- 	.next = next,
- 	.previous = previous,
- };
--- 
-2.33.0
-
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 3ba2482468..3ec4acac7f 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  83afd6c52179554bfeabbcb538fec2eb6be90a8ac3c40871b49d7ad8b49c423b  bluez-5.61.tar.xz
+sha256  38090a5b750e17fc08d3e52178ed8d3254c5f4bd2c48830d5c1955b88e3bc0c2  bluez-5.62.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index ce927b7a43..cf46d6e0d6 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.61
+BLUEZ5_UTILS_VERSION = 5.62
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
