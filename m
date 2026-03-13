Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5DA105F797
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 11:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33F8560AE8;
	Fri, 13 Mar 2026 11:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjllgjV-aGG3; Fri, 13 Mar 2026 11:08:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A48B60B74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773400082;
	bh=sha0hjXYJlz9VYzD8/AiBkzV3clLVDdDMPFxomGlN70=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sW3gZh/sB1eMoJAVV3eJxOrGYTzGxI44w7uOBBG89REk7og3/fp8aCarYypVZZRTf
	 h65rFd43asiiIKTdBsUnIA3ELz+n1dPlERn0cY78LR3EAvzg4Ah2hXTRk52avzLDYU
	 HAYu9W8gBA8NvpNKqEmonHlBImlIlFgVAdwhKzyapEnLvP09L380W330iugpBLpEeu
	 f7XXGnCYlISDQj2ti2CC90hlMPysKzWdsPRium2g23GDVSsZY3UpAwIw/ijJpSc7TQ
	 +k+ll2hwgZNN+bk9Pd2L24u+xIQ99O/it/oRhoqrX7zXCQwFHZKiEnGcwSKjSveTd0
	 8UUXErXU9EsLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A48B60B74;
	Fri, 13 Mar 2026 11:08:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 943571AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 11:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8666140A9B
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 11:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMpUVwF-Ns1C for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 11:08:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D59C840AC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D59C840AC9
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D59C840AC9
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 11:07:59 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2ad21f437eeso16416765ad.0
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 04:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773400079; x=1774004879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NmFkO5Kx9c5e5fzDPkVBwi/m74cAPEkTZ/74nnkmafE=;
 b=nYNL1JnPOEf4UawXsHrK7TXMo4ZIigSDUnabwlD/MZsnPrB9HTHYE/CRcNPlf8zFEC
 DqS1+E4+9pfqAFM/RU8+3WlBjYWQfCi99goqmKwJb7vs5akY97Kb/zoGcQ64m0OqkEoQ
 UzALicHSLJKYPbbWTkh19OqSQI+ahg2GvWxNpzxcGfXc5C+S7f1rJTQSb2zJHiAGZ1oG
 beO8wUfqZQmZnxrDnYj9QTVFg5TDzBuPPA/Kv2f9RB9Eb2TljDJ3j8Kd+GYU2EufN/3W
 5jFQKhAFJWasNhK1mRraJueTwqbpXomF8U/XppGZTOpo6kuPDxl8VqunQN7mlbf673mf
 nCIw==
X-Gm-Message-State: AOJu0YxY8NbdYVj4RpRbF1k7kJYMYQ+SaZ5/4keJFjGaXZMzUYWjSsYS
 nnH9WOtgMowrfnvviCNFqQthgMCheCOe2BRslxitXCe/t2cBVuj32v/fxMjFQQ==
X-Gm-Gg: ATEYQzyvVEyqkhVP3kmAO7+C83Fq7v6cf1fvFM6IWMesb7radCQ1/VzpaKFkJuHR+oR
 PAhuWrSF9qWKydOiONtWskfzuK168sDzWDJJ+I9XpRXsSUb94G4s+R/hXfXyOyl6iOredUA5mtQ
 z4yKGObwsIYHh+54krUNCymqA6gQsbyxXiZhLmBdVYQo5z/g4NDTDjmvTrh/zNOcdtAJJrBzLj8
 66ILVVFFL2KSnLD301uL1N7dtVJIMQ2z1tBQS12i/tJiArYhGZkGuljk66BPr1n9JAQxBzXe2fF
 q1Bv8UTVGpwC15aiNHGnv9z8plWnLxnkDWZ8D583c4FxrUrLF7D/wX/cL30L6q7ki3Y3bWsYDBL
 Xy0OWzZ6OQl5iWXhGxdswBKuUhvl/GRq5/Xv2OaaTFGWhPMZtaLosTmvvvRF5qvaKBBs9TnvN6t
 Y97uDqdq3XxN47bM+tWPpqFIAM+OBm9sG6DnNozA3JNi0=
X-Received: by 2002:a17:903:ac8:b0:2ae:ab51:a78c with SMTP id
 d9443c01a7336-2aeba59c274mr62740925ad.30.1773400078708; 
 Fri, 13 Mar 2026 04:07:58 -0700 (PDT)
Received: from fedora ([2409:40e5:1055:572c:8b0:ced8:a8df:a66])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aece81378fsm25959655ad.66.2026.03.13.04.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 04:07:58 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 13 Mar 2026 16:37:39 +0530
Message-ID: <20260313110739.90948-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313110739.90948-1-chakrabortyshubham66@gmail.com>
References: <20260313110739.90948-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773400079; x=1774004879; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NmFkO5Kx9c5e5fzDPkVBwi/m74cAPEkTZ/74nnkmafE=;
 b=MvINRjyfxpN9qiMrEqKH01Ac4uFJvefInxiOEwmRFVX0hnvWlr4EyzD+8OAbvbsvjl
 BxbISwApPSO9wZNxmhWowuxFZOvEPSBbvOFxeKeTbUPd/cQdhv3er0SW5XWoJJ/7mzGh
 5+/VuJrhBVioQfKzRpgamyEL9FY4JmoMJ+/a7rPbXOZFXvwQ+m6OwiJmQmPdRn/gkLEq
 vFP7B9rUKmmimfNRfB5jDMwt7DkEltsJZA8lHWYWyrhXD3ji+VuNVDhr//CNXgTtSPrP
 5cZ9Vh+QAzaaE2TO2HZH9NQ8IOUixp6H9mAexJabY3Zpv2N0BcIFDvLI8wgK7Kz7umTD
 7Lyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MvINRjyf
Subject: [Buildroot] [PATCH] DEVELOPERS: add Shubham Chakraborty as ccache
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

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ba6ba6b221..124f5dca4e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3025,6 +3025,9 @@ F:	package/tunctl/
 F:	package/ubus/
 F:	package/wolfssl/
 
+N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+F:	package/ccache
+
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
 F:	package/cppzmq/
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
