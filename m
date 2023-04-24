Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67EEC77B61
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 21:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38D74613DA;
	Mon, 24 Apr 2023 21:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38D74613DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x_h38ypUieAG; Mon, 24 Apr 2023 21:51:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E72961087;
	Mon, 24 Apr 2023 21:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E72961087
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6811C1BF46A
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 21:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CDC041746
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 21:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CDC041746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kzR_G-WVttvD for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 21:51:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B1F541741
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B1F541741
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 21:51:09 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so22535175e9.1
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 14:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682373067; x=1684965067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1RUlvKVoKRgm5xJbim162kIJ5BbLxcZkaMqDPPWDjhE=;
 b=jniQ3NVoFnxzTWnoyFve4yzdyF81K/uXccbMwdwQn8gvkfWGJJoGyxw+XxAckh5e1+
 DcB+nmAm1zpeNHTbrJUJH6N9XyM/lVN0TmMLF81GggEgQJgEhbrCphD8KJEW8O4+lMPS
 cvG8An9PmCRGH4Ud4tvIXrYazufBS13g+LhDK4M5Vy7TRlisOzaZrTi08D1tWkftnUjr
 WZD+0GM5VAxVAzHSrPE1Ky43ZPiUu4cUXaeMZVKSNtzBhjf4mzWJ70Ocs9IfR7Dycsx/
 CSsNoLOIKvIznFrbnTBxHzl1EeUaFmcgy8Vtg6t2Au3dCLwH+YkH0rRAvbmdBJIex5/1
 9nag==
X-Gm-Message-State: AAQBX9exxBQ0XOwUmZJlXzuUmyV8pqBI9JycI1D2X1nGP2LnB0rlqQiU
 R8jpPvoJoHmQLUuAI/OYi52JyZWNEIc=
X-Google-Smtp-Source: AKy350aKaLQsOWoBEldbQBgQXEWueUV0FtZF9TvFnRZW+soyrgsp9MqzNXRZNFSLTnT7zuvdQTDNEw==
X-Received: by 2002:a1c:7c12:0:b0:3ed:b048:73f4 with SMTP id
 x18-20020a1c7c12000000b003edb04873f4mr9095810wmc.5.1682373067100; 
 Mon, 24 Apr 2023 14:51:07 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:f3de:bddc:c766:c327])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5005000000b0030469635629sm6589618wrt.62.2023.04.24.14.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 14:51:06 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 23:51:06 +0200
Message-Id: <20230424215106.1202752-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682373067; x=1684965067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=1RUlvKVoKRgm5xJbim162kIJ5BbLxcZkaMqDPPWDjhE=;
 b=hbeYV5n76iW5cK1HpUdoahGIPzVA1xAcW3cKmRUdJWExIJGuGHSyKN+RvQpjwafRiX
 q5mgupHnNbfgsQmB55MS5XfDVU+OmHUlrGHbGASPzmAXvLvEV/0jzLmyNzr0DHMu5r9i
 q2g/pDfFPFLbvGfpDYjZ4k3qiaG30gw3fXsLkEi58YOC6U6DcdacT+rRtNLT8ox7zg/a
 /E9u0aHMbCzcte6ta84gW4epLESkkDLuKR/FBCPcWTZZD4pUa36N4KE/UhYmInTCGde9
 jqQjgQCEZuuCMrVnnIMjwF8j9Yx0KNhzWCscrUhkI7mzz8Yi0YGP1GJt10PGskM+15ou
 4aCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=hbeYV5n7
Subject: [Buildroot] [PATCH] support/testing: new runtime test for bash
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

Commit 2dff6e93ca2a (package/readline: add upstream patch to fix crash
with invalid locale specification) fixed a regression in readline 8.2
[0], that could have been caught with a runtime test. readline is a
library, so we need an executable that exercises readline.

Since readline and bash are developped in tandem [1], it is only logical
to use bash to test readline.

Add a new runtime test for bash, that checks that we can indeed run an
interactive shell, and that an non-existing locale does not cause the
dreaded segfault. We do not use the default configuration, because it
uses a uclibc toolchain, and we want to reproduce against a glibc one.

[0] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1021109
[1] https://tiswww.case.edu/php/chet/readline/rltop.html#Bugs

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_bash.py | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 support/testing/tests/package/test_bash.py

diff --git a/support/testing/tests/package/test_bash.py b/support/testing/tests/package/test_bash.py
new file mode 100644
index 0000000000..f0ee8cadc1
--- /dev/null
+++ b/support/testing/tests/package/test_bash.py
@@ -0,0 +1,47 @@
+import os
+
+import infra.basetest
+
+
+class TestBash(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_ENABLE_LOCALE_WHITELIST=""
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_BASH=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check that we are indeed not (yet) running bash
+        out, _ = self.emulator.run('echo "${BASH}"')
+        self.assertEqual(out[0], "", "Already running bash instead of busybox' sh")
+
+        self.assertRunOk("bash -il")
+        # Twist! The above command is still runing, it's just that
+        # bash did display the prompt we expect. Check we are indeed
+        # actually bash
+        out, _ = self.emulator.run('echo "${BASH}"')
+        self.assertEqual(out[0], "/bin/bash", "Not running bash")
+        # Exit bash, back to busybox' shell
+        self.emulator.run("exit 0")
+
+        # Check that we are indeed no longer running bash
+        out, _ = self.emulator.run('echo "${BASH}"')
+        self.assertEqual(out[0], "", "Still running bash instead of busybox' sh")
+
+        # Try to run with a non-available locale
+        self.assertRunOk("LC_ALL=en_US bash -il")
+        out, _ = self.emulator.run('echo "${BASH}"')
+        self.assertEqual(out[0], "/bin/bash", "Not running bash")
+        self.emulator.run("exit 0")
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
