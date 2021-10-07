Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC83FC433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 19:31:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AC7E610A1
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 19:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AC7E610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06A5640A44;
	Thu,  7 Oct 2021 19:31:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bn0K5HXmBN7Y; Thu,  7 Oct 2021 19:31:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D74E40A1F;
	Thu,  7 Oct 2021 19:31:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FA111BF29A
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 19:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D036404A1
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 19:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lHOkMpyHDNkM for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 19:31:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D95CC402B8
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 19:31:26 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id w10so7507333ilc.13
 for <buildroot@buildroot.org>; Thu, 07 Oct 2021 12:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+jP1UfhVi22P84/IyX+2c0Qkw48nHv02FAfKXseKsjM=;
 b=KWCbsFvx1BCqZy64OSAQImTfv2aVXIL308nk+ChoElqsLsRVMyKI1y6KFPhbNrlXfg
 7hY6RD+SNYT0CjZ+OIw1CGR+eKj6y0nxkKxdPSuhG5OFPrhaS+wm+AH+Cc8h2QWzHDja
 a1UpFxESRbedNDgLHLeMNw3Ez7Xqz+n6fMqFtzOp2thOFYCcdMbEdG93f3xQWDXBwvid
 UW6RzPMalEAhbMVvgAsfh0Uqxs4bXT22COdF5UM2refPT/hY0VTHu2HrWH5X57v++RF9
 Cfidqg+jqYgNyP/Q3H23Aw7FO6VagfB+Z7OFOOWIGdfdqVGZcagtnRFUNPYza/1kjlSW
 M+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+jP1UfhVi22P84/IyX+2c0Qkw48nHv02FAfKXseKsjM=;
 b=VdkxqEFONMm6QFhniL6RHkmpwjZXPe6T/LZRmfANdXDeu8H8+87EhRDFY2jDXGAYC5
 rHhIwPOLGU1C7Eadd1Ak3R+vuoupOpfah0imTpmkV84ZeKoeo32p0Oz3YF6A2YZA4KLm
 5/6LBe9fJNhLg9ebTvLjbLaaK/6S446p7LQfMh3sFzLUWiJY04EtSCBO8KEXzZL51IDO
 jS/RvtP3g3sK9ayvnvq94bPHBjMXDjhsBjhzG6DhEN0bR3uYZhWZ1Ld8RVz7Q+FUIkIo
 LVGS70wwWjFOaJnSOVaOggQiueXUiSrG55etyKs1/4fTMSD0I8Yfm/Py7ydey+9j+faE
 szgw==
X-Gm-Message-State: AOAM531JMXcj8s3C81SaCqWJQjuIegTdEtLUDwel2CRATLOjRx9nvN9e
 3O+E8+J7MjILuFeuCvclLKLz4XbEd3bQgw==
X-Google-Smtp-Source: ABdhPJyuX7V+Q61asFCpmO6qCz3eWYW1YgS0iMbRj5rOr6bqnD/SK01KTP3DS7gBSz6AhTeVz7wklw==
X-Received: by 2002:a05:6e02:885:: with SMTP id
 z5mr4665530ils.273.1633635085054; 
 Thu, 07 Oct 2021 12:31:25 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id f20sm91839ilj.71.2021.10.07.12.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:31:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 13:31:20 -0600
Message-Id: <20211007193121.3775311-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-markupsafe: bump to version
 2.0.1
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

Remove python3-markupsafe host build as python2 host builds for
markupsafe are not supported, python3 host builds are moved to
python-markupsafe.

Propagate reverse python3 dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask-babel/Config.in             |  1 +
 package/python-flask-cors/Config.in              |  1 +
 package/python-flask-expects-json/Config.in      |  1 +
 package/python-flask-jsonrpc/Config.in           |  1 +
 package/python-flask-login/Config.in             |  1 +
 package/python-flask-sqlalchemy/Config.in        |  1 +
 package/python-flask-wtf/Config.in               |  1 +
 package/python-flask/Config.in                   |  1 +
 package/python-jinja2/Config.in                  |  1 +
 package/python-markupsafe/Config.in              |  1 +
 package/python-markupsafe/python-markupsafe.hash |  9 +++++----
 package/python-markupsafe/python-markupsafe.mk   |  7 ++++---
 package/python-wtforms/Config.in                 |  1 +
 package/python3-jinja2/python3-jinja2.mk         |  2 +-
 .../python3-markupsafe/python3-markupsafe.hash   |  1 -
 package/python3-markupsafe/python3-markupsafe.mk | 16 ----------------
 16 files changed, 21 insertions(+), 25 deletions(-)
 delete mode 120000 package/python3-markupsafe/python3-markupsafe.hash
 delete mode 100644 package/python3-markupsafe/python3-markupsafe.mk

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
diff --git a/package/python-flask-wtf/Config.in b/package/python-flask-wtf/Config.in
index bb15489956..022ea89265 100644
--- a/package/python-flask-wtf/Config.in
+++ b/package/python-flask-wtf/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_WTF
 	bool "python-flask-wtf"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_ITSDANGEROUS # runtime
 	select BR2_PACKAGE_PYTHON_WTFORMS # runtime
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
index 5b99df75b8..27f6b1a7dd 100644
--- a/package/python-jinja2/Config.in
+++ b/package/python-jinja2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_JINJA2
 	bool "python-jinja2"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
 	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3
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
diff --git a/package/python3-jinja2/python3-jinja2.mk b/package/python3-jinja2/python3-jinja2.mk
index 5d29e1d889..41081db04a 100644
--- a/package/python3-jinja2/python3-jinja2.mk
+++ b/package/python3-jinja2/python3-jinja2.mk
@@ -15,6 +15,6 @@ PYTHON3_JINJA2_CPE_ID_PRODUCT = jinja2
 
 HOST_PYTHON3_JINJA2_NEEDS_HOST_PYTHON = python3
 # In host build, setup.py tries to download markupsafe if it is not installed
-HOST_PYTHON3_JINJA2_DEPENDENCIES = host-python3-markupsafe
+HOST_PYTHON3_JINJA2_DEPENDENCIES = host-python-markupsafe
 
 $(eval $(host-python-package))
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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
