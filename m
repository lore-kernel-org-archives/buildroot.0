Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA797E92725
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 23:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A5D6607C6;
	Sat, 27 Dec 2025 23:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YarZdUHdKjfH; Sat, 27 Dec 2025 23:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9790E607E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766878799;
	bh=N3dQIALDe35YVgh8+l6dR44A8wvvgZ15smnL4pn+Hok=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UQsYoHdA6YLmQy3171SZweHN2w5/SuUY8YNb4jpgYUhxFpdB/z8XPKfrokkmCRxhZ
	 NjaaK5eECOk0on0cxeSaiSRCOuFH/8DMp7D8z4tcBr6spgemiiBazLjloM2h38/jC/
	 1faCsZ0+pDZODrJ0emtq9rM3rAaYdl1OZH+Le96HZoiVpn18tYuir3w8HhNGBqxBGP
	 qSrN6jDDRbgm6bfeCLh6DcdCsEFy9WOWwBXeS54QdtjFLMFA6TIZzfahiMBzXdkiHn
	 h9H2XVCwTnBFThef0i/cxKWwRUAIrdQdNSA31zLKTmHy2v8VFC3sx77KQZDIv3U5be
	 xdcHnH0Pvf6OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9790E607E6;
	Sat, 27 Dec 2025 23:39:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CFD530D
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BECE607C6
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_e8fDEiTITp for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CFED607BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CFED607BE
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 598BD87900; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 00:39:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0ab8bb2eebd0ea9d066cccfa50006e71d7b0a8d
X-Git-Newrev: 4fc6e8637bd771478f132e1e5e23c6d0c483331e
X-Patchwork-Hint: ignore
Message-Id: <20251227233954.598BD87900@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: ddrescue: use dmsetup
 from lvm2
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

commit: https://git.buildroot.net/buildroot/commit/?id=4fc6e8637bd771478f132e1e5e23c6d0c483331e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ddresue runtime test is using the `dmsetup` command provided by the
dmraid package. This package is outdated and will be removed. This
command is also provided by the lvm2 package, which is still maintained.

This commit replaces the dmraid package by lvm2 in the test config.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_ddrescue.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
index 989abc8f01..042431eb7b 100644
--- a/support/testing/tests/package/test_ddrescue.py
+++ b/support/testing/tests/package/test_ddrescue.py
@@ -9,7 +9,7 @@ class TestDdrescue(infra.basetest.BRTest):
     # - A kernel config fragment enables loop blk dev and device
     #   mapper dm-dust, which are used to simulate a failing storage
     #   block device.
-    # - dmraid user space package is needed to configure dm-dust
+    # - lvm2 user space package is needed to configure dm-dust with dmsetup
     config = \
         """
         BR2_aarch64=y
@@ -23,7 +23,7 @@ class TestDdrescue(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_PACKAGE_DDRESCUE=y
-        BR2_PACKAGE_DMRAID=y
+        BR2_PACKAGE_LVM2=y
         BR2_TARGET_ROOTFS_CPIO=y
         BR2_TARGET_ROOTFS_CPIO_GZIP=y
         # BR2_TARGET_ROOTFS_TAR is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
