Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC24C43217
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:38:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D56DF6137C
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D56DF6137C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A9FE83AAD;
	Wed, 20 Oct 2021 16:38:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qiDzpEt3ZGbt; Wed, 20 Oct 2021 16:38:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9840839BD;
	Wed, 20 Oct 2021 16:38:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99CE11BF372
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A2714034F
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:38:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HHVKZqwOpoiz for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 16:38:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFB46402B7
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 16:38:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 22516880D3; Wed, 20 Oct 2021 16:35:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 18:37:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1eae8ce968c99604c01588dafcc378640a937b86
X-Git-Newrev: 4fd93fc47fcf5547fc90d4302f58c1052d405e62
X-Patchwork-Hint: ignore
Message-Id: <20211020163522.22516880D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-firmware: fix config.txt
 installation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4fd93fc47fcf5547fc90d4302f58c1052d405e62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 689b9ac439ab (package/rpi-firmware: rework boot/config file
handling), a last-minute fixup was made to handle the case where no
config.txt file was provided by the user.

However, the intermediate variable RPI_FIRMWARE_CONFIG_FILE was not used
consistently, and the old PACKAGE_RPI_FIRMWARE_CONFIG_FILE variable was
still used where RPI_FIRMWARE_CONFIG_FILE should have been used instead.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr: blame myself for the mess; reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 8a6a435f63..0929d6af1e 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -28,9 +28,9 @@ define RPI_FIRMWARE_INSTALL_BIN
 endef
 
 RPI_FIRMWARE_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE))
-ifneq ($(PACKAGE_RPI_FIRMWARE_CONFIG_FILE),)
+ifneq ($(RPI_FIRMWARE_CONFIG_FILE),)
 define RPI_FIRMWARE_INSTALL_CONFIG
-	$(INSTALL) -D -m 0644 $(PACKAGE_RPI_FIRMWARE_CONFIG_FILE) \
+	$(INSTALL) -D -m 0644 $(RPI_FIRMWARE_CONFIG_FILE) \
 		$(BINARIES_DIR)/rpi-firmware/config.txt
 endef
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
