Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26000C5B572
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 01:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4254A80C33;
	Thu, 20 Aug 2026 01:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQpYItG5o_87; Thu, 20 Aug 2026 01:35:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787189700;
	bh=DA/hIruiiZw809lzIU7fxBIcsm0lV1it9ZvIZlzR8dI=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=peABrn5vPkP8b18XBvmoHADyV4e99QXdp9ppgKfU1IlxDkbKdCtPcLmsfcunZFRR1
	 pFST6oLCqIoJUj9Tkp3nv9f4+bz/PHN9cDmRENxWdpKwsWJE9E+mtKUhA0u9c52vSD
	 VMTtua7zU5HERjtRbNeg70ikRFRxFqay+1akOeSFanPyMc/M1snojc3MFR/DCZekQW
	 Bas/Nn0lgE0IIUzxO5qBcBRjC8HATmqgTP9nY7KuD73TNSbwlwwMRZTGx9FF1Y5wCI
	 cHi7nKsvYgvkwNNAXzGsCV8T5/jslwKPYJgjd9nSbnN60ec5qWjbANe/1SUDJdxjID
	 ah8KBrXqR/0PQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F00980BFE;
	Thu, 20 Aug 2026 01:35:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F1D972FD
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 01:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB22C60604
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 01:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPBA_PNEUlWn for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 01:34:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=BaH+KkGk
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EACDB60603
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 01:34:58 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-38511175ad3so1577011a91.2
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 18:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787189698; x=1787794498; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=ZmO8CGTHrXfXj66ur+Be9cVbuBrr3IUedU99QysFYFg=;
 b=BaH+KkGk4Z+Zs7lbmGrhXaqUHczNrE1G+/b00WcRNMNHxeTB8ZCsmcYVZzvEMTOlR7
 t/BjS4vxoORpPQDEP8k5K0WMhnrY2OMphjV0aFaFot7a2JoBagIb7aJSWccuO3H7xrsh
 HhZuQMISBOrMxydEHTVzaIaCEz++FO/eqT1K8kqxXvqATs+DFw0o+lbIFqUls83x16NO
 EShdsCVk9POxcFs9MG5V6vpRXREl7p/S+wlEtWUbJk+D8BcPgBt1EW6jWhSautchRhW/
 yHrYHSWB9UiHGZgFEkWYRoaoea1ooKVOUlRwK/sCgL9kznQK8RiX8ug+sA0J9kRlP0qW
 jfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787189698; x=1787794498;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=ZmO8CGTHrXfXj66ur+Be9cVbuBrr3IUedU99QysFYFg=;
 b=MzwSdPQPDiVvr9U8tAHe8AvhN50hOedBrhJG1idVddCum6qihPeeA8g7NC7HQB6qzC
 R6gR7xHXf/g2E+mTszr7O12fU25Vmv7KGwHyuM5G+UHWJf41Onk5n0lM63eMCsdZhrKm
 Cam+1WpRICLL7OOJL/SgePZhq4r4Zw0tHAb0rGUvWG0GgsOkyKWnaWJ+WX2bBApqapae
 1W6eiVFyuo3lRu1qoXj9clays2ZBLnTG8tnRTAXwY4ByliMji2JsJjJpFbTrhbcF6NbY
 nzNlkF3rmPbPnT18Ps5Lltl1x3blMXf7Fev2yCHcERlFKn3ejx14Q8sdvNdaauPfz1Qk
 fp/Q==
X-Gm-Message-State: AFuF++lanLbNgKT2w1i1oZq2Xd7LYVnUG6dHWxbd2cQO8mWbm2Xxo6bQ
 5DTXF8WWGjlAqyh2k8gQBpT4VMa1xYPnw5NHA8vem12ImdtqNr1HqTM2
X-Gm-Gg: AR+sD128cc+ZxbQzV/swqOsDMOYzrk1HeSuhrct3tl7VhifkinOuhr+rbV6TS5qAufk
 6qEgcdcEAcd6jBe3r/aQEpWxA2SqwyphMdx4ZQv3VRo3gsbiE+SJQHmoJDiA+kb2fPdKdQ4eqfk
 UDKfq8CKcBvZeYB89sNj0d+xyvofpFYoBVRmmuRtMcV68d4/xRf1DTmYC5PsLHSZE/9UC/sqtQh
 RcpObUyY6dUh34GZ9lr8tYqvofiS/3zrcB2QkC7x5V8OgQzuzTy3KVfk9Yd05XF02Vii/GNbuE3
 o5dFLz1nir76nOCM1oLgg6ATfAsnxZAELcciW6uKk+Dty+1X/GCuSPevJZtdfG6LMfa45lZ3fhE
 EMjF/jR72AdkxAUkoYXYk9k8sp+YrLIZfoMSvHOI0lgC5+fp6fRsPV8Xke9tCLX7NDpZ1l0AS2g
 /1muz2pAxNLSd1bqsKmKqX3iChz9qSS2TAdsbf+M8fxvHSO1fcojAPVg67/LrS4CJ8
X-Received: by 2002:a17:90b:2f06:b0:37f:e177:f58 with SMTP id
 98e67ed59e1d1-3958108a0f9mr17215929a91.9.1787189697792; 
 Wed, 19 Aug 2026 18:34:57 -0700 (PDT)
Received: from wash-4.local ([50.47.124.161]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3957f96cb76sm4916563a91.1.2026.08.19.18.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 18:34:57 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 19 Aug 2026 18:32:20 -0700
MIME-Version: 1.0
Message-Id: <20260819-concurrent-test-pkg-v4-1-a84c1a54e90c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NTQ6DIBAF4Ks0rEvDn0a66j2aLhAGJa1ggJo2x
 rsXXZnUzOolb743owTRQULX04wiTC654EsQ5xPSvfIdYGdKRoywitRUYh28fscIPuMMKePx2WH
 LlakN14S2ApXPMYJ1n029P0puVQLcRuV1v1qDShniWuxdyiF+t/WJrvVtiBLGDocmistZkLWxt
 LTaWzco97roMKB1aGJ7gx8brBiyksoIwY2QfwbfG82xwYuhgFBhaAOVrfbGsiw/2eZAD1cBAAA
 =
X-Change-ID: 20250619-concurrent-test-pkg-f3ad6d3c01b4
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787189697; l=7703;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=EhL6NGkPzI+1HVgVJKJpyThl49WNEnWkwVDSmuONOQg=;
 b=4NYIIEEznU2cTPAA4egrkXqOKNCPgGuaC8++wv+Z2wZOzUqIfx3BrQrBqCQZyZB4J7WzuCwRR
 tXOn9iyIO/NBCtZchf86rmBMAxj4f9D8We2WXjUzOtAMrTbiS1HXFve
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
Subject: [Buildroot] [PATCH v4] utils/test-pkg: add --jobs option
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

Builds run by test-pkg are often not CPU limited, so running several
builds concurrently reduces the time needed to test a package across
many toolchains.

Add a -j/--jobs option to run multiple builds in parallel.

Quote "keep" in build_one(), as it is now passed in as an argument
rather than set from a literal.

Testing sdl2 on six toolchains with a 16-core Ryzen 9 9950X reduced wall
clock time from 2m32.979s with -j1 to 0m41.704s with -j0. Testing libpng
across all 35 toolchains reduced wall clock time from 23m34.593s to
2m6.510s, an approximately 11x speedup.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
Changes in v4:
- Rewritten to use GNU parallel
- Changed -C -> -j (more idiomatic)
- Link to v3: https://lore.kernel.org/r/20251028-concurrent-test-pkg-v3-1-ae014d18e5f5@gmail.com

Changes in v3:
- Fix improper removal of '-T' short option during rebase
- Minor tweak to remove newline between prompt and output
- Simplify make job termination
- Link to v2: https://lore.kernel.org/r/20251023-concurrent-test-pkg-v2-1-959ad443d49b@gmail.com

Changes in v2:
- Rebase on origin/master
- Properly restore cursor on interrupt
- Properly terminate running jobs on interrupt
- Add animated spinner for running builds
- Simplify status updates
- Link to v1: https://lore.kernel.org/r/20251022-concurrent-test-pkg-v1-1-1fe96df1102b@gmail.com

To: buildroot@buildroot.org
---
 utils/test-pkg | 84 ++++++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 70 insertions(+), 14 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index cea7ace7cb..887cebb4d2 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -17,13 +17,13 @@ do_clean() {
 
 main() {
     local o O opts
-    local cfg dir pkg random toolchains_csv toolchain all number mode prepare_only
-    local ret nb nb_skip nb_fail nb_legal nb_show nb_tc build_dir keep
+    local cfg dir pkg random toolchains_csv toolchain all number mode prepare_only jobs
+    local ret nb nb_skip nb_fail nb_legal nb_show nb_tc keep
     local -a toolchains
     local pkg_br_name
 
-    o='hakc:d:n:p:r:t:T:'
-    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:,toolchain-name:'
+    o='hakc:d:j:n:p:r:t:T:'
+    O='help,all,keep,prepare-only,config-snippet:,build-dir:,jobs:,number:,package:,random:,toolchains-csv:,toolchain-name:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
@@ -33,6 +33,7 @@ main() {
     number=0
     mode=0
     prepare_only=0
+    jobs=1
     toolchains_csv="${TOOLCHAINS_CSV}"
     while [ ${#} -gt 0 ]; do
         case "${1}" in
@@ -54,6 +55,9 @@ main() {
         (-d|--build-dir)
             dir="${2}"; shift 2
             ;;
+        (-j|--jobs)
+            jobs="${2}"; shift 2
+            ;;
         (-n|--number)
             number="${2}"; shift 2
             ;;
@@ -88,6 +92,12 @@ main() {
     if [ ! -e "${cfg}" ]; then
         printf "error: %s: no such file\n" "${cfg}" >&2; exit 1
     fi
+    case "${jobs}" in
+    (''|*[!0-9]*) printf "error: invalid number of jobs: %s\n" "${jobs}" >&2; exit 1;;
+    esac
+    if [ "${jobs}" -eq 0 ]; then
+        jobs="$(getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1)"
+    fi
     if [ -z "${dir}" ]; then
         dir="${HOME}/br-test-pkg"
     fi
@@ -137,12 +147,9 @@ main() {
     nb_fail=0
     nb_legal=0
     nb_show=0
-    for toolchainconfig in "${toolchains[@]}"; do
+    while read -r ret toolchain; do
         : $((nb++))
-        toolchain="$(basename "${toolchainconfig}" .config)"
-        build_dir="${dir}/${toolchain}"
         printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} "${nb}" "${nb_tc}"
-        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" "${prepare_only}" && ret=0 || ret=${?}
         case ${ret} in
         (0) printf "OK\n";;
         (1) : $((nb_skip++)); printf "SKIPPED\n";;
@@ -150,11 +157,15 @@ main() {
         (3) : $((nb_legal++)); printf "FAILED\n";;
         (4) : $((nb_show++)); printf "FAILED\n";;
         esac
+    done < <(run_builds)
 
-        if [ "${abort}" -eq 1 ]; then
-            return 1
-        fi
-    done
+    if [ "${abort}" -eq 1 ]; then
+        return 1
+    fi
+    if [ "${nb}" -ne "${nb_tc}" ]; then
+        printf "error: only %d of the %d builds reported a status\n" "${nb}" "${nb_tc}" >&2
+        return 1
+    fi
 
     printf "%d builds, %d skipped, %d build failed, %d legal-info failed, %d show-info failed\n" \
         "${nb}" "${nb_skip}" "${nb_fail}" "${nb_legal}" "${nb_show}"
@@ -162,6 +173,47 @@ main() {
     return $((nb_fail + nb_legal))
 }
 
+run_builds() {
+    local toolchainconfig
+
+    if [ "${jobs}" -gt 1 ]; then
+        if parallel --version 2>/dev/null | grep -q '^GNU parallel'; then
+            export -f build_one build_one_status
+            # --quote, so that empty and spaced arguments survive.
+            PARALLEL_SHELL=bash parallel --will-cite --quote --jobs "${jobs}" \
+                --ungroup build_one_status {} "${dir}" "${cfg}" "${pkg}" \
+                "${prepare_only}" "${keep}" ::: "${toolchains[@]}" || true
+            return
+        fi
+        printf "warning: GNU parallel not available; running builds serially\n" >&2
+    fi
+    # We run in a sub-shell, which does not inherit the trap set in
+    # main(), so re-arm it to keep stopping after the current build.
+    trap do_abort INT
+    for toolchainconfig in "${toolchains[@]}"; do
+        build_one_status "${toolchainconfig}" "${dir}" "${cfg}" "${pkg}" \
+            "${prepare_only}" "${keep}"
+
+        if [ "${abort}" -eq 1 ]; then
+            break
+        fi
+    done
+}
+
+build_one_status() {
+    local toolchainconfig="${1}"
+    local dir="${2}"
+    local cfg="${3}"
+    local pkg="${4}"
+    local prepare_only="${5}"
+    local keep="${6}"
+    local toolchain ret
+
+    toolchain="$(basename "${toolchainconfig}" .config)"
+    build_one "${dir}/${toolchain}" "${toolchainconfig}" "${cfg}" "${pkg}" "${prepare_only}" && ret=0 || ret=${?}
+    printf "%d %s\n" "${ret}" "${toolchain}"
+}
+
 build_one() {
     local dir="${1}"
     local toolchainconfig="${2}"
@@ -182,7 +234,7 @@ build_one() {
     # done in the same locale.
     comm -23 <(sort "${cfg}") <(sort "${dir}/.config") >"${dir}/missing.config"
     if [ -s "${dir}/missing.config" ]; then
-        if [ ${keep} -ne 1 ]; then
+        if [ "${keep}" -ne 1 ]; then
             # Invalid configuration, drop it
             rm -f "${dir}/.config"
         fi
@@ -229,7 +281,7 @@ build_one() {
 
     # If we get here, the build was successful. Clean up the build/host
     # directories to save disk space, unless 'keep' was set.
-    if [ ${keep} -ne 1 ]; then
+    if [ "${keep}" -ne 1 ]; then
         make O="${dir}" clean >> "${dir}/logfile" 2>&1
     fi
 }
@@ -299,6 +351,10 @@ Options:
         is specified, then a single build will be performed on that
         specific toolchain only.
 
+    -j N, --jobs N
+        Run N builds concurrently using GNU parallel. If N is 0, match the
+        number of logical CPUs. Builds run serially if GNU parallel is missing.
+
     -k, --keep
         Keep the build directories even if the build succeeds.
         Note: the logfile and configuration is always retained, even without

---
base-commit: 6144b0f4b73bea810809f09d23bbe76b4979bc13
change-id: 20250619-concurrent-test-pkg-f3ad6d3c01b4

Best regards,
--  
Joseph Kogut <joseph.kogut@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
