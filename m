Return-Path: <SRS0=OK8R=OO=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC7CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 12:26:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7581610FD
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 12:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7581610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86249415F8;
	Fri, 24 Sep 2021 12:26:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5zVSLsbKxVSo; Fri, 24 Sep 2021 12:26:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEDEC406E0;
	Fri, 24 Sep 2021 12:26:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F9771BF479
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 12:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E150843A0
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 12:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CFSR2pbOqaNJ for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 12:26:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8819984372
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 12:26:11 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id b15so10116996ils.10
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 05:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a2iWa81xezPJjEg+W2HNvJHEGb/eVBmsL25xcZSJmiM=;
 b=L/eUaIyZCVG8O5Bvx4B1gfvuHBDA97QNxkLT0RZL33bdD64qj0+G1Kkw/WEqjBYOm/
 R/+RDddEb3NbYVq2gHh4fGjzbfcGWU1qSzpqoJQhFJARZL0jwS3nhhHEeR/swuFatGMb
 SjW/PBrJgOK1CTOTtL/XewtIPs9Icu4UKHK2/2pUL40dLRjVGtkGwkOAa22AFClXt0aZ
 KlUzSlChS9LYTp3OCRzYgr2JyHJHP0ROcFUEK1FhA9iyJpRsmcKYKrZqR0td2V4DfpH6
 DEx8GiOeK6J7xmAQRepqSRMO6uhO8HI0FDJxovo5PTQmvP6+TmNuaanCfSvm+ivTN2LC
 R4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a2iWa81xezPJjEg+W2HNvJHEGb/eVBmsL25xcZSJmiM=;
 b=1enDSm2xNahiHPwXB5hDuxpYc5D7Jkq31jFeDtTdrjGat2KGLKe4FBk9XAnep6nBw7
 fdRMb3W5RZ8pIDguuX+D8pOpzCquKrAEtbwjI7nOGNE4UO0DO+f4ZiquZuwwGmhRyoIJ
 NjZat2k/a3t/Aduo2ZaHmXfn72C9qLlXgE409GGl8ZCEEC0YM2xHJiYTQ5E8RZ4gJL6J
 1+xs+g/JqztfW8U7U7oGB/2jCAiKXCdd50Fs4mRFP11lsiVb7LoYDrx7vvzs/+kjbKOL
 Umhu+1YjAk19n6/jRjFgYuv+g5SFZDob14M/PYCH3gLc9E8o3FfofpLo1HYMbRPU6MRE
 5VcA==
X-Gm-Message-State: AOAM531/x7Gx2TvWYI5mQD8sbKrUi4DoXjjw/VVujmDmG5tA7+CM7o74
 PmCdktJtQQXSVjPjVeVxL4k895KI3/M=
X-Google-Smtp-Source: ABdhPJyLpemwhGTyb7b1IFANtFWPA80+RQvgOEZmdxAiPS4WgArfOpeYdry9sTqn4GddRpD47koFFQ==
X-Received: by 2002:a05:6e02:1aa2:: with SMTP id
 l2mr8180612ilv.179.1632486370357; 
 Fri, 24 Sep 2021 05:26:10 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id z25sm2167370iow.20.2021.09.24.05.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 05:26:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Sep 2021 06:25:47 -0600
Message-Id: <20210924122547.3703420-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/wpewebkit: add option to enable
 media-stream
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This has a compile time dependency on gst1-plugins-bad due to
the codecparsers dependency.

We need to prevent the wpe plugin from being selected when wpewebkit
media-stream support is enabled as the wpe plugin requires wpewebkit
which would create a circular dependency with gst1-plugins-bad.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - prevent circular dependency with gst1-plugins-bad wpe plugin
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 6 ++++++
 package/wpewebkit/Config.in                   | 5 +++++
 package/wpewebkit/wpewebkit.mk                | 7 +++++++
 3 files changed, 18 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index ba20da7a2d..1204a65681 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -647,11 +647,17 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE
 	default y
 	depends on BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
+	depends on !BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM
 
 comment "wpe needs the gst1-plugins-base opengl library and wpewebkit"
 	depends on !BR2_PACKAGE_WPEWEBKIT \
 		|| !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
 
+comment "wpe is incompatible w/ wpewebkit media-stream support"
+	depends on BR2_PACKAGE_WPEWEBKIT
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
+	depends on BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_V4L2CODECS
 	bool "v4l2codecs"
 	depends on BR2_PACKAGE_HAS_UDEV # libgudev
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 04b2bf3beb..6fc1e668fd 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -107,6 +107,11 @@ config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 
 if BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 
+config BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM
+	bool "media-stream support"
+	help
+	  This option enables media-stream support.
+
 config BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL
 	bool "use gstreamer-gl"
 	default y
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 5c5e6625f8..9ad569a472 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -46,6 +46,13 @@ WPEWEBKIT_CONF_OPTS += \
 	-DENABLE_WEB_AUDIO=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM),y)
+WPEWEBKIT_CONF_OPTS += -DENABLE_MEDIA_STREAM=ON
+WPEWEBKIT_DEPENDENCIES += gst1-plugins-bad
+else
+WPEWEBKIT_CONF_OPTS += -DENABLE_MEDIA_STREAM=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL),y)
 WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
 else
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
