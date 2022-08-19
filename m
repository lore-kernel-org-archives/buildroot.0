Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46CDC28B2B
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 17:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60C9461247;
	Fri, 19 Aug 2022 17:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60C9461247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8K25DAJH2IPf; Fri, 19 Aug 2022 17:51:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C82D60C17;
	Fri, 19 Aug 2022 17:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C82D60C17
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15F431BF366
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 17:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9533A41D33
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 17:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9533A41D33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qMQiR3b9SXQc for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 17:51:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5A8B41D3C
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5A8B41D3C
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 17:51:06 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u14so5972172wrq.9
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 10:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc;
 bh=USe4JnCmrfNw8HJ30BDaPi2CcM3ZaSkx4RCwUyJuIE0=;
 b=WkFXODdlq1tDUXTJ5PDCHdbiKO0YU8VyPDSo/rlXtHTM5yhHywoXC53BFeZOJml6QL
 9Ief8X1tA1l0uYgfIRBsC4+g3uLitNx6Vj3xEK/ANWiNUc2MZ6kv7eQ9TI+Yzi8YsUDK
 s/FK30DwpVmuTgrxVU9LDRVgwXZPmMhCkvM86rChTaDS6ciNjthbTg2P2AF/YS4hGgnT
 E2LQKRpyoM/FAPRG216hSEIBYIbf9viV2O209mtNsCaE8Ji96OaLVhuX/miZD5T0hr9X
 eHUO8n+732ulG7udGzsLSVgdpU3bMMKKlm6UeHoH4gi89CAxdcvRIC0sHubXIbZ7TVl/
 83kA==
X-Gm-Message-State: ACgBeo1TpzOqpzPCmaCSMvdKZtBf/eb9iax/KeIgL6cCIUpmWVzq+WBU
 qN2FydWRGsKIcJWkI1PWdUw7ke4Ysmg=
X-Google-Smtp-Source: AA6agR7880H9CKuECccDFZfOLQQ6GdKKsq0xnmbAnfyP2lWngLs1dAvjQNXirHaK3MBsNjsSnaSSyg==
X-Received: by 2002:a05:6000:381:b0:221:7540:b1ee with SMTP id
 u1-20020a056000038100b002217540b1eemr4685046wrf.307.1660931464772; 
 Fri, 19 Aug 2022 10:51:04 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:54a5:9a99:1f8c:15e1])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a1c7918000000b003a5ca627333sm8937295wme.8.2022.08.19.10.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 10:51:04 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 19 Aug 2022 19:51:01 +0200
Message-Id: <5cd3be7a788ce6fc3047069feacf48658c231483.1660931225.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660931225.git.yann.morin.1998@free.fr>
References: <cover.1660931225.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc;
 bh=USe4JnCmrfNw8HJ30BDaPi2CcM3ZaSkx4RCwUyJuIE0=;
 b=XLx/f20Dole0AGXlJCr/6JE3wHiV0efv348ziITEuDOlbgprDMipRY0ReefZAdbBnH
 xUAEEggUtW5hC80vcVL6TFoTYs4ATwDYsnAQTWN9bWw3dlXrHfu6c+YGxf69NOppbEx5
 Jvub/ljCRQb/ya/Ha9FWA/C3hgOTbnBaLnCnaM/nOBOPGWz2EX0yUhRRfHuWo1YcV5Tr
 1rFRUUYujMrv/8IcPJfH2R0+4sRtwhDI5hXyuG2VW/kKwxpSaWs7l+9W82cZqrCxACHQ
 XGBCzH5jhaXR6ej2xnC4MwhlBr1E2yaJDu0PNiq3yUJ9yUUza7wYIzLZz+tdSXLP2fKg
 di9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XLx/f20D
Subject: [Buildroot] [PATCH 4/4] support/tests/cpio: extend runtime tests
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
Cc: Adam Duskett <aduskett@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thierry Bultel <thierry.bultel@linatsea.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Check that dependencies that are DT_NEEDED by a program are
automatically copied by dracut. We use cramfs, the package,
as it is small and just depends on libz.

Test extra modules, and test more than one dracut config file.

Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
Cc: Adam Duskett <aduskett@gmail.com>
---
 support/testing/tests/fs/test_cpio.py                 | 11 ++++++++++-
 support/testing/tests/fs/test_cpio/dracut-cramfs.conf |  7 +++++++
 .../fs/test_cpio/modules/99cramfs/module-setup.sh     | 11 +++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 support/testing/tests/fs/test_cpio/dracut-cramfs.conf
 create mode 100755 support/testing/tests/fs/test_cpio/modules/99cramfs/module-setup.sh

diff --git a/support/testing/tests/fs/test_cpio.py b/support/testing/tests/fs/test_cpio.py
index 9a529f1edd..9c196c1b89 100644
--- a/support/testing/tests/fs/test_cpio.py
+++ b/support/testing/tests/fs/test_cpio.py
@@ -37,11 +37,16 @@ class TestCpioDracutBase(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_INIT_BUSYBOX=y
+        BR2_PACKAGE_CRAMFS=y
         BR2_PACKAGE_PV=y
+        BR2_PACKAGE_HOST_DRACUT_EXTRA_MODULES="{}"
         BR2_TARGET_ROOTFS_CPIO=y
         BR2_TARGET_ROOTFS_CPIO_DRACUT=y
+        BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES="{}"
         # BR2_TARGET_ROOTFS_TAR is not set
-        """
+        """.format("support/testing/tests/fs/test_cpio/modules",
+                   " ".join(["fs/cpio/dracut.conf",
+                             "support/testing/tests/fs/test_cpio/dracut-cramfs.conf"]))
 
     def check_dracut(self):
         out = subprocess.check_output(["cpio", "--list"],
@@ -52,6 +57,10 @@ class TestCpioDracutBase(infra.basetest.BRTest):
                                       universal_newlines=True)
         # pv should *not* be included in cpio image
         self.assertEqual(out.find("bin/pv"), -1)
+        # libz should be, because of cramfs
+        self.assertNotEqual(out.find("usr/bin/mkcramfs"), -1)
+        self.assertNotEqual(out.find("usr/bin/cramfsck"), -1)
+        self.assertNotEqual(out.find("usr/lib/libz.so"), -1)
 
         exit_code = boot_img(self.emulator,
                              self.builddir)
diff --git a/support/testing/tests/fs/test_cpio/dracut-cramfs.conf b/support/testing/tests/fs/test_cpio/dracut-cramfs.conf
new file mode 100644
index 0000000000..69e49239fc
--- /dev/null
+++ b/support/testing/tests/fs/test_cpio/dracut-cramfs.conf
@@ -0,0 +1,7 @@
+install_items+="
+/usr/bin/mkcramfs
+"
+
+add_dracutmodules+="
+cramfs
+"
diff --git a/support/testing/tests/fs/test_cpio/modules/99cramfs/module-setup.sh b/support/testing/tests/fs/test_cpio/modules/99cramfs/module-setup.sh
new file mode 100755
index 0000000000..60706c8bd9
--- /dev/null
+++ b/support/testing/tests/fs/test_cpio/modules/99cramfs/module-setup.sh
@@ -0,0 +1,11 @@
+check() {
+    return 0
+}
+
+depends() {
+    return 0
+}
+
+install() {
+    inst_multiple /usr/bin/cramfsck
+}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
