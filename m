Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC42ACD343F
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3BD3410AE;
	Wed,  6 May 2026 22:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zLXfFAYmsoO; Wed,  6 May 2026 22:34:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 303FB41070
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106873;
	bh=AWoHymwsn2xDrK5TlZTdiF5IWUF3s1qSttzZDR8T/2M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YOu5uYD49FLdr71aszzaFS1skHlZStTOQrlMGMc09W74mocymsktEWf9PKpUfPnO8
	 X9LIFH0pW3k+7g33kYAau/wvVgPuJ7yAO5dvQ5FcAdcv4u36TZLgJOh2gvzZ8rWOn+
	 YmTQPDacOcB8wpyGhxPMCv2iAHsPkrJn9JTAuHoHGkJtVdnRB5UCr3drJpTznR35Cy
	 x2MAKWnFqY10R+UTfzmUIdCjiS8DwSD5KWk9VCVbQgmPRCCcUIWRdxuOO8agXz3nfK
	 CIOMM2xzuuXzifSHR1qNulgA9M5oOH9J89OruLeTP2KnW61EuqfMfMco3OphStj00P
	 HWFPNNr9ESTEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 303FB41070;
	Wed,  6 May 2026 22:34:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 771E0317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6974960FE1
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5HrvXitnQbE for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 918D660FCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 918D660FCB
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 918D660FCB
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:26 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-479e4835e26so89598b6e.3
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106865; x=1778711665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QDl2SC1+2/aKitK+BrXex3M6Tem1Fb0fBbtBs8kbRpM=;
 b=krLIEbVUjieYA9mS8qbWA5SrJV4PaL759FNQ50TV2R9tFLxaYW5WFVwSx+gtuzxxk9
 Oy3CIC0/sxONbY6odxDQUa4cTAirwKSF8h6bQpHGs57VyC7oLxpQUgWJf1YlXMl3vWTQ
 LrNer0a4aX3Qv5lz3Ny2ePs99Cc3lZsAx5YoliYC+OBrnlpx1Oh5nV17xLokuifnMzAJ
 UrNsR3fi2gISDWayT7RcH4tI3/O03jNiB0R4jEHrSOzZh548WQqoOjRXMM/KNV+JYt6a
 21dAuSd/xUm5tUh1lDOLlADxMfkVhTXMBfU75ZbLA659YcfvqWLMUIElJPBTFupRhy51
 QYrw==
X-Gm-Message-State: AOJu0YyuQXNAQ3knd8jGdj62ZlAReVOiuCpJsNF3TQhdnyXel8ExWABB
 7OVvGdNXXRA47i7GivNsaHLo5zZQmCTvKuDpCwaVEaVIxgunlA4n/0DRw8QzBIe5
X-Gm-Gg: AeBDiesGxC7kOJrSCRk281mu7iR2JVqO7fvD6KgEiErrFfWqfz6ErVtKL6dia2X9+mU
 DuFSfCXhlB9st7heOXVgAExVlIJdgVCw41LiHAF8N8PadidqMiBFjtgj2HxtC18fky4NVBgvWIo
 2zsmzgLXNMNTYPP4Y90SpsMay3+QG3u0Tb0FYjtm2yb3Es6yvcNvb52L4M4aDATUWvKe+b0bRP2
 a8gQfxBcgdg0FKy+Gbmhz+BrfsdBNatXkxfH/qpDpbgDQjix66FSUpQQtzwHQ9BasydFg8vg52i
 N66Qgvv8VZUbxgDjsvNpClp7Bi66CB68VN97GvRSXe5Enf0kj63GIizvh3728P7uA7n110C8Wpr
 5H6JOOTcKNVj40wdMCzAsIBj0fkVNenXdF0xWs6TT3YexEAkoVY8jcTJac/OpCgqjVx0S1/bADe
 8ZPHLeSjP6VC7AqgFGMBw8GCWK2aU2vOmRKcnawPPUn6HBaH8ja1TOuuwnz4E8P0EjYl8B/ZXT0
 ULy3pKl+Yxqpb0wTsDHcUeODx0f4xi2uFWrt+x9DfYgM27Yw2vmh2oSAZg9lRy7jC+4cyzro62D
 3pzzeCE=
X-Received: by 2002:a05:6808:d52:b0:467:1941:1f18 with SMTP id
 5614622812f47-48042225d5amr3232910b6e.14.1778106865179; 
 Wed, 06 May 2026 15:34:25 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:37 -0600
Message-ID: <20260506223341.1759760-36-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106865; x=1778711665; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QDl2SC1+2/aKitK+BrXex3M6Tem1Fb0fBbtBs8kbRpM=;
 b=L5u/kYf+MCnRvF81h/xoMVzaqRyI5EhS5vXn9zvGJGhPGbKfsPFc2Kh9ZqYvs+ZK6g
 Yw/eMZh+a0uL0H00t/wtwnhQD8cCdNq7gZ9Wn3yDytjeZSDchRqtnPdFbgKRBKJSVvai
 y3WVvs5tsV40QlfMgFc+V4aRFBGmBWF8AoHH+0utKFtHZHhArXDqaJnc60rRa1aifbQ0
 xWRo/ps/aGdPihIU4Sz8nM/LpKP5HLUsVeIZdaSgz9ZPpDR6jaV2EiI5a5i/7jtmYR5S
 DbFgS9EnsipeQNot6GcWGaak/FxS6/FN0ATf5EY3+Nbe9VUCi91t8FZbvlthiyXVbqWr
 HIsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=L5u/kYf+
Subject: [Buildroot] [PATCH 36/40] package/udpcast: preserve /usr/sbin
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
 package/udpcast/udpcast.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index e087f2dbb2..1393e21fbd 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -16,7 +16,7 @@ UDPCAST_MAKE_OPTS = $(UDPCAST_TARGETS)
 
 define UDPCAST_INSTALL_TARGET_CMDS
 	$(foreach f,$(UDPCAST_TARGETS),\
-		$(INSTALL) -D -m 755 $(@D)/$(f) $(TARGET_DIR)/usr/sbin/$(f)
+		$(INSTALL) -m 755 $(@D)/$(f) $(TARGET_DIR)/usr/sbin/$(f)
 	)
 endef
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
