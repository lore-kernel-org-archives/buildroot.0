Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8490D1358A
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 23:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71275405FD;
	Sun, 27 Oct 2024 23:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1WIiia_CPwu; Sun, 27 Oct 2024 23:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BFDB40602
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BFDB40602;
	Sun, 27 Oct 2024 23:35:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22025AEE
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B84640274
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBL29FrahXtd for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 23:35:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F046A40270
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F046A40270
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F046A40270
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:35:38 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3a4e5401636so9605725ab.3
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 16:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730072138; x=1730676938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GMejKUXBJbElBqZ7jBJ1d29IHq5gYSWYQIqMsAvg3HQ=;
 b=k5Aggn1O4VdEGnxiPThrN3rSYfb3Y/1OSizzbygGeohIeyJAF1nY/QGhs2hcaEcVnL
 oG87lNpRcy0BJsl4+u1m3QaYHWliz2vcTw60u0/ajyzUqrxVmoQPaYA6+/C/sV3Hlcrt
 EadpGwDPJ4yeshyahd2bE1nrwEaFOaa6mxEozXqEM7/CJxzVQu8ncEDiiks8D/88i4T/
 RI5p68/aIXDGvp2ZdUN2/PWhTb2uJo5ag7vVOJU6BOIaWNxWl0SA8W7zwYxVVXcr/hfM
 yK3S0hkAoHQhK5wBawIcjbwAPAXHcBONIL68FTSqCwtJfUEBAv6TRkbUZPwrdPeePcg3
 45Xg==
X-Gm-Message-State: AOJu0Yxy7h9uKrBSrtcyNqFyjITzxD4ff6dtTtaRRVMdbIWHLUqc96fC
 h/IQEkdoQF0SZbEKQ7ICQwGMXBDZpqqpaQJSJinLR8mlS0jHe8FWMZ1hGQ==
X-Google-Smtp-Source: AGHT+IH4kh/Zxn91LLhqaZtH7IffmtjloGorh/G3lvvA7Cia8tqCKggqe7CCldDqnZsyp+zSMKn79Q==
X-Received: by 2002:a92:ca0d:0:b0:3a0:8c5f:90c0 with SMTP id
 e9e14a558f8ab-3a4ed2e2eefmr43315805ab.10.1730072137484; 
 Sun, 27 Oct 2024 16:35:37 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc7277f707sm1360760173.127.2024.10.27.16.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 16:35:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Oct 2024 17:35:35 -0600
Message-Id: <20241027233535.3980302-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730072138; x=1730676938; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GMejKUXBJbElBqZ7jBJ1d29IHq5gYSWYQIqMsAvg3HQ=;
 b=VM3fCD0ms4ozuabLJhlKYWBqRxpSZriz1nySaYJkDUw+swZdhGsno/j2FWVgeNeUDz
 /5AXevZJdeXZWBOP7Fc0QfDjtE9t7iKNQceuya34GLT2nzoejk0eHUKXEQ6eO80Mpm7A
 icX73/l5aVERn9ZlkLE32UhsHV/hK9v9qZo1QSdyYkNs8PCLMHXmNFs1ORXzM2f2m1CP
 T20wdf2pNIwrQ5EH1ITb1m2Y/5AGXXhdHJhI+ZHX4lkV1ONlkthO/w9mVYctCiBeXiW7
 qlLPdKvstY3zVd/HyzxV4p+Zbt9Y/iJMl74vb6BCT0oMIivWbBTBWVfDq6aSoTN9btHb
 Yz+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VM3fCD0m
Subject: [Buildroot] [PATCH 1/1] package/rust: bump to version 1.82.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/rust-bin/rust-bin.hash | 128 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index d3ed02513c..070a0b9779 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,70 +1,70 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rust-1.81.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  5cd65b0a2724e4193a5c4ba79f0687f8c11d52c2d58ee35bc7ce5958a3cc8dc2  rust-1.81.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.81.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  b8e1a2889c574d235b210ae7ac8dd0696ea845fdc3707d67955d53ad4c0de027  rust-1.81.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.81.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  0d5febf28380b9c25f08e6f9b834778ace9ecb54b892481985e1e8692080c617  rust-1.81.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.81.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  1ff9c458f882b19050083c1f4cdd1a639dd8014b6c9c658e08506c7f3449af33  rust-1.81.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.81.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  aca2ff839c6ac288ee037926ec15d78315977a5945f515505db0b248d7c3094c  rust-1.81.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.81.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  bc4c50240344882e1c192038cc04daea760792c6aaafa928ae1058f6f4cda437  rust-1.81.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.81.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  5d66614297fb01e66310f6842ab9ac0813ea4d340d88c0205880729b99362dcb  rust-1.81.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.81.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  1a9ee8caaa18a3e433fef93cea8a55dc1ebd478ed761b2fef69d4565f9d00e7f  rust-1.81.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  85567f037cee338f8ec8f9b6287a7f200d221658a996cba254abc91606ece6f4  rust-std-1.81.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-aarch64-unknown-linux-musl.tar.xz.sha256
-sha256  e31d375a512aa1bbb533ff53cab47559468e5c1bf047fd9f4040446dfa9cd9df  rust-std-1.81.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256  4220431ef39ea5383f987ac00a80acbe150aa116178513d619a8dd10a643da22  rust-std-1.81.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  bb146097d9e5f2173cdd7afa4e813f5e68688da371171427d60778e7220e6ec5  rust-std-1.81.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-arm-unknown-linux-musleabi.tar.xz.sha256
-sha256  2e78458b9ea32f25b7277c8e94dfc19453ba00520588b165f5d55ef0da801939  rust-std-1.81.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-sha256  92d4160b5fb5a16ae0f2be18f1e25ce201e0c80801cdf261d0f416157cc4182d  rust-std-1.81.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-sha256  d7855f721070a6fb283993a13f0120508636c516d05614024fc1ed5576cfbfc0  rust-std-1.81.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-sha256  e06c5b4d942f139f5ee824612b639a6212fff05d182ddb4a895a5767ed22ce20  rust-std-1.81.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-sha256  6501025d22ddd9909d5819867e1fb2026f6fa9510334eaac51b8b4e566aea23a  rust-std-1.81.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  ffd915504e7f52384123957d1a2d7044061d21c8927cf0d2a2222723d8250535  rust-std-1.81.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-sha256  9c182129b3079d6763f3f8ba693a51919dc7d994d8713ba3f5207e557aefa153  rust-std-1.81.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-sha256  700628d3b47d8f65753cc255eedf8627dab5c3f39e82b2e5743607cf6d51084e  rust-std-1.81.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-i586-unknown-linux-gnu.tar.xz.sha256
-sha256  91ebf62a1f95047b93d4a4fec280fb4897cc7921633fd55f5c5a3aeb2b140bd6  rust-std-1.81.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-i586-unknown-linux-musl.tar.xz.sha256
-sha256  373c4c1cfe8c5e9b029fc555b678c0947220d021f1456cb9176b41013c2e9b21  rust-std-1.81.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  4ed9085460e444de9dee246080126f5e73062802b99aaff620d2aa827f60d972  rust-std-1.81.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-i686-unknown-linux-musl.tar.xz.sha256
-sha256  45b8fa18f0cdba725120ce2879f3e5d8218f0fc6c66594e347cf2c6453763eb5  rust-std-1.81.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  3b3473de46f7ea268130d8c72140dacab9118b2e8611fc0e23ed99091f25eb45  rust-std-1.81.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  665f3c0a8752f8e5d973cf9b94e5c1be94954178ca8378a318b6e21e7a7b370c  rust-std-1.81.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  5ba237cfbd18806bf77fbe8bc31b14a17f3d14acb30a022955cf047eb8d41056  rust-std-1.81.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  9882cda0a5547405e64357a4964d525f46d1395f85b7e7b6e69cbd4dbcd46ec3  rust-std-1.81.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  5549622876714df21235aa6d26731f31c37a7e1629a3f6c5262dbb0b1f10038c  rust-std-1.81.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-sha256  194a3c04a2390b1e07fdb114eb2c48e962219f0a1b710e2120a9806963a2520b  rust-std-1.81.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  6ddf80f254e8eea9956308ba89fd68e1ac7885853df9239b07bbc9f047b7562f  rust-std-1.81.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.81.0-x86_64-unknown-linux-musl.tar.xz.sha256
-sha256  3f2e47fff9320888993139fbd98f4bb44faf9355b25904f36a24a9808ff80240  rust-std-1.81.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.82.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  99acf175be33bd96ac82d644125d0e2acc6962d61ee64851edc7d8ba3bd23ca4  rust-1.82.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.82.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  34669e600d6ee7744e59f5d4542e2a539a9b13f099a4533f19a46e32a0868053  rust-1.82.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.82.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  a32342217fb82167fffcaf0c7e44ac6e32ce5fa63dc3beb42439ab05f561a882  rust-1.82.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.82.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  0608a560ce266e8aafecc2b9908e3094f5ef1e135460b1f88aa614e5bf65aae4  rust-1.82.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.82.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  048f637a547522ba0081c5772fd3196dfcc2d0d24f442424f168b5d55f961537  rust-1.82.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.82.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  532190c3cdbdee9249bcde648b1c61b092bdd8885266ba9edd6df6824a454958  rust-1.82.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.82.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  71428fab3cf18cfe4b4486a11d292ec157fe8b0c904fb4fae34db6539144c286  rust-1.82.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.82.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  8a6bf24ca1fee2bd861590431c7954674191a0c0dfa0af4169731bc1459cf58a  rust-1.82.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  1359ac1f3a123ae5da0ee9e47b98bb9e799578eefd9f347ff9bafd57a1d74a7f  rust-std-1.82.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  a364a4b506865fbd56aac67e2b540a824cd9abda621bb38a8b678166d33b8ec2  rust-std-1.82.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  bec0b04e6e1e183fc21521e9cc2dc89be41c3ccacff3fb5ca48419b47af94fe1  rust-std-1.82.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  fa379cc69b23782cbaddf66025889bf5ca9c32ddb60766fe158b43cfe49a2b2b  rust-std-1.82.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  cd5e1577c1772ba309d003c49a2df2f06ccbc1cd1bf3ee9c1cfada210979f26e  rust-std-1.82.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  86f2242347c1cbae354cd0ff66c9bfe735f1b371c189aaf0157a3b55004590cb  rust-std-1.82.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  e3c74773cf6f09a3cda1b64c3058f5a88abea0a98f172de895c0ecf7b7b760b2  rust-std-1.82.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  df0a3be0e71ca8aa8be4915f7142661af32411949a75c1729a314e6ab5c78b0b  rust-std-1.82.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  4d692c1696ad49285a45bc5f636ce9c13ccb32b99ed14be428eaaf1e0cae6b33  rust-std-1.82.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  34d258a07c9051803786405731c05fb19f7980e13308acf4b16e8c836bd73ac8  rust-std-1.82.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  1e318fcff01379cf4459f02526309b1f086530004be4fb5e00988ce7b1d821f5  rust-std-1.82.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  bf93c79abc56bfcc3d48f2defcb0ca720405d01a50ba08d6d24830ae034bbc2d  rust-std-1.82.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  f56585c55664898c7484f4b7bd139770c99d7b4da6e56e4016f71cb053b1aee2  rust-std-1.82.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-i586-unknown-linux-musl.tar.xz.sha256
+sha256  711c03ffb5bb53fcc97278b015d1ea9f503ce826ba390855f576c0e3b77c4bdb  rust-std-1.82.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  c7ebb02b6ca349999b3b7dce768efaca5e0d9060f55397523e11a64cd10a9405  rust-std-1.82.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-i686-unknown-linux-musl.tar.xz.sha256
+sha256  3c5ee32afc4b83313832c7a78175c05a5e568e6053fde7e65e2a9b19ce104c10  rust-std-1.82.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  827989a42526206199025f764d08d7cd319fee58bf2e08dcaf75df9ead6f094e  rust-std-1.82.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  cdfadb39f1325319de8152504413f34671ac09fa7ecb97f967c25ece3645bc5e  rust-std-1.82.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  4954a44305622b8f68ca088138b9a69432e350336da1a415a282ce148beb340d  rust-std-1.82.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  5649f9b4e107d6c5f72fb7f82cfe15370b80b8d983670602e02e0b615bc6dc88  rust-std-1.82.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  454b83668b57bdef28fc49aca8fd4c38e395b49011e653afdf3f9bb2dae8aa63  rust-std-1.82.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  87db52d782131a8817b76f65eefcae2c24a49b2a6f19ed9bd4699167305c22aa  rust-std-1.82.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  2eca3d36f7928f877c334909f35fe202fbcecce109ccf3b439284c2cb7849594  rust-std-1.82.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.82.0-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  1c99a4c81f51b687ba55746c7d3f19b5b860fe4eff604d3c7d803e08c9cc89bb  rust-std-1.82.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 31c7ac50b8..c14ca7f88e 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.81.0
+RUST_BIN_VERSION = 1.82.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 5dd32d432e..19af66e2d6 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.81.0-src.tar.xz.sha256
-sha256  36217ef7e32f40a180e3d79bd666b4dfdaed49dd381023a5fb765fd12d0092ce  rustc-1.81.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.82.0-src.tar.xz.sha256
+sha256  1276a0bb8fa12288ba6fa96597d28b40e74c44257c051d3bc02c2b049bb38210  rustc-1.82.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index adb0a65580..802aa0f413 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.81.0
+RUST_VERSION = 1.82.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
