Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D5AC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91F0D61286;
	Tue, 21 Feb 2023 01:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91F0D61286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GC9RmqT0xmga; Tue, 21 Feb 2023 01:18:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9970E6FB8E;
	Tue, 21 Feb 2023 01:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9970E6FB8E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9971C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1128610A6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1128610A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r1TjT-YssOuy for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1C316FBD4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1C316FBD4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC7EF828C8; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 23:04:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e43a3c785b9666f3144e7905b27af920fff913e9
X-Git-Newrev: 8459abc46acc2dd304b1d30cc27eada296ebcfa1
X-Patchwork-Hint: ignore
Message-Id: <20230220205242.BC7EF828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/util-linux: add an
 option to enable irqtop
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

commit: https://git.buildroot.net/buildroot/commit/?id=8459abc46acc2dd304b1d30cc27eada296ebcfa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

irqtop is an IRQ monitoring tool.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/util-linux/Config.in     | 8 ++++++++
 package/util-linux/util-linux.mk | 1 +
 2 files changed, 9 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 917f1bc2b4..b5d8cad15b 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -161,6 +161,14 @@ config BR2_PACKAGE_UTIL_LINUX_IPCS
 	help
 	  Show information on IPC facilities
 
+config BR2_PACKAGE_UTIL_LINUX_IRQTOP
+	bool "irqtop"
+	depends on BR2_USE_MMU # libsmartcols
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	help
+	  Show information on IRQs
+
 config BR2_PACKAGE_UTIL_LINUX_KILL
 	bool "kill"
 	help
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index b53b94ec31..87ec3c19d7 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -136,6 +136,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCMK),--enable-ipcmk,--disable-ipcmk) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCRM),--enable-ipcrm,--disable-ipcrm) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCS),--enable-ipcs,--disable-ipcs) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_IRQTOP),--enable-irqtop,--disable-irqtop) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LAST),--enable-last,--disable-last) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),--enable-libblkid,--disable-libblkid) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
