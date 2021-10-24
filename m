Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B333DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 23:47:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D6A860EE9
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 23:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D6A860EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DADDF605EE;
	Sun, 24 Oct 2021 23:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id emlfH2-jf_TE; Sun, 24 Oct 2021 23:47:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D24A160683;
	Sun, 24 Oct 2021 23:47:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D293A1BF969
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 23:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C00294023A
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 23:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RjNDJOe3NoW7 for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 23:47:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A6434012D
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 23:47:22 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id b188so13179160iof.8
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 16:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=toXRORPXz5iymXhedNa2CzGfmMYRVvyBZCH9XCz8EKc=;
 b=ShC6eTA+1gi2Mh33tD/bWO+XZyO/FaQNyoeKsOxD6gSKfjhZbz203xNSnqm0v1oqh3
 XfzfJMMuuR1ldVF/ryDg/fldWFtzBsam1CcL7eo+jYoZmzXiiXt+m1jUagLcwGoKRgKB
 v/4Q6ZTQ5CZuoGtX/3a6z8mAEn/srt6hTuX/GDelx4PGoveQ6RhkYncZErxK9bjmzF/u
 jm3PHCe2xA6D14cEDSJeQjPnxcE4XrGQyr8ju+GD+7R13LzP89fW3fWsYMhrrEvFUYm5
 oMI9cBO9TzE8yPZ4sSVabc4jfILBJqI6GSsL7t+TVwU8b5gGrINawFw5V+NeqtCkbZnL
 lwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=toXRORPXz5iymXhedNa2CzGfmMYRVvyBZCH9XCz8EKc=;
 b=0k8Eb2+NxzScv36QgTJHdY9iBbTEZeZm7PWYvpUifJgU9I2mnoDOqeNyhE5KGHk6h2
 i+W8SN1X877FJ8GfHLa6nggZ/PPwkP17xVmkRgiinw3HuUoF+K7s9NtWEDhDCMPd2BkF
 1gu+oyP1XYypHNICKQX8OPFF8yaGgzyTWixdIAzwuc2+bJo1Ozn0rm9Gyg3Bja2aPOrw
 YwUrckf85QDbsw88lQ0wXI3UrQzgRbQGt8s9+vwlawQfXthfnnsj4cB8vObUGT+59i7+
 BVWOiEDeeOsKcw5/a6FdHgtxoA4Bqv8n9nRvcJ8Rb2P3qSVHYhkdksPGUzXS9PcODWeo
 pa3g==
X-Gm-Message-State: AOAM533rL0W8QTvxZB1cTR7il+C+juNpNvw2xP5CrelPJtkcSOJXNS1u
 pQ1cYCO1tW2jIN22U7Fcyvwd3+guTSsGRg==
X-Google-Smtp-Source: ABdhPJwwKTqE2EmcrY1HOnQbCxG0NEarykBFab1NHP7vw7iwa6jIZ3EQPnUo6AtTKcM6D8BeqhXQLQ==
X-Received: by 2002:a05:6638:1607:: with SMTP id
 x7mr8170060jas.128.1635119241335; 
 Sun, 24 Oct 2021 16:47:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id k10sm1381076ilv.4.2021.10.24.16.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 16:47:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 17:47:14 -0600
Message-Id: <20211024234715.2138507-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/python-markupsafe: bump to
 version 2.0.1
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop python2 support.

Remove python3-markupsafe host build as python2 host builds for
markupsafe are not supported, python3 host builds are moved to
python-markupsafe.

Remove python3-jinja2 host build as python2 host builds for
jinja2 are not supported, python3 host builds are moved to
python-jinja2.

Propagate reverse python3 dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - move python3-jinja2 removal to same patch as python3-markupsafe removal
---
 package/libcamera/libcamera.mk                |  2 +-
 package/python-flask-babel/Config.in          |  1 +
 package/python-flask-cors/Config.in           |  1 +
 package/python-flask-expects-json/Config.in   |  1 +
 package/python-flask-jsonrpc/Config.in        |  1 +
 package/python-flask-login/Config.in          |  1 +
 package/python-flask-sqlalchemy/Config.in     |  1 +
 package/python-flask/Config.in                |  1 +
 package/python-jinja2/Config.in               |  3 +--
 package/python-jinja2/python-jinja2.mk        | 16 +++------------
 package/python-markupsafe/Config.in           |  1 +
 .../python-markupsafe/python-markupsafe.hash  |  9 +++++----
 .../python-markupsafe/python-markupsafe.mk    |  7 ++++---
 package/python-wtforms/Config.in              |  1 +
 package/python3-jinja2/python3-jinja2.hash    |  1 -
 package/python3-jinja2/python3-jinja2.mk      | 20 -------------------
 .../python3-markupsafe.hash                   |  1 -
 .../python3-markupsafe/python3-markupsafe.mk  | 16 ---------------
 package/systemd/systemd.mk                    |  4 ++--
 19 files changed, 25 insertions(+), 63 deletions(-)
 delete mode 120000 package/python3-jinja2/python3-jinja2.hash
 delete mode 100644 package/python3-jinja2/python3-jinja2.mk
 delete mode 120000 package/python3-markupsafe/python3-markupsafe.hash
 delete mode 100644 package/python3-markupsafe/python3-markupsafe.mk

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 5a5f2800b9..0052ca558a 100644
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
diff --git a/package/python-flask-babel/Config.in b/package/python-flask-babel/Config.in
index 272d9ef1c1..52f05f1e6a 100644
--- a/package/python-flask-babel/Config.in
+++ b/package/python-flask-babel/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_BABEL
 	bool "python-flask-babel"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_BABEL # runtime
 	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
diff --git a/package/python-flask-cors/Config.in b/package/python-flask-cors/Config.in
index e2e84797f9..f34f77e5b0 100644
--- a/package/python-flask-cors/Config.in
+++ b/package/python-flask-cors/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_CORS
 	bool "python-flask-cors"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
diff --git a/package/python-flask-expects-json/Config.in b/package/python-flask-expects-json/Config.in
index 901234762e..efe4c248d3 100644
--- a/package/python-flask-expects-json/Config.in
+++ b/package/python-flask-expects-json/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_EXPECTS_JSON
 	bool "python-flask-expects-json"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
 	help
diff --git a/package/python-flask-jsonrpc/Config.in b/package/python-flask-jsonrpc/Config.in
index c8ecd854b3..4bc13f9bcb 100644
--- a/package/python-flask-jsonrpc/Config.in
+++ b/package/python-flask-jsonrpc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_JSONRPC
 	bool "python-flask-jsonrpc"
+	depends on BR2_PACKAGE_PYTHON3
 	# runtime dependency
 	select BR2_PACKAGE_PYTHON_FLASK
 	help
diff --git a/package/python-flask-login/Config.in b/package/python-flask-login/Config.in
index 88c413e2a2..00fa58d783 100644
--- a/package/python-flask-login/Config.in
+++ b/package/python-flask-login/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_LOGIN
 	bool "python-flask-login"
+	depends on BR2_PACKAGE_PYTHON3
 	# runtime dependency
 	select BR2_PACKAGE_PYTHON_FLASK
 	help
diff --git a/package/python-flask-sqlalchemy/Config.in b/package/python-flask-sqlalchemy/Config.in
index fa4a035110..e96bd7078c 100644
--- a/package/python-flask-sqlalchemy/Config.in
+++ b/package/python-flask-sqlalchemy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_SQLALCHEMY
 	bool "python-flask-sqlalchemy"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_SQLALCHEMY # runtime
 	help
diff --git a/package/python-flask/Config.in b/package/python-flask/Config.in
index 0e5b64ce59..56bfe10f01 100644
--- a/package/python-flask/Config.in
+++ b/package/python-flask/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK
 	bool "python-flask"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_CLICK # runtime
 	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
 	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
diff --git a/package/python-jinja2/Config.in b/package/python-jinja2/Config.in
index 5b99df75b8..36a68083e6 100644
--- a/package/python-jinja2/Config.in
+++ b/package/python-jinja2/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_PYTHON_JINJA2
 	bool "python-jinja2"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
-	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3
 	help
 	  Jinja2 is a template engine written in pure Python. It
 	  provides a Django inspired non-XML syntax but supports
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index f91cac6937..e3f47f953a 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-jinja2/python3-jinja2.mk
 PYTHON_JINJA2_VERSION = 2.11.3
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
 PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/4f/e7/65300e6b32e69768ded990494809106f87da1d436418d5f1367ed3966fd7
@@ -14,20 +13,11 @@ PYTHON_JINJA2_LICENSE_FILES = LICENSE.rst
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
diff --git a/package/python-markupsafe/Config.in b/package/python-markupsafe/Config.in
index 48421e0a32..cd7cb2d8e9 100644
--- a/package/python-markupsafe/Config.in
+++ b/package/python-markupsafe/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MARKUPSAFE
 	bool "python-markupsafe"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  MarkupSafe implements a XML/HTML/XHTML Markup safe string
 	  for Python.
diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
index df07662a86..520bb405fb 100644
--- a/package/python-markupsafe/python-markupsafe.hash
+++ b/package/python-markupsafe/python-markupsafe.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/markupsafe/json, sha256 locally computed
-md5	43fd756864fe42063068e092e220c57b  MarkupSafe-1.1.1.tar.gz
-sha256	29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b  MarkupSafe-1.1.1.tar.gz
-sha256	489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
+# md5, sha256 from https://pypi.org/pypi/markupsafe/json
+md5  892e0fefa3c488387e5cc0cad2daa523  MarkupSafe-2.0.1.tar.gz
+sha256  594c67807fb16238b30c44bdf74f36c02cdf22d1c8cda91ef8a0ed8dabf5620a  MarkupSafe-2.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index f067d94f34..14a8d06dfe 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-markupsafe/python3-markupsafe.mk
-PYTHON_MARKUPSAFE_VERSION = 1.1.1
+PYTHON_MARKUPSAFE_VERSION = 2.0.1
 PYTHON_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
-PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094
+PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/bf/10/ff66fea6d1788c458663a84d88787bae15d45daa16f6b3ef33322a51fc7e
 PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
 PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
 
+HOST_PYTHON_MARKUPSAFE_NEEDS_HOST_PYTHON = python3
+
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-wtforms/Config.in b/package/python-wtforms/Config.in
index 33a17d3d37..0cc136fc13 100644
--- a/package/python-wtforms/Config.in
+++ b/package/python-wtforms/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_WTFORMS
 	bool "python-wtforms"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
 	help
 	  A flexible forms validation and rendering library for
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
index 5d29e1d889..0000000000
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
-HOST_PYTHON3_JINJA2_DEPENDENCIES = host-python3-markupsafe
-
-$(eval $(host-python-package))
diff --git a/package/python3-markupsafe/python3-markupsafe.hash b/package/python3-markupsafe/python3-markupsafe.hash
deleted file mode 120000
index 947cfa12d7..0000000000
--- a/package/python3-markupsafe/python3-markupsafe.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-markupsafe/python-markupsafe.hash
\ No newline at end of file
diff --git a/package/python3-markupsafe/python3-markupsafe.mk b/package/python3-markupsafe/python3-markupsafe.mk
deleted file mode 100644
index 58f6e67b64..0000000000
--- a/package/python3-markupsafe/python3-markupsafe.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# python3-markupsafe
-#
-################################################################################
-
-PYTHON3_MARKUPSAFE_VERSION = 1.1.1
-PYTHON3_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON3_MARKUPSAFE_VERSION).tar.gz
-PYTHON3_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094
-PYTHON3_MARKUPSAFE_SETUP_TYPE = setuptools
-PYTHON3_MARKUPSAFE_LICENSE = BSD-3-Clause
-PYTHON3_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
-
-HOST_PYTHON3_MARKUPSAFE_NEEDS_HOST_PYTHON = python3
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
