Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B469AC87FCA
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 17:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AC0A83C0C;
	Thu, 31 Jul 2025 17:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewjFEd35nH7F; Thu, 31 Jul 2025 17:29:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A311C83579
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A311C83579;
	Thu, 31 Jul 2025 17:29:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B27AC168
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 17:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFD4883579;
 Thu, 31 Jul 2025 17:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFLOjrvjbnE8; Thu, 31 Jul 2025 17:29:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D2778328E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D2778328E
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D2778328E
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 17:29:36 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso6062445e9.2
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 10:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753982974; x=1754587774;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sLY7ru7IG/Msa4bGpGXjFif4QR/dOwmDqqbnzK4X5qE=;
 b=J0VCC3/mLMvyRhrOXoY2n7mzLaIp4bT3Wq+4zsciLzTnj0wbRes/iufEYgbTVs2NLu
 Uidvq7Arvx8ymyKj9DvqRhZeCrP8TeAO7d23umwq+3lhoS2vh3K7DNsf3MYwAFpxsw9G
 +2pXChcnC0YogDAzow2xmY3L0oQmuL+7iUzZFo7v3qh6SFuHTHHJleqDTS8IjEdbw/D0
 FhE9n3SL+rFqekjxjdBP/QpUwFAbTVTCi2sgHPONVf5sLT1QsRXceIejJDX0yCMT4K6k
 2sj2ak1QJuZD7Yjd2zPmBvRuFDJGTLzAm7+ET/ZQcMB8Sx7NHLzH1Du1FW02MquaaSNy
 Oq0Q==
X-Gm-Message-State: AOJu0Yw9C6i3eTSO4OsxU4AdRutBUA0ZM/l3mJG5kzVOfuAf3zOHXPAA
 3vzCiAjo6LvvaYkjOTVwIyNx4RfaH2bU6A85oRjJJnyL1cPsV287ic+Ryi3oGQ==
X-Gm-Gg: ASbGncsKoJ3NJE7bdicKjmzBOzl4rv5nRxALuCz2ZUHKqOczzOg5TJz6Bdm09jbzJVq
 qpzgU1mq49szcM0E1lh3og6xlfUQkwumlDPDzR2mx8vRC0Twr9NJYwPNkVOPXRXnguK/3FTY9Os
 4J+AnR//7E2NTUXBwEo7gyOtVTnXa0RTTGknBndhbXjk/+iQ8CESXovk7H+z9+Q7R/YWlt49oLN
 EnkIwFNpeuWLRgTUw+DxjL8vxxHPoSQoAtkXxhNpkJkEbfs/ImiAoh+lDnDAohJouCyIm9ixBJ6
 vdEbkRsoIX/RUdZPi4TS8ZgaVXdOYwF7Snoy/u65Rhnf3fsq/JgyMyTgSChF5xTEy/MXzusYe5V
 oFMSHTmUQGbvolX+4tQQkf/ZyIgvoviMa
X-Google-Smtp-Source: AGHT+IESyaV6CCIXZzNsXJ/G5lwyyecyUgHgLMetV6HuMk+rOBDFlk4wNpL1E4YFWwvMCICGsX7eyw==
X-Received: by 2002:a05:600c:3590:b0:458:a850:f857 with SMTP id
 5b1f17b1804b1-458a850fb4fmr4636625e9.31.1753982973909; 
 Thu, 31 Jul 2025 10:29:33 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45895377708sm70845115e9.8.2025.07.31.10.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 10:29:33 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2025 19:29:32 +0200
Message-ID: <cover.1753982959.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753982974; x=1754587774; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=sLY7ru7IG/Msa4bGpGXjFif4QR/dOwmDqqbnzK4X5qE=;
 b=T4s+A3yvlf4/iQK3D8k3GjMd62L9S/I0mawsqi25Lld4CNoT5RpOMQxgxzunw4D+Db
 Q88mT/IqY4eX46Oy7Z8cY0JWkWK1XIAkXmF1AjLd3oKvyzcBxBjZYZ8epD3QaiCY/JKw
 nucoDhrxHOFxme9sPKqoB5mS7zVTrsws6WU72bRobsrT3DqNNGUHTFfNgcomKckgn7Ll
 nY1UW5yQQBYyba1Rr8dvcSIjWW+qoYdjqlJGmzWZg+AxIrJEKWRU1U6SJg/LwXEEbBKB
 1teHTOwFrN08NE+w4kucBRJkAS8K9I324lsP5qJefbNJu4KatPWEVHL403xqKPfRnRrS
 m4Tg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T4s+A3yv
Subject: [Buildroot] [PATCH 0/2] Makefile: fix two bugs in list-defconfig
 wrt br2-externals (branch yem/list-defconfigs)
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This two-patch series fixes two bugs in list-defconfig related to
br2-external trees:

  - a long-standing bug when a br2-external tree contains single quotes
    in the description;

  - a cosmetic issue for br2-external trees without defconfig files.

The first is a blocker; the second is just cosmetics, but pretty
annoying nonetheless.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      Makefile: fix list-defconfigs for br2-external with weird descriptions
      Makefile: silence list-defconfigs for br2-external with no defconfig

 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
