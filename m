Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917AAC27C53
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 14:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5115C6111F;
	Wed,  5 Jun 2024 14:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMawV-byce9s; Wed,  5 Jun 2024 14:18:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A3AC6139B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A3AC6139B;
	Wed,  5 Jun 2024 14:18:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13C491BF23C
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A12961128
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CTNPx2U2qWWi for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 14:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C28A261118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C28A261118
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C28A261118
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 14:18:21 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42135a45e2aso37231855e9.3
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 07:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717597100; x=1718201900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=loyrOgi1NXT06ySMgUTcltiKp4XXFPTwT4711UuEzzY=;
 b=HS/MpGQ8y8lMJ5PvLmEA3pqfuOxZ33hB8k1s3MeVcG5k0IVHHru4wW9kJeg6wRUZPj
 ptZG/upPVinpbdp7EYsWdNkSFVMkdLNGebuNge3/rD6j75zu1pWZMNl1JrRHgNDwn9/P
 fppgp+CyQNAj9xeEH0iJdYL1ZlzpLw3d7mrHDahyWS74xoKUZQTka3FDvb+KruJo7eQx
 FNpfTBe+hhfV9Ej/enFH1/tWnHU43QtacCUgYdRE+3d+J8h5bAJRvauZeRhtxu2bWQQZ
 0UotDHRQA8XCBn4ZgNQ5LQGq/MGUbBW3zOWfDxXVrN1Cbctu/iNe0Te/AI+YuTD5erdx
 ktUA==
X-Gm-Message-State: AOJu0YxAomF9eXbuQKQD6S9kiPVs4xm2KEUVcyIuS30C1JKTFyWRfWcC
 NH5YEa4oX+u3yG0T5GZ65OOptAk6MT9bqLLU2TBQbbPVUqIjQAPFcVrZdw==
X-Google-Smtp-Source: AGHT+IEQfTmlTv6aX6E/zdBVugBd93UOiCA5pnCHtZnWP6OxNkLjIvij8hyo8MzXc6gHNtrUbkVdAQ==
X-Received: by 2002:a05:600c:4587:b0:421:39da:b2a7 with SMTP id
 5b1f17b1804b1-42156358829mr21924505e9.34.1717597099859; 
 Wed, 05 Jun 2024 07:18:19 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158149057sm24253925e9.36.2024.06.05.07.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 07:18:19 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 16:18:13 +0200
Message-ID: <6f058589c634b42f453339cb1d5a55c352f077c7.1717597094.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717597094.git.yann.morin.1998@free.fr>
References: <cover.1717597094.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717597100; x=1718201900; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=loyrOgi1NXT06ySMgUTcltiKp4XXFPTwT4711UuEzzY=;
 b=hfX/mnLq60PlFW4u3i++BZX0CqfLaPcuYXZS2ZeNMSiXEPYJUI3RvSTIcN+27VKRkA
 RRvqcp3Nfg7BytTZ0luJbj3R5ckTWERwK5P2nEJzBC1Jd8paEVp3W0LFQzU4y53wMvVK
 Ax3aw9FZ3iEHG9GwoEJrTuAS/1F2riMA6rCbZE56Af2AewtXp9WN6V86pbsnJdi+y4tm
 ZD9HTE1xX7qp3otuPEE9mnxOEnEMdD7INlIdcSbk8M+Dm2JtkBGxWO5fjZxxjgDtTBFg
 2YlXMB3K6xJ+Ed//IlLyGHxATRib5S5oHyqsZ2nZVu5LZK+e2T2Z/OtKo7WjGhOPuGgL
 CNTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hfX/mnLq
Subject: [Buildroot] [PATCH 5/9] support/download/helpers: use appropriate
 TAR
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
 support/download/helpers | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/download/helpers b/support/download/helpers
index 823e4d2f91..5ed9078287 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -59,7 +59,7 @@ mk_tar_gz() {
     LC_ALL=C sort <"${tmp}.list" >"${tmp}.sorted"
 
     # Create POSIX tarballs, since that's the format the most reproducible
-    tar cf - --transform="s#^\./#${base_dir}/#S" \
+    ${TAR} cf - --transform="s#^\./#${base_dir}/#S" \
              --numeric-owner --owner=0 --group=0 --mtime="${date}" \
              --format=posix --pax-option="${pax_options}" --mode='go=u,go-w' \
              -T "${tmp}.sorted" >"${tmp}.tar"
@@ -78,7 +78,7 @@ post_process_unpack() {
     local one_file
 
     mkdir "${dest}"
-    tar -C "${dest}" --strip-components=1 -xzf "${tarball}"
+    ${TAR} -C "${dest}" --strip-components=1 -xzf "${tarball}"
     one_file="$(find "${dest}" -type f -print0 |LC_ALL=C sort -z |sed 's/\x0.*//')"
     touch -r "${one_file}" "${dest}.timestamp"
 }
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
