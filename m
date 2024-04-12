Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA52C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 05:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9476C40305;
	Fri, 12 Apr 2024 05:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahaVN_l4mSny; Fri, 12 Apr 2024 05:54:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E946540339
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E946540339;
	Fri, 12 Apr 2024 05:54:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D93A1BF23C
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 05:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 691BF80E69
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 05:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SW_EY-Op1v92 for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 05:54:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01F0B80E66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01F0B80E66
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01F0B80E66
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 05:54:13 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a46de423039so29177466b.0
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 22:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712901251; x=1713506051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vNVW5bq+TAb0XydSvm1KQ0Hat5KIP5BsE38D7Ogi9LQ=;
 b=dGCwifML7QnVDHcn9skSNDHP82cQEkrAtql8/cRMBYDKlb0EzHfyLXAzoTb8aPrWaU
 r5sS+9NADSh7aBI8eL7ylyBorG4fF32Uwal7yFSLD2h8pBkKzosDvANIIeaWOJti2GPP
 qpM4m9TF4SxiJO3pStLsv7qidc4+DggkwT0lunISy1VDCzerr13R5ZdQY3wrojvckuQN
 w9JHZBM9xlO+6/GQK+RyL+o85J6ve9a3ufEfO3GxSkVolSrh5FUzPMhT5094BY5EkcLM
 orPV5OYxXo8z62m/FF6AwfX6/vwCtW1a9VpwxT3U17G1dQKYEqYBFBYuaBI9RyGsyswO
 6IBQ==
X-Gm-Message-State: AOJu0YzzE030NoP1KK9av2KZ5CG5mLI+ONr9XtntuCK1lRwfD5njtJDx
 PlP4MaarZhgZ+t3an8h9e2+OexymsqFrOCyjO86/Ela8qS1K217elCLS5A==
X-Google-Smtp-Source: AGHT+IGOSeQ8PlM2aCTepIHKVNPfwZ98/+bOt4M8SOlKGk/8J/aKtkD4IsjBQT5wa88sffVBbXiGLg==
X-Received: by 2002:a50:cdd5:0:b0:56b:d1c2:9b42 with SMTP id
 h21-20020a50cdd5000000b0056bd1c29b42mr1459399edj.29.1712901250938; 
 Thu, 11 Apr 2024 22:54:10 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 cb12-20020a0564020b6c00b0056e67aa7118sm1354199edb.52.2024.04.11.22.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 22:54:10 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 07:53:57 +0200
Message-Id: <20240412055358.1354293-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712901251; x=1713506051; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vNVW5bq+TAb0XydSvm1KQ0Hat5KIP5BsE38D7Ogi9LQ=;
 b=j6JZcFfPmIaG/gqodJIQtfwO0byz/QcOtastaDnYO4V+5DIZc2w7nqEEvyJZ5G9vS4
 Qq715G9VSZKaqYW+DDAHCzA7gvwoL0KT9O/tpCXY6ASmqHbOr9710PJ9AxxOwVLKbpa8
 kOB+/LUT12Z6TPr+52WF+bm0vmG0tEm5EY7jSSmMDi7amPWwbVhMY6cFyXIu/6suhqkq
 wHB6qFYn6I1OdQ2URgOzl7OaxWp/r6pqi0s0UBw0tia3MUEq2rQjx88U6H6EwzlCMq8g
 7s5WmjWZ/S36tBZKiCirmxevVEdQ96pG9cB2OWjY95XWdFvkGYX1gMW04Uj1UB8dahe0
 gCtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j6JZcFfP
Subject: [Buildroot] [PATCH v3 1/3] package/python-yamllint: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Heiko Thiery <heiko.thiery@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This host package is needed since u-boot 2024.04 for building ti defconfigs.

This is an requirement for using buildman/binman [1].

[1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt?ref_type=tags#L3

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---

v2: accidentally resend this series as v2
    (it's too early in the morning and no coffee yet)

v3:
 - add missing runtime depnedencies
  - a patch that enables the target build for python-pathspec is
    required https://patchwork.ozlabs.org/project/buildroot/patch/20240412054421.1346030-1-heiko.thiery@gmail.com/
 - add runtime test

 package/Config.in                                 |  1 +
 package/python-yamllint/Config.in                 |  8 ++++++++
 package/python-yamllint/python-yamllint.hash      |  3 +++
 package/python-yamllint/python-yamllint.mk        | 15 +++++++++++++++
 .../tests/package/sample_python_yamllint.py       | 13 +++++++++++++
 .../testing/tests/package/test_python_yamllint.py | 11 +++++++++++
 6 files changed, 51 insertions(+)
 create mode 100644 package/python-yamllint/Config.in
 create mode 100644 package/python-yamllint/python-yamllint.hash
 create mode 100644 package/python-yamllint/python-yamllint.mk
 create mode 100644 support/testing/tests/package/sample_python_yamllint.py
 create mode 100644 support/testing/tests/package/test_python_yamllint.py

diff --git a/package/Config.in b/package/Config.in
index d9bbf64c95..1935077f0f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1437,6 +1437,7 @@ menu "External python modules"
 	source "package/python-xmljson/Config.in"
 	source "package/python-xmltodict/Config.in"
 	source "package/python-xmodem/Config.in"
+	source "package/python-yamllint/Config.in"
 	source "package/python-yarl/Config.in"
 	source "package/python-yatl/Config.in"
 	source "package/python-zc-lockfile/Config.in"
diff --git a/package/python-yamllint/Config.in b/package/python-yamllint/Config.in
new file mode 100644
index 0000000000..5c0962f09f
--- /dev/null
+++ b/package/python-yamllint/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_YAMLLINT
+	bool "python-yamllint"
+	select BR2_PACKAGE_PYTHON_PATHSPEC # runtime
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
+	help
+	  A linter for YAML files.
+
+	  https://github.com/adrienverge/yamllint
diff --git a/package/python-yamllint/python-yamllint.hash b/package/python-yamllint/python-yamllint.hash
new file mode 100644
index 0000000000..d80e0fdf42
--- /dev/null
+++ b/package/python-yamllint/python-yamllint.hash
@@ -0,0 +1,3 @@
+# Locally computed sha256 checksums
+sha256  7a003809f88324fd2c877734f2d575ee7881dd9043360657cc8049c809eba6cd  yamllint-1.35.1.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/python-yamllint/python-yamllint.mk b/package/python-yamllint/python-yamllint.mk
new file mode 100644
index 0000000000..ceaca3b0b8
--- /dev/null
+++ b/package/python-yamllint/python-yamllint.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-yamllint
+#
+################################################################################
+
+PYTHON_YAMLLINT_VERSION = 1.35.1
+PYTHON_YAMLLINT_SOURCE = yamllint-$(PYTHON_YAMLLINT_VERSION).tar.gz
+PYTHON_YAMLLINT_SITE = https://files.pythonhosted.org/packages/da/06/d8cee5c3dfd550cc0a466ead8b321138198485d1034130ac1393cc49d63e
+PYTHON_YAMLLINT_SETUP_TYPE = pep517
+PYTHON_YAMLLINT_LICENSE = GPL-3.0
+PYTHON_YAMLLINT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/sample_python_yamllint.py b/support/testing/tests/package/sample_python_yamllint.py
new file mode 100644
index 0000000000..369a3b8d7d
--- /dev/null
+++ b/support/testing/tests/package/sample_python_yamllint.py
@@ -0,0 +1,13 @@
+# example form https://yamllint.readthedocs.io/en/stable/development.html
+
+from yamllint import (config, linter)
+
+data = '''---
+- &anchor
+  foo: bar
+- *anchor
+'''
+
+yaml_config = config.YamlLintConfig("extends: default")
+for p in linter.run(data, yaml_config):
+    print(p.desc, p.line, p.rule)
diff --git a/support/testing/tests/package/test_python_yamllint.py b/support/testing/tests/package/test_python_yamllint.py
new file mode 100644
index 0000000000..226048ae87
--- /dev/null
+++ b/support/testing/tests/package/test_python_yamllint.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonYamllint(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_YAMLLINT=y
+        """
+    sample_scripts = ["tests/package/sample_python_yamllint.py"]
--
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
