Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C58FC4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 01:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C52B60E7B;
	Tue, 13 Dec 2022 01:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C52B60E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uukKqOsUgAIF; Tue, 13 Dec 2022 01:50:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E71A60E78;
	Tue, 13 Dec 2022 01:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E71A60E78
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A11721BF2FB
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 01:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89960405FA
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 01:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89960405FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jR-UvUUg7V9 for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 01:50:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58BA0400DD
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58BA0400DD
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 01:50:18 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id q190so1001298iod.10
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 17:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iHcXGlmv2js8UErSUqQp3nDRNO7kl7sUrdNYpXEhb5o=;
 b=p/lMQxDoKiVY59nofOEKeB9D6jHLypv8GD435CCsdF7QBKB8zY6+JwTW4HEwC/JNHE
 2bx+fxR5pgXpbqD1L512nKag/D6sOGKTYgvrbA+0dSuRunoy+bAvNUBFMzAYu07icNfb
 jrj+Xoj9QLfb2sksQSm6aq4K3OUFyiHMwpSQaQ8S7TDiJBTSoqwWTzCRkVmU6ba6gc24
 l0h+8nOf1SEZ0ObAY/TJT194agYH6zdeFrzSebUUqFfACaFYj9Fyj5Yp01y76doFf6Lk
 VvMbCT3LtDkZTn2WEdObSwEbNKDNHT9tRB98RPGwL+EwiIkJPO8BsVcF4jTyxO1PResD
 BTVQ==
X-Gm-Message-State: ANoB5plr3bT0Pyx3a8ir3B53XFoAMHgKqgduzRJmQr57qxCivkeo211X
 NnXb9AL+JFo8cDPoJc3TyB5CgHYplJeTFQ==
X-Google-Smtp-Source: AA0mqf5sGLPyqKxAnJHclp6d/PV71DOxQcWWkICNiL0ZMgBsuQaQARE2qBo9qOUv7I2CVDOGzhKWmg==
X-Received: by 2002:a6b:8b55:0:b0:6e0:2521:8123 with SMTP id
 n82-20020a6b8b55000000b006e025218123mr10738996iod.13.1670896216991; 
 Mon, 12 Dec 2022 17:50:16 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y18-20020a027312000000b003760a908bfasm413354jab.169.2022.12.12.17.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 17:50:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 18:49:56 -0700
Message-Id: <20221213015001.4175808-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213015001.4175808-1-james.hilliard1@gmail.com>
References: <20221213015001.4175808-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iHcXGlmv2js8UErSUqQp3nDRNO7kl7sUrdNYpXEhb5o=;
 b=pP5zSsZJJWRMTlnCTvhjwQhScZFZVHY99XUHu+96+Uk94bOAgn1XeXYCQTFeezhpia
 NIB1IE077ZbwUxjNO28GFkx8a3sDxkRnRjDSHunaVNIvymenzf5YrgHJXTVDCdzHtrUv
 +4ezBAMNHeRjcqcyMY6rBslJuS9DwaoNlFy3vK7yoc0u1het/lBsq0mbLTXoSIzFyKGd
 yAk3FkTZuKgSvBDrTfXPeWkMvYTOhEU+tF1sB0Kf5flTHSZAA2T0KyVrDX9CJoaNRXl7
 VvD2kskOehRzPbyWt5jbbaNO/yz+3wsRw8oB/IRBS9fp9HhgxFsmAHbdshfc/S2bZVIH
 lP7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pP5zSsZJ
Subject: [Buildroot] [PATCH 2/7] package/python-sniffio: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-sniffio/Config.in           |  6 ++++++
 package/python-sniffio/python-sniffio.hash |  7 +++++++
 package/python-sniffio/python-sniffio.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-sniffio/Config.in
 create mode 100644 package/python-sniffio/python-sniffio.hash
 create mode 100644 package/python-sniffio/python-sniffio.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4a4d7ffdcb..dc3d012de7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1391,6 +1391,7 @@ F:	package/python-pypa-build/
 F:	package/python-pyphen/
 F:	package/python-rtoml/
 F:	package/python-snappy/
+F:	package/python-sniffio/
 F:	package/python-sockjs/
 F:	package/python-terminaltables/
 F:	package/python-tinycss2/
diff --git a/package/Config.in b/package/Config.in
index facd38dd1e..aa8825d3e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1276,6 +1276,7 @@ menu "External python modules"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-smmap2/Config.in"
 	source "package/python-snappy/Config.in"
+	source "package/python-sniffio/Config.in"
 	source "package/python-socketio/Config.in"
 	source "package/python-sockjs/Config.in"
 	source "package/python-sortedcontainers/Config.in"
diff --git a/package/python-sniffio/Config.in b/package/python-sniffio/Config.in
new file mode 100644
index 0000000000..6f3947afe6
--- /dev/null
+++ b/package/python-sniffio/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_SNIFFIO
+	bool "python-sniffio"
+	help
+	  Sniff out which async library your code is running under.
+
+	  https://github.com/python-trio/sniffio
diff --git a/package/python-sniffio/python-sniffio.hash b/package/python-sniffio/python-sniffio.hash
new file mode 100644
index 0000000000..00af7c58bb
--- /dev/null
+++ b/package/python-sniffio/python-sniffio.hash
@@ -0,0 +1,7 @@
+# md5, sha256 from https://pypi.org/pypi/sniffio/json
+md5  abb96bcda81817d6c632915c53ac29c8  sniffio-1.3.0.tar.gz
+sha256  e60305c5e5d314f5389259b7f22aaa33d8f7dee49763119234af3755c55b9101  sniffio-1.3.0.tar.gz
+# Locally computed sha256 checksums
+sha256  652c878488d1456361e08c3f8607fd7ba59892a14103d15cce4ff93c85b5cc8b  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
+sha256  3e6dae555eb92787fc82d1d48355677f454c7f65aeb38d3f9e72bf9a3daf034b  LICENSE.MIT
diff --git a/package/python-sniffio/python-sniffio.mk b/package/python-sniffio/python-sniffio.mk
new file mode 100644
index 0000000000..fa369a0e2f
--- /dev/null
+++ b/package/python-sniffio/python-sniffio.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-sniffio
+#
+################################################################################
+
+PYTHON_SNIFFIO_VERSION = 1.3.0
+PYTHON_SNIFFIO_SOURCE = sniffio-$(PYTHON_SNIFFIO_VERSION).tar.gz
+PYTHON_SNIFFIO_SITE = https://files.pythonhosted.org/packages/cd/50/d49c388cae4ec10e8109b1b833fd265511840706808576df3ada99ecb0ac
+PYTHON_SNIFFIO_SETUP_TYPE = setuptools
+PYTHON_SNIFFIO_LICENSE = Apache-2.0 or MIT
+PYTHON_SNIFFIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
