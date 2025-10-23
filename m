Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED263CCD1BF
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 23:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A32374049A;
	Thu, 23 Oct 2025 23:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lr5VUQ4dg_w7; Thu, 23 Oct 2025 23:36:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F6734049B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F6734049B;
	Thu, 23 Oct 2025 23:36:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C0EA43F
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 23:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E05381AAD
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 23:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVCDrjKON1S8 for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 23:36:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CB2E81A95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CB2E81A95
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CB2E81A95
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 23:36:49 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-78118e163e5so2426947b3a.0
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 16:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761262609; x=1761867409;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ErpXjw5sbZFaj2yt4nsIRPgl60pukttOc+FRpmk7RFQ=;
 b=OJ99TVdLovanIbiV2yjvO1oqC+DKA8fbSlEo8JZFVvJ9TGHQMRCe6OcBV0GZfC7wOf
 pLB87RUzAaxpHEYuevxyAHNleaOER0a6IHlZ1n049vbVkp82HudHiUYPzF2NHqL3Mu3r
 MUy87o5V+kzhq4xv2T4xxzLAxJTetxFGkTjRaoee45cQc/ZmdK/amynCBxeEHdVwQWuB
 Bxx+uShXcsq+ArNrzNrBy2bqGJXsgFfFxIg9DajSkt7E0Tdc1E1VnFtQvf3q6oU6RvTO
 jZ7aWyqTpWZLg5ymyQ2A0xjdXnak4SSLdP0DLJiiUIbBaIFbLW9sp2TyX7VyLqXai+g5
 DwQA==
X-Gm-Message-State: AOJu0YyojbWx8+P+b4Bu2mdWeSOSfdG4NHrX6IdDl9wEYShSQ3942Y+f
 xgzAMrREHvbnz0ndNz6icygaDy94bTQ1uL0LG/Z9La+WRMYi3BFSdRUuop0L/g==
X-Gm-Gg: ASbGncv/gWnMegthmgyoJ8KPBixz8LTz+O3QfEX8cOzCt9qvBLUMwcMZXswLCYd3rRr
 nWR2U5P3EVpqvhQu1gx3yWlBSaIw1ZbxEl/hHjWq1BvMrAuKbtlBHShxiCxBDWH7pUTC4hDP4pP
 DmbS4qgeCqc5WTatUMBhG18apROPxSqemI+6gZyqq8I3ooOLTkq8fYt1b6hyRxaGpa+cRHWhpFd
 79RAut5AMPZK4uBAgqINqJ6gEiBqi5RkAJ9fmbYwV3J6m8Hl4TrTbw2aODMvG9zCUGNbSG8B4b7
 vIOXevNVGR9wlqjzTQF3aaFiT3UvSZmXFhlTxZLbcGll93W1bDYfofUuR76UvjKoAwDmd0bpnXx
 dqol9PVGZ3x/I3UMmCnhC/EzdsfarWoT55U5OyIy0uWhDppBL+nTaRXciWiRFBIVSpDxXlFdRIa
 vB
X-Google-Smtp-Source: AGHT+IFUrLmorDULztfNvdhLmsbA1zUe+VhfLyfmuzmZh58lzMopdx7b9iOjP6k+gWDzQ1DvfgldRg==
X-Received: by 2002:a05:6a20:258a:b0:32d:b741:a201 with SMTP id
 adf61e73a8af0-33db4ee554fmr778527637.20.1761262608957; 
 Thu, 23 Oct 2025 16:36:48 -0700 (PDT)
Received: from wash.local ([50.46.184.91]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6cf4c05489sm3236604a12.10.2025.10.23.16.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 16:36:48 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 23 Oct 2025 16:36:34 -0700
MIME-Version: 1.0
Message-Id: <20251023-concurrent-test-pkg-v2-1-959ad443d49b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAG8+mgC/21OSwrCMBS8iry1kSTVQl0JggdwK13k89IGbVJeY
 lFK727atcxqhvnNkJA8JjjvZiCcfPIxFCL3OzC9Ch0ybwsHyeWJ16JhJgbzJsKQWcaU2fjsmKu
 UrW1luNBHKMmR0PnP1vqA++0KbRG1Ssg0qWD6tXBQKSOt7t6nHOm7XZjEllnXBJfy79okWIHDp
 rZOFJe+dIPyr4OJA7TLsvwAJyHc89QAAAA=
X-Change-ID: 20250619-concurrent-test-pkg-f3ad6d3c01b4
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761262608; l=14675;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=V6XbLfzhdN9d1OLfRpCcl/kVuslr8IuiFpHudtKrTTs=;
 b=o/d+gAu9AsvDrEbweCsL9iQ7N4++/oJRNeGEl+ytA9e4iUv5vxX2NGqV+/dB5BT3N/ybpjuIe
 wM8nXnpXw8iCaoNsY2rLia/DDibkIoEPSlGgPNDfbUfXY+eGcXPB24S
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761262609; x=1761867409; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ErpXjw5sbZFaj2yt4nsIRPgl60pukttOc+FRpmk7RFQ=;
 b=XM0Nc2MDOIMLAe+ircOBa+jyzCQ7QZiAjR/vnlm5lZ3h5n1HPiZufMW+diI28tdpaU
 1lCLF4wOqKW1as0QgNLtTAoRQ/B26tLn5Qe1ywqkyoaNR7xdVcV49x/mD225Vp+qO6rD
 JEmrOBOyx0WuU9FMFZbPSZIocj6DgW+Ty3B0I3m4p0Spxcr3JKFmtJGjcSWm+0NFyhSw
 0RocOuMDOLLPuYuENZ3F6QfuJv79wIj4XURExLsmdu8Z5xe5b6NyrANlANB+R89+/men
 c1ZJNyJ3ukXU32bJ/+tmjLecfTmnQI+KFlb4ddtwowfgPscw2vd1SfBJPa4QKsxxxklW
 5nkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XM0Nc2MD
Subject: [Buildroot] [PATCH RFC v2] utils/test-pkg: add concurrency parameter
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
Changes in v2:
- Rebase on origin/master
- Properly restore cursor on interrupt
- Properly terminate running jobs on interrupt
- Add animated spinner for running builds
- Simplify status updates
- Link to v1: https://lore.kernel.org/r/20251022-concurrent-test-pkg-v1-1-1fe96df1102b@gmail.com
---
 utils/test-pkg | 146 ++++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 125 insertions(+), 21 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index cea7ace7cb..3ece0b661d 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -3,27 +3,48 @@ set -e
 
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
+    for pid in "${running[@]}"; do
+        if kill -0 "${pid}" 2>/dev/null; then
+            kill -TERM "${pid}" 2>/dev/null || true
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
 
-    o='hakc:d:n:p:r:t:T:'
-    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:,toolchain-name:'
+    o='hakc:d:n:p:r:t:C:'
+    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:,toolchain-name:,concurrency:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
@@ -33,6 +54,7 @@ main() {
     number=0
     mode=0
     prepare_only=0
+    concurrency=1
     toolchains_csv="${TOOLCHAINS_CSV}"
     while [ ${#} -gt 0 ]; do
         case "${1}" in
@@ -69,6 +91,9 @@ main() {
         (-T|--toolchain-name)
             toolchain_name="${2}"; shift 2
             ;;
+        (-C|--concurrency)
+            concurrency="${2}"; shift 2
+            ;;
         (--)
             shift; break
             ;;
@@ -88,6 +113,13 @@ main() {
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
@@ -137,31 +169,100 @@ main() {
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
+    tput cuu "${nb_tc}"
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
+    printf '\n'
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
@@ -288,6 +389,9 @@ Options:
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
