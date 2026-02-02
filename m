Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23890E7DEF3
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 15:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC8C66073A;
	Mon,  2 Feb 2026 15:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8pmLxYtSZCT7; Mon,  2 Feb 2026 15:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E069A60747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770044499;
	bh=1V0RPf8/kbeqDkbhM381f5EbN0h6ftCau7UE/kYMPVw=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=P1+n1RsEfBkE1L8W4aEWlBS2iZqFIxXFNCTEtL15rpWLjm6DfISZeSs2dKwmBthnL
	 bGbtpPTAIdgM3rhtEPs8YcRqfqlL3Pl6zI2a53IHRUMZKk2uqlZ5lCWBU3FUDAOE9T
	 jbPHaNcDOKU6bwN1zGnMPU5zCBHygwJ+qW3EI6EYzr8Of/GDVBUPTQfLsHGxT6htZv
	 2RtSMCAn+nOxQCcfkQtlboTJuFBEhHz/QINfUL8+tLwWiRIIud8L7m6+y+GLHqIp3p
	 bNVGe7K75JLKL9Hw5NNoyt2oBSnQmp1DNlnuXTSYOpIG5ZQPN23L0kiwEIN6iOK5Sw
	 YYqSH1AegM4jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E069A60747;
	Mon,  2 Feb 2026 15:01:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 437D823E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30AC6401EC
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtITwkJh3LP0 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 15:01:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E5BC3401E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5BC3401E1
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5BC3401E1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:01:35 +0000 (UTC)
Received: from framework-OT (host-109-89-232-55.dynamic.voo.be [109.89.232.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 463992C8301B;
 Mon, 02 Feb 2026 16:01:32 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon,  2 Feb 2026 16:01:42 +0100
Message-ID: <20260202150143.3996204-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202150143.3996204-1-buildroot@bubu1.eu>
References: <20260202150143.3996204-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770044492; bh=ZOc5cUfTfTzHLHQ9Y1NNATZhu4Sxtit0KEcxkpDKMDE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ue1RoU+D7TJX/aGpkvvG9aclYhpO4aXCbdJt7hRhVEfH6iSQz7c4+hS4MGFd3dwKg
 WFdLSJkp23Zt3COEguVHWSwvIrVv3oynDqT2Je5qP9S4BtAlxATm2doDv9un5IwCag
 aWcr6s2Y+69KjI/7nx5Eq5Lh+GdhVPGr6BFKa8mqMFWupcCmTeORmQpTNTdm2VPRor
 5DaVg2R5qQfuMZhNGt1a9by0Z/C6Gp6gETmtq5icEfbyCv29tQoDqxByXvwBjOXIHk
 /T2RkzyJeFmBI+DoS5P5OdiIZBqB/UHNs4fRaLNiaseyB1ytdxslTyk7OuRp9UNOoM
 VU44INWTeZ/AA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=ue1RoU+D
Subject: [Buildroot] [PATCH 2/2] package/python-requests: depend on system
 certificates instead of python-certifi
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add patch from archlinux distribution[1] that references system
certificate store instead of using the python certifi package.

As a user of the requests package, I'd expect this to use the system
certificate store and not pull in another certificate store that must be
kept up-to-date separately (and is currently outdated in buildroot).

The file that is patched explicitly mentions that as an option for
distributions. This approach is taken by Fedora[2] and Archlinux but not
by other distributions (alpine, openembedded, debian, nix, guix).

[1] https://gitlab.archlinux.org/archlinux/packaging/packages/python-requests/-/blob/main/certs.patch?ref_type=heads
[2] https://koji.fedoraproject.org/koji/fileinfo?rpmID=43302745&filename=system-certs.patch

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 .../0001-use-systemd-cert-bundle.patch          | 17 +++++++++++++++++
 package/python-requests/Config.in               |  2 +-
 .../tests/package/test_python_requests.py       | 14 ++++++++------
 3 files changed, 26 insertions(+), 7 deletions(-)
 create mode 100644 package/python-requests/0001-use-systemd-cert-bundle.patch

diff --git a/package/python-requests/0001-use-systemd-cert-bundle.patch b/package/python-requests/0001-use-systemd-cert-bundle.patch
new file mode 100644
index 0000000000..3c123e52b1
--- /dev/null
+++ b/package/python-requests/0001-use-systemd-cert-bundle.patch
@@ -0,0 +1,17 @@
+---
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
+Upstream: N/A, supposed to be patched downstream
+diff --git a/src/requests/certs.py b/src/requests/certs.py
+index be422c3e..9bfe1c80 100644
+--- a/src/requests/certs.py
++++ b/src/requests/certs.py
+@@ -11,7 +11,8 @@ If you are packaging Requests, e.g., for a Linux distribution or a managed
+ environment, you can change the definition of where() to return a separately
+ packaged CA bundle.
+ """
+-from certifi import where
++def where():
++    return "/etc/ssl/certs/ca-certificates.crt"
+ 
+ if __name__ == "__main__":
+     print(where())
diff --git a/package/python-requests/Config.in b/package/python-requests/Config.in
index 929b99657c..e2e329749e 100644
--- a/package/python-requests/Config.in
+++ b/package/python-requests/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_REQUESTS
 	bool "python-requests"
-	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
+	select BR2_PACKAGE_CA_CERTIFICATES # runtime
 	select BR2_PACKAGE_PYTHON_CHARSET_NORMALIZER # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
diff --git a/support/testing/tests/package/test_python_requests.py b/support/testing/tests/package/test_python_requests.py
index 48f910139b..33392839b0 100644
--- a/support/testing/tests/package/test_python_requests.py
+++ b/support/testing/tests/package/test_python_requests.py
@@ -4,18 +4,20 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3Requests(TestPythonPackageBase):
     __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
+    config = (
+        TestPythonPackageBase.config
+        + """
         BR2_SYSTEM_DHCP="eth0"
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_REQUESTS=y
         """
+    )
     sample_scripts = ["tests/package/sample_python_requests.py"]
-    timeout=15
+    timeout = 15
 
     def login(self):
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv7",
-                           kernel="builtin",
-                           options=["-initrd", cpio_file])
+        self.emulator.boot(
+            arch="armv7", kernel="builtin", options=["-initrd", cpio_file]
+        )
         self.emulator.login()
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
