Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7A3C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 22:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11226827DE;
	Thu, 28 Apr 2022 22:17:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P3fJG5o68Hx8; Thu, 28 Apr 2022 22:17:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97A1282EA1;
	Thu, 28 Apr 2022 22:17:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C51611BF2B9
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 22:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0BCE4049A
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 22:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NNn4jgqZuP6O for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 22:17:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E22F40004
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 22:17:29 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id f4so8022022iov.2
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 15:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uvZyzJOZEaTivyBGntozJ7qNxaYfDw0atgfs6C5bfB8=;
 b=Cw9xXrAZtBVPlgL90xOZ/708iNpc+zf1wkSfGpYBkZrCr8IN+ej6z85NoZAT3jFQ42
 OwiaYd2aPIRm03J9opBSHSP0nBxVSPD3tflmSKMDESPYFb1p28X31Vf1LLGWSmv84UQ2
 ka/JqKjA/uoAhj/JGluvabQHOryxpt0YtA6ig0oAU4I+DuHFaWbtLBSTqjP7GPMwhwMi
 xmuE0q4SG5aL3sBfPGh0NGXtxDmcyrwO0kQY/xChUAQoHuh1wr90X4qDOhrbO1iV4D1E
 ZsljmTAKTnhXvzUg+L9t73XBt0vSvgiQzUlKDEDmUy3w3R2UHFeVg2jWW3N0RJaOFjV5
 9ZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uvZyzJOZEaTivyBGntozJ7qNxaYfDw0atgfs6C5bfB8=;
 b=zmxGFcb1JbAZH52D8yXWckZ4DYLoNIU8XLgTwLPOgQi73HSvub9YfNtccHPvm31Ufu
 ukQuA9fq8x/eArq0iXYWscEfwHaU78ycCS6VfY0fGg87RxsJJTJScMVJSCbC9x7q9D9G
 7E7nYskR59QPBTvSm/lO/nrS43S6cWGUC8ykN8/58tfSE+1KjUNsNFVdYEu/bJgQy2VG
 DlrDJiww4YiTiqPoGm/gQeskSZI+sX32EZYuLoKuCJXaPNafg/Y/5R6ALPvcjnF73j/d
 rwDuyRbWS2J5BvbIz3keLmCQwEPzzgaygLe5eWEJWG0uvx2K6bQq4idrg9ctP1bCPaeq
 Xlkg==
X-Gm-Message-State: AOAM530zW9J47aJVMabqZQrM0BFgRv3UUgMjwkQm6Bx0mf913JqkysuV
 l2VwbPlHBYYrJmWHmaVAR85l8WOha4I=
X-Google-Smtp-Source: ABdhPJz7EGA1O5F4gvnJ7hGkBPKMcV8nIZu79JaCz1CLlV6NHnWdOtF6nhTnzAdKpwVv35zinXoCQA==
X-Received: by 2002:a05:6638:3493:b0:329:b647:4aa8 with SMTP id
 t19-20020a056638349300b00329b6474aa8mr15392047jal.226.1651184248895; 
 Thu, 28 Apr 2022 15:17:28 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 f15-20020a92b50f000000b002cde6e352e8sm57103ile.50.2022.04.28.15.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 15:17:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 16:17:25 -0600
Message-Id: <20220428221727.1680234-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/3] package/pkg-python: deduplicate common
 env/opts variables
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

There are many varibles shared via setuptools, distutils and pep517,
combine those common env/opts variables to make them easier to
maintain.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - restore accidentially dropped LDSHARED in distutils env
---
 package/pkg-python.mk | 96 +++++++++++++++++++------------------------
 1 file changed, 43 insertions(+), 53 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index e9de5cb8d3..b86e12423f 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -33,78 +33,77 @@ PKG_PYTHON_HOST_PLATFORM = linux-$(PKG_PYTHON_ARCH)
 PKG_PYTHON_SYSCONFIGDATA_PATH = $(PYTHON3_PATH)/_sysconfigdata__linux_*.py
 PKG_PYTHON_SYSCONFIGDATA_NAME = `{ [ -e $(PKG_PYTHON_SYSCONFIGDATA_PATH) ] && basename $(PKG_PYTHON_SYSCONFIGDATA_PATH) .py; } || true`
 
-# Target distutils-based packages
-PKG_PYTHON_DISTUTILS_ENV = \
+# Target python packages
+PKG_PYTHON_ENV = \
+	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
+	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
+	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	PATH=$(BR_PATH) \
 	$(TARGET_CONFIGURE_OPTS) \
-	LDSHARED="$(TARGET_CROSS)gcc -shared" \
 	PYTHONPATH="$(PYTHON3_PATH)" \
 	PYTHONNOUSERSITE=1 \
-	SETUPTOOLS_USE_DISTUTILS=stdlib \
-	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
-	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
-	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
 
+# Host python packages
+HOST_PKG_PYTHON_ENV = \
+	PATH=$(BR_PATH) \
+	PYTHONNOUSERSITE=1 \
+	$(HOST_CONFIGURE_OPTS)
+
+# Target distutils-based packages
+PKG_PYTHON_DISTUTILS_ENV = \
+	$(PKG_PYTHON_ENV) \
+	LDSHARED="$(TARGET_CROSS)gcc -shared" \
+	SETUPTOOLS_USE_DISTUTILS=stdlib \
+
 PKG_PYTHON_DISTUTILS_BUILD_OPTS = \
 	--executable=/usr/bin/python
 
-PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
+PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	--prefix=/usr \
+	--prefix=/usr
+
+PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
+	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
 	--root=$(TARGET_DIR)
 
 PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
-	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	--prefix=/usr \
+	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
 	--root=$(STAGING_DIR)
 
 # Host distutils-based packages
 HOST_PKG_PYTHON_DISTUTILS_ENV = \
-	PATH=$(BR_PATH) \
-	PYTHONNOUSERSITE=1 \
-	SETUPTOOLS_USE_DISTUTILS=stdlib \
-	$(HOST_CONFIGURE_OPTS)
+	$(HOST_PKG_PYTHON_ENV) \
+	SETUPTOOLS_USE_DISTUTILS=stdlib
 
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)
 
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
-	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
-	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
-	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
-	PATH=$(BR_PATH) \
-	$(TARGET_CONFIGURE_OPTS) \
-	PYTHONPATH="$(PYTHON3_PATH)" \
-	PYTHONNOUSERSITE=1 \
-	SETUPTOOLS_USE_DISTUTILS=stdlib \
-	_python_sysroot=$(STAGING_DIR) \
-	_python_prefix=/usr \
-	_python_exec_prefix=/usr
+	$(PKG_PYTHON_ENV) \
+	SETUPTOOLS_USE_DISTUTILS=stdlib
 
-PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
+PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--prefix=/usr \
 	--executable=/usr/bin/python \
-	--single-version-externally-managed \
+	--single-version-externally-managed
+
+PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
+	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
 	--root=$(TARGET_DIR)
 
 PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
-	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	--prefix=/usr \
-	--executable=/usr/bin/python \
-	--single-version-externally-managed \
+	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
 	--root=$(STAGING_DIR)
 
 # Host setuptools-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
-	PATH=$(BR_PATH) \
-	PYTHONNOUSERSITE=1 \
-	SETUPTOOLS_USE_DISTUTILS=stdlib \
-	$(HOST_CONFIGURE_OPTS)
+	$(HOST_PKG_PYTHON_ENV) \
+	SETUPTOOLS_USE_DISTUTILS=stdlib
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR) \
@@ -113,28 +112,21 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 
 # Target pep517-based packages
 PKG_PYTHON_PEP517_ENV = \
-	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
-	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
-	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
-	PATH=$(BR_PATH) \
-	$(TARGET_CONFIGURE_OPTS) \
-	PYTHONPATH="$(PYTHON3_PATH)" \
-	PYTHONNOUSERSITE=1 \
-	_python_sysroot=$(STAGING_DIR) \
-	_python_prefix=/usr \
-	_python_exec_prefix=/usr
+	$(PKG_PYTHON_ENV)
 
-PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
+PKG_PYTHON_PEP517_INSTALL_OPTS = \
 	--interpreter=/usr/bin/python \
-	--script-kind=posix \
+	--script-kind=posix
+
+PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
+	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
 	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(TARGET_DIR)/usr/bin \
 	--data=$(TARGET_DIR)/usr
 
 PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
-	--interpreter=/usr/bin/python \
-	--script-kind=posix \
+	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
 	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(STAGING_DIR)/usr/bin \
@@ -142,9 +134,7 @@ PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
 
 # Host pep517-based packages
 HOST_PKG_PYTHON_PEP517_ENV = \
-	PATH=$(BR_PATH) \
-	PYTHONNOUSERSITE=1 \
-	$(HOST_CONFIGURE_OPTS)
+	$(HOST_PKG_PYTHON_ENV)
 
 HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
 	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
