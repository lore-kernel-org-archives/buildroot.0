Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46888C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 06:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1DA040275;
	Mon, 29 Nov 2021 06:23:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lSDrgF_mSdnM; Mon, 29 Nov 2021 06:23:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D186C40146;
	Mon, 29 Nov 2021 06:23:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E359F1BF405
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 06:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D364D4019F
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 06:23:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6soKKvL6Ee4 for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 06:23:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 380F4400F0
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 06:23:18 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso15895477wms.2
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 22:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4fiAU5qBjpNag8O5EDwkiYfA+E5i0BqBAcQgkKsAWF8=;
 b=cbCYviPTkfgc41G5OYe1qbgyEoW2ADUFKKKltWpoF1hGP2elm1lgzsKRCmLZAuSNKH
 6qenPbHRvlsTcU/8WG+d5brqW/9hC8ygLuj26IzMF4fH2ljQ3HDE9jFEDZINZMGYU6R3
 8NXlzr7BvpXqxfcngVG+pS3m9eyjQ71nr0dRWey1XJC76GeX8TUx0Ym1EPGDDepBqtk8
 Ff+f/C9T8G9fFqloauwX3LXd2YDKw6NfdtWAAxKsaW6wFDlMM3qX3jdptJPEQLWtuYW3
 5CQH/jHrsytdURMSHNWqi9xSWKZ9tKMUxVIDw9uNd+prNV8eRIZ2A6AUVsdDaGXqnaRz
 BNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4fiAU5qBjpNag8O5EDwkiYfA+E5i0BqBAcQgkKsAWF8=;
 b=aZW1gnXLQiFo/FGISx4jlFb+DdK1MHaWZ3mirQFuXIB6+A5heVORRVXE2SFEyE43Ns
 lQZaZjdx9BWvup0w1MYOZ3SQ4c85MyotJnc/MoQ3/OFyT3I2p++Jy8fWK6lsTBt9Bbxq
 VyxaJpes3QgBk3GGaWc2QokXR4pS4VhbwDHc0T4///VXjUw6R2n8KWAYQk2n5OE77LDb
 IJ6k47QyrdgXCzkBLn8nuB1Pvy0szzPpKjBpqZ1+jg7EYJF2ScyKIt68Oof4e+xH5+De
 JQAcPgR8gyuXSqGyLWjBdeG2M3h6S0fYSSYWnNst4ryb4R4HJleuPzLLUhssBrRGzLeb
 upOw==
X-Gm-Message-State: AOAM532UUuiuof+VYbUjBq2EVwo0+HIiIHYoCPBa/5jduQrpXMaVBmsi
 TRIwjWrNYyTMWGdHW6mN8GnrrTncJk8=
X-Google-Smtp-Source: ABdhPJzoGkcISjrl3i+g+I3MuNoE/4kDC1avHQpAzwmU6/DHGjk4kuoGqKpRv6pWcahQ8mhEUY6FMw==
X-Received: by 2002:a1c:ac46:: with SMTP id v67mr34223952wme.182.1638166996112; 
 Sun, 28 Nov 2021 22:23:16 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id p12sm15488094wrr.10.2021.11.28.22.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 22:23:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 07:20:43 +0100
Message-Id: <20211129062043.2173567-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wireless-regdb: drop spurious space
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
Cc: Dimitrios Siganos <dimitris@siganos.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
71dc107d41e5daf45e0955740b302367313aa23f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireless-regdb/wireless-regdb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 0db8c6f345..9e01283c01 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -12,7 +12,7 @@ WIRELESS_REGDB_LICENSE_FILES = LICENSE
 WIRELESS_REGDB_CPE_ID_VENDOR = kernel
 
 ifeq ($(BR2_PACKAGE_CRDA),y)
-define  WIRELESS_REGDB_INSTALL_CRDA_TARGET_CMDS
+define WIRELESS_REGDB_INSTALL_CRDA_TARGET_CMDS
 	$(INSTALL) -m 644 -D -T $(@D)/regulatory.bin \
 		$(TARGET_DIR)/usr/lib/crda/regulatory.bin
 	$(INSTALL) -m 644 -D -T $(@D)/sforshee.key.pub.pem \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
