Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB61DD41C11
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 07:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66EBE60591;
	Wed, 13 Nov 2024 07:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8mcubagln2c; Wed, 13 Nov 2024 07:39:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D7DB60597
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D7DB60597;
	Wed, 13 Nov 2024 07:39:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3FB1E11
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 07:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFDC681336
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 07:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PZiKL0NrzTT for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 07:38:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE47681252
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE47681252
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE47681252
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 07:38:58 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2e9b4a5862fso3883090a91.1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 23:38:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731483537; x=1732088337;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=io6p8OakzGuviM+lFYV76uvXFXZhBWf21AQ8C2RYrio=;
 b=SvP/zUwXHsw7wr/ytpyG7A2bqheD7DxoXxWX3itXasxYQ518LXd61HWYw0sRatgl+j
 ZmCFV3xyRG63DqXuGYf2DhQsXrULNTd46N4LyOV7WsxpWaWYMrUD+88jzOzo+gu+AtGd
 srNu7hlR9B07pjL3cYqhQzGUI2nva2yXLnafBLMtgeeiRZ63Nd/Tb/h7Yj1fLkE8bFUp
 /U6spwr4PuNrnqHJmkh7Ke/zDLiYqoNkZeCHlExa9swnuJFf2aqERYiWfbCRSAA9g8oR
 xV/BMQPIfPZX4+ZXLT1iEG9v09xsWupGg4ulJlSUG38EluxrWQdH9GyxZBXnr2Xg8aiF
 RsMA==
X-Gm-Message-State: AOJu0YyaH//bYpQJRaPBvqj6p98GpQAk4iLxEPyGuAvwswc1HSI4yUr2
 Dogcre+qgz6SwCF4NVDhlaWcWrD6lsTiLJxKnHtDJgOag7nTb7w6cZy3gA==
X-Google-Smtp-Source: AGHT+IGzY76DnjjIPMIVPob1XCUkrUEsn7ofUiIWvplW78W/GGRkemNJIR7EnHsFHAu+w0+qn1Kw/Q==
X-Received: by 2002:a17:90b:2684:b0:2e8:f178:f668 with SMTP id
 98e67ed59e1d1-2e9e4adc5e8mr7022486a91.11.1731483537430; 
 Tue, 12 Nov 2024 23:38:57 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e9f3faee95sm783414a91.47.2024.11.12.23.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 23:38:56 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>
Date: Wed, 13 Nov 2024 15:38:46 +0800
Message-ID: <20241113073850.3185120-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731483537; x=1732088337; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=io6p8OakzGuviM+lFYV76uvXFXZhBWf21AQ8C2RYrio=;
 b=K+BPJhxzpzGZReWqOduuONwUX8C/0J6cM7azJZWsEwZ2p2cPfU/kQz8Y6nb6LyhUPC
 eCorPhzIRZsV5vl/43QOQ7jFgGap5g+V8Xgahi51Qv0H0XHO85j/EFeaIF/SqbsOjpZA
 CBGiiGchNMrc5pEh40sqvaviTgK1NBfsdgHD1/V+4GOODrI0aHyUlPFjQaIPPiEjmHyj
 Ed9E9HHu7yoKBarLlHXnoO9FOR3e53OmmVtDdmgNCIuYyBFeag39d70pCkaSdJLy2ddR
 euWiVOtOy7WC7irP2GY8joF36AEqWNQ9fLAwqgiQEUHVNQ2OoFJapoFvA0LCodDfX6lT
 kiMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=K+BPJhxz
Subject: [Buildroot] [PATCH] package/timescaledb: bump version to 2.17.2
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

Release notes: https://github.com/timescale/timescaledb/blob/2.17.2/CHANGELOG.md

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index f8b6b2c5a1..08d981661e 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6277cf43f5695e23dae1c5cfeba00474d730b66ed53665a84b787a6bb1a57e28  timescaledb-2.17.1.tar.gz
+sha256  b2fcc29e9975b88c5323aefb062346326694c391d52af46186f5a5ad09136d47  timescaledb-2.17.2.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 55a4eace79..c9dda67282 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.17.1
+TIMESCALEDB_VERSION = 2.17.2
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
