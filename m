Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C1BC3DA6F
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 12:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42C0083B0C;
	Fri, 25 Aug 2023 12:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42C0083B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mJ_MxdFxuMgP; Fri, 25 Aug 2023 12:42:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98C2283A7F;
	Fri, 25 Aug 2023 12:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98C2283A7F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AD951BF36F
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 12:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63DA660B83
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 12:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63DA660B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DFlRk-wuqcJ8 for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 12:42:06 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1428960B68
 for <buildroot@buildroot.net>; Fri, 25 Aug 2023 12:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1428960B68
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-68a529e1974so707330b3a.3
 for <buildroot@buildroot.net>; Fri, 25 Aug 2023 05:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692967325; x=1693572125;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ce2ufPFdKC4MRy6hsWwlCPYBCztlOD8BgZu872HwmW8=;
 b=FUBpgewUh2EzLX02CkYq5/mKc76hBuBBHUdqSZvZeRP47IhwC/Pa8jrUPQkzIk3fIY
 LK1G9r10Ep5qW585g8pKtkDq3M8KJKu2aVNZJRDMydE5MN4C/gLjgN9QXX85u8UUMTSn
 Tbhx1he2vFVsd/kZr1O4+xVoAYZQkLH+bVnuML3SfESfAKtAiHI2LQM0qXx8/efXCI+E
 EsIUU8Xv5j2td36DkooKnOs4FGMUx0NscU0QfQPZ80wabA3+DXblzWD10yZlCW93EGPQ
 CV1TIZdfnWKXw+DqmVjtqYhbiKu5H6X4WY1Y6/PvjOlhXz2xX9ODwxtXuQks1fV06C8R
 5lfw==
X-Gm-Message-State: AOJu0YzhUbLpaBgLidenzAnfqOnGDFJySqkuc+PdHkgzORS/UpvabSxm
 +nRcJueq3rDgAMRtqLPBtpzzi7mGWoY=
X-Google-Smtp-Source: AGHT+IEVmZoBIS5PL9m6R8xklCK/QFofCZkDllQN+PQyvBYu/LoOyJgeCSZMSPyvtcSyIdePoU+D4A==
X-Received: by 2002:a05:6a20:13c6:b0:14c:682d:a10d with SMTP id
 ho6-20020a056a2013c600b0014c682da10dmr1735814pzc.23.1692967325133; 
 Fri, 25 Aug 2023 05:42:05 -0700 (PDT)
Received: from debian.me ([103.124.138.83]) by smtp.gmail.com with ESMTPSA id
 w1-20020a63a741000000b0056c2843d80dsm1421955pgo.10.2023.08.25.05.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 05:42:04 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 3C33681A1A74; Fri, 25 Aug 2023 19:42:00 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.net>
Date: Fri, 25 Aug 2023 19:41:39 +0700
Message-ID: <20230825124138.294317-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496; i=bagasdotme@gmail.com;
 h=from:subject; bh=T8yXEgwIgmV4uo2TSltoVK36+JOHrXjctJDWFzUJaMw=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhpQXC5tLXs2defdICnuGDsOFVe2mc7pLlk5zvb/y46fpk
 wM2qOWJdJSyMIhxMciKKbJEr5XdZcy795JZTEIRzBxWJpAhDFycAjCRL6cYGZ6WXA7qjnNf+utB
 qwin01bVr7L3q1fuYkjaI2Qvf9vtwTFGhg3cQtFBEnO1jt875Vut2XelfMPzAw/ibt2NVvwbGtO
 1mgkA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692967325; x=1693572125;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ce2ufPFdKC4MRy6hsWwlCPYBCztlOD8BgZu872HwmW8=;
 b=VRUIqRtvLRyS2lAGPAIbk9Tni2Lri+uHJxyS9lpH7UOx/Hy0vavhwEiyq0PrPSz89f
 GudtaUqHY/ZQmOVGwqc5SoXPKqiCbnsnw+EtfeQDfgYW4l7Uz6ahBCzgtpSDY7QCV3eG
 1+zaYCBiHk7U5nNXuHAXVFltfUCFCCLjIw+anpkh+5zoZ9vjmN1bvCMZzKVdAst6jAMN
 IkI+CSQQBLnjL/LRfttMFW8cLST21etihr/u/tbIqlW9B9DsfGRxrf3ryCiEVTw8IJL6
 D9X0MPMX6acco/+tp2a/Eq+qB/ZrDEcZX/9uKZQ7M/Qv2vaywTrjahjdi8SFelgK0cVo
 n9Vw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=VRUIqRtv
Subject: [Buildroot] [PATCH] package/git: bump to version 2.42.0
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the package version to 2.42.0. For the full changelog, see the release
announcement at [1].

Link: https://lore.kernel.org/git/xmqqr0nwp8mv.fsf@gitster.g/ [1]
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 91d723ecd1..d73778ad85 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  e748bafd424cfe80b212cbc6f1bbccc3a47d4862fb1eb7988877750478568040  git-2.41.0.tar.xz
+sha256  3278210e9fd2994b8484dd7e3ddd9ea8b940ef52170cdb606daa94d887c93b0d  git-2.42.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 99646b10dc..853ec256a0 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.41.0
+GIT_VERSION = 2.42.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

base-commit: 87bc648720bb4e79ac99beff8a807019ac930233
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
