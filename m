Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D8BC25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 039BB842D4;
	Sun,  2 Jun 2024 20:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6m50wd_WRPzm; Sun,  2 Jun 2024 20:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5130C84299
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5130C84299;
	Sun,  2 Jun 2024 20:40:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 110351BF315
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1CB9820E2
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZEhtKhIx9tJ for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:39:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C8DF83131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C8DF83131
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C8DF83131
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:39:58 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4210aa00c94so32641595e9.1
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360796; x=1717965596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C84M+3JQced14KoZJRrr/p2t+lgR4PQVqdRFeupsGd4=;
 b=aoOwEkikgGfxCuY9zogpQxF+X+tEF5MGhUL/itY7d6BOjwC0F30pTb/yR/dtnGRAv0
 XcghkM0Tg2jJZaUSkMCUKm3iJEk79qihyGU7MxbNC6N4KAiOKLlCuLbDmqw1Lau5mUIX
 /q9AvRpggjKTh+eK7+jpw/RiOexG/AbxBziF/eKFZePbbR8CzH+MLFi39lduSVtDn518
 H6wZclq/EeJrnEJU6z42DMlRC1fjOmkXmhzpixN2OityFbR78Y9e/HNCHZrt6gRwkYjX
 RFk4Wp28JLYfjwKgtLHtwK1Fy+cU5XfUePINmHL8k8X0qqiNryCLukZJXjw52f4vf8OI
 1rJQ==
X-Gm-Message-State: AOJu0YxLPL0oWgyAAcM8k7mbSp9fIMDjm1C3W33qKKNUrNTPHNNmGSGi
 GN4WL25Btna3iIlmBX9DAmHZnMtTzTEYY1yVDcfaQQQ8t4KUpeUADUdyoA==
X-Google-Smtp-Source: AGHT+IEGQWleWdjzzeXN0wK+oZmIL+eHPyT1/jstGyH/VwcutL8VMj+J7DtxfdJnig/H6ujDRP1dzw==
X-Received: by 2002:a05:600c:1e02:b0:420:fe60:c387 with SMTP id
 5b1f17b1804b1-4212e0bfe45mr57431575e9.38.1717360796322; 
 Sun, 02 Jun 2024 13:39:56 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e0f97ba3csm6460862f8f.73.2024.06.02.13.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:39:56 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 22:39:44 +0200
Message-ID: <f70f17469db04963b51ba5867712b6c8ef564c10.1717360788.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717360788.git.yann.morin.1998@free.fr>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360796; x=1717965596; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C84M+3JQced14KoZJRrr/p2t+lgR4PQVqdRFeupsGd4=;
 b=W4on8zZLo8ll+cYw21VRzhAilfiICCGOu+1qDzh6NJdzrsQohleGaJZO0ny4p9rvPG
 beKncXuuU+xcR9gxYcC/fl9RLhks7+z73zk1KqljYusWOYIDrgj+tupPialQB1kUfpH/
 p5jOkXnFBAl85JNJKoQ+mJGvax1PKQ+ubiMMvKwMdjlwepBORTq4JREGCM1dT+RyA40C
 Dtkh+m7bGb51LlmDhpUdSF2fi5JONnOWmza4BLMMqzMOVGlVqLPer59n6Ov6vPR9mHZa
 IWmThjTLxyu5Mg0sj6aIhiiehEjaNnFOiyH0zgS7VvSGhdwL1TxgOXhAi8tpwLP3tAip
 85Zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W4on8zZL
Subject: [Buildroot] [PATCH 08/16] support/download: accept manifest path as
 a post-process option
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/cargo-post-process | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index b94b160315..a9fbced466 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -5,10 +5,12 @@ set -e
 # shellcheck source=helpers source-path=SCRIPTDIR
 . "${0%/*}/helpers"
 
-while getopts "n:o:" OPT; do
+manifest="${BR_CARGO_MANIFEST_PATH-Cargo.toml}"
+while getopts "n:o:m:" OPT; do
     case "${OPT}" in
     o)  output="${OPTARG}";;
     n)  base_name="${OPTARG}";;
+    m)  manifest="${OPTARG}";;
     :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
     \?) error "unknown option '%s'\n" "${OPTARG}";;
     esac
@@ -29,7 +31,7 @@ mkdir -p .cargo/
 mkdir -p "${CARGO_HOME}"
 flock "${CARGO_HOME}"/.br-lock \
 cargo vendor \
-    --manifest-path "${BR_CARGO_MANIFEST_PATH-Cargo.toml}" \
+    --manifest-path "${manifest}" \
     --locked VENDOR \
     > .cargo/config
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
