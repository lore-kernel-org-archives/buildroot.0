Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683CAF33A8E
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 15:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05FC681353;
	Thu,  5 Mar 2026 15:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJ6UOA20uAWE; Thu,  5 Mar 2026 15:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C570F81336
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772724142;
	bh=6+xhvb63MHTy/LoWe2xWvx6fG//KSAK6ReZOjuuNSZM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p+U9C1BROSUdHRhJmAroWAtud6OQA2LeLfKg0zawiMsWctGQSVLGJrirkWdZSPTzg
	 kB9B7sYujVqVibIL74TeKqxKjSCGvm42YbRUdP0AynNxg0zV2TCsnv8rPSZz2PMjd0
	 8BKKI/HRWUN560BrGeRyHKPy70S0qksAZQwxkPiSZ2ytqaslJMQKPjdxw7LzfaVytp
	 xIjFMdsjzVZpvQXV07ffHcAchFPCs0qcH+BRVu4wRw4CpGFzTQ3d8yXzMA76jVSsaX
	 8DOEm1Xm6xfn6WcaFhp6GnXNHuRfjH4W+rbCu6jkaFSZ2zP3v5V1BE2wWAxoJkJVmz
	 JCsZqWylU6SBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C570F81336;
	Thu,  5 Mar 2026 15:22:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A5F825B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 15:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BC2B40216
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 15:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62mRJVTznBNz for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 15:22:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.142.111.50;
 helo=d.mail.sonic.net; envelope-from=sen@hastings.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BBD7C40063
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBD7C40063
Received: from d.mail.sonic.net (d.mail.sonic.net [64.142.111.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBD7C40063
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 15:22:20 +0000 (UTC)
Received: from obsidian.. ([76.137.204.246]) (authenticated bits=0)
 by d.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 625FMFJa002058
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 5 Mar 2026 07:22:16 -0800
From: Sen Hastings <sen@hastings.org>
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Mar 2026 07:19:59 -0800
Message-ID: <20260305151958.3274717-2-sen@hastings.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304152217.2784536-2-sen@hastings.org>
References: <20260304152217.2784536-2-sen@hastings.org>
MIME-Version: 1.0
X-Sonic-CAuth: UmFuZG9tSVY8W3aFEOMUYjQiLvXZtBMv8rZ6vREeDIC4OR3MEAPLnHI5q98xI0fDmqWz71Q4k29KqaOPvo7Gfgkf4pDG/H3J
X-Sonic-ID: C;7qCDF6cY8RGiaKIf40Rrfg== M;ULvKF6cY8RGiaKIf40Rrfg==
X-Sonic-Spam-Details: not scanned (too big) by cerberusd
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hastings.org
Subject: [Buildroot] [PATCH v2 1/2] package/hls-js: new package
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

Somehow I bungled the version string, resubmitting.

Signed-off-by: Sen Hastings <sen@hastings.org>
---
Changes v1 -> v2:
  - fixed typo in version string
 DEVELOPERS                    |  1 +
 package/Config.in             |  1 +
 package/hls_js/Config.in      |  7 +++++++
 package/hls_js/Config.in.host |  7 +++++++
 package/hls_js/hls_js.hash    |  3 +++
 package/hls_js/hls_js.mk      | 25 +++++++++++++++++++++++++
 package/hls_js/host-hls_js.mk | 19 +++++++++++++++++++
 7 files changed, 63 insertions(+)
 create mode 100644 package/hls_js/Config.in
 create mode 100644 package/hls_js/Config.in.host
 create mode 100644 package/hls_js/hls_js.hash
 create mode 100644 package/hls_js/hls_js.mk
 create mode 100644 package/hls_js/host-hls_js.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e983ae113..7bf3ff687b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3010,6 +3010,7 @@ F:	package/mpir/
 
 N:	Sen Hastings <sen@hastings.org>
 F:	package/systemd
+F:	package/hls-js
 F:	support/scripts/pkg-stats
 
 N:	Sergey Bobrenok <bobrofon@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 371a1c33e1..0140fdf009 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1928,6 +1928,7 @@ menu "Multimedia"
 	source "package/bento4/Config.in"
 	source "package/bitstream/Config.in"
 	source "package/dav1d/Config.in"
+	source "package/hls_js/Config.in"
 	source "package/kvazaar/Config.in"
 	source "package/libaacs/Config.in"
 	source "package/libass/Config.in"
diff --git a/package/hls_js/Config.in b/package/hls_js/Config.in
new file mode 100644
index 0000000000..b09c1edba3
--- /dev/null
+++ b/package/hls_js/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HLS_JS
+	bool "hls.js"
+	help
+	  HLS.js is a JavaScript library that implements an HTTP
+	  Live Streaming client.
+
+	  https://github.com/video-dev/hls.js
diff --git a/package/hls_js/Config.in.host b/package/hls_js/Config.in.host
new file mode 100644
index 0000000000..6774ca8c11
--- /dev/null
+++ b/package/hls_js/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_HLS_JS
+	bool "hls.js"
+	help
+	  HLS.js is a JavaScript library that implements an HTTP
+	  Live Streaming client.
+
+	  https://github.com/video-dev/hls.js
diff --git a/package/hls_js/hls_js.hash b/package/hls_js/hls_js.hash
new file mode 100644
index 0000000000..b2cc2cf5a7
--- /dev/null
+++ b/package/hls_js/hls_js.hash
@@ -0,0 +1,3 @@
+#locally computed
+sha512  a16800f9ee8413b92a729f61da0b53ef917f474d7d104fb438d35b6e4fdf03610c6b273a6f05ec6cf88c9f4881976e152f1f25fd3a33524ed670167482da98c9  release.zip
+sha512  f6613fb9e2f05874d4302a2468e40b57357c3006fd19d6183025dbe0c2c430daaecb6cb8919b431b0526461952a23364232dc482200dd93da8013ae3a7364718  LICENSE
diff --git a/package/hls_js/hls_js.mk b/package/hls_js/hls_js.mk
new file mode 100644
index 0000000000..620a7ff54d
--- /dev/null
+++ b/package/hls_js/hls_js.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# HLS_JS
+#
+################################################################################
+
+HLS_JS_VERSION = 1.6.15
+HLS_JS_SOURCE = release.zip
+HLS_JS_SITE = https://github.com/video-dev/hls.js/releases/download/v$(HLS_JS_VERSION)
+HLS_JS_LICENSE = APACHE 2.0
+HLS_JS_LICENSE_FILES = LICENSE
+HLS_JS_INSTALL_STAGING = YES
+
+define HLS_JS_EXTRACT_CMDS
+	unzip $(HLS_JS_DL_DIR)/$(HLS_JS_SOURCE) -d $(@D)
+	cp $(@D)/dist/* $(@D)
+endef
+
+define HLS_JS_INSTALL_TARGET_CMDS
+	$(foreach f,$(notdir $(wildcard $(@D)/*.min.js)),
+		$(INSTALL) -m 0644 -D $(@D)/$(f) \
+		$(TARGET_DIR)/var/www/$(f)$(sep))
+endef
+
+$(eval $(generic-package))
diff --git a/package/hls_js/host-hls_js.mk b/package/hls_js/host-hls_js.mk
new file mode 100644
index 0000000000..15ff092960
--- /dev/null
+++ b/package/hls_js/host-hls_js.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# HOST_HLS_JS
+#
+################################################################################
+
+HOST_HLS_JS_VERSION = 1.16.15
+HOST_HLS_JS_SOURCE = release.zip
+HOST_HLS_JS_SITE = https://github.com/video-dev/hls.js/releases/download/v$(HOST_HLS_JS_VERSION)
+HOST_HLS_JS_LICENSE = APACHE 2.0
+HOST_HLS_JS_LICENSE_FILES = LICENSE
+HOST_HLS_JS_INSTALL_STAGING = YES
+
+define HOST_HLS_JS_EXTRACT_CMDS
+	unzip $(HOST_HLS_JS_DL_DIR)/$(HOST_HLS_JS_SOURCE) -d $(@D)
+	cp $(@D)/dist/* $(@D)
+endef
+
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
