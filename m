Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B030C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 19:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCD96608CC;
	Tue, 26 Mar 2024 19:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvVHBat1QPKq; Tue, 26 Mar 2024 19:05:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D016960AB9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D016960AB9;
	Tue, 26 Mar 2024 19:05:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCA131BF36B
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 19:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA29B8200E
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 19:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U30MEXXCKLFZ for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 19:05:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B2178200C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B2178200C
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B2178200C
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 19:05:44 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a45f257b81fso689035866b.0
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 12:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711479942; x=1712084742;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=48P/efEFlstB9JE/uvlwksodDWujhyPaNUCWiQ6eXIQ=;
 b=wJPfLotsqsYXGA2VzXUQ1I5BzUiN2kTqsdMOs5j5hStj1Qs1pqPSc+PjE9gmBS+se8
 uXWsOFYhNfQKl1ZJ2IlOG+ELuMuwpd7W0T2ljB/Fm9sY5V+Qwani9cC8Er97D2ufkT7Z
 sbxFLcN7HEL2Rt+gtfJrrW4Fvs3WS5pd7yPb7WKPoL1Ox8KTqypHfxNqvTqGYsEXgei/
 6rJLmUUtoMTR22wNRPhmvCxO4m+ZdZRQl6N9Ai7Tx469BHKopjoNTXEKB1kpo1qN6QNx
 5uCDO06MXCgtpltQPez7AutMCDHv2rqCvMPxYrRvtzPPq2IJy5PSVtJiM7z0/l6oSYV3
 Q7YA==
X-Gm-Message-State: AOJu0Yw3Wdy3TV7G8ibCxYB8UgLvTw/1s0fdKoXmxqziG+4/IiKEezf3
 7l4pVVWekj07ESci+STDLsNz/JP24EatReRFpQnMrKVH8OcrORcOYY5N1p8GIbs=
X-Google-Smtp-Source: AGHT+IGFyhC7koZLvv3ixR+HX+bDqKgaiNQgFhqJji4Y65f+90KIzNdSsJCVcbPyoIDYxjvz0gg0aA==
X-Received: by 2002:a17:906:5288:b0:a46:13d5:46fe with SMTP id
 c8-20020a170906528800b00a4613d546femr8076447ejm.11.1711479941588; 
 Tue, 26 Mar 2024 12:05:41 -0700 (PDT)
Received: from saeedkazemi-ThinkPad.abbrnd.local
 (2001-1c00-0b13-1d00-0b5d-5c92-af34-2bc1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:b13:1d00:b5d:5c92:af34:2bc1])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a1709060be200b00a45f2dc6795sm4521707ejg.137.2024.03.26.12.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 12:05:41 -0700 (PDT)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 20:05:38 +0100
Message-Id: <20240326190538.3708590-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711479942; x=1712084742; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=48P/efEFlstB9JE/uvlwksodDWujhyPaNUCWiQ6eXIQ=;
 b=nZNJ9EvxO86pZi4ezqyMNuHyL+etxwO/e36/PCHdCBQ25LDCE2trCs88LqcPAYe1gs
 y8AmzUGZBMPGf5tSiMljohGTwl35G5cs1hiPldTb25wLIG9W9gLI1MtCZpaILHFnYNT6
 C4EeUcWGednhVxbnevPHkeNXoBaBk8jep7rpaisQY+VSM5QbCg6lO3A4ti3bylXOqY3X
 KaRTsxUokfZmcgTufUHB8FS/x/QL8RK5fhXVKaZdhA2Jl+bFewQho1rxoFOBdgI6pJyf
 EIR9QwEi3bTzoEyRyX9K/Xnr3/0Fk1TKdSv8eYeGcF0aRwd7W7GJtYs7zML83KxE961b
 115A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nZNJ9Evx
Subject: [Buildroot] [PATCH 1/1] package/procs: bump to version 0.14.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/dalance/procs/releases/tag/v0.14.5

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/procs/procs.hash | 2 +-
 package/procs/procs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/procs/procs.hash b/package/procs/procs.hash
index a3ec5d2b75..93be601c6d 100644
--- a/package/procs/procs.hash
+++ b/package/procs/procs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  22d9ef44bf06bbd6d0d463a40678a1560a9125fdc6e6fbb5db294e05a174ea01  procs-0.14.4.tar.gz
+sha256  d90d350ebac64b6a5b2c89881421c27d266653ec1f4a6ed10e32892fe38d3c60  procs-0.14.5.tar.gz
 sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
diff --git a/package/procs/procs.mk b/package/procs/procs.mk
index 34e874a4f2..019e69a1de 100644
--- a/package/procs/procs.mk
+++ b/package/procs/procs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROCS_VERSION = 0.14.4
+PROCS_VERSION = 0.14.5
 PROCS_SITE = $(call github,dalance,procs,v$(PROCS_VERSION))
 PROCS_LICENSE = MIT
 PROCS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
