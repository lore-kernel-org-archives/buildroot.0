Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0A7C19F2D
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 00:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88E6640C03;
	Sun,  7 Aug 2022 00:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88E6640C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ie3gPeHITJea; Sun,  7 Aug 2022 00:39:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CAB640359;
	Sun,  7 Aug 2022 00:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CAB640359
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 961831BF3A1
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 00:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68B1141835
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 00:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68B1141835
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id awQTubO5n9q8 for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 00:38:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04FEA41725
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04FEA41725
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 00:38:56 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 y10-20020a9d634a000000b006167f7ce0c5so4341039otk.0
 for <buildroot@buildroot.org>; Sat, 06 Aug 2022 17:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=wqQagIJVeqfX5oLueWKBe2nOloUgbd2g3E1s9ncAWw0=;
 b=p792kMP4J15VPIuGRxrYGxnl0ekpnKOZ1w5JtbsPhV0X3btxQ/fMYQioKK1FVoq1oa
 Tu7DEXHP2FvDwdShJW/vDJuY7NIYItLaS3t4cUHhzaULiilaPLGSVKHGlnGqUhP+5f9u
 VZMJnU06nW1VjOVDywKmnFUw/6BKx3UJMjPlJtR55IX9ODZ9jXQ9+UA5DxABplForb7H
 6vZo/KlVJ0o+s4GXhg0kcDYP2LV4dvD5k8CEy9cNi7mM0xtch/Yo7aVvSIai50NMwF3E
 LbLUdf1aMBo2wjzkCPyLUnOcSSAizEUMMbJrnJKln51p4jtezHb939QLxrHXmAxB0WGu
 CNqA==
X-Gm-Message-State: ACgBeo0Q7vJZjXh2ayobq2QpJ82lAkcCoYnyCII6D3PbKfZ9pjPwXyza
 djZcC0iJjvMTAwQMmA70Yj04uT7Jk7g=
X-Google-Smtp-Source: AA6agR5/wL3JqkQQXJhyjc8hONffXDkJomWX2rHEQwqrI6usNbUtMmoKHRSViNaGE548rVjYK5t6RA==
X-Received: by 2002:a05:6830:3985:b0:636:aa59:ea1 with SMTP id
 bs5-20020a056830398500b00636aa590ea1mr3630186otb.44.1659832735382; 
 Sat, 06 Aug 2022 17:38:55 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 j8-20020a9d7f08000000b0061cac699458sm1469298otq.38.2022.08.06.17.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Aug 2022 17:38:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Aug 2022 18:38:30 -0600
Message-Id: <20220807003832.1177015-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220807003832.1177015-1-james.hilliard1@gmail.com>
References: <20220807003832.1177015-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=wqQagIJVeqfX5oLueWKBe2nOloUgbd2g3E1s9ncAWw0=;
 b=NXLI7Aaf6wldV/fO6faHRRHrBGb8giZu3/akrIZej67YT9T5pFK5S2CHH8Y6SUlGg+
 2ICHIAaZGgO5jkJ3l71QH/Ie66/2HPnCzmieNq3Ycv4FtMqCTonmvho7/qkfh9YjGEdp
 730aEh3fAGPsKNtM2LhqOfOIiDn5CVrf9xXDbXeI4k12N/ijEK/zDN3tREyITf+e5b+0
 SvYfsKM7ns+XlPdpBGKtXDaJIj/FKktbapwdB6SPk0zskTnfAIN/Dm2BLcY5HyN/pmKe
 lEZiYVRA2C2WtRWNpxHufhpBvrHdCBLa0FdG3SfLUWtqqOARywB1l+Odt8Li2KLbKya7
 47hg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NXLI7Aaf
Subject: [Buildroot] [PATCH v4 3/5] package/python-cryptography: migrate to
 setuptools-rust infrastructure
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
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We can now significantly simplify the python-cryptography build using
the new setuptools-rust setup type introduced in the python package
infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - rebase
---
 .../python-cryptography.mk                    | 30 +++----------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 28ccc8a65c..73cfa38001 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -7,36 +7,14 @@
 PYTHON_CRYPTOGRAPHY_VERSION = 37.0.4
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
 PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/89/d9/5fcd312d5cce0b4d7ee8b551a0ea99e4ea9db0fdbf6dd455a19042e3370b
-PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
+PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools-rust
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
 PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
-PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
-	host-python-setuptools-rust \
-	host-python-cffi \
-	host-rustc \
-	openssl
-HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
-	host-python-setuptools-rust \
-	host-python-cffi \
-	host-rustc \
-	host-openssl
-PYTHON_CRYPTOGRAPHY_ENV = \
-	$(PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
-HOST_PYTHON_CRYPTOGRAPHY_ENV = \
-	$(HOST_PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
-# We need to vendor the Cargo crates at download time
-PYTHON_CRYPTOGRAPHY_DOWNLOAD_POST_PROCESS = cargo
-PYTHON_CRYPTOGRAPHY_DOWNLOAD_DEPENDENCIES = host-rustc
-PYTHON_CRYPTOGRAPHY_DL_ENV = \
-	$(PKG_CARGO_ENV) \
-	BR_CARGO_MANIFEST_PATH=src/rust/Cargo.toml
-HOST_PYTHON_CRYPTOGRAPHY_DL_ENV = \
-	$(HOST_PKG_CARGO_ENV) \
-	BR_CARGO_MANIFEST_PATH=src/rust/Cargo.toml
+PYTHON_CRYPTOGRAPHY_CARGO_MANIFEST_PATH = src/rust/Cargo.toml
+PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
+HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi host-openssl
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
