Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01464EF8FF7
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 15:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3494811B5;
	Wed,  4 Mar 2026 15:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hoAPKVmoFcjs; Wed,  4 Mar 2026 15:33:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACE768117B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772638386;
	bh=D4YcRPu31lrOb8q3X35A3xhU7xzzAGQ0I30tYd6Wo5k=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W4OlB4FcEiWqP7cYsV8CN38iCUpx6k3i7pBM4cYiWBuC0KaS6XXx61KJrpMIHcxrF
	 jLrnvJjaBTHnVDXjfsjSUAKG4QF6OJwVo4vMmwUNYFF3n/rnaQ/vlmNxvuIkeCSH3x
	 siYGCxoqDPIVXSL5ljxSUeoK2i75gw5rpRMsa8h7MGjtG/k1smiSWu5MMfdxPQUIWz
	 /3W0PKg9MOKHhSCkwdQBxQQ0x+oZB9ZPcBsHcJSA41sACmHaH2D9y821tSWbVCJoSf
	 PLdfUsLpb9avrEEYs9/eCO8EyATbma1fJdFRzhR7tvx/S4RaHu0b/n3GA1sG3JLBxp
	 z/jnMyUvpGCIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACE768117B;
	Wed,  4 Mar 2026 15:33:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2FA6231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D435740451
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id px6EcI__wf2d for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 15:33:05 +0000 (UTC)
X-Greylist: delayed 619 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 04 Mar 2026 15:33:04 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E316C40450
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E316C40450
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.142.111.50;
 helo=d.mail.sonic.net; envelope-from=sen@hastings.org; receiver=<UNKNOWN> 
Received: from d.mail.sonic.net (d.mail.sonic.net [64.142.111.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E316C40450
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:33:04 +0000 (UTC)
Received: from obsidian.. ([76.137.204.246]) (authenticated bits=0)
 by d.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 624FMhpm001587
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 4 Mar 2026 07:22:44 -0800
From: Sen Hastings <sen@hastings.org>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Mar 2026 07:22:17 -0800
Message-ID: <20260304152217.2784536-3-sen@hastings.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304152217.2784536-1-sen@hastings.org>
References: <20260304152217.2784536-1-sen@hastings.org>
MIME-Version: 1.0
X-Sonic-CAuth: UmFuZG9tSVbSG9qt0dYk0lsGZpOq4wABqV22Ze7+NR+Cqfe92Q7pIZ6Q9gmIc+StjLN3Yx1hXG43pKQpyl1rSJJK+QrhckEO
X-Sonic-ID: C;SOS//d0X8RGRwKIf40Rrfg== M;UHJ0/t0X8RGRwKIf40Rrfg==
X-Sonic-Spam-Details: not scanned (too big) by cerberusd
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hastings.org
Subject: [Buildroot] [PATCH 2/2] package/mediamtx: add mediamtx
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
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/mediamtx/Config.in     |  9 +++++++++
 package/mediamtx/mediamtx.hash |  3 +++
 package/mediamtx/mediamtx.mk   | 20 ++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/mediamtx/Config.in
 create mode 100644 package/mediamtx/mediamtx.hash
 create mode 100644 package/mediamtx/mediamtx.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7bf3ff687b..f92c6f43ee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3011,6 +3011,7 @@ F:	package/mpir/
 N:	Sen Hastings <sen@hastings.org>
 F:	package/systemd
 F:	package/hls_js
+F:	package/mediamtx/
 F:	support/scripts/pkg-stats
 
 N:	Sergey Bobrenok <bobrofon@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 0140fdf009..cd43e62061 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2509,6 +2509,7 @@ endif
 	source "package/lrzsz/Config.in"
 	source "package/lynx/Config.in"
 	source "package/macchanger/Config.in"
+        source "package/mediamtx/Config.in"
 	source "package/memcached/Config.in"
 	source "package/mii-diag/Config.in"
 	source "package/mini-snmpd/Config.in"
diff --git a/package/mediamtx/Config.in b/package/mediamtx/Config.in
new file mode 100644
index 0000000000..88abf6a1bf
--- /dev/null
+++ b/package/mediamtx/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MEDIAMTX
+	bool "mediamtx"
+	select BR2_HOST_PACKAGE_HLS_JS
+	help
+	  MediaMTX is a ready-to-use and zero-dependency real-time
+	  media server and media proxy that allows to publish, read,
+	  proxy, record and playback video and audio streams.
+
+	  https://github.com/bluenviron/mediamtx
diff --git a/package/mediamtx/mediamtx.hash b/package/mediamtx/mediamtx.hash
new file mode 100644
index 0000000000..37bb176212
--- /dev/null
+++ b/package/mediamtx/mediamtx.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha512  e27624d0b25ea12f09fd30c700ee5ca326d9ec22ad01b784a727baae828b5d5b8027faaf2f561da8f629bd132594871e317955b257d4ef348f3b209eb69be684  mediamtx-1.16.3-go2.tar.gz
+sha512  5bba74ecb8d8a66e01e7b0ff3fa7e89d8c3b2d08f8275804e5ff10b05b8d7aa7bf21d3f7279222170807f6c40bad2edbe579df0324c7b50261f23616fcd2eae4  LICENSE
diff --git a/package/mediamtx/mediamtx.mk b/package/mediamtx/mediamtx.mk
new file mode 100644
index 0000000000..896d136348
--- /dev/null
+++ b/package/mediamtx/mediamtx.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# mediamtx
+#
+################################################################################
+
+MEDIAMTX_VERSION = 1.16.3
+MEDIAMTX_SITE = $(call github,bluenviron,mediamtx,v$(MEDIAMTX_VERSION))
+MEDIAMTX_DEPENDENCIES = host-hls_js
+MEDIAMTX_LICENSE = MIT
+MEDIAMTX_LICENSE_FILES = LICENSE
+
+define MEDIAMTX_CONFIGURE_CMDS
+	cp $(BUILD_DIR)/host-hls_js-$(HLS_JS_VERSION)/hls.min.js $(@D)/internal/servers/hls
+	echo "v$(MEDIAMTX_VERSION)" >> $(@D)/internal/core/VERSION
+	mkdir -p  $(TARGET_DIR)/etc/mediamtx/
+	cp $(@D)/mediamtx.yml $(TARGET_DIR)/etc/mediamtx/
+endef
+
+$(eval $(golang-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
