Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1694C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 12:19:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61A9160FDA
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 12:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61A9160FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37BD34034C;
	Mon, 18 Oct 2021 12:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5uXF_4AiJuoq; Mon, 18 Oct 2021 12:19:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 863AA402BD;
	Mon, 18 Oct 2021 12:19:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E8761BF27C
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 12:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B2826089E
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 12:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8xtKJKDF5qkA for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 12:19:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43E4A60811
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 12:19:11 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k7so40823818wrd.13
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 05:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JiiWeBQSVxwo06/XEzITWWn1+JTdlFdgxe9Mk5VHb9I=;
 b=SmpnpOFEOIwg+Rd9BrrN0MvwytMYqfddKkCMph5mEnkh/E1eY1q6yNdBTPK5lGmJ9P
 Tonr58JWFCpyTVIQzmxA5gKK2KZfl9NrXDgu7y9YcQ4HFBYcxacoMauummpIHTMIF9hu
 zJSgmMd1KpAEjERq+809q1iGOQCX1ZcDna+cl+j457dQ64UvYiu/OkT+uC6FpJ3JnQSU
 UAFGCHNeq5jk+4BIUJfuARFACatoPFL8O/AmIQY+vFFoFaBzPGYmysqwhcs+DWw24fQy
 XD5R0VB1jVQelAm7WOhKjtcqdS/JUZkH7T8JOEK8583h+YMzBvqukB/X/8l6bU48To5l
 ptTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JiiWeBQSVxwo06/XEzITWWn1+JTdlFdgxe9Mk5VHb9I=;
 b=i6xm3qn9vETgV2xYE/heLgZbbcAvSO3fnN0DwoIt6sIVWmeRN6/Z5bQ/I6/0YWRHAR
 i+CBesZHNfzD/V4YqTcWJrTsjpxUoHRWJ/wWXckyCvKykpS6Biy/2Bm3hXEd5c9D982O
 mOGuR/SV+uaTpOh/xMLYd3gdi2xvRhhxRlclmY1aAyWb4zyYx0pc5LrqYgNujIBdfzsz
 +CVBaqITkhbtHmDrDMmc6GF6uv1NCsSq33L9v1gcP4a5eFmld5KbdTHGjPCr111EhvaG
 kJzk7wHvKHCI4Z61vs5WYp9c2i0JQ6QwsHyOPZlyZYuHyrt0HHMloqKAO8NqkdDz3z+M
 qO7A==
X-Gm-Message-State: AOAM530N/yeqUi93CIbCQk3eWeSU1gHZk3JBkRwp5hOqHvigLJQINJ9B
 s1z+xM8Gp/7T+6jzxog/RSavHipArcc=
X-Google-Smtp-Source: ABdhPJxIeID9VhWn87eDoUPQItrIDnDqemALxJCivhxbuf64SHAJ0Ud5IdSRPo9Wz2DGRc6VguIgYA==
X-Received: by 2002:adf:bb8d:: with SMTP id q13mr35878165wrg.327.1634559548983; 
 Mon, 18 Oct 2021 05:19:08 -0700 (PDT)
Received: from shrek.dav.id (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116])
 by smtp.gmail.com with ESMTPSA id j15sm12470451wrr.8.2021.10.18.05.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 05:19:08 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 14:19:00 +0200
Message-Id: <20211018121900.455863-1-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/vis-network: new package
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/vis-network/Config.in        |  7 +++++++
 package/vis-network/vis-network.hash |  4 ++++
 package/vis-network/vis-network.mk   | 19 +++++++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/vis-network/Config.in
 create mode 100644 package/vis-network/vis-network.hash
 create mode 100644 package/vis-network/vis-network.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 19f6d95270..ebbc960711 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1392,6 +1392,7 @@ F:	package/erlang-p1-yconf/
 F:	package/erlang-p1-zlib/
 F:	package/nginx-dav-ext/
 F:	package/vuejs/
+F:	package/vis-network/
 
 N:	John Stile <johns@msli.com>
 F:	package/dhcpcd/
diff --git a/package/Config.in b/package/Config.in
index 48f365d773..d33cedc665 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1648,6 +1648,7 @@ endif
 	source "package/jszip/Config.in"
 	source "package/openlayers/Config.in"
 	source "package/popperjs/Config.in"
+	source "package/vis-network/Config.in"
 	source "package/vuejs/Config.in"
 if BR2_PACKAGE_VUEJS
 comment "External Vue.js plugins"
diff --git a/package/vis-network/Config.in b/package/vis-network/Config.in
new file mode 100644
index 0000000000..39e8ac54c5
--- /dev/null
+++ b/package/vis-network/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_VIS_NETWORK
+	bool "vis-network"
+	help
+	  Display dynamic, automatically organised, customizable network
+	  views. Network uses HTML canvas for rendering.
+
+	  http://visjs.github.io/vis-network/
diff --git a/package/vis-network/vis-network.hash b/package/vis-network/vis-network.hash
new file mode 100644
index 0000000000..56f141f5f7
--- /dev/null
+++ b/package/vis-network/vis-network.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  a9f7325cbe28147318476c63f09c1d5c894d2239bfa4b4dd2dfb3dbebb0705d3  vis-network-9.1.0.tgz
+sha256  1509904280a272780fd69c04b858f512cf216f8e3464a0dd98d8f34416feced9  LICENSE-APACHE-2.0
+sha256  1f65085e54c036645082257618db2c7b787e68c3b02485e214ecd09e0834ee8f  LICENSE-MIT
diff --git a/package/vis-network/vis-network.mk b/package/vis-network/vis-network.mk
new file mode 100644
index 0000000000..13e8e013be
--- /dev/null
+++ b/package/vis-network/vis-network.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# vis-network
+#
+################################################################################
+
+VIS_NETWORK_VERSION = 9.1.0
+VIS_NETWORK_SOURCE = vis-network-$(VIS_NETWORK_VERSION).tgz
+VIS_NETWORK_SITE = https://registry.npmjs.org/vis-network/-
+VIS_NETWORK_LICENSE = Apache-2.0, MIT
+VIS_NETWORK_LICENSE_FILES = LICENSE-APACHE-2.0 LICENSE-MIT
+
+# Install .min.js as .js
+define VIS_NETWORK_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 -D $(@D)/dist/vis-network.min.js \
+		$(TARGET_DIR)/var/www/vis-network.js
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
