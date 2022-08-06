Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69105C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 21:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C409740981;
	Sat,  6 Aug 2022 21:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C409740981
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g7wYiW9_e39x; Sat,  6 Aug 2022 21:23:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 771D6402C2;
	Sat,  6 Aug 2022 21:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 771D6402C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B59901BF3FF
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 908CE60F7D
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 908CE60F7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rtETkRPh-UrY for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 21:23:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D5BF607C0
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 21:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D5BF607C0
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A10C386E3F; Sat,  6 Aug 2022 21:08:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Aug 2022 23:22:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5fef2f2669ac7dd00119e5371571c1030fa69570
X-Git-Newrev: c6241bc2ca335a405f1ccf387d5d77ad141277a2
X-Patchwork-Hint: ignore
Message-Id: <20220806210853.A10C386E3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lshw: allso uses hwdata' PNP IDs
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6241bc2ca335a405f1ccf387d5d77ad141277a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 29bccabdebff (lshw: use data files provided by hwdata) removed
the hardware info DBs installed by lshw, in favour of those provided by
hwdata, as the former are way out-dated while the latter are more
up-to-date.

However, it forgot to also select the PNP ID database, to replace the
one lshw would install.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lshw/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lshw/Config.in b/package/lshw/Config.in
index 5e0e47b6e2..fb557aacff 100644
--- a/package/lshw/Config.in
+++ b/package/lshw/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LSHW
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_HWDATA # runtime
 	select BR2_PACKAGE_HWDATA_PCI_IDS
+	select BR2_PACKAGE_HWDATA_PNP_IDS
 	select BR2_PACKAGE_HWDATA_USB_IDS
 	help
 	  lshw (Hardware Lister) is a small tool to provide
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
