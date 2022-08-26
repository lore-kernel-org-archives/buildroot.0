Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8548FECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2507040D93;
	Fri, 26 Aug 2022 13:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2507040D93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 45roYeRoglFZ; Fri, 26 Aug 2022 13:10:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDEFE404BB;
	Fri, 26 Aug 2022 13:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDEFE404BB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E49C1BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4667660B02
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4667660B02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xaGAQXLrTx_C for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:10:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 231706079D
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 231706079D
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:10:03 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id bq11so1741062wrb.12
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=krciRS+EzEnncXP8kMjylNq1sU2ShK3n6PB9tNn8yxU=;
 b=LBlG+JzXG6+G/4xQVVxxEiWfA3fFzHd19hNZC1qcyhG+xoGqK1i/Nr1hbWMf7G/92O
 Bd8MngP002YQYdTFy094q+CT3sLB5E/vGE1i/T5NXv0cqiDGkFuRijvERZICTTc/YsUI
 roTrZbrM62VVXAEv8WMAaUPabUOT2QcOj/4oBUqgGYOG9338pHZqhLp4ioUGLUa/qvfX
 0zWa4usM+do2CcKbJvt4lz+8VwfNsG4A269Y8fuCvgr1H9MPuf6tgZuCFv+Hm13I9uyq
 BoFFEFWc+0EtjEcLGOjD3QF59ny3eQcCzIweMA2Hrf2+CYZCmZcWgXgrIM/WrW8iAai9
 wlWg==
X-Gm-Message-State: ACgBeo2bvxwkBV7xI3BJm5AbQChtWYtHRBoQL0wCbSAQ+N4LWTPIALZp
 ey4l05JsdCsS9I2SStpqKfjcLJDdBrY=
X-Google-Smtp-Source: AA6agR5vzAQUHeD8O4rg69VomGI+Xim1paomqyZ8FnDS6FiYFny9B525UR+JquM12y7KKXgfMHpq7A==
X-Received: by 2002:a05:6000:1011:b0:225:598c:d8a8 with SMTP id
 a17-20020a056000101100b00225598cd8a8mr4767120wrx.485.1661519400868; 
 Fri, 26 Aug 2022 06:10:00 -0700 (PDT)
Received: from shrek.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 t2-20020adfe102000000b0022063e5228bsm1840980wrz.93.2022.08.26.06.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:10:00 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:08:43 +0200
Message-Id: <20220826130843.264607-1-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220322160725.636205-1-johan.oudinet@gmail.com>
References: <20220322160725.636205-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=krciRS+EzEnncXP8kMjylNq1sU2ShK3n6PB9tNn8yxU=;
 b=VPUnjjR2yeq61Z5r3JKBuepk8CnJX20Yz26uGq6a9YgeqWExqbdCbTDJon9dvsi26K
 gmxzdHVnDw10FVViW0xLDqiRTVq6cUr0PniLxJAtVIL27CHUQYxuvvlrpWx+Vrw07+GT
 hCSC3MK+2rMd1x1VhWeL6E+0/zZLtNjM6B3+DecxHrELCLUWk2NKB4niZde1dNAyzhDf
 QmhrrlaXLSTNi+NmRLu9zIjkj5KiwHO28BIMS21Q1AxF54r3wUpm8jWYyIRD/Ox1xdKo
 /rTHQAhj2MDK/b752S6imwZv6hRr+RUqo7agFFl0w117C/VNb2Ws9BO6m3OG8GFzWmQ2
 GURQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VPUnjjR2
Subject: [Buildroot] [PATCH v2] package/forge: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A native implementation of TLS (and various other cryptographic tools)
in JavaScript.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
Changes v1 -> v2:
 - build with npm (suggested by Yann E. Morin)
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/forge/Config.in  | 10 ++++++++++
 package/forge/forge.hash |  3 +++
 package/forge/forge.mk   | 28 ++++++++++++++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 package/forge/Config.in
 create mode 100644 package/forge/forge.hash
 create mode 100644 package/forge/forge.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a..c7e6407cdc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1530,6 +1530,7 @@ F:	package/erlang-p1-xmpp/
 F:	package/erlang-p1-yaml/
 F:	package/erlang-p1-yconf/
 F:	package/erlang-p1-zlib/
+F:	package/forge/
 F:	package/nginx-dav-ext/
 F:	package/vis-network/
 F:	package/vuejs/
diff --git a/package/Config.in b/package/Config.in
index d1c098c48f..c073c82611 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1687,6 +1687,7 @@ endif
 	source "package/duktape/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
+	source "package/forge/Config.in"
 	source "package/jquery/Config.in"
 if BR2_PACKAGE_JQUERY
 menu "External jQuery plugins"
diff --git a/package/forge/Config.in b/package/forge/Config.in
new file mode 100644
index 0000000000..87a3fcb3e0
--- /dev/null
+++ b/package/forge/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_FORGE
+	bool "forge"
+	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS # host-nodejs
+	depends on BR2_HOST_GCC_AT_LEAST_8 # host-nodejs
+	select BR2_PACKAGE_HOST_NODEJS
+	help
+	  A native implementation of TLS (and various other
+	  cryptographic tools) in JavaScript.
+
+	  https://github.com/digitalbazaar/forge
diff --git a/package/forge/forge.hash b/package/forge/forge.hash
new file mode 100644
index 0000000000..3f73d3e050
--- /dev/null
+++ b/package/forge/forge.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  b330b05ef109a00fc96ae188a3a9ac6c9053a511957a5c9534f7635fefee45a2  forge-1.3.1.tar.gz
+sha256  f63ff0e4e239244aa79280da2dd4811a0469e5e201caf5cbc0d97c3a1dff8e82  LICENSE
diff --git a/package/forge/forge.mk b/package/forge/forge.mk
new file mode 100644
index 0000000000..c26f550c83
--- /dev/null
+++ b/package/forge/forge.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# forge
+#
+################################################################################
+
+FORGE_VERSION = 1.3.1
+FORGE_SITE = $(call github,digitalbazaar,forge,v$(FORGE_VERSION))
+FORGE_LICENSE = BSD-3-Clause, GPL-2.0
+FORGE_LICENSE_FILES = LICENSE
+
+FORGE_DEPENDENCIES = host-nodejs
+
+define FORGE_BUILD_CMDS
+	cd $(@D) && $(NPM) install && $(NPM) run build
+endef
+
+# Install .min.js as .js
+define FORGE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 -D $(@D)/dist/forge.all.min.js \
+		$(TARGET_DIR)/var/www/forge.all.js
+	$(INSTALL) -m 644 -D $(@D)/dist/forge.min.js \
+		$(TARGET_DIR)/var/www/forge.js
+	$(INSTALL) -m 644 -D $(@D)/dist/prime.worker.min.js \
+		$(TARGET_DIR)/var/www/prime.worker.js
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
