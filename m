Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA81C54E67
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 04:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5107460A64;
	Tue, 26 Mar 2024 04:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZrU0LKSk_Uw; Tue, 26 Mar 2024 04:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B19A60A5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B19A60A5B;
	Tue, 26 Mar 2024 04:25:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0F081BF419
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 04:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA78D40794
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 04:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqK64zVra6Wb for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 04:25:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=ckhardin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D2AAA40791
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2AAA40791
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2AAA40791
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 04:25:37 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-dd02fb9a31cso4757515276.3
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 21:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711427136; x=1712031936;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JZ9xAFRBQNl9rNeAnB0/j5VuBN7/EetNt51tTS5pgsg=;
 b=Ae3uoULTpeoVsG1g4XmaEA856/pw7hB3OA/tQcPOtx7/dSvA9elD8BnK6uWOEbFfcA
 /YRE/FfAPDHwF8nXcxeJTI1vqzGoar0+fm9944iAQfgZZHKvJM/Wu5XMICxnsqRf6dbM
 nWNnE4nX+CY+e+d4+RsJZIaPiesedORODCoiAX659BVUkhlgvZ54SmtkNhLNNWiz1puW
 sYOH5B6dE1vR/8RL1pV4JwoHxWqQ549OD8a/UyUvOZm4RBQs96tgUHgVW3lnVX1OHqSK
 4Myxfbj1fISxzvo3y2wrCLgAlJ4ddvxuHsZPPvKR/3AFx5AGmCBZAwNTQZ8/cHwDYGo6
 TgWA==
X-Gm-Message-State: AOJu0YwTGU6rBuS+SNCE4QmQTT2pE5PVBAi/mEihwZKZSsDpSDVEkCo4
 Na1qBg0wZYNWzA+W+g58DWL9VbmhkomtGx/iC7zGekcJlLOt/jBWR8Zl84f6
X-Google-Smtp-Source: AGHT+IEwmYnrK9t/jZSg0R6Wu4IqiDl+JhDuf+nEotEoQllgmGFpC40FVg/ZuZwwPoTVI/NkorRSNw==
X-Received: by 2002:a25:cecd:0:b0:dd0:471:712 with SMTP id
 x196-20020a25cecd000000b00dd004710712mr6696116ybe.33.1711427135880; 
 Mon, 25 Mar 2024 21:25:35 -0700 (PDT)
Received: from purgatory.attlocal.net
 ([2600:1700:65a0:14f0:80d9:dd2c:13ec:2f56])
 by smtp.gmail.com with ESMTPSA id
 k30-20020a25b29e000000b00dc6c179f536sm1294246ybj.20.2024.03.25.21.25.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Mar 2024 21:25:35 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 21:25:22 -0700
Message-Id: <20240326042522.34109-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711427136; x=1712031936; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JZ9xAFRBQNl9rNeAnB0/j5VuBN7/EetNt51tTS5pgsg=;
 b=Ebl2Va4glgTZGlHRZKFHbZJZQN3VMst6S5sksgfyJnkhVZsTH/XuXqPqwSkaSJBkjd
 vDiJ1y7//1nAesPIFo+OWCbTLVpAUBYJfo6P2yOoetmVrhifCX7NsyPFGWwGHUVwbAod
 VKj9qhIomqpjhRaCNrWPUkLbi3uyjXozWNv9wsMd21WxIbYGNR7RsKrcjIcAWSun4SiG
 zOyo0iTU69F4bFwM6F2k2xHwt73YtCc+n6dadFjYrKz3KD0OKKsJ+yoMm8snNpPCV14j
 4lDKHOZR9Ty4+Vgbq4mSpPEftK2Z2VF2qunpAXXZh+2IEWsY5BnXGdMw8uTaVAOMJ1Tp
 3wFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ebl2Va4g
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
Cc: Charles Hardin <ckhardin@gmail.com>
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
