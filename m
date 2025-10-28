Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB45CCD1BF
	for <buildroot@archiver.kernel.org>; Tue, 28 Oct 2025 19:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99DC860A43;
	Tue, 28 Oct 2025 19:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyuUHFpaBOlR; Tue, 28 Oct 2025 19:26:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5376C60A44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5376C60A44;
	Tue, 28 Oct 2025 19:26:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09904707
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 19:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2B814067B
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 19:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWfMdZQPXPwL for <buildroot@buildroot.org>;
 Tue, 28 Oct 2025 19:26:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D00E140678
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D00E140678
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D00E140678
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 19:26:19 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-78af3fe5b17so4957781b3a.2
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 12:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761679579; x=1762284379;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oK3zifzdKIek/Y5FTxQ9FnLj9MO+Kk9cLfBfOpZIlB0=;
 b=a4hINrWl3NkmbGLrcbBV2ZfVi0YC5B7ZIXIPq4bOVBB849CSDD18Q/QtfHU9PfSUGC
 gcS/ykoFd8BYtf5IEYJUfYEAvKvSRpJAeVATPz4c4F3IgWb9MZdjypFHElCektrulDtW
 wmeGEaoM5SF+ipW7vakAptm9hTXxUoNV/Be5d4dgGW5iPsZI6OSERmwGCjFBMGnJbTgH
 4A/8E+pxoOWh84yj+xX/pX4iNXJZG8x+8zhzg7t1vHis8VKXIHgdNDqxo0lr8fxE5m1k
 Qnp8GPzc1yfY13RLbgi9g++olSB2u++pLzmYKZMrVKGIiddzuVC6t7VyRwvpO64JsIX7
 XZ+Q==
X-Gm-Message-State: AOJu0YzsjREYSdEVAiBeEf4ATeQUGvrx01lE51u3kp882wSIGE0K3EO/
 eaXKNGj1Nq5tpUY3RGG1fDZkYukS+mRr+5QWbqhKntNWNc5VsWpkHFaLElT4PA==
X-Gm-Gg: ASbGncvjl74K7FOmHY4Wdv0eCz3udBETrdwzOBvdLHU4plVC+M8YbFb2ngfJOSB2ybY
 kvoiI3cpBjBWJLSxT+qHpA4fH4FNJ3DVc1RQzbNrO55Sf4c2Gkxi84+swUzp73rI1KgXuXNMZ8d
 n9UjJtAMPB23nGHYRzm+TD5zzIGszqQC/z6fbkVSpHlRWTDRRX/aOnpDQYugXFDqvtnqBgCjR5g
 Yt2ztSBN3pM3eD6gLvFAoPPLBdA3ePFTk6PaKUsYrBgb5dhVx49JwHbVfH23tYgfC2eC7skQCaL
 ylD9Ck7pPEGqnegj3vMJm/BMwATJteawU93Isx6SOWKTO+c4b/GyVP9A2AfbdBWyXU9fdlT/R2M
 CoYDY6g1iz+HQ2eleyJZKN+nUHxpIL8sKCuP3WdUrUUEE0j5YpGHl3HHnNNXVlk3CfLS5Dvw822
 as
X-Google-Smtp-Source: AGHT+IFocz3VqhsiXMNwDXaHo2GV8mXiMohAmUlpsMELsdOXW9/1aA9bSTh3Np/iVAV9I25sRkgg6Q==
X-Received: by 2002:a05:6a00:b4f:b0:7a2:859d:8d8f with SMTP id
 d2e1a72fcca58-7a4e2722dd0mr299338b3a.4.1761679578463; 
 Tue, 28 Oct 2025 12:26:18 -0700 (PDT)
Received: from wash.local ([50.46.184.91]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a414082e10sm12309400b3a.55.2025.10.28.12.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 12:26:18 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 28 Oct 2025 12:26:10 -0700
MIME-Version: 1.0
Message-Id: <20251028-concurrent-test-pkg-v3-1-ae014d18e5f5@gmail.com>
X-B4-Tracking: v=1; b=H4sIANEYAWkC/22NzQqDMBAGX0Vybkp+VEhPfY/SQ0xWDa2JbNLQI
 r57o6cWZE8D384sJAI6iORSLQQhu+iCLyBPFTGj9gNQZwsTwUTDWq6oCd68EMEnmiAmOj8G2kt
 tWysN411NyueM0Lv3br3dC3c6Au1QezNurknHBLgNRxdTwM9ez3yb7yHOhDgMZU7L9aBa2/Oy6
 q7DpN3zbMJEtlAWvw557BDFoRqlbV1LW6s/x7quX5tHGsUTAQAA
X-Change-ID: 20250619-concurrent-test-pkg-f3ad6d3c01b4
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761679577; l=13723;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=g88VHnUTS9HlXGuGeTjbhj+wFGe3cjreT1YaMxJoVgM=;
 b=0oWS77dpIdA4RPGrd1DocolpT0AIwVEuuefvfgyOc5W4ltdpbxMIY25Um0wMz3MnqDikbRl5Z
 7B8J/uFmlI7AQfNLMumO6/JHtx4QHqGt3SM+oGp39nBQGtafqsF6I1Q
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761679579; x=1762284379; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oK3zifzdKIek/Y5FTxQ9FnLj9MO+Kk9cLfBfOpZIlB0=;
 b=A2qxYA0GRS9xSJtfBnZm5H77mC4SDs6ISHaOx1NEXY7qKqnmXThGwgkxiDfkQo3g4o
 Z3nwn7hUgomvzBO/ZlNKnJz1pXLl9iNXxOXzKxgsVEZlt+jpBk6R5dZXSw4w1RD6PAhD
 pzuQi3Nw1nLNYUxOoIpb7OepEtuMt4qvQAktJZ4xPQSSpN8umWmUS5D6vcXgGi4ZkO3z
 Hq87juMCgx9DvNIqvehxRpmatiWyLsdZiWXCWRMajdA0rBzrFzAtQ9oYb0UKgFClZwtz
 Ie/Sb21SmiPaE0EMVOjeehuABggBSPYyWSSDdfxQt5EGMPd2o3w4YChNIDzxMBMbmric
 7Bow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=A2qxYA0G
Subject: [Buildroot] [PATCH v3] utils/test-pkg: add concurrency parameter
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
The patch appears to behave as intended in my testing, and it speeds up
package testing quite a lot. The commit description shows the results
testing sdl2, and I've pasted another result below from building libpng,
which illustrates the time saved with a large number of builds.

$ time utils/test-pkg -c libpng.config -p libpng -a
                             arm-aarch64 [ 1/35]: OK
                   bootlin-aarch64-glibc [ 2/35]: OK
               bootlin-arcle-hs38-uclibc [ 3/35]: OK
                    bootlin-armv5-uclibc [ 4/35]: OK
                     bootlin-armv7-glibc [ 5/35]: OK
                      bootlin-armv7-musl [ 6/35]: OK
                   bootlin-armv7m-uclibc [ 7/35]: OK
                bootlin-m68k-5208-uclibc [ 8/35]: OK
               bootlin-m68k-68040-uclibc [ 9/35]: OK
             bootlin-microblazeel-uclibc [10/35]: OK
                   bootlin-mipsel-uclibc [11/35]: OK
                bootlin-mipsel32r6-glibc [12/35]: OK
                 bootlin-openrisc-uclibc [13/35]: OK
           bootlin-powerpc-e500mc-uclibc [14/35]: OK
        bootlin-powerpc64le-power8-glibc [15/35]: OK
                   bootlin-riscv32-glibc [16/35]: OK
                   bootlin-riscv64-glibc [17/35]: OK
                    bootlin-riscv64-musl [18/35]: OK
                 bootlin-s390x-z13-glibc [19/35]: OK
                      bootlin-sh4-uclibc [20/35]: OK
                    bootlin-sparc-uclibc [21/35]: OK
                   bootlin-sparc64-glibc [22/35]: OK
                    bootlin-x86-64-glibc [23/35]: OK
                     bootlin-x86-64-musl [24/35]: OK
                   bootlin-x86-64-uclibc [25/35]: OK
                   bootlin-x86-i686-musl [26/35]: OK
                   bootlin-xtensa-uclibc [27/35]: OK
                            br-arm-basic [28/35]: OK
                    br-arm-full-nothread [29/35]: OK
                      br-arm-full-static [30/35]: OK
                   br-i386-pentium4-full [31/35]: OK
                      br-mips64-n64-full [32/35]: OK
                 br-mips64r6-el-hf-glibc [33/35]: OK
               br-powerpc-603e-basic-cpp [34/35]: OK
               br-powerpc64-power7-glibc [35/35]: OK

35 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

real    23m34.593s
user    25m30.113s
sys     2m10.823s

$ time utils/test-pkg -c libpng.config -p libpng -a -C0
                             arm-aarch64 [ 1/35]: OK
                   bootlin-aarch64-glibc [ 2/35]: OK
               bootlin-arcle-hs38-uclibc [ 3/35]: OK
                    bootlin-armv5-uclibc [ 4/35]: OK
                     bootlin-armv7-glibc [ 5/35]: OK
                      bootlin-armv7-musl [ 6/35]: OK
                   bootlin-armv7m-uclibc [ 7/35]: OK
                bootlin-m68k-5208-uclibc [ 8/35]: OK
               bootlin-m68k-68040-uclibc [ 9/35]: OK
             bootlin-microblazeel-uclibc [10/35]: OK
                   bootlin-mipsel-uclibc [11/35]: OK
                bootlin-mipsel32r6-glibc [12/35]: OK
                 bootlin-openrisc-uclibc [13/35]: OK
           bootlin-powerpc-e500mc-uclibc [14/35]: OK
        bootlin-powerpc64le-power8-glibc [15/35]: OK
                   bootlin-riscv32-glibc [16/35]: OK
                   bootlin-riscv64-glibc [17/35]: OK
                    bootlin-riscv64-musl [18/35]: OK
                 bootlin-s390x-z13-glibc [19/35]: OK
                      bootlin-sh4-uclibc [20/35]: OK
                    bootlin-sparc-uclibc [21/35]: OK
                   bootlin-sparc64-glibc [22/35]: OK
                    bootlin-x86-64-glibc [23/35]: OK
                     bootlin-x86-64-musl [24/35]: OK
                   bootlin-x86-64-uclibc [25/35]: OK
                   bootlin-x86-i686-musl [26/35]: OK
                   bootlin-xtensa-uclibc [27/35]: OK
                            br-arm-basic [28/35]: OK
                    br-arm-full-nothread [29/35]: OK
                      br-arm-full-static [30/35]: OK
                   br-i386-pentium4-full [31/35]: OK
                      br-mips64-n64-full [32/35]: OK
                 br-mips64r6-el-hf-glibc [33/35]: OK
               br-powerpc-603e-basic-cpp [34/35]: OK
               br-powerpc64-power7-glibc [35/35]: OK

35 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

real    2m6.510s
user    41m24.460s
sys     3m31.484s

This test was performed on a 16-core Ryzen 9 9950X, and the
all-toolchain build was ~11x faster compared to the same serial run.

As always, feedback is very welcome.
---
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
---
 utils/test-pkg | 142 ++++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 121 insertions(+), 21 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index cea7ace7cb..f9dc86343d 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -3,27 +3,45 @@ set -e
 
 TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
 TEMP_CONF=""
-abort=0
+
+# associative array tracking running build jobs by PID
+declare -a running
+
+# offet for end of output
+end_offs=0
+
+restore_cursor() {
+    tput cnorm
+    tput rc
+    tput cud "$((end_offs + 1))"
+    printf '\n'
+}
 
 do_abort() {
-    abort=1
+    restore_cursor
+    do_clean
 }
 
 do_clean() {
     if [ -n "${TEMP_CONF}" ]; then
         rm -f "${TEMP_CONF}"
     fi
+
+    # Terminate any running jobs
+    pkill -TERM --parent $$ 2>/dev/null || true
+    wait
 }
 
 main() {
     local o O opts
-    local cfg dir pkg random toolchains_csv toolchain all number mode prepare_only
+    local cfg dir pkg random toolchains_csv toolchain all number mode prepare_only \
+	    concurrency
     local ret nb nb_skip nb_fail nb_legal nb_show nb_tc build_dir keep
     local -a toolchains
     local pkg_br_name
 
-    o='hakc:d:n:p:r:t:T:'
-    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:,toolchain-name:'
+    o='hakc:d:n:p:r:t:T:C:'
+    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:,toolchain-name:,concurrency:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
@@ -33,6 +51,7 @@ main() {
     number=0
     mode=0
     prepare_only=0
+    concurrency=1
     toolchains_csv="${TOOLCHAINS_CSV}"
     while [ ${#} -gt 0 ]; do
         case "${1}" in
@@ -69,6 +88,9 @@ main() {
         (-T|--toolchain-name)
             toolchain_name="${2}"; shift 2
             ;;
+        (-C|--concurrency)
+            concurrency="${2}"; shift 2
+            ;;
         (--)
             shift; break
             ;;
@@ -88,6 +110,13 @@ main() {
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
@@ -137,31 +166,99 @@ main() {
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
 
-        if [ "${abort}" -eq 1 ]; then
-            return 1
-        fi
+    tput civis
+
+    # Allocate lines for all toolchains up front to avoid scroll-invalidating
+    # the saved cursor
+    for ((i = 0; i < nb_tc; i++)); do printf '\n'; done
+    tput cuu "$((nb_tc + 1))"
+    tput sc
+
+    declare -A pid_to_idx
+    declare -a display_order
+
+    spinc='/-\|'
+    spini=0
+    while (( nb < nb_tc || ${#running[@]} > 0)); do
+        while (( nb < nb_tc && ${#running[@]} < concurrency )); do
+            toolchainconfig=${toolchains[$nb]}
+            toolchain="$(basename "${toolchainconfig}" .config)"
+            build_dir="${dir}/${toolchain}"
+
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
+            end_offs=${#display_order[@]}
+            nb=$((nb + 1))
+        done
+
+        for i in "${!running[@]}"; do
+            pid="${running[${i}]}"
+            idx="${pid_to_idx[$pid]}"
+            toolchainconfig=${toolchains[$idx]}
+            toolchain="$(basename "${toolchainconfig}" .config)"
+
+            if ! kill -0 "${pid}" 2>/dev/null; then
+                wait "${pid}" && ret=0 || ret=${?}
+                case "${ret}" in
+                (0) stat="OK";;
+                (1) : $((nb_skip++)); stat="SKIPPED";;
+                (2) : $((nb_fail++)); stat="FAILED";;
+                (3) : $((nb_legal++)); stat="FAILED";;
+                (4) : $((nb_show++)); stat="FAILED";;
+                esac
+
+                unset 'running[i]'
+            else
+                stat="${spinc:$spini:1}"
+            fi
+
+            # Find the line to print the status on for this PID
+            for slot in "${!display_order[@]}"; do
+                if [[ ${display_order[$slot]} -eq ${idx} ]]; then
+                    break
+                fi
+            done
+
+            update_line "$slot" "%40s [%*d/%d]: %s" \
+                "${toolchain}" \
+                "${#nb_tc}" \
+                "$((idx + 1))" \
+                "${nb_tc}" \
+                "${stat}"
+        done
+
+        running=( "${running[@]}" )
+        spini=$(((spini+1) % ${#spinc}))
+        sleep 0.1
     done
 
+    restore_cursor
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
+    printf -- "\033[K${fmt}" "$@"
+}
+
 build_one() {
     local dir="${1}"
     local toolchainconfig="${2}"
@@ -288,6 +385,9 @@ Options:
     -r N, --random N
         Limit the tests to the N randomly selected toolchains.
 
+    -C N, --concurrency N
+        Run N builds concurrently. If N is 0, match the number of logical CPUs.
+
     -t CSVFILE, --toolchains-csv CSVFILE
         CSV file containing the paths to config fragments of toolchains to
         try. If not specified, the toolchains in ${TOOLCHAINS_CSV} will be

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
