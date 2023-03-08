Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C42C678D5
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 13:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D25D40292;
	Wed,  8 Mar 2023 13:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D25D40292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ywNr_PQhrFHv; Wed,  8 Mar 2023 13:16:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73D7140C01;
	Wed,  8 Mar 2023 13:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73D7140C01
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 669991BF94D
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 13:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F2D3410E7
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F2D3410E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VtZo3afTL68l for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 13:16:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8601740A00
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8601740A00
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 13:16:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so1129623wmq.1
 for <buildroot@buildroot.org>; Wed, 08 Mar 2023 05:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678281365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=16ZNoxZhc+vRoCXxROau6Sf2qj665W/vy2YWFMHoVe8=;
 b=g578ml+w4ihe0YmTpEO7gFEi4qH8tjLTKnNaUCaMBOyT+xzt8Kjb2chWiatqTLilGe
 fxuZcOpuDZpiUjx5CY2NzQHjVLrPu6plMRFPff08Hn/QEzz1QL0iYLYqyFt2qoZduNjY
 EjQR1tAzbVg44rBmJH5zyHNaPlwOtdRwJw1qXwy1ZjZ0qklyNTslxxXNdKaLNPrgNkj+
 8eO6hT/A4W+1+zqFI0nsCQkeKHXIGWrYqq/6SZKgjqZbaxncZ3iC3O1MAUFbn1eX1ezN
 MpLcH9asSy2ic6obhclslZe02vgP8UXXHKPhm5YkWL+dtKISgOFLs4bHPNsEL6JGoU0M
 8nFQ==
X-Gm-Message-State: AO0yUKVZPXQvY4OdJsTI1dNiwH4M9xN4bbPnY4ic2ZKNjdqA5EzR/ykC
 HHI5gCeRgaef8eEVOt9drP3ijHYx/ZSz5YGkd8o=
X-Google-Smtp-Source: AK7set9WLc0NzWaJjDHj4ibuxUHXMk8kHK8MSSo+SKIZUjxahUgx/56zHKJZfXHyIznp4CAL5wxDyw==
X-Received: by 2002:a05:600c:1c20:b0:3eb:3945:d3f9 with SMTP id
 j32-20020a05600c1c2000b003eb3945d3f9mr16889320wms.4.1678281365358; 
 Wed, 08 Mar 2023 05:16:05 -0800 (PST)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:3078:ab00:ee8d:4e07])
 by smtp.gmail.com with ESMTPSA id
 bi25-20020a05600c3d9900b003e89e3284fasm19677624wmb.36.2023.03.08.05.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 05:16:04 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Mar 2023 14:15:53 +0100
Message-Id: <20230308131554.642965-3-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308131554.642965-1-sebastian.weyer@smile.fr>
References: <20230308131554.642965-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678281365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=16ZNoxZhc+vRoCXxROau6Sf2qj665W/vy2YWFMHoVe8=;
 b=xkx4vjszUnLBJUmOV7emTEO86KKDRsY1I/tVumKfQYK4jN7LI48aiwvNyVZjdm9n/n
 x4YeX7vfQLwmj2Ljx0WFEwboir62B/jsd+Xp56xwGqq0Uuu9KwTRt8EVK8tpCE/0FnN5
 CB5/rAftT0yor70cN/PJspYIfog3D9hJWMLNrUYN0HZXWJNCAIJv/s8JGyNzphugZVmN
 sIL0n9Pyj7upgtccPkzs95Y1TGPLK0mTLT9W6LP7MgMXhilvrgug9rkFpw5Dih5pWa5d
 ZC5HaYUkxqDfCOLygUCfrfuGpHyWw9LyCGLeF8UInNFevQKZvCkfYAaaocWYf8+9a6Ak
 +cdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=xkx4vjsz
Subject: [Buildroot] [PATCH v6 3/3]
 support/testing/tests/package/test_nu.py: New runtime test
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: multipart/mixed; boundary="===============7674601216444835612=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7674601216444835612==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Load sample script support/testing/tests/package/sample_nu.nu onto the
target and verify proper execution by nushell

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 DEVELOPERS                                 |  2 +
 support/testing/tests/package/sample_nu.nu |  6 +++
 support/testing/tests/package/test_nu.py   | 62 ++++++++++++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 support/testing/tests/package/sample_nu.nu
 create mode 100644 support/testing/tests/package/test_nu.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e3855423e..9a7257c4b2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2552,6 +2552,8 @@ F:	package/ripgrep/
 
 N:	Sebastian Weyer <sebastian.weyer@smile.fr>
 F:	package/nushell/
+F:	support/testing/tests/package/test_nu.py
+F:	support/testing/tests/package/sample_nu.nu
 
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	package/mmc-utils/
diff --git a/support/testing/tests/package/sample_nu.nu b/support/testing/tests/package/sample_nu.nu
new file mode 100644
index 0000000000..5287862cf1
--- /dev/null
+++ b/support/testing/tests/package/sample_nu.nu
@@ -0,0 +1,6 @@
+#! /usr/bin/nu
+def greet [name] {
+  ["hello" $name]
+}
+
+greet "world"
diff --git a/support/testing/tests/package/test_nu.py b/support/testing/tests/package/test_nu.py
new file mode 100644
index 0000000000..ba2ddb9851
--- /dev/null
+++ b/support/testing/tests/package/test_nu.py
@@ -0,0 +1,62 @@
+import os
+
+import infra.basetest
+
+class TestNuBase(infra.basetest.BRTest):
+    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it doesn't
+    # support a host rustc which is necessary for nushell
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_PACKAGE_NUSHELL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd",img])
+        self.emulator.login()
+
+# load a script on the target and check if it is executed correctly by nu
+class TestNu(TestNuBase):
+    config_sample_scripts = \
+        """
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
+        """.format(infra.filepath("tests/package/copy-sample-script-to-target.sh"),
+                   "{sample_scripts}")
+
+    #simple hello world script found in the nushell doc
+    sample_scripts = ["tests/package/sample_nu.nu"]
+
+    def __init__(self, names):
+        """Add the scripts to the target in build time."""
+        super(TestNuBase, self).__init__(names)
+        scripts = [infra.filepath(s) for s in self.sample_scripts]
+        self.config += self.config_sample_scripts.format(sample_scripts=" ".join(scripts))
+
+    def check_sample_scripts_exist(self):
+        """Check the scripts were really added to the image."""
+        scripts = [os.path.basename(s) for s in self.sample_scripts]
+        cmd = "md5sum " + " ".join(scripts)
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+    def run_sample_scripts(self):
+        """Run each script previously added to the image."""
+        for script in self.sample_scripts:
+            cmd = "nu " + os.path.basename(script)
+            self.assertRunOk(cmd)
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+        self.run_sample_scripts()
-- 
2.25.1


--===============7674601216444835612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7674601216444835612==--
