Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33418F8A14D
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 10:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DEAB80C69;
	Thu, 16 Apr 2026 10:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6bWu3J-u-LX; Thu, 16 Apr 2026 10:27:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7767C80C71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776335221;
	bh=obktvIjhUshzUJnQaCtcUS1WxbzNzLf01rwqdDWEIW4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GCq1fs7sPAlA6ZKsj1asNjP0yLEKIQDU8YGqn6SCpVlHtVWGhwG9OInHlLbjGg5iI
	 QjVewk1rwAPU1Ko7qjl9nROx+bkV5A3SrwJzPM1Q9aaseZWJ4PmHvGfwaPfOGtYG0H
	 gKvSZx7s5Jkjl9Bxc0jkqpOK54PRby7QLJ02Ssg04iEs8bFWo8SysjFNRO+dzcLuWW
	 zswDdxwZYWFsY171bDfmOTaVYChrbFb8vK5LZbhYHD380zCAOioNKI9iLartY5D0DW
	 qRXYblKAW5GLCbgi1ycI2MRyT9TtBtvhoU6l7jeukXJgqYIsFaYUSqWHiHH9fzG566
	 LuVhAepHEMY0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7767C80C71;
	Thu, 16 Apr 2026 10:27:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1705775
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 10:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C771780C71
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 10:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chh-l3OQRarb for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 10:26:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=54.36.140.183;
 helo=8.mo533.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2337A80C69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2337A80C69
Received: from 8.mo533.mail-out.ovh.net (8.mo533.mail-out.ovh.net
 [54.36.140.183])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2337A80C69
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 10:26:56 +0000 (UTC)
Received: from director5.derp.mail-out.ovh.net
 (director5.derp.mail-out.ovh.net [51.68.94.138])
 by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4fxDhY52Flz65KR;
 Thu, 16 Apr 2026 10:26:53 +0000 (UTC)
Received: from director5.derp.mail-out.ovh.net
 (director5.derp.mail-out.ovh.net. [127.0.0.1])
 by director5.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <mooz@blockos.org>; Thu, 16 Apr 2026 10:26:53 +0000 (UTC)
Received: from mta7.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.43.242])
 by director5.derp.mail-out.ovh.net (Postfix) with ESMTPS id
 4fxDhY31gcz7tnL; Thu, 16 Apr 2026 10:26:53 +0000 (UTC)
Received: from blockos.org (unknown [10.1.6.10])
 (Authenticated sender: mooz@blockos.org)
 by mta7.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 5095EB80F0E; 
 Thu, 16 Apr 2026 10:26:52 +0000 (UTC)
X-OVh-ClientIp: 213.36.7.12
From: Vincent Cruz <mooz@blockos.org>
To: buildroot@buildroot.org
Date: Thu, 16 Apr 2026 12:24:21 +0200
Message-ID: <20260416102643.1347452-1-mooz@blockos.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
x-ovh-tracer-id: 13361335673238768546
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGkaxpFY5JCuZAUv+4uyoiSyrdUQHaBMR9c+0Y3n9V+/DoWcJwaIfEIcso0ZLxT3PdhNS9FhYsaEraESb5rpPd0zRc24g+CqJvNYXYXpm8O+lQURU08XWkQWHxHKzF8ueFQLluKvYqiCCxtrAQkFfkqMficQkjpcVHCe0jBVVA9Hsgzjezl0e+KQIaJ0BS35cNWzTYCvxMR65asCnYvhX9ylmgMcklsUWy/A29IbcVSWJI7TNpfH1fiGrfzwCqOSAf2NzV1AcboPvVS12JbjrvoBoi4Dd6nHmnnZfzhgqOmtgM0UEZx+Z9K8rXwvJnyjPoTzjiqKF/HlJzcajGlhMReLe9Fhs58FcyCe7ZVo+hDZIw0x/W6oDAm87VxugvTgsV/4oOPDkor2v12bdGwcwbTVVh6SJLGe9ca4XYxckEwXfmG5icbHZLgf9R6OImT2ldFCu9vebhNJyIiUpjgTwuire0KEm5zvBmx8CS+RRLMeCxgF1/7gYwfv/w83U02YBdAWxcQk3KoDhUqd081YnZ2v8TQ9d7Tca4f6Uc62yWJ0SCPUOyhZRk1CkfFUYckwkr3jeptTFWa+VjL7OyEc6td9UIJy/BIY4U41vtDxKuxZDyyP/WVvgBSmQ7sxKUY/KGsL9NwdPMZEA8ERC9YSdRsZBCYILvrmQ8QnAvg2wQdLg
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003ae0e15aa-dc9a-467c-8249-98ab4b15faac,
 0D8B65AFD1E29AA9D52F941CF36BEFE6B8CD1347) smtp.auth=mooz@blockos.org
Subject: [Buildroot] [PATCH v2 1/1] package/python-libyang: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Vincent Jardin <vjardin@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Cruz <mooz@blockos.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Jardin <vjardin@free.fr>

Python CFFI bindings for the libyang YANG library, providing the
'libyang' Python module for YANG data modeling operations.

This package is used by higher-level tooling such as python-sysrepo.

https://github.com/CESNET/libyang-python
Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Vincent Cruz <mooz@blockos.org>

---
v1->v2:
  Remove python-sysrepo
  Fix Config.in dependencies
  Add test

Tested with Buildroot gitlab CI:
  https://gitlab.com/v_cz/buildroot/-/pipelines/2457352559

---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/python-libyang/Config.in              | 19 +++++++++
 package/python-libyang/python-libyang.hash    |  5 +++
 package/python-libyang/python-libyang.mk      | 21 ++++++++++
 .../tests/package/sample_python_libyang.py    | 41 +++++++++++++++++++
 .../tests/package/test_python_libyang.py      | 26 ++++++++++++
 7 files changed, 114 insertions(+)
 create mode 100644 package/python-libyang/Config.in
 create mode 100644 package/python-libyang/python-libyang.hash
 create mode 100644 package/python-libyang/python-libyang.mk
 create mode 100644 support/testing/tests/package/sample_python_libyang.py
 create mode 100644 support/testing/tests/package/test_python_libyang.py

diff --git a/DEVELOPERS b/DEVELOPERS
index b20cf7d93c..d8fe4e8093 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3372,6 +3372,7 @@ F:	package/dpdk/
 F:	package/libecoli/
 F:	package/libnss-ato/
 F:	package/libyang-cpp/
+F:	package/python-libyang/
 F:	package/sysrepo-cpp/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index d0f148699b..de7900eefe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1207,6 +1207,7 @@ menu "External python modules"
 	source "package/python-libevdev/Config.in"
 	source "package/python-librt/Config.in"
 	source "package/python-libusb1/Config.in"
+	source "package/python-libyang/Config.in"
 	source "package/python-lmdb/Config.in"
 	source "package/python-lockfile/Config.in"
 	source "package/python-log-rate-limit/Config.in"
diff --git a/package/python-libyang/Config.in b/package/python-libyang/Config.in
new file mode 100644
index 0000000000..c314beb0ea
--- /dev/null
+++ b/package/python-libyang/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_PYTHON_LIBYANG
+	bool "python-libyang"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libyang
+	depends on !BR2_STATIC_LIBS # libyang
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	help
+	  Python CFFI bindings for the libyang YANG library.
+
+	  This package provides the 'libyang' Python module, used by
+	  higher-level tooling such as python-sysrepo.
+
+	  https://github.com/CESNET/libyang-python
+
+comment "python-libyang needs libyang"
+	depends on !BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS
diff --git a/package/python-libyang/python-libyang.hash b/package/python-libyang/python-libyang.hash
new file mode 100644
index 0000000000..077d97cdd8
--- /dev/null
+++ b/package/python-libyang/python-libyang.hash
@@ -0,0 +1,5 @@
+# From https://pypi.org/pypi/libyang/3.3.0/json
+sha256  97da2c908a8a3607ac834f2acec224ea53a4b9e9770c13e5598513641decf637  libyang-3.3.0.tar.gz
+
+# Locally computed
+sha256  c8d554f918d32b1467f35829e1cfb753764dd683c6edcecc877a4d7e9f05b2a7  LICENSE
diff --git a/package/python-libyang/python-libyang.mk b/package/python-libyang/python-libyang.mk
new file mode 100644
index 0000000000..2e4d1f3b90
--- /dev/null
+++ b/package/python-libyang/python-libyang.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# python-libyang
+#
+################################################################################
+
+PYTHON_LIBYANG_VERSION = 3.3.0
+PYTHON_LIBYANG_SOURCE = libyang-$(PYTHON_LIBYANG_VERSION).tar.gz
+PYTHON_LIBYANG_SITE = https://files.pythonhosted.org/packages/source/l/libyang
+
+PYTHON_LIBYANG_LICENSE = MIT
+PYTHON_LIBYANG_LICENSE_FILES = LICENSE
+
+# pyproject.toml (PEP517)
+PYTHON_LIBYANG_SETUP_TYPE = pep517
+
+PYTHON_LIBYANG_DEPENDENCIES = \
+	libyang \
+	host-python-cffi
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_libyang.py b/support/testing/tests/package/sample_python_libyang.py
new file mode 100644
index 0000000000..36ca8915cf
--- /dev/null
+++ b/support/testing/tests/package/sample_python_libyang.py
@@ -0,0 +1,41 @@
+# test from https://github.com/CESNET/libyang-python/blob/master/README.rst
+
+import libyang
+
+ctx = libyang.Context()
+
+module = ctx.parse_module_str('''
+module example {
+  namespace "urn:example";
+  prefix "ex";
+  container data {
+    list interface {
+      key name;
+      leaf name {
+        type string;
+      }
+      leaf address {
+        type string;
+      }
+    }
+    leaf hostname {
+      type string;
+    }
+  }
+}
+''')
+
+node = module.parse_data_dict({
+    'data': {
+        'hostname': 'foobar',
+        'interface': [
+            {'name': 'eth0', 'address': '1.2.3.4/24'},
+            {'name': 'lo', 'address': '127.0.0.1'},
+        ],
+    },
+})
+
+print(node.print_mem('xml', pretty=True))
+
+node.free()
+ctx.destroy()
diff --git a/support/testing/tests/package/test_python_libyang.py b/support/testing/tests/package/test_python_libyang.py
new file mode 100644
index 0000000000..c485de2a67
--- /dev/null
+++ b/support/testing/tests/package/test_python_libyang.py
@@ -0,0 +1,26 @@
+import os
+from xml.etree import ElementTree
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonLibyang(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_LIBYANG=y
+        """
+    sample_scripts = ["tests/package/sample_python_libyang.py"]
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+
+        cmd = self.interpreter + " " + os.path.basename(self.sample_scripts[0])
+        output, exit_code = self.emulator.run(cmd, timeout=15)
+        self.assertEqual(exit_code, 0)
+
+        tree = ElementTree.fromstringlist(output)
+        self.assertEqual(tree.tag, '{urn:example}data')
+        self.assertEqual(tree.find('.//{*}hostname').text, 'foobar')
+        self.assertEqual(len(tree.find('.//{*}interface')), 2)
-- 
2.51.0
:x
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
