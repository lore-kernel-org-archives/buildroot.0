Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C0AC636CB
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 22:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E8E3416BA;
	Sat, 28 Jan 2023 22:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E8E3416BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HGSvGxgNmT-A; Sat, 28 Jan 2023 22:09:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22C09416BF;
	Sat, 28 Jan 2023 22:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22C09416BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 37FF11BF44C
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F6AC40463
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F6AC40463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id girFRaVIxmRS for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 22:09:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE62B4013C
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 22:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE62B4013C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5BF587FC3; Sat, 28 Jan 2023 22:09:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 23:04:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e43a3c785b9666f3144e7905b27af920fff913e9
X-Git-Newrev: 8459abc46acc2dd304b1d30cc27eada296ebcfa1
X-Patchwork-Hint: ignore
Message-Id: <20230128220917.B5BF587FC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: add an option to
 enable irqtop
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
