Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDF8C02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 07:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03A8E4073D;
	Tue, 18 Feb 2025 07:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UaJym-nTdPNp; Tue, 18 Feb 2025 07:57:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D02BC40753
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D02BC40753;
	Tue, 18 Feb 2025 07:57:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 74651E05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 07:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57A7B8218B
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 07:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zibPgvImBvON for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 07:57:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2765881329
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2765881329
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2765881329
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 07:57:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38f325ddbc2so2382078f8f.1
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 23:57:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739865457; x=1740470257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OZA6CMZDLgbv9O+nXKt52hy+PomuaCji4ysEaAFvtxk=;
 b=nYWOyqlLZaHC9jloW3QqQxo5YVCkOq/dFRsS63uKXpFaBof8ceSpQ8rH+p9m/ZouG0
 sDXxLTqHQmEtfuJJaib+ZLZjukFKsq7QfNh3UKx1Nv0Kh34EnrcO1wUDndJlZbJwMsZH
 ZpptELV/toZcYL9OfCGMrqSrJkVf4VB2hbAQP9zfHUyR6U0A5SBHc1E718oxkRYEPT6b
 fJuz4gQnKVGrtk22Kq8rIvl908pwl+Z/giEnmwJ+dYYDg9y+8O3L+rBX4Kj9iUKDXtOj
 M4CQD60M9ZJm6JCQydsklUdIaVogrgrT8Dj4XqMlywQN3B3ViT1oyPGSdg/ZfB9POpBf
 BWhA==
X-Gm-Message-State: AOJu0YxzIKTjCksMW+ZZ2QkxmNaNaYxassrfvS6hDWV3FT3zI6TZF7cP
 /xufuFZDwDYTO1K950K0TFJoeZh0bvTjT0/y6U/r7Hu8fv9CX6uWb3WesQ==
X-Gm-Gg: ASbGncs6zVwkZRql4HeHzZC+e3ExCxbr6nUrmlYBOGsmVOnpap3wFp+6/TM0wuRF4Iy
 Lu7QjFWKNCdJjAeHrVoChwS+8daqIUvzrCWF1r1OKNHXQMIc8EoN3y+7L4ArAC9TPj8K3nZZy2a
 aM6GTB3FjYgZtrFcSc067eYwn+m3oLqJ6s1rb7JyBVV+gJtI7icJ9OMXoznLaov4uTQ3l5qz3K8
 APWSXdTQq7iUJ28aB81q5CSTYtzpeLbLzcVBYtK75ualo2ee3VyUUbfRqY5CWCy85ZbS6ODpKxK
 4F/Z8RtmshihOrZxag9YfhnwiA==
X-Google-Smtp-Source: AGHT+IELEIf2tVSjYvMEFO1XOlvvg8d7zwReZ4ILooFJQ/LeFANM7X/+/fCFui997wePf6Xq8aVCpQ==
X-Received: by 2002:a5d:5f45:0:b0:38d:dfdc:52b6 with SMTP id
 ffacd0b85a97d-38f340677f7mr9090381f8f.37.1739865456858; 
 Mon, 17 Feb 2025 23:57:36 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258dcf08sm14466657f8f.36.2025.02.17.23.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 23:57:36 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 08:57:35 +0100
Message-ID: <cover.1739865449.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739865457; x=1740470257; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=OZA6CMZDLgbv9O+nXKt52hy+PomuaCji4ysEaAFvtxk=;
 b=VfsfkPv5mwLNwpLIcDRaq7OgA76EKE4Lf0WpbBXtZptpfq491OrZdP5E1cG5dGmbaD
 tetRXv//82zYV1J4BT5R6c9g5wQf2sigQvZTuh/DKD/uRWCjV20Zw5wgcQwSGF/Qh7KR
 xTTtiO6Ujj82yKUYCy+Jb5Li706mBCozQNV7pgAwlJi/QFAyHrCtBomo27wQtMkahP98
 gmsySrb4s0AN1rgTTHhx+UM3Q+494EWbq9KG8mvO/UmdawHCtTTe1cPtpfFbuhH0+C3l
 xGFQu5nsfefvD7PeBX4HLrQsmVQ+GTqQIOl5/jw1uH8TElBJ6szpEj8FIAK3d1D/Um2r
 /0dg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VfsfkPv5
Subject: [Buildroot] [PATCH 0/3] utils/brmake: simplifications and cleanups
 (branch yem/brmake-docker)
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This small series cleanups and simplifies brmake to make it usable with
docker-run like other commands:  ./utils/docker-run ./utils/brmake

This is a follow-up to a discussion with Arnout when reviewing an
unrelated change ([0] and replies).

[0] https://lore.kernel.org/buildroot/4876bbc6-4a3d-4b07-9329-7f5d4e9cf3c2@mind.be/T/#m5ad1cfae86426b29ff6f15fa0c643be5a0c70de6

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (3):
      utils/brnmake: drop use of unbuffer
      Revert "utils/brmake: add option to run in docker"
      utils/brmake: simplify redirection

 utils/brmake     | 15 ++-------------
 utils/readme.txt |  3 ---
 2 files changed, 2 insertions(+), 16 deletions(-)

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
