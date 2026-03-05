Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE4DF3092C
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 13:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 017AA40C01;
	Thu,  5 Mar 2026 13:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id goST_R5Z30ca; Thu,  5 Mar 2026 13:18:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1962C40BEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772716718;
	bh=sXx1kHtBjvJj70NmmzTZVrNv2FOnAOpxyj3i4NC1r1Y=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oEUQQCjmj/SNHue8aeI8rUoSys0xPssPjjtQ9I9S44LRNzWDA79/iGbruqMX1r28h
	 a/+zT6Xm0lh9k/YM50ZEEvWWf8dr1jY03LQe8Qn8L1lXLTHCSnT0okFB2+LS+ClP9z
	 XofGBTnz3O12K23IYbifGlL66v0Tgwi2DOHqFA94Rp2gnX14FTJk0rgS7tASxc6zGy
	 t6m/Ya6R8RUVTMx8yrJH3OmDfWHC4P/LGICukgMx2Ygx2xcK75jASDpwsz6NC+F9fb
	 pD6AB836jbYemNe/QsCTERkPifERP9/h6k6380107rEo5I0GiQfuv3UjqQRvkZ5S7E
	 6XkEs5gx3QFig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1962C40BEE;
	Thu,  5 Mar 2026 13:18:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFA7F1EB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 13:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1B0F40120
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 13:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8JMyYKqfzt6 for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 13:18:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F072C4009A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F072C4009A
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F072C4009A
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 13:18:35 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-439c9eb5d36so1689606f8f.2
 for <buildroot@buildroot.org>; Thu, 05 Mar 2026 05:18:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772716714; x=1773321514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ePKuREpxUFw/o/vmjsdnCjYnnqqIXL1M2EfAHilQeJM=;
 b=Za8YzJCWMGVdsfs00uDlzB+cuKO6TptJqg7aZi3SubPPeQnw02NwBRQjfYOCbjUPu2
 mnyfcOeQrY4zmAEQ0ziw2OytyFK2+SesPpI09mwN1XLS8LWt7klwbHrffKLDJf/AOEzL
 7knQGq+Kb7rkrGEesz1pSShcWzv7YJwOkahaYjHv8FNHahmLJAGf+cwzcg9Xc3EwNF8u
 YtMghpBc813d4hu2Jui7BQvD+QUHz8FbUyibdJxIN8RGTLnT4caAJvQGOSb9frep5O32
 wmul8VLlmyGpiY8eS9pXkQMpjoTuz6LgmhkPHPl3YNGZKfJrBkOq25VVDTErVcflhEKR
 kX8g==
X-Gm-Message-State: AOJu0YylvixqDIOEAdvnV/CsI0p8V0wEwPUBxFM1GosCy2kfWt7IF2w9
 XZteLRjrJRRvcASqblIat/wDxGKpHmH1nIpyOL9e6jVso4bwsbhHc+RI8nejDPBa+ZlRclhBdwX
 B1GjO
X-Gm-Gg: ATEYQzz1cWIE8SuL5+0chMX/cakVZxL5B3zGczniAvk4ZWxPunD+WKK+O+0r5v7TfxC
 I/uHexDW4/rLsn1HxqD5QXQ5u0Ha9eM8BTsokOllRmLPRqy8dKJzbb2thlGCj1XQPhDCqfTP/+7
 +eyCFW7Pni+6/snv/SVIhebIjbGU+O+7RvE2OSaQZ5h0RnF5Ma+li7ZFFctS0vXpa2Kdq5fLlxw
 BNgK9Z/pd6qTdFAxBkUGDib0HSNYASDX4iGdGs1qOhaEBj5Ey8dGanI+cWepfLAox9dhTDM9nj0
 P+/Gs4/WgKLX5lFj3OHTFvY7Up/EncaS+xM2TtZWv+keT+eZCEmgE5ivKxOR3tfBrWmhk29qEQB
 2HcXpoOluGVX6uTEuOcfQMsbwtDtf9Ikpa1DcC7gW9iRgI6P060x/BLzFqJCWovouQV1rjd35O+
 kkw+gHNP9JDneNyJefYUSKp+AP/uyvv/E3l1ufs1K4W54zTInabGFhfmT/GuUkhXKvVpUZIGapr
 U4o9e2ol16pD3poMnsZxk52EavKONr9oM4Xjv4XR6jJhJKYoK05fXb7WBmSaIi3M9+FaNydwVZj
 DQ==
X-Received: by 2002:a05:6000:2891:b0:439:be2e:7339 with SMTP id
 ffacd0b85a97d-439c7f62551mr11699654f8f.8.1772716713707; 
 Thu, 05 Mar 2026 05:18:33 -0800 (PST)
Received: from localhost.localdomain (93-47-52-235.ip111.fastwebnet.it.
 [93.47.52.235]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b59723fesm33025907f8f.38.2026.03.05.05.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 05:18:33 -0800 (PST)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Thu,  5 Mar 2026 14:16:59 +0100
Message-ID: <20260305131701.56962-4-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305131701.56962-1-andrea.ricchi@amarulasolutions.com>
References: <20260305131701.56962-1-andrea.ricchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1772716714; x=1773321514;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ePKuREpxUFw/o/vmjsdnCjYnnqqIXL1M2EfAHilQeJM=;
 b=JaXv7EukZJLDRz7637nH7qlckzT8y6mJJLROvpa9TWJE6z8vaSRTS5r/5iZLcnps1O
 YStPlx5JnNZmJXo6ufPgfSO2UPtPA8wiuqLuW7BS1/jXTddGBR5aAqWywRji/k1625dL
 anFxHeigvnntbSxNNFE9xdUqa+YqZiOMmuDHw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=JaXv7Euk
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Andrea Ricchi for
 libcppconnman
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

Add Andrea Ricchi as a developer for the libcppconnman package.

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2673a59824..4184dc4df6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -186,6 +186,7 @@ F:	package/wine/
 
 N:	Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
 F:	package/cutekeyboard/
+F:	package/libcppconnman/
 
 N:	Andreas Klinger <ak@it-klinger.de>
 F:	package/ply/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
