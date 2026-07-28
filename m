Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998DBC53219
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 19:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DB5A8136B;
	Tue, 28 Jul 2026 19:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYS8XXCExn5R; Tue, 28 Jul 2026 19:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 548B581373
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785267949;
	bh=jyObkVSi91VKKlHqNJX+e9NrAjncjCA5rB27/e7P590=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SOGjz5VDVIawxL/sr6CTx6eyqiGlwCk6qbO+Ql2rdCLtiCBseXZPtAsQfp2cD8Y83
	 e8pHiuZPn5kecMKrZR5YEUFuA+uitu5VbvnGNXPHVLl/kXWc33D0xwsuqjLc50hBHl
	 4+VTdyDxg/9EyduZoWTast9TFvbQlhF3Lmo9nCMjb7Qb/unsm0nza55XsjcdOufKz9
	 yEFjCFCdlycjnOdQF++psLmh4rBc4EpklhcvpL7K5Wc9Uc/AUKQrAenBiGy5fQLTyM
	 0RbwZBiCA+Mv7NWLgm3LlZxDQX3w46tgawDXY9B+OqjxtjF+ptB3YGno0i2EGqXOd8
	 gnKRyO38cmkrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 548B581373;
	Tue, 28 Jul 2026 19:45:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 62ECA2E5
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54BA840176
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SAJWjfVLpPoO for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 19:45:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 769CE40099
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 769CE40099
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 769CE40099
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:45:47 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-455ca262ccbso66427fac.1
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 12:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785267946; x=1785872746;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3vS3chkNvjv7YFyPf1gDAZ9Oghsc1/NCEutWRKHEdB8=;
 b=iypu7bPUYMa/jJ/q9dLcmu4h4VyhbCXqVkLkZP1GMg1thu2w/dbPulm+ySX5pgUXqn
 BZuAhSFknZ5qwf/q5XbBdnFW28g1CFPE92gwlg9XzQP6e+/ipdgPbGSFgUSEJFDtKocj
 BAs55FMbvheqy8Kptyt6ty2SW8Tsf/UxcZrbnCc0dUc2eoeXGJVzUGa2xnNpZdhqHdVs
 OOum3pZgEjc4QBpJAMEevy0K4h0Igfjd9/We7vZJvdh8wohnJvQ+YxSaujyuTrc7X8jo
 W9TmLJ3+HXZkOv3h0lKyI4zK9cINj0/me0zJkvF0z2YjKDVoDCUA9UvsKVjzg9tOXqvE
 Q0Xw==
X-Gm-Message-State: AOJu0YzdHk7HeELbZW+RzVOsOhSLWj6HtMukWblPkEtC4ZFp2nIbKKIO
 hbijb4evUQxV0w4vJD2fzM81DiA45PvPCoE0EfcOhb0ptDnskBzw8frHnMTjy+WV
X-Gm-Gg: AR+sD12ElF5YWNGYVP+ghHQf0E4Y9v6FjjAHwGV5fIjf3byzBlsnOWBjm/ryVK6iU3c
 bdVVw14xPF1VkGj5dxYyyA0wNzblaLJ7BcVh0GA0MciFouyZTWkqwtuasVwx5VuH5oM0kAxaKUd
 luo7BEwDc6Rqqzwd8SDhx3WtcVeB2Naa0smbdzvyzAJHm2lY4JopMDCOD4OdopZpxiPf6jGw9ZG
 aWsiZw0Ypw/BqUnMrIBRpBcZ88TCZa8M0B0d2livNEwDUJEbAFhDFKusoXYTvrimQFq1M10HTnf
 +akuCztd95LVwa46wgXPciY3enUeKZJcHT3Au6I4JhgTHbqZYppr3xH4qbufBJuXd2bJDMBS0a3
 IL0oleBm2e2fwt+4ovEhxREG9adRhWOvfgfAfZt7LtsJVk6AjtNfGlU1hZwLcgV9Yg8q5Wi5sfN
 jwUApy29DzVM8Z8Q8AFh/T4C2l+UH7/T+qOwJwvE0jvVpfNX/iWb6pxcEJpyJM55nM1AvRV0zxJ
 xOWjCP0vfKtaiV1Q88BT1a7ov83jlFneMGO2BFkgjC82uSH4Z1vJViogK3W+AVsKmiv2KA6/0T5
 5066zKJSl8Z9
X-Received: by 2002:a05:6871:c953:b0:448:ac35:605f with SMTP id
 586e51a60fabf-4586c512026mr2368861fac.7.1785267946210; 
 Tue, 28 Jul 2026 12:45:46 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-31-69.hlrn.qwest.net.
 [71.218.31.69]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-458867fab20sm692563fac.10.2026.07.28.12.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 12:45:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 28 Jul 2026 13:45:41 -0600
Message-ID: <20260728194541.507655-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785267946; x=1785872746; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3vS3chkNvjv7YFyPf1gDAZ9Oghsc1/NCEutWRKHEdB8=;
 b=JCI09aslwOKIplgbPeecEYW9X5GqJVVhV+KbzspQaw+fcGhRzsOe7xeEgQDjBQzT71
 q+0CI2rrdtPYsAtTLBvxhmvoXocF5bnIRE4XB/2HBXBeS0Nml834IuKs5yhdkSCySlK1
 k+DuGHmptZpsyGXiTx0HCKPJ8G6rU3hsC9vI+UvQFLxhi/aq7EsIGmQ3TbgJpPH90TFy
 bAoW44ab/MKJXYnurxrq4u5MYr5J1o+m1NJes2SiBjYjktTOetPEh6aSRIepzOXxfRTs
 ZJ1zTJw/02f4T6CA06eX6mX+O86ARPv67cvnUCC7Kb4b88tVyqsxgfxyJ+9wfqcNMSQ3
 BRUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=JCI09asl
Subject: [Buildroot] [PATCH v2 1/1] package/uboot-tools: fix host FIT
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Changes v1 -> v2:
  - Clarify that the old configuration silently omits FIT signatures
  - Add FIT signing, required-key and tamper-rejection runtime coverage
---
 package/uboot-tools/uboot-tools.mk            |  7 ++-
 .../testing/tests/package/test_uboot_tools.py | 57 +++++++++++++++++++
 .../tests/package/test_uboot_tools/key.dts    |  4 ++
 .../tests/package/test_uboot_tools/signed.its | 38 +++++++++++++
 4 files changed, 104 insertions(+), 2 deletions(-)
 create mode 100644 support/testing/tests/package/test_uboot_tools/key.dts
 create mode 100644 support/testing/tests/package/test_uboot_tools/signed.its

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
index 5e5b44af30..b5ab586192 100644
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
@@ -86,3 +90,56 @@ class TestHostUbootTools(infra.basetest.BRHostPkgTest):
                 self.assertEqual(expected[h], reported[h])
         # Python does not have built-in CRC16 support, just check it is present
         self.assertIn("crc16-ccitt", reported)
+
+        keydir = Path(self.builddir) / "keys"
+        keydir.mkdir(exist_ok=True)
+        cmd = [
+            "host/bin/openssl", "req", "-batch", "-new", "-x509", "-nodes",
+            "-newkey", "rsa:2048", "-keyout", str(keydir / "dev.key"),
+            "-out", str(keydir / "dev.crt"), "-subj", "/CN=Buildroot FIT test",
+        ]
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+        cmd = [
+            "host/bin/dtc", "-I", "dts", "-O", "dtb", "-p", "0x1000",
+            "-o", "test-key.dtb", str(KEY_DTS),
+        ]
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+        cmd = [
+            "host/bin/mkimage", "-f", str(SIGNED_ITS), "-k", str(keydir),
+            "-K", "test-key.dtb", "-r", "signed.fit",
+        ]
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+        cmd = [
+            "host/bin/fdtget", "-t", "bx", "signed.fit",
+            "/configurations/config-1/signature-1", "value",
+        ]
+        signature = infra.run_cmd_on_host(self.builddir, cmd).split()
+        self.assertEqual(len(signature), 256)
+
+        cmd = [
+            "host/bin/fdtget", "-t", "s", "test-key.dtb",
+            "/signature/key-dev", "required",
+        ]
+        required = infra.run_cmd_on_host(self.builddir, cmd).strip()
+        self.assertEqual(required, "conf")
+
+        cmd = [
+            "host/bin/fit_check_sign", "-f", "signed.fit",
+            "-k", "test-key.dtb",
+        ]
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+        cmd = [
+            "host/bin/fdtput", "-t", "bx", "signed.fit",
+            "/configurations/config-1/signature-1", "value", "00",
+        ]
+        infra.run_cmd_on_host(self.builddir, cmd)
+        cmd = [
+            "host/bin/fit_check_sign", "-f", "signed.fit",
+            "-k", "test-key.dtb",
+        ]
+        with self.assertRaises(subprocess.CalledProcessError):
+            infra.run_cmd_on_host(self.builddir, cmd)
diff --git a/support/testing/tests/package/test_uboot_tools/key.dts b/support/testing/tests/package/test_uboot_tools/key.dts
new file mode 100644
index 0000000000..e160dad6a6
--- /dev/null
+++ b/support/testing/tests/package/test_uboot_tools/key.dts
@@ -0,0 +1,4 @@
+/dts-v1/;
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
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
