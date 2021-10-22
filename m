Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F82CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 11:52:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 076D360ED3
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 11:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 076D360ED3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1B15407A1;
	Fri, 22 Oct 2021 11:52:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UruujmII6cRu; Fri, 22 Oct 2021 11:52:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3495640786;
	Fri, 22 Oct 2021 11:52:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60EB11C1135
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 11:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E6EB40249
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 11:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IyZdB9ZoyoWa for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 11:51:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD07940241
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 11:51:38 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 0CAB324000A;
 Fri, 22 Oct 2021 11:51:36 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 13:51:34 +0200
Message-Id: <20211022115134.345595-5-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022115134.345595-1-kory.maincent@bootlin.com>
References: <20211022115134.345595-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 5/5] boot/grub2/grub2.mk: use none platform
 when building for host
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
Cc: aduskett@gmail.com, yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When creating the image we are using the target modules. Building the
modules for host is then unnecessary.
Let configure Host Grub2 for none platform.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/grub2/grub2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 270f289cfd..d93e383422 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -140,6 +140,7 @@ GRUB2_CONF_ENV = \
 	TARGET_STRIP="$(TARGET_CROSS)strip"
 
 HOST_GRUB2_CONF_OPTS = \
+	--with-platform=none \
 	--disable-grub-mkfont \
 	--enable-efiemu=no \
 	ac_cv_lib_lzma_lzma_code=no \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
