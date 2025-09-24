Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F80CAC5B3
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 10:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5822881746;
	Wed, 24 Sep 2025 10:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHztcOMRBH7l; Wed, 24 Sep 2025 10:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD76181769
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD76181769;
	Wed, 24 Sep 2025 10:38:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37604177
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 10:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DCF6400BE
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 10:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vblLSZvNnt0d for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 10:38:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1943A4067D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1943A4067D
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1943A4067D
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 10:38:40 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-62fd0d29e2bso8072579a12.1
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 03:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758710319; x=1759315119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pFRaJWzkc5CmF5wyd4IYkpyIUVfF+Iz3skNuJDSE2mM=;
 b=RDrBiIYH1/yD7+vvS13iSW2hIvPKbxWxoUoX7T3TmTue+jl69i8M/6cL6MrWHdBQ1N
 JA+O4iDIFY9kSKPQ+boBXhmUryUYMdS0LdocAEIrN5mbxRNYRFDhDR7l9qCbgSlEnazx
 28ZJZF38LLyRS53ZvXf6MgDAFPUTLaA9wUZE8kOXznxHi9lbiSKy+3WD4rf9GFvgY1Bz
 ZPXV/jiEjn4BT5NOWEl9lmOk4jzIJf2b7h2bzPzFWDrQGc9c6PM4AIvUtZOrbnayPwMp
 iPwCX/JOD4s+0yrIjX8O8/YD9GaNVXm7aKiQNvT8VL5eAo3AVPysdc0+85vgDTEzpOyn
 9QOQ==
X-Gm-Message-State: AOJu0Yy5dU8PPDy1H+8jeJ8y3swzXcEYyP7i7J1G4Hzp8Jo2Is+r54ac
 IsEMATdrxWtdQvVLZVDABfJb8zouysI6Xe+BEEP7QLhXloX2cSvt+AI0Mul6lu/YYe5BfsJWavs
 +VH7C
X-Gm-Gg: ASbGncs4+tEHQ+OLVsR+BTekFqo/lH68G3XGf4Vaq3mheUbIYRl37Fcc+nh02HtrPz3
 AEHAPWW87/f+h54slAB4DBjRn7tjKFgLI+hZMG6Y8EkJh/YdvkHUOk7A5hGbXKAekS2RrCUeNNb
 rhwyEzuNvE/d61T9t+UqXw8TNr5hHyJhEq0OVR478PhuC7IupInp1CmCB1uHZzAbGFhItsP5BUL
 skQKI78WTFrJ0ZkPZRQCcOGyqQgFPtw2p3zPKCMmt9LKFkgT9KLXbItx3VD8K4sYeCjgQh9dAMr
 hXo92GEkobjj3zYtDetsW74bx23HsPKsRmz1H9r+ZeLhXGujgBK0fnVDKrMS9nqOgyTiAjv6yR8
 R4FjSu4pOrBCQfjSuwvYGiqADkNItq8CPjM7y/J5AA42VYGx+9xBqLZ+zhXnkiO/l8BTFr5bRaR
 n00Ed8Zdc6FGZ01g4zXa8HUiwTDV0Xqd4xbOjdcnUtS564uwjcSX40A2nZCCA=
X-Google-Smtp-Source: AGHT+IHdoHteX+3zPcKm4Dq916gRPw0kzCBY5Em9/zcr2OMqHCD+V5bDqHh5itfKaWhIBklPnZX84g==
X-Received: by 2002:a17:907:7293:b0:b2a:70cd:5795 with SMTP id
 a640c23a62f3a-b3027264863mr531750066b.23.1758710318784; 
 Wed, 24 Sep 2025 03:38:38 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b1fcfe88bb8sm1480946066b.56.2025.09.24.03.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 03:38:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 24 Sep 2025 12:38:28 +0200
Message-ID: <20250924103828.2944967-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924103828.2944967-1-dario.binacchi@amarulasolutions.com>
References: <20250924103828.2944967-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758710319; x=1759315119;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pFRaJWzkc5CmF5wyd4IYkpyIUVfF+Iz3skNuJDSE2mM=;
 b=JC4Bvm6sXwHAzO+I6hXFFjA68D7jNpuWd6hD4Hj4I3hknxGsG+QtdkqD2lPMLNRJUB
 1Gtfcvv6ra3UkzeZkY6UihPZ6X0cwOJ2r9ioTCaG0WRbuqnVJs3ujMe6W1R2EXXQMAMt
 ELOHTasG6ebwSgRo0iuGkAVY7ZOqze3JIHTHk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=JC4Bvm6s
Subject: [Buildroot] [PATCH v3 2/2] DEVELOPERS: add Dario Binacchi for bc
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

no changes since v1

 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8403db636f72..9094973fdf25 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -807,6 +807,7 @@ F:	package/aespipe/
 F:	package/armadillo/
 F:	package/atf/
 F:	package/babeld/
+F:	package/bc/
 F:	package/cmocka/
 F:	package/connman/
 F:	package/iana-assignments/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
