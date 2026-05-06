Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF54CD343F
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 787DC4106E;
	Wed,  6 May 2026 22:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OS29fmALHLkQ; Wed,  6 May 2026 22:34:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 412FD4109F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106870;
	bh=c4DtQp4bkMhTJsDgjo99XVCofCNlIqLKLGYC2XS+HOI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Vvody7lw95Uct0oyB9R+tTaZUn3iVE1YKMSNeZo4GzuArDvbfajhdyBuHlEGdbqbZ
	 MvWX+5wsVxu5/VtRIcqsRqeGmtgYUVJtEmIyDrT+6eRgM8umG18vzSJtxqkj2WnvgU
	 KzePPhl5eb4fbLsOBPHR2Cg3EE5xBqCSrxJMY/PMNzUKFPmAv7U4tjb9C32AFdCYRW
	 Px0PQdqy1hKTOJDkJoyx4A9GFH2x8S8/Ls3UFiUS2sSLeL/kW9lcyhBRjLoE3vLRzP
	 5c1C4B3913c1prIq5LuBvhgpjxYj/wJ/Rpb3ObqKyCwy7lXixxXvTXXCXQu6eR929h
	 P+DdI/DIJiclg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 412FD4109F;
	Wed,  6 May 2026 22:34:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BB05280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B8BB60FBD
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id db8Wnz_pizGt for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72A6260FBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72A6260FBA
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72A6260FBA
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:23 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7d55b97f358so147035a34.3
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106862; x=1778711662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PB/dzrTFshUMpKtaMJMpq8LAS2bzs735SsNI45Ov1x4=;
 b=Xa/9wZvFCr6HFG/bBYM2AUB7MXjLsPyFxjmspAIa3HPwmvXfIxYPcBC3wW20tX3W90
 Ufau6rELR5FErTltCTPDPuFkyFUYU6ZU+wi8zDSxjp7z6swba2hCwV+faGopjRT5HTv0
 IcebL2mhmLbc+v7a17xubdj1MbJbdhIkupnzcEZxwqIRn/XPi2yatisEGEhD+LVqREvx
 7hvAIUNFMJXzPgTIzGHp94Y5268Cve/gmWD6EGuWhGv2hKmloERiBEhzaHHCADZK45eW
 94UbjDAmGBiH+ogHNhS8XK+CAsZ5wLytkSESYuBovpCdHGbErzQaM6MRs86btjW2o7LD
 wCuQ==
X-Gm-Message-State: AOJu0Yw8+1CvedefFBlnf0+zTP0hSqXfRtaMeuG/y2HfvB2Y6awu+wWF
 BLSfXf0QVsCPHEUtXEXhg9hrEXvnmPsUm+N4IVtYyKWtjDx4lM8QblFKEL8+HRkC
X-Gm-Gg: AeBDiesPtg3aD8Z8PP6emS9KfSBQYacsrLKVrfWcrlsEtzLO0/VCjjvXyP+7V48SEPF
 gAxswcfst3rgoyvCPuqw71eNig79JljX0FvOMsyjImZZ8+ZUJCoBr9Xr6PGZOJMIAC6pHmegCDI
 go+cqMUB8IjNJ16NkKSmO90znGcgq1HrzbIKKBgkqJ88HC9Iv0dJ/YTcSGuVZ+WaOniDcVRZA/1
 ow0NpjD7O6U6qYF5XWuhRklzc2bIU8pD9QQMNMjCjHY1SuohJDi3E5GTmUdHatBmfACYdXmTTfC
 jtQY5XaDSBMo3tYHGTtE73EqcvAmZK6IBSB68hKIprRF1O5D42cpeNDb5oArc2mpewDJyF85Fm8
 Qq77SdfcnPmbkm/Clgxs8VbzTZeqj6emMqUxZH6kj0wIeylxMdEFtZTlJOOjb+Cj/M2tYZIoSPh
 ++ea0ZdZ3l7VU0dt63npD3L4VKZSdmIqILKBpYMDyKC79IxINT4WyKE/NQUpkea1UDjdX4pGkyc
 04I44MWY3MMUceDTizbipQ7ofUrdOn3X36Wp3byc0wOKPz2CpbgpKDlWj1nX8L1N26NL/pCrpYo
 Aoriaec=
X-Received: by 2002:a05:6830:2704:b0:7d7:f13a:761c with SMTP id
 46e09a7af769-7e1df15829emr2537896a34.23.1778106862181; 
 Wed, 06 May 2026 15:34:22 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:34 -0600
Message-ID: <20260506223341.1759760-33-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106862; x=1778711662; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PB/dzrTFshUMpKtaMJMpq8LAS2bzs735SsNI45Ov1x4=;
 b=rMuslFzeAJTRn8nUWB5UKkhlNJU+zpfIMbcgzP7brcT1DBrKDS1+rLql44yAC8MwUW
 Qm1VInp8/8izLVC+ud65hop2k9ohUuMo9689KahEFM75CxDb8Y5IAvC6JssufHGvUWZV
 FYr+N/kecEpZkX4gF+L9jFyfFj7jnY+I8pLVPzb2MvySJ8fTaZqS6YEMhAhC/3AAbRo3
 71xylh8qFepZ9wbAPwRxTYqdT55/4uETQnQZWgGKg0e6FwezUSlUNmjOqhpB+hxeDJOa
 DjyHMC5pMbRJS3h7GCwQcWxCN64ChHBv3mPez1F20MaizbRBBohgindT9JSYcOHU7WlG
 zcmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=rMuslFze
Subject: [Buildroot] [PATCH 33/40] package/triggerhappy: preserve /usr/sbin
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
 package/triggerhappy/triggerhappy.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/triggerhappy/triggerhappy.mk b/package/triggerhappy/triggerhappy.mk
index bb30e7ce1d..20ac812661 100644
--- a/package/triggerhappy/triggerhappy.mk
+++ b/package/triggerhappy/triggerhappy.mk
@@ -29,8 +29,8 @@ endif
 
 define TRIGGERHAPPY_INSTALL_TARGET_CMDS
 	$(INSTALL) -d $(TARGET_DIR)/etc/triggerhappy/triggers.d
-	$(INSTALL) -D -m 0755 $(@D)/thd $(TARGET_DIR)/usr/sbin/thd
-	$(INSTALL) -D -m 0755 $(@D)/th-cmd $(TARGET_DIR)/usr/sbin/th-cmd
+	$(INSTALL) -m 0755 $(@D)/thd $(TARGET_DIR)/usr/sbin/thd
+	$(INSTALL) -m 0755 $(@D)/th-cmd $(TARGET_DIR)/usr/sbin/th-cmd
 	$(TRIGGERHAPPY_INSTALL_UDEV_RULE)
 endef
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
