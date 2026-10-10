Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16EACA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BAFC81218;
	Sat, 10 Oct 2026 07:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4E0vXH58fq0J; Sat, 10 Oct 2026 07:08:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6E41181209
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791616129;
	b=LCEyyj/WJnlLTbiFckr4Yy0fqGG0ByLOGgsY8WbnD8LmeSMxW0PaHdid+MQ7VdZtgF/j
	 ASKjYeiPk0n/XOgcjlErDlerbvSB8rK1MO+Vj03KuaL9Pf5hH1qW7mWm+rGk4aS0kp1sF
	 Yu5ORf5+TlBLAkUEc8SyirLqUGKQCN+4KDkJJgKUi7nSKCsvj9bJJRI67/RilVoxAz/Bd
	 f6xMnyuCPA4FEkjmL8D1UqexBGIYKPe9SPPUlvVk3ufGEoy7jtZkBPY9GsZPDDpUyxd0y
	 vcF29/eURCtL8XNTcA203yruBpmvahoE2rbLzSk7RH77a9J1iIVUdHVJWo6uulFD9NA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791616129;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EiYEWASZX/gHHC162qH8naaNfIDEViPcABD2QWHG20Y=;
	b=UgRSNcXVYcn+Y5hEaYf2lhEVs37YIOkjpo6sEgfffp9Ur6UzT0q5MlAayn30YRLIohgi
	 Bfv68ekegCqaq7b/mSZjZUOl7j59JkPnVg8Fxxg0px2N0ibfVfv11Rjatgf7kj8oC/O+v
	 wLt7Oi5L217udgPCsVBja+Xd3+42lpyUvO9I4QhdApGjBt3ImXx12aCJf8kUWIa14rd6t
	 koFBhP91Dzh1tcwG44IoPrMeg8VizcpQyBuBzSajoLQ6epPYxdzk3EHh/90weNfEVkSzr
	 7aKujgZH9i8Z0BxpvZhwCRO4GLcb1XcDmF7xRnhVvp/K7qbtRZjDo8APUfc3kX1tciQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791616129;
	bh=EiYEWASZX/gHHC162qH8naaNfIDEViPcABD2QWHG20Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=en2ja7LUDNmccVY7fSBoEVTRRz9SqpbGyT+pTBjafMrjUkfgJnrg6pXhyfNxz11Xc
	 5QnxuOGw8cl/LTlXRiMFGRpXdOvuUwDcATX9QFIdtWSwarPVC6bcg3mYl4qatZl9si
	 6MAChcZbWKeTnNrCeFDyJIsYPIr+/aYOJWKpZ9j9b/KhthT0SaYmsKfIbZQXCPsWjA
	 oFG19f1VFFWCCqyPONwtr0F5OWB50H5Q3Z6OLKRqEquSsouJZjBW9kJVQ7dflsjLiS
	 dB7De5G8mycD9eWZcKx0oxByXNWwkW6EW2WqRlZTB/LRDIq2h659D5cqvsNZCmxjaw
	 K5N0bmtI/q28Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E41181209;
	Sat, 10 Oct 2026 07:08:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C648BA64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C383C81209
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WyPE7YL74wGY for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:08:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1C44C81205
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791616126;
 b=HNU1Csem0ZwV0+bxQ13Yi3Qj1YGwh/p7pjFph/Ia8WYiw5P2Z9NbDaZEHPZ3cqA8/UCd
 EkH+SVYcLLMS+YVbdlg3I8x/ca5txGxw2kEJyC7vOnKBxEAMGZ2/ffoYShV6F+U4SqPMB
 Q/ppzrRDn/2PvvhNUP/s8BOz3u+Wmf3lpCzK85gpvzfh6NpXq/dWlyRWWC0vOineYz1Gq
 MFBnvn/hidjrvmmGJOREHKhkVyS8X+BkhEDgeK3mkJF0rOUAAnkVANYUWRpz/T76X0bLT
 5GVXR3uXIvprLv8afJWCaC11yma8xI8KOQ/6ABCy8pg+fPXf7wR748AaIWcQF7klS4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791616126;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vWrga5rMBgsaib3mLt8wGc3mgnKB3S4d+xocqqinSbA=;
 b=Ok2ODkvRDssgXMmzXur9LxTsBJITUKUKwBx0U+vQwNQ2/x2famOtANI8Ec84MIE80et4
 S0h/0HOwWDsOzUMfhnQNXl3RtsZYE5eBJ3msKkSxrClKu0YG02YuBjhsXO/bcbVEgrdvw
 JL+18dRdD+vKxJEoNZeM9yG43DKzQOkonPm4vo6LBJwQLqyNvcDGIsaUwzPK/rG15yCGu
 xWLdB6zZP2Fe5tYD5v4uLyb1Wd4VjbLUEE0Dn06nzKeQTvv7os+rgOUp4mME7KWt1Hq9A
 Hwk1rQumecg9zvmF2EJFWVnSsQjOl58E+FV4HatAm7j7tWmmntgQXaBaQ5eDRhwOIsg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C44C81205
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD4DF8E644; Sat, 10 Oct 2026 07:07:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 09:06:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8198b6b3c9c824755ca3b7aba9be0b18e7526575
X-Git-Newrev: 1e401eddad884bb92ec5c0075845575209a3c374
X-Patchwork-Hint: ignore
Message-Id: <20261010070727.DD4DF8E644@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: quazip: refactor to have
 a base class for the Qt{5, 6} test classes
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1e401eddad884bb92ec5c0075845575209a3c374
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_quazip.py | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/support/testing/tests/package/test_quazip.py b/support/testing/tests/package/test_quazip.py
index 154481fe4a..b1bcdb7e07 100644
--- a/support/testing/tests/package/test_quazip.py
+++ b/support/testing/tests/package/test_quazip.py
@@ -3,10 +3,10 @@ import os
 import infra.basetest
 
 
-class TestQuazipQt6(infra.basetest.BRTest):
+class TestQuazipBase(infra.basetest.BRTest):
+    __test__ = False
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_PACKAGE_QT6=y
         BR2_PACKAGE_QUAZIP=y
         BR2_PACKAGE_QUAZIP_INSTALL_TESTS=y
         BR2_TARGET_ROOTFS_CPIO=y
@@ -23,21 +23,17 @@ class TestQuazipQt6(infra.basetest.BRTest):
         self.assertRunOk("/usr/bin/qztest", 120)
 
 
-class TestQuazipQt5(infra.basetest.BRTest):
-    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+class TestQuazipQt5(TestQuazipBase):
+    __test__ = True
+    config = TestQuazipBase.config + \
         """
         BR2_PACKAGE_QT5=y
-        BR2_PACKAGE_QUAZIP=y
-        BR2_PACKAGE_QUAZIP_INSTALL_TESTS=y
-        BR2_TARGET_ROOTFS_CPIO=y
         """
 
-    def test_run(self):
-        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv5",
-                           kernel="builtin",
-                           options=["-initrd", cpio_file])
-        self.emulator.login()
 
-        # qztest returns non-zero if any of the tests failed
-        self.assertRunOk("/usr/bin/qztest", 120)
+class TestQuazipQt6(TestQuazipBase):
+    __test__ = True
+    config = TestQuazipBase.config + \
+        """
+        BR2_PACKAGE_QT6=y
+        """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
