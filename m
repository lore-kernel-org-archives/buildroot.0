Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F402EED7B93
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 10:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B83144292C;
	Tue, 14 Apr 2026 10:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YdatBA0Gqxl; Tue, 14 Apr 2026 10:06:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A29CB42965
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776161203;
	bh=3ai/M5q6+FB8yuzj81RhFKYHTPDoMVbwjVB6QyTRqh4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=fwaPLWTV3JUZFum7C5XbQO3QuyE/xyPhSgzIskyW8JwrMNA/vWF4SokBd3spSLFHL
	 irsoFFZE59Jtny77YFXyse38B/919dCltk9li7soSrLSuGx13MmozlA5FcGg3BmgWK
	 yYZL6p9Gs6CgqN+IPBn8V8Z/ms3ryWgF++QwC7YOzvH2uO5ttQyApvxeE3Z1cf+ko6
	 HBQToTvD9qhZggQ0liLE+0rBnXbZHKABnVZ18Ewkw2m2SwZ9xkQvkCTqOg3/rKJNzl
	 HfUnn2Nse0+n6bIEP6e1J+NYNR0iSm6yVLzr1+kjoGoRpWRKiSDNsTu9noiEobItLj
	 5jyWU6GwIFnBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A29CB42965;
	Tue, 14 Apr 2026 10:06:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65792375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 10:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 635BB42965
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 10:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id af4_g597TDjl for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 10:06:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.33.174;
 helo=11.mo534.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 894C14292C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 894C14292C
Received: from 11.mo534.mail-out.ovh.net (11.mo534.mail-out.ovh.net
 [46.105.33.174])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 894C14292C
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 10:06:39 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net
 (director2.derp.mail-out.ovh.net [79.137.60.36])
 by mo534.mail-out.ovh.net (Postfix) with ESMTPS id 4fw0935MMfz6Myt;
 Tue, 14 Apr 2026 09:58:47 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net
 (director2.derp.mail-out.ovh.net. [127.0.0.1])
 by director2.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <mooz@blockos.org>; Tue, 14 Apr 2026 09:58:47 +0000 (UTC)
Received: from mta3.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.109.249.197])
 by director2.derp.mail-out.ovh.net (Postfix) with ESMTPS id
 4fw0934TpPz1yhZ; Tue, 14 Apr 2026 09:58:47 +0000 (UTC)
Received: from blockos.org (unknown [10.1.6.6])
 (Authenticated sender: mooz@blockos.org)
 by mta3.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 975709415D0; 
 Tue, 14 Apr 2026 09:58:46 +0000 (UTC)
X-OVh-ClientIp: 213.36.7.12
From: Vincent Cruz <mooz@blockos.org>
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 11:56:25 +0200
Message-ID: <20260414095841.445592-1-mooz@blockos.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
x-ovh-tracer-id: 1141381033407269794
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGEleDuZF7qvu0gLVn/pVN8l9+YpV6dI/ZnfmQl7tidSt7o3X/WNldqb5C2J3dwlsfeR7D3qGmJmG93lzU9KezHgh3oMNm8fPjFi90UDjjvcLXUp4W4M18NWXzKVaQaBVRmGYlMvhss3n/YbOJinF/5Xy0eXpfKG9HiuZBINLqDEvjIfKCgI35sTf8qoSiEC+zBw8LxcBgPxQQUxlezO3dM1KLgg0MMlfkk/Zat0IBqu1wNPZj223U4gXff5uF3W+fC0NHEa2G3jlNIdfO19HmFj0v9Kf6KfDweuepIEgaCCbWDPTITj6sUt7YRCU6Io+8Y5/N/dfYiIwZZykj1NkESXoSLvbdXbujp3f3wR1PRukGxhw/FOnWeDtOlkmt6X2lmlOwkSIS1/SZBMKE2xkWik7LY2bjyy8BDwz01cOuN51QJDWeaQ6P5EO0FMfn/1DVdcJ/R8vS5WrWhm6DycWcjGja40GyA8fVrzt9HxvQz9u2Ybx5fIuE4dPjMxL3KUNKFH7MN2H0YQGqczFXcyTqYmPd2H3472R6PfqZ/ycPPIWBWlZdg8EgY/MHbwCsXmK1xH8Uov5hAjWoPkBUTMQfytj8oS4myHOxsB+8q6w0T9CyNrshyKnqDt+5HzkxVynQLu0vgDW4JXE/FUt2HjGIs8I5h6QVK4qG43R1kRz9wfA
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-112S006b408b295-a44a-4060-8526-0a27c1b58b97,
 57EC06D2F55947E19987155D42FF0DD2D92A6C82) smtp.auth=mooz@blockos.org
Subject: [Buildroot] [PATCH v2] package/python-ncclient: new package
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

ncclient is a Python library for NETCONF clients. It facilitates
client-side scripting and application development around NETCONF.

https://github.com/ncclient/ncclient
Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Vincent Cruz <mooz@blockos.org>

---
Changes v1 -> v2:
  - Bump version to 0.7.1
  - Add test

Signed-off-by: Vincent Cruz <mooz@blockos.org>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/python-ncclient/Config.in             | 13 +++++++
 package/python-ncclient/python-ncclient.hash  |  5 +++
 package/python-ncclient/python-ncclient.mk    | 17 ++++++++
 .../tests/package/sample_python_ncclient.py   | 19 +++++++++
 .../tests/package/test_python_ncclient.py     | 39 +++++++++++++++++++
 .../rootfs-overlay/root/add_root.xml          | 35 +++++++++++++++++
 8 files changed, 130 insertions(+)
 create mode 100644 package/python-ncclient/Config.in
 create mode 100644 package/python-ncclient/python-ncclient.hash
 create mode 100644 package/python-ncclient/python-ncclient.mk
 create mode 100644 support/testing/tests/package/sample_python_ncclient.py
 create mode 100644 support/testing/tests/package/test_python_ncclient.py
 create mode 100644 support/testing/tests/package/test_python_ncclient/rootfs-overlay/root/add_root.xml

diff --git a/DEVELOPERS b/DEVELOPERS
index 1ad64e876e..4a4a25e2c8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3369,6 +3369,7 @@ F:	package/dpdk/
 F:	package/libecoli/
 F:	package/libnss-ato/
 F:	package/libyang-cpp/
+F:	package/python-ncclient/
 F:	package/sysrepo-cpp/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 71501cea53..4eeac53563 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1250,6 +1250,7 @@ menu "External python modules"
 	source "package/python-mwscrape2slob/Config.in"
 	source "package/python-mypy/Config.in"
 	source "package/python-mypy-extensions/Config.in"
+	source "package/python-ncclient/Config.in"
 	source "package/python-nested-dict/Config.in"
 	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
diff --git a/package/python-ncclient/Config.in b/package/python-ncclient/Config.in
new file mode 100644
index 0000000000..7cad899ca2
--- /dev/null
+++ b/package/python-ncclient/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_NCCLIENT
+	bool "python-ncclient"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-paramiko
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtimeq
+	select BR2_PACKAGE_PYTHON_LXML # runtime
+	select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  ncclient is a Python library for NETCONF clients. It
+	  facilitates client-side scripting and application
+	  development around NETCONF.
+
+	  https://github.com/ncclient/ncclient
diff --git a/package/python-ncclient/python-ncclient.hash b/package/python-ncclient/python-ncclient.hash
new file mode 100644
index 0000000000..5901cb0ddc
--- /dev/null
+++ b/package/python-ncclient/python-ncclient.hash
@@ -0,0 +1,5 @@
+# From https://pypi.org/pypi/ncclient/0.7.1/json
+sha256  60dabb6ac1a2d84fbc3349cb104ef7d0c5d12cf8eee43fefc715410d70410ddc  ncclient-0.7.1.tar.gz
+
+# Locally computed
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-ncclient/python-ncclient.mk b/package/python-ncclient/python-ncclient.mk
new file mode 100644
index 0000000000..36223e835a
--- /dev/null
+++ b/package/python-ncclient/python-ncclient.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-ncclient
+#
+################################################################################
+
+PYTHON_NCCLIENT_VERSION = 0.7.1
+PYTHON_NCCLIENT_SOURCE = ncclient-$(PYTHON_NCCLIENT_VERSION).tar.gz
+PYTHON_NCCLIENT_SITE = https://files.pythonhosted.org/packages/source/n/ncclient
+
+PYTHON_NCCLIENT_LICENSE = Apache-2.0
+PYTHON_NCCLIENT_LICENSE_FILES = LICENSE
+
+PYTHON_NCCLIENT_SETUP_TYPE = hatch
+PYTHON_NCCLIENT_DEPENDENCIES = host-python-hatch-vcs
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_ncclient.py b/support/testing/tests/package/sample_python_ncclient.py
new file mode 100644
index 0000000000..cfd4e260e8
--- /dev/null
+++ b/support/testing/tests/package/sample_python_ncclient.py
@@ -0,0 +1,19 @@
+import os
+from ncclient import manager
+
+filter = """
+<filter xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
+    <netconf-state xmlns="urn:ietf:params:xml:ns:yang:ietf-netconf-monitoring">
+        <sessions/>
+    </netconf-state>
+</filter>
+"""
+
+with manager.connect(host='localhost',
+                     port=830,
+                     username=os.getenv("USER"),
+                     key_filename='/root/.ssh/dummy_key',
+                     hostkey_verify=False,
+                     allow_agent=False,
+                     look_for_keys=False) as m:
+    print(m.get(filter=filter).data_xml)
diff --git a/support/testing/tests/package/test_python_ncclient.py b/support/testing/tests/package/test_python_ncclient.py
new file mode 100644
index 0000000000..ca77b2080c
--- /dev/null
+++ b/support/testing/tests/package/test_python_ncclient.py
@@ -0,0 +1,39 @@
+import os
+import infra
+from xml.etree import ElementTree
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonNCClient(TestPythonPackageBase):
+    rootfs_overlay = infra.filepath("tests/package/test_python_ncclient/rootfs-overlay")
+
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        f"""
+        BR2_INSTALL_LIBSTDCPP=y
+        BR2_PACKAGE_OPENSSH=y
+        BR2_PACKAGE_NETOPEER2=y
+        BR2_PACKAGE_NETOPEER2_CLI=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_NCCLIENT=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        """
+    sample_scripts = ["tests/package/sample_python_ncclient.py"]
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+
+        self.assertRunOk('mkdir -p /root/.ssh')
+        self.assertRunOk('ssh-keygen -t ed25519 -f /root/.ssh/dummy_key -N ""')
+        self.assertRunOk('cat /root/.ssh/dummy_key.pub > /root/.ssh/authorized_keys')
+
+        self.assertRunOk('sysrepocfg -f xml -I ./add_root.xml -d running -m ietf-netconf-server')
+
+        cmd = "%s %s" % (self.interpreter, os.path.basename(self.sample_scripts[0]))
+        output, exit_code = self.emulator.run(cmd, timeout=15)
+        self.assertEqual(exit_code, 0)
+
+        tree = ElementTree.fromstringlist(output)
+        self.assertEqual(tree.tag, '{urn:ietf:params:xml:ns:netconf:base:1.0}data')
+        self.assertEqual(tree.find('.//{*}username').text, 'root')
diff --git a/support/testing/tests/package/test_python_ncclient/rootfs-overlay/root/add_root.xml b/support/testing/tests/package/test_python_ncclient/rootfs-overlay/root/add_root.xml
new file mode 100644
index 0000000000..4f48be2483
--- /dev/null
+++ b/support/testing/tests/package/test_python_ncclient/rootfs-overlay/root/add_root.xml
@@ -0,0 +1,35 @@
+<?xml version="1.0"?>
+<netconf-server xmlns="urn:ietf:params:xml:ns:yang:ietf-netconf-server">
+  <listen>
+    <endpoints>
+      <endpoint>
+        <name>default-ssh</name>
+        <ssh>
+          <tcp-server-parameters>
+            <local-address>0.0.0.0</local-address>
+          </tcp-server-parameters>
+          <ssh-server-parameters>
+            <server-identity>
+              <host-key>
+                <name>default-key</name>
+                <public-key>
+                  <central-keystore-reference>genkey</central-keystore-reference>
+                </public-key>
+              </host-key>
+            </server-identity>
+            <client-authentication>
+              <users>
+                <user>
+                  <name>root</name>
+                  <public-keys>
+                    <use-system-keys xmlns="urn:cesnet:libnetconf2-netconf-server"/>
+                  </public-keys>
+                </user>
+              </users>
+            </client-authentication>
+          </ssh-server-parameters>
+        </ssh>
+      </endpoint>
+    </endpoints>
+  </listen>
+</netconf-server>
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
