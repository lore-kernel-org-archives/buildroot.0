Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C403D1171E
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 17:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99CF5410D4;
	Tue,  2 Dec 2025 17:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBEpuw4HITUP; Tue,  2 Dec 2025 17:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE89E410E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764697969;
	bh=lZ5UZumwbmBXqliB26hGmn9L9DbfLEsKNjnc7/qDtGc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W4j4SC1RFb2YVtq6omNLTyjkY1o70VvpcybnfbvyNeE9J4i0YQ4QA/QcOcDCgR7lQ
	 dPivMo72uUhrVt8obEn7hT+NMeQ7Chf/nxtw+Y4BVTDIjGnd/B3AQGiBhgnHO8aDLQ
	 NGvSPSroX1N5CNfj2VPrj5fZ8xFrcj8Wn0rR/LqVxwG1vI/eDUztlR9iS9bhIgOC6H
	 0DDs87HVMQOcdIjhZG8TR8tiqMekVSuEa60arFsuGrpg/Zm9Ut1a60yRojq+tj0CQx
	 cNqT0/L/e3suFd07EzdEF37/15/PT+71i345825OXS0/T5fm3+E4yb8vmd30sEf+gO
	 YvuEekaM2amkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE89E410E0;
	Tue,  2 Dec 2025 17:52:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6576CE4
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 17:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45DAA410E0
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 17:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpaZyeJMCa6K for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 17:52:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 63BA4410D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63BA4410D4
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63BA4410D4
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 17:52:47 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-3ec41466a30so89461fac.0
 for <buildroot@buildroot.org>; Tue, 02 Dec 2025 09:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764697966; x=1765302766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QK7qOYQai7he2rSQyt1dhofkUN7O538xaqufoJ5CSXE=;
 b=FdlI9S2STH32n0M0oPPzJoMkqr6XXlRgbXbVHZt1KjbkRvat0x3dhwQx5uR5pENMHD
 VPNWHdShhO9L4IAkhOqyd3AvNqF2MatOxjS2mvnieDXbFdXujCywNW4e46ligl91wEnN
 gx+a1S3y4cTcbw1quhfnHyyDuA+kVCWwj4HxOqSkAGJCCXd/OORqL4ZCEyGmlvBjwsWB
 EnPdkkTP+QK4rthrpDCAk33OaevFF50TdXBKh7e7Z3uxNmedM+zR29c5EUvn1k9B+XN+
 9y6kGK8pj+OvZn+0NO2dafJoETAtYYqoavzWKbH2UN+wRaCalu7urSbO4YXRY8H6WEPF
 DeHw==
X-Gm-Message-State: AOJu0Yzg7oeTNoxcY0cElJp+qUgPFTBKSzXPfTforYoc0M8lNlAZ5O1w
 SUsBIxOYBVQLMHVYdmluV0ZEutWboZFjuSPUxYeN35ozNFKA1jgI+QHKyTHJadcs
X-Gm-Gg: ASbGncud41c416JwG5wE/ToOMIrzkcMZrBuYVFL0mZKAFAuuDcc3wKkzDZaAsFubo6S
 IH+ZnnqwfXPiVA5ZnkTviKLj5pPIoUpxb/6xL9R/XxbfOOrYniqkoM+31Z95qjhxF56DGBGBpZ6
 MoNiZ4u2bwl2khHxjH+gnxNDzbquCcDmjJ1wjKuC+I6G+r7/6YrXgzHEnD6EX0iiNjYu9k6MOLC
 HjZCqjtWokQmZcb3n20HgT49EINqhgZ3kFvNbrmEIx+ftmYlE3+OMmy87Bc+pIIGOWY1YINNTOa
 oUXXpcN12c3GQDwNjxyNFQRCtxMTJG6mqE7E16padI67lOuApcR6WABLgoHCGHE18DbFGmNKisb
 jDW7NunUEcQ8i9+ElAPWrIsms6/HLf77aKHSqpDIP5ECDvFnYsGjLosBRxfQNZAm5ixwlhaHYTe
 8jZrGzkRZFtinSODUW6ybUHK1bORTAI4djr2SiuWGLSaAFUGo0zigble9X9OE=
X-Google-Smtp-Source: AGHT+IGX+becdzjF6CW7TB1xuGg5P0V7TAgdD7t4hOU0IBeNRIh7C0AjWXdNRw8Fiw1TgR/lvrbHmg==
X-Received: by 2002:a05:6870:1799:b0:3c9:ad69:4416 with SMTP id
 586e51a60fabf-3f14f115100mr2055461fac.5.1764697965876; 
 Tue, 02 Dec 2025 09:52:45 -0800 (PST)
Received: from james-x399.localdomain (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3f0dd021aa4sm8081759fac.15.2025.12.02.09.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 09:52:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue,  2 Dec 2025 10:52:37 -0700
Message-ID: <20251202175240.1270265-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764697966; x=1765302766; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QK7qOYQai7he2rSQyt1dhofkUN7O538xaqufoJ5CSXE=;
 b=FN6lo0ABf/7g027EPTQbKyjrS7qvsFfCx+fKSsMPZNOWP/65ez7u2PW7Fl1WUgImyj
 v4bjzume+iHFP2OsiRWrGxFFf+gI4S7btH3w9Ov0qc9xhfEBzU/ELatrY5CBOEVKjX7r
 6Y4v28KRuSXkLwLzx9Ax1axlq9XW2PzAMVLopqWW/FYOeVfmN9zA9QcHNV714k29nqhc
 mbBCOndcfhlGXugNbwe9EVDf0YeemQnwOAtKDRpd+PXgwaWHqPFYp9xfiZUASAdGY8Ab
 UMBjhkK+ncFEXwt1a8DuyKcLcPfpFWdaaD4yl4XXlaobKzREDWglucLmHLD2YTf847tl
 GBDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FN6lo0AB
Subject: [Buildroot] [PATCH v5 1/3] package/pkg-golang.mk: use golang
 toolchain default GOPROXY
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

This change sets the default GOPROXY value to match Go's built-in
default of "https://proxy.golang.org,direct" which provides several
benefits:

- Avoid package breakages due to missing module sources
- Better alignment with upstream Go toolchain defaults
- Faster downloads via the proxy compared to direct Git clones
- Maintains reproducible builds through Go's module checksum validation

The default value from the toolchain can be read with "go env GOPROXY"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-golang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index ffd50adecc..26da7be71b 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -101,7 +101,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY=direct \
+	GOPROXY="https://proxy.golang.org,direct" \
 	$$($(2)_GO_ENV)
 
 # If building in a sub directory, do the vendoring in there
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
