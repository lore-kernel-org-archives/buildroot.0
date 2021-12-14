Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0D2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 22:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABD0B60D64;
	Tue, 14 Dec 2021 22:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7cfuDIGpDUsc; Tue, 14 Dec 2021 22:15:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67E3E60D5D;
	Tue, 14 Dec 2021 22:15:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EA1E1BF681
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 22:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E4EA408AD
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 22:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKljW-1ay-AY for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 22:15:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94B474067C
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 22:15:24 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 133so15338119wme.0
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 14:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n/SPY8iEJkEgqRTr/Yw/l/wnd8wSLRMhpNUX/wEh5RU=;
 b=FWGg0txNg8P+YDoKczW/4r5Ag6t0CKma41cU38Ldc/+Ylhl1Ckc5PeEGeeeFtxy9D/
 TyxrY/7h1qsGTOeO4bRzr/nPjdgF8sp4DIpq/3d2S0kUymCDw+V/MNtCvfvLDesvlCUh
 aP6sVXUzJvejTTWeO0J8ptXznhMoABIkZJ2GJXQo9mz/78Y8L91996xw+sEGFim/FhQC
 Gw8rokDapLqZexkzrvL7JXlq5tl/6RALP82sFx9IBXWqXgXqYdE/pxlDsG3oebksyKwv
 E0IkI3Z+/nwp9WMeoEDarRQ71VivgslSMfRv/rZtRPYvtTPIMWLLJa+LkuoqRGVFWlK/
 UBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n/SPY8iEJkEgqRTr/Yw/l/wnd8wSLRMhpNUX/wEh5RU=;
 b=m/ZahA3xhLrgxfwz/Tk8KTQQYwYoB5AfYhkM3NYeb0GiCzG+AM7FxxeYVIrm2WnglU
 aa+G9Xbncc/OckgLuSjuib1RZ6LT+g4sdk49j89v9N2r6eS2JO7VHNivfW+h8AMQ3IRc
 G6WVlFVHu4U2eIxThEOg5LrOrezeQDTYYg/ySEhqqhbddAMt0FTW4L3uB0jvpAZOEQcT
 YZGEnoQN49e7m9CV89pJ4SpLTyXYuBYfqEuCKGwZrZz6OkMeniE7vfoFYod/RGiCtMPT
 B3kz8NKV1ZTNIpgn7X6UpLQ2pGzJRBhjaqj+GOqYH1nOWdOXn+yKQcbd/i+I2tTJ0PDs
 7mdw==
X-Gm-Message-State: AOAM533fGM1Fnx8QB8AKhXVYxmGj8kk9HJCX7FD7wWMicvB9qD40QKYL
 BYcP+XQsra7KZK1MD6YB0kFq3fdph6Z9IA==
X-Google-Smtp-Source: ABdhPJyVkV2evl1Pk94itlKPnI5yEHNLfw9mpkZrgiQ8zp3hIN0VS5Q+axwjolhlP8t9+eYTzIOXPA==
X-Received: by 2002:a05:600c:2512:: with SMTP id
 d18mr128234wma.26.1639520122506; 
 Tue, 14 Dec 2021 14:15:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id n24sm71003wms.45.2021.12.14.14.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 14:15:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 23:15:04 +0100
Message-Id: <20211214221504.2937004-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gupnp-tools: bump to version 0.10.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://gitlab.gnome.org/GNOME/gupnp-tools/-/blob/gupnp-tools-0.10.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rc-meson.build-upload-needs-gupnp-av.patch | 30 -------------------
 package/gupnp-tools/gupnp-tools.hash          |  4 +--
 package/gupnp-tools/gupnp-tools.mk            |  2 +-
 3 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 package/gupnp-tools/0001-src-meson.build-upload-needs-gupnp-av.patch

diff --git a/package/gupnp-tools/0001-src-meson.build-upload-needs-gupnp-av.patch b/package/gupnp-tools/0001-src-meson.build-upload-needs-gupnp-av.patch
deleted file mode 100644
index f8eba76773..0000000000
--- a/package/gupnp-tools/0001-src-meson.build-upload-needs-gupnp-av.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 0831f77e990e363f78e3f6a5c461084988824f7b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 2 Jul 2019 23:48:12 +0200
-Subject: [PATCH] src/meson.build: upload needs gupnp-av
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/gupnp-tools/merge_requests/3]
----
- src/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index 84b2ca2..6601f45 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -2,9 +2,9 @@ subdir('common')
- 
- if get_option('av-tools') and gupnp_av.found()
-     subdir('av-cp')
-+    subdir('upload')
- endif
- 
- subdir('discover')
- subdir('network-light')
- subdir('universal-cp')
--subdir('upload')
--- 
-2.20.1
-
diff --git a/package/gupnp-tools/gupnp-tools.hash b/package/gupnp-tools/gupnp-tools.hash
index 30f1b8293d..28a1d26ede 100644
--- a/package/gupnp-tools/gupnp-tools.hash
+++ b/package/gupnp-tools/gupnp-tools.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.10/gupnp-tools-0.10.0.sha256sum:
-sha256  41da7ff5ba8e2425adcb64ca5e04c81f57ca20ec6fdb84923939fdad42c6a18d  gupnp-tools-0.10.0.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.10/gupnp-tools-0.10.2.sha256sum:
+sha256  6de49ef4b375b8a164f74b766168b1184e0d28196b6b07a4f5341f08dfd85d6c  gupnp-tools-0.10.2.tar.xz
 
 # Locally computed:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
index 182b0145c8..7b34de52a0 100644
--- a/package/gupnp-tools/gupnp-tools.mk
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_TOOLS_VERSION_MAJOR = 0.10
-GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).0
+GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).2
 GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
 GUPNP_TOOLS_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
