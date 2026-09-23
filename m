Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE06EC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC03281220;
	Thu, 24 Sep 2026 18:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eXyW2zpAhkk; Thu, 24 Sep 2026 18:57:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 877998127F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276255;
	b=jliLlIpzR/hd4CuvH2FKIS8EFunWg9YVFuFTGnzk1jatyEeR/9+CZ7xAlT5Qppq38dQn
	 B14G0eJu/aN3h22DteCnumiC6JGJc6TQXWAi2KceuBUagVY9XBwSl9y3XZBhYv816PU2T
	 qvN8dTenXym7851cvFV75jS0fVn6eqQuk839uayPhGL7vEHCcCZmrWTZrgE/3h+MkM39a
	 QI7YHSyoBpvQT5OqWHnG/Jwx15wkT9qIR2gRaxX4q4HUkCE/ORCx56THfcLw34B/fXQVt
	 6sJSfaNKk3Nyh0tNYmx3mWun577HmbaU9CrGELFcYWj6KAmlFAHO8pNwQ4qiWf4mdWQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276255;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=WbVoqWGW7LSxv5PjNx5hk4Xr67zR8LAkA0QXyp6qYvc=;
	b=c+Hk/l1hdrMjstTIGohBesSQJjljJX8mrvmpimE5OvQkl2O74X78LZ30UE4mUMhF+2Q+
	 A48rrHorVnBNokRB+Peec1lKdDDs0HfmOVJq3lF0UJERocuw/pvz+kS1RlDjabbgcNJiA
	 lySmNU06RoyUZljnDOz421Tld/zTdzfQdSMiXYBpqzNQFm9idr73YuKaRicAx9/2pBJ4b
	 JO/+lhO1IHU3jPeW5VMs9Ffgye9Qa6PgQktTZ1EFVvj2nYkoMYSjLUmKqIBEKKc1uejGu
	 5IVByJQXPucp2bEyB76eCdY2OkVZv1jDXptI1wuz9SXrj+2JwIq/2eLYHOp7Z1QFz5A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276255;
	bh=WbVoqWGW7LSxv5PjNx5hk4Xr67zR8LAkA0QXyp6qYvc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KTvrTyxrum5gc1OL0w5Kh07rtSVxqGfgS/JS0znLjKF97XcmelpIVesQ2liEdIf0t
	 e5UkvRLa3H8hykEdShpno4Gc2cBExfRXDHyWd0KEXa+IYtu2s299bvFX9PtdmNxCMh
	 dy6or916w+ZJaS8I/TxQJzUFWtQMC7gX79/hpF86rzikLcEWDp7vmJTpk+amlkhIfG
	 amT1zCT8qOgSJPHHwZsx1t2BvfSSbnYobIaWfdDNSPzkne9eX+9fV6HlSta8jcdaW6
	 V9g299g16M3slCMfdHw/dwJlsJ3NywhPDKaNdUgfV8eGw00jPMqBhgHP8WtPtZiVk0
	 k+P3vzFxjiskA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 877998127F;
	Thu, 24 Sep 2026 18:57:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC503332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC5A040ACB
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRmIhiy8xVPp for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6B3A640AAA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276203;
 b=CmL6P6ZwaFWWwCvWLx1g6/YwmaFCMJfD1/byaQzstc+3oQdtZW7zRw6uN0Ss7fpDuNkl
 LFbPYGnKwtmVm4eoeNTLqgf+KkDy0HDuBSzMeERKMmKqNefRkJiBwjAimnSkZm31vOoQG
 2amHfXAy567el6uXMsdAHmUO6iEZsXrYDyu1GlylWwZD6zOIT9v+rle6HnyaQS5nBeRna
 mj6xbB6AQSkjxrKymL0rRnoYAc2amniwZFtaV1GCUIrg1VFeU8Hy83YmdMNkFbfzDZipn
 jInbhOyM/XnDjlkdUMJvjY833XmPqXctDcn08zDgwBGZL4PDnUFoWPZ4esUwgnz4wPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276203;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Wvna5KGII42v3sqPhdXFiYzla0G5kJ08qtfip2GNbCQ=;
 b=ShXLOUKAv6fX6t5Cwp4ZJrQuwCEOmpue38qW0EuNH+nwcRWa2w7SLSe3OzVlVTUFFW3E
 q5cvkmyMDa6kEfHF3K4ZYtpKkAk/8KLnN2F5qSniyRm6h2EuHVS0msscpmtPp9YOY6tma
 pOGh7ypvewrx2x6AcBxtf69OJVrXnYejtr5zy5GSv89DAxq+S73uhgYJnCbXh1iJAB35c
 m64jhKwMshH758Br575Y+G8wJCmCbvGMUaTuQRsGxNBvYgBGHDRmSdsaaYGrQpLhiKEC4
 aTQndGWkDJZQ2HljeNhO4gkXu0uCKZhxQy/7KTUfVtEgcwpIGt2CF2s1yx4U/pgJ4ng==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B3A640AAA
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FA2698383; Thu, 24 Sep 2026 18:55:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:14:53 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 09d589ff35c9904ca678becf74e7c6b77967cc3e
X-Git-Newrev: 5d1a9b07c0f293fb78f626df5ca5022db7c7df04
X-Patchwork-Hint: ignore
Message-Id: <20260924185533.0FA2698383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: add FLAT
 stack size test case
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2718811856552834906=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2718811856552834906==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5d1a9b07c0f293fb78f626df5ca5022db7c7df04
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Add an infrastructure test case to verify that the per-package
<PKG>_FLAT_STACKSIZE variable correctly configures the stack size in the
generated FLAT binary header.

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0bf452504516ab28233226ab531eaa2194d98558)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS                                         |  3 +++
 .../core/br2-external/flat-stacksize/Config.in     |  1 +
 .../core/br2-external/flat-stacksize/external.desc |  1 +
 .../core/br2-external/flat-stacksize/external.mk   |  1 +
 .../package/flat-stacksize-test/Config.in          |  7 ++++++
 .../package/flat-stacksize-test/Makefile           | 15 ++++++++++++
 .../flat-stacksize-test/flat-stacksize-test.mk     | 22 ++++++++++++++++++
 .../package/flat-stacksize-test/main.c             |  3 +++
 support/testing/tests/core/test_flat_stacksize.py  | 27 ++++++++++++++++++++++
 9 files changed, 80 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 727ebe7007..a408fd7bb6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1074,6 +1074,9 @@ F:	configs/freescale_imx6ullevk_defconfig
 N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
 
+N:	Fengwei Tan <tfx2001@outlook.com>
+F:	support/testing/tests/core/test_flat_stacksize.py
+
 N:	Fiona Klute <fiona.klute@gmx.de>
 F:	package/*/S*
 F:	package/panel-mipi-dbi-firmware/
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/Config.in b/support/testing/tests/core/br2-external/flat-stacksize/Config.in
new file mode 100644
index 0000000000..cdb4e9f057
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_FLAT_STACKSIZE_PATH/package/flat-stacksize-test/Config.in"
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/external.desc b/support/testing/tests/core/br2-external/flat-stacksize/external.desc
new file mode 100644
index 0000000000..f9c1a745e0
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/external.desc
@@ -0,0 +1 @@
+name: FLAT_STACKSIZE
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/external.mk b/support/testing/tests/core/br2-external/flat-stacksize/external.mk
new file mode 100644
index 0000000000..82900bf036
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_FLAT_STACKSIZE_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Config.in b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Config.in
new file mode 100644
index 0000000000..67cf9964f5
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FLAT_STACKSIZE_TEST
+	bool "flat-stacksize-test"
+	depends on BR2_BINFMT_FLAT && !BR2_USE_MMU
+	help
+	  Package for testing the $(PKG)_FLAT_STACKSIZE variable, which
+	  defines the stack size of an application built into the
+	  FLAT binary format.
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Makefile b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Makefile
new file mode 100644
index 0000000000..dc7681bf56
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Makefile
@@ -0,0 +1,15 @@
+O ?= $(CURDIR)
+
+CANONICAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))
+
+TARGET := $(CANONICAL_O)/flat_stacksize_test
+
+all: $(TARGET)
+
+$(TARGET): main.c
+	$(CC) $(CFLAGS) -o $@ main.c
+
+clean:
+	rm -f $(TARGET)
+
+.PHONY: all clean
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/flat-stacksize-test.mk b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/flat-stacksize-test.mk
new file mode 100644
index 0000000000..64695ad2dc
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/flat-stacksize-test.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# flat-stacksize-test
+#
+################################################################################
+
+# Define a stack size that is different from the default FLAT
+# stack size (4096 bytes).
+FLAT_STACKSIZE_TEST_FLAT_STACKSIZE = 8192
+
+define FLAT_STACKSIZE_TEST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		-C $(FLAT_STACKSIZE_TEST_PKGDIR) O=$(@D) \
+		$(TARGET_CONFIGURE_OPTS)
+endef
+
+define FLAT_STACKSIZE_TEST_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/flat_stacksize_test \
+		$(TARGET_DIR)/usr/bin/flat_stacksize_test
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/main.c b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/main.c
new file mode 100644
index 0000000000..9b6bdc2ec2
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/main.c
@@ -0,0 +1,3 @@
+int main(void) {
+    return 0;
+}
diff --git a/support/testing/tests/core/test_flat_stacksize.py b/support/testing/tests/core/test_flat_stacksize.py
new file mode 100644
index 0000000000..ab41fadbc8
--- /dev/null
+++ b/support/testing/tests/core/test_flat_stacksize.py
@@ -0,0 +1,27 @@
+import os
+
+import infra.basetest
+
+
+class TestFlatStackSize(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/core/br2-external/flat-stacksize")]
+    config = """
+        BR2_arm=y
+        BR2_cortex_m4=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_FLAT_STACKSIZE_TEST=y
+        """
+
+    def test_run(self):
+        binary = os.path.join(
+            self.builddir, "target", "usr", "bin", "flat_stacksize_test"
+        )
+        self.assertTrue(os.path.exists(binary))
+
+        # Check the FLAT binary header really carries the stack size
+        # declared by the package (8192 = 0x2000).
+        out = infra.run_cmd_on_host(self.builddir, ["arm-linux-flthdr", binary])
+        self.assertIn("Stack Size:   0x2000\n", out)

--===============2718811856552834906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2718811856552834906==--
