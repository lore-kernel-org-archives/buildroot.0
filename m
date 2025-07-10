Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD04C83F22
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 239A040D2A;
	Thu, 10 Jul 2025 20:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQpbM4h7Jf-K; Thu, 10 Jul 2025 20:23:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E5724105F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E5724105F;
	Thu, 10 Jul 2025 20:23:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C59F114
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4A3180C2E;
 Thu, 10 Jul 2025 20:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T66h2U2_6BU4; Thu, 10 Jul 2025 20:23:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A90080CD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A90080CD8
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A90080CD8
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:04 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so1155367f8f.3
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178983; x=1752783783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IaZWMRvYKIQKKGUMte7TaS/hctRqbt1nsd2uVKO6uD0=;
 b=pJEEJSrok9q5Jqg+Hg0sNuOQclroaJbD6fetLvGRynfFzjL2p96wP1D3k91MFYPQ7A
 zYKCzGGHpF2527MAK2fvKSO9vyq2qGRxX8q43qn3dbWCMhQP/qqlPNeBzcs1G9UFHBwE
 aUyDiGCXk1dfx6rPud7Ghho9/4ShiFTg5n1OK31uc8rZm4iwU9NaLM7T40nrjCnn1PPO
 cmTKb6OU4FstcXczcCpYQg1/rIh/ve7vrIyxH7EWBsykQogQOv+icAJs8sD1g7zqoxS7
 NugR/m7mnnkbFFgQaZY7I1m11uvreYDSwo0c+sNpoHOpvXQCnvhpqWThfz+qG96+keTe
 Faaw==
X-Gm-Message-State: AOJu0YwaYAAwv2FUj1ETQrM6w+ONOgCaQwq1BMQq9jxSUqNvj3NhXlHJ
 IzsAh8n5l6L1T+VzrUgngeuZAaDNjWvqek/nMFsaZgMj9d3ucwHeL3nY6C4/Xg==
X-Gm-Gg: ASbGncvLuoENYckb2Bp0IIrVg6FGbbvNRxPPmMwo2/mwnLZj9nqMk181fgSHbUGwDs8
 56QvGCtl6n0GwL3AdZQ0Q5RcFPqZ8+pk1ujp2WBg0B1Fpq0v4/AC0+dWNPEiZCWRTzdxnclmIjN
 Nk38yagx6UUPJ58rbdWnUd2voUOBeK+RTRSZbyZobpAtDADqDNjzrO7i5i9A1OzyxUv28WF9Oih
 MSPvUgW87BgkrtrI776Jtiwkuem+h6tKV5P60TAIB4UekyGku3kZIIcgwjK9T3iYhJUd3QHv30A
 RkcgbbzN1gQ+YIdW//UCFX2e7IAJYX4JiZk+jPgrNYQEISiusUnbeDdoWlji/7XPYV9oeFk3
X-Google-Smtp-Source: AGHT+IHE8ZagqjiUdPlWFBTwRm3F+MBf0QhqamQeM5skGDruJPmtGEMBBU8qixsbg+ZqrgqOkRGT+w==
X-Received: by 2002:a05:6000:4287:b0:3a5:5fa4:a3f7 with SMTP id
 ffacd0b85a97d-3b5f2e5660cmr62931f8f.58.1752178982772; 
 Thu, 10 Jul 2025 13:23:02 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1997sm2742694f8f.10.2025.07.10.13.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:23:02 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Jul 2025 22:22:46 +0200
Message-ID: <7ff478616647a0de99ad1ccedaef75576d462bb7.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178983; x=1752783783; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IaZWMRvYKIQKKGUMte7TaS/hctRqbt1nsd2uVKO6uD0=;
 b=dy1z1KHfLqqNp1CCKnW2aZiWRfU8+C35xOrpKKkjZPYEqIvzM4sD8L/5aFIvLA27nz
 PDdFI/rtZLvY7NxMTBXggknORG5FkxvdRXZyhF7rqHxKsK1y0Ea7H3ZX3HaMrA0v+m80
 93lZLDdzDnNB9zSIKJ8deZ3KGAuczyBTdLSgX2jw5KqKZ0wmwgZKwHhEk8DL5Ukwe28f
 SG6ViYdZk3wn8uyFR2cN4EnalnUsSPpIkNRuNUFDIi3+o851nhAohCTm0swgYVNDiniH
 aNNLq0gtOJuAGQoOrcORnf864IbrGBUJCx41pMOuH6QLwbBAxjIf6it2RqOJrRpNUWTe
 Jweg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dy1z1KHf
Subject: [Buildroot] [PATCH 04/17 v2] support/scripts: comonalise checking
 merged status
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rather than repeat the same canned sequence over and over again, move it
to a function that we can reuse as many times as needed. This will come
handy when we later need to check merged-bin.

Switch to using bash as it allows for nicer functions (local variables),
but we anyway require it globally already so that's not an additional
dependency.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/scripts/check-merged-usr.sh | 46 ++++++++++++++++-------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/support/scripts/check-merged-usr.sh b/support/scripts/check-merged-usr.sh
index 433857cd8c..ed0c58e9b7 100755
--- a/support/scripts/check-merged-usr.sh
+++ b/support/scripts/check-merged-usr.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/usr/bin/env bash
 #
 # Check if a given custom skeleton or overlay complies to the merged /usr
 # requirements:
@@ -10,30 +10,36 @@
 # /usr/lib/
 # /usr/sbin/
 #
-# Output: the list of non-compliant paths (empty if compliant).
+# Input:
+#   $1:     the root directory (skeleton, overlay) to check
+# Output:
+#   stdout: the list of non-compliant paths (empty if compliant).
 #
 
+# The directory to check for merged-usr
+root="${1}"
+
 # Extract the inode numbers for all of those directories. In case any is
 # a symlink, we want to get the inode of the pointed-to directory, so we
 # append '/.' to be sure we get the target directory. Since the symlinks
 # can be anyway (/bin -> /usr/bin or /usr/bin -> /bin), we do that for
-# all of them.
+# each of them.
 #
-lib_inode=$(stat -c '%i' "${1}/lib/." 2>/dev/null)
-bin_inode=$(stat -c '%i' "${1}/bin/." 2>/dev/null)
-sbin_inode=$(stat -c '%i' "${1}/sbin/." 2>/dev/null)
-usr_lib_inode=$(stat -c '%i' "${1}/usr/lib/." 2>/dev/null)
-usr_bin_inode=$(stat -c '%i' "${1}/usr/bin/." 2>/dev/null)
-usr_sbin_inode=$(stat -c '%i' "${1}/usr/sbin/." 2>/dev/null)
 
-not_merged_dirs=""
-test -z "$lib_inode" || \
-	test "$lib_inode" = "$usr_lib_inode" || \
-		not_merged_dirs="/lib"
-test -z "$bin_inode" || \
-	test "$bin_inode" = "$usr_bin_inode" || \
-		not_merged_dirs="$not_merged_dirs /bin"
-test -z "$sbin_inode" || \
-	test "$sbin_inode" = "$usr_sbin_inode" || \
-		not_merged_dirs="$not_merged_dirs /sbin"
-echo "${not_merged_dirs# }"
+test_merged() {
+	local root="${1}"
+	local dir1="${2}"
+	local dir2="${3}"
+	local inode1 inode2
+
+	inode1="$(stat -c '%i' "${root}${dir1}/." 2>/dev/null)"
+	inode2="$(stat -c '%i' "${root}${dir2}/." 2>/dev/null)"
+
+	test -z "${inode1}" || \
+		test "${inode1}" = "${inode2}" || \
+			printf '%s\n' "${dir1}"
+}
+
+test_merged "${root}" "/lib" "/usr/lib"
+test_merged "${root}" "/bin" "/usr/bin"
+test_merged "${root}" "/sbin" "/usr/sbin"
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
