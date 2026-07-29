Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D876EC53200
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 18:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9396E606EF;
	Wed, 29 Jul 2026 18:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2yK19Dw8cfp; Wed, 29 Jul 2026 18:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 775896071B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785350819;
	bh=ZPdWXRwfhUlpqOXM+DmK1JTCGwnFCB3Gg1sMBODkRbk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E4Y6BI9d6ErNBjd20UgTYCvh8/xDWIbyib7zxnG/bImI+m7/EMmI3ZOmWlyrEApOJ
	 +9LVoVlm62GpGoUi1e8ILiT8cWOszNPvubOjG7xEDGh2YahNd2VUojjOedrpqLFsGO
	 c1S+lVFpSX77Jop9+9wIf+enSYUn/JysamGwClIH74HWy8nIfr+7uoMUEG7iHfV+P3
	 PtbpSE7+LWn6JOFaM6tLEwDx8d+ho2P4EStXTEXLf72Na+uNwwbKG1jCNBX9zMRWMF
	 +RiWkQD+6vMgfiTQtwqF6hI5Kc+aanHV4Z0dXEQMJ1jjTTmeVz1tdX5OlYswzQgs/l
	 hitb5D7Fs0qVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 775896071B;
	Wed, 29 Jul 2026 18:46:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33C7127F
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 258CB4066F
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUh_3FTiWYvm for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 18:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E30BC40665
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E30BC40665
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:46:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C6D48B510; Wed, 29 Jul 2026 18:46:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Jul 2026 20:38:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df6f3ad43f6dc4a8e76fa4b27a2c85a0b981de79
X-Git-Newrev: 928cc5dc5cb82e6f2cb43f853488309eb806ef89
X-Patchwork-Hint: ignore
Message-Id: <20260729184614.9C6D48B510@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: fix host FIT
 signature support
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/928cc5dc5cb82e6f2cb43f853488309eb806ef89
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

U-Boot host tools use the tools configuration namespace when code calls
CONFIG_IS_ENABLED(). With USE_HOSTCC, CONFIG_IS_ENABLED(FIT_SIGNATURE)
resolves to CONFIG_TOOLS_FIT_SIGNATURE, while
CONFIG_VAL(FIT_SIGNATURE_MAX_SIZE) resolves to
CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE.

The host-uboot-tools package only generates the old CONFIG_FIT_SIGNATURE
define. This makes tools/Makefile include fit_check_sign, but the host code
sees FIT signature support as disabled and the OpenSSL-backed signing and
verification objects are omitted. As a result, mkimage accepts a signature
node without writing its value or injecting a required public key.
fit_check_sign then has no required key and reports success without
checking the configuration signature.

A FIT-support-only configuration never exercises this path, which is why
the existing hash-only runtime test still passes.

Generate the tools FIT signature options needed by the host code and pass
CONFIG_TOOLS_LIBCRYPTO=y so the OpenSSL-backed signing, verification and
cipher objects are selected. Keep CONFIG_FIT_SIGNATURE=y in the make
options because U-Boot tools/Makefile still uses it to build
fit_check_sign.

Extend TestHostUbootTools to create an RSA-signed FIT, require a 256-byte
configuration signature and a required public key, verify the FIT, corrupt
the signature, and require verification to fail.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add comments in runtime test]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uboot-tools/uboot-tools.mk                 |  7 ++-
 support/testing/tests/package/test_uboot_tools.py  | 71 ++++++++++++++++++++++
 .../testing/tests/package/test_uboot_tools/key.dts |  7 +++
 .../tests/package/test_uboot_tools/signed.its      | 38 ++++++++++++
 4 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 6b5554da9b..ef8bcabbd9 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -126,7 +126,10 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
 	mkdir -p $(@D)/include/generated
 	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
 	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
-	echo $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
+	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_RSASSA_PSS 1' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE 1' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE 0x10000000' >> $(@D)/include/generated/autoconf.h)
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
 endef
@@ -142,7 +145,7 @@ HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
-HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000
+HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_TOOLS_LIBCRYPTO=y CONFIG_FIT_SIGNATURE=y
 HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
 define HOST_UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN
 	$(INSTALL) -m 0755 -D $(@D)/tools/fit_check_sign $(HOST_DIR)/bin/fit_check_sign
diff --git a/support/testing/tests/package/test_uboot_tools.py b/support/testing/tests/package/test_uboot_tools.py
index 5e5b44af30..8cff6fda21 100644
--- a/support/testing/tests/package/test_uboot_tools.py
+++ b/support/testing/tests/package/test_uboot_tools.py
@@ -1,11 +1,14 @@
 import hashlib
 import re
+import subprocess
 import zlib
 from pathlib import Path
 
 import infra.basetest
 
 EXAMPLE_ITS = Path(__file__).parent / "test_uboot_tools/example.its"
+KEY_DTS = Path(__file__).parent / "test_uboot_tools/key.dts"
+SIGNED_ITS = Path(__file__).parent / "test_uboot_tools/signed.its"
 
 
 def get_hashes(output: str) -> dict[str, str]:
@@ -72,6 +75,7 @@ class TestHostUbootTools(infra.basetest.BRHostPkgTest):
         """
         BR2_PACKAGE_HOST_UBOOT_TOOLS=y
         BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+        BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT=y
         """
 
     def test_run(self):
@@ -86,3 +90,70 @@ class TestHostUbootTools(infra.basetest.BRHostPkgTest):
                 self.assertEqual(expected[h], reported[h])
         # Python does not have built-in CRC16 support, just check it is present
         self.assertIn("crc16-ccitt", reported)
+
+        # See U-Boot FIT Signature Verification documentation:
+        # https://source.denx.de/u-boot/u-boot/-/blob/v2026.07/doc/usage/fit/signature.rst
+        keydir = Path(self.builddir) / "keys"
+        keydir.mkdir(exist_ok=True)
+
+        # We generate a prublic/private key pair to sign the image.
+        cmd = [
+            "host/bin/openssl", "req", "-batch", "-new", "-x509", "-nodes",
+            "-newkey", "rsa:2048", "-keyout", str(keydir / "dev.key"),
+            "-out", str(keydir / "dev.crt"), "-subj", "/CN=Buildroot FIT test",
+        ]
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+        # We compile the empty dtb that will be used to store the
+        # public key.
+        cmd = [
+            "host/bin/dtc", "-I", "dts", "-O", "dtb", "-p", "0x1000",
+            "-o", "test-key.dtb", str(KEY_DTS),
+        ]
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+        # We sign the image and write the public key in our key
+        # storage dtb.
+        cmd = [
+            "host/bin/mkimage", "-f", str(SIGNED_ITS), "-k", str(keydir),
+            "-K", "test-key.dtb", "-r", "signed.fit",
+        ]
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+        # We check there is a signature present in the FIT image.
+        cmd = [
+            "host/bin/fdtget", "-t", "bx", "signed.fit",
+            "/configurations/config-1/signature-1", "value",
+        ]
+        signature = infra.run_cmd_on_host(self.builddir, cmd).split()
+        self.assertEqual(len(signature), 256)
+
+        # We check the key is marked as required for the configuration.
+        cmd = [
+            "host/bin/fdtget", "-t", "s", "test-key.dtb",
+            "/signature/key-dev", "required",
+        ]
+        required = infra.run_cmd_on_host(self.builddir, cmd).strip()
+        self.assertEqual(required, "conf")
+
+        # We actually check the signature is valid.
+        cmd = [
+            "host/bin/fit_check_sign", "-f", "signed.fit",
+            "-k", "test-key.dtb",
+        ]
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+        # We "corrupt" the signature, by setting it to zero.
+        cmd = [
+            "host/bin/fdtput", "-t", "bx", "signed.fit",
+            "/configurations/config-1/signature-1", "value", "00",
+        ]
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+        # We check again the siganute, and expect a failure.
+        cmd = [
+            "host/bin/fit_check_sign", "-f", "signed.fit",
+            "-k", "test-key.dtb",
+        ]
+        with self.assertRaises(subprocess.CalledProcessError):
+            infra.run_cmd_on_host(self.builddir, cmd)
diff --git a/support/testing/tests/package/test_uboot_tools/key.dts b/support/testing/tests/package/test_uboot_tools/key.dts
new file mode 100644
index 0000000000..c7a686c720
--- /dev/null
+++ b/support/testing/tests/package/test_uboot_tools/key.dts
@@ -0,0 +1,7 @@
+/dts-v1/;
+
+/* This empty dts will be used for storing the public key.
+ * The dtb is populated later by the "mkimage -K" command. */
+
+/ {
+};
diff --git a/support/testing/tests/package/test_uboot_tools/signed.its b/support/testing/tests/package/test_uboot_tools/signed.its
new file mode 100644
index 0000000000..25128cbbda
--- /dev/null
+++ b/support/testing/tests/package/test_uboot_tools/signed.its
@@ -0,0 +1,38 @@
+/dts-v1/;
+
+/ {
+	description = "Signed test FIT";
+	#address-cells = <1>;
+
+	images {
+		kernel {
+			description = "This file, pretending to be a kernel";
+			data = /incbin/("example.its");
+			type = "kernel";
+			arch = "arm64";
+			os = "linux";
+			compression = "none";
+			load = <0x40400000>;
+			entry = <0x40400000>;
+
+			hash-1 {
+				algo = "sha256";
+			};
+		};
+	};
+
+	configurations {
+		default = "config-1";
+
+		config-1 {
+			description = "Signed test entry";
+			kernel = "kernel";
+
+			signature-1 {
+				algo = "sha256,rsa2048";
+				key-name-hint = "dev";
+				sign-images = "kernel";
+			};
+		};
+	};
+};
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
