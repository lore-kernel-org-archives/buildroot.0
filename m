Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3B4CCD1BF
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 20:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A086284094;
	Wed, 22 Oct 2025 20:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id acBDrXKblhuy; Wed, 22 Oct 2025 20:06:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85D0484096
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85D0484096;
	Wed, 22 Oct 2025 20:06:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 26832DE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 20:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17BDD84096
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 20:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8XCTcm5GYts2 for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 20:06:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CB9F84094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CB9F84094
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CB9F84094
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 20:06:07 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-33d962c0e9aso15024a91.0
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 13:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761163567; x=1761768367;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gsqqxiih4U4cLafI5bHk2ektfWFjYbvKra6jCw7t9js=;
 b=HlSy7cdMLRMt9rlPnWcbW1NNKajrPj6ilpgWPP93dkkclf7GjHk1AnDG9a7yK4b6GY
 /5ALXuWUV7poW65fW9vg/WYt4j02UiOWjDWzV1YfgjpYv8+1REw3WFix1LbH4ZByhDD0
 9ldU+cTnP8o1j28UlklNhnsYH6negqQxbpN2FtXoJzbmakWpWxwH6OBMIH2++hZzX2tp
 9mQEttmtkr62KPcjcz2ccZ6ZDTLWryU27sykqHKZeBarhQaxLQY2CB0d2RTGlB4rsgYK
 ZOCJow6v03DO58SxZGX5EZnFWUd7/sTB0Ja0jPW1Fl9XnJqV9pUK+Gnlvw4XcVRynKqz
 QAdA==
X-Gm-Message-State: AOJu0YzUsgTsD+hDgvXF+W0imEnrqh3XE9D+S4T3cn5AzEQEHJPI4QjT
 s1TJtdgGJBqF8Ext04M7LuN3z27gRhdG5V43e4rTRF+gGqRRKZDjFFd34JgPfH0J
X-Gm-Gg: ASbGncvp+QRejLQqndEIKfl5HjgjMppN9jIxBcfZWFiMh+hCp2pRkT5rkfN/pnUy3l0
 e0BVxUFStWS/ZA0sdfJAQkstp1aEIY1B4WYzJGHiaN34Vcks7JT+Pf1hnGaMgUv1HeZL9zLEUaB
 CVS74biODx8tqp+obqZAQoUKNZudd50FXoHjDPcl+jDoerfRTkcRWcDRwOcsT/44NXp7zpw+Ota
 osox/yxN/ltQtLb++LGAW9O9qY8Q6nPVvz/BEX8aG33Q04UrjxF/pnOhkozOmn+7T3NbnuFClt+
 sc6aBw5+TnZ3/z0LzxVQoWhaQ7aXcy3u6gOnWz8oQmy8/M5OHiezGWjnHYO+BgrQLBc01q4HizE
 pEm8RtWNyrZFUAUZkfGB/lpNYXc2jamae/fVvQ/YTtdophOXOuVBafp2Ya5SuWKOiAWD8aK/lh9
 x8iVqQSmWms2w=
X-Google-Smtp-Source: AGHT+IHtFFXcpUiYDEprOz9o4VCm27g7FtdgCoBoxCl4MyAlA/mjIkZosxOZDulfcjjg5BY2oVInLw==
X-Received: by 2002:a17:90b:2ec8:b0:330:b9e8:32e3 with SMTP id
 98e67ed59e1d1-33e21f08e2dmr5937151a91.12.1761163566808; 
 Wed, 22 Oct 2025 13:06:06 -0700 (PDT)
Received: from wash.local ([50.46.184.91]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33fb0172476sm15275a91.13.2025.10.22.13.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 13:06:06 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 22 Oct 2025 13:06:04 -0700
MIME-Version: 1.0
Message-Id: <20251022-concurrent-test-pkg-v1-1-1fe96df1102b@gmail.com>
X-B4-Tracking: v=1; b=H4sIACs5+WgC/03MQQrCMBCF4auUWTuYtLWgW6EHcCsuksk0CYE0J
 FGE0rsbXbn8H7xvg8LZc4FLt0Hmly9+jS3koQNyKlpGb1pDL/qTmOQZaY30zJljxcqlYgoWl0G
 ZyQwkpB6hPVPmxb9/6h1u8xUebdSqMOqsIrkvqMfjH0WOKWBSFJRl2PcP5aq3VpgAAAA=
X-Change-ID: 20250619-concurrent-test-pkg-f3ad6d3c01b4
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761163566; l=14366;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=ITSava82j7v/N/Z8+niPywD2jCh00dZvPTghAiB7Uaw=;
 b=/9a7JKKDJV4+7+LFHPFoJlKYSifp94IteawXOUBgoTQG3Y+q+JlEZO5vo7w40x+JMed3gLlXr
 HW33ZL70vBWCzORXR0+qggvIZ7ZPJFywwNJOr9J+TWSpczbzCXaNLQN
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761163567; x=1761768367; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gsqqxiih4U4cLafI5bHk2ektfWFjYbvKra6jCw7t9js=;
 b=i9sTcKGyHbkcTTxQdF59alXVdvTCOBUx3dmYW6FGkAeqY1n3iqitbCBjav18pxqnxV
 dZdaTLu/pRKrG3Lc08nE8MOH9bzPYJ9kawuvq8LR9xdO+M2mzW1pXWv/tqADr+hTQ3sL
 36VDnjWIqb+P3AEwi3b75zMTWzB5DQLxNzUCRe56KH5a8bfMrFBkIcpPUIFOdlHmW3Di
 tiNYihsyWa3EPZgXFjmgk2a4K1w4k3vJ9ypJgF+4cDfNz4kxPCYd7GTbLP5H8Le/Vd6/
 pP4hf04meb64jRgNiVWPNhFiUIPM67JbkInwcmYIX+SyeZMY+TsgTgMccB5/3clLI0ys
 vy6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=i9sTcKGy
Subject: [Buildroot] [PATCH RFC] utils/test-pkg: add concurrency parameter
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

Builds run by test-pkg are often not CPU limited, and so running
multiple builds concurrently has the potential to speed things up quite
a lot.

Add a concurrency parameter to the script that allows for multiple
builds to run concurrently. The default is the current behavior, running
a single build at a time. If -C|--concurrent=0 is specified, the number of
concurrent builds is set to the output of $(nproc) to match the number
of logical CPUs.

$ time bash utils/test-pkg -c sdl2.config -p sdl2 -C1

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                             arm-aarch64 [6/6]: OK

6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

real    2m32.979s
user    6m15.356s
sys     0m30.878s

$ time bash utils/test-pkg -c sdl2.config -p sdl2 -C0

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                             arm-aarch64 [6/6]: OK

6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

real    0m41.704s
user    6m40.802s
sys     0m29.976s

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
I'm labeling this an RFC for now, as this script may need some more
testing to ensure there aren't any bugs with rendering, job cleanup, or
problems with terminfo dependencies that aren't widely supported.

The patch appears to behave as intended in my testing, and it speeds up
package testing quite a lot. The commit description shows the results
testing sdl2, and I've pasted another result below from building the
llama-cpp package I've recently submitted.

$ time utils/test-pkg -c llama-cpp.config -a -p llama-cpp
                             arm-aarch64 [ 1/40]: OK
                   bootlin-aarch64-glibc [ 2/40]: OK
               bootlin-arcle-hs38-uclibc [ 3/40]: SKIPPED
                    bootlin-armv5-uclibc [ 4/40]: SKIPPED
                     bootlin-armv7-glibc [ 5/40]: OK
                      bootlin-armv7-musl [ 6/40]: OK
                   bootlin-armv7m-uclibc [ 7/40]: SKIPPED
                bootlin-m68k-5208-uclibc [ 8/40]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/40]: SKIPPED
             bootlin-microblazeel-uclibc [10/40]: SKIPPED
                   bootlin-mipsel-uclibc [11/40]: SKIPPED
                bootlin-mipsel32r6-glibc [12/40]: OK
                 bootlin-openrisc-uclibc [13/40]: SKIPPED
           bootlin-powerpc-e500mc-uclibc [14/40]: SKIPPED
        bootlin-powerpc64le-power8-glibc [15/40]: OK
                   bootlin-riscv32-glibc [16/40]: SKIPPED
                   bootlin-riscv64-glibc [17/40]: SKIPPED
                    bootlin-riscv64-musl [18/40]: SKIPPED
                 bootlin-s390x-z13-glibc [19/40]: SKIPPED
                      bootlin-sh4-uclibc [20/40]: SKIPPED
                    bootlin-sparc-uclibc [21/40]: SKIPPED
                   bootlin-sparc64-glibc [22/40]: OK
                    bootlin-x86-64-glibc [23/40]: OK
                     bootlin-x86-64-musl [24/40]: OK
                   bootlin-x86-64-uclibc [25/40]: SKIPPED
                   bootlin-x86-i686-musl [26/40]: OK
                   bootlin-xtensa-uclibc [27/40]: SKIPPED
                            br-arm-basic [28/40]: SKIPPED
                    br-arm-full-nothread [29/40]: SKIPPED
                      br-arm-full-static [30/40]: SKIPPED
                   br-i386-pentium4-full [31/40]: SKIPPED
                      br-mips64-n64-full [32/40]: SKIPPED
                 br-mips64r6-el-hf-glibc [33/40]: OK
               br-powerpc-603e-basic-cpp [34/40]: SKIPPED
               br-powerpc64-power7-glibc [35/40]: OK
                       linaro-aarch64-be [36/40]: SKIPPED
                          linaro-aarch64 [37/40]: SKIPPED
                              linaro-arm [38/40]: SKIPPED
                           sourcery-mips [39/40]: SKIPPED
                         sourcery-mips64 [40/40]: SKIPPED
40 builds, 28 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

real    15m30.117s
user    37m47.514s
sys     1m24.012s

$ time utils/test-pkg -c llama-cpp.config -a -p llama-cpp -C0

                             arm-aarch64 [ 1/40]: OK
                   bootlin-aarch64-glibc [ 2/40]: OK
               bootlin-arcle-hs38-uclibc [ 3/40]: SKIPPED
                    bootlin-armv5-uclibc [ 4/40]: SKIPPED
                     bootlin-armv7-glibc [ 5/40]: OK
                      bootlin-armv7-musl [ 6/40]: OK
                   bootlin-armv7m-uclibc [ 7/40]: SKIPPED
                bootlin-m68k-5208-uclibc [ 8/40]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/40]: SKIPPED
             bootlin-microblazeel-uclibc [10/40]: SKIPPED
                   bootlin-mipsel-uclibc [11/40]: SKIPPED
                bootlin-mipsel32r6-glibc [12/40]: OK
                 bootlin-openrisc-uclibc [13/40]: SKIPPED
           bootlin-powerpc-e500mc-uclibc [14/40]: SKIPPED
        bootlin-powerpc64le-power8-glibc [15/40]: OK
                   bootlin-riscv32-glibc [16/40]: SKIPPED
                   bootlin-riscv64-glibc [17/40]: SKIPPED
                    bootlin-riscv64-musl [18/40]: SKIPPED
                 bootlin-s390x-z13-glibc [19/40]: SKIPPED
                      bootlin-sh4-uclibc [20/40]: SKIPPED
                    bootlin-sparc-uclibc [21/40]: SKIPPED
                   bootlin-sparc64-glibc [22/40]: OK
                    bootlin-x86-64-glibc [23/40]: OK
                     bootlin-x86-64-musl [24/40]: OK
                   bootlin-x86-64-uclibc [25/40]: SKIPPED
                   bootlin-x86-i686-musl [26/40]: OK
                   bootlin-xtensa-uclibc [27/40]: SKIPPED
                            br-arm-basic [28/40]: SKIPPED
                    br-arm-full-nothread [29/40]: SKIPPED
                      br-arm-full-static [30/40]: SKIPPED
                   br-i386-pentium4-full [31/40]: SKIPPED
                      br-mips64-n64-full [32/40]: SKIPPED
                 br-mips64r6-el-hf-glibc [33/40]: OK
               br-powerpc-603e-basic-cpp [34/40]: SKIPPED
               br-powerpc64-power7-glibc [35/40]: OK
                       linaro-aarch64-be [36/40]: SKIPPED
                          linaro-aarch64 [37/40]: SKIPPED
                              linaro-arm [38/40]: SKIPPED
                           sourcery-mips [39/40]: SKIPPED
                         sourcery-mips64 [40/40]: SKIPPED

40 builds, 28 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

real    2m32.778s
user    54m8.452s
sys     1m44.897s

This test was performed on a 16-core Ryzen 9 9950X, and the
all-toolchain build was ~6x faster compared to the same serial run. The
improvement would be greater with a build that launches more jobs (fewer
skips).

As always, feedback is very welcome.
---
 utils/test-pkg | 141 +++++++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 126 insertions(+), 15 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 19d8713d6a..345fc4832d 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -4,20 +4,34 @@ set -e
 TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
 TEMP_CONF=""
 
+declare -a running
+
 do_clean() {
+    # restore cursor
+    tput cnorm
+    printf '\n'
+
     if [ -n "${TEMP_CONF}" ]; then
         rm -f "${TEMP_CONF}"
     fi
+
+    # Terminate any running jobs
+    for pid in "${!running[@]}"; do
+        if kill -0 "${running[i]}" 2>/dev/null; then
+            kill -TERM "$pid" 2>/dev/null || true
+        fi
+    done
 }
 
 main() {
     local o O opts
-    local cfg dir pkg random toolchains_csv toolchain all number mode prepare_only
+    local cfg dir pkg random toolchains_csv toolchain all number mode prepare_only \
+	    concurrency
     local ret nb nb_skip nb_fail nb_legal nb_show nb_tc build_dir keep
     local -a toolchains
     local pkg_br_name
 
-    o='hakc:d:n:p:r:t:'
+    o='hakc:d:n:p:r:t:C:'
     O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
@@ -28,6 +42,7 @@ main() {
     number=0
     mode=0
     prepare_only=0
+    concurrency=1
     toolchains_csv="${TOOLCHAINS_CSV}"
     while [ ${#} -gt 0 ]; do
         case "${1}" in
@@ -61,6 +76,9 @@ main() {
         (-t|--toolchains-csv)
             toolchains_csv="${2}"; shift 2
             ;;
+        (-C|--concurrency)
+            concurrency="${2}"; shift 2
+            ;;
         (--)
             shift; break
             ;;
@@ -79,6 +97,13 @@ main() {
     if [ ! -e "${cfg}" ]; then
         printf "error: %s: no such file\n" "${cfg}" >&2; exit 1
     fi
+    if [ "${concurrency}" -eq 0 ] 2>/dev/null; then
+        concurrency=$(nproc)
+    fi
+
+    if ! [ "${concurrency}" -gt 0 ] 2>/dev/null; then
+        printf "error: concurrency must be an integer\n" >&2; exit 1
+    fi
     if [ -z "${dir}" ]; then
         dir="${HOME}/br-test-pkg"
     fi
@@ -95,6 +120,13 @@ main() {
         mode=$((mode+1))
     fi
 
+    tput civis
+    tput sc
+
+    declare -A pid_to_idx
+    declare -a running
+    declare -a display_order
+
     # Default mode is to test the N first toolchains, which have been
     # chosen to be a good selection of toolchains.
     if [ ${mode} -eq 0 ] ; then
@@ -126,27 +158,103 @@ main() {
     nb_fail=0
     nb_legal=0
     nb_show=0
-    for toolchainconfig in "${toolchains[@]}"; do
-        : $((nb++))
-        toolchain="$(basename "${toolchainconfig}" .config)"
-        build_dir="${dir}/${toolchain}"
-        printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} "${nb}" "${nb_tc}"
-        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" "${prepare_only}" && ret=0 || ret=${?}
-        case ${ret} in
-        (0) printf "OK\n";;
-        (1) : $((nb_skip++)); printf "SKIPPED\n";;
-        (2) : $((nb_fail++)); printf "FAILED\n";;
-        (3) : $((nb_legal++)); printf "FAILED\n";;
-        (4) : $((nb_show++)); printf "FAILED\n";;
-        esac
+
+    tput civis
+
+    # Allocate lines for all toolchains up front to avoid scroll-invalidating
+    # the saved cursor
+    for ((i = 0; i < nb_tc; i++)); do printf '\n'; done
+    tput cuu "${nb_tc}"
+    tput sc
+
+    declare -A pid_to_idx
+    declare -a display_order
+
+    while (( nb < nb_tc || ${#running[@]} > 0)); do
+        while (( nb < nb_tc && ${#running[@]} < concurrency )); do
+            toolchainconfig=${toolchains[$nb]}
+            toolchain="$(basename "${toolchainconfig}" .config)"
+            build_dir="${dir}/${toolchain}"
+            build_one \
+                "${build_dir}" \
+                "${toolchainconfig}" \
+                "${cfg}" \
+                "${pkg}" \
+                "${prepare_only}" &
+
+            pid=$!; pid_to_idx[${pid}]=${nb}
+            running+=( "$pid" )
+            slot=${#display_order[@]}
+            display_order+=( "$nb" )
+
+	    # Draw placeholder on its preallocated line
+            update_line "$slot" "%40s [%*d/%d]:" \
+                "${toolchain}" \
+                "${#nb_tc}" \
+                $((nb + 1)) \
+                "${nb_tc}"
+
+                nb=$((nb + 1))
+        done
+
+        for i in "${!running[@]}"; do
+            pid="${running[${i}]}"
+            if ! kill -0 "${pid}" 2>/dev/null; then
+                wait "${pid}" && ret=0 || ret=${?}
+                idx=${pid_to_idx[$pid]}
+                toolchainconfig=${toolchains[$idx]}
+                toolchain="$(basename "${toolchainconfig}" .config)"
+                case "${ret}" in
+                (0) stat="OK";;
+                (1) : $((nb_skip++)); stat="SKIPPED";;
+                (2) : $((nb_fail++)); stat="FAILED";;
+                (3) : $((nb_legal++)); stat="FAILED";;
+                (4) : $((nb_show++)); stat="FAILED";;
+                esac
+
+                for slot in "${!display_order[@]}"; do
+                    if [[ ${display_order[$slot]} -eq ${idx} ]]; then
+                        break
+                    fi
+                done
+
+                update_line "$slot" "%40s [%*d/%d]: %s" \
+                    "${toolchain}" \
+                    "${#nb_tc}" \
+                    "$((idx + 1))" \
+                    "${nb_tc}" \
+                    "$stat"
+
+                unset 'running[i]'
+            fi
+        done
+
+        running=( "${running[@]}" )
+        sleep 0.1
     done
 
+    tput rc
+    tput cud "${#display_order[@]}"
+    tput cnorm
+
+    printf '\n\n'
     printf "%d builds, %d skipped, %d build failed, %d legal-info failed, %d show-info failed\n" \
         "${nb}" "${nb_skip}" "${nb_fail}" "${nb_legal}" "${nb_show}"
 
     return $((nb_fail + nb_legal))
 }
 
+update_line() {
+    local slot=$1; shift
+    tput rc
+    tput cud "$((slot + 1))"
+    fmt=$1; shift
+
+    # shellcheck disable=SC2059
+    printf -- "${fmt}" "$@"
+    printf '\033[K'
+}
+
 build_one() {
     local dir="${1}"
     local toolchainconfig="${2}"
@@ -273,6 +381,9 @@ Options:
     -r N, --random N
         Limit the tests to the N randomly selected toolchains.
 
+    -C N, --concurrency N
+        Run N builds concurrently. If N is 0, match the number of logical CPUs.
+
     -t CSVFILE, --toolchains-csv CSVFILE
         CSV file containing the paths to config fragments of toolchains to
         try. If not specified, the toolchains in ${TOOLCHAINS_CSV} will be

---
base-commit: f23c810176305604c54b79611d885547f4e45c23
change-id: 20250619-concurrent-test-pkg-f3ad6d3c01b4

Best regards,
-- 
Joseph Kogut <joseph.kogut@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
