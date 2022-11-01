Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE57EC4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 18:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 400D540912;
	Tue,  1 Nov 2022 18:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 400D540912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KmeVdyvpUPW1; Tue,  1 Nov 2022 18:13:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E15574146F;
	Tue,  1 Nov 2022 18:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E15574146F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29BCF1BF5F8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 18:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 059E0400D2
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 18:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 059E0400D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XBewRzShSU5F for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 18:13:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A41CD4017C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A41CD4017C
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 18:13:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 11B2E20009;
 Tue,  1 Nov 2022 18:13:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 19:13:19 +0100
Message-Id: <20221101181320.368702-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101181320.368702-1-thomas.petazzoni@bootlin.com>
References: <20221101181320.368702-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667326407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SeV5Hymkp0nqbQpFsPJqUK7W9XrF37jzCojhHL+kHHc=;
 b=aLEf25fFSHRL82VXC4nCAIBZmQpuWM2Pl57tj/RfZgcseBv3Wwaj28xh94VXJA6R1PZ7nw
 Oy7g5y0A47IjEoe6wjHfhqYtD9bKC4zxHvcHTKUdgbeaRDfr9ez+g2Yo1r/LQUg9n++cIj
 hixrCcepYol+Atxc0JxXU12uYKcNNS/sM30LZPPzKBvuU+NXO+NMs8gtIIf19e2joOwO23
 8cJG6LavRIbtyt6sc+r+dr8OGjS1UXW7xcj2+4oSMAcZH1a69mBYXKPSwrYt9FRUcZDvJR
 nTnr+1jh5SafFfD45BtVywkzjg471XP0hb4CyMsp+2l6kVQ43tVlewAa/30/2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aLEf25fF
Subject: [Buildroot] [PATCH 3/3] support/testing/tests/package/test_gdb.py:
 drop version-specific tests
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Back when support/testing/tests/package/test_gdb was introduced, there
was a significant difference in how gdb < 10 and gdb >= 10 were
handled in gdb.mk, which explained why we were testing both gdb 9.x
and gdb 11.x.

However, support for gdb 9.x has now been dropped, and we only support
gdb >= 10.x, so testing gdb 9.x and 11.x separately no longer make
much sense. In addition:

 - other GDB tests in the same file already test the default version,
 which is now 11.x, meaning we in fact have duplicated tests between
 the ones testing the default version and the ones testing 11.x
 specifically

 - GDB 9.x has been removed, which means all the tests testing GDB 9.x
 are failing, with a Config.in.legacy build error.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3249828456 (TestGdbHostOnly9x)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/3249828454 (TestGdbHostGdbserver9x)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/3249828451 (TestGdbHostGdbTarget9x)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_gdb.py | 108 ----------------------
 1 file changed, 108 deletions(-)

diff --git a/support/testing/tests/package/test_gdb.py b/support/testing/tests/package/test_gdb.py
index a7b0870644..4712162349 100644
--- a/support/testing/tests/package/test_gdb.py
+++ b/support/testing/tests/package/test_gdb.py
@@ -91,114 +91,6 @@ class TestGdbFullTarget(BaseGdb):
         self.verify_gdb()
 
 
-class TestGdbHostOnly9x(BaseGdb):
-    config = \
-        infra.basetest.MINIMAL_CONFIG + \
-        """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_PACKAGE_HOST_GDB=y
-        BR2_GDB_VERSION_9_2=y
-        """
-
-    def test_run(self):
-        self.verify_host_gdb()
-
-
-class TestGdbHostGdbserver9x(BaseGdb):
-    config = \
-        """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_PACKAGE_HOST_GDB=y
-        BR2_GDB_VERSION_9_2=y
-        BR2_PACKAGE_GDB=y
-        BR2_TARGET_ROOTFS_CPIO=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-
-    def test_run(self):
-        self.verify_host_gdb()
-        self.boot()
-        self.verify_gdbserver()
-
-
-class TestGdbHostGdbTarget9x(BaseGdb):
-    config = \
-        """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_PACKAGE_HOST_GDB=y
-        BR2_GDB_VERSION_9_2=y
-        BR2_PACKAGE_GDB=y
-        BR2_PACKAGE_GDB_DEBUGGER=y
-        BR2_TARGET_ROOTFS_CPIO=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-
-    def test_run(self):
-        self.verify_host_gdb()
-        self.boot()
-        self.verify_gdb()
-
-
-class TestGdbHostOnly11x(BaseGdb):
-    config = \
-        infra.basetest.MINIMAL_CONFIG + \
-        """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_PACKAGE_HOST_GDB=y
-        BR2_GDB_VERSION_11=y
-        """
-
-    def test_run(self):
-        self.verify_host_gdb()
-
-
-class TestGdbHostGdbserver11x(BaseGdb):
-    config = \
-        """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_PACKAGE_HOST_GDB=y
-        BR2_GDB_VERSION_11=y
-        BR2_PACKAGE_GDB=y
-        BR2_TARGET_ROOTFS_CPIO=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-
-    def test_run(self):
-        self.verify_host_gdb()
-        self.boot()
-        self.verify_gdbserver()
-
-
-class TestGdbHostGdbTarget11x(BaseGdb):
-    config = \
-        """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_PACKAGE_HOST_GDB=y
-        BR2_GDB_VERSION_11=y
-        BR2_PACKAGE_GDB=y
-        BR2_PACKAGE_GDB_DEBUGGER=y
-        BR2_TARGET_ROOTFS_CPIO=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-
-    def test_run(self):
-        self.verify_host_gdb()
-        self.boot()
-        self.verify_gdb()
-
-
 class TestGdbArc(BaseGdb):
     config = \
         """
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
