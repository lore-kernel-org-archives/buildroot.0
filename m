Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875E7C982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1642D6062D;
	Wed, 16 Sep 2026 20:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTkze5cmjzBQ; Wed, 16 Sep 2026 20:45:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EA92160698
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789591506;
	b=eBYuxRfvXE+OyEY2g+QWAxw3vktAoUGw9XVLEPgvgToLVFQu1vaW+69gaBMb0pHiJLgi
	 ZkLF42+/m7SSXdS0ubd4q/f+FszZxrIGvswoTX38pNN2g+5EvR13RNosXunKuJ5IgAipP
	 mQ+rjcWLJZZGBP/qVbmRlfa/Etv2FqTCzkpMY6IsSEM62ElCyITYKJ3n5Y9Ec9cs0b50L
	 YPTyI6nY4vUhBJesOXrOPRlhh9m6eL5E0BVzg8Nlp0bIPVSFtgr+2KzpCD+ILE/YLAoX0
	 Gop45aVUA21pRj4A3hLyMH1CpoBoWOCxPtCD12ZOowbQ/EJTH3m8cEXO1vrTuOijrwQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789591506;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Pr1zDmzU6NNauQeCis561wU1ZEsauTqn7kxxzCQuJ+Q=;
	b=hQrP3FRgfWiemIQhcGMah0K80/w1y1oxMLq/wnkBDrl1yHIlhPvUo/0/8zgmaQaVlu+Y
	 5N2Q4BPqXEIzK2UK4xwCQ32LVdxvssiLsY/AExs4IPbbItuTU+8fqdxv+wtMiBwRjg5cA
	 J6fqNh4rQMgjaA+CldpGy34jgklEZBMFmZXivoem8+PtAz9t3uTIbvLS/7w7ctheeixU9
	 8eH3oSnT4Dnyr7/cHBmp3CMjIf6RAxoSuNkvIxKvq9qW4UZtYeTeqEvg8j5HUOPeLOknj
	 0qvcYtmAfrSc3S+3h3GTZwPcUcjfLBbiTs4NCcycPtBSecjxbT8Kv1Z/DePRGrASPMw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789591506;
	bh=Pr1zDmzU6NNauQeCis561wU1ZEsauTqn7kxxzCQuJ+Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lgp2mu6id78GSMIZYGg6TieiOI6pYSKs6BJmvOZDkzn5FTUTX2ZsWL2a35f5527CT
	 W+v9jET/Cd1xb37D5jPlkJD/Icv7eAT+BoSjvkrGrog8vCnekbZAG6nBd6TeeKOCW8
	 jsefIrgJnPB9jYIf2SA58cNx+Oo6r0oZtFfaBsa3pZlXKa12ZS5Ime25A1RDWDFxMm
	 1hfYem3MH2h2DhJrX2dhUtvjVTBI+uZkjt5A5e07WWh9xbexMcbG3ELYJ3Vk1C3Ag0
	 zcVrZUIohzkLD8UBzC31hQ8vsYtSaVUkAxjI/zlVO1h4JXtg9wiWEcl0jeuAYKkbxh
	 iZJN3r7MhtLZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA92160698;
	Wed, 16 Sep 2026 20:45:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C019C24D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2224400B0
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvGZ2mpogMY4 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:45:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D4DF04000B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789591503;
 b=pm4Hw+erd7VlJAzKbzEMqPMWEYIvtCTecbmZ2rqurslInNepNtSkcqB8u5xDfJVU5iVe
 6lP6GzTL8aahZ1DB6/r62BV2sr7/WuP9xoTXqfBR3puqtuQhBtzTkOh0jzMoMoO6VY/JY
 dlgQoZAR9kAxObyE2ACGw1zamMIY8tb0mFdLMoyJlEkinYzoz41n7Kks/HZGHXQsr0dgW
 FmrIHzQfx6cYsjnLKPw25nJsl3Irqphpi+8LaTgND+cIJcP+s/j0X+hKzEJay5Icm0B4O
 c/Hv2TsISQLmsglGxJZK59Ip/9BtO8yDgsb5wBzQBY3PqiZVaHKHAl4QiigqJKDeYUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789591503;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=THS81n/Hj0ECF4NgJaeaJYH7pGNFMWRSab9JHfiogEQ=;
 b=Gzf+IunKsiuYefr8D28zf7egm+tD88CiMS54zLVE+Mbuu7+iHWxTdHdMNyoDUp5seUOh
 rcf4q2XZZM4HoL+V8TCa95ew04SV/EyLYSc4Qg715ciBi06yPwDY0NFOzMaX6p0pJAb/P
 A+JqjyXsXsbek7zgU52Sh8H5dFj0RZsIpZy7vwb+CObRr/AUxZKpjDCRWUz98d/Ncb7NR
 zYo1oaervWS7cQezYUUWWrLfqE2CiQaYPNSRsiup4jXgTvkB/lz2t6FcCR90uH/4N06+e
 ABcx55MlbDq5+zCPDpahF/T2IV936cK/okJhb5/uDGE0Jk+NlGL78uac7h8KWKXSBqA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4DF04000B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:45:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 494B096AF7; Wed, 16 Sep 2026 20:43:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 22:44:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c781be5062dacab1e1e943df9f2887eef351782
X-Git-Newrev: 0bf452504516ab28233226ab531eaa2194d98558
X-Patchwork-Hint: ignore
Message-Id: <20260916204357.494B096AF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add FLAT stack size test
 case
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0bf452504516ab28233226ab531eaa2194d98558
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add an infrastructure test case to verify that the per-package
<PKG>_FLAT_STACKSIZE variable correctly configures the stack size in the
generated FLAT binary header.

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index 97eb2d9cac..ed59f11309 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1124,6 +1124,9 @@ F:	configs/freescale_imx6ullevk_defconfig
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
