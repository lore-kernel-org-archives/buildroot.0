Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8346CCDB46C
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 16:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 115876FDAC;
	Sun, 21 Jun 2026 16:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pATPolysMbNg; Sun, 21 Jun 2026 16:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44BEC6FDAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782060407;
	bh=hqeHP41DPv6PqZiUCjbIl89IJronirnnllScHpxDSyU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fK5lbU86PfulyTBwLMXr7UN50bsO8TF4tbugqOl9+App13xkJgRzwnX/Tdt/lb9AH
	 +gDpta33Z1fWeWspAWT8be73H46Z4NmbKGRfP6CBeYLU93Z6zxFAMmrJcQXe04rAOa
	 1itUz/uLtTUUBP1GlIvAzsJr261xglDsrouAY+2ZYNJVy0x+mhBmceBvbEYTPoLp95
	 eDpRO9uylDEeGO9iqAK59P5n8G1z5mPCort5X6Y0nAF8gTADQ9J5JejHIHlpQP2ecS
	 VjEzKGBO+lsuJC44vhvEe/ySZwUgiXZzWw5BfWjeNpkZ+kaujw/fDxM4qkQJDLTL+D
	 7ZBUvwTIxh7iA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44BEC6FDAD;
	Sun, 21 Jun 2026 16:46:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B0C6D24D
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 16:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96FB8401E3
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 16:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDQ2THAdZkjX for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 16:46:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CB2AF4014E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB2AF4014E
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB2AF4014E
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 16:46:44 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4602e2a0372so2833028f8f.3
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 09:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782060403; x=1782665203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tjGitckbd1k9FOyy2bsFHqGt2eFf2sDuzr3lYIspnyE=;
 b=R19HPK9/JlxE5GqJnrob2K3f1gRReq402Ndi1UYslJYLt3y5eRdg5bm9Lxa5EU7Yln
 V+jpG5twlYsYuEU4JIxdAnSaIl3OHGEYf2a7WPfV8mZ6VP1HkTb3SHtu5Sc6t8XWFmWg
 aL/4bCAzjgQv3J6dhRcLXkQOlhhwOAymjmlIbsM/YwN9KdrH///Z1Qso3SJrXHP7d76C
 XCYk1pA+1tjTIRqRt/UlOHziH6K6ppZP5HRzKamhXKKp1mkVKJmSkw1IE5qObsHEKBtk
 AvsB9w++5aYTfO+XcQHJopUrP2ItMjILGyxKtuEoCdW9HDeTBO6L0OgOPagH8fSKH/wx
 fNcg==
X-Gm-Message-State: AOJu0YxfLEBtoUCyl2/pKNasHyzPseGPujX/htjzyj98FGHLNiM+viTY
 B3cYAhhoOaenyTrjdD8iOox46l1w7GDx6GKcDBlBDYOaiAMe+5BlYlEjwc27tCrpWhlYBVqXPx7
 TO3aL
X-Gm-Gg: AfdE7cn8hV7OR5/Ku4mWOpjj2RHzKkLx4yGjx73sIPUNn7GFB/Jd7Rz/JhrPairwATC
 1Y3IQUJzxxtbc0mZPMOCq8LmjlgGc+ReTMQ/eX+5H8tl3wBCKKbdY+KBi3Hmw1p+bQa19m0DhDv
 xBHlaMAy0GhNf7QXhC4b+MBjT1NDQNE8IuL1vA1e4qZ3ywUYK9vPiD1ecfjl/djEfqfsxagf+ZI
 R8+KHtlW3vAJt08Z/5Q9Kyf9LySyPVuZgtqqp/lsuNqFiDBifhB9fX5svNCaPudzgQu9trwz0Dc
 yB+qY8kGQ9DJeQA0zCYlpbW37+OytvEIO0GY3+MyaZG+5KoJkDg9KARuTHYJ+zV5Yttz1pVxzQ+
 ycBDnBncqkVNA89GzftWxIW+wSCjd0RJ92VYjxyT1gw2jaw6+1el7CSgEH+/NYj4eS0UT1bTu9X
 frMx6KvM/aPTTWs/XCxFQ9gN65gvVfcjYXmnD6NXbF1AyjKtbq0O40cPeaRAdzk78DiZfLwUMG4
 RT7ogWO2OqAFMs=
X-Received: by 2002:a05:6000:461e:b0:464:b8d7:e5d8 with SMTP id
 ffacd0b85a97d-4656c69b646mr16936382f8f.14.1782060402710; 
 Sun, 21 Jun 2026 09:46:42 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4666678828dsm18051329f8f.19.2026.06.21.09.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2026 09:46:42 -0700 (PDT)
To: buildroot@buildroot.org
Cc: ju.o@free.fr, dowan.gullient@smile.fr, Romain Naour <romain.naour@smile.fr>
Date: Sun, 21 Jun 2026 18:46:34 +0200
Message-ID: <20260621164634.2423931-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621164634.2423931-1-romain.naour@smile.fr>
References: <20260621164634.2423931-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782060403; x=1782665203; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tjGitckbd1k9FOyy2bsFHqGt2eFf2sDuzr3lYIspnyE=;
 b=T4Vwz26F0p7DvAYDZbzmIm0Jn6AjDrJzFb8Cjk7x1zk1CkuGDErmiJI+WTTJMnbHV8
 x+fJBlk+k2vWiTiisF5X6vNUlgDvFLzhAHgraEMkoq+/MJyurdgVKznxs8b3Ch6QwgXr
 WPZsneGSK0F2d3u5CZziypajuvgvT0deOC+2U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=T4Vwz26F
Subject: [Buildroot] [PATCH 3/3] support/testing: TestIptables: bump kernel
 to 6.18 LTS
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_iptables.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
index eeb4ccb5dd..a4c5e87d8d 100644
--- a/support/testing/tests/package/test_iptables.py
+++ b/support/testing/tests/package/test_iptables.py
@@ -15,7 +15,7 @@ class TestIptables(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.82"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
