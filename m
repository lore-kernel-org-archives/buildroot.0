Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2ABC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 16:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D715E60B71;
	Wed, 14 May 2025 16:58:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXVTIXSRuExV; Wed, 14 May 2025 16:58:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7BF560FDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7BF560FDF;
	Wed, 14 May 2025 16:58:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E48512A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26908414F4
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5kdIJjVl7mr for <buildroot@buildroot.org>;
 Wed, 14 May 2025 16:58:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5808441486
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5808441486
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5808441486
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:32 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so527905e9.1
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241910; x=1747846710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3qUjDEaa/3YA7jBxBf86ilbFIt1aFJ4pfc47m+3DJJQ=;
 b=VXEAe3WROyl8pE+fD3RRNBPia7l431hMQO9cTtqL2eCXFIZvXvSBjjMbxwPGphsFyC
 CMXqbDyBWF07LMy6IsyVSyn4MdXvKnxQn+5ej4wOv7m+dSpa/HGEbUiCyXGK1PwoURhs
 c/mX3bno5jvUOABzWp2jYP3AQxbRXQgT/3nzM6C/2gUK7WU/7wmEEtmSV69B/aN3kYTH
 51TshKL2G91JGfU9H7+kPWnVLG4TvloPckuHfQc8bcQqoYBJqcqt/cdiE8iSzxEm9hJn
 34tAO9ASXHNGVQuB+64wGjTR90Pdp4fMRcUqii0Rofs4cp4BBcuEL5awLjX9VQftvh/v
 v1QA==
X-Gm-Message-State: AOJu0YzvRCpTP5S43kcNWoYzHWYt6FP0WXXS1BVBimjH2c6CIhPbXrOF
 JlBgd1lDcwq+h/2ulExt0k85gQDlm4CmpG9v1AMv2zdOcyF6RPERhxeIPg==
X-Gm-Gg: ASbGnct8VnZqm7BudgQYd/qZ1WUhqM5hcHGCD3Uxu7DWIGesHs4w9m1Nxtz8zuT9c+n
 saYoqRen7XaDdWnEV8SDOBHID61ZoX2kVKGEOjE9PsKyGdlyGlpUIJJJRfSRYS9mmGbHyJGzhKT
 H7H4UhBM0BDUD3I88/0Gi/pvUYq8HJqs5mIkHtYw7pdOn7Pn97rHhODPz0fnTmS3erMCiPFJFHu
 pTeOq30msysbbR0ssDce6lvWDueuY7iXUa63y3xMhCajnyPF0J0VGae42ZpzFkwIDW5+lyqRr6d
 mChjo2sIW8Q5BjWReUdYZHYO2XaywxNXCaCEaKpXzmQMKWyGPOP2eW2OH/FQnW4hLBJG7+sd
X-Google-Smtp-Source: AGHT+IEeIVjdtcK0BFIQgo4zmKDVncul8weMqmSeQHO4q6b4919ajAKot06H+1wj5+768DoP0hw/Vg==
X-Received: by 2002:a05:600c:5248:b0:43b:c6a7:ac60 with SMTP id
 5b1f17b1804b1-442f84ec7a0mr2313865e9.10.1747241910114; 
 Wed, 14 May 2025 09:58:30 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3951494sm39815585e9.22.2025.05.14.09.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:58:29 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 14 May 2025 18:58:17 +0200
Message-ID: <8b83ad421062201ab3387b1133eee53a800b1918.1747241900.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1747241900.git.yann.morin.1998@free.fr>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747241910; x=1747846710; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3qUjDEaa/3YA7jBxBf86ilbFIt1aFJ4pfc47m+3DJJQ=;
 b=I3bOQEsq27D/0SexuSWi3CGI4CrSZaTyxaHhrf8FGcBitnVTokdozbJPqSGet1kk/7
 GGPk3NK/7M/wr8JSlBatpS2ap1J9j1HEGcHgPZrI85yLcrCu+jPSFbOJRd4OSBrNgSRY
 eszN7g7F/GfTRYdPJi3ZXyJQQ5cOwWN/1NuxUAapALnKxSt7LBODjm6eTCok/ml9e6QO
 6QbGttCroPaUzxGOfeN41kPfJx9JreoYwSXVlRnb6vZDMYhWqA0OZtWgZkdJFplVUdIy
 mWYwBJBNEtlya3cynxSLZFvADMyeFv6W4YoLvTBMoUvBcyaN54zkN88HlT86IwAy/65e
 cX1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I3bOQEsq
Subject: [Buildroot] [PATCH 05/13] support/scripts: fix and restrict
 conditions to accept merged dirs
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

Currently, we accept that the merged usr is bqckward, i.e. that the
/usr/bin, /usr/sbin, and /usr/lib entries be symlinks to, resp., /bin,
/sbin, and /lib. We also allow either entries to be symlinks to other
parts of the root. Both are accepted despite the comment at the top of
the script explaining what should be accepted.

However, a properly merged usr is the other way around: /bin, /sbin, and
/lib are the symlinks to resp. /usr/bin, /usr/sbin, and /usr/lib, and
the latters are actual directories.

Fix the check-merged-usr script accordingly; extend the hedaing-comment
to be more explicit (and drop '/' as there is nothing to say about it).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/check-merged-usr.sh | 34 +++++++++++++++++------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/support/scripts/check-merged-usr.sh b/support/scripts/check-merged-usr.sh
index ed0c58e9b7..9459d975fe 100755
--- a/support/scripts/check-merged-usr.sh
+++ b/support/scripts/check-merged-usr.sh
@@ -2,13 +2,12 @@
 #
 # Check if a given custom skeleton or overlay complies to the merged /usr
 # requirements:
-# /
-# /bin -> usr/bin
-# /lib -> usr/lib
-# /sbin -> usr/sbin
-# /usr/bin/
-# /usr/lib/
-# /usr/sbin/
+#   /bin            missing or symlink to usr/bin
+#   /lib            missing or symlink to usr/lib
+#   /sbin           missing or symlink to usr/sbin
+#   /usr/bin/       directory
+#   /usr/lib/       directory
+#   /usr/sbin/      directory
 #
 # Input:
 #   $1:     the root directory (skeleton, overlay) to check
@@ -21,10 +20,8 @@ root="${1}"
 
 # Extract the inode numbers for all of those directories. In case any is
 # a symlink, we want to get the inode of the pointed-to directory, so we
-# append '/.' to be sure we get the target directory. Since the symlinks
-# can be anyway (/bin -> /usr/bin or /usr/bin -> /bin), we do that for
-# each of them.
-#
+# append '/.' to be sure we get the target directory. To check whether
+# the symlink is backward, we need to append '/.' to each tested entry.
 
 test_merged() {
 	local root="${1}"
@@ -32,12 +29,21 @@ test_merged() {
 	local dir2="${3}"
 	local inode1 inode2
 
+	# OK if missing first entry and second entry is an actual directory
+	test -e "${root}${dir1}" || { test -d "${root}${dir2}" && return; }
+
 	inode1="$(stat -c '%i' "${root}${dir1}/." 2>/dev/null)"
 	inode2="$(stat -c '%i' "${root}${dir2}/." 2>/dev/null)"
 
-	test -z "${inode1}" || \
-		test "${inode1}" = "${inode2}" || \
-			printf '%s\n' "${dir1}"
+	# OK if first entry is a symlink, second entry is a directoy, and
+	# both have the same inode (once dereferenced)
+	test -L "${root}${dir1}" \
+	&& test -d "${root}${dir2}" \
+	&& test "${inode1}" = "${inode2}" \
+	&& return
+
+	# Otherwise, this directory is not merged
+	printf '%s\n' "${dir1}"
 }
 
 test_merged "${root}" "/lib" "/usr/lib"
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
