Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E22DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 19:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D34DE404DB;
	Thu, 27 Jan 2022 19:24:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3CRnsQ7wQxSo; Thu, 27 Jan 2022 19:24:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5985409D6;
	Thu, 27 Jan 2022 19:24:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 588A11BF3C3
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4771541484
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cLTsVyyL8ICO for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 19:23:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FE17409EE
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 19:23:44 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id i62so4911437ioa.1
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 11:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pp2U4t5CpTvLwILq1ADv8mkubXLN/fkoN9sddgrioMM=;
 b=nK0cL+1M0Q9zSp0rsARwBXBLe8xz2EMoyxKG0qfnqWaA/w9vakKCoDColmmhHDur7U
 06bGnV9kpO9bOxgHbNFWG6YP2BgKNi9kEC9PJaffQrYyFxEZWTGl+c5Ui35S/og8yMnc
 rhe9ehx3Qmvy/rG/Dr2JIzcA560yr19OB9loi3P/2STabJU/g5UEg8on+GENvTWi+OpL
 XLZC8CQ7Wdpt6QWrPQwlBAvGoXHsqIQBJHqSk/Y0wzE+frgvUgny/L8QbOwW6qYKrDPA
 CON4u+oH+M4kmCt1dJSs2wPTa+WJ83eWlGLXFfJLSpwT3G72PtsOI6k9Ay8tKXCIEOHu
 8ggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pp2U4t5CpTvLwILq1ADv8mkubXLN/fkoN9sddgrioMM=;
 b=bd8r/+FxbWzYxsHbjdyxMg21irnbSe+gX7XAzM/tng3logqU/kJos39NcmY+pP8NBD
 ultqv/0eW/4BdOxDsdkhaXx8/dnLtxbK4HT0+zXKJeDyfzCVqH/BOFJyrcMr2nS/DzfH
 JmIOVXFszAKq89telSR+SBGo5QZ/R7BBvae0MztcQSLCTEVvZ9capH/YY1vAD59PWNS4
 bj7ZfzxzKU0s5nEoSx0R5bZljFYwmUXHSw09eaDbGQl0Ck4hyxpR6lxIYRyw6Tali8Na
 BjVoO1R83pp3hYc6LNY49OQH5HEVnFsfC+5oC88miVHj1mNPSweyvWK6ab20TMjGmRti
 ejBQ==
X-Gm-Message-State: AOAM530DW/0hk0Vq6YPZefUJrEskRxU6smbwluOmIj9SXCX1aGq5NGB3
 UijUZA7gMy1VkR7S9SlIEIL2U+O1NHw=
X-Google-Smtp-Source: ABdhPJxVhROtPcBOWkosVhSdHzNuiXCxVw9qTLbYnNmwNC9UZxcz07nkD5DR6ZzmS5K9OJZZoXYmNQ==
X-Received: by 2002:a05:6638:a17:: with SMTP id
 23mr2831633jan.253.1643311423444; 
 Thu, 27 Jan 2022 11:23:43 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id f12sm669023ilj.47.2022.01.27.11.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 11:23:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 12:23:09 -0700
Message-Id: <20220127192311.1954197-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127192311.1954197-1-james.hilliard1@gmail.com>
References: <20220127192311.1954197-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/5] package/lv2: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - disable plugins for static build
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/lv2/Config.in |  8 ++++++++
 package/lv2/lv2.hash  |  4 ++++
 package/lv2/lv2.mk    | 36 ++++++++++++++++++++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/lv2/Config.in
 create mode 100644 package/lv2/lv2.hash
 create mode 100644 package/lv2/lv2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0d70c676d5..548570aa46 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1285,6 +1285,7 @@ F:	package/exfatprogs/
 F:	package/gensio/
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
+F:	package/lv2/
 F:	package/pipewire/
 F:	package/python-aioconsole/
 F:	package/python-aiodns/
diff --git a/package/Config.in b/package/Config.in
index aa700bc8d7..80d3f9ff3c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1372,6 +1372,7 @@ menu "Audio/Sound"
 	source "package/libsoundtouch/Config.in"
 	source "package/libsoxr/Config.in"
 	source "package/libvorbis/Config.in"
+	source "package/lv2/Config.in"
 	source "package/mp4v2/Config.in"
 	source "package/openal/Config.in"
 	source "package/opencore-amr/Config.in"
diff --git a/package/lv2/Config.in b/package/lv2/Config.in
new file mode 100644
index 0000000000..aeeb6d0451
--- /dev/null
+++ b/package/lv2/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LV2
+	bool "lv2"
+	help
+	  LV2 is a plugin standard for audio systems. It defines
+	  a minimal yet extensible C API for plugin code and a
+	  format for plugin "bundles".
+
+	  https://lv2plug.in/
diff --git a/package/lv2/lv2.hash b/package/lv2/lv2.hash
new file mode 100644
index 0000000000..ed21620bee
--- /dev/null
+++ b/package/lv2/lv2.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking signature
+# https://lv2plug.in/spec/lv2-1.18.2.tar.bz2.asc
+sha256  4e891fbc744c05855beb5dfa82e822b14917dd66e98f82b8230dbd1c7ab2e05e  lv2-1.18.2.tar.bz2
+sha256  0b0b07d852e3ce7fa04986e141f73001bd7f260683968f0a19e02dbcc4131aa6  COPYING
diff --git a/package/lv2/lv2.mk b/package/lv2/lv2.mk
new file mode 100644
index 0000000000..13ffaa34b0
--- /dev/null
+++ b/package/lv2/lv2.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# lv2
+#
+################################################################################
+
+LV2_VERSION = 1.18.2
+LV2_SITE = https://lv2plug.in/spec
+LV2_SOURCE = lv2-$(LV2_VERSION).tar.bz2
+LV2_LICENSE = ISC
+LV2_LICENSE_FILES = COPYING
+LV2_DEPENDENCIES = host-pkgconf
+LV2_INSTALL_STAGING = YES
+
+LV2_CONF_OPTS += \
+	--no-coverage \
+	--no-check-links \
+	--copy-headers
+
+ifeq ($(BR2_PACKAGE_CAIRO),y)
+LV2_DEPENDENCIES += cairo
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+LV2_DEPENDENCIES += libsndfile
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK2),y)
+LV2_DEPENDENCIES += libgtk2
+endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LV2_CONF_OPTS += --no-plugins
+endif
+
+$(eval $(waf-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
