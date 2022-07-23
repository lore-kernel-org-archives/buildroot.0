Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC6EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 23:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15D9384BC8;
	Sat, 23 Jul 2022 23:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15D9384BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BiFjsbQnGH71; Sat, 23 Jul 2022 23:04:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34FF584987;
	Sat, 23 Jul 2022 23:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34FF584987
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4DFC1BF3AD
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 23:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9ADCC41847
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 23:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ADCC41847
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L6a-BOEQGTfP for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 23:04:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AA7341855
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AA7341855
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 23:04:12 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id h14so3924194ilq.12
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yG+e3eFVsylVG9kHGJizCd+aDgrUSctWTFaEYjMEmNo=;
 b=YQZqLbwvqwnsVnnlqwD9r6h64EUmIWT8z7u+vvmEsiRowyexMZ6IJFaleSOP9wKW8E
 dGlF1shOaOs6uq08rCKPb3fX/DWfeHbpBAT7poujBnj6l9hWpf/jKMstl3wW61CQxkYg
 ZsipfU8c9CkA6q+PkVYKFTnu0dpyYuYQzNTTE6sTHLqLEQLCjck85xUqG3rCYRuBmE9J
 Z+c/0kfhkDdOwIpeF4dGhznAO9TA6P5bGqXnLzw9hwh7VRzsUAGdANTHf7+n1uLAnoTI
 Q4/qCviKeTWi7j+1nXZXxuln3FLQdHIlN6CMIpdJAkGrPhUVeRMuBFR4GA7k8pmDuFal
 49XQ==
X-Gm-Message-State: AJIora8JpZW50YXEYCzig3teWfeYBbzmEA0ab3aOTc5YkwzXpQca/kQ4
 2umqudlcNzeIdhxWiocfpO7FRWsvg5GVTQ==
X-Google-Smtp-Source: AGRyM1vqTD0FvPyfwVG2rl3I3MEo5rOkYGNBm0Kta5UWcRARC8KKUEeDkjMRfJS3lI2aeW0HScU3GA==
X-Received: by 2002:a05:6e02:1e0b:b0:2dd:1065:30f1 with SMTP id
 g11-20020a056e021e0b00b002dd106530f1mr2255325ila.87.1658617451078; 
 Sat, 23 Jul 2022 16:04:11 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 f10-20020a056602088a00b0067c05df65aasm3993257ioz.15.2022.07.23.16.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 16:04:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 17:04:00 -0600
Message-Id: <20220723230400.362946-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220723230400.362946-1-james.hilliard1@gmail.com>
References: <20220723230400.362946-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yG+e3eFVsylVG9kHGJizCd+aDgrUSctWTFaEYjMEmNo=;
 b=o5zyTnsA+69N2+Svdjxtl0x+/VbTPe54tsQBJPhhgCcicqr6AQZJenWXdtHX0MyjWn
 DitON2V6T4w6bUFLUFVgyAtmnjicYHIOj+IkwE+7YV+0EKDkFAyVU9fAIyOHq8606TN5
 OMSQxHOo9Fz7iY2EQCyFoez4/LeR+jqcB/0lJ6W6FAoVwa9fWNwHCjsYuv/AbIXGapxo
 CDK8xJEaJYqGQS7IHV9CkrOyaYycUNt5mZf4TR9naPvGofTbZOM1I9L4edRFHIFiyKZE
 lBaBg9dsacQMfbuPQcqHS90ATiUweqaY+9rzEq76kksWje5dWbLLDrqOoLaAOc9yV5SZ
 ldag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=o5zyTnsA
Subject: [Buildroot] [PATCH v4 2/2] package/python-orjson: bump to version
 3.7.7
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
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Convert package to use python infrastructure instead of cargo
infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
Changes v3 -> v4:
  - update to 3.7.7
---
 package/python-orjson/python-orjson.hash |  5 +++--
 package/python-orjson/python-orjson.mk   | 24 ++++++++++++------------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 5ef2726d82..dd511fd8fc 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,4 +1,5 @@
-# Locally calculated
-sha256  4713b120ad86b1b273f5952cbf9578c13d0f453064bd26d823e04a10c84824e6  python-orjson-3.6.7.tar.gz
+# Locally calculated after vendoring
+sha256  ffd677a941c08c9a6cbaf3f49dba12b353833e8028b70e76cd1091b39e096de0  orjson-3.7.7.tar.gz
+# Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 5de4b2c5fa..e0071fa390 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,19 +4,19 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.6.7
-PYTHON_ORJSON_SITE = $(call github,ijl,orjson,$(PYTHON_ORJSON_VERSION))
+PYTHON_ORJSON_VERSION = 3.7.7
+PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
+PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/8a/68/47bc5e624431d77445f06a2d3ba32777fda650f05a2f803ea1dc2b07b65a
+PYTHON_ORJSON_SETUP_TYPE = pep517
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-PYTHON_ORJSON_DEPENDENCIES = host-python-cffi
-PYTHON_ORJSON_CARGO_ENV = \
+PYTHON_ORJSON_DEPENDENCIES = host-python-cffi host-python-maturin
+PYTHON_ORJSON_ENV = \
+	$(PKG_CARGO_ENV) \
 	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+# We need to vendor the Cargo crates at download time
+PYTHON_ORJSON_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_ORJSON_DOWNLOAD_DEPENDENCIES = host-rustc
+PYTHON_ORJSON_DL_ENV = $(PKG_CARGO_ENV)
 
-# orjson uses "maturin" to generate distribution packages - rather than teach
-# buildroot how to understand this, we reach in and install directly.
-define PYTHON_ORJSON_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/target/$(RUSTC_TARGET_NAME)/release/liborjson.so \
-		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/orjson.so
-endef
-
-$(eval $(cargo-package))
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
