Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79114CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 505AB83495;
	Wed,  6 May 2026 22:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLp7xEDovPMn; Wed,  6 May 2026 22:34:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8593B83415
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106862;
	bh=sZrp92sy4IGSM3CnAnurtTRaFHi/G19j/MwwzvFldtM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nDcbTnxR7RnViHC1vZ1uE+xbh1LjP12r9slq5izemwIy3IEWvPIe46ptIf2y6sFMc
	 ejlhV/vtBiqrHK496L203DId4crtGOLOPaO89kkTX/eKqwIfdKPoq/ok2X7Uu0P0Bs
	 3k57pWnVu3hcaY4kWnbczmz15dDrhfWmJcd2AEfrdUG5Z36BcqNSLmhGSgrAGZ88Kg
	 3KXuYCDL2ORYeffFSl+bsTGyKa2pSo1ol2sQcGnC1JprwKifAE9BCLv0VmPTC3xJX5
	 fxOmt/KrS2dfTp/SZVcWMQ68lMHv2bJj3gFq270TAmlVHGZ6mH562qnl0Lm2aVtgUS
	 3N55DwQj3gEzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8593B83415;
	Wed,  6 May 2026 22:34:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FF77280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5157F60FB9
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YW00vXgIWsY8 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D07F60FBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D07F60FBC
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D07F60FBC
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:17 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-7dcd689829eso204541a34.3
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106856; x=1778711656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/EO7yEfIzjYvIn+jJ1ssA9mqTMthE/Qs6WNy9k+/528=;
 b=RI1V0Z0gB1IQ668TVPaa/XkOmtN3SlE8g7CL4/xX843ZjCyqH44aLTEL+Ftc5uxxTh
 vExU7Rt4ahcByJuoEhYm8ndPVh/vrGDVd7XROOAKh1fZEB8X1WMDZ+DEkpceLFyZJdcJ
 IBhxSqWqjPDmxyfM48E2+522boI0cSAG02+QirVIZ/GtiKkRLKSoKRQrR1pDRe3pyg2h
 10M9jf/kGrWfyyCuecK7QH4n18hZ+QLAoxYb/ajIger7zwnxDBDivGoKAIkCuaETm5p2
 1U4x3O87/oP/djVz9sPTcu1NAD3YEw6bQTtn1SUZmPuDj9p/uycWKDwyAvDnprRC6G0P
 E2rQ==
X-Gm-Message-State: AOJu0YyhJ1PFtb/apCW8tog8Ju+UvpqNEI5+x7Y2gEMmLAAN7T9klv1G
 EuY123u9PY5Dc9ZVBxEMVI9xpjPjhhPw0aMkea7sV2eynxUUzF20anXW0Z1KlWxa
X-Gm-Gg: AeBDieu2BpzztEBdaqd62io2bjZqgBEl95eHAlkdCGbjYxE4bGB9s/jYGPJS45Nrnmf
 xWzto9zZQ5to6fxAImzebO4sIFcm/iRILQwBOGyCPprRA95dGq11apYft95oKO0oLZrYOydbSDW
 YnGzpTunlTBPczsxG9UxxrzmSGQdLwiG1KCCNWbFdBmzcOekHkmUW0q+lTun94eEFnHi4eOpb8y
 VwcHT55U/QKwQOC8RczWZcxyvjvcm7GBu3q2OE6uwZoLc+IXsU09dHjGYHNBz4f+bpjvHZ/xV4Y
 /24WqjAQ5zITqrIZVMWZxydkIdxn+DOReL1O7Q4p2Qnw2Z0py+J3pdXksVxgCFZ03Pcbr6KHiBf
 vqi1BxvXdKHw7fnp9DcRteLsxKURoLHlegO8AcFtjuzVio4ctN9pljftzVb7CeDy+vl/WzVoe3I
 MaKj/bmiIxEnzi1Q1rPSqxfxT/m0ByFiZQQ56NAPQirUgtT/caA8xMB6KVMw+YJx8SnlZuEED23
 SkaxIuMiXQAAmcsMRP2HmCzudv8FzKet9zg4G/TiM9V+5q648FragZAqplGREkNqxV7at9DwkiI
 5QvBVZg=
X-Received: by 2002:a05:6830:6a88:b0:7d7:d524:bc8a with SMTP id
 46e09a7af769-7e1def078b1mr2950647a34.9.1778106856178; 
 Wed, 06 May 2026 15:34:16 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:28 -0600
Message-ID: <20260506223341.1759760-27-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106856; x=1778711656; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/EO7yEfIzjYvIn+jJ1ssA9mqTMthE/Qs6WNy9k+/528=;
 b=Cr+Qw0+KrTn95k6ppX5lY2U578VWVfmD/ei/qlKU8u1WpAZL0gbth+fNZReJVZiZD8
 8mCyS3tZwqHN0yf6n1+fWrmqPGZntgcnSqeDf4rf3/0cKtHNJZrH6RYTr9hq96D36sl6
 C4eEjr07a1WsMOvPgH2LalhqJo569mQKPtcK5fEUGRUnuq4uwFruUDZaXVvCS7P9mFOO
 elY9AC1aaGN06ZdA56RJ1q36H43p5qCfvYf0JN/xYtwtLOQwI8De3IpK8wqtKx16Dqbd
 o7SznFLZhhVuC4CnbsFnWugfoRIEb0PvgCXObf7JJvVCsKaxAAG/DifyWaHfF+d3BCxi
 5YXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Cr+Qw0+K
Subject: [Buildroot] [PATCH 27/40] package/restorecond: preserve /usr/sbin
 symlink
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Brandon Maier <brandon.maier@collins.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>, Paul Cercueil <paul@crapouillou.net>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Doug Kehn <rdkehn@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With BR2_ROOTFS_MERGED_BIN=y, /usr/sbin is a symlink to bin.
Using install -D for files below $(TARGET_DIR)/usr/sbin can create
the parent directory path and replace that symlink with a real
directory.

With per-package directories, this can later make rsync fail when a
package target directory contains a non-empty usr/sbin directory and
the skeleton provides usr/sbin -> bin.

The skeleton dependency has already created /usr/sbin, either as a
directory or as the merged-bin symlink, so use plain install and let it
follow the existing path.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/restorecond/restorecond.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index e8f432c88d..eff88b3f0a 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -41,7 +41,7 @@ endef
 define RESTORECOND_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/restorecond.conf $(TARGET_DIR)/etc/selinux/restorecond.conf
 	$(INSTALL) -m 0644 -D $(@D)/restorecond_user.conf $(TARGET_DIR)/etc/selinux/restorecond_user.conf
-	$(INSTALL) -m 0755 -D $(@D)/restorecond $(TARGET_DIR)/usr/sbin/restorecond
+	$(INSTALL) -m 0755 $(@D)/restorecond $(TARGET_DIR)/usr/sbin/restorecond
 endef
 
 $(eval $(generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
