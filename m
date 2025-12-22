Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C317E6ADF9
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 21:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33CC760AB0;
	Mon, 22 Dec 2025 21:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aqNDnFrbiXxT; Mon, 22 Dec 2025 21:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59B7F60B1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766440609;
	bh=x7mMOjEKlggaoYRm4LISMxqIaNtWuEMaxwXa7+z4w9w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NCKZ+u1z+gDkXiP/brTlOWbAUuSdurDkUjRcbwO2NOb/dFPugSc8qUQuDGhva8Mak
	 b+XrUbuCYYHWFnLCDAHb5apMRz6PJIhAUNyYSDgy/6nvwCKf5CGK3EMf+GRPxowo22
	 b8DGqtuUilM9EWOc18+cInFx2k+VOR5y2JTMs0t6waW0H3cPE0mNUolj23DabevkiX
	 O3usEWHKUsJPcRw0gKSpIwDRVNgYLTMk2TEcs3DtlmNn6oO4WLbxAZaJw4q001q2ME
	 Dmob1tWmjFvrzIJElshEg2LlmrfcYUr3LDaVCyJYQAmTdympkjnoJdUVX3f1v0sgMj
	 wA42qb+WdB7lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59B7F60B1B;
	Mon, 22 Dec 2025 21:56:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16E6525A
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0829D8144D
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OeE1eXfowNvO for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 21:56:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 925A381320
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 925A381320
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 925A381320
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:46 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so30397195e9.0
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 13:56:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766440604; x=1767045404;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k+gNLsFm8IDQVimTlm9fmw0op0oXP+8ane0fE0NbLSY=;
 b=pSQFXuWQajZsEmUPMluxC3p4RHTK6UODYVZwPb1kkv2kZzj0oTS5va/miFEeIr1gYE
 kRhlP1dov21gKwd88+9gSy6gJLwW9dYDe6HsXdtbgnCjuihgQ4IPoc7v7kqtG7M4Xdtb
 SMP9F0ZwTFf7dKo+3tgnp8aiZphfbxUmtPjPZwa9VIlZFIW+X8iynl4ltyyoOFFneO5g
 cT/b5qZchYTlnTNSj+B4tExr7ugd01PDuI8+0ODI/mYq7hT3qN7VUl2UAHyuHleS7qNp
 L02czQRUBOxysGZ0EP/hAGwhXFZB8vBBsZ1airyw2fzPB92lIt/4CSkHCXz21vfyCXqB
 xEFg==
X-Gm-Message-State: AOJu0YxEqbAyBsaEoLniOqtw7IdOnUQv7KEtRAG7UG89K4pIl+WW6ikT
 lQmY5mhAYEAtqCGCyM6dCTzw19zSBA+3+Fzt7dbwzq2v9mEBqE1dqRQYyAricw==
X-Gm-Gg: AY/fxX7wJdQ8x0g/4lVl4GzNznvG2s/MbASd0PjHXhiCQ1ujVijRNicqfGMS+9BE0wi
 FMZxOusijXTpCnxi7/GhWFpeXS3khgL21nbt7IpI/F6mjnBHgCcLCCcqbKyWjxfCRrrhrKo3gR6
 eROLVof3KVKuUrs4th1KtgGFbelexdLw6JH92CbUgVROktp4XzDc4AUAQDsa12jlincGCRhXaVo
 amikHLcNvRJzurlnM1F32Lbi6AsHI+gzNoCb2BuSaEVn4MysVuktBLr0mDy8QbKYuVTctbW7TtS
 UDWGDpuOogxMaCR8d8n5+e92eVqCo4+uJq7VoP73IQIDb/3fVEb5XoJuCxxAmp6uhZ68On+A50F
 zwDt6SwX840zMvOU2RWeo9rRaHbqJOxCXMQykkRwbQwkp8rlHQoasguI127ehjLrF3cxBDAJBrY
 ufDQk=
X-Google-Smtp-Source: AGHT+IGOMNuGoQGj5thHbU7b/Rd1XSEcfnIH7nTVA4Sxz/qegFg7s50w8PJhMpx+K6vMU5izpDpcpQ==
X-Received: by 2002:a05:600c:46cb:b0:477:7f4a:44b4 with SMTP id
 5b1f17b1804b1-47d1953b78cmr139759605e9.1.1766440604224; 
 Mon, 22 Dec 2025 13:56:44 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:2fd5:723d:8ba0:877c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193522cdsm201207645e9.4.2025.12.22.13.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 13:56:43 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	vjardin@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon, 22 Dec 2025 22:56:29 +0100
Message-ID: <20251222215636.975668-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766440604; x=1767045404; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=k+gNLsFm8IDQVimTlm9fmw0op0oXP+8ane0fE0NbLSY=;
 b=TxyUL6gP1EU0CMCsSDcLZ4kOX8h6hDjRcRX4cx9B5cQpy1bQJfAEticlyxHyzGnUZl
 nykVBglM6AT5xHy04+jWZp+5ppeG0VqkS/f7u5oYl+JE9Wi5f9qMQBKT5QTGSyLoXllK
 lfNhIIvz1NuQFdW+8aLeWMTSvKVH0JgvdSHq8xzvbp9yySwAV5NLAxtnmxWPyPhGO0Lh
 G+5RSWeNyTH9GaBdVtvkuRXk+YRhiimIw+VSU+C5NAOd7HZjoL3Q65+59eC19ifr3elt
 kTYBlx+CD8rg9kWFrsPTUwSK+rHxMTPqZo46IRga+6wjPZMEx13yH6pDaRtM1YRmPOKh
 RtYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TxyUL6gP
Subject: [Buildroot] [PATCH 0/7] Bump libecoli and grout;
 DPDK packaging improvements
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

This patch series updates the libecoli and Grout packages in Buildroot and introduces several improvements to the DPDK package.

Summary of changes:
 - libecoli is bumped to version 0.10.1
 - Grout is bumped to version 0.14.3 and is now linked against static DPDK libraries

This series also brings multiple packaging improvements to the DPDK package:
 - Drivers, libraries, and applications can now be selected individually, reducing build time and footprint
  - A new option allows disabling target installation, which is useful when a DPDK application is statically linked against DPDK libraries

All changes have been tested in GitLab CI.

DPDK builds with selective options:
  - Libraries: https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2194482682
  - Applications: https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2194508748
  - Drivers: https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2194482682

Grout build:
  - https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2228823679

Note: the DPDK-related patches were already sent as part of this thread:
  - https://lists.buildroot.org/pipermail/buildroot/2025-December/791880.html

Maxime Leroy (7):
  package/dpdk: make drivers selectable
  package/dpdk: make libraries selectable
  package/dpdk: make apps selectable
  package/libecoli: bump version to 0.10.1
  package/grout: bump to 0.14.3 version
  package/grout: link against DPDK static libraries
  package/dpdk: add option to disable target installation

 package/dpdk/Config.in         | 76 ++++++++++++++++++++++++++++++++++
 package/dpdk/dpdk.mk           | 33 +++++++++++++++
 package/grout/grout.hash       |  2 +-
 package/grout/grout.mk         |  4 +-
 package/libecoli/libecoli.hash |  2 +-
 package/libecoli/libecoli.mk   |  2 +-
 6 files changed, 115 insertions(+), 4 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
