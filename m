Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484C3C4332F
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 22:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A82C980FAB;
	Fri, 11 Nov 2022 22:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A82C980FAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dUSrNheSMjRN; Fri, 11 Nov 2022 22:40:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE8FB80D04;
	Fri, 11 Nov 2022 22:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE8FB80D04
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 90B8B1BF290
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 716E241878
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 716E241878
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gAp12rB7vRk8 for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 22:40:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F28C541877
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F28C541877
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 22:40:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 8F37A1BF203;
 Fri, 11 Nov 2022 22:40:15 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>,
 Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 11 Nov 2022 23:40:10 +0100
Message-Id: <20221111224011.430289-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668206415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=AUE7CdrPml0xRi01nmo8wmwWNd/BIL5YOzz0GqUxMDU=;
 b=WkT6Ta+tllj6nSXhlJz+GXMbo/eCicLi/K9wr3X+ml8h3gvd/kKuRYMrviJHqgdokQpnqz
 Z/i9MRzRN1XFQqz7lN2vqrSrr3uML8Vp+gwtmtIFn1yQkqsYvZVkEYNmOdin+VpTrboyu5
 kx5+BsPId5lRj6ohwB51z/YZiXCtyNx6tdwrGJkKTnSBYL4UVOm6pHtQM5bhsd9wLAGri1
 HVavYzMEHCVvZis/PlS0yS5QLORg/oZxC6l/EcDauikKqp3tE6YgGFognOsPmUl0cL5TKs
 EbJbvMZH/y/x43HWzJciZyG2IN+yHUSmT0phe5D4/e4vc5orPuaAyfvZZP096Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WkT6Ta+t
Subject: [Buildroot] [PATCH] package/imagemagick: utilities now need C++
 support
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since upstream commit
https://github.com/ImageMagick/ImageMagick/commit/07f3b487f9860fd4eb9422f1a906d0fe83b6fd1c
(which first appeared in version 7.1.0-47), ImageMagick forces the
need of a C++ compiler to build its utilities. Despite the request of
Bernd Kuhls to revert this change, upstream declined.

Since this change is causing build failures in our autobuilders, our
only choice is to follow the choice of upstream, and disable building
the utilities when C++ support is not available.

Fixes:

  http://autobuild.buildroot.net/results/4283235d697408cf2e70be5e3769dbe6ebb9ddae/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imagemagick/imagemagick.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 6bdf24c1e8..8a2ec460d5 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -178,6 +178,12 @@ else
 IMAGEMAGICK_CONF_OPTS += --without-bzlib
 endif
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+IMAGEMAGICK_CONF_OPTS += --with-utilities
+else
+IMAGEMAGICK_CONF_OPTS += --without-utilities
+endif
+
 HOST_IMAGEMAGICK_CONF_OPTS = \
 	--disable-opencl \
 	--disable-openmp \
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
