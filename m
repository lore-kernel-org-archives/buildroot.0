Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC42C678D5
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 08:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BD6B6112E;
	Wed,  8 Mar 2023 08:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BD6B6112E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-sjOLhmuFcA; Wed,  8 Mar 2023 08:54:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5EBB6112A;
	Wed,  8 Mar 2023 08:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5EBB6112A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D14B1BF844
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44A4640921
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44A4640921
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JlzQo3Od4Rke for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 08:54:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1096B409A2
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1096B409A2
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 08:54:02 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso723097wmq.1
 for <buildroot@buildroot.org>; Wed, 08 Mar 2023 00:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678265641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DWaHbcWkF2VhpADSyv0O85F3xN/j873ZThKh65WxVeI=;
 b=N6Wv1Pou+gYGU4JLXc/aC+HFVdh1TzCJeV0h0dXWOLjC9qlj8YaotnSfDAu7V/6i8d
 wBerSGSG9xHUG01E9YJRQyQiEMAiPjsI7audjgFwW3Z1W4C28Z8n12CwZoogmMpqRUI2
 T7NZWhmH6MOf1OZvMvmPEA6d4DJ0QeMrWr4u/hDFfWtDmn9sCxpy/6cVCZNTIdPP7FWe
 3UZh2dtrnl+SMtdMniEsYPZnXlbeA5reivmJpe8kXJlD5boKlJlqYTdzTbxaCdt85Xvp
 Phx/i+tvHn3QJWsdjix3ZMn0t8YNKx5DbpkeLalNim8ENZcncQdiY4eY7nBrqT1GWg7p
 KW6w==
X-Gm-Message-State: AO0yUKVqXTzNTPiRxpGHkmaxSWgzFSmUVlwOGn884J/3wRsyS2p6m8jb
 gXA+JwGBEfd3/6Z1Ko0MSeMol4A4IVM9dj6TsmA=
X-Google-Smtp-Source: AK7set+/8EpkHTPPN+2PEDpIdvseyaP4o2GYvEyOrsr8h0OhEkj+vNCMLyBk7WgJj93+qPJZit9xfA==
X-Received: by 2002:a05:600c:4fc5:b0:3ea:f0d6:5d37 with SMTP id
 o5-20020a05600c4fc500b003eaf0d65d37mr15131827wmq.8.1678265640861; 
 Wed, 08 Mar 2023 00:54:00 -0800 (PST)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:3078:ab00:ee8d:4e07])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a5d508d000000b002c54536c662sm14879471wrt.34.2023.03.08.00.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 00:54:00 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Mar 2023 09:53:53 +0100
Message-Id: <20230308085354.127183-3-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308085354.127183-1-sebastian.weyer@smile.fr>
References: <20230308085354.127183-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678265641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DWaHbcWkF2VhpADSyv0O85F3xN/j873ZThKh65WxVeI=;
 b=DnSmSaRCSRd9zE0hFWdmsuRkMYroxHbopCBNsSDqfRebMlx01AhWDZzQUMH+OPI3YT
 dC3z0nSMcknxPVTOhY7v1wgIT/Ao5Vg9cQB1vAObLrHRy5VNNuQg2xDuEljt29xi89f2
 k3G6CYozYkuwqM781hCBS7xuOYTG4qS0/KimMu5kasMCNWC/DF8j11LbxdH6RfzfPsO/
 XGnz5XLiSWr9fsRcsNqf0rVe81j8jolebJt0Eq5FdEOuYfYBr3+7HwMa/AkOUw3rQ598
 yGihgCrsOW0G5Q6qnsQ0n8R/K2XGdDQFddTH8JUC1iDQpaIGGKyf3RPV6ykL5JrUW3et
 mCcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=DnSmSaRC
Subject: [Buildroot] [PATCH v5 3/3]
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
Content-Type: multipart/mixed; boundary="===============2793221485311457067=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2793221485311457067==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Load sample script support/testing/tests/package/sample_nu.nu onto the
target and verify proper execution by nushell

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 DEVELOPERS                                 |  2 +
 support/testing/tests/package/sample_nu.nu |  6 ++
 support/testing/tests/package/test_nu.py   | 65 ++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 support/testing/tests/package/sample_nu.nu
 create mode 100644 support/testing/tests/package/test_nu.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 4577f20b22..726cd73af7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2552,6 +2552,8 @@ F:	package/ripgrep/
 
 N:  Sebastian Weyer <sebastian.weyer@smile.fr>
 F:	package/nushell/
+F:	support/testing/tests/package/test_nu.py
+F:	support/testing/tests/package/sample_nu.nu
 
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	package/mmc-utils/
diff --git a/support/testing/tests/package/sample_nu.nu b/support/testing/tests/package/sample_nu.nu
new file mode 100644
index 0000000000..8904b29933
--- /dev/null
+++ b/support/testing/tests/package/sample_nu.nu
@@ -0,0 +1,6 @@
+# myscript.nu
+def greet [name] {
+  ["hello" $name]
+}
+
+greet "world"
diff --git a/support/testing/tests/package/test_nu.py b/support/testing/tests/package/test_nu.py
new file mode 100644
index 0000000000..b7ca52038d
--- /dev/null
+++ b/support/testing/tests/package/test_nu.py
@@ -0,0 +1,65 @@
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
+# load a scipt on the target and check if it is executed correctly by nu
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
+    timeout = -1
+    interpreter = "nu"
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
+            cmd = self.interpreter + " " + os.path.basename(script)
+            self.assertRunOk(cmd, timeout=self.timeout)
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+        self.run_sample_scripts()
-- 
2.25.1


--===============2793221485311457067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2793221485311457067==--
