Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382BECA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 09:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA3A8606BE;
	Thu, 28 Aug 2025 09:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBJ7KRiPc7ua; Thu, 28 Aug 2025 09:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1113760716
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1113760716;
	Thu, 28 Aug 2025 09:23:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9165F17D
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 09:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82024606BE
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 09:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YT4Jb6ITTsl4 for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 09:23:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B04FA60034
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B04FA60034
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B04FA60034
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 09:23:15 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-b47475cf8ecso512171a12.0
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 02:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756372994; x=1756977794;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d2JbqP/CQmEoeQr3pt3tKfa1WOYUSPmnHYID2qrBPeI=;
 b=Oy7usGGFstHvZTmGZN4FUdbAQQ4Idtqrswj1q5nofp3MpQz1CTkqGene7bzG4WtTxW
 lknbDfMoDvx5h77o8oPUhIOpBGbdOfX/sVra7yFQW3+vQ4rj2p7Nj6L9neuB9oC4e4gC
 q57Vn0PcigJej5Ra8lL7Qfs3BuaGZJwmSF1d4ig2mOOcgmdAngwW8I+j+bo3oaru8uLz
 ehEaQI8os7vE5jCulzRFIngsqVOugBQMWrH3V1cyIJsCRe/yqyubBin6SnYQGXdp6qDl
 vD1J+aMC1qJGYSRu60MX+jxvFVUvcOTIJ+Jz7PXyFu7ufMujiZe8aYHlASrSYvW56Pqg
 HSSQ==
X-Gm-Message-State: AOJu0YycWN0L01jcxrGF8/0WEm0/VJJPaJWlXobvSJSgAvf9agk15onH
 dYrTHSLXBqumKo2V5U28U4Wm3rF7ROZ2i32xyDquOQdn6rKmFndbXJFbx+bK++0n
X-Gm-Gg: ASbGncvzSmXpXURNygOBjiAzHP19SRmFP5KPqEZyI6FxTNc5f9P6s5+oIZ+Vi1UoU+p
 FUpvWSx04AU4AMVkHy+JCc/bpR67XrMUwjsjqURIDuy/UW08m6Ep0OuM5g1Hi84D/b6PFzjF6nK
 skPCDet48Keh89UBLe3DpZagML5tmd31P1L5mDT+4b9/cvRcfoYIHKOPwiJ+tNAx69oxtcEcPvQ
 TRxG13hkqZe4TUPPuyzxXoqU2QudG83wD89NizddlK40j5+beOwgyV3iXpwOoDRastkNGI3zEW9
 33puoeZCTNwqEofC5NdFPjA81nYU8iM5KHSsW9VXasiZ02dAIIoHnz1UUwZU6TgekCP+qkxEyGQ
 joWYbfNEqtmna3AmP8iPAutwnhQ==
X-Google-Smtp-Source: AGHT+IGLPx7mYh3UwsxtrLsB5j4BOMoSzxvQyFuJR1qJuFjAvpa8nCKxhXyw71euCVDfO07MhIW0Gw==
X-Received: by 2002:a17:902:e5cc:b0:246:7a62:e1f3 with SMTP id
 d9443c01a7336-2467a62ec2fmr242831145ad.39.1756372994249; 
 Thu, 28 Aug 2025 02:23:14 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-248e3e0b73csm10252625ad.132.2025.08.28.02.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 02:23:13 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id EB4DC409B726; Thu, 28 Aug 2025 16:23:09 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Date: Thu, 28 Aug 2025 16:22:56 +0700
Message-ID: <20250828092254.316696-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443; i=bagasdotme@gmail.com;
 h=from:subject; bh=/QZGJyW1Ux55HibMmy7yA7r6f+sBdJj/R/NOIRb7Pfw=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhowN8u+T9DesfRF2xUrHRfbA7qcG8vm6nflhc7KvcUyc/
 S9Z28Cno5SFQYyLQVZMkSV6rewuY969l8xiEopg5rAygQxh4OIUgInc3MjwP/TuquJQhhezzVZ3
 3JnhsX2TxB/RScVngisKeH4s7lR+UsXI8MW+qlZtiy5/wYcb88XZLbVtrodeMSnp7LnIGepy6kw
 nEwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756372994; x=1756977794; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d2JbqP/CQmEoeQr3pt3tKfa1WOYUSPmnHYID2qrBPeI=;
 b=GuRArTTzifMeib8aVQj+I1Qk58FM+sQ4W8tN3gbPyVISsPxFaQK8/4a1+BriT4R+zt
 BTgt1n4dVyK3nRU46qjMuqUW4D5TyvV5RFlVtxTNqup51N/MCpKXocgKcoNyTMsoQUj9
 JABLpxsXvJIhOdxKbQ2rzpVm7e+6GkWaLhcwbf7xLwT70DgtfG2Pm2gQl7oL6K7yCCHf
 nhlL0qoGBvcCHKim9Jkw2FrYFARez0R/xES3Rd/lP8/KkTwAaVc5praF6nP32ocg3LeD
 geYZ+EkZF63Eqla0HK23e2onAV1c0YSC38e0M9k4k+DgG0kTbYTcaJfSv8nPrVwVZp9c
 +v2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GuRArTTz
Subject: [Buildroot] [PATCH] package/git: bump to version 2.51.0
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

Bump the package version to v2.51.0.

Release notes:
https://lore.kernel.org/git/xmqqikikk1hr.fsf@gitster.g/

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index bbd2b4c754..19b212cd0d 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  7e3e6c36decbd8f1eedd14d42db6674be03671c2204864befa2a41756c5c8fc4  git-2.50.1.tar.xz
+sha256  60a7c2251cc2e588d5cd87bae567260617c6de0c22dca9cdbfc4c7d2b8990b62  git-2.51.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 8cbd2787b2..a01e7c9d53 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.50.1
+GIT_VERSION = 2.51.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

base-commit: 56d9d5e8f0872737fd79abf6a60e66920bb7861c
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
