Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5846CEF8FF8
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 15:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23EEE607F3;
	Wed,  4 Mar 2026 15:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y6hiJACJheDs; Wed,  4 Mar 2026 15:33:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39CD3607F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772638389;
	bh=t8Z7A8Tn/vc65ZCxoxvRvYcBPXZGubUExbq120t+FXs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pvIaGoObJc/+RG6wdkeTolXDLqPoJA7XqCxtWzrYlC13RnmifsTUkmdpUqYpZQFFY
	 X1L2bcVoFczgr2HBrGu3iDmD4f8jIH2X6tBIK9Pqi/DMVmlVkIvEAsoQ1eD+scEXnH
	 3kYcuHi1Bgvyn0mntEiaPqEAxybXHNqViv/9czJ8eaoHWWzqL/Ow9ec2ryvIPL2At1
	 9gqgAR2NvYludxXO3K/eqi7NVyohoPAzF8Rp3eLwYLB0ICmD2iHYU7clE+HS91+HtD
	 Nr7ztmKzzCLsOJXu947K8gEWM3dADtqsNcLe8zfi3JimzhhOQgVPCeqTrZ1QkhXpin
	 bHvSXJdClkKuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39CD3607F5;
	Wed,  4 Mar 2026 15:33:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71461231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 572BC40450
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8WkGQl737WE for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 15:33:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.142.111.50;
 helo=d.mail.sonic.net; envelope-from=sen@hastings.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E30854044F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E30854044F
Received: from d.mail.sonic.net (d.mail.sonic.net [64.142.111.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E30854044F
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:33:04 +0000 (UTC)
Received: from obsidian.. ([76.137.204.246]) (authenticated bits=0)
 by d.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 624FMhpi001587
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 4 Mar 2026 07:22:44 -0800
From: Sen Hastings <sen@hastings.org>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Mar 2026 07:22:16 -0800
Message-ID: <20260304152217.2784536-2-sen@hastings.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304152217.2784536-1-sen@hastings.org>
References: <20260304152217.2784536-1-sen@hastings.org>
MIME-Version: 1.0
X-Sonic-CAuth: UmFuZG9tSVYkcEpmJ6AdrrIAXjfKCcE/q4JUA4MdpJmHlUMGOPs2LzUDaFzwDYoLwrJ/K/8YupXy30nYdd0f+iTOWMYBCVrG
X-Sonic-ID: C;SOS//d0X8RGRwKIf40Rrfg== M;vE9T/t0X8RGRwKIf40Rrfg==
X-Sonic-Spam-Details: not scanned (too big) by cerberusd
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hastings.org
Subject: [Buildroot] [PATCH 1/2] package/hls_js: added hls.js
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

Signed-off-by: Sen Hastings <sen@hastings.org>
---
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
+F:	package/hls_js/
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
+HLS_JS_VERSION = 1.16.15
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
