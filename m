Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95A8CA1002
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 20:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C80683ECE;
	Mon,  1 Sep 2025 20:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yz-bqLyvPiyT; Mon,  1 Sep 2025 20:32:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B8F583ED3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B8F583ED3;
	Mon,  1 Sep 2025 20:32:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9443C1A6
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78EA383EB1
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzYum1son8ig for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 20:32:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7BFD083EA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BFD083EA5
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BFD083EA5
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:49 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-61d3d622a2bso2212887a12.0
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 13:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756758767; x=1757363567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JT8MvWsy5P59IqKvZtPcHmV5Q2HyVsjBIgeB0M1+FgE=;
 b=UevwaSgEJ097inPfCaNayEOwceXN/q7b2Wey2reIICX+VTWHwkRqgy1EmZej7o1Luf
 XeT2QfyRzNXaW0luDjI0hIF0FqOkgC5LEakD39Z+Z09cQJhGgn123Lqf2FKZmYoXuGyN
 0bMKQDAQeraQchTh8fVMibz7jhLsFaIkAf15MSY+C60vo64KAXWjksaCdqngd7kyoky8
 7di5Taw3Y6RsQtp80dsoU2vyBIOQ5LHzs4sOlwrW5k5IYUhiir0ZYVX/j6DxBXUs8VhQ
 tCnKCpg6gQBuH/pWx8kKmpIUT73ioBbwR9o2Y9sanxk3VSMLp6J/0af5YaJkehV1LhEw
 Du6g==
X-Gm-Message-State: AOJu0YzNz1e2ydkMob/5qz2dIMJTTmKmWarR+QWS5BVRZXkg7HXZ4kdD
 Su2j6+GuaJ3hpxxeapUMP8ZQgiQf8Bjo90JS44nHx6hY6TgVulAKDomV690EgYp/iGb3WkbUCzF
 zYL9H
X-Gm-Gg: ASbGnctyW0U88E8DqydnRv/UfH/wG+jdVEsZL18mkkDCrWflCXCad7fLM/UkDknzAFZ
 x1KLNGUQKWY9+GLe9Rr3kLGbVTs9kK/zvxk9gV844qYxIX0MtyQb6RlQS7x7F8GqZGRgvJepXoK
 1WdaATWCutKDI+kzOO5Vy8MfGUIeUrwuxaesKyJvGOGvlLHVY2UdMsjuIBVJ0JZnpFqTt2K2CXI
 9IA1Q8pko2+nFvyhaQnyR0XscBZzjZraLvv7LezPls3j0N3swyBKMBObDYi9h/e4UKvLyfmXRel
 wF1cD5fNnrI2P2N3kPnhhO4cB+qKD9Y4y+wg4ClrarHgplDjlZWFw9FHdkGHEGQFEzPQ0yH3pCu
 xjKXWLSIZRWG0uqy14kaKbyooD8ivkfxVnuCAYtJMuJRRfY+CgFVMV+aGkLcd1YRxA/W+4e8Ffw
 PcPPdO/+35lmNKYrVe4pafXA==
X-Google-Smtp-Source: AGHT+IE6nsSGzfA905QO0ZtvXLLAZ/LunQwkTyPcOeavX6NiJd39vnVNSuCciazxRPKMhLjU2LGyWg==
X-Received: by 2002:a17:906:6a04:b0:b04:48b5:6ea5 with SMTP id
 a640c23a62f3a-b0448b59f72mr113172366b.17.1756758767227; 
 Mon, 01 Sep 2025 13:32:47 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0411bf1b09sm553530166b.79.2025.09.01.13.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 13:32:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  1 Sep 2025 22:32:07 +0200
Message-ID: <20250901203210.804061-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901203210.804061-1-dario.binacchi@amarulasolutions.com>
References: <20250901203210.804061-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1756758767; x=1757363567;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JT8MvWsy5P59IqKvZtPcHmV5Q2HyVsjBIgeB0M1+FgE=;
 b=USlEn9NYR+jgULT9E2aC4Qi9+oVbI4NCbbIATN5mS0EcUUfgdmKX0MQoK3zOOpbpDG
 iHFJ9ztj+gHmJmvaLK8H6W82Zf+zUVwuDsZ30I1ir6BdIAlacshxPIG6VHydZu8h1Jgp
 YRhgOPcZ9eOq2LsPkbvKjt7kc2ow0qQgPEfRk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=USlEn9NY
Subject: [Buildroot] [RFC v4 2/5] package/qwt: bump to version 6.3.0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Richard Genoud <richard.genoud@bootlin.com>,
 Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://sourceforge.net/p/qwt/git/ci/qwt-6.2/tree/CHANGES-6.2
https://sourceforge.net/p/qwt/git/ci/develop/tree/CHANGES-6.3

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v1)

 package/qwt/qwt.hash | 8 ++++----
 package/qwt/qwt.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/qwt/qwt.hash b/package/qwt/qwt.hash
index d4fd210cbd69..e20c9ebadab9 100644
--- a/package/qwt/qwt.hash
+++ b/package/qwt/qwt.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/qwt/files/qwt/6.1.6
-md5  cc71be5d6c33c2fc19ae8082ccdd3e83  qwt-6.1.6.tar.bz2
-sha1  b1f17a86c9b1b0790a0c0067ef69fb6277efac79  qwt-6.1.6.tar.bz2
+# From https://sourceforge.net/projects/qwt/files/qwt/6.3.0
+md5  06a8f8eb1bc07bedfb1df601804439cb  qwt-6.3.0.tar.bz2
+sha1  9180f33f75ff8817f27019c94d10f92de840a5e4  qwt-6.3.0.tar.bz2
 
 # Locally computed
-sha256  99460d31c115ee4117b0175d885f47c2c590d784206f09815dc058fbe5ede1f6  qwt-6.1.6.tar.bz2
+sha256  dcb085896c28aaec5518cbc08c0ee2b4e60ada7ac929d82639f6189851a6129a  qwt-6.3.0.tar.bz2
 sha256  d8737db330e1eeb439962e11654ab7f1aece3561d9415454a8c538643824ede6  COPYING
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 9f0b78655f6f..67292ee025be 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QWT_VERSION = 6.1.6
+QWT_VERSION = 6.3.0
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
