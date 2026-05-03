Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE97CD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 10:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BB1D83F80;
	Sun,  3 May 2026 10:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkmCSGfg_TSS; Sun,  3 May 2026 10:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EDD183F79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777802519;
	bh=WMDA72Q5lcTs7soYubPze+wmbg0dUtUKvmw25C7VIWA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M9sFjVRul5PkY/8viqWWUyRpA2oA+CSbzXTL2GnhIAakORe4peIe4liXCm5uwqPmy
	 6d6ze+rKbciDuNDuLPsvH4UloAjcfq+DooTngkyDhhhVwTHLdzewzLQYpIqlGSSBkj
	 jcAzW2mkk0KOilnwTiGPdX2pUgVnIN0Dg6kWlyTDn+YmhyR+ai3t1anpNNl7L6XmWp
	 T9La6aIj5JwuCed8MnS541mpbA/dwssE0iS32toFA9g0NQjp0PEIaC57LrA5e0RrmD
	 QtjrQPXPNZJdvfkwpqhD4gN68Ivicm/y3g1n5r0p0miMHQnijApjlbPUBC2gr6FMMa
	 ZDpQjc71EhI3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EDD183F79;
	Sun,  3 May 2026 10:01:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 757CA204
 for <buildroot@buildroot.org>; Sun,  3 May 2026 10:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BA8341595
 for <buildroot@buildroot.org>; Sun,  3 May 2026 10:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIBnMRQCU40P for <buildroot@buildroot.org>;
 Sun,  3 May 2026 10:01:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0BC041594
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0BC041594
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0BC041594
 for <buildroot@buildroot.org>; Sun,  3 May 2026 10:01:57 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-835c98b659eso119804b3a.0
 for <buildroot@buildroot.org>; Sun, 03 May 2026 03:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777802516; x=1778407316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v9uzGIfm8lpOFUPNmrJyom8Et05PkhGuKbsnEI9bsNc=;
 b=kAsUrR11CbZvbQQzK+HWcFn2Trv2xTEi4po+tHfw0eyeTXKW0rogWHcnhv6xEAWHkC
 lgFM7wKmgy238UEymw3uAXNr7ZWIEbSpPaqQcJRYYcJuvIX2p1VTbS8GpK3TgJw6mAfE
 M9QZyTKrZk6ZQrO1bqDCqw0yMHYA2pJ6962jCbq3wQ/P2k8PXOgHtDf5G+VtQbOb1nzb
 Qryo2sBs7gjaZYdkbCZodqw1L/x+s0l6sFp/OVcpFC3rOBfQBdZKpjvr+EJs5d1pPF4z
 n1mkMD3ROcX2VFntrqPuqu/RZOmKPfcRzcOk2OzT29RMy+luNDaUsR8rKwUjJAFepZ8w
 xNZQ==
X-Gm-Message-State: AOJu0YwiuwYN1CQtc9DoscGF66scQRBkeofm5Qy32Ft7i7APYNyINF7G
 Cu7T/Cbvw8Vj/4pNqtWe2/WPsNZhHTKquJkD14Spl0Z8rFlO+layaUmsUron+30Y
X-Gm-Gg: AeBDievVGdlohkiqS90JiJxSOy7vtj6L0mFDISz7vblm2AMRnzsh4crrXQgnxk5guws
 c4YUMoKErRq8S1+RDAYvRYJ6PsEXV0T5Bk4aP8UXmfRFQUebu7o1ZhGdNOfUMLula9EaCBJWxRc
 QOZh44IzhM72Gr7HntfSV1pRA6WLc3nPv2FTrAN40mybySS+NmOAeErNQqWUEegE5TtA+dpbciZ
 I7Kbs70Kg1IIl0TLGYCiqwqrJAmkjfkTN5CUzZZZdqqpc/rlKPbjp+2Paz03hQGNITFxfeRhsAk
 fzlBldIg6A0G+FSopjFDV7d+W87BVgub3LJ/TXRNjknMNaqAb19TpoKBz8sc4pMyRIrO8wgqB5v
 /JVxylCGdwHCergcidN230YcNJ6B/SBnOuuUj/Ky+aXHxEYQXiKMKSGqdZfDfSNweYpVvFV8HnJ
 nXXXkGkF733L3csJPH3OVi9EmRXcdc5u/c2xUFtL94Mt5R6Vopu8WM/2k=
X-Received: by 2002:a05:6a00:14ca:b0:82f:721f:10ea with SMTP id
 d2e1a72fcca58-8352d1bf331mr5866529b3a.18.1777802516303; 
 Sun, 03 May 2026 03:01:56 -0700 (PDT)
Received: from fedora ([47.31.117.202]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83515836e8csm7329090b3a.7.2026.05.03.03.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 May 2026 03:01:55 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun,  3 May 2026 15:31:28 +0530
Message-ID: <20260503100130.1637945-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260503100130.1637945-1-chakrabortyshubham66@gmail.com>
References: <20260503100130.1637945-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777802516; x=1778407316; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v9uzGIfm8lpOFUPNmrJyom8Et05PkhGuKbsnEI9bsNc=;
 b=ZnLjGrsP/CaMMk9k+c/Id2a6UdsyP2loP5pea4OgsX/93FusYnkI1Af4GruH1HWr3k
 GB4zb0yc/gG6vrWUKfQc8QzvH9K70ZuAmAoXbEMcxovtRqJblNiLOxnIKIEOp0A+pbAa
 2QkIyU7WlMb9dLnfO1SHdgwqSQ2kheNhU+hIgov22RqlKGgTjD6u1IZP4SjRbzUc0CzM
 AoaZfUqPNHiyxifwsaxOV+bn/3RzHFGcdyJ9cvUUxlkuY5079Whr+UJX9QLycCzpk659
 iZOeK08zra5pA9VNVdWvy+V6hdZJn2NKVNADcCn8uSrYnNqjTI7QbkytL14v5ELYiiIC
 Ay4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ZnLjGrsP
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add myself as dos2unix
 maintainer
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

Add entry for package/dos2unix/

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fd973d7f86..179cdf50f6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3050,6 +3050,7 @@ F:	package/wolfssl/
 
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
+F:	package/dos2unix/
 F:	package/hyperfine/
 F:	package/pv/
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
