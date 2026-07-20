Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F294FC44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 21:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A75180D7C;
	Mon, 20 Jul 2026 21:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JVTHVHqO5VP9; Mon, 20 Jul 2026 21:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95ACB80D80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784582282;
	bh=fOVYiQs3IojLhJonQGEK4zZAxKzPXPid2eJbEhk0Plo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=fgvUb5eCgIqk6iH0OaszuMphxU7s4cSEIHof/aNzngW6ujqFqds/dxEY9lPddVlGg
	 p1vrttrdnhqpJegQ9f1V1URClTTNbSgCmm2qBoUJtENrjpSp0ayzTSJNqZ8S1MEJx3
	 fLGRYqa0YMJowuQedQH9RPCPQu0cYvQe9xLv3NVzZVLLs2vZ6S/eM290a6z4dpPklU
	 mkgphwmDFkrahTdiZvyRSah3SeVc++gNcfXo5bMWjTtUarjw+NVkihMi+sBB7l8umP
	 VVEKDGYsacet/Wc66bPwq/8647MT26ZFcjJnFotAlOFX/W3t+G43/EbM8pufVhMTCP
	 p3D+9nh59PTGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95ACB80D80;
	Mon, 20 Jul 2026 21:18:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6475596C
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 21:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A1BC80D82
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 21:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AlpRTEkYxI4z for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 21:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49ECE80D7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49ECE80D7C
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49ECE80D7C
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 21:18:00 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4955de8797cso8725385e9.3
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 14:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784582278; x=1785187078;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DdrA7YEmQwgljrK2BPIeCdaQ/uS84Uicf5YlB6tpSd4=;
 b=DIakexs0Tq515zTO5PWfoQ9bSc42AUvjM2c01+FmDrf+5yOzk3OCKjwKAN0SzBwuy5
 3mJF4+9sjhyMBJKXgZEqm2V6HXAf6dIJjZL07OicLaBF3/ihQNJiUA8hraTn6gZIfcPQ
 GY7tLOkgKUCtYNiDCxuGz+RKLsByLJ6owOwBA5lQ2Dm7Hj6tce8glmzFE5zs7A/sOC4s
 aj3W1ntON23bfUsen6lVhJ/vj4C5LhbIW5Pny9wijgkxBL6jhU2WLgFttIAfn4FC5usN
 oMYJSzRZFvEYb0vSQMzYJ4ja+2LjBmirD+6zQ7I7hbO7NQ4K1J5OKDLM1tagR4cCbsst
 Twyg==
X-Gm-Message-State: AOJu0Yw3oHIBvyDQDToBRwiB4WFO7Zkaf7w630ZTEUaQiKlXq3fB5gM4
 RJmI4Fat1rSb/ylGZpvSv+MgW0rXv+goT60qzTRLXrYW+vGHPs/fN7BeUf9Spw==
X-Gm-Gg: AfdE7cmUlW8MZ43uhGuhb8Lma/8S2fvZdgUdwE1D2ya7+YnxUzYifpknGLiPalmSWW4
 tZqSXE+5vH+9BgYHeAiS0SdWuS7vTlW+syr409kn33ZxiOOLksmAjf4ntXHpRbg07+ul+uPkczP
 yb4lgeNuGFEGycog2rXx5b0RX/ss9Xy5674CMC0zDcfQTsrM7yZHoClQEkItWjKtcc+oKGBVUC5
 Ile7+YYeQwXoXadTXNAAOo6E0tJqVCxj1Tngm77flBZoXmk9kqHaiy2Oqprrer55yAfyPaweydb
 E7XEokmD18G7snvPIBvLAKSml0gUFLopmWeVlCX7LjNmIceRASyexXpzmrPDJs/3QbaMZlcyxEX
 SmAOe03wYFT/q/vgO+XsG4ScijbxovDUELPBlUC8Vp84ovcx9trMs4bQU8GRhqWdBybExFZq+sf
 QwmgQ4ZQ41XHV0krnxah8yJmv5DBHKeARCNtQaAQ==
X-Received: by 2002:a05:600d:6454:10b0:493:bfbf:1da4 with SMTP id
 5b1f17b1804b1-4954a403910mr133542025e9.22.1784582277945; 
 Mon, 20 Jul 2026 14:17:57 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49565dbc288sm4784315e9.4.2026.07.20.14.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 14:17:57 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Jul 2026 23:17:48 +0200
Message-ID: <20260720211748.66658-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784582278; x=1785187078; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=DdrA7YEmQwgljrK2BPIeCdaQ/uS84Uicf5YlB6tpSd4=;
 b=A7+vbRiM9/jVzRdR1o6kpekLGNzSVE00yORrgb7chnZcGV7VHyxD5G1st1vB9FUz5i
 lReI7nXjfSnDUIxB01Ki4PYiuqe/s7t7wjofdzyqWjCBvElVC9x1OxzW6OrYYO/U6f3W
 OdX5lpYPA9nqPDduuzbsS3qwrOH9KbzZ395wiRGjq4uNZ1DkVgIem5FYkkxELIEXg//J
 WxnocoSpE2jo2G4KVBMRuSLm+v6fQM8kxiusBKP6CqbgQGOdik08z+IFh31Ra1BwdCwZ
 Z+u4ANqtp2L6MuZjG0FTCCj/eedG0jCdmwOjXhssVD3NLDYUEl9rVDih6OyrHp3oi/eJ
 xhBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=A7+vbRiM
Subject: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 7.1.0
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release announce, see:
https://lore.kernel.org/netdev/20260615160636.412a064e@phoenix.local/

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index c918fcd2b3..691e87bb43 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  e62890f7b5de63c05a3bf331dc8deb4c015c336013f341a4edf46969797f2f4e  iproute2-7.0.0.tar.xz
+sha256  fd9fa1b95809417157ca83dd72957e3261bdbce896353cb936f80af0b33a4b5c  iproute2-7.1.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 4ca49d294e..fe7a6fc304 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 7.0.0
+IPROUTE2_VERSION = 7.1.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
