Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0D9CA0EE6
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 15:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BED56402B0;
	Tue, 19 Aug 2025 15:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_Lx-p5-rN6D; Tue, 19 Aug 2025 15:08:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0186940BF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0186940BF9;
	Tue, 19 Aug 2025 15:08:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC420E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92493811FC
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIiyhJQlKL3g for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 15:08:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D227680F7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D227680F7D
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D227680F7D
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:08:40 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45a1ac7c066so30926055e9.1
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755616119; x=1756220919;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EompyGb7bLNrMYlfhFYqNZVLRJvjbaMTv7oIghsKDfM=;
 b=AHt54ByKE1hOdAMXcFeamH9/WwmE2LEw7ZuewxUa46/eyKkFcywKYhLe8DVCosNCKG
 Vcd+ZTnFNq1uMcqWNOWnCmDGZuQlaetwbf0F+gjoFfCqoOoMS2/1UcNv68jvePjLj/US
 8icpHDquazY9CF/87S6F/5eZKQv7gT9GUd9495nGV1vmUy9v4vmN3XuowZKP1jLhY70W
 +WSHxS/nBhj3X4uq+uwW8kPE5tUk/wjFPYYlCpriXXj5cAp7GCMcNpLTZwH9rsZP9BXL
 d8rd+b0kojwHSA56kPI/QOPKJK6xSH+hl2QucvsqW2tKdpBxWmAnCsQWycwAiXvf5zxC
 yC3w==
X-Gm-Message-State: AOJu0YzO0v9yUJmzhrbI7Mvgq0f1+TR83hohR4CtAhZYrjbr4oTBMN/y
 k1z/1rHB3uH+PKoL4oU9zkV4rtcyzUjzUHoWCnmETOMpirk3VvSRb/Ux+FFQkAuW
X-Gm-Gg: ASbGncvo/4ADRinG+wDehBsCjFZirZuHPr3NmDMhN5n0uD0KdvIk+TdgxWgRknhtXVD
 QRQVyXb5BOLwLno+gr+tpSkRqOVZMgJp24FJ76DdEUlPJ1M1muaP7BGdfCpm7k5nsPoYrdNZMhT
 07qtuLdl5X/v32Q8dnyYeiupNEHyRW7z00CUrLaOy99lkTxfY1jI71+5Evv2/QLUCjfh5OU4TE7
 DxHDcWRW9/n9riz/eINEbkY7J4U1e/RpfSMJ/Uo5fmXJOpAxM7lg+pZMnCYOw3HlCcvdxcTlVwu
 U//jfG9d4laWF9H7lTWPqr/pF9Yl9ET5zULSnn55a4TJZ7Yhkr5wI+iZnUvU9rKjs7Kgxa3QsaW
 4DOIvMPqNUaNFZaJuDJF1ct8AsRuOjf9Rgkd6lYco+VS6wA==
X-Google-Smtp-Source: AGHT+IFxqX6A++6BG7w4K4kXNEbDWvosGNqmlvX/YmFsoL6034zCclQHt3x93EU1Pz7ajC45EK741w==
X-Received: by 2002:a05:600c:1f96:b0:459:d9d5:7f2b with SMTP id
 5b1f17b1804b1-45b43f9fd5amr28451435e9.16.1755616118395; 
 Tue, 19 Aug 2025 08:08:38 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c61a66esm216675995e9.0.2025.08.19.08.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 08:08:37 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 19 Aug 2025 17:08:29 +0200
Message-Id: <20250819150834.1651775-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755616119; x=1756220919; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EompyGb7bLNrMYlfhFYqNZVLRJvjbaMTv7oIghsKDfM=;
 b=itC51VVkQdv9gM9jMtyq8ULZqeV3/uN3hohdgvbRLR/ZFdC256eh2KbPvyYvB45PCw
 ekfe4N5/FsSMD8m2FrNyBR1VHZu5v2H7JpJKrpK9cGow1KkJZHbrR8JANOIkI/JJRFiK
 mqMPFVOR1MSEKAcN8QNtcxSgBwaP6HRBtJFGOEeYuEVico40QbYFqX9tXTAlQLqigroS
 jYgl3NWxjFHJLkxCycjNtETJaXklO1nXji3XeIwAzckeOcu5JpFJZJzMUEyADdrkDJ+F
 egnw/x/ZD4Q1uJdO/Ukqvn+PMGbs+cfAeHtT+I9cH2/zX2tHuKscpB8s4GIBw8yH1Rmv
 s1Hw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=itC51VVk
Subject: [Buildroot] [PATCH 0/5] Bump CUPS to the latest version
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

CUPS went though a lot of changes lately, therefore bumping to the latest
version wasn't as straightforward as I hoped.

Angelo Compagnucci (5):
  package/libppd: new package
  package/libcupsfilters: new package
  package/qpdf: bump to version 12.2.0
  package/cups-filters: bump to version 2.0.1
  package/cups: bump to version 2.4.12

 DEVELOPERS                                    |   3 +
 package/Config.in                             |   2 +
 ...ecv-instead-of-system-CVE-2023-24805.patch | 208 ------------------
 package/cups-filters/Config.in                |  16 +-
 package/cups-filters/cups-filters.hash        |   2 +-
 package/cups-filters/cups-filters.mk          |  70 +-----
 package/cups/cups.hash                        |   4 +-
 package/cups/cups.mk                          |   2 +-
 package/libcupsfilters/Config.in              |  34 +++
 package/libcupsfilters/libcupsfilters.hash    |   3 +
 package/libcupsfilters/libcupsfilters.mk      |  93 ++++++++
 package/libppd/Config.in                      |   8 +
 package/libppd/libppd.hash                    |   4 +
 package/libppd/libppd.mk                      |  22 ++
 package/qpdf/qpdf.hash                        |   4 +-
 package/qpdf/qpdf.mk                          |  26 +--
 16 files changed, 194 insertions(+), 307 deletions(-)
 delete mode 100644 package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
 create mode 100644 package/libcupsfilters/Config.in
 create mode 100644 package/libcupsfilters/libcupsfilters.hash
 create mode 100644 package/libcupsfilters/libcupsfilters.mk
 create mode 100644 package/libppd/Config.in
 create mode 100644 package/libppd/libppd.hash
 create mode 100644 package/libppd/libppd.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
