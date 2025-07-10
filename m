Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09C4C83F20
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6C1380D96;
	Thu, 10 Jul 2025 20:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5UQA_hlqA065; Thu, 10 Jul 2025 20:23:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B122B81105
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B122B81105;
	Thu, 10 Jul 2025 20:23:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E94C12E
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D133D6131E;
 Thu, 10 Jul 2025 20:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id va1SaTjphXl1; Thu, 10 Jul 2025 20:23:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0181B613CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0181B613CE
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0181B613CE
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:06 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so15557665e9.1
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178985; x=1752783785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3TNk7aNWZ1w/3jJKLKGeR3ebY/sOLr17NazFwXHwSaw=;
 b=dVuxCDw4eqbvUty+uxdnwyRAyrtCcLz9HtoMtV3H8mKhPmyV8j5hXQg+3eX3BZuh0W
 igK7MY+9BN689+YUio90Qq0CIPiYOrl0LHBJn7Q7LVGoCUqUuK6NMmD5eYQbfBlhlAuL
 H8yqchBrnqQFyj+Td7NfDSwj7N6pHRPt/wiQDoBMxmRzLX3vDLiKRc0j+x+qLyp1ylvw
 wKgcPfPTbuJB4QJhShBa6DhVF+KJKeae5RKED5np2KDjakkLhSN6ft+ewOIz6x+YnVNN
 xEF22nY8bpMCoq/i/raInT0T3K2S3vWZ4AxsSNCVlk7/re9JFPi+n9nzrCxXsr35/ooj
 1Arg==
X-Gm-Message-State: AOJu0YzM/WaxjnYXTU3ewrcAKV5gEgildkh4vnUKSNzWslRrTcT7jKZM
 wYg/NYSyLWJ1MNuziWZcP9JniZVDSKzptdlkLsMyKphZ0qzrNUskOd9gd2UXzA==
X-Gm-Gg: ASbGnctBQnc360JDOnTL/UpdQF9yT9zrc3mG6h5jznhOmBZNyxubpK1GYkUzL4YutGi
 tgPzagep1COSTIabDw9MZDqBaarHhu7JnFtWLgwRyhXziH9bPE5IbGsAmmN2bFaJA592UEEakuW
 qh9enakjpz8lBRZaxFjsT7iGYlWG8JDm41VFLKqYXaIFI6UjC2GNsv1E0LylAPC0P5YpXUpYf+v
 s5u3zNEpKolnr1Mp1roQc9wiXxYhXwJcXUPqvS1n6tum7fyzTTUEV+XL2vj8pRXrtddGGxmo0vX
 FNavCpOTNIhjnikumz7vzpQ+Qyce75RHwwcEnYfN4710X/sKhXNVxq/dNKiJ3KB6h7Mcn0+f
X-Google-Smtp-Source: AGHT+IG3Ss+mboGSjr/K28pgnQnLH8d5A6mMYRobq3wb9DzCIHoGGbXC/YH6q4HxjVpZCWv0tCPvMQ==
X-Received: by 2002:a05:600c:1547:b0:43c:ea1a:720c with SMTP id
 5b1f17b1804b1-454f4258608mr1656215e9.18.1752178984883; 
 Thu, 10 Jul 2025 13:23:04 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1997sm2742694f8f.10.2025.07.10.13.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:23:04 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu, 10 Jul 2025 22:22:50 +0200
Message-ID: <e2fccfdc9effaabbf8d88737797282b61590fb56.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178985; x=1752783785; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3TNk7aNWZ1w/3jJKLKGeR3ebY/sOLr17NazFwXHwSaw=;
 b=SQyBHVKgk7Ldb9K0VWt/8EoeyMyRtnA/8PcEqVHkVrUYzdS7CR3f9o21W31fBRo+bV
 rdl7v+AaUu9Wq9In44dDNc0B/LDkwJgUrjc2XPjFsQtQvY3v9WNbqlUYeLHTb/YxuOlz
 KTglvenv7DRXBh5d0Kw8C5eZnCI8wVEu6EQrvsgFHbeif1e1u2kXubj5mOgW5VU7p6Oo
 rK53wlT1oDJkBpLhG3R1n+kMxAp2F7OyesrOieZZN9DGjrbIaSUIWvXZHoSDRmlEIpJw
 7PyrYY/K4b/QVkVPNaejhZWwosyE78lOG6k5rA3QlP8b4X/iXh/aqq6+bQpsJ5avxcOr
 DuUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SQyBHVKg
Subject: [Buildroot] [PATCH 08/17 v2] support/scripts: fix and restrict
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
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
