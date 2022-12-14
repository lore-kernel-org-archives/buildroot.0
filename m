Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19256C10F31
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 14:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BF2C403C4;
	Wed, 14 Dec 2022 14:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BF2C403C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V08azJmQkm_r; Wed, 14 Dec 2022 14:42:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF8A2404B0;
	Wed, 14 Dec 2022 14:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF8A2404B0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E3D01BF470
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 14:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24FE541724
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 14:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24FE541724
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ejjWuJN8PCja for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 14:42:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8309408C6
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8309408C6
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 14:42:47 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id s16so6623778iln.4
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 06:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q5Mygyz2B/pKFawniWYKd8mWdzWbfWUpryUNC1nlnYc=;
 b=D2fgDw4OLw8Ti5di1bsP2ZogbHoWHJrnooKv2Ufi6rw7f7VwGEPd+DDc9Gzu0nwwar
 44dSNKO25I+FrPWEcZAX9DWxnEFGjOc6xGfPonleliZ+RcOAGk5B9OyZXPgLEA5m2F2I
 4BUoz/WYVeoCsbFBI6NuRY/bG9KHnVX5kCo4+ShTMrci99gSKBFxZMo/MwY4od2mmM0A
 WtOzTMSYB+mJISAMaOVHY3AlF9gs7PzRj1M8T6RVh3XYwftm7PoBuRlfcEUovD0m6H7L
 VlTD8S1XbRbGqXmN+liyCiZeMUb6tdplwGjaRnRotBW6rN9AsiHXXOk523HNNKIXv8Wz
 rEZQ==
X-Gm-Message-State: ANoB5plBOuDAWoN3RMurDnlRor8n8f5w9Wc7kVi6Jnimbml2CDYRkLBO
 d5Dn14a4+tSH77evbaz4vgZAPuPi3d/NKysV
X-Google-Smtp-Source: AA0mqf7f+f4I5JLzeGB0bCCqns5ze+UvunQYtq+7hqAZIePWv3peT7COtVQMUZTIv5ej9kU6tOgnoA==
X-Received: by 2002:a92:7305:0:b0:304:bf1f:d72a with SMTP id
 o5-20020a927305000000b00304bf1fd72amr6349348ilc.28.1671028966717; 
 Wed, 14 Dec 2022 06:42:46 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 n7-20020a92d9c7000000b002f90ff8bcbbsm4644665ilq.37.2022.12.14.06.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 06:42:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 07:42:44 -0700
Message-Id: <20221214144244.2996965-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q5Mygyz2B/pKFawniWYKd8mWdzWbfWUpryUNC1nlnYc=;
 b=a+XTsWnwNEanhS8T5w4kUiA3YfsRt2A66wOoW9LSLuUYFkZDT/WfVUFy5XlPDrihSS
 J24bHAK1QV4010Ty6Oypb/Af7EewDQYiOhc4+GE+1QGdmSfxGxG6jM6IlxL61iN0oPYJ
 3zhePfZNJtE23AyZ74VeNY25uK2OJXwIGN9Zo9MLvVe4oQtLtyTgvMWF7yHkD3bVK4HM
 8WicvtOhuSU6FXZ+9Kp8qrIB3rhsrAxenPhpwDXmPJiF4Bts5FqxK67vtZeZB4OnXbgJ
 z96GnZDxHdVK/k2zJUL3a2Xx8+KIiQHLqeirIvOyl3IFUpG6XXDDaJBMmVszLTjdbhDN
 IkjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=a+XTsWnw
Subject: [Buildroot] [PATCH 1/1] package/python-ipdb: bump to version 0.13.11
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

Drop no longer required setuptools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ipdb/Config.in        | 1 -
 package/python-ipdb/python-ipdb.hash | 4 ++--
 package/python-ipdb/python-ipdb.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-ipdb/Config.in b/package/python-ipdb/Config.in
index a9d6af1684..9259421c6a 100644
--- a/package/python-ipdb/Config.in
+++ b/package/python-ipdb/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_IPDB
 	bool "python-ipdb"
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_IPYTHON # runtime
 	help
 	  IPython-enabled pdb.
diff --git a/package/python-ipdb/python-ipdb.hash b/package/python-ipdb/python-ipdb.hash
index 7d483e1777..1e8a45fbd6 100644
--- a/package/python-ipdb/python-ipdb.hash
+++ b/package/python-ipdb/python-ipdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ipdb/json
-md5  4f5ffb71cd6551319acf8cbceabd8936  ipdb-0.13.9.tar.gz
-sha256  951bd9a64731c444fd907a5ce268543020086a697f6be08f7cc2c9a752a278c5  ipdb-0.13.9.tar.gz
+md5  e624221cbc9261f68f412b748179d5e2  ipdb-0.13.11.tar.gz
+sha256  c23b6736f01fd4586cc2ecbebdf79a5eb454796853e1cd8f2ed3b7b91d4a3e93  ipdb-0.13.11.tar.gz
 # Locally computed sha256 checksums
 sha256  4eeb49de04f4894f8ea1f69a04f500799041b750b3d554c06de5ca877258e734  COPYING.txt
diff --git a/package/python-ipdb/python-ipdb.mk b/package/python-ipdb/python-ipdb.mk
index 7828f83020..151a3d45a4 100644
--- a/package/python-ipdb/python-ipdb.mk
+++ b/package/python-ipdb/python-ipdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPDB_VERSION = 0.13.9
+PYTHON_IPDB_VERSION = 0.13.11
 PYTHON_IPDB_SOURCE = ipdb-$(PYTHON_IPDB_VERSION).tar.gz
-PYTHON_IPDB_SITE = https://files.pythonhosted.org/packages/fc/56/9f67dcd4a4b9960373173a31be1b8c47fe351a1c9385677a7bdd82810e57
+PYTHON_IPDB_SITE = https://files.pythonhosted.org/packages/23/b2/c972cc266b0ba8508b42dab7f5dea1be03ea32213258441bf1b00baca555
 PYTHON_IPDB_SETUP_TYPE = setuptools
 PYTHON_IPDB_LICENSE = BSD-3-Clause
 PYTHON_IPDB_LICENSE_FILES = COPYING.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
