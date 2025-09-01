Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E00CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D163060E04;
	Mon,  1 Sep 2025 09:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I68QJD9k7I7n; Mon,  1 Sep 2025 09:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC63B611F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC63B611F8;
	Mon,  1 Sep 2025 09:01:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E78CAD2
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC0A5610F9;
 Mon,  1 Sep 2025 09:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id If7ZDvUwojOG; Mon,  1 Sep 2025 09:01:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C51560E04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C51560E04
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C51560E04
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:32 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45b83ae1734so13583305e9.0
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717290; x=1757322090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=b20KRChy9qPzCD2VvypT9xpL2W8G62g2UKCdYLMJMwk=;
 b=PLbGm3Ow15HXDiRZtH6F0xXASBf/rRqQusKzKVK5SjnkuBusrksSzY2EDcg3E3LCma
 Ifx3SMAP8eGqpOBoffbzr+C8i6IvUhThrcCnDKof8KSKi+Rels63aL/U0vO7M5v2gTwi
 sdPy7J5j9sSrlnYIv0P9pc0bBOvDKOOaN081u/LsbuNgwp7qU7s2Q+jiYX3QV0AB1bsE
 xoP3th7WG6NvwtA3yEO0sijGm9D2R60+9F65HWJcLJ52xsQyH0jxBJaus/lXxqYD6pJ1
 p8iF059CKnO0DygkBcyp174UDhvtjZ3wjWErdWgploRjecAMA6SPBOVuld9Bbd12pPWV
 0ngg==
X-Gm-Message-State: AOJu0Yy5F/TQbcqBta+4LehISLw8QGgCFvuI6Sg+ihxf/Aj0+ayom3tY
 epHD9Td1aY4SKHjd3+GTO7yLJW+xNsvfw2t+zvAV/Z76I2XFSnCXjvp3Sf8bBA==
X-Gm-Gg: ASbGncvnR3Gh+YVxsheQt7rKEVzfghez9x6dj+QbUe7eMOq4ylMYJSFkV8QUBlaGSTL
 vVMVTRSwVMQTVpp70A4h73MhtYmyA8DVvy4WhOpChkIkCFcT8ljDG0fuV9JCZRdcf6bxdC5c5Si
 TIRoVgU9KRn2aZYR8RnFl/pjPU+sVC09EBBSSn3qwgEkCSN/imfW2KQh8oyK3uBHCI2GrYo0SOy
 pFpNg/cdlq8clNIMtWMghUlfM3805dNaVyr8GeRmyq7tnny1BJ7wOx+QKDGr7vhWUGJ+8PEzZaA
 h7pj7t9wD6rcBjMvkGHBwsQwFCe8mvc6IvuR6mTfTit+rpSMOtAxd3KL8iRpalIC4rbdbd1cNAi
 yuhgxK3S4AIm827jwLmVcLMXNuX9JKMx+tJkK+CBAl/4=
X-Google-Smtp-Source: AGHT+IEmuhKJTZgXE818n8y1TzOF4J7KxstNieV7FZOpVnXGbwlxeO32yiF0ewoENaKBjPnZqZVdeg==
X-Received: by 2002:a05:600c:3111:b0:45b:7185:9f4 with SMTP id
 5b1f17b1804b1-45b8f477445mr9011325e9.34.1756717290184; 
 Mon, 01 Sep 2025 02:01:30 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:29 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>
Date: Mon,  1 Sep 2025 11:01:13 +0200
Message-ID: <bc7504da7f69fbfd1696c4e4ab11db49767c3a76.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717290; x=1757322090; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b20KRChy9qPzCD2VvypT9xpL2W8G62g2UKCdYLMJMwk=;
 b=QbXFbaWZITOeZsADlAR7NZpTPKYhcCogKsEcaJmcieDWlJaoL45W3gVaF328V0o2fC
 WJ2E06xN/OFsbUHb5/9sJ0TlwVK/YRvRyky8BuAbT3ScJJp90Cgb1EM9ZA8LvQfFI3cV
 IYKjq1skdrdcQ3EUnONOpPMFhHmTlLLMNEFP/zKqcW2OliaVO0g+NsIKFEQbF61uAaCS
 +8rdHN/+Pkope4RQo+ebfaK0kCRE4wb5oIRFRPmuTVi1KgJGWN9w7KHZDo5yzNFLOpZL
 AJBu07go27K2u0Yk3sRR3PJuZD9Kh32J4mhI9f2bUiooQYtsnXFuCtQRfYPhgy8s8gdK
 R5pQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QbXFbaWZ
Subject: [Buildroot] [PATCH 04/18 v3] support/scripts: comonalise checking
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
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
