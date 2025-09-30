Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6991FCAC5B8
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 17:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2539440DB8;
	Tue, 30 Sep 2025 17:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_TzGayMyZct; Tue, 30 Sep 2025 17:35:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4363F40DCD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4363F40DCD;
	Tue, 30 Sep 2025 17:35:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E73F5111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 17:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9447818C4
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 17:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkBCyBEY3k0w for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 17:35:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4BE08816E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BE08816E2
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BE08816E2
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 17:35:05 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-62fc686dc41so6217682a12.1
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 10:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759253703; x=1759858503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=drto53XMp8yh9+xF9CcqrNHccgT9TAWbzdVhXhApAaQ=;
 b=fyu7oiq5arn38zWeOdtz5wMzg4FYA2zMgKkDWMPjxHNKg49Xp1+TH/SINleyUb8uL2
 3TUAggOFEDJ4XpTK7wtRqaXEaKainH8QBS/aMkmBE6g52vjBrLuKeR9PH/HnGjEDWP6z
 5cMNm9coU2Is9iuWtpiOsPXOSScD8SWNTqX4tAqWTFb68mNvJMhhHWBD1YmlW3hAhNnT
 zHq494HD3zaWmEAS3EbRtTZDxRdVA33OtuptJinD325T9sQJ6jidQqnp88pD9GiGmt5I
 xv7FWIi3JkWolymcGzAu8kbNAq1gJWkJY2EZsXCQIWinKvzfadx4l4peaHeoekOUdHxN
 Z9Dw==
X-Gm-Message-State: AOJu0YwtKlaD6vF1jswfIb8HZS2uCEvixKczJbojho5xbEtlvBgNqVFL
 7M83+CIZi9oN4mOoSjx1B64vsjws5wd2bhVqrQUehAst+e0ZGyO1oDjreIrES5SvgtiXb81VUGP
 FPto4hNE=
X-Gm-Gg: ASbGnctyUjuGU55iZ5j3afabMAyB9k6W/eoNlZQxphhc+jC6oVwCaG6wQO7zNvez3Ur
 ufRf0GIysH/EhPDBEy50z1Kn3uo/TX4KJnYko1Q5w9EPJmTUi0h2hCAzrgDHZDYjE8h67FxXV6a
 3g5fjTKJCRp7mxW3in5uHqu5vh7ph2dWmpOdXTbnNkMYLcUazTY4848vVqAHo97wQ+LMzzlV0gn
 6OPPDRg7bs59PsbpP9KqkcM2sMCRDuhsYQWrNdAnCvTOZsF/2ERAB7rkxR0HKQsKmifCLRYV6Y9
 CS/SOekzxgP38LAJ/s0sMtY42pJmUQuEKQgkKE8VHvhRwbBPfsVreDwg2u0nB/vl6e1qmNTrXc4
 W1PvlxsQbGkPfikMuSeVrYnf/38i+03GCzUDbaRu+2zg7cztrF3Sp10bF5iLqCgic7pFjFFAEui
 lAwcJwcnxu4/LseBmbbFrY0dgUGqdVNyFtELA28pfDrZqEgXoA9tuGlsvFNtJL06gtEwEFC/ZtT
 xnl9fM4jePu/hG2Fteu2+8WKnv5bWfVQRUd
X-Google-Smtp-Source: AGHT+IEcx9NEIxkCZsjEsqi10ueSBJwIrvnNlBkHJs8B4B3zZBZmx8tJfrQMBP1Dmz5zb2hHWaxvqQ==
X-Received: by 2002:a50:fa92:0:b0:62f:386d:aeb1 with SMTP id
 4fb4d7f45d1cf-63678e331ccmr575485a12.32.1759253703138; 
 Tue, 30 Sep 2025 10:35:03 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a3af4fe7sm10419920a12.39.2025.09.30.10.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 10:35:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Gao Xiang <hsiangkao@aol.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 30 Sep 2025 19:34:59 +0200
Message-ID: <20250930173459.3792043-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759253703; x=1759858503;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=drto53XMp8yh9+xF9CcqrNHccgT9TAWbzdVhXhApAaQ=;
 b=X2kqaWv5WOoOHuSfdm0+BkHH97H0X2cfc+LyXKBRfdZVkaV/s4bYdMEk9Lxs+XCiid
 VAAlEHb1QgDvX7OjiEC7q21mrvQ8OaGP/dr8Du5j6aEy24EuSufUhdlIeC1lB0JxWJW+
 UzXxODhN+FamNpVsJL+OcItW8/0pGGxepPSyI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=X2kqaWv5
Subject: [Buildroot] [PATCH 1/1] package/erofs-utils: bump to version 1.8.10
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

For a change log since 1.8.5, see:
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/ChangeLog?h=v1.8.10

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/erofs-utils/erofs-utils.hash | 2 +-
 package/erofs-utils/erofs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erofs-utils/erofs-utils.hash b/package/erofs-utils/erofs-utils.hash
index 04bdd557f892..4e59e55af07e 100644
--- a/package/erofs-utils/erofs-utils.hash
+++ b/package/erofs-utils/erofs-utils.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  cd8611270e9c86fe062f647103ca6ada9ed710e4430fdd5960d514777919200d  erofs-utils-1.8.5.tar.gz
+sha256  05eb4edebe11decce6ecb34e98d2f80c8cd283c2f2967d8ba7efd58418570514  erofs-utils-1.8.10.tar.gz
 sha256  0df042de29b44887355db86c79708a4489ce6e6666f6e33ad02040293f09e6a2  COPYING
 sha256  a400f85dd06d230f1b308cde4290a53f345b6e320a376b7904b31c51c2fd4b1a  LICENSES/Apache-2.0
 sha256  feee3b3157dcdf78d4f50edefbd5dd7adf8b6d52c11bfaaa746a85a373256713  LICENSES/GPL-2.0
diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
index bfdcfe58eb8a..de3c97cbcabf 100644
--- a/package/erofs-utils/erofs-utils.mk
+++ b/package/erofs-utils/erofs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EROFS_UTILS_VERSION = 1.8.5
+EROFS_UTILS_VERSION = 1.8.10
 EROFS_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot
 EROFS_UTILS_LICENSE = GPL-2.0+, GPL-2.0+ or Apache-2.0 (liberofs)
 EROFS_UTILS_LICENSE_FILES = COPYING LICENSES/Apache-2.0 LICENSES/GPL-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
