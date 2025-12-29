Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89E3E9271B
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 09:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABB8F407E8;
	Mon, 29 Dec 2025 09:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7yQ5D6suT9a; Mon, 29 Dec 2025 09:07:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AC87407F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766999265;
	bh=lpEwYgiYF3NB4XaUC38sZBAS1o/ofYA/qagt6hUIO9Y=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=E+pBHs2YwiKztOIWq8E1VGh5Ym6AZr3ps+93pFQiGkFjaGqXcU9fixkwUj7HcdWi1
	 43/JOwCgT7wywLJwsoDosJ05TqhepZ5r0JMotfie9q3d2YLGk1GRx6DcQcQMIADEE7
	 I2RFcrKa92b9dbX9mc4c/q901Qo5WXj/xNdkzCSCdopQcqsQUQ5NsEtWR+hZpqPV5Q
	 RcUjYZYkM3XGxaMOyQTAYpePksbOdiUXe4xYckRrjxBju+uvZ32lotv7t8TMfpX+q9
	 oDcRB+PVx/TfdhHGk41pCdd4IqgIjlrpff1VitW/rlSiUAcSXYA7RKANZLLICz1CPS
	 VnvV029M3vLpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AC87407F6;
	Mon, 29 Dec 2025 09:07:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 711261E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63A2080D5D
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVL84Re-slXH for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 09:07:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41C6180D3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41C6180D3F
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41C6180D3F
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:39 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso37052375e9.0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766999257; x=1767604057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a5a8qVkbsWGyfNWUAoS4mCR8UeWZMNZXrSoTuAhaLek=;
 b=fEjfkJaishlgN3CN2nB/qmFUggYWAy+59hKlOFzyGXnWcw/mNDWLzDvoJDLZ6gx/SN
 6D7RuVfeW4EdkSm9wxekllvqQZUoWn+fWBQzmjGSdE7a3ReCEjHPQjTMWL40REpiKaIZ
 pcaqwnCm+Cv0iFdCwdaHtvBZvzIVbWtDks381RZKymoj80yX/gccvSN6EX10ucG6I6u4
 /d6FAeTkyqlAOMMygvOQ2nlEqv/mY3nZUVEnLz5CMY6dprT+eSJoGqsqfew6im0wGi8/
 Y4S272qZYzFKa6+mVtSRjB3AYPH+hQBg7HCLe6XwceBiz8TyFgWW7Rubq5VckavMQPO6
 3ijQ==
X-Gm-Message-State: AOJu0YwKn/kgcLXGvUXwv4CHCIia64lkfFGW6XBqMzmSlfp4S0TKRGSF
 qSyObSY50QxZ6K/az1FA0b2ntw3eoA6mXLDg08TvkubG48JPlMkL+DRburUqDNlUnXHxnvjWKlX
 1HxfoTHg=
X-Gm-Gg: AY/fxX7uvYwv6iTx4o9JZqi602vsM10tqv9/8V5o+Y03WatBTVbxNF90K7JtwmGdTJP
 BJnhOEYBmlYm9mH6vpBXlzodgowmv6eMzridDcQJvXAc2vkN2DFtdU3n6mN+ITu1KduqnzR+4al
 I6kbj/KLHFd3P9qjHreXHjMjcHKJ5XA3/c6V3e8aON4tN+72g5c+JPdVK7Fqc1O2qhmE6/rm5Ni
 kbPVZXF/a97+QYXyligoj7XwSYpF5Bf6HCnZ6uhCWRFzAIzLXmxSuYulZWluv+TGHfrjk4IQhpK
 VqGe6lDbNlTWy4+rWg5M7agcccLwVjwAPOXGvofuRvy25J6++98XwPaTfVpN2l7PCPvTkKsppab
 81myDmrC672Tb3x487lrMp+v4GLlumN0ExFWFvV9jiEWGAFLFoY8fweHTR1McAoL/pbnd2sYzaq
 GjSMLhgmGvuqJPhf8D3ptcjf9Ler7JQZgONKs3uGk+rMNWvguTrhDwavqFDg0EZvrmdNsnMe+3c
 +v6h+oJHEuQ
X-Google-Smtp-Source: AGHT+IF7kypn7xP+Ov26/ewze0ULIgG4xQONQsNidxUE5fmba2OAnlI0vQpVO4uR0ePU9uUj9d2iiw==
X-Received: by 2002:a05:600c:8b06:b0:47b:e2a9:2bd7 with SMTP id
 5b1f17b1804b1-47d3b011b03mr187166085e9.19.1766999257148; 
 Mon, 29 Dec 2025 01:07:37 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm538910175e9.12.2025.12.29.01.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 01:07:36 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 10:07:17 +0100
Message-ID: <20251229090719.13291-12-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-1-thomas.perale@mind.be>
References: <20251229090719.13291-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766999257; x=1767604057; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a5a8qVkbsWGyfNWUAoS4mCR8UeWZMNZXrSoTuAhaLek=;
 b=Tar93CxDwyFPDLrpbizRpPhTmIMp6BkOkzVeeuCz8b9/WVrQeVdie3o1sijSUFEw7m
 QXSvITl6mhqUGPq0t6/h6J30BnLk+FzltGCI4wCfRdtM8oPhOEXD97GXxqObJI6eCU6z
 GCa/d7zYllBXvvIVAw+Eem533cImY75Uqz9OhvLTNuaKoFh1hSGa0YDJ6y7Uicdjf/s6
 NP+mdeLrN+ZpNXIWkJR7Mwiv09hJvL0mgpz+2L1qHgtjeMklrEEaJU5qhhXLvYad3c1p
 +qi13n/oSaJlyRWYz8PU3Fz6fg+mPNXDCwqHTITR5qNYzMYDVVQRe72pmR4huieNR3+S
 TzhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Tar93CxD
Subject: [Buildroot] [PATCH 12/14] package/sdl: fix patch reference in
 IGNORE_CVES
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Bernd Kuhls <bernd@kuhls.net>, Gilles Talis <gilles.talis@gmail.com>,
 Martin Kepplinger <martink@posteo.de>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the
`0003-SDL_x11yuv.c-fix-possible-use-after-free.patch` patch reference
was renamed.

This update the reference in IGNORE_CVES accordingly.

[1] 9fab7bb79d package/sdl: drop directfb support

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sdl/sdl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 439c30b2a5..29697fe3c9 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -13,7 +13,7 @@ SDL_CPE_ID_VENDOR = libsdl
 SDL_CPE_ID_PRODUCT = simple_directmedia_layer
 SDL_INSTALL_STAGING = YES
 
-# 0003-SDL_x11yuv.c-fix-possible-use-after-free.patch
+# 0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
 SDL_IGNORE_CVES += CVE-2022-34568
 
 # we're patching configure.in, but package cannot autoreconf with our version of
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
