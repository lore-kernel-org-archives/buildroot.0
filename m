Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF468C433EF
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 07:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A0F54038D;
	Sun,  1 May 2022 07:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXotpiyaaXl2; Sun,  1 May 2022 07:44:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A613401D5;
	Sun,  1 May 2022 07:44:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 850BE1BF3EF
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 07:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8175C410AE
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 07:44:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kMAR8Ybpmmy0 for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 07:44:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 593A6410A3
 for <buildroot@buildroot.org>; Sun,  1 May 2022 07:44:13 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id z18so13206287iob.5
 for <buildroot@buildroot.org>; Sun, 01 May 2022 00:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YjjJtcq8meXHsBYueUHPojQORDBJPpYhikC+9Wm/jk4=;
 b=pTebZ3+iht8KUQzC6sjvFclh7KViVdcWfPfrnsNk3fK+Rq0Obou77vIkG8BGyy7YlR
 fsRBjTi1y9yQdnZ3oJpsCeLmrkMDHzOUOy5NAGYZogcABcaiIgjzqhgxHPDF693HVndw
 cAiUKsRZcOUPpypHe3Txy1EmlkPO4Tyjv9AqpA1nrKp2PGb59YDb18bRXD8S9gAjJXCv
 ByNz4GlWqU77ogzxH1Se0bTWk23rwog9X8smuYx+ICYpcI+DwS7ybKcTABAjv+0ZIiHk
 SSd/UgJUounSst1ZBsv1o874gbUZdc9R0+ZehGbofjgQXY6X1YVN7WE+933+foEayj01
 hmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YjjJtcq8meXHsBYueUHPojQORDBJPpYhikC+9Wm/jk4=;
 b=Yb3iTdnJsV2ebhCh7RCRJLMonmXDJTdmSQFDL33xQDlnED9nwMmI54ALhDTkLnGDql
 vFZwwxKNlcfYM90b3v0o8uNkLPtfFh+xctIYL6zRdsAjlDM6quzd88FrUmOhlHufeGQA
 76oDTkKA4u/RBexF+O1e2E9XzKLW7lHJ69Dez9NcXbmMZG8E2kTxwBcKXtS/SDeT8Z99
 Oo12W2HvKI7h7w6Oy9OmPftnmP13w09XJ7N+gdgya5WYAk4MFu2RyZezFrCt3I31g5it
 50n6GCjKF7ZdQGdJMNCjsB0DS9GYJKo4SOSAo2tgtN8aMa1XrS3/X0NWmXUbmgsZdwIs
 A3gA==
X-Gm-Message-State: AOAM5321LDu00+vWSYswN7zvMZqm+HKSEnpUppeuFc2muQPfVnGnH3fO
 lNR2rZfjDwUOaOyYNDhjTXoQDNnlsWE=
X-Google-Smtp-Source: ABdhPJzXXmFLL/Lf/XLFimw6NpOMKwInV0btRhGAw0Tcvzm5YpwCE3pRFp8gx6kdC/Wi6tUrPo3Vww==
X-Received: by 2002:a05:6602:2c4c:b0:64f:a897:80cb with SMTP id
 x12-20020a0566022c4c00b0064fa89780cbmr2610455iov.139.1651391051985; 
 Sun, 01 May 2022 00:44:11 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 j18-20020a02a692000000b0032b3a7817b3sm2103377jam.119.2022.05.01.00.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 00:44:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 May 2022 01:44:01 -0600
Message-Id: <20220501074401.1135229-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220501074401.1135229-1-james.hilliard1@gmail.com>
References: <20220501074401.1135229-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/2] package/python-cryptography: migrate to
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index 7714b9ad88..e3fde91c5b 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -7,36 +7,14 @@
 PYTHON_CRYPTOGRAPHY_VERSION = 37.0.1
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
 PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/3d/5f/addb8b91fd356792d28e59a8275fec833323cb28604fb3a497c35d7cf0a3
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
-	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
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
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
