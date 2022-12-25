Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCE1C4167B
	for <buildroot@archiver.kernel.org>; Sun, 25 Dec 2022 22:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27120404F7;
	Sun, 25 Dec 2022 22:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27120404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2IfITy3bg9z; Sun, 25 Dec 2022 22:09:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 433EC40580;
	Sun, 25 Dec 2022 22:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 433EC40580
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79CCB1BF381
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 22:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62D5F401CA
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 22:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62D5F401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zeUuw1gkMA8b for <buildroot@lists.busybox.net>;
 Sun, 25 Dec 2022 22:08:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3851D40017
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3851D40017
 for <buildroot@buildroot.org>; Sun, 25 Dec 2022 22:08:29 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so9576668wma.1
 for <buildroot@buildroot.org>; Sun, 25 Dec 2022 14:08:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0OSrADj9JjYa8L/y0dvp0fD+W7meFSH25qPavxL1E0s=;
 b=5m+CXUG87PfgZ9Lvwj26l3UUmPb29UU6Hr2G/n1qA1JKnjVv7EejwMmQMUXGggmn0Y
 fD85y3VeqdnwyIkDd6WLbwxgobmNYnOTMCX7dRcwu8UNBwc3kFanIMxMLF6fAyZNWlnJ
 CXjSEGSXyjcWn89W09ILcKkroI6lcZdQ8njwA0P9/MRojFx7Nfa6LXhP6i0LFdchaEQa
 rsjU29uLqMnEez4EKmq4X2hs+V6Dh+WWX07VNyjAS9HDQ/v+Z+E8pCW5E86pbrpgUEXq
 iZblRFs39cWb6/wMgboKT8rD/wv71rUnnPvTw9N9zNYPbf5o2asFGoCNArzDETDVMom8
 Tu8w==
X-Gm-Message-State: AFqh2kqNQIqB2leDQPdHPLnRT6G8Lh/Oerhmjkt71Q9+Pnl/CSWJ1BNm
 O6EKBgYAI8rjHEAddhRYAJu5hDbQRSg=
X-Google-Smtp-Source: AMrXdXvtTdNsxYxO4jX+QrnwSI09Np065/OWsiCeRdhBxcigFVrdgvZ9qVJfkvi2So3Chuc+x1SzRA==
X-Received: by 2002:a05:600c:3844:b0:3d3:4406:8a3a with SMTP id
 s4-20020a05600c384400b003d344068a3amr13919030wmr.30.1672006107472; 
 Sun, 25 Dec 2022 14:08:27 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:bc00:ef48:c4a5:90b])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a1cf614000000b003cf4d99fd2asm11835446wmc.6.2022.12.25.14.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Dec 2022 14:08:27 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Dec 2022 23:08:24 +0100
Message-Id: <b28f0529b781e07baaeadb24fa474c49ac73706a.1672006091.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672006091.git.yann.morin.1998@free.fr>
References: <cover.1672006091.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0OSrADj9JjYa8L/y0dvp0fD+W7meFSH25qPavxL1E0s=;
 b=JU4ijfB2n2FMzE/iEpgsmShO3bEEqbDlNaMB6yZZxYj53zgsrggmqW4GISinedBOrA
 mtrLTEWt6qHxqPhnm18IGVhwEFhGthYuvNBTUhrbyupYP8cJnWIArNPr5UTOLdHnVAd5
 cRhOQWK2/CeNjo7FvzR1RD0Rk/C0Q+gp9NR0W/0ZPKLL9Y1yHO3VcMyjWjy2ahMVW/Qz
 csJcb+bGh9t+itnrpZyW4phhwClZoGpeBEs8jBOp/5BaaF2qL4mh1p0dHUxWVdOxei2Y
 JiBzJmp7jD9n7IZRpdCV+o2Ctff5Ta9hdzxrjV9SDSyM2bM6raqvzsSLvQF71KlWESuP
 P/zg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JU4ijfB2
Subject: [Buildroot] [PATCH 3/3 v4] support/testing: add systemd tests for
 factory and overlayfs
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../conf/overlayfs-kernel-fragment.config     |   1 +
 .../base.conf                                 |   2 +
 support/testing/tests/init/test_systemd.py    | 209 +++++++++++++++++-
 3 files changed, 203 insertions(+), 9 deletions(-)
 create mode 100644 support/testing/conf/overlayfs-kernel-fragment.config
 create mode 100644 support/testing/tests/init/systemd-overlay/usr/lib/systemd/system/run-buildroot-mounts-var.mount.d/base.conf

diff --git a/support/testing/conf/overlayfs-kernel-fragment.config b/support/testing/conf/overlayfs-kernel-fragment.config
new file mode 100644
index 0000000000..9122238993
--- /dev/null
+++ b/support/testing/conf/overlayfs-kernel-fragment.config
@@ -0,0 +1 @@
+CONFIG_OVERLAY_FS=y
diff --git a/support/testing/tests/init/systemd-overlay/usr/lib/systemd/system/run-buildroot-mounts-var.mount.d/base.conf b/support/testing/tests/init/systemd-overlay/usr/lib/systemd/system/run-buildroot-mounts-var.mount.d/base.conf
new file mode 100644
index 0000000000..5953c71947
--- /dev/null
+++ b/support/testing/tests/init/systemd-overlay/usr/lib/systemd/system/run-buildroot-mounts-var.mount.d/base.conf
@@ -0,0 +1,2 @@
+[Mount]
+What=other-var-backing-store
diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index ddc32b0838..2f704791ca 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -1,7 +1,15 @@
 import infra.basetest
+import re
 from tests.init.base import InitSystemBase as InitSystemBase
 
 
+# In the following tests, the read-only cases use the default settings,
+# which historically used both a factory to populate a tmpfs on /var,
+# and pre-populated /var at buildtime. Since these are the default
+# settings, and they proved to generate a system that ultimately boots,
+# we still want to keep testing that. See later, below, for the
+# specialised test cases.
+
 class InitSystemSystemdBase(InitSystemBase):
     config = \
         """
@@ -17,7 +25,10 @@ class InitSystemSystemdBase(InitSystemBase):
         """
 
     def check_systemd(self, fs):
-        self.start_emulator(fs)
+        if "BR2_LINUX_KERNEL=y" in self.config:
+            self.start_emulator(fs, "zImage", "vexpress-v2p-ca9")
+        else:
+            self.start_emulator(fs)
         self.check_init("/lib/systemd/systemd")
 
         # Test all units are OK
@@ -40,19 +51,12 @@ class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
         """
         BR2_SYSTEM_DHCP="eth0"
         # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
-        BR2_ROOTFS_OVERLAY="{}"
         BR2_TARGET_ROOTFS_SQUASHFS=y
-        """.format(infra.filepath("tests/init/systemd-factory"))
+        """
 
     def test_run(self):
         self.check_systemd("squashfs")
 
-        # This one must be executed on the target, to check that
-        # the factory feature works as expected
-        out, exit_code = self.emulator.run("cat /var/foo/bar")
-        self.assertEqual(exit_code, 0)
-        self.assertEqual(out[0], "foobar")
-
 
 class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
@@ -191,3 +195,190 @@ class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
 
     def test_run(self):
         self.check_systemd("ext2")
+
+
+# The following tests are all about read-only rootfs, and exercise either
+# using an un-populated factory for /var, or an overlaysfs ontop of a
+# pre-populated /var. They all specialise the TestInitSystemSystemdRo*
+# test cases above.
+
+
+# Helper class for factory-based tests
+class InitSystemSystemdBaseFactory():
+    config = \
+        """
+        # BR2_INIT_SYSTEMD_POPULATE_TMPFILES is not set
+        BR2_ROOTFS_OVERLAY="{}"
+        """.format(infra.filepath("tests/init/systemd-factory"))
+
+    def test_run(self):
+        super().test_run()
+
+        # This one must be executed on the target, to check that
+        # the factory feature works as expected
+        out, exit_code = self.emulator.run("cat /var/foo/bar")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(out[0], "foobar")
+
+        # /var/foo/bar is from the /var factory
+        _, exit_code = self.emulator.run("test -e /usr/share/factory/var/foo/bar")
+        self.assertEqual(exit_code, 0)
+
+        # We can write in /var/foo/bar
+        _, exit_code = self.emulator.run("echo barfoo >/var/foo/bar")
+        self.assertEqual(exit_code, 0)
+        # ... and it contains the new content
+        out, exit_code = self.emulator.run("cat /var/foo/bar")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(out[0], "barfoo")
+        # ... but the factory is umodified
+        out, exit_code = self.emulator.run("cat /usr/share/factory/var/foo/bar")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(out[0], "foobar")
+
+
+class TestInitSystemSystemdRoNetworkdFactory(
+    InitSystemSystemdBaseFactory,
+    TestInitSystemSystemdRoNetworkd,
+):
+    config = InitSystemSystemdBaseFactory.config + \
+        TestInitSystemSystemdRoNetworkd.config
+
+
+class TestInitSystemSystemdRoIfupdownFactory(
+    InitSystemSystemdBaseFactory,
+    TestInitSystemSystemdRoIfupdown,
+):
+    config = InitSystemSystemdBaseFactory.config + \
+        TestInitSystemSystemdRoIfupdown.config
+
+
+class TestInitSystemSystemdRoIfupdownDbusbrokerFactory(
+    InitSystemSystemdBaseFactory,
+    TestInitSystemSystemdRoIfupdownDbusbroker,
+):
+    config = InitSystemSystemdBaseFactory.config + \
+        TestInitSystemSystemdRoIfupdownDbusbroker.config
+
+
+class TestInitSystemSystemdRoIfupdownDbusbrokerDbusFactory(
+    InitSystemSystemdBaseFactory,
+    TestInitSystemSystemdRoIfupdownDbusbrokerDbus,
+):
+    config = InitSystemSystemdBaseFactory.config + \
+        TestInitSystemSystemdRoIfupdownDbusbrokerDbus.config
+
+
+class TestInitSystemSystemdRoFullFactory(
+    InitSystemSystemdBaseFactory,
+    TestInitSystemSystemdRoFull,
+):
+    config = InitSystemSystemdBaseFactory.config + \
+        TestInitSystemSystemdRoFull.config
+
+
+# Helper class for overlayfs-based tests
+class InitSystemSystemdBaseOverlayfs():
+    config = \
+        """
+        # BR2_INIT_SYSTEMD_VAR_FACTORY is not set
+        BR2_INIT_SYSTEMD_VAR_OVERLAYFS=y
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        """.format(infra.filepath("tests/init/systemd-factory"),
+                   infra.filepath("conf/overlayfs-kernel-fragment.config"))
+
+    def test_run(self):
+        super().test_run()
+
+        # This one must be executed on the target, to check that
+        # the tmpfiles pre-populate works as expected
+        out, exit_code = self.emulator.run("cat /var/foo/bar")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(out[0], "foobar")
+
+        # /var/foo/bar is from the pre-populated /var, so it should
+        # not be present in the upper of the overlay
+        _, exit_code = self.emulator.run("test -e /run/buildroot/mounts/var/upper/foo/bar")
+        self.assertNotEqual(exit_code, 0)
+
+        # We can write in /var/foo/bar
+        _, exit_code = self.emulator.run("echo barfoo >/var/foo/bar")
+        self.assertEqual(exit_code, 0)
+        # ... and it contains the new content
+        out, exit_code = self.emulator.run("cat /var/foo/bar")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(out[0], "barfoo")
+        # ... and it to appears in the upper
+        _, exit_code = self.emulator.run("test -e /run/buildroot/mounts/var/upper/foo/bar")
+        self.assertEqual(exit_code, 0)
+        # ... with the new content
+        out, exit_code = self.emulator.run("cat /run/buildroot/mounts/var/upper/foo/bar")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(out[0], "barfoo")
+        # ... while the lower still has the oldcontent
+        out, exit_code = self.emulator.run("cat /run/buildroot/mounts/var/lower/foo/bar")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(out[0], "foobar")
+
+
+class TestInitSystemSystemdRoNetworkdOverlayfs(
+    InitSystemSystemdBaseOverlayfs,
+    TestInitSystemSystemdRoNetworkd,
+):
+    config = InitSystemSystemdBaseOverlayfs.config + \
+        TestInitSystemSystemdRoNetworkd.config
+
+
+class TestInitSystemSystemdRoIfupdownOverlayfs(
+    InitSystemSystemdBaseOverlayfs,
+    TestInitSystemSystemdRoIfupdown,
+):
+    config = InitSystemSystemdBaseOverlayfs.config + \
+        TestInitSystemSystemdRoIfupdown.config
+
+
+class TestInitSystemSystemdRoIfupdownDbusbrokerOverlayfs(
+    InitSystemSystemdBaseOverlayfs,
+    TestInitSystemSystemdRoIfupdownDbusbroker,
+):
+    config = InitSystemSystemdBaseOverlayfs.config + \
+        TestInitSystemSystemdRoIfupdownDbusbroker.config
+
+
+class TestInitSystemSystemdRoIfupdownDbusbrokerDbusOverlayfs(
+    InitSystemSystemdBaseOverlayfs,
+    TestInitSystemSystemdRoIfupdownDbusbrokerDbus,
+):
+    config = InitSystemSystemdBaseOverlayfs.config + \
+        TestInitSystemSystemdRoIfupdownDbusbrokerDbus.config
+
+
+class TestInitSystemSystemdRoFullOverlayfs(
+    InitSystemSystemdBaseOverlayfs,
+    TestInitSystemSystemdRoFull,
+):
+    config = InitSystemSystemdBaseOverlayfs.config + \
+        TestInitSystemSystemdRoFull.config
+
+
+class TestInitSystemSystemdRoFullOverlayfsVarBacking(
+    TestInitSystemSystemdRoFullOverlayfs,
+):
+    config = re.sub(
+        r'^\s*BR2_ROOTFS_OVERLAY="(.*)"$',
+        'BR2_ROOTFS_OVERLAY="\\1 {}"'.format(infra.filepath('tests/init/systemd-overlay')),
+        TestInitSystemSystemdRoFullOverlayfs.config,
+        flags=re.MULTILINE,
+    )
+
+    def test_run(self):
+        super().test_run()
+
+        self.assertRunOk("mount |grep other-var-backing-store")
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
