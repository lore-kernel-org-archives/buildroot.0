Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9224DCD343F
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 654284105D;
	Wed,  6 May 2026 22:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bh6A1VMLBXKD; Wed,  6 May 2026 22:34:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A10C40F45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106861;
	bh=TZpAs4VmLqMCjWNBTmDBNYvqK4KKYZHgVGlMlwb+rWM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kViK6iFTZM9ln1jmR/cjJ6gMb27F9KUMcGwisNGERWhCbWJkzGBWSFjQiGyXXVHRR
	 z1dVd1DK28/8t2eF9GAGqVrC6hTSciTpSyr6nEICTuY/Em5HqkIMtUuY2bj7LHmxBK
	 AYScIQLZxyrR51DqAHf5WuZg3844v0HEq9qlJ4+TQ7fZ/hzQuI4cNn/mz1qZuOOj+1
	 877Q1ZLk64pv3ZvZODNePuz4hI+Gun4K5o+qnE2W15rz91owa38C3Ba06OFd198od6
	 vt5030k9FoN4bU/lFFVjfYXMQ/IWjfcm+Z47oBmWDY5SWhCnwzXLgInImw0hWVo/k0
	 AL/iRcn1W2SMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A10C40F45;
	Wed,  6 May 2026 22:34:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12CA5280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D794083440
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JjDD_0DHk225 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C098C835B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C098C835B1
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C098C835B1
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:16 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-7dcdaf06498so158113a34.2
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106855; x=1778711655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DGuxHWc//uieRvMN6gvILj8NPLvFYY7A8cJCvrzzDsg=;
 b=qddtUgELKjlZqN97nA1AUk1NIIEssRV71/oXDVOmFYkjU0qzqb4k2IT6qIzP5/Jp6g
 ds3TFpWugY3MA4PxWR7VtXQYvQnlEOxxLwjQ/ecQvy8zosK5v1NMPH1SkNpdiWCOQIx5
 DlHsOYxO4okq0ClySs8H6kuHsIdF0+4Lt0EtuJXqygBlVC+tZ5FDT5tLZGjSLc/+AG0n
 wauofWuaZBAGNW+zX6vTlxyE+n6h3p6RYTkHT/KpLkX2zO5QfKv426jPwERy9Z8YrPof
 1ayj1jx5q0rAv3RLRdNrEi0LfBOwuJpEiI4zNsoI4iKtrgKis3i9njDrDU78wlq0vDZh
 0MXA==
X-Gm-Message-State: AOJu0YwQJEz+WF8Cv6yJpoU2xqEnGd1okBamdNVX3dLm85PcldnKDIPo
 oPzjGCYd2DJ/wxDUstb4ZqbPQ9fuDAnisdWpDWLPcbIJd64MJ9Q6YTBxifS+Gley
X-Gm-Gg: AeBDievjAKjkTtFK0Zw1iS2WGrqvHVK50HNDGJJWDXPcdiaGVuJYDQfGOLbQZpNne4K
 G2yC+RBNP0mbZ3wbHZ+KjDZ8G+H0bLwvJZ/deEPA/2a1KbwZ8UUBBhTpPx2p0o1J0WZwZ1317s/
 qX9HZN0RTM5rb2xOyCPO+eehQGtxc2+aIkTbCM1sw+EmTWmvSNJipr8N6QES0ADV0m5G6bLuhGj
 mmug8coecYS66Bfyn4+mAxonoVh4SDELLLqu3kWh3pZ/44jw2C1RaPEMqpw/D2pJ66xuZeHr14z
 Y57iDQeCgthJuWoGz8HQcqx3WvoWTUypTeMaUnCk26P2wrB8lGzbk4AnsLk5dEYJvb1qk+b/EHr
 9LGPnz3dpXz6a36TKg9B5X0CU4EkH6CVVC9EZTQMX9BXhYwf4t+YjxPnlyrRug298RZnmgE2CcW
 IgHEYMp4DtdbKUgqIK1iVk5MDLa48/AERcKBspo2VYm8VTsUQNJhkEfuvdI8M3nKd7sBm9HP70T
 qxRlEERLycWhWZ5bbAsWTfvjNXaZcbJTMxWRrDf/2iMfjmF6ka6P4n2Pkk3j5y//CdjtBfU8oh1
 OAUFj8g=
X-Received: by 2002:a05:6830:921:b0:7d7:d615:3040 with SMTP id
 46e09a7af769-7e1defe8469mr2883429a34.17.1778106855209; 
 Wed, 06 May 2026 15:34:15 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:27 -0600
Message-ID: <20260506223341.1759760-26-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106855; x=1778711655; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DGuxHWc//uieRvMN6gvILj8NPLvFYY7A8cJCvrzzDsg=;
 b=Dsxh7aiQ6Gjg3zPQlEvZynvtE8vJc0wpmywlo6+XAi7TwP7lMX6jt1Qv+OdD0Od/wT
 d9cQBJX/AoyfnS2Ki4X2XAuWkRSz18pz8dQdMKCBK7WReab2xdxFsIq0YSLEGq686ZpZ
 TNJoYaqJPROglPhXJhNmhjFuOZc5HaKJaedZl/DD3cjTusiJA8B2BVmMNpN4Yym7UkEZ
 11NyhMgIGKsy3HCrx4ft1ZniMQ7ZVZeshz24eWsm6m4VzV67cMgsqXultJIEA72gDtTD
 Twp3VFmwu+uiNSTqTE+swb9Z2oZNz7O50Fj9ffjBsR0+j665Zlgdn7icACuK8donQQOX
 0Kgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Dsxh7aiQ
Subject: [Buildroot] [PATCH 26/40] package/ptpd: preserve /usr/sbin symlink
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
 package/ptpd/ptpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ptpd/ptpd.mk b/package/ptpd/ptpd.mk
index 49587231e0..3ce994569a 100644
--- a/package/ptpd/ptpd.mk
+++ b/package/ptpd/ptpd.mk
@@ -14,7 +14,7 @@ define PTPD_BUILD_CMDS
 endef
 
 define PTPD_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 -D $(@D)/src/ptpd $(TARGET_DIR)/usr/sbin/ptpd
+	$(INSTALL) -m 755 $(@D)/src/ptpd $(TARGET_DIR)/usr/sbin/ptpd
 endef
 
 define PTPD_INSTALL_INIT_SYSV
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
