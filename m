Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591BCFF885E
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 11:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AA9740758;
	Mon, 27 Apr 2026 11:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZoM0hNNlYwh; Mon, 27 Apr 2026 11:00:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3343040766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777287619;
	bh=A1xJIby/UlhiQDITglPmyPBVym+Ul3Fk2TbCE25i5/o=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=J3bDV1SKwcin3xp8hTOd4oEmQAw/chJb28uq+G1PKvSqtH0KJ1rBVH51W6FEFczb+
	 Zb5DvjahXH15KJuWL4T+QiAfwZ0VzF/r1PWP8+JELhZDFVHCuhoSDg1YIee/q9mqKW
	 iHBZFqbSsXRbdATobjdUz1DuxiH6Yvr0OYOxK4ELisw3zxa2JZotCh0/6sg3bFngH8
	 yY68GfUPRRD40I6AwSL9DqiYdUnBI++QnBDzXhzM92I1NzAnd0EyeZXK5G1Cd2E3Y2
	 6jIukOGdwRvNmDVISOljV5agBS6vUE/ZmBHjGPl/m6AJzD/pbVE1hj5O36sv1ycKSG
	 t+7ZbldEqZekg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3343040766;
	Mon, 27 Apr 2026 11:00:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3710D231
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 11:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E150B80B0F
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 11:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2Yp6Om7TSLn for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 11:00:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5115D80DC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5115D80DC1
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5115D80DC1
 for <buildroot@busybox.net>; Mon, 27 Apr 2026 11:00:16 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-678a526f374so5521064a12.0
 for <buildroot@busybox.net>; Mon, 27 Apr 2026 04:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777287614; x=1777892414;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gA3fDx2dFaAGm6BUxRd3MuYZ4LvgP/BFKBUXWbBv8tU=;
 b=HHcG3fp2L5Hb3y/AKLCAol13mss8HuIXea9Dvhw1iJeI8A/sppF1JjkA1C/UN1B46F
 pEE5nA/qDewIUpUyRXHQinv1wOGXabxCBkrZjEoPCTWFB6hc3rKgeBv+0bX57aUfwnI0
 E26vaHRmSjJ/ETQ6lZx/GaU5oi45OmuL42cTdTE/qX509pSUY1vRYL9Ps6andVFlFH1G
 TIUGXi/4SN3kE+TyLKWdIaPgfmdtznDY99NrO7n1WvsjDgpfejyrWyp7LIMujWDo8mUw
 2HmW9wTw+yjKDfGMKtvqFCfMssSaFF3ytfCVB2JHnu8sz9ApmE59GoIoaA2xqfqClR3P
 ncMA==
X-Gm-Message-State: AOJu0YxipHKkbx95YnkuzJKTYR393y8Ly1YMkfcxIeFgwcSktA+nUkUi
 Vq7Vt3FTyUA2bs8WrftLMKzDgKldjqCWlK7MWbO3kUWiQ2cWvYdJJtnUVmtv4Q3/3teRMsPTpYn
 qbyTOe+u6rPM=
X-Gm-Gg: AeBDiesDRgdW++6xTTyoFSjGSiCB4m4YHdrh5T1kQEtK4qZAX8NIv/iq72xHLWTQXOy
 fPYgQ27mOKACCbH6Lg8x+l3z6n3bwiL2ij2FuQBNf2xQYw7f7BcUHkLrKZnZ3dvNsxU/45kQExI
 6kLC+fd3zpbO3dvQmqWpYG0yVV/zyIrGzjmWrRZ2wLEb++odKX90B7JjThr726lPi8LJL8Kv628
 AFLL9onQTcUoSeH714qXaz9egnddvrvOCFWKApb/GtmqLZ1dFWDCMZs/FhPr8vy7FyVV6mT/aV7
 u/x6tOEymYRIsBID57joi/SIeZCD7+/bOmrlOppNfuiT4HSZVjpScxmCJpRNAAvP1Twv8+UiBFy
 /A5YRjCBiabYKj1D9i23SLj0X1+2qOvggRWoNNf5nkEOhV9kcAeDXfJwJsOlIQFZQjLifReuv40
 IK4gqRp/pGzAfBcpZ92O/CGWUHKOS/t3sAmZ2foeuuMjgSr62Sb5Vz4AkjJJNx
X-Received: by 2002:a05:6402:50c7:b0:674:bf55:6f40 with SMTP id
 4fb4d7f45d1cf-674bf557016mr12288508a12.26.1777287612236; 
 Mon, 27 Apr 2026 04:00:12 -0700 (PDT)
Received: from vm-2404.. (222.186.66.37.rev.sfr.net. [37.66.186.222])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6744dcdf29fsm6617732a12.30.2026.04.27.04.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 04:00:11 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Mon, 27 Apr 2026 13:00:07 +0200
Message-ID: <20260427110007.71226-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1777287614; x=1777892414; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gA3fDx2dFaAGm6BUxRd3MuYZ4LvgP/BFKBUXWbBv8tU=;
 b=H2Kw12ag6FnCMY5l2X/rYfpXERZEddAZxjmucxJhtlmtGGemYCROCIyRZRCX+ywWZm
 9x8xJdCmKIBGV/VdczAtVmLgCzSof8/Zk6mpP3PivkBWxGNblJZQ0cfJ6d9YQdAkGVAl
 uzf0mP4D07N7a7jw1u1DzJNWQZ+UfwtAerWMOePa35mBXJk9oNNVJNc1bcXebQejGgdr
 EM/YD7dL4wF7Ommq3m5cBtLsYRUgPO4S6smxVlEZoB/LxqRozOSHM7kYR8gcjQxddL/K
 g4B0Cs7MrADexwtiFoxjmWT1PQgZWjyyzlOC2cgIs0mk+oR55eEDVSSMiTHCyIKDyoC4
 a6JQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=H2Kw12ag
Subject: [Buildroot] [PATCH] package/htop: bump to version 3.5.0
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/htop/htop.hash | 4 ++--
 package/htop/htop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index 0750ab009..f452d57a8 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,5 +1,5 @@
-# From https://github.com/htop-dev/htop/releases/download/3.4.1/htop-3.4.1.tar.xz.sha256
-sha256  904f7d4580fc11cffc7e0f06895a4789e0c1c054435752c151e812fead9f6220  htop-3.4.1.tar.xz
+# From https://github.com/htop-dev/htop/releases/download/3.5.0/htop-3.5.0.tar.xz.sha256
+sha256  b6586e405c5223ebe5ac7828df21edad45cbf90288088bd1b18ad8fa700ffa05  htop-3.5.0.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 55e3b9d57..2b9963736 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.4.1
+HTOP_VERSION = 3.5.0
 HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
 HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
