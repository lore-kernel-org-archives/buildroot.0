Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29411F436A9
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 14:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAE4C60DF4;
	Fri, 17 Apr 2026 14:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjbPQyeHADjX; Fri, 17 Apr 2026 14:22:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B445260DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776435772;
	bh=YcNgOD+38oEdZonvrUEatRwRTFceqHDQgl4YddgoeXI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Englp4Seb3XWP0vzZPt+tec/+VD6YKeHd8aJuR5UdCEp1wNxR2Rto445L7pULs18z
	 AoG/xz9LAoK7GUdoaURxeIzOrEP7jGL5IuknH7Bi0Ed2p0oda1KIxg3mVxBFXdrSw4
	 BREER2pmuzsouXsYsGPQt9lm42DlxOxkp6ogSAHkgV9XOfwd7CQU6P8f1jNYvjdkTK
	 4Ctwc+YXZSqptafADzmF4vLM+Wpnj9eBQ+aN7itD8x99tqeTnRtmkKNcaUE1qOH3Ca
	 WqDt/A5vU4e6tZQIDnwSlGF+Xg59pe6FDdZSWqm78VrcAcAwqJSyDxiGR1gjLzs8IJ
	 GMztCcMoqXBkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B445260DEE;
	Fri, 17 Apr 2026 14:22:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E90C270
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 14:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BF7E60DE8
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 14:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPzcLSgdGH7N for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 14:22:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.41;
 helo=mail-wm1-f41.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EFD8F60DEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFD8F60DEE
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFD8F60DEE
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 14:22:49 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488b3f8fa2bso16500575e9.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 07:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776435768; x=1777040568;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F5rf+l2pLtHWg4BQjl2uh6AoIXRozEM0E8vY+TwoiTs=;
 b=cD84Q8ouyv+qJCJP6BpfmjbWTq1/cr0bFf1XkimsVEqPoL6AXztnoutKdpQkrv0tdn
 ECH5j4V9LiFbvqThKv2zfQGHZqmGd2Im/klY2vVg04zxOsjUWDGLftpB4jzZvaobR3lH
 BqB/pQb0esthKmqxRSk5mjKMEtYqOeeJeX8u//55d+L3eUVTW7gW7h+RvoSe5freQTjp
 oWB+b4i/Ci3V4s7McDaYnLzefS/BVYnnVioUwoVhKWMKcErZvE2+B7DPiUUnkh4KY+J7
 uxKYPdoaSSxJ3xZ2Y9sPOYBQq7dMKxXxdznpNHksCBPR8lDNH/qhBfQ2vD/XejkRlV/o
 BwmQ==
X-Gm-Message-State: AOJu0YzHs5Pf5PIPSTO0UpwuaBeWO8o8KEoMBlCCD97+eKqePMYucqnJ
 wu/d9iohcEw4oyvYuMdXC/puKFepRBx4LPZse/TUaVRCn1iKSCPZ5aBDfNtqEQ==
X-Gm-Gg: AeBDievPxvZSHbED5w5vQ6QDvSLsrSDvE0sBCeefAMMb7cVydkKhs1WITfaiLpGNh15
 dj8rR14MuuCWnzXb1Ai0iapkQ8E8gTBZq2mtCSrRlxJXz95BhWkCQ7RJd3Za+RqLRvA8FpGm5CF
 fgg7Jzv6wLl2IU3QYXj1V31v/K4EobekartKondBXwyOSEiZZ0whDkt6NPaov+113HRg1hkQ6ia
 BCx3WwWZKBKo/Z0igctPUYvmfg4q4dF7i/fBBk1Q3ECHzo16FKy10Zuy8AvPoPb+jJS69ucv/Ww
 QX4md4USQuj33Oy+qh4ekuxLrIOq6D0PJ+DlF4Sui1fnfOTZID/rpAWskfOjriBmFqcDzJRlEqj
 WYNJpNKamfbFry4qLv9Yq2jTYXtAANbKVc7bZzS6pyPQ0Iu1POh+37bOXNPjNds00cpud9qLzEc
 FrCIkefl02c1r8rr09vcVoWbtQ8cP8q7fep4iQKPur1dirx5BpalZtmh7QhamiOorMFRMxJ4xKN
 4QvyithTSGfdqjFPRQq4wAanvT52rJUSa8XzeFEJJm0g03Bk97o6IbNJxj8+r3TZKwq0tPEBHvJ
 aCyTgc4UOcPuGP2iE+s=
X-Received: by 2002:a05:600c:8884:b0:477:9890:9ab8 with SMTP id
 5b1f17b1804b1-488fb88380amr26903605e9.3.1776435767525; 
 Fri, 17 Apr 2026 07:22:47 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fdc.static.telenet.be.
 [82.143.95.220]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f8188sm55355665e9.2.2026.04.17.07.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 07:22:47 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Fri, 17 Apr 2026 16:22:43 +0200
Message-ID: <20260417142244.18803-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 1/2] package/wayland-protocols: bump to 1.48
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Announcement:

- 1.46: https://lore.freedesktop.org/wayland-devel/AzTKh6JewwfUBFKaOS86DT4obISpv5b5bjFghXGwYrMPyk6Wxpz6H4_trRcEOyF9VpVV-0p1-UTNv7_esjO6ppw5SyIyGxWB8R5xI_SJYfA=@emersion.fr/T/#u
- 1.47: https://lore.freedesktop.org/wayland-devel/aUAqqkhyv6-OKvUo@gmail.com/
- 1.48: https://lore.freedesktop.org/wayland-devel/ac0NAPBFafhcgzE3@gmail.com/

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/wayland-protocols/wayland-protocols.hash | 6 +++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index f35c054dff4..2b29785dde7 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,4 @@
-# From https://lore.freedesktop.org/wayland-devel/aEw0AP7h6T8l11ug@gmail.com/T/#u
-sha256  4d2b2a9e3e099d017dc8107bf1c334d27bb87d9e4aff19a0c8d856d17cd41ef0  wayland-protocols-1.45.tar.xz
-sha512  d0557a75eb486fb824f182648bec346e270cb1ada8727613377ab95b0ccb595c516de242f486110c88b7009e98c87b071bf5b598f84466e5624aa1d81f19e195  wayland-protocols-1.45.tar.xz
+# From https://lore.freedesktop.org/wayland-devel/ac0NAPBFafhcgzE3@gmail.com/
+sha256  398036ac0eb6484982ddbde7ff86848d753231f9cdeeae983f06b52946625aa1  wayland-protocols-1.48.tar.xz
+sha512  24950c6181f576f8926e2631a3f017986f809cd4fe8efe6fc8e4d872e98aacabb9eb79877371fb5def1fc78027c8e1e1e25bb98d455c22624a810707be0b2c24  wayland-protocols-1.48.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 0cb23f84388..5ef89900660 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.45
+WAYLAND_PROTOCOLS_VERSION = 1.48
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
