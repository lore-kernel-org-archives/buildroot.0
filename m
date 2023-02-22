Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC49C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 21:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FB53612DF;
	Wed, 22 Feb 2023 21:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FB53612DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWHaWDFaieei; Wed, 22 Feb 2023 21:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBAA561395;
	Wed, 22 Feb 2023 21:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBAA561395
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 713E31BF59E
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 21:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B6E961396
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 21:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B6E961396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rOmKR_jPKbpq for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 21:03:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01628612DF
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 21:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01628612DF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD7F1868CE; Wed, 22 Feb 2023 21:03:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 22:03:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8beed8ac56a51d4d6a9dd81b81b8025cb7f8d99b
X-Git-Newrev: 97c40266b1b69e101ce035c8aa73bf2665c5c256
X-Patchwork-Hint: ignore
Message-Id: <20230222210330.DD7F1868CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qemu: add option to
 install blobs
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=97c40266b1b69e101ce035c8aa73bf2665c5c256
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Binary blobs are BIOS of some sorts for the various machines emulated
by QEMU. There is no option to individually install blobs; it's an
all-or-nothing option.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in | 11 +++++++++++
 package/qemu/qemu.mk   |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 154b98a541..a446c0cf68 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -58,6 +58,17 @@ config BR2_PACKAGE_QEMU_SYSTEM
 
 if BR2_PACKAGE_QEMU_SYSTEM
 
+config BR2_PACKAGE_QEMU_BLOBS
+	bool "Install binary blobs"
+	default y
+	help
+	  Say 'y' here (the default) to install binary blobs (such as
+	  BIOS or firmwares for the different machines simulated by
+	  QEMU). Say 'n' to not install those blobs.
+
+	  Note: Some machines may be unbootable without those blobs.
+	  If unsure, say 'y'.
+
 config BR2_PACKAGE_QEMU_SLIRP
 	bool "Enable user mode networking (SLIRP)"
 	select BR2_PACKAGE_SLIRP
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 58b4ff10a5..d514a2285c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -246,6 +246,12 @@ ifeq ($(BR2_STATIC_LIBS),y)
 QEMU_OPTS += --static
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_BLOBS),y)
+QEMU_OPTS += --enable-install-blobs
+else
+QEMU_OPTS += --disable-install-blobs
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define QEMU_CONFIGURE_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
