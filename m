Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2723CC04A6A
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 11:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA5AD81E82;
	Sun,  6 Aug 2023 11:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA5AD81E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6swpYvmuIbCP; Sun,  6 Aug 2023 11:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B54681842;
	Sun,  6 Aug 2023 11:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B54681842
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1603A1BF293
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EAA781852
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EAA781852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pMR3WbLDMoKe for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 11:45:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC11C8145C
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 11:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC11C8145C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 968EE842C0; Sun,  6 Aug 2023 11:45:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 13:44:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6d37bf0509aa163154c7b8723ce653afb8810e6c
X-Git-Newrev: ffbc72e8bc1feb28351d009aa6292309c8aaf9bf
X-Patchwork-Hint: ignore
Message-Id: <20230806114509.968EE842C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/arp-scan: allow to not
 install package data
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

commit: https://git.buildroot.net/buildroot/commit/?id=ffbc72e8bc1feb28351d009aa6292309c8aaf9bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The patch adds an option that allows you to not install the data along
with the binaries (less than 100kb), saving 1.4Mb of rootfs data.

By default, the data is installed for backward compatibility.

Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/arp-scan/Config.in   | 11 +++++++++++
 package/arp-scan/arp-scan.mk |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/package/arp-scan/Config.in b/package/arp-scan/Config.in
index ed70b39586..cf7377d2f9 100644
--- a/package/arp-scan/Config.in
+++ b/package/arp-scan/Config.in
@@ -8,3 +8,14 @@ config BR2_PACKAGE_ARP_SCAN
 	  discover and fingerprint IP hosts on the local network.
 
 	  https://github.com/royhills/arp-scan
+
+if BR2_PACKAGE_ARP_SCAN
+
+config BR2_PACKAGE_ARP_SCAN_DATA
+	bool "install data (OUI)"
+	default y  # legacy
+	help
+	  Say 'y' here (the default) to install the data along the
+	  binaries.
+
+endif # BR2_PACKAGE_ARP_SCAN
diff --git a/package/arp-scan/arp-scan.mk b/package/arp-scan/arp-scan.mk
index 89644be9d3..67eb1881db 100644
--- a/package/arp-scan/arp-scan.mk
+++ b/package/arp-scan/arp-scan.mk
@@ -23,4 +23,8 @@ else
 ARP_SCAN_CONF_OPTS += --without-libcap
 endif
 
+ifeq ($(BR2_PACKAGE_ARP_SCAN_DATA),)
+ARP_SCAN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
