Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DB5C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F094B81463;
	Thu, 24 Sep 2026 18:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id koabbZK7tclu; Thu, 24 Sep 2026 18:59:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D05E48146D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276371;
	b=nOeqBx7nlx5HeP/gguOd3Efy+eqhkAzcZzXRmHaRoCrgM10qRXmjrrosoH0hhYteT7xq
	 dnzHsoqkscaVKVQuhZ0Fo+UTv58qhBgtD8I/EZnO4TL/i0zGvOB/p7I2Io78gCIvbe00p
	 z+g6ar1222VbcBvWqsEhjVrb1Kj0oHwj0Qmva9NmYpUb2ImAUuaEBCDK6FWQR7oiouc6i
	 f6cLah2aKrlP7IL8JmMfo+McsYKdXBTpkZzTyA0gVVhANTP9+TDDJ1VmRhQn8wnW7AvhK
	 4TpIpllkkjjDppGgjigzUywAFUSdSGCe12bXcm8I0b1ZW1QW5CE+r8Q68UMLWDqwbZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276371;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=I+bPv+xWzK/0dHzrmOGiRWAD0SPzaP5up+I0rh8x468=;
	b=IwW2oZRs5ImJKXtaLqe4yLAeuoyj9eFupvZKoFWkhfcaBseE3YbmCnjkUpsckwty2THr
	 /TgrN+DAkeIBzI33eQp34BblIMW5rXB5gcP0zFDhWnbvWU+xF6U1HMVXuagYCUQ45upgY
	 F3vY29snOWTLe8k6NpV515tQy1Xf70/DykjbmFDfYXyRVfw46uL0F8It1EvaQhWjuiWnt
	 bXckJVZsJL6Nihijp+SYZo5pA9Mieijw5gfLEwOmbVId6yj6417zicZx2kUrWKYvRPU/i
	 0V46N/Ak9gALFTxcd+sW4AtAPxAdnx8LxuTLTD2qNos3A82I/VtbNzQNPv4DANlTuXw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276371;
	bh=I+bPv+xWzK/0dHzrmOGiRWAD0SPzaP5up+I0rh8x468=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=clX/z8LNU6GZbK1HELhYH5PSua0SZC/cpvyDC9a732pYd48gQMpFH4bRaJMZErDkZ
	 m/UMqNOOr4tm0/N75DUy30SSzLHYJ+mkKivLuJdVmXy0ikPji4uqI1tFkCLW5kf2G3
	 70/CcXGU1Js5jrc7DtQ9lFTVEb38EEwxYxPjlBjkDFjXfRG5EDaDbPLLOo4qq+pEq4
	 sOkulNtRZh4IS/qi/Zf/FsFelQoB81qu6OSkJD8fvJ0AVm4Mt5QPeYoswDAqVTO5ZC
	 kxV37KiFU6SCsNRUPnEiEOP1cyJTjtmRE77UQZBl8EIluCwN692HA/0SVxyCYM3lCE
	 pUfOLE/UWISEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D05E48146D;
	Thu, 24 Sep 2026 18:59:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28ADB3B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14A4481258
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CT2rPq21-eyB for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 32E4B81225
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276212;
 b=roabXA2xfMQwqguD/QfS/oB4MZGHUOz/vzqnEPTS58v8B42PP2T0cCSCmhIk7zcaX/p1
 NKMog3CME81vFMEhTOOydZOVSD32AfIkGsSrgDoxIHZ29POHsWYIavAryhYa5GnrpkGE1
 AMIlbodqND3iM5P/0CJh7owXTF1aXTXvYPWOksfy0vUOdMzAzYgObalXTHezSXtcdJEKF
 NuGx7PqzMAct98L/a4oY+RTT/rJjJqhLrjz3IpedBiAMUjHO+UF2xAu5ovTAzn4IPP5Mv
 caZeGsfOU0EVM1sD9G7YfR+VNGH9vTRF9tz+U/6dNP/STn9+EltIIrck6Inxg1BVmYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276212;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7Q3Ur9PKFOkNDvvoztuX4gDz9BdfqRQ11M9BbvUE91I=;
 b=CGdqpKMR1JJ6mAdc+S3BfC/s2ymjEojatOGhF10UirZzdvx7G7eqicPoZEzQ7JVi+p6N
 lsAbjNwOQXsRmiP6yvaOz1zRkhK88qrCqRAsHkU9Ba4k9ywEFVRFVNhfqCTWd+kHs7wwy
 3Wq/fDeHLqRReEX4pqf7WI8qm69FDLjgAfMaqpjrAARo7JBEtPSzuEOoVtCqltu/62wIz
 Q9tsaqRYU2dW+BiwrnbRkK9qUMbHxt5Siy/e3/FqIrk5uOajj1WXhLdBDROhQLXu/RIfD
 o5xNaCHzq8mCEdV2GDXY9Re5aq4XkXK27pjab7xZwY4TnuC+RlOGO3xHi2K15tS18UA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32E4B81225
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEBC59832E; Thu, 24 Sep 2026 18:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:14:55 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: bd2a3cc2b027c06a05e718cae16c66ea2ca24665
X-Git-Newrev: 768e3720fc74404b41519c3ee1a3eb7d463c9c1b
X-Patchwork-Hint: ignore
Message-Id: <20260924185541.BEBC59832E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] support/testing: add FLAT
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
Content-Type: multipart/mixed; boundary="===============6771065215690210481=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6771065215690210481==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/768e3720fc74404b41519c3ee1a3eb7d463c9c1b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
index 0b5060f1fc..3eb067dcb7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1123,6 +1123,9 @@ F:	configs/freescale_imx6ullevk_defconfig
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

--===============6771065215690210481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6771065215690210481==--
