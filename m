Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4CBC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 19:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02E5741395;
	Fri, 31 May 2024 19:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ge3t9cS9CgB9; Fri, 31 May 2024 19:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25ECB4182D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25ECB4182D;
	Fri, 31 May 2024 19:40:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D4A771D56EF
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 19:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFF13408C8
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 19:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVYK16b5EQb8 for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 19:40:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB42840514
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB42840514
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB42840514
 for <buildroot@buildroot.org>; Fri, 31 May 2024 19:40:37 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2A1ECB00571;
 Fri, 31 May 2024 21:40:32 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 21:40:25 +0200
Message-ID: <20240531194025.122135-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717184434;
 bh=U9uJubQW1L4HuMu/f85sHL1PuCNdoJnjwXTnEutmYQs=;
 h=From:To:Cc:Subject:Date:From;
 b=e4QYWa2eLzMWLZ8f6dk6smof/rlZPOYo4271gKM8C4sKe9VvhiO3Hwabw0qmJZZ4j
 jHgbK6BR3GxFsj5D3dsMpM/+U9a9KQmy42Z0c0qDU3xIfTj16/RjVlHvNQRVN0cDUn
 S0p6ovAa+759eOCdqbO9YTVE0ILZZro/mdgOxB6uU37NN1YAKB1ZlYPFbzN2a9evt/
 v3k4ct16Lm3BdVb0UD4UjhFnjhA6G+VoUmm0SytrTCoPUZL1IokvcfjQCI+ofuqOG3
 3j9xLNy5wB6RTyXIi51KXxQnOo6uafFj6lyYuNu8S1SovudXgl92WgxCphvEad+6Qj
 4T12U3GCAiPLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e4QYWa2e
Subject: [Buildroot] [PATCH 1/1] package/octave: add optional {Graphics,
 Image}Magick++ support
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/octave/octave.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index a087961be97..6a21bef7b87 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -26,6 +26,16 @@ else
 OCTAVE_CONF_OPTS += --without-bz2
 endif
 
+ifeq ($(BR2_PACKAGE_GRAPHICSMAGICK),y)
+OCTAVE_CONF_OPTS += --with-magick=GraphicsMagick++
+OCTAVE_DEPENDENCIES += graphicsmagick
+else ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
+OCTAVE_CONF_OPTS += --with-magick=ImageMagick++
+OCTAVE_DEPENDENCIES += imagemagick
+else
+OCTAVE_CONF_OPTS += --without-magick
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 OCTAVE_CONF_OPTS += \
 	--enable-readline \
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
