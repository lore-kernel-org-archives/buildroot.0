Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEE7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 08:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DE9A83EFE;
	Sun, 24 Jul 2022 08:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DE9A83EFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t4YOQId-8cdc; Sun, 24 Jul 2022 08:29:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 872C483EF0;
	Sun, 24 Jul 2022 08:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 872C483EF0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92E551BF35F
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B35341696
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B35341696
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r8uLXjnUY7oS for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 08:29:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4494640025
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4494640025
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 08:29:35 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1013ecaf7e0so11217425fac.13
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 01:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U8TAIRNGkNGTHjDjpqs583y2hm86OJqQD55tfBBmV58=;
 b=Azn8LbjCqTigKqnjBWhCSZ1GSSI8p0mXat9MPCkPpz8LlxBmKg1vyGP3woxv/GxojS
 MtfTsgdPpUTLZZ9CKEmlGcuBdBTLE4GH6kp1U7Zs8SQF9zuUoGWYZ4uFSrQssxVk87Ly
 xrHrcMsHGQTvblpF1tpZl8Om0Y5mktG3ljDmLLiWzaCE6TZ+fGig9rW6WVKkwJwqEA/E
 7rUD2v0W40gkeJ71ko4rTB0qbXouNxzozdDHfLUWyeu+uy9WSD9zhs3OuwsxAkKeJQPg
 q++0vxplPMbZtstbJA3y+tKxEJlclod7Pas6ACAGkgmRlT63wDAh8YgTZMGn4m974oQs
 QuZw==
X-Gm-Message-State: AJIora8IzMJSixgubUz6HFDrXCtRjpeZQjS1RNyGms6WmsoJPLs9Esc7
 lxyBbwTjJarsQKYObOmi24I45UPFJI15Hg==
X-Google-Smtp-Source: AGRyM1uvs89pPqsUzYQ1Ew8oxwzcpp+j5tAEeNpg8rZwe6JojRxfCbWcU3gc2wfPhGP+Rr4ZRylq+Q==
X-Received: by 2002:a05:6870:348d:b0:10d:f499:93cb with SMTP id
 n13-20020a056870348d00b0010df49993cbmr2259953oah.224.1658651374110; 
 Sun, 24 Jul 2022 01:29:34 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 j29-20020a056870169d00b000f5e89a9c60sm4398964oae.3.2022.07.24.01.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 01:29:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:29:28 -0600
Message-Id: <20220724082928.196217-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U8TAIRNGkNGTHjDjpqs583y2hm86OJqQD55tfBBmV58=;
 b=KQjMeynlXZ++WBD/2Kgc5Sl4dVk6Al3F6KzOEkMtYZEVkxsquKrcT7UoLkPFpXeloJ
 iGR+ydG7lJpvR2zRKTi56FoiShe1WyFqNz0ASHFecDFMueVdQGUUwKz6Gb0PoCf/7k+c
 plWEx6ZXCsNlVJy+WfdgPiCgHYZz9kM57vz4ZWR//SwIy+PnhZmrFtpPFj82uAdzKnHa
 pofBnmcxiTJm7ViicOoxxCk+IAEuKqczeVAc6OAIS9W5dfa0REFcZNTsXvkSwuAF/DGC
 TyD19YrJa7/AM0I8GeJccoRVEoikfaaWQecVykwdKwcak30hJntt16fc6zVa9BbeSqtH
 7Pvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KQjMeynl
Subject: [Buildroot] [PATCH v5 1/1] package/python-orjson: bump to version
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
Changes v4 -> v5:
  - rebase
Changes v3 -> v4:
  - update to 3.7.7
---
 package/python-orjson/python-orjson.hash |  5 +++--
 package/python-orjson/python-orjson.mk   | 24 ++++++++++++------------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 2c00164702..dd511fd8fc 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,4 +1,5 @@
-# Locally calculated
-sha256  2b0259ff26455c4f9ad2290b49ba184a35e98eea4839f0d6d5c2b7d91383b3d9  python-orjson-3.6.8.tar.gz
+# Locally calculated after vendoring
+sha256  ffd677a941c08c9a6cbaf3f49dba12b353833e8028b70e76cd1091b39e096de0  orjson-3.7.7.tar.gz
+# Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index cfcaedc280..e0071fa390 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,19 +4,19 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.6.8
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
