Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85494C3ABDD
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 16:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40D0360A8A;
	Wed, 14 May 2025 16:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrP8f9GK-tCM; Wed, 14 May 2025 16:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62DB360B85
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62DB360B85;
	Wed, 14 May 2025 16:58:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB4B412A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD14E60B71
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PyNCdgUXGcUX for <buildroot@buildroot.org>;
 Wed, 14 May 2025 16:58:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D9EAB606CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9EAB606CB
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9EAB606CB
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:31 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so400635e9.1
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241910; x=1747846710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=chHTkLg1fgGBZo608uFdvlROEwZgjroV4XE202hLvhY=;
 b=wVve684TrOWXvW0+KOse4wt6WSpoJH8LF/WiltLkyJ0iElyc4t6Qk9Joc5oTdEPFuC
 XkZulFAHcxSTNHDSA5TmMKsBF2fM80PE4BpubJ9vTYocb1qA65grHnSjS/zjZueym0bw
 Da3IhAeKBtSHk25P0ecT3N34H7u4cwU58lPYrCzLFZOTAZrw+KvjDZ1/beMMj1Q/7QQ/
 UfNp1iFrtXW2TEO35wvu4uv9YSVC8AzKpFmHab+cm2iF/zLpLYTAwUIOhi7hCkklA8Wx
 PnCaRHFburwx6UeSpRe8T4j8vQTx1sJErNpkkuSmVg1vdlf/me83vWmYGME2c5nQqJj4
 0Xzw==
X-Gm-Message-State: AOJu0YzlHHBh1mtGhCBNkOFgLIft9i6zakjKFN+sa55Xy5EU9HC8y8dG
 WKp5dAvb+vNy5zZ/4SHQBX009ydti579qV6rIsK0sdA7VEH3nuJyCW+GgA==
X-Gm-Gg: ASbGncvjFDurELgeySrB5yTpEx1zLfPFWZnsOvaXr7yc6dp5C2zYoWWM2GSVC4TLGnl
 cHBESPize7H0jIJIkU3UKSc9lQUdPk07yeGS4bAD+iMDHr6YxULuZdvQcNchxFImLX4C+aOb3cW
 E4bRkTAJWeNzzAU5Z+R9KcXhrcImw6aLi0ilm9MOjB873sl/9vCTdUbumUsZX0oyc1lMmJAPSjH
 m6evntwHhPIAeVT3Ra+GVD9N6y5+IjjbqfbjVu6WkIHr2JTiEhBGOc7cWVACkS5omku6y0UeQwO
 DBm9NMu1ZHR41Pb0oUuw8caXgKFKLjRtgjL34gAPoaZb3f/H8WQzJJEjCXlM0vW0UQ8rlLeB
X-Google-Smtp-Source: AGHT+IHHvYTk+kcOz/vsj/XraHIXcW2SplFLu/nQ2VuYSTQ2sMLDeTdNidc6v+viadNYdzkToYm/zg==
X-Received: by 2002:a05:600d:1b:b0:440:61eb:2ce5 with SMTP id
 5b1f17b1804b1-442f285460amr41881645e9.17.1747241909656; 
 Wed, 14 May 2025 09:58:29 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3951494sm39815585e9.22.2025.05.14.09.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:58:29 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 14 May 2025 18:58:16 +0200
Message-ID: <3d1d0a72db7a9bdd6d9cda07a6b518c08ef01aab.1747241900.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1747241900.git.yann.morin.1998@free.fr>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747241910; x=1747846710; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=chHTkLg1fgGBZo608uFdvlROEwZgjroV4XE202hLvhY=;
 b=mPf8rA1zVsmiJ53dOXQj1itQQP2nycTYY8lrwgj6EnlvDJGAtO/xBF+oHTdCbC4L94
 XYwJTxdILHlA4Zha95f/3FEY0QVnugF7JB5r09fv9Ni08NUY8/Iugvrj1mOOoOMl0T0Y
 koLdOOezif6rwkS0GBaSHOA73fPgA5f/BAg12C8dw85+yWWQwgj7d3br9DV0i3Uyiibg
 Lpt+SfgbDb9EmLu7V8uwNiRodNnJI5MreqbDYQ35yfCw6Vh41XrBgTqNeRkBsqZ+118o
 53/mvNA8igwI7MeL1JeKvJV4rhXCyA+/+ExwXP6GkDwL3yXGp/zk5i2yRrtARgz+KvCn
 MNcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mPf8rA1z
Subject: [Buildroot] [PATCH 04/13] support/scripts: comonalise checking
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rather than repeat the same canned sequence over and over again, move it
to a function that we can reuse as many times as needed. This will come
handy when we later need to check merged sbin.

Switch to using bash as it allows for nicer functions (local variables),
but we anyway require it globally already so that's not an additional
dependency.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
