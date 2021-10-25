Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B57EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 09:17:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F313760E75
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 09:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F313760E75
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B12A3403A9;
	Mon, 25 Oct 2021 09:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hMSIh3YWVSXd; Mon, 25 Oct 2021 09:17:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEC8A40271;
	Mon, 25 Oct 2021 09:17:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D04101BF38A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 09:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC34640271
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 09:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id spGv76_hAXel for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 09:17:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DD73401FF
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 09:17:02 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso3225640wmc.1
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 02:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n59ZpNoVaw5gHa3nzmNF0Y2C5jnhq7JfLb6uU6KB7IU=;
 b=iY09VVNl2JcQZlMduWPEOslqXzmdbVTQzBSWNjpOLlG5dTFs0oYzhmvxnpUCq8dVrP
 Xa7CgiZn9PtO06M0p+gN0UYwkmyzuSIY1BIMY0hKgZixMBbUn0I48AGsAdDAY78CM0/T
 tCIS5q17lp8hBzxpfl23TVT7nY2OnvmXe9C4uOBtrVVSxJ5nsTo3Hs4PrNVV1/+XlxLA
 31EDtyLwP8gzHlG3RFLDXp3rxa0yfYNQmzpFBjriz5PbDKHjklJNT014PR4UfHyJFVt6
 AazdzUp4aS5xr5slKzr1AhoCfsmYUHMk47qBkJEPP81XFrPyyvf/ZA0nIBr5qnmYfGa3
 2rdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n59ZpNoVaw5gHa3nzmNF0Y2C5jnhq7JfLb6uU6KB7IU=;
 b=XaDwaoruT5a2fFlWf0y8NdCJXS2CBXHFFB3YBcaIFvep6prgIF+IbxNTH5XH9Tw0lc
 oXgcIJuGvrjscixHLG7kN9dMd6kcKjUXrA8Q2nTY797VckLdSLtGIy23P+lPfNOXQXrC
 trAUUn3RB56i7w//6eeff6V8+Crs3Bw7VuF6nNBpvdmO4Bf2gEfsgcSed8Lm+BhDvTpM
 oOIr8ZHMCOE7IQPzuT4VaEJ503D/t/5SrQJ+3X0ecMDmFxGugQRZzIpXAleIlG6qivkD
 +yF+STWDcdZO+NUKFhd5q4vnWz2+1CbXDT4szgwAiCAHxKT0Po6gpF/29uHf1dGL8geG
 wQaw==
X-Gm-Message-State: AOAM5314KNPe5+PQ2vF2XZBfq31llnrZMOBRek72r08qpIvLqOoKGBOZ
 nw4Ivy5PmmeyjCwz2x5+sZWSSWZXXwk=
X-Google-Smtp-Source: ABdhPJz24MwUcZ9d1tY0Mm5OFH4oJKTm5K7hBJU2VpBCM119ONBQIjzOUOwEJosZmDW8sj4bAegxmg==
X-Received: by 2002:a7b:c413:: with SMTP id k19mr12343950wmi.142.1635153420184; 
 Mon, 25 Oct 2021 02:17:00 -0700 (PDT)
Received: from shrek.dav.id (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116])
 by smtp.gmail.com with ESMTPSA id 12sm6569985wmk.34.2021.10.25.02.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 02:16:59 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 11:16:38 +0200
Message-Id: <20211025091638.4769-1-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018121900.455863-1-johan.oudinet@gmail.com>
References: <20211018121900.455863-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/vis-network: new package
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
Changes v1 -> v2:
  - install CSS file
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/vis-network/Config.in        |  7 +++++++
 package/vis-network/vis-network.hash |  4 ++++
 package/vis-network/vis-network.mk   | 21 +++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/vis-network/Config.in
 create mode 100644 package/vis-network/vis-network.hash
 create mode 100644 package/vis-network/vis-network.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f864f7ef47..1d1b6757e3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1390,6 +1390,7 @@ F:	package/erlang-p1-yconf/
 F:	package/erlang-p1-zlib/
 F:	package/nginx-dav-ext/
 F:	package/vuejs/
+F:	package/vis-network/
 
 N:	John Stile <johns@msli.com>
 F:	package/dhcpcd/
diff --git a/package/Config.in b/package/Config.in
index d40eb9dabc..6e4807aded 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1650,6 +1650,7 @@ endif
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
index 0000000000..349ba1bf26
--- /dev/null
+++ b/package/vis-network/vis-network.mk
@@ -0,0 +1,21 @@
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
+# Install .min.js and .min.css as .js and .css, respectively.
+define VIS_NETWORK_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 -D $(@D)/dist/vis-network.min.js \
+		$(TARGET_DIR)/var/www/vis-network.js
+	$(INSTALL) -m 644 -D $(@D)/dist/dist/vis-network.min.css \
+		$(TARGET_DIR)/var/www/vis-network.css
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
