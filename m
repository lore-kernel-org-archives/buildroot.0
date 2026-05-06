Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4BDCD3444
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29EB760F68;
	Wed,  6 May 2026 22:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYafvBQYxAif; Wed,  6 May 2026 22:33:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CDC4606CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106833;
	bh=xKjIME0yTxJF1P57Vsyg/G5zKUQ2NaZUbLLHeoPLSBI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=nIX/Ol0aKbHSeKqqkPFsNHYgl6vZkPxWWZFLoFgatPwUW7B/ezQ1+GvKl3UKh6CAV
	 SHE0ENrsTVzQra1tc8tSLkjkk1iTrCT4Hw1hlP0nhjF7aSMwyadsvSg2p2fTCeAQEu
	 SFm6c16VD29yk7/euQx87+S+ITBd28pS+jjbl+tP5PernWjegM29FiCb30Ie7NWfg/
	 rFiwUSav2nn7Sz/5KOinwXYkig6/IHXWzSYaTgyFIAOrzP/pqFiyNkA8kBQI4wKVVg
	 XPohqiYO8qpboba/s89Wm+y6Kv17WBshKe8FY7ffZQnEzR70DylH1dH6Zw9LAa0j8q
	 DuRDte9jzPtMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CDC4606CB;
	Wed,  6 May 2026 22:33:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74AFF280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66B29606CB
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POwuEDHUXXMA for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:33:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA3EA600CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA3EA600CC
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA3EA600CC
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:50 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-7de431da8fbso200934a34.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106829; x=1778711629;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2NxfMyWauzsXVmP1LFalOA0RatZwCoy9uf7E6Uxm+YU=;
 b=YRvvl6e+vCNjQLggDIwhGd6LnJrhp5wrFFI2kUb0gFRvnHb3tpslmD8fddFTFESpyl
 66sIFqCyNkwiwbFtDt5YM+oYh4uHcxdOMPq81RIsoFPna1rImpb0pIcsB92kvTzDHJum
 HKt1voZPWB2KR4bVm5nCAFXq332ZQ7kIeyhvIBTC9AI4yUGuUxb3hmuzf0YhW6T/4A5d
 05+8L0DYe4eUynVLkDegXxHyAnP1/ps7rC+Rm5MAxTfdN5MdrMrgzBvmPE79Z7J5i6Ai
 y8Llf3XSAxigkgm/YKcGdLa9U7CoUA4QOCFtutyHU0Zlhb8N/tiBAKiqaldRQrdLJnID
 hY8A==
X-Gm-Message-State: AOJu0YzuDQ9IJ0AFOy6wauI5FjKxhITe7cdUdXSTBSuGhu1TstgpAom2
 mdQuQrGx35cLUow3mA5q0UN++0EkXxckDwaiijh87ZAepmyKARMGsU0extxoXR7k
X-Gm-Gg: AeBDiesTwBS6IjnAMzLqeceuroEiTsis7JmBA18gG8tWPJT/WOqo7e7pg10ahgJqKmk
 rzAsdq2T4KiNRqktNMHglyk8nQF2W4s1LgY715vX8n6V95DXG49AZnPaoisUyuc/PPvWBXpZfqG
 o7sebT+MyQTs72GbimvOc9Q4YPMOdj1yx1JXpOrtZr8lSmeuwHsPqNIa2nHBu8Io7/wWl1K4Rep
 vvCRPfZ3nqQc8bFS2KR0DfwVUbJKC/Fzu5whML/+fIQBZvPed0q/mougBqfy0uU7DPdTm03p28A
 tVqwSgdM5rV4/nLN7XQ8jJjdENs1CwNcKpdlhqoMOj0oivDYOx5b78ocbNxqIamV6dtu9VRzlXX
 JTV/gI6br+o8Haww2i/ZgIHsgAE5kqAGwHSyfTWFgUSaZGSY0B/N4HZ03Caq1d7dd1TKJwB26Db
 t7yIquh0fo0dFjl8kO2g8DRx/7VQGTvzY236eAcUB7NYtKEfrOjL5xn+pBkTS4YaY8sf6V8Li3/
 rv3Y2DLlpix5Yb7WwG5VA2sIhHDMuJZzsECwTqxfHBs7XkO3urtK08FPT6Vugpgjmc2uVBcT6CJ
 5YEFM7A=
X-Received: by 2002:a05:6830:6005:b0:7dc:e2fc:53f5 with SMTP id
 46e09a7af769-7e1def3e755mr2931826a34.9.1778106829163; 
 Wed, 06 May 2026 15:33:49 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:33:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:02 -0600
Message-ID: <20260506223341.1759760-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106829; x=1778711629; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2NxfMyWauzsXVmP1LFalOA0RatZwCoy9uf7E6Uxm+YU=;
 b=dlIUkf8/t8Uo7qRs9fGQTuvYFt5aQIgpETmCLhAuZ9fC3Rf+GQxf+6nJ1AB/H1ee26
 83QC61XN4QRbWZQ3yyxBkX3sxTq3K9GeAkDpL8uYivXHXFKJv2dJPJbzCZrOYuNdeiNh
 Wsi91raJIck9iSvgKe6ttKYyjMtZRL5QV6MN+1iA9llU0H/EJgPIYxPQQ8QLI9fZpQde
 4b3sHhalhA0kSeN1Lp5N+ezWWYo4m3iHZDtD6ZcGIQHyQ8kAV+FRIXUV9ktoBUvepMVt
 1tysaC1PVzPdniUhG4wX1J4+BkkGZCSEM6dV9ETSnn4t4iONQiwKXZ2/ltWSqSbcFMw2
 HC5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=dlIUkf8/
Subject: [Buildroot] [PATCH 01/40] package/arptables: preserve /usr/sbin
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
 package/arptables/arptables.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/arptables/arptables.mk b/package/arptables/arptables.mk
index 320a33bb3c..ec65201c86 100644
--- a/package/arptables/arptables.mk
+++ b/package/arptables/arptables.mk
@@ -15,7 +15,7 @@ define ARPTABLES_BUILD_CMDS
 endef
 
 define ARPTABLES_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 -D $(@D)/arptables-legacy \
+	$(INSTALL) -m 755 $(@D)/arptables-legacy \
 		$(TARGET_DIR)/usr/sbin/arptables-legacy
 endef
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
