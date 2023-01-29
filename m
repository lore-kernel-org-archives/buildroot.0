Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744A3C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 03:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6918416A5;
	Sun, 29 Jan 2023 03:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6918416A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pij2o3CYA33w; Sun, 29 Jan 2023 03:52:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AC9D416B7;
	Sun, 29 Jan 2023 03:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AC9D416B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C45D1BF255
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 03:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2C8E416B7
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 03:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2C8E416B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JzqgQ6lnc8Xh for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 03:52:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9975E416A5
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9975E416A5
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 03:52:37 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id v2so844463iol.4
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 19:52:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KuTvG9LJ/ASi4h3hQ+XH/4WdXGJfI56sQIxP6lnBTsc=;
 b=kbWB96xhJFoJotnn9NT0F+sDPuaYWvcd1EgtclknIfACw+sm/CYYnYuBKNQ8CUlobi
 rTmWFvyFoFrt1I5GQRRr64UqUj1nDtIASCTBa2PNTcgzZeIjYTh5NzUYSgGkNdiOAXUP
 RSDyCvWdUqY92M0aLBX6E+VboyMPP/MPCdjcPQaRnsctDN7pxsSRk5UEeyjjC4bm+2Xo
 +Z0Y02sPJf/tlzdbuuwRA5+IJhqj+aDpFnvCUeeZOY4ILSbwpP0puTQ6Bv9bMbf9MJLh
 VvFIoZRUzFKwQXsYRZ4bFcTgrxA88OfTYA/0x7PS3dbxR0DtU4pcwIkBUNmdWFBvQvG5
 M7+g==
X-Gm-Message-State: AO0yUKVqJcdrY+xpcx6Z7ZPVW6RagO/ebUbnmP5MpSsryaWw+ZsPiG51
 A2npAgT2TmwXTKQXxuzV+XWVRwMCNZmXrA==
X-Google-Smtp-Source: AK7set+/ASFcV6eC1wylJmHKNWmt60XvurHVOTiqr6zTa5WnIP9UvugaxpY9xIoMDZeq0v3ykKgT6A==
X-Received: by 2002:a6b:e402:0:b0:707:dcd8:2aea with SMTP id
 u2-20020a6be402000000b00707dcd82aeamr2918732iog.19.1674964356457; 
 Sat, 28 Jan 2023 19:52:36 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 b21-20020a05660214d500b006f6623df63asm2874352iow.14.2023.01.28.19.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 19:52:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 20:52:26 -0700
Message-Id: <20230129035232.2480871-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KuTvG9LJ/ASi4h3hQ+XH/4WdXGJfI56sQIxP6lnBTsc=;
 b=G1Ko47O1NC1hDNLMLDDLPKgJhEPk+D9nnu5F7fZ4ZFgSdIUlKCYvjLGgOGJrh9OLN2
 iWfcYHfThCyR+FoF4gkFyC79dF3ugliAwN0gQmBi/r4QV/h7JIauX214WoBHm7MineTC
 OOOhvHdPbIPeFmfELSMWlH295ReTczT+kH8NOL3HfPA1CEzJ+Bj0b9xB73RdPxaki5/K
 ZWvMoJsep1X6HBcRn3n8l7wCByZ5a7V53i0WDfDOA1OXN43pz5jP4AShkrr5UUZOFqFJ
 gg3p6xy0k8sANcESfrGcOVD89VjT3Qh7L6ABkb0s48KPNKQQTu2I8XYc+iqgDEJ6dDeo
 2ecg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G1Ko47O1
Subject: [Buildroot] [PATCH v2 1/7] package/python-async-generator: new
 package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-async-generator/Config.in           |  6 ++++++
 .../python-async-generator.hash                    |  7 +++++++
 .../python-async-generator.mk                      | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-async-generator/Config.in
 create mode 100644 package/python-async-generator/python-async-generator.hash
 create mode 100644 package/python-async-generator/python-async-generator.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c8bc5eee22..6cf2b48a8f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1365,6 +1365,7 @@ F:	package/python-aiosignal/
 F:	package/python-aiozipkin/
 F:	package/python-argon2-cffi/
 F:	package/python-argon2-cffi-bindings/
+F:	package/python-async-generator/
 F:	package/python-async-lru/
 F:	package/python-async-timeout/
 F:	package/python-bidict/
diff --git a/package/Config.in b/package/Config.in
index 24be67b925..dd15467b11 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -962,6 +962,7 @@ menu "External python modules"
 	source "package/python-arrow/Config.in"
 	source "package/python-asgiref/Config.in"
 	source "package/python-asn1crypto/Config.in"
+	source "package/python-async-generator/Config.in"
 	source "package/python-async-lru/Config.in"
 	source "package/python-async-timeout/Config.in"
 	source "package/python-attrs/Config.in"
diff --git a/package/python-async-generator/Config.in b/package/python-async-generator/Config.in
new file mode 100644
index 0000000000..eb5720c652
--- /dev/null
+++ b/package/python-async-generator/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_ASYNC_GENERATOR
+	bool "python-async-generator"
+	help
+	  Async generators and context managers for Python 3.5+.
+
+	  https://github.com/python-trio/async_generator
diff --git a/package/python-async-generator/python-async-generator.hash b/package/python-async-generator/python-async-generator.hash
new file mode 100644
index 0000000000..3a94d5eb31
--- /dev/null
+++ b/package/python-async-generator/python-async-generator.hash
@@ -0,0 +1,7 @@
+# md5, sha256 from https://pypi.org/pypi/async_generator/json
+md5  078a29b4afb3d7f38c097a530f042a55  async_generator-1.10.tar.gz
+sha256  6ebb3d106c12920aaae42ccb6f787ef5eefdcdd166ea3d628fa8476abe712144  async_generator-1.10.tar.gz
+# Locally computed sha256 checksums
+sha256  b54d37617a67005623de975715952a2df062a2616c197bc3b6b451245b0c9265  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
+sha256  3e6dae555eb92787fc82d1d48355677f454c7f65aeb38d3f9e72bf9a3daf034b  LICENSE.MIT
diff --git a/package/python-async-generator/python-async-generator.mk b/package/python-async-generator/python-async-generator.mk
new file mode 100644
index 0000000000..d5e4f430fc
--- /dev/null
+++ b/package/python-async-generator/python-async-generator.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-async-generator
+#
+################################################################################
+
+PYTHON_ASYNC_GENERATOR_VERSION = 1.10
+PYTHON_ASYNC_GENERATOR_SOURCE = async_generator-$(PYTHON_ASYNC_GENERATOR_VERSION).tar.gz
+PYTHON_ASYNC_GENERATOR_SITE = https://files.pythonhosted.org/packages/ce/b6/6fa6b3b598a03cba5e80f829e0dadbb49d7645f523d209b2fb7ea0bbb02a
+PYTHON_ASYNC_GENERATOR_SETUP_TYPE = setuptools
+PYTHON_ASYNC_GENERATOR_LICENSE = Apache-2.0 or MIT
+PYTHON_ASYNC_GENERATOR_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
