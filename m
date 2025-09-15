Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D894CCAC592
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 19:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EF0981197;
	Mon, 15 Sep 2025 19:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DlrdLuRcT9qn; Mon, 15 Sep 2025 19:56:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A658281194
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A658281194;
	Mon, 15 Sep 2025 19:56:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F31AE22F
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 19:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0B1860A9C
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 19:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HdB_8EjrcSU3 for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 19:56:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD93260A92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD93260A92
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD93260A92
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 19:56:36 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45e03730f83so21725735e9.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 12:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757966194; x=1758570994;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ghugM5Ao1Yu6pFIiD/BGo4zZCiiGcG4v4SAaPzK78Fk=;
 b=R0UtV2mrvBzCBmTcujj6+kq/KVA1bicY0k8FJNsMtxrtCIO/iBOrZ8eYiX3isYdgvH
 mLUzLwIq2/2KfuggtcTzjjUUJLQmuMKpn8/uUQaxC+zEDFfCpTEGNiyDsIu7bhjJwwBn
 M2ydH69LUCpgsw2KIPegIazeTF0/JaMF2E4jkb3GyC7sJry7+qdH/91GvdR3qed0J+sK
 qYuTrTuTJCP1pAeFurzWFyrhhtDPGdRfHTzcK1uU2V1V/VFcmGsxAVSB3ynGrSmvQOXU
 8DriKhbfRFpHiuW8uozBEZ4M2r6Hpi2JOT4afbf230HGtti6UPmMMOC9CKSvg5GZ8YQK
 l9vg==
X-Gm-Message-State: AOJu0YxdROakHjduwW8r10XfERALrEuXL1216hB/NxaKhBciFMDJYcts
 +mdGJ8HNkuIFcFhseXia8tf8++p+iMkXyrzwvXCkjSj2kZPHGAVwGyxt4G0piomAAA44VJp21Rz
 RpfD+
X-Gm-Gg: ASbGnct8JWGrJy5fi4MoKXcy/LrdD1db0qD62M71bGSI2WlpIsdmMbSZUhcP8+oMvzW
 UAk8uHvPXIL10kFhV2FlWcL4ZlDEFn750UeOytCxgmAhpcmAnTyhnsXkjwCLWVT0xXjh+2O74pD
 5j5e/oSspOQsJIg+ktQqUQxNsF6yy4zswoo1wgoudDOuRN20Q49U4K154BQa6MYpyjd2ld7MuFX
 1RdaB4kujlhiLwN9UUdcbZi1DnIz0JHtOnV3jToAvx6qMSJY2UR0YPq94uGH+cCgiOdt9DjUnYl
 K6UGRUAtZ+NvKVOQ9qB/qpw3Hk/mKO/6hlQvK2STtTq4U7nhJ2yuHk0rmHGUKbadRyC4ODOHQEV
 aigkvRHPct44QlgCr5WsA5IlOy+HBbwoxDgTcIEHX6qqGylTX6kKZI0/ro7DDsLVtnI/S8E8ccg
 ==
X-Google-Smtp-Source: AGHT+IE2SmqJQJy51l3od31wZ+OiRSYU1bgY1SDYtMB+BWrfpjA+VsRmLzTVp226XAF56LV3rfBcLg==
X-Received: by 2002:a05:600c:1c96:b0:45b:7e68:c6a3 with SMTP id
 5b1f17b1804b1-45f211faf9amr153192465e9.16.1757966194234; 
 Mon, 15 Sep 2025 12:56:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd329sm19078156f8f.31.2025.09.15.12.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 12:56:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 15 Sep 2025 21:56:30 +0200
Message-ID: <20250915195630.1711260-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1757966194; x=1758570994;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ghugM5Ao1Yu6pFIiD/BGo4zZCiiGcG4v4SAaPzK78Fk=;
 b=qFnRKMUiDOA+ydDV7MvPBihTpIcojacrnO54nPfr/C/3Upy+FRsFubAR108m+bFjRR
 ivg5IpFn2a85dRdXw1ieGoAofmTCpZ1EMl01YqwRaU0MStAmvA62RRDxsBoYJ8WbLB42
 VkhL1H/b8oDK7k7hXrgvWH/lQp+JdtbJkHuQI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=qFnRKMUi
Subject: [Buildroot] [PATCH 1/1] package/inih: bump to version 62
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

Release notes:
https://github.com/benhoyt/inih/releases/tag/r62

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/inih/inih.hash | 2 +-
 package/inih/inih.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inih/inih.hash b/package/inih/inih.hash
index 72247439478d..78366d64c120 100644
--- a/package/inih/inih.hash
+++ b/package/inih/inih.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7caf26a2202a4ca689df3fe4175dfa74e0faa18fcca07331bba934fd0ecb8f12  inih-61.tar.gz
+sha256  9c15fa751bb8093d042dae1b9f125eb45198c32c6704cd5481ccde460d4f8151  inih-62.tar.gz
 sha256  9ae3b39e83e9158e44b67733baa3bb2d84e80efdcfb14a5820210a42c7abdf7f  LICENSE.txt
diff --git a/package/inih/inih.mk b/package/inih/inih.mk
index 1607ccc0f5a5..4d9a8c03ab02 100644
--- a/package/inih/inih.mk
+++ b/package/inih/inih.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INIH_VERSION = 61
+INIH_VERSION = 62
 INIH_SITE = $(call github,benhoyt,inih,r$(INIH_VERSION))
 INIH_INSTALL_STAGING = YES
 INIH_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
