Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFCAC433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 18:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AADD81E50;
	Wed,  2 Nov 2022 18:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AADD81E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HsYzEQb4JaGf; Wed,  2 Nov 2022 18:30:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DB0381E3B;
	Wed,  2 Nov 2022 18:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DB0381E3B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 194CD1BF4DB
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 18:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4F834014E
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 18:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4F834014E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QL2yADRg5LG3 for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 18:30:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 964F6400AF
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 964F6400AF
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 18:30:42 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id 63so15742753iov.8
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 11:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Ss6SFYuBfXAI54kuCd/RB0e3StqkRDUIgw33TCBoYs=;
 b=wppx//PsnFhVsPddfi3DcwnnvzUN4fHv0tkP1fCozznDHk7g/CwRwVbGYV7xeMypvF
 fphjQuaaweLmF9xBhqIXeB0bBz26qjgiWMCZ4H8qR2YdqYCE5KK4jzfdIjnFMwXDEADZ
 mQkJQudnBtJ/yDuYB0tTXqaIFmr2/2KMByDwYfhN1xKneQom+3+u71IMax84BDzQXhUd
 2Vxqxm4MHWUCE0myhe0MPObUXkiKUlO9fI6VbtJjzLJJi2exkCxuhyp6/eayOnSaaU8k
 r2zDK7TPAG37Cw1Gb86WV3H2H+oNz9DelWynk5/j3wGc4hsHN+LXHiHKKn2YbgtONiLb
 hy6w==
X-Gm-Message-State: ACrzQf3Iv0wqIWSv0eXlsSU0SyUO3fVaoNtLWVMMvPRYA9ChDENU45/W
 Fbr7Vf2hMA4/0pBOAJ9x6hHLovNLIcsTDA==
X-Google-Smtp-Source: AMsMyM7nIqdlGzB3jzirjCk65Zb2+LRuT4I2VzLVNSQny3okM08/jhx+tkAqbG79HseNfbJDSqGeoA==
X-Received: by 2002:a05:6638:141:b0:375:6b8a:62b2 with SMTP id
 y1-20020a056638014100b003756b8a62b2mr9103648jao.241.1667413841358; 
 Wed, 02 Nov 2022 11:30:41 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 ca11-20020a0566381c0b00b003711ce0dc15sm5162120jab.68.2022.11.02.11.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:30:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 12:30:39 -0600
Message-Id: <20221102183039.1002807-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6Ss6SFYuBfXAI54kuCd/RB0e3StqkRDUIgw33TCBoYs=;
 b=RDEw1kszai7T+v4bMS6vU0EQxha4L2kKU0lGynghZBdPIYhttykfbt99ZS+GNEK2Lb
 b5PTpYVfd3g2wpBtfMMx3YHdlgYQ45yIsJYFbp65vIDvFbCWSw17jqtweNWjyBiTCEa9
 XCO3hIBgNySeZzgg7KQ16+dnJ7i5kkK8EdGrzqm042zVB34mMOk2vpwftGqXWOhs6uop
 EJLZY5o8Qm2Ap0mFbz6dN7EpLH0P387NJaaekp9HCFC5jsfcjL1zP6abfjotI+1KGAQK
 NCAvhIncby0dnGKcRsnjcWcnqrmepB4/w3v1iQ5XFUNucqqi4RU3aBtyVa3KowaiuO2t
 NDvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RDEw1ksz
Subject: [Buildroot] [PATCH 1/1] package/python-bcrypt: bump to version 4.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace cffi based backend with pyo3 setuptools-rust based backend.

Propagate rust reverse dependency comment.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bcrypt/Config.in          |  2 +-
 package/python-bcrypt/python-bcrypt.hash |  5 ++---
 package/python-bcrypt/python-bcrypt.mk   | 17 ++++++++++++++---
 package/python-paramiko/Config.in        |  2 +-
 package/python-twisted/Config.in         |  2 +-
 5 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/package/python-bcrypt/Config.in b/package/python-bcrypt/Config.in
index 9e9864e9d2..67800df3e1 100644
--- a/package/python-bcrypt/Config.in
+++ b/package/python-bcrypt/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_BCRYPT
 	bool "python-bcrypt"
-	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	help
 	  Modern password hashing for your software and your servers.
 
diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index b1970d8684..e148078699 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,5 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/bcrypt/json
-md5  fe31390dab603728f756cd3d6830c80a  bcrypt-3.2.0.tar.gz
-sha256  5b93c1726e50a93a033c36e5ca7fdcd29a5c7395af50a6892f5d9e7c6cfbfb29  bcrypt-3.2.0.tar.gz
+# Locally calculated after vendoring
+sha256  d64daee0af1afe137718674e67a49b8bb791842aab265b588a6d68d44a449c70  bcrypt-4.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index ad770cc974..cbd6855d9c 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -4,12 +4,23 @@
 #
 ################################################################################
 
-PYTHON_BCRYPT_VERSION = 3.2.0
+PYTHON_BCRYPT_VERSION = 4.0.1
 PYTHON_BCRYPT_SOURCE = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
-PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/d8/ba/21c475ead997ee21502d30f76fd93ad8d5858d19a3fad7cd153de698c4dd
+PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/8c/ae/3af7d006aacf513975fd1948a6b4d6f8b4a307f8a244e1a3d3774b297aad
 PYTHON_BCRYPT_SETUP_TYPE = setuptools
 PYTHON_BCRYPT_LICENSE = Apache-2.0
 PYTHON_BCRYPT_LICENSE_FILES = LICENSE
-PYTHON_BCRYPT_DEPENDENCIES = host-python-cffi
+PYTHON_BCRYPT_DEPENDENCIES = \
+	host-python-setuptools-rust \
+	host-rustc
+PYTHON_BCRYPT_ENV = \
+	$(PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+# We need to vendor the Cargo crates at download time
+PYTHON_BCRYPT_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_BCRYPT_DOWNLOAD_DEPENDENCIES = host-rustc
+PYTHON_BCRYPT_DL_ENV = \
+	$(PKG_CARGO_ENV) \
+	BR_CARGO_MANIFEST_PATH=src/_bcrypt/Cargo.toml
 
 $(eval $(python-package))
diff --git a/package/python-paramiko/Config.in b/package/python-paramiko/Config.in
index a07af19a4b..aee658c790 100644
--- a/package/python-paramiko/Config.in
+++ b/package/python-paramiko/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PARAMIKO
 	bool "python-paramiko"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography, python-bcrypt
 	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_PYNACL # runtime
diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index c0acf35560..1f3baf57e2 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -31,7 +31,7 @@ config BR2_PACKAGE_PYTHON_TWISTED_TLS
 
 config BR2_PACKAGE_PYTHON_TWISTED_CONCH
 	bool "Conch support"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography, python-bcrypt
 	select BR2_PACKAGE_PYTHON_APPDIRS # runtime
 	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
