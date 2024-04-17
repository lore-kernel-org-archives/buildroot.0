Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2059C4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 18:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FEB6600B9;
	Wed, 17 Apr 2024 18:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SAY4qSyINzt; Wed, 17 Apr 2024 18:13:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CB8B6058D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CB8B6058D;
	Wed, 17 Apr 2024 18:13:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2271BF423
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 18:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2409240120
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 18:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Y-7asuH5uwf for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 18:13:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=ckhardin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B45C340110
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B45C340110
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B45C340110
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 18:13:44 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6ee12766586so71988b3a.0
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 11:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713377624; x=1713982424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZ9xAFRBQNl9rNeAnB0/j5VuBN7/EetNt51tTS5pgsg=;
 b=rtVMgon6wU1NVgzrfT8t+0WGr3IbH+LsO7Nby8OQzulDHQBz85gCSfhHF7OFxBk3Sm
 RDGQHZ2VJJIjiRhHSGEYET9YUDmQEK/MTPs5hGSdt7h7ugD1VO0+W3IbLvFSeWiz4xJo
 ekn8ij8owWKi0J6t4vaDW4hLwh9Nawl1eiYczvNaZFNsaRMRgg86kmvX+vDgp70XIMXq
 07aV1aZMVtlIqBxOEk6ULNAUjROZaSc0c3Xvrbp67dRgozteCjzAQKNqS2Xr+mWQ82ri
 vXVJN//6XlDHwqZOuyfgxqyiUYqJKeenXy0x0/2owppxCTOUMuAfgh2SzSfDZzrOfLoN
 7Omw==
X-Gm-Message-State: AOJu0Yw7FSjJQZFSR4/Jkh76YkGSJUzp8i/0ImW+GJpMaGqCXTb47Moi
 o0PvYaCsxca+lCty1IC70902ghftVJF+ap9eucZ0rjmsTGXdJV2PdEJkXA==
X-Google-Smtp-Source: AGHT+IFIC9ARAXxYsBx3jozbDFCWkykxWoMUIGYFqyMIJgeAVBi+YYutmiDmbazmSxjH/kRFfL3yFg==
X-Received: by 2002:a05:6a21:6da2:b0:1aa:3ee3:8d5d with SMTP id
 wl34-20020a056a216da200b001aa3ee38d5dmr263374pzb.14.1713377623540; 
 Wed, 17 Apr 2024 11:13:43 -0700 (PDT)
Received: from purgatory.attlocal.net
 ([2600:1700:65a0:14f0:24dc:50a6:a50b:d782])
 by smtp.gmail.com with ESMTPSA id
 6-20020a056a00070600b006eab6f3d8a9sm10961867pfl.207.2024.04.17.11.13.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Apr 2024 11:13:43 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 17 Apr 2024 11:13:22 -0700
Message-Id: <20240417181322.36344-2-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240417181322.36344-1-ckhardin@gmail.com>
References: <20240417181322.36344-1-ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713377624; x=1713982424; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZ9xAFRBQNl9rNeAnB0/j5VuBN7/EetNt51tTS5pgsg=;
 b=OQpEpi+up0Ot29oJIlASGtO2r8OZvYO0E+LVQ9YEP8D4Ha0ZAT0K2V8wDB9coGSXZY
 sL+RNZ1vSSxuIXYCrgG39sYr0Mo9T4AZtcAa9bSHqsPsgoEJRJ7NViCxJOtHRh+fMSXY
 fgQ9v2NpwOfOkBGp8wXyd8Av1/s7F9CHa6fQuPwYjZdz8JeQMt4rDWSxtxYIQRUa+trG
 zAguWYXuYEQJ3N2P7k3ZedMJ53PJyX5DI4A/HH12HekRUvpU5lMuQaTGNDiZjkkCSdsH
 XGP+RIOStP5i8E3KO+dSzrm1qbSUajs5RH+98DnLa26lQyfXtBq3PazIbjGZuoXAXnjN
 gi2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OQpEpi+u
Subject: [Buildroot] [PATCH 1/1] package/gst1-plugins-good: add qt5tools as
 a dependency
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 Jens Zettelmeyer <zettelmeyerj@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

During a configuration with per-package, seeing the following
meson build error which is resolved when the qt5tools are
declared explicitly as a dependency.

    build/gst1-plugins-good-1.22.9/ext/qt/meson.build:48:4: \
      ERROR: Problem encountered: qt5 qmlglsink plugin is enabled, \
      but qt specific tools were not found

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in            | 1 +
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index e1e2674a4a..78e09601bf 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -293,6 +293,7 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	select BR2_PACKAGE_QT5TOOLS
 	select BR2_PACKAGE_QT5X11EXTRAS if BR2_PACKAGE_QT5BASE_XCB
 	help
 	  QT5 plugin which includes elements qmlglsrc and qmlglsink
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index a1ad63915d..2bb826d807 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -357,7 +357,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dqt5=enabled
-GST1_PLUGINS_GOOD_DEPENDENCIES += qt5declarative
+GST1_PLUGINS_GOOD_DEPENDENCIES += qt5declarative qt5tools
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
 GST1_PLUGINS_GOOD_DEPENDENCIES += qt5x11extras
 endif
-- 
2.39.3 (Apple Git-146)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
