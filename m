Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9E5C64EC4
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 08:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80F7040BDD;
	Wed,  8 Mar 2023 08:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80F7040BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7jNCSNLtWmq; Wed,  8 Mar 2023 08:28:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9332640BD1;
	Wed,  8 Mar 2023 08:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9332640BD1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 942E21BF844
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E9B780F58
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E9B780F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVF7YYBzk48S for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 08:27:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14F5D80EB6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14F5D80EB6
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 08:27:51 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e13so14502439wro.10
 for <buildroot@buildroot.org>; Wed, 08 Mar 2023 00:27:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678264069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LW2QdvmgoxZ4hXwTZLArMoRC26kOMK4DY2dB6u21jY0=;
 b=Cz3uYLOorV5xx4unPnAH28tzXpz9ExhT0EEKQDiFuZD+dK6Xe3QptEXZacTt3bV33c
 c7JEKVYDyyqNUT0O5A3wYBMHEzy7XrXenrjFdvM9NA3dUcQSwlgO4lZiKcWNG55XsK/u
 ysrq8r57MEnMhvhcxYC+ydXCSfM8MRYZMjFGIv9mlGi/Lkae/ZDG6HJQW5+gdIEv7+kU
 JD1t0J8a3XjXha6F7QrKe7G2cTxrwEkaCMiW+Ut+cH3rJDWvassQWZRlFTP8ltGK8GLU
 SbAvRHLZFPdVQdEauk42UW7aAt4PHY91aWkJTlF7sIf32moBhH8/Ny3RXCEd+n6QBJpm
 03Og==
X-Gm-Message-State: AO0yUKXLW4JTvA0B+NHnC1ODdTc29Po7zCLjVY1CFLGQWgHi7TiQ5uwe
 4QnnRe1d4BW7oH0w9wTsu83gUV/6wW2JoU7Arc4=
X-Google-Smtp-Source: AK7set8RJq7B9s8U7m1Tf91qSUMnwPsSqam6P0YlGH+8WxBXqBwzQjFaspOZ8sfdDGpP67aziNKfvA==
X-Received: by 2002:a5d:614d:0:b0:2c7:d6a:cca9 with SMTP id
 y13-20020a5d614d000000b002c70d6acca9mr11494039wrt.23.1678264069011; 
 Wed, 08 Mar 2023 00:27:49 -0800 (PST)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:3078:ab00:ee8d:4e07])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05600018c900b002c5a1bd5280sm14531683wrq.95.2023.03.08.00.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 00:27:48 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Mar 2023 09:27:15 +0100
Message-Id: <20230308082716.54730-3-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308082716.54730-1-sebastian.weyer@smile.fr>
References: <20230308082716.54730-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678264069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LW2QdvmgoxZ4hXwTZLArMoRC26kOMK4DY2dB6u21jY0=;
 b=tosWiC8ftC+gT6E9M85WKS5+sATXF2dxs/sFGGPOq+kkzOpxmymXVcsDAfM5+odoPb
 H3ckTj9W3KHaaPtg28g+iaJ1srJ0a5SQwkZpVWaieUrbCkyN75CGjSi50lRRg4Sq7UHg
 6JFuYHMFAAqHY0pKlKk0rot+n+UaDZAdnNn/hxLNw/0ITvaG+4Fogiai92IJhJ4fAW3v
 zxgkP0Wj9TYwlwWbo20jTGsY0INKx1qM1Knx3yfqVo/zrrTmVpivHHz8W5Iv5Pe3S5il
 XT49mOhbXiR5O8fKtjb2Tkhy0OPiQUhQCb0MjdvGlKJY2rCuDGXYsHvzE3YF3v8f2OeD
 uqrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=tosWiC8f
Subject: [Buildroot] [PATCH v4 3/3]
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
Content-Type: multipart/mixed; boundary="===============0607251100971169248=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0607251100971169248==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Load sample script support/testing/tests/package/sample_nu.nu onto the
target and verify proper execution by nushell

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 DEVELOPERS                                 |  2 +
 support/testing/tests/package/sample_nu.nu |  6 ++
 support/testing/tests/package/test_nu.py   | 68 ++++++++++++++++++++++
 3 files changed, 76 insertions(+)
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
index 0000000000..5ca6a87543
--- /dev/null
+++ b/support/testing/tests/package/test_nu.py
@@ -0,0 +1,68 @@
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
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_BASH=y
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


--===============0607251100971169248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0607251100971169248==--
