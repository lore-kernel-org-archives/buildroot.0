Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C676DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:06:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20AF5610FD
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20AF5610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A77EC401E9;
	Sun, 12 Sep 2021 12:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hDC2o-1xGqBS; Sun, 12 Sep 2021 12:06:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF64F40247;
	Sun, 12 Sep 2021 12:06:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89BC11BF47A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 756A740247
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R8ngwwJ4mZNz for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 12:05:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0E5A401E9
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:05:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 97A198A3EA; Sun, 12 Sep 2021 12:04:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 14:03:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3edc1cc44c7bd2deed31d28fa9534e67f32334e8
X-Git-Newrev: d27c74381c37843592fe851d1953e3de0c1e4290
X-Patchwork-Hint: ignore
Message-Id: <20210912120419.97A198A3EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: fix check-package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d27c74381c37843592fe851d1953e3de0c1e4290
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix check-package issues introduced with commit af99e7a5f386
(boot/uboot: copy IMX firmware files to uboot package dir).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/uboot/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8cc40cd9c5..1fc93a443f 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -245,8 +245,9 @@ config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
 	depends on BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || \
 		BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
 	help
-	  Some i.MX8 platforms (such as i.MX8 M, i.MX 8M Mini, i.MX 8M Nano)
-	  encapsulate NXP specific firmware (DDR, HDMI) inside U-Boot.
+	  Some i.MX8 platforms (such as i.MX8 M, i.MX 8M Mini, i.MX 8M
+	  Nano) encapsulate NXP specific firmware (DDR, HDMI) inside
+	  U-Boot.
 	  This option makes sure that the i.MX firmwares are copied into
 	  the U-Boot source directory.
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
