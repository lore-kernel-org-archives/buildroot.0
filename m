Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376ABC433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 19:31:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D064660FC1
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 19:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D064660FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81EC26063D;
	Thu,  7 Oct 2021 19:31:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EMDnXf6AL2f4; Thu,  7 Oct 2021 19:31:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2A34606FA;
	Thu,  7 Oct 2021 19:31:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D25EE1BF29A
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 19:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0F7483EE8
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 19:31:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2CAxCv4PhBXq for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 19:31:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B051A83E25
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 19:31:28 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id 5so8030918iov.9
 for <buildroot@buildroot.org>; Thu, 07 Oct 2021 12:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rPXkWX9v8Vbbc+kttqZcltIBNutEALshgFpQhFbT+CI=;
 b=Tb+AiBG1JmlovMqqo/dh72P9Seu0dOo5ertSSKeUG9Qw9wdXB1An/LOXqzM+Vo6cGH
 lOFKruTYZMHGzlbDLPIXekDvii51AoEOUWbWvl+lG8wK01l5yuxldFVbGmO0gFftVI1H
 H6N4RR/lfO3fIVWJsp13oEtZCM0ziDWkPZLXtj9CdlZV7Z9CXI1EjwClc/L+zPWTmrqM
 VlfQMVIxvTH6SEW6ft6VfF2IXp/V3lnpH/0A5W/LFOJ63jnT5Z3fvFdJ3c77oQkkY+qN
 xCb/cJqoYybKM57QazB+zXjB0Q+4sEfVDTGZyrKZYsoyFln7lriqrEbxn5IIi21cf+US
 PgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rPXkWX9v8Vbbc+kttqZcltIBNutEALshgFpQhFbT+CI=;
 b=I4UWdKswIAgMg3iKgq/aE0wj+qLyvQariR2FInsFAezBeU8QdhHhqjlOIdlYpbdg4a
 LDZQupgiac3PQgwiYgQNPe34AZUypiXtXbVP0juiHZuoCN8DLuYhAijmckve+YUyAlxi
 uo4Co4xLJn8So7YtodQad8uVBXz0TF6dcmhIckTn8V8CCowVIbreflSV837tZinVR6iQ
 ORVyD7AvkLmnqYpfYDTuNUUanc9Z00mycgLEtmlOfeo9UTP0Mc6mCf1p1NMhpClZqUyk
 +4jcOiapCkjgxtH/bv0HJ6ztkb8wBmX13eQ9+RYsKD3nWIDhtlm3bA7hvBdPVqatc/y/
 Dq6w==
X-Gm-Message-State: AOAM5335Qc/42LwO8tO1sTq0PxNuvydlzNShTvzxauQzsxl/1fYAirsy
 5XSV30XHcS5HTR5xuJsChIFBaf2oPHZ40A==
X-Google-Smtp-Source: ABdhPJyF/Sni7zrKCBsd1444B5BNFDvCtuNBf3J7E68Zz/s6F2EMgXokUaffImEGJJqsE/yNCuXzDA==
X-Received: by 2002:a6b:6a0c:: with SMTP id x12mr4382910iog.177.1633635087574; 
 Thu, 07 Oct 2021 12:31:27 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id f20sm91839ilj.71.2021.10.07.12.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:31:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 13:31:21 -0600
Message-Id: <20211007193121.3775311-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007193121.3775311-1-james.hilliard1@gmail.com>
References: <20211007193121.3775311-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-jinja2: bump to version 3.0.2
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
Cc: Matt Weber <matthew.weber@collins.com>, Grzegorz Blach <grzegorz@blach.pl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Lionel Flandrin <lionel@svkt.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop python2 support.

Remove python3-jinja2 host build as python2 host builds for
jinja2 are not supported, python3 host builds are moved to
python-jinja2.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libcamera/libcamera.mk             |  2 +-
 package/python-jinja2/Config.in            |  2 --
 package/python-jinja2/python-jinja2.hash   |  4 ++--
 package/python-jinja2/python-jinja2.mk     | 20 +++++---------------
 package/python3-jinja2/python3-jinja2.hash |  1 -
 package/python3-jinja2/python3-jinja2.mk   | 20 --------------------
 package/systemd/systemd.mk                 |  4 ++--
 7 files changed, 10 insertions(+), 43 deletions(-)
 delete mode 120000 package/python3-jinja2/python3-jinja2.hash
 delete mode 100644 package/python3-jinja2/python3-jinja2.mk

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 8ab95fb42a..55242584da 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -10,7 +10,7 @@ LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
 	host-pkgconf \
-	host-python3-jinja2 \
+	host-python-jinja2 \
 	host-python3-ply \
 	host-python3-pyyaml \
 	gnutls
diff --git a/package/python-jinja2/Config.in b/package/python-jinja2/Config.in
index 27f6b1a7dd..36a68083e6 100644
--- a/package/python-jinja2/Config.in
+++ b/package/python-jinja2/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_PYTHON_JINJA2
 	bool "python-jinja2"
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
-	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3
 	help
 	  Jinja2 is a template engine written in pure Python. It
 	  provides a Django inspired non-XML syntax but supports
diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index 51590b17d2..afd07e89f1 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jinja2/json
-md5  231dc00d34afb2672c497713fa9cdaaa  Jinja2-2.11.3.tar.gz
-sha256  a6d58433de0ae800347cab1fa3043cebbabe8baa9d29e668f1c768cb87a333c6  Jinja2-2.11.3.tar.gz
+md5  059f89375d7ea60eb7013f341f0b89e7  Jinja2-3.0.2.tar.gz
+sha256  827a0e32839ab1600d4eb1c4c33ec5a8edfbc5cb42dafa13b81f182f97784b45  Jinja2-3.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index f91cac6937..bb53f95699 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,30 +4,20 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-jinja2/python3-jinja2.mk
-PYTHON_JINJA2_VERSION = 2.11.3
+PYTHON_JINJA2_VERSION = 3.0.2
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/4f/e7/65300e6b32e69768ded990494809106f87da1d436418d5f1367ed3966fd7
+PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/f8/86/7c0eb6e8b05385d1ce682abc0f994abd1668e148fb52603fa86e15d4c110
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE.rst
 PYTHON_JINJA2_CPE_ID_VENDOR = pocoo
 PYTHON_JINJA2_CPE_ID_PRODUCT = jinja2
 
-# In host build, setup.py tries to download markupsafe if it is not installed
+# In host/target build, setup.py tries to download markupsafe if it is not installed
+PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
 HOST_PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
 
-# Both asyncsupport.py and asyncfilters.py use async feature, that is
-# not available in Python 2 and some features available in Python 3.6.
-# So in both cases *.py compilation would produce compiler errors.
-# Hence remove both files after package extraction.
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-define PYTHON_JINJA2_REMOVE_ASYNC_SUPPORT
-	rm $(@D)/src/jinja2/asyncsupport.py $(@D)/src/jinja2/asyncfilters.py
-endef
-
-PYTHON_JINJA2_POST_EXTRACT_HOOKS = PYTHON_JINJA2_REMOVE_ASYNC_SUPPORT
-endif
+HOST_PYTHON_JINJA2_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python3-jinja2/python3-jinja2.hash b/package/python3-jinja2/python3-jinja2.hash
deleted file mode 120000
index 543e981aa0..0000000000
--- a/package/python3-jinja2/python3-jinja2.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-jinja2/python-jinja2.hash
\ No newline at end of file
diff --git a/package/python3-jinja2/python3-jinja2.mk b/package/python3-jinja2/python3-jinja2.mk
deleted file mode 100644
index 41081db04a..0000000000
--- a/package/python3-jinja2/python3-jinja2.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# python3-jinja2
-#
-################################################################################
-
-PYTHON3_JINJA2_VERSION = 2.11.3
-PYTHON3_JINJA2_SOURCE = Jinja2-$(PYTHON3_JINJA2_VERSION).tar.gz
-PYTHON3_JINJA2_SITE = https://files.pythonhosted.org/packages/4f/e7/65300e6b32e69768ded990494809106f87da1d436418d5f1367ed3966fd7
-PYTHON3_JINJA2_SETUP_TYPE = setuptools
-PYTHON3_JINJA2_LICENSE = BSD-3-Clause
-PYTHON3_JINJA2_LICENSE_FILES = LICENSE.rst
-PYTHON3_JINJA2_CPE_ID_VENDOR = pocoo
-PYTHON3_JINJA2_CPE_ID_PRODUCT = jinja2
-
-HOST_PYTHON3_JINJA2_NEEDS_HOST_PYTHON = python3
-# In host build, setup.py tries to download markupsafe if it is not installed
-HOST_PYTHON3_JINJA2_DEPENDENCIES = host-python-markupsafe
-
-$(eval $(host-python-package))
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c403896759..5b4fd57cd3 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -14,7 +14,7 @@ SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
 	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	host-gperf \
-	host-python3-jinja2 \
+	host-python-jinja2 \
 	kmod \
 	libcap \
 	util-linux-libs \
@@ -739,7 +739,7 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	host-patchelf \
 	host-libcap \
 	host-gperf \
-	host-python3-jinja2
+	host-python-jinja2
 
 HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
