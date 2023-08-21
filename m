Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21950EE4993
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 17:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BBB240357;
	Mon, 21 Aug 2023 17:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BBB240357
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pK-1R1nePzBp; Mon, 21 Aug 2023 17:58:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E0F940358;
	Mon, 21 Aug 2023 17:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E0F940358
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85B631BF3EC
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 17:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E6724021C
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 17:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E6724021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tMD6nsSOD6AG for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 17:58:47 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2332540106
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 17:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2332540106
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-68a41035828so1002294b3a.1
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 10:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692640726; x=1693245526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CxkGIMHuj5T/VOeNL03ODBD1z8SaZSybCLPOypzltTY=;
 b=lKYtpwryBlHGm+nJBweT74LWt6hFt+zpjRvLtI5+9G/WF4b6fm/Ofju/3IZdrJ/qzn
 799BexMQy6huAuJJLdz169ZCaf6uZqJhfhikio83J8lQYq2ed4JZJJdCtJjqt9Eq0wZ/
 GTPi1nICFTe0OyUKb7/iX3F6wNStA7akhwmcnNwvH0VWs2rJlqvNOzOfuuZlUY5zNUhl
 hwDL9jTkYTqPkC9MgP8oNX0xcBI813PWYBFflCDGdM01NPzjgjEnD90qditEWJovSqKw
 h3KoJ0aZfgNE9fDkOw8s2MzHhsrFpqOZhWwRCmwfiFvujTgYlyZXTdeTyver5fDFGll8
 3jeA==
X-Gm-Message-State: AOJu0Yw68LJwZoiy1iQUCNGk8fD4cu6tdatU0dlKIet78YwxMHZAANr4
 Er2Jm2r75s+IsRYpi4r/Cdrj+VT1u3s=
X-Google-Smtp-Source: AGHT+IFRj4g2MgxcpWc3UirclR33FYcaSTeE1hrTkn9ZijC+s1fMv0YTle5x8R3gKzemy7IGK/XGoA==
X-Received: by 2002:a05:6a20:650:b0:135:62b8:2a35 with SMTP id
 16-20020a056a20065000b0013562b82a35mr5656917pzm.32.1692640725809; 
 Mon, 21 Aug 2023 10:58:45 -0700 (PDT)
Received: from localhost.localdomain ([12.125.190.90])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a17090311ca00b001b83dc8649dsm7308842plh.250.2023.08.21.10.58.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 21 Aug 2023 10:58:45 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 10:58:28 -0700
Message-Id: <20230821175828.42827-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692640726; x=1693245526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CxkGIMHuj5T/VOeNL03ODBD1z8SaZSybCLPOypzltTY=;
 b=rc8sgBhztxlDiUnMGHmnXzVnq9q1sFZsC7yCEyu31gZ6XIxWEaRaguywStg6QAy76H
 mZsDiZzmVIKBja58TBxR0eGBLlAvg1gtIYec8JHjaNwwPaKLB7jqG40jGZqItfj1SrGJ
 t7OWaowXH/SS1I4VvCEMYlI8opaU85tnAV6cDT1MhHF8ZWfwcUNq+MUfc4U+leEnssGP
 BmpblGGbl83IKby87RzNATVGjQTjwz5PQG0bq206TMwzd6bu2WwCqAQX/hiUSjZp0xo1
 oqYsfqXPayNMjnnjNQIQbDaOBKWZRN6kG7hFEEBvZk4JhNO3RYWV4xlNZ34E2SbObiLF
 UZVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=rc8sgBhz
Subject: [Buildroot] [PATCH 1/1] package/python-pykwalify: add required
 package for zephyr cmake
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Alvaro G . M" <alvaro.gamez@hazent.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building zephyr based firmware, the cmake integrates with
python scripts that can be run using the buildroot host-python
dependencies. This is useful for the sdk setups and associated
build steps for the firmware. In this use-case, a buildroot
external project can be setup with recipes to build firmware
images using eabi toolchains and the linux controller software
to talk to those firmware images using one SDK. This might not
be overtly obvious from the patches.

Add the required host packages and additional pykwalify

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/Config.in                             |  1 +
 package/python-dateutil/python-dateutil.mk    |  2 ++
 package/python-docopt/python-docopt.mk        |  1 +
 package/python-pykwalify/Config.in            |  9 ++++++++
 .../python-pykwalify/python-pykwalify.hash    |  6 +++++
 package/python-pykwalify/python-pykwalify.mk  | 23 +++++++++++++++++++
 .../python-ruamel-yaml/python-ruamel-yaml.mk  |  1 +
 7 files changed, 43 insertions(+)
 create mode 100644 package/python-pykwalify/Config.in
 create mode 100644 package/python-pykwalify/python-pykwalify.hash
 create mode 100644 package/python-pykwalify/python-pykwalify.mk

diff --git a/package/Config.in b/package/Config.in
index 54cddc3914..8eb6c2bf37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1225,6 +1225,7 @@ menu "External python modules"
 	source "package/python-pyicu/Config.in"
 	source "package/python-pyinotify/Config.in"
 	source "package/python-pyjwt/Config.in"
+	source "package/python-pykwalify/Config.in"
 	source "package/python-pylibfdt/Config.in"
 	source "package/python-pylibftdi/Config.in"
 	source "package/python-pylru/Config.in"
diff --git a/package/python-dateutil/python-dateutil.mk b/package/python-dateutil/python-dateutil.mk
index b75f510bce..d45a047ba8 100644
--- a/package/python-dateutil/python-dateutil.mk
+++ b/package/python-dateutil/python-dateutil.mk
@@ -10,5 +10,7 @@ PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_DATEUTIL_LICENSE = BSD-3-Clause
 PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
 PYTHON_DATEUTIL_DEPENDENCIES = host-python-setuptools-scm
+HOST_PYTHON_DATEUTIL_DEPENDENCIES = host-python-setuptools-scm host-python-six
 
 $(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/package/python-docopt/python-docopt.mk b/package/python-docopt/python-docopt.mk
index f87d2f85a6..d326f4f0aa 100644
--- a/package/python-docopt/python-docopt.mk
+++ b/package/python-docopt/python-docopt.mk
@@ -11,3 +11,4 @@ PYTHON_DOCOPT_LICENSE_FILES = LICENSE-MIT
 PYTHON_DOCOPT_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/package/python-pykwalify/Config.in b/package/python-pykwalify/Config.in
new file mode 100644
index 0000000000..03afe31865
--- /dev/null
+++ b/package/python-pykwalify/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYKWALIFY
+	bool "python-pykwalify"
+	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_DOCOPT # runtime
+	select BR2_PACKAGE_PYTHON_RUAMEL_YAML # runtime
+	help
+	  Python lib/cli for JSON/YAML schema validation.
+
+	  http://github.com/grokzen/pykwalify
diff --git a/package/python-pykwalify/python-pykwalify.hash b/package/python-pykwalify/python-pykwalify.hash
new file mode 100644
index 0000000000..6ddfb6306a
--- /dev/null
+++ b/package/python-pykwalify/python-pykwalify.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/pykwalify/json
+md5  153197598f8508a49aefc0f44156c2b8  pykwalify-1.8.0.tar.gz
+sha256  796b2ad3ed4cb99b88308b533fb2f559c30fa6efb4fa9fda11347f483d245884  pykwalify-1.8.0.tar.gz
+# Locally computed sha256 checksums
+sha256  626fafd952ab0345edc227f2d565835fe1fd14067ae0d635ee3e47289b773dc4  LICENSE
+sha256  f89f247ddd2b9fdff655668148da4b6feaa9175fa44dd244d233006d0f551cd5  docs/license.rst
diff --git a/package/python-pykwalify/python-pykwalify.mk b/package/python-pykwalify/python-pykwalify.mk
new file mode 100644
index 0000000000..8a0bc6a227
--- /dev/null
+++ b/package/python-pykwalify/python-pykwalify.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# python-pykwalify
+#
+################################################################################
+
+PYTHON_PYKWALIFY_VERSION = 1.8.0
+PYTHON_PYKWALIFY_SOURCE = pykwalify-$(PYTHON_PYKWALIFY_VERSION).tar.gz
+PYTHON_PYKWALIFY_SITE = https://files.pythonhosted.org/packages/d5/77/2d6849510dbfce5f74f1f69768763630ad0385ad7bb0a4f39b55de3920c7
+PYTHON_PYKWALIFY_SETUP_TYPE = setuptools
+PYTHON_PYKWALIFY_LICENSE = MIT
+PYTHON_PYKWALIFY_LICENSE_FILES = LICENSE docs/license.rst
+PYTHON_PYKWALIFY_DEPENDENCIES = \
+	python-dateutil \
+	python-docopt \
+	python-ruamel-yaml
+HOST_PYTHON_PYKWALIFY_DEPENDENCIES = \
+	host-python-dateutil \
+	host-python-docopt \
+	host-python-ruamel-yaml
+
+$(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
index a6fed3bc2c..4f5691c981 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -14,3 +14,4 @@ PYTHON_RUAMEL_YAML_CPE_ID_VENDOR = ruamel.yaml_project
 PYTHON_RUAMEL_YAML_CPE_ID_PRODUCT = ruamel.yaml
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.39.2 (Apple Git-143)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
