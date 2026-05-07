Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487ABCD343B
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 08:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBF3B4065F;
	Thu,  7 May 2026 08:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpL6ERb_NUHz; Thu,  7 May 2026 08:14:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24438408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778141677;
	bh=YC5YuKRPopV3ceGYoRi53DR8o76EG5TAPTvYjxwJyf0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QQohiniOqE5lwIC7OMZ/H9nLBmmVT9dCi1M8IGRiB+ufdVdNkafso3sABE9s20455
	 CATueIWEWNjLS6hGNIyG9c3f+kyu3+GCkuLTS9Qm03+z2QvPlxXeUDet5dOKFXP8s+
	 bQxiG5ig4wWUVpM+Pf3VwZYpXZ2+YFFJXgMW4yrA0a93dIc3P6yKnwz/o3pwzHndww
	 vi7HSahaXn71oVesuP1+v7nenm38SBzDa1BqJOwFlCXKoMauGc7CYb59TnlFbu9AUS
	 aCMosQNzshCcO09Qo+g8B38Gln2WT7i8c9pmjV8jnsq+RLcPIxdbtZ+NXCs5Im0bJU
	 Sr1EEDIm6E9QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24438408B2;
	Thu,  7 May 2026 08:14:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CC4411B
 for <buildroot@buildroot.org>; Thu,  7 May 2026 08:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 926D040D47
 for <buildroot@buildroot.org>; Thu,  7 May 2026 08:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKqsclTo8rHs for <buildroot@buildroot.org>;
 Thu,  7 May 2026 08:14:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9BE1A409DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BE1A409DB
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BE1A409DB
 for <buildroot@buildroot.org>; Thu,  7 May 2026 08:14:27 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-bb962ce4dcfso81550366b.1
 for <buildroot@buildroot.org>; Thu, 07 May 2026 01:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778141665; x=1778746465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Nja0tk1GVUaRszXxWqHTeEt8mJbfG9UwFOxiLKoaqk=;
 b=SDOWeeJzKlArX0GylsV1vxuCJxdUP5vqfrC/1shunPgzdWU+lhoh22DBuie2X0dc1Q
 xCGE6XTFYny274nEDfaOS5LUZ/NBKs/yFxSBmHDKmQguQIRwwOaqZVyABQaCqq4an2Pb
 Xtny52I5I08zzDI58L6oZayGPp611VF8mEVVlPBh+BQEfJDfTN0sKehcDNz21dejOoM/
 CN9sgQoZqmUz3Dsu74NzblTxQpef6VKeLmqpEsUMn61n1nQQzvzgHA/dLZ/k32eRHwZq
 kR+x2BDPFuficgW5Pam6zmLqE+mp3LQAdeLifyf9D+n/bFF5kEmpAqSh1LT3XTfi0lRz
 u+7g==
X-Gm-Message-State: AOJu0YxOkNhbpNqJf779vjoIw4bo6wSva04WlbclbF2Vz5OC8Uw3V13Z
 o8H5k6yjAJa7Tk6LCdWUVH08WKf52GGhnqhVnobsjOWuHZRKYKz+4zbUew2k
X-Gm-Gg: AeBDietg8+LZuLUzfqVqfr3ZcPKc++Yk1M6uHvtHdtlebidyawk/NYgdpPE8r0m6ynt
 SCp7fF3GxCmWD8y20ZPFTbT0Ec/mbKSrgEDsZYxJiRyd0423FCJ+Eo8htd43XHd+8tLLw3hxgXZ
 oTsCXl28I33wrnJ2jh9M75PsHSFNLD836aHh93C5GdZNIWzZ3l8bSOP7RMxdYa2fG7tcqIVA+V5
 tzVsMFX947udzutH1s5eEB+RY4VXrMPNBYw+YRTSrioN3yfgv+23E+0WwU6BzEM+w7Q+hxHnbWf
 Xm+XXNiEKhImPrlZjshlc9ULQUAuYSmgZyt7Ceh6Yjih/E6P/J7JiM44NZMCknR+/S39zJ8rDpH
 ttapEdBhEODRa6bej9XbI5YRYwkhtzpGaimN6NptPNbmmHVq5KML7aryMGqIkdIb4I1UjIBvvXo
 7/emegoT4lPN9vHCHv1QJbUEdurGTLSL4hpGvyhIbs71DSLHFD
X-Received: by 2002:a17:906:208f:b0:bc5:cff4:8e20 with SMTP id
 a640c23a62f3a-bc5cff4afa7mr226937166b.27.1778141665073; 
 Thu, 07 May 2026 01:14:25 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc81d5e95d5sm53886466b.14.2026.05.07.01.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 01:14:24 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Thu,  7 May 2026 10:14:05 +0200
Message-ID: <20260507081420.720773-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778141665; x=1778746465; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2Nja0tk1GVUaRszXxWqHTeEt8mJbfG9UwFOxiLKoaqk=;
 b=aPYnHRjLUjwslBXnifiSgCOQ4JQ+neSfflYVOZQ2WDOFwoNThXLqO4cXC+h82BakmD
 SItq+1fUQZkBE+/LgBLKVmCOok2WvLUXr5yser92qpfP79cV/qRLAFhlcgxRtUgVxDwi
 HdwIOhbUb+iyCLNibRnWqjSr3YPR+EBZw9enYaJxRxMzyLtPT/DK5s+Xt9NUirfNSmL0
 hBZPW/c2UViWEiC8LGJHAHu+R4C63I5SNOTF953Hoj0umONPKa3ofGXhI0Yag9BXsUfx
 iEaLpB+x1/IRU0fXosnMM1Syx2+gmrFOdVzgqf7vwerPMg4uZveTqJuFIvhgoxoplGmM
 HxyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=aPYnHRjL
Subject: [Buildroot] [PATCH 1/1] package/zellij: bump to version 0.44.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/zellij-org/zellij/blob/v0.44.2/CHANGELOG.md
Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/zellij/zellij.hash | 2 +-
 package/zellij/zellij.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
index 03b647f7bf..635f5ff79a 100644
--- a/package/zellij/zellij.hash
+++ b/package/zellij/zellij.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  7c17759e1be5ce0b73cd2a33c7c111c9b7ce08d4c7f2efce12a0d7a7815b8b6b  zellij-0.44.1-cargo5.tar.gz
+sha256  69a6209cb26ecba6cb9fa28d10abad328d82adaa7e79b2eb6c750e08a4500021  zellij-0.44.2-cargo5.tar.gz
 sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
index 2d76b89891..f1828cba78 100644
--- a/package/zellij/zellij.mk
+++ b/package/zellij/zellij.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZELLIJ_VERSION = 0.44.1
+ZELLIJ_VERSION = 0.44.2
 ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
 ZELLIJ_LICENSE = MIT
 ZELLIJ_LICENSE_FILES = LICENSE.md
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
