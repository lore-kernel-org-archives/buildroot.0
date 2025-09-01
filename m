Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17A6CA1002
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6BE461303;
	Mon,  1 Sep 2025 09:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0HEdfqluntQ; Mon,  1 Sep 2025 09:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E2B2613CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E2B2613CB;
	Mon,  1 Sep 2025 09:01:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9A3E169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2973404C6;
 Mon,  1 Sep 2025 09:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1grMqO7X-vnI; Mon,  1 Sep 2025 09:01:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 833E44048B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 833E44048B
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 833E44048B
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:34 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45b8b25296fso6608945e9.2
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717292; x=1757322092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+20S+DFFOdmk6EWupFTA5P+qHLiC5XhcLSSlG8mnCLU=;
 b=Vr119h8uaQDj45pE0tYaTIVPwNfGKxYNoZWwjnhlV6+n+IenOnZtgxxcbL20L0EdGl
 gF3ZBuaohRqRWkf0GDxDEEYfbIRQLiLbPqAOyFCsuY+rOsY3RNNREVO651kmqBxEVX7T
 IQB/hhBid1mx6utH86AqmlLMIdhSlplKT/NPxR3YCwm8QNTJ6Wu1DyGufiybQ/fAQn4+
 oMSzAooEsEly7aGtM1vom4AGdyF7N61b7klHuzrxISVbSkj+9pMZpC3DCfCBOF/6sEJo
 Lfz3k29BtjqQr3rHvP8fVTfbU7YCOA5hkQRyht2529ps7YQW+TH09x+B/aF1Ss6jaHx9
 5KxA==
X-Gm-Message-State: AOJu0YyBD5mimyspZ0uAyVivnGNs7RdkZVMn5RAVwW6Iz8Vo6dbfH25k
 cj5eiWuGGL/abfmD5o6gyv6fJj5xMzs87EgwHzYwQbjWMxzAS2PkKb2GeZ+QZA==
X-Gm-Gg: ASbGncubiP5WqkGX4WtcXYmKBFloc2GDNZSsLztUWALFNraHbri6ZZZ6k4CJLjGycri
 jAY5sLpzCLr7kWUk1GIp4UED7LeBZjUgAsgD8hi2ow+8vfhFaWgZwPYkWlRTZ0Qexvtyv2/MnIM
 Ua1S+o8F4/CJtcynbZtIbyDQnLog+W1jNx87GBxDvzP++0i6pi0ExM6iR5pBx+pHc4oe87RmYGl
 7ANNYTEypfpqISbfmkMCN/nHmIKq6sDywRg8ycS8S4DKtuIdOuLHGGXuUuBoVyfx3z5P+VgEUkV
 RuRzPIFJDI+k8p4Fnu8Nb+MyNgh3FTydN3bnuQvt0zEPJSPVOj1II4irqZ0WW6xwcgrKIpwQPyP
 rh6Smt/zbimRSIH6SFYZwdJZXBpnP7U/p
X-Google-Smtp-Source: AGHT+IFkyPTtpEtsmkRlyucVrwfE66B8ssitvmBXkwxRL9jtKdtkgo/o3ueK8W+OOXqXLdkC9lfhZw==
X-Received: by 2002:a05:6000:288b:b0:3cd:2328:898b with SMTP id
 ffacd0b85a97d-3d1e05b5c25mr5082937f8f.47.1756717292311; 
 Mon, 01 Sep 2025 02:01:32 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:32 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2025 11:01:17 +0200
Message-ID: <bdbfb71995632cadc167ddd9e21561a6208fee6d.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717292; x=1757322092; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+20S+DFFOdmk6EWupFTA5P+qHLiC5XhcLSSlG8mnCLU=;
 b=SxNq1qQt3rC1tlh4eiBZ51W1jkzzVvHydURFTgQkB5dlzzaZHAyQt7WPs/rBdFKTA2
 2PG+zoDZr3CC1PUxQwk+C+jAdlv4Kq67zm7Vm478iGGAxpbMoL2a08C5VyKf2S/zeYBL
 myTQB5rjwdvBHQ1zwlzjyGWDEqQu46vU8HbITRCVikVALKlAgnJvzwJBx3/QzOEgOOZL
 IggtEDctH4e65VGdRHE5VV9gbTtEbygUGedhmLRFA991/r19v/MDzDtKPx1FzQ9dpFpZ
 q2uCM9nCQQslcEIWTj91sFh8aOjAI7tyf+OWgKPBfb8G5pr+yklDVB9eWHU1XBMTxkqH
 mGWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SxNq1qQt
Subject: [Buildroot] [PATCH 08/18 v3] support/scripts: fix and restrict
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, we accept that the merged usr is backward, i.e. that the
/usr/bin, /usr/sbin, and /usr/lib entries be symlinks to, resp., /bin,
/sbin, and /lib. We also allow either entries to be symlinks to other
parts of the root. Both are accepted despite the comment at the top of
the script explaining what should be accepted.

However, a properly merged usr is the other way around: /bin, /sbin, and
/lib are the symlinks to resp. /usr/bin, /usr/sbin, and /usr/lib, which
are actual directories.

Fix the check-merged-usr script accordingly: implement the test as we
mean it, by testing the conditions rather than resorting to a convoluted
and incorrect use of stat(1).

Even though the split between test_dir() and test_merged() seems
superfluous, it'll come useful when we introduce support for merged-bin
in a later patch.

For skeletons, we require that the directories do exist, while we allow
them to be missing for overlays; indeed, it is perfectly legit to
provide an overlay that only contains totally unrelated directories
(e.g. /var/www to populate a webroot for example).

Extend the heading-comment to be more explicit (and drop '/' as there is
nothing to say about it).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v1 -> v2;
  - complete rewrite of the test
  - slight rephrase of commit log
  - typoes
---
 support/scripts/check-merged-usr.sh | 87 +++++++++++++++++------------
 1 file changed, 51 insertions(+), 36 deletions(-)

diff --git a/support/scripts/check-merged-usr.sh b/support/scripts/check-merged-usr.sh
index c3b5c6419a..34e726b4fb 100755
--- a/support/scripts/check-merged-usr.sh
+++ b/support/scripts/check-merged-usr.sh
@@ -2,13 +2,14 @@
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
+#   /bin            missing, or a relative symlink to usr/bin
+#   /lib            missing, or a relative symlink to usr/lib
+#   /sbin           missing, or a relative symlink to usr/sbin
+#   /usr/bin/       missing*, or an existing directory; not a symlink
+#   /usr/lib/       missing*, or an existing directory; not a symlink
+#   /usr/sbin/      missing*, or an existing directory; not a symlink
+#
+# *: must be present for skeletons, can be missing for overlays
 #
 # Input:
 #   --type TYPE     the type of root to check: 'skeleton' or 'overlay'
@@ -17,7 +18,7 @@
 #   stdout:         the list of non-compliant paths (empty if compliant).
 # Exit code:
 #   0:              in case of success (stdout will be empty)
-#   !0:             if any path is improperly merged
+#   !0:             if any directory to check is improperly merged
 #
 
 opts="type:"
@@ -38,6 +39,12 @@ while :; do
 	esac
 done
 
+if [ "${type}" = "skeleton" ]; then
+	strict=true
+else
+	strict=false
+fi
+
 report_error() {
 	local type="${1}"
 	local root="${2}"
@@ -54,44 +61,52 @@ report_error() {
 	is_success=false
 }
 
-# Extract the inode numbers for all of those directories. In case any is
-# a symlink, we want to get the inode of the pointed-to directory, so we
-# append '/.' to be sure we get the target directory. Since the symlinks
-# can be anyway (/bin -> /usr/bin or /usr/bin -> /bin), we do that for
-# each of them.
-#
-
-is_valid_merged() {
-	local root="${1}"
-	local dir1="${2}"
-	local dir2="${3}"
-	local inode1 inode2
-
-	inode1="$(stat -c '%i' "${root}${dir1}/." 2>/dev/null)"
-	inode2="$(stat -c '%i' "${root}${dir2}/." 2>/dev/null)"
-
-	test -z "${inode1}" || test "${inode1}" = "${inode2}"
-}
-
 test_merged() {
 	local type="${1}"
 	local root="${2}"
-	local dir1="${3}"
-	local dir2="${4}"
+	local base="${3}"
+	local dir1="${4}"
+	local dir2="${5}"
 
-	if ! is_valid_merged "${root}" "${dir1}" "${dir2}"; then
-		report_error "${type}" "${root}" \
-			'%s should be missing, or be a relative symlink to %s\n' \
-			"${dir1}" "${dir2}"
+	if ! test -e "${root}${base}${dir1}"; then
+		return 0
+	elif [ "$(readlink "${root}${base}${dir1}")" = "${dir2}" ]; then
+		return 0
 	fi
+
+	# Otherwise, this directory is not merged
+	report_error "${type}" "${root}" \
+		'%s%s should be missing, or be a relative symlink to %s\n' \
+		"${base}" "${dir1}" "${dir2}"
+}
+
+test_dir() {
+	local type="${1}"
+	local root="${2}"
+	local base="${3}"
+	local dir="${4}"
+
+	if ! test -e "${root}${base}${dir}" && ! ${strict}; then
+		return 0
+	elif test -d "${root}${base}${dir}" && ! test -L "${root}${base}${dir}"; then
+		return 0
+	fi
+
+	# Otherwise, this entry is not a proper directory
+	report_error "${type}" "${root}" \
+		"%s%s should exist, be a directory, and not be a symlink\n" \
+		"${base}" "${dir}"
 }
 
 is_success=true
 for root; do
 	first=true
-	test_merged "${type}" "${root}" "/lib" "/usr/lib"
-	test_merged "${type}" "${root}" "/bin" "/usr/bin"
-	test_merged "${type}" "${root}" "/sbin" "/usr/sbin"
+	test_dir "${type}" "${root}" "/" "usr/bin"
+	test_dir "${type}" "${root}" "/" "usr/lib"
+	test_dir "${type}" "${root}" "/" "usr/sbin"
+	test_merged "${type}" "${root}" "/" "bin" "usr/bin"
+	test_merged "${type}" "${root}" "/" "lib" "usr/lib"
+	test_merged "${type}" "${root}" "/" "sbin" "usr/sbin"
 done
 
 ${is_success}
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
