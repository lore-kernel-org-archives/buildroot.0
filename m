Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55C0C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 06:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B66082241;
	Sun,  5 Nov 2023 06:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B66082241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJH345rnui56; Sun,  5 Nov 2023 06:46:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A185821A2;
	Sun,  5 Nov 2023 06:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A185821A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAD2C1BF584
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 06:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82C53821A2
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 06:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82C53821A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 50nW-zuwqrJl for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 06:46:45 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8797682173
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 06:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8797682173
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7ac7b2b1e99so129621739f.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 23:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699166804; x=1699771604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/4MtE2sOSx3wjGoqQ1VQDTH+6DmgC3W3+vU7M9aFkmc=;
 b=C8R4KQ3Dn0hNfIC9Eye4CLOwuidnW/YFjiyTgPpZfpZU9uzi2JD7eZyEBjs/rGGjgy
 JhZDxA4ys5lNae1oAHfvnsHP9nnoItz1974TWJw+2J2mVzzN2ZKWMYVC30EiqOKr/vos
 o0cbHLwalmMhibH46FwgUGYNxmnkAflfTVYKX1OshgDmBFgqCwZKK+jARj5rJZHT+gFT
 s2dF2huzDzS0XtSVwABT5C3SQUD4a/fpb7W4OZw4YrgJ6F6U+/lMRPz7JFAMAXx+xanj
 LiwGTZSXqeC+x8Y/M1KH9YqswOFVw4qo4kjKnA76w2I9mAq2mqshgSU6uHy0jEuUPk3d
 wp1w==
X-Gm-Message-State: AOJu0YyWTqrJK1Ez1nr0LwcJNp+zQaxzCSWRR3OweR3H9E6mKweOoa4N
 9NcyP6fvwXOKAvZsPEl2xpjI7qgiZ78=
X-Google-Smtp-Source: AGHT+IHF5ch5DmdNHfFnP/j+dT5iMh3oPPlYXMHCH840Un77/mEF0OMW3iNTzMG6gtlrKGFJE1eXng==
X-Received: by 2002:a05:6602:150e:b0:792:2cb6:5c65 with SMTP id
 g14-20020a056602150e00b007922cb65c65mr36221058iow.8.1699166804156; 
 Sat, 04 Nov 2023 23:46:44 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 u12-20020a6be30c000000b0078702f4894asm1593259ioc.9.2023.11.04.23.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 23:46:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 00:46:42 -0600
Message-Id: <20231105064642.2863739-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699166804; x=1699771604; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/4MtE2sOSx3wjGoqQ1VQDTH+6DmgC3W3+vU7M9aFkmc=;
 b=EsPc0zZvyYkY1su1KHkggmfhcAY5IeUHMIrF4pIfPspaqM5VT9ovthOAnz2Qh4jyJW
 0OwVxl7EbOcWeVc+l1/usRR41qqbfWb02DGBwZwFIHjWSTlAlOd5RPZVZQY5lmTq/+TS
 dFrtIXlmBYNclPrlEIJD2k6UX1Ph54zTtAvC/WeyFuE3NnUdLydRdQIje0NgaGiEkx5R
 tIK+rkXFgAfkRJF212A5n6j9EelBenXNFAFqAqlso4Zqjt5crrJZLwduYE1V/1z3HbEv
 n4/XVPZrPQpKT9GWJ6pDkcK87uB8PaUJxsZcO/gY6o19YiavpIiBtqrusmt5yll1M3gA
 GaPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EsPc0zZv
Subject: [Buildroot] [PATCH 1/1] package/python-flask: bump to version 3.0.0
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
Cc: Lionel Flandrin <lionel@svkt.org>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools to flit build backend.

Remove python-setuptools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask/Config.in         | 1 -
 package/python-flask/python-flask.hash | 4 ++--
 package/python-flask/python-flask.mk   | 8 ++++----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-flask/Config.in b/package/python-flask/Config.in
index 19b2f0ae7b..8dc2cef356 100644
--- a/package/python-flask/Config.in
+++ b/package/python-flask/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_PYTHON_FLASK
 	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
 	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
 	select BR2_PACKAGE_PYTHON_ITSDANGEROUS # runtime
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON3_SSL
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index 37ff0d70a5..3b5afc48e7 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask/json
-md5  a5d5fe05dff5c6e0d28ece3fb03ef5cd  Flask-2.3.2.tar.gz
-sha256  8c2f9abd47a9e8df7f0c3f091ce9497d011dc3b31effcf4c85a6e2b50f4114ef  Flask-2.3.2.tar.gz
+md5  4848c9d5305197822b5b00c8e9a6d9aa  flask-3.0.0.tar.gz
+sha256  cfadcdb638b609361d29ec22360d6070a77d7463dcb3ab08d2c2f2f168845f58  flask-3.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
 sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index b0a38488f8..1372d915c1 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 2.3.2
-PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/4d/00/ef81c18da32fdfcde6381c315f4b11597fb6691180a330418848efee0ae7
-PYTHON_FLASK_SETUP_TYPE = setuptools
+PYTHON_FLASK_VERSION = 3.0.0
+PYTHON_FLASK_SOURCE = flask-$(PYTHON_FLASK_VERSION).tar.gz
+PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/d8/09/c1a7354d3925a3c6c8cfdebf4245bae67d633ffda1ba415add06ffc839c5
+PYTHON_FLASK_SETUP_TYPE = flit
 PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE.rst docs/license.rst
 PYTHON_FLASK_CPE_ID_VENDOR = palletsprojects
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
