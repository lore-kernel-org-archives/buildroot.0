Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DA3C4167B
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 16:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E77F83CFC;
	Thu, 14 Dec 2023 16:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E77F83CFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N8DRWiNMycQN; Thu, 14 Dec 2023 16:55:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A5FA83CE9;
	Thu, 14 Dec 2023 16:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A5FA83CE9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0343F1BF28E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDEEF83CC9
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDEEF83CC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c6-RW-F2CcLc for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 16:54:47 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7AFB83C14
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 16:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7AFB83C14
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7b72d574399so387824139f.0
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 08:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702572885; x=1703177685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2mgOvH0FcOJmUZvCp5oR2TgpTUbYqJSU4hDf7a1rASg=;
 b=jfOKVgwpBQiB4dLW7p/z2LH90eRBDvxSi02BCiDvoqC/ElEqAgup2gudbt9T00YHGD
 pQh1hceopeb3dnsmpirspRhEw/+tWj9TXoRLLsimttRSX6oDEp/HrJ3Z2pdvJ3XsGkqD
 UiKphPz804Ewj6HKvtuvh/IC4si20h1/mNqE1GoidTkeNv+EekFlzCsyBxrF/m+Hmyio
 vXiIJNUb29/EA/o7csZGcBnzqn1UMMnR+3MJKoSeiSFF4NA5y/LmTw9u89QDwrHHpBpL
 IUxH1OLjv9Zs9/PH4iazx2qDRvtJsq+/hAh2mdbWi42SDxR4tJv04WWNAsHeQ4ABakgh
 2Ceg==
X-Gm-Message-State: AOJu0YzVUJJme7YtqOpFY5+5eIWLFVS7reJtKayPC/p3rq6XZLbrQakJ
 PkhlV9piOr5Z6pUOlzSVhst3QUD37xyVLQ==
X-Google-Smtp-Source: AGHT+IEBZZxNapb5HoUVdf8m8N3f+qCnaHD9DRyjAUiGIuqkjyjEyQaf8qy9ILvQztvLzdNlhqQPAQ==
X-Received: by 2002:a05:6602:1614:b0:7b6:f40c:2cdb with SMTP id
 x20-20020a056602161400b007b6f40c2cdbmr15087963iow.12.1702572885501; 
 Thu, 14 Dec 2023 08:54:45 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 u16-20020a6b4910000000b007b7372af699sm2912178iob.9.2023.12.14.08.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 08:54:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 09:54:15 -0700
Message-Id: <20231214165420.181703-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214165420.181703-1-james.hilliard1@gmail.com>
References: <20231214165420.181703-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702572885; x=1703177685; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2mgOvH0FcOJmUZvCp5oR2TgpTUbYqJSU4hDf7a1rASg=;
 b=frACI/60DmA9EarULpQRijSkQU4UGPXhyvVOszV9oWeCb4nZ/pQz2XZXeGsphlof9t
 5Nwk4oIV+02/XGPTnViwsa0eXtSFNVtyBg4Oio8RIaoam3jbu4hLjKBlR7qOMVss2+mu
 S60r/qkaWn3dSQCaIOBqanMuykp8fx7n5fG3xE6/NQeOMy3qP/Hb7KeAWGOt7zWmWYcq
 rsNQv/KTGoIxgjNBEgMwfxKaSquPwA9otzgOjZ4RiCWqa+QPsmraJIPV5+Cy3AQRoxEA
 T+o27nQxsNpBwxCgM3Zo87HE3Nz35EdS+brv9aoEA7zz3eKjAz4IPvNWrxFMWTDnE8Ja
 pHAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=frACI/60
Subject: [Buildroot] [PATCH v3 3/8] package/python-starlette: new package
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
Changes v1 -> v2:
 - downgrade to version 0.27.0
---
 package/Config.in                              |  1 +
 package/python-starlette/Config.in             |  7 +++++++
 package/python-starlette/python-starlette.hash |  5 +++++
 package/python-starlette/python-starlette.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-starlette/Config.in
 create mode 100644 package/python-starlette/python-starlette.hash
 create mode 100644 package/python-starlette/python-starlette.mk

diff --git a/package/Config.in b/package/Config.in
index c023e0ef3f..3a4bf21a2a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1338,6 +1338,7 @@ menu "External python modules"
 	source "package/python-sqliteschema/Config.in"
 	source "package/python-sqlparse/Config.in"
 	source "package/python-stack-data/Config.in"
+	source "package/python-starlette/Config.in"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tempora/Config.in"
diff --git a/package/python-starlette/Config.in b/package/python-starlette/Config.in
new file mode 100644
index 0000000000..90f590689a
--- /dev/null
+++ b/package/python-starlette/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_STARLETTE
+	bool "python-starlette"
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
+	help
+	  The little ASGI library that shines.
+
+	  https://github.com/encode/starlette
diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
new file mode 100644
index 0000000000..a7f1f66446
--- /dev/null
+++ b/package/python-starlette/python-starlette.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/starlette/json
+md5  5193c4b7d2ea4c93635c340a7ba9b54f  starlette-0.27.0.tar.gz
+sha256  6a6b0d042acb8d469a01eba54e9cda6cbd24ac602c4cd016723117d6a7e73b75  starlette-0.27.0.tar.gz
+# Locally computed sha256 checksums
+sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
new file mode 100644
index 0000000000..40932929a0
--- /dev/null
+++ b/package/python-starlette/python-starlette.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-starlette
+#
+################################################################################
+
+PYTHON_STARLETTE_VERSION = 0.27.0
+PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/06/68/559bed5484e746f1ab2ebbe22312f2c25ec62e4b534916d41a8c21147bf8
+PYTHON_STARLETTE_SETUP_TYPE = pep517
+PYTHON_STARLETTE_LICENSE = BSD-3-Clause
+PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
+PYTHON_STARLETTE_DEPENDENCIES = host-python-hatchling
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
