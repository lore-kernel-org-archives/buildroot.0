Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC1ACA0EE4
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 10:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A07381119;
	Fri, 15 Aug 2025 10:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9bDKgDapokB; Fri, 15 Aug 2025 10:30:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4247080F3D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4247080F3D;
	Fri, 15 Aug 2025 10:30:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7825228
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 10:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E62880F02
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 10:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vABzFpr7GbeH for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 10:30:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9EB4A80EC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EB4A80EC0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EB4A80EC0
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 10:30:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 238B243222;
 Fri, 15 Aug 2025 10:30:06 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Aug 2025 12:29:59 +0200
Message-ID: <20250815103002.3871929-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815103002.3871929-1-thomas.petazzoni@bootlin.com>
References: <20250815103002.3871929-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeefjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdetueevgeeggfdvtdefffejtdffgefgvddthffgfeeifeeffefftdfglefgveenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdrhhhomhgvpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755253806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H5d7R2WJvMA2heUFaQYwPY+fwJtVjE/Qtb+co1LndL8=;
 b=IDeWWR18/D/e25h+gXg4T9jqvurKV/86Wh734dDJ8Zo0fVbIkzJnE6HHupo4yQqxIqih8s
 dyjsayyta3olo1v5g+Pag/Z5WbHqILs7VUAN4zW+d/4VUXlUsMQRk5tqoEOuk3FuHLJBtV
 7l0qUrBd2WvlfGV3J6qAZaClzHo/ydYuDqKv0gvhqwcieQxNHOqu9qyYMtN1pWXB46NWJ6
 +Di0D1fjrDT/5+Rryd6Pomu4XMlVyL7g1Zq0cvJF15paTS+EGaYJXGfGpqu2o9JVSOzyhX
 SUMblw1xGlOAZHqxNfwXELt6OmOydmnNGGcExN1rxFj9S2AwE1ZxNgoK2Tz/+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IDeWWR18
Subject: [Buildroot] [PATCH 2/3] support/testing/tests/boot/test_grub.py:
 use glibc toolchain
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the recent bump of Bootlin toolchains in
947dbc92a20c5acea7882166cae7893e6ea661e1 ("toolchain/toolchain-external/toolchain-external-bootlin:
update to Bootlin toolchains 2025.08-1"), our grub2 tests are failing
as the new uClibc toolchains based on gcc 14.x have an issue building
grub.

Until this issue gets fixed at the uClibc level and since anyway glibc
is now the default in Buildroot, let's switch to using glibc
toolchains.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858692
  https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858686
  https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858680

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/boot/test_grub.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index 37b7c06143..7ce7066875 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -8,7 +8,7 @@ class TestGrubi386BIOS(infra.basetest.BRTest):
         """
         BR2_x86_core2=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
         BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
         BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
         BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
@@ -37,7 +37,7 @@ class TestGrubi386EFI(infra.basetest.BRTest):
         """
         BR2_x86_core2=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
         BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
         BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
         BR2_LINUX_KERNEL=y
@@ -88,7 +88,7 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
         BR2_x86_64=y
         BR2_x86_corei7=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
         BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
         BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
         BR2_LINUX_KERNEL=y
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
