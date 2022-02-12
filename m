Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07063C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 20:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB0494032D;
	Sat, 12 Feb 2022 20:39:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qd6pOgjEbWaw; Sat, 12 Feb 2022 20:39:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDE2D4022A;
	Sat, 12 Feb 2022 20:39:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0676F1BF577
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 031BD60A8B
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XWSJJM8c32_7 for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 20:39:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 686AB606F9
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 20:39:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B150881D55; Sat, 12 Feb 2022 20:31:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 21:38:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7227d005d2435ec7b38995a6247d233ddb5ba365
X-Git-Newrev: de0f5ba17a15a87bc16a6d6aa318104510c38f9d
X-Patchwork-Hint: ignore
Message-Id: <20220212203150.B150881D55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: build after wireless-regdb if
 enabled for early loading support
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0981358074293996145=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0981358074293996145==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=de0f5ba17a15a87bc16a6d6aa318104510c38f9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To support building in the wireless regulatory database files (regulatory.db*)
into the kernel using the CONFIG_EXTRA_FIRMWARE option, we need to ensure that
the database files are installed before the Linux kernel is built.
The dependency is harmless if CONFIG_EXTRA_FIRMWARE isn't actually set.

Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 35e2484588..d798aea057 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -72,7 +72,8 @@ LINUX_MAKE_ENV = \
 LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES = host-kmod \
 	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
-	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware)
+	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware) \
+	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
 
 # Starting with 4.16, the generated kconfig paser code is no longer
 # shipped with the kernel sources, so we need flex and bison, but

--===============0981358074293996145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0981358074293996145==--
