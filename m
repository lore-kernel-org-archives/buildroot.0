Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195B2CD343F
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E774A833CD;
	Wed,  6 May 2026 22:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LC3ueTViZku7; Wed,  6 May 2026 22:34:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C2C583415
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106840;
	bh=fnWpG9r0HV2bjf84jxHKYmIXoEwU8olKShVISBceyHU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=V5kBJsP3tLU/FVnAV+8b6Jui+tphu658jZCdxywmtQunuqg7wk1dKfC6cAmY6dGRO
	 UO7X+svTkQwyaz8eLS6QSHk3GkTSPFa9NreRAzvNN7Y9ancAXhE1gBqctlkizNgLhs
	 B6NHN0G8cvojUFzbvBCAUPz/OQ3D2xP84kcWVZRmkLtM5vID0BzRc5bSvB3ELGYtTQ
	 kXP1w+OieVf3rGRxC1I9cliA48WSdIyr727pxdWpLvwz+1fPMY28l/57JmkExTw1Gj
	 G++V25o+NtX4EEXyPuthYiKxXZrPvCyh0Gd/1sGyntCKjTf8OCerE3zMrhgQLVKxW7
	 iecVHM8FN+PEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C2C583415;
	Wed,  6 May 2026 22:34:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E6F7280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D53760F56
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FisnjzB166cW for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:33:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D51E60F6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D51E60F6B
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D51E60F6B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:55 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-7dea1272943so154244a34.0
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106834; x=1778711634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SVjEFeLDu+xzsJwbe34AMJVedfQRblQVoUUIBCPMOcg=;
 b=aAGKibcxTPwKYfvYoly22pG74/JRJglSZL5o7THZxQgAEkPFuFXZq//JBrtoCxS7ly
 3v6DbgkNwLT83GVNIFRQATtZ/4LGNL9FtuxNvm2XB18M7/Pczi7yy1G65xc6QstwPEDl
 YE4bIYAxP2gUz7E2PYGVkIFNO4J28V22phMn6ww2QSkR3tipTOLVr3oun8ZcwsUft6Id
 F9zbzmedMF2uQJtY09J3J9mTZUYJSEFI1fnPGVnRW9x5yAcEsnGILSzKYiA8RNJd3IxX
 D07K3qpwtJrwF3imn8jM6zzOFZmP/1CHKQHx4Xbbtk0JCGcMLwsu+nlD6pbILOCGxfB0
 OBew==
X-Gm-Message-State: AOJu0YyM0EthnEsUegNZlDkmYKE7kwnRgmQUdg4ZpRFNulmNAKwJHmns
 men70EFoA1nM+8t1Gew7mD4Ul18j5oer8inUoummSObSF4Jo9tjaypJIwf+O5XCK
X-Gm-Gg: AeBDieu4b2FK0viIbTVhpB8rA0ZC7fTzWbEdA/PENc0vaiN72v/u6rSGarlV7pY1LBy
 AJSs3/Kps+z4SzlX+lrrPVwcf8reKfLmR6iXUd0ZU+IsUZxYmy+TotamFCpvW7Xfqq5G4CSFoqX
 pE0k6SEwSZpcu+7sRo/VNEkDEaPbv76C/PP39VlAB2DKkmvoDjPSOE2NJe4RC+hdxo7vY82WNQI
 2oy/GurFFRnfDPpO9zwY04oJ7hlYwGXUCGD2qA7AfW3F2v9lppbuLuR9eizL6M6JEJDZEXLB/m/
 oldeTgS+P60IdNp8fDmVz2sFDP54Vonida6hl2ysUOk1CKk6ox73plavCb/XbkMru40vIwkk3wN
 21M3bkcz/VwQCJOJSZFCMwEFdpOf9JI3McrKEQWTEk2qmPg26JjWvY2Wtlw8ny4POdIWH0W9Q5X
 S0fKdj8N5HegvWON0fu/JFhKtnq2giZSV4Dm7TJwjckIVK4kKyw8K9diDGRdPrNpPHy/4vQ78W8
 5zsrbLU1hcUJLgKAcElvK2vXohcUHC5ZJGJLU27WM0FZFQG+zJvzlj+wW9k5FL/0YTZPvVGrKIl
 qzrTR00=
X-Received: by 2002:a05:6830:380e:b0:7dc:d0e3:5bdd with SMTP id
 46e09a7af769-7e1df035960mr3150071a34.19.1778106834131; 
 Wed, 06 May 2026 15:33:54 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:33:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:07 -0600
Message-ID: <20260506223341.1759760-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106834; x=1778711634; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SVjEFeLDu+xzsJwbe34AMJVedfQRblQVoUUIBCPMOcg=;
 b=apcz7N4XIlcfvZNr8H+1PQbwxw9AdjLGrPtQ22xfOZD94O+sr7vFl/GN1AJruMMYZB
 gEBOWjRi3cHQVJWEhuls2xM7vuiD29i+cRjF76d+rvMbK4zpAXMRlCcm9GsWqMP/syuG
 JZU0PxNiMPUvrhZkntZ8sXIklBnNf9c0GKMqmhKkuWM5yKuHbpH3b+mDl7k77v1aV+Gi
 YAu7THyvP89bWKC6Es5GxptfY2xGPBqjOKMPaqBG+edN6pGvmDBxIyxU3l6ypvI7wR7c
 NbcUc4Q+si8kDsWR1yJy67YmpWLPkmDCgQ1FYiK5wdKdfw/pilC4A7C9U454pIPBwdOt
 zJ8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=apcz7N4X
Subject: [Buildroot] [PATCH 06/40] package/ebtables: preserve /usr/sbin
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
 package/ebtables/ebtables.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 09a9f4ba7d..42edfde557 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -13,7 +13,7 @@ EBTABLES_SELINUX_MODULES = iptables
 
 ifeq ($(BR2_PACKAGE_EBTABLES_UTILS_SAVE),y)
 define EBTABLES_INSTALL_TARGET_UTILS_SAVE
-	$(INSTALL) -m 0755 -D $(@D)/ebtables-save.sh $(TARGET_DIR)/usr/sbin/ebtables-legacy-save
+	$(INSTALL) -m 0755 $(@D)/ebtables-save.sh $(TARGET_DIR)/usr/sbin/ebtables-legacy-save
 endef
 EBTABLES_POST_INSTALL_TARGET_HOOKS += EBTABLES_INSTALL_TARGET_UTILS_SAVE
 else
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
