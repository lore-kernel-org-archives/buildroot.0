Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B519FC4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5145A42F2E;
	Sat, 28 Oct 2023 21:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5145A42F2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eltIzdDotszj; Sat, 28 Oct 2023 21:09:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4259D40911;
	Sat, 28 Oct 2023 21:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4259D40911
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A0751BF20B
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6377883D37
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6377883D37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NAgPrg36B6BS for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:09:10 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8212183D45
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8212183D45
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32f7db21967so412502f8f.1
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 14:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698527348; x=1699132148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uHKeN3XmKimeAheeLJd9F38LnaWfh6OoC/hFpckok60=;
 b=rftDbqDG0+NxOGb98rb5YirWRiBYcWe4qHqLiMgn9W3kmoeQXT4Qa6NLXqpr37zQKf
 0nfLO45WdUP93knmYgZ7XLGdNDc1UVL36UdV6IJEZFfnAQ53MM+Z0oPJ0yybIaVkQL6B
 TCUMCaQkUizYYRf+lMXXVTgiyvflMZ47IZsjw6ej1ViB0u2ydQ3DBelEzhem5F4ks6Np
 hOhx1pOWFCwtkn8QwakiXkZjIEZaofRoKe7oWpxK0PFMhN0rir4PPA5+SzkoHDgp61wU
 Sm1MsFZD5NaMlzhcRvP2RS1Yd9wQqb0la1azRgLpOzb+O1C818xJK/ODFXSIikio3Xb0
 ekCg==
X-Gm-Message-State: AOJu0YxOI68aebSYrWZNoAwYFKsHnKifQFo/LnyWHkoGdnLlVWaBMiSA
 qXIMniyAMqXKqfybksRpBZw9EycMw2Q=
X-Google-Smtp-Source: AGHT+IG59EKvBOmK447M0LNIEPDg20gx+8em1g02eB+cCDMzccfJDLL+cowEAk8O3zkMNF5jR9xtPQ==
X-Received: by 2002:a05:6000:719:b0:323:1d6a:3952 with SMTP id
 bs25-20020a056000071900b003231d6a3952mr6493208wrb.4.1698527348329; 
 Sat, 28 Oct 2023 14:09:08 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 by smtp.gmail.com with ESMTPSA id
 n17-20020adff091000000b0032da4c98ab2sm4604050wro.35.2023.10.28.14.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 14:09:08 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 23:09:05 +0200
Message-Id: <16d16274d5380dc52799d359704f1075c777c1eb.1698527340.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1698527340.git.yann.morin.1998@free.fr>
References: <cover.1698527340.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698527348; x=1699132148; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uHKeN3XmKimeAheeLJd9F38LnaWfh6OoC/hFpckok60=;
 b=Z6MSP+LNMZ7hghvvJKLGBUKmICCIDDbXGPwuXaawv+8W4mJ2BA8vyW8oYwWLDBE1vp
 Tvyt2GsuanqQMEyl5EgGveniePCJCJ+afSmTs+pCcqVOuZsKGTKE1P0TvqH6Ps94D3An
 CTEogE63lW4+S28vyjt87o5dN41Grc+d2kAtgSZs8fRCv1jgMPlSUmj2vZlLw1D+I7cd
 oMLw51Icm1EVno2lAs9wBabzbb7DkIE/4u4qdz10eSjKTSYhm0C37pYKNdyD0OcjVOCU
 TV5tS88R0dwfSQ2dt7XM8cqY115pAkn8uysQIJpmhpsvxFJL2YkRlUEo405+D0/JMISq
 XmAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z6MSP+LN
Subject: [Buildroot] [PATCH 2/4] support/download: teach dl-wrapper to
 handle more than one hash file
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Martin Zeiser \(mzeiser\)" <mzeiser@cisco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, we expect and only use hash files that lie within the package
directory, alongside the .mk file. Those hash files are thus bundeld
with Buildroot.

This implies that only what's known to Buildroot can ever get into those
hash files. For packages where the version is fixed (or a static
choice), then we can carry hashes for those known versions.

However, we do have a few packages for which the version is a free-form
entry, where the user can provide a custom location and/or version. like
a custom VCS tree and revision, or a custom tarball URL. This means that
Buildroot has no way to be able to cary hashes for such custom versions.

This means that there is no integrity check that what was downloaded is
what was expected. For a sha1 in a git tree, this is a minor issue,
because the sha1 by itself is already a hash of the expected content.
But for custom tarballs URLs, or for a tag in a VCS, there is indeed no
integrity check.

Buildroot can't provide such hashes, but interested users may want to
provide those, and currently there is no (easy) way to do so.

So, we need our download helpers to be able to accept more than one hash
file to lookup for hashes.

Extend the dl-wrapper and the check-hash helpers thusly.

Reported-by: "Martin Zeiser (mzeiser)" <mzeiser@cisco.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/check-hash | 64 ++++++++++++++++++++-----------------
 support/download/dl-wrapper | 10 +++---
 2 files changed, 39 insertions(+), 35 deletions(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index 5a47f49bc3..03a6557187 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -3,12 +3,12 @@ set -e
 
 # Helper to check a file matches its known hash
 # Call it with:
-#   $1: the path of the file containing all the expected hashes
-#   $2: the full path to the temporary file that was downloaded, and
+#   $1: the full path to the temporary file that was downloaded, and
 #       that is to be checked
-#   $3: the final basename of the file, to which it will be ultimately
+#   $2: the final basename of the file, to which it will be ultimately
 #       saved as, to be able to match it to the corresponding hashes
 #       in the .hash file
+#   $*: the paths of the files containing all the expected hashes
 #
 # Exit codes:
 #   0:  the hash file exists and the file to check matches all its hashes,
@@ -27,28 +27,21 @@ while getopts :q OPT; do
 done
 shift $((OPTIND-1))
 
-h_file="${1}"
-file="${2}"
-base="${3}"
-
-# Bail early if no hash to check
-if [ -z "${h_file}" ]; then
-    exit 0
-fi
-# Does the hash-file exist?
-if [ ! -f "${h_file}" ]; then
-    printf "WARNING: no hash file for %s\n" "${base}" >&2
-    exit 0
-fi
+file="${1}"
+base="${2}"
+shift 2
+declare -a h_files=( "${@}" )
 
 # Check one hash for a file
 # $1: algo hash
 # $2: known hash
 # $3: file (full path)
+# $4: hash file (full path)
 check_one_hash() {
     _h="${1}"
     _known="${2}"
     _file="${3}"
+    _h_file="${4}"
 
     # Note: md5 is supported, but undocumented on purpose.
     # Note: sha3 is not supported, since there is currently no implementation
@@ -70,6 +63,7 @@ check_one_hash() {
         return 0
     fi
 
+    printf "ERROR: while checking hashes from %s\n" "${_h_file}" >&2
     printf "ERROR: %s has wrong %s hash:\n" "${base}" "${_h}" >&2
     printf "ERROR: expected: %s\n" "${_known}" >&2
     printf "ERROR: got     : %s\n" "${_hash}" >&2
@@ -79,21 +73,31 @@ check_one_hash() {
 }
 
 # Do we know one or more hashes for that file?
+nb_h_files=0
 nb_checks=0
-while read t h f; do
-    case "${t}" in
-        ''|'#'*)
-            # Skip comments and empty lines
-            continue
-            ;;
-        *)
-            if [ "${f}" = "${base}" ]; then
-                check_one_hash "${t}" "${h}" "${file}"
-                : $((nb_checks++))
-            fi
-            ;;
-    esac
-done <"${h_file}"
+for h_file in "${h_files[@]}"; do
+    [ -f "${h_file}" ] || continue
+    : $((nb_h_files++))
+    while read t h f; do
+        case "${t}" in
+            ''|'#'*)
+                # Skip comments and empty lines
+                continue
+                ;;
+            *)
+                if [ "${f}" = "${base}" ]; then
+                    check_one_hash "${t}" "${h}" "${file}" "${h_file}"
+                    : $((nb_checks++))
+                fi
+                ;;
+        esac
+    done <"${h_file}"
+done
+
+if [ ${nb_h_files} -eq 0 ]; then
+    printf "WARNING: no hash file for %s\n" "${base}" >&2
+    exit 0
+fi
 
 if [ ${nb_checks} -eq 0 ]; then
     case " ${BR_NO_CHECK_HASH_FOR} " in
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 1e8d6058f6..35428faeef 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -21,8 +21,8 @@ export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:lru:qf:e"
 
 main() {
     local OPT OPTARG
-    local backend output hfile large_file recurse quiet rc
-    local -a uris
+    local backend output large_file recurse quiet rc
+    local -a uris hfiles
 
     # Parse our options; anything after '--' is for the backend
     while getopts ":c:d:D:o:n:N:H:lrf:u:qp:" OPT; do
@@ -33,7 +33,7 @@ main() {
         o)  output="${OPTARG}";;
         n)  raw_base_name="${OPTARG}";;
         N)  base_name="${OPTARG}";;
-        H)  hfile="${OPTARG}";;
+        H)  hfiles+=( "${OPTARG}" );;
         l)  large_file="-l";;
         r)  recurse="-r";;
         f)  filename="${OPTARG}";;
@@ -70,7 +70,7 @@ main() {
     # - fails at least one of its hashes: force a re-download
     # - there's no hash (but a .hash file): consider it a hard error
     if [ -e "${output}" ]; then
-        if support/download/check-hash ${quiet} "${hfile}" "${output}" "${output##*/}"; then
+        if support/download/check-hash ${quiet} "${output}" "${output##*/}" "${hfiles[@]}"; then
             exit 0
         elif [ ${?} -ne 2 ]; then
             # Do not remove the file, otherwise it might get re-downloaded
@@ -154,7 +154,7 @@ main() {
 
         # Check if the downloaded file is sane, and matches the stored hashes
         # for that file
-        if support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
+        if support/download/check-hash ${quiet} "${tmpf}" "${output##*/}" "${hfiles[@]}"; then
             rc=0
         else
             if [ ${?} -ne 3 ]; then
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
