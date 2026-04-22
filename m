Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034C7FA1FD6
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 16:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7C1260741;
	Wed, 22 Apr 2026 16:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eagRdbeXBVaY; Wed, 22 Apr 2026 16:31:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C35EC60E4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776875495;
	bh=hjOiBnNIhR5SHnIHidMUE7IpAL6ZojTloiJHl5drgWE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FVbexzGnef0+aUYRDkU/DSBRnWeI7MkIcqKmJMKR1PUfJUXPuaHrkoBC+OiczDPUy
	 388vMyM4X/dY8daiDgxjlhGFQvvvzXH4hldCSNibDA/JOS2kvwUWQpasYzzSlqmA3p
	 SIbUrh124KNJordKJpkqSFG1pHE0dpB5TKlqJK0OB4/POmrD92W2Zvc2yu8pL7eJEz
	 igef1Otvbi+KMxHNT+Vx5S9Ydx9zfo+F7CdXH1FUC9hReBCSqeBrGUJUROnktqXLqz
	 ArFmYBnUDWH/H3uQozccyTuOHPMWgLSr00bTMA5IvYy4ISxQeHJkFu8nW8OLbyzYpu
	 enZPJds7FO8PA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C35EC60E4A;
	Wed, 22 Apr 2026 16:31:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 724D0257
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 16:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58D6E84666
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 16:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sRB8Cyf6rX-O for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 16:31:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 76ED084686
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76ED084686
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76ED084686
 for <buildroot@busybox.net>; Wed, 22 Apr 2026 16:31:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so74482655e9.2
 for <buildroot@busybox.net>; Wed, 22 Apr 2026 09:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776875491; x=1777480291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+fE6rSDxXyGA8DCVgtT9zQWLtSOPrsdf4gonJ0XOnMY=;
 b=BAasJctIlhGeP+Dcvyi0mr3/8GiZyHyFjslefKrARgzCuMiJP7hShR1skdq01qN8wK
 AQJtvfwCWBcVFXfm0nC9zKDDjtJkvIQDMiGrxbArSms47pnhOxbfAmeOTap5WcZ89B/O
 zyEhxV6PNairFDEKmcFrMhYTT7qwHWeT7Ta9O80UaC6W5/gS9XZqxD/G5P8Yiqv6rebN
 8qYp6mErNg5PhJ/xnq3ub1odSDdvGKViO8iseCITh6v6CQnZLfVOxqFL+nFbDxGBIy1E
 q3bT+fBAnxLieunBnYto8HvH49YU0Oyjg+ZecnlXine2Q4d00NT2KCDhgaie2/xT72nw
 SxPQ==
X-Gm-Message-State: AOJu0YwbX2z5rhJ4qzzWnMfVOrJCy9Ym8tfiphKXzww+M/m6AuG6Frf6
 yC/gGH+3S26sgbUOAD9VRTChtuH1dtipYYcg94h4DvO+UGbpv4QnY/rckAntxpq8cztahZLFphe
 9CQPZQ7yK
X-Gm-Gg: AeBDieuqR+4Jmx+LDcewNX3uuok0hfNno/ceemvBUKgpecfGnKDNvFJsENnW1+0ayv/
 l8KFdJUJeG25akYECRgOurDIBdCT/Y8ZcpWu7bZ7j+1M0wIZT56V2DveStDijDoB50jUZ4oqBPx
 K8T+mpu2p2K2uKNEvLJn8iCHqe+rrPvmISlH2sJY2R/VijhKzE+pgY7l18EnnOzs82FqlfxeOQp
 CXd5xPVAT/NVNQuKM2vqDG7kVF8qy7y3wqjoX36oc9nahyErtITzFTp+swhbie4ZNiWQtOQqr4W
 TJkltIiWgd+huNlThY8geykVD9tSncljSz5ga8C5YOfPqInHefoJXBPUTMJWqkSsLA5lbFxr3bt
 kyNT0M3doqtYjzShlu5u97Wigip+w3a8icjx7BrjqbioOGBz3LbkGCS3InJHItOsv5RbeqyRtjj
 EU0RJboS1/7USxb+bh9/gmzaAXVCJhAzlcdvu1nKICsEAFhYmgqxZeNiWuIIcy
X-Received: by 2002:a05:600c:3546:b0:488:81b1:ae36 with SMTP id
 5b1f17b1804b1-488fb7880camr336056065e9.23.1776875490080; 
 Wed, 22 Apr 2026 09:31:30 -0700 (PDT)
Received: from vm-2404.. (222.186.66.37.rev.sfr.net. [37.66.186.222])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891c318636sm256548075e9.7.2026.04.22.09.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 09:31:29 -0700 (PDT)
To: buildroot@busybox.net
Date: Wed, 22 Apr 2026 18:31:23 +0200
Message-ID: <20260422163125.5757-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1776875491; x=1777480291; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+fE6rSDxXyGA8DCVgtT9zQWLtSOPrsdf4gonJ0XOnMY=;
 b=nEK25OQG3V/BQi2jUPvtwo9x6eDpoL/GVqnutEgbuZB6bseOsCQsjOTdk0s85TOnA5
 t5k1QbW1f2uLECc+kCqGun8x2QVnHYCAkFgJIDKP2ORO/utj3qQOYLS1mfVFUHZIjBAu
 rFUv46l83hkuSUbR+UYjuimv/hU3wI+repfdotf13aLkHcEDY7bTybfJg+Zr0Q++rEmu
 r66xccDaf/33npibXijop1huWAQau/JPTXmpfYPpPfy/ziivgjjMDyXJSKo667ueARDg
 iBr4UBoVp2fNumtBvUyGa9ljYRuXKWXdPce+9m/1SyPzPVo2wQfrWABvRca3NS2QAJmo
 Vtzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=nEK25OQG
Subject: [Buildroot] [PATCH v3 0/2] ficl
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v2 -> v3

- upgrade to 3.065
- workaround for static_assert / uclibc-ng
- re-add missing Sob

v1 -> v2

- downgrade to 3.03
    - fix .checkpackageignore

- upgrade to 3.05
    - add dependency on gcc 4.6 (C11/static_assert)

Francois Perrad (2):
  package/ficl: downgrade to version 3.03
  package/ficl: bump to version 3.065

 .checkpackageignore                           |  1 -
 package/ficl/0001-fix-Makefile.patch          | 47 -----------------
 ...=> 0001-makefile.linux-pass-LDFLAGS.patch} | 27 ++++++----
 package/ficl/Config.in                        |  6 ++-
 package/ficl/ficl.hash                        |  4 +-
 package/ficl/ficl.mk                          | 51 +++++--------------
 6 files changed, 35 insertions(+), 101 deletions(-)
 delete mode 100644 package/ficl/0001-fix-Makefile.patch
 rename package/ficl/{0002-Makefile.linux-pass-LDFLAGS.patch => 0001-makefile.linux-pass-LDFLAGS.patch} (65%)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
