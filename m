Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F69C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1B7C83ADC;
	Sun,  2 Jun 2024 20:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6MX9sy6p9nlC; Sun,  2 Jun 2024 20:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3F20833DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3F20833DB;
	Sun,  2 Jun 2024 20:40:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E1C11BF315
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CB8D83196
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLwkHwFqqNj8 for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:39:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 73AE481F19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73AE481F19
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73AE481F19
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:39:57 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42125bfa28fso45805835e9.1
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360795; x=1717965595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pljhLXXh76Sv91FXonoRUAa6YP1s//jsxUlGw2jdXYE=;
 b=BzIAs9NIcdD+kw/FfIkD0+3DbTQiXZOuqUglxbfYzJNaEKTfGoVlB8qVRflMxqcYZE
 1eu4UbSshbHXDKan38KnR1oG7SZf5Ud/CAUsSi0kWt0ZMBPup0DpUzL5P/i/OT6eqWgg
 VhSX/Yv/xR6AK0kvRrFij5jZhfEiddNkFzKfR/zERGucurs/JanW6xQbxApuc69nXFsP
 GcJ0rtAspcdizXcZ8asdezb1kiFjh8bXRHFM26rnlzkkMuZOuiWGjcmP1/KrNg0ydzBN
 1CgeuJfUCTf6m4eB0fRae3wy2DpmdonS3pwDRs5ofS9M74Ge2i6aF3cMVApr/zVwZAAH
 AoCA==
X-Gm-Message-State: AOJu0YxM48N01dzcHGzlf0Q4hc7YsZGbDIqHwT6KkVm0ZSK767Qm3qpA
 lPPhIkqVWBP5TELz0VIP/v6euxEfN8P5Xug5V/8d+tx2LL0V/2DZMsU3+Q==
X-Google-Smtp-Source: AGHT+IGg6IE39R1FNNjRmH+UDnSDlBmej/jyInlws0WiqcwFUn+6Z2HB6Bf/5oJ/O4oqe8ARllP3Qg==
X-Received: by 2002:a05:600c:45d2:b0:421:2429:7e46 with SMTP id
 5b1f17b1804b1-4212e05019amr86394145e9.13.1717360795497; 
 Sun, 02 Jun 2024 13:39:55 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e0f97ba3csm6460862f8f.73.2024.06.02.13.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:39:55 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 22:39:42 +0200
Message-ID: <41b0c512f39b98405f20247f94b7494ccaee5451.1717360788.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717360788.git.yann.morin.1998@free.fr>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360795; x=1717965595; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pljhLXXh76Sv91FXonoRUAa6YP1s//jsxUlGw2jdXYE=;
 b=Ql4RriKe8HQwgfbg7iIh5505tRQgbC6JyCIEJlmY7y+um2yxKUmXDblKJhP1ueS8hf
 PJM1I+RFBWJB0neVR9eX2CO3v+hPd4L/rMfhsTa0g8GIF/b/pRsxKtj/kLZ8BJAs8P+n
 tMYHQlSJ7mD9mSgikOsKPv3YpP5LzV1FdyzyCPnLXzcEvd9Z0uXCSwmjFvFvLoi81oes
 w93E1ydisawxy69jFeLU8T4cliq9ycjArKC0RJPBZW5QWolV3k5n/7Oo8m087whUvC5G
 gUZ8YXIEaRTMxiMKJGI7a28occGXAOlv6wVCP0Zh6PWES9xCyuUvH/esbKakNKKk8I7U
 uFbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ql4RriKe
Subject: [Buildroot] [PATCH 06/16] support/download/cargo-post-process: fix
 shellcheck
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
 .checkpackageignore                 | 1 -
 support/download/cargo-post-process | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e7180718c7..42a9ec8661 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1659,7 +1659,6 @@ support/dependencies/check-host-tar.sh Shellcheck
 support/dependencies/check-host-xzcat.sh Shellcheck
 support/dependencies/dependencies.sh Shellcheck
 support/download/bzr Shellcheck lib_shellscript.ConsecutiveEmptyLines
-support/download/cargo-post-process Shellcheck
 support/download/cvs Shellcheck
 support/download/file Shellcheck
 support/download/go-post-process Shellcheck
diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index 3f4666c006..b94b160315 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -2,6 +2,7 @@
 
 set -e
 
+# shellcheck source=helpers source-path=SCRIPTDIR
 . "${0%/*}/helpers"
 
 while getopts "n:o:" OPT; do
@@ -28,7 +29,7 @@ mkdir -p .cargo/
 mkdir -p "${CARGO_HOME}"
 flock "${CARGO_HOME}"/.br-lock \
 cargo vendor \
-    --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} \
+    --manifest-path "${BR_CARGO_MANIFEST_PATH-Cargo.toml}" \
     --locked VENDOR \
     > .cargo/config
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
