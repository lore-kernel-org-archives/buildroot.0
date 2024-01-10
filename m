Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D265C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 21:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDD3743744;
	Wed, 10 Jan 2024 21:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDD3743744
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XP_sJwjSS-TY; Wed, 10 Jan 2024 21:06:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85CC443748;
	Wed, 10 Jan 2024 21:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85CC443748
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8BD241BF2CA
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62F8B43748
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62F8B43748
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B5dorynNmTii for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 21:06:52 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B0B243744
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B0B243744
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2DB7513F8AD;
 Wed, 10 Jan 2024 22:06:48 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:06:38 +0100
Message-ID: <20240110210638.213739-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704920809;
 bh=9ZCXSSeKk1jJ3LjkSVs4MItnStLwYj1vpsVuVrUzya8=;
 h=From:To:Cc:Subject:Date:From;
 b=s59qDVYLrF2VCa7Fr64gre/T8GtAJ015vHiVWSRM6FISHuSgqd5vGJ8xxVeW5KaTB
 NbKIZa2KDuYL3O9h9Cz5Tr6YKRoa1Ep7uceLeruBrYYmcjL0LFqoKh7rf0iBqi/4PK
 hLPNt5T8BXAuWfPO6PMcitXoOvx3FiRq6fdo17+cKDqEpvWB45nqKYK9pX3jZBG7gl
 wOAOSN8EQfk5pfLXPXLh2Bgsumw/o/A3P12zkwWAShdMUZoDQ0grWPYAXSdkgSm5US
 B4qPq5Sd0u11g8tZ9H5fBpmb/sSnT8fOt4wEk4Ix62uUgC43CTxDJduzOeA8tbqwCe
 TSIfU2FvtJZAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=s59qDVYL
Subject: [Buildroot] [PATCH 1/1] support/testing: add mtr runtime test
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_mtr.py | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 support/testing/tests/package/test_mtr.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d7543247f2..79152b28ae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1789,6 +1789,7 @@ F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_lz4.py
 F:	support/testing/tests/package/test_lzop.py
 F:	support/testing/tests/package/test_mtools.py
+F:	support/testing/tests/package/test_mtr.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_nftables/
diff --git a/support/testing/tests/package/test_mtr.py b/support/testing/tests/package/test_mtr.py
new file mode 100644
index 0000000000..d78b33a31a
--- /dev/null
+++ b/support/testing/tests/package/test_mtr.py
@@ -0,0 +1,22 @@
+import os
+
+import infra.basetest
+
+
+class TestMtr(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_MTR=y
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
+        self.assertRunOk("mtr --version")
+        self.assertRunOk("mtr -r -c 5 127.0.0.1", timeout=30)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
