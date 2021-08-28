Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5FEC432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:33:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00023604AC
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00023604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8F4E83B27;
	Sat, 28 Aug 2021 15:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GjhU5rGxPRzy; Sat, 28 Aug 2021 15:33:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFA0183B28;
	Sat, 28 Aug 2021 15:33:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D00261BF33B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BED57606A6
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ypO2buvtKFie for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 15:32:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4F7C6066E
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 15:32:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 142EB85C58; Sat, 28 Aug 2021 15:31:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 17:01:11 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2ff70353948f60047d2e7c747378cc1402d59dce
X-Git-Newrev: a30204b005f484937a8b0a6a8b58a514394bfcfb
X-Patchwork-Hint: ignore
Message-Id: <20210828153150.142EB85C58@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/test-pkg: add mode to
 only prepare .config files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=a30204b005f484937a8b0a6a8b58a514394bfcfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, running test-pkg is only done locally on the developers
machine.

In a follow up commit, we'll add the possibility to run test-pkg in a
gitlab-ci pipeline and, to speed things up, with one job per buildable
configuration.

As such, we will need to make sure that test-pkg only prepares the
configurations, and that it does not build them.

Add such a mode, with a new option, --prepare-only

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/test-pkg | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 54c6c5e8fe..526b95b1fb 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -12,13 +12,13 @@ do_clean() {
 
 main() {
     local o O opts
-    local cfg dir pkg random toolchains_csv toolchain all number mode
+    local cfg dir pkg random toolchains_csv toolchain all number mode prepare_only
     local ret nb nb_skip nb_fail nb_legal nb_tc build_dir keep
     local -a toolchains
     local pkg_br_name
 
     o='hakc:d:n:p:r:t:'
-    O='help,all,keep,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
+    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
@@ -27,6 +27,7 @@ main() {
     keep=0
     number=0
     mode=0
+    prepare_only=0
     toolchains_csv="${TOOLCHAINS_CSV}"
     while [ ${#} -gt 0 ]; do
         case "${1}" in
@@ -39,6 +40,9 @@ main() {
         (-k|--keep)
             keep=1; shift 1
             ;;
+        (--prepare-only)
+            prepare_only=1; shift 1
+            ;;
         (-c|--config-snippet)
             cfg="${2}"; shift 2
             ;;
@@ -127,7 +131,7 @@ main() {
         toolchain="$(basename "${toolchainconfig}" .config)"
         build_dir="${dir}/${toolchain}"
         printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
-        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
+        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" "${prepare_only}" && ret=0 || ret=${?}
         case ${ret} in
         (0) printf "OK\n";;
         (1) : $((nb_skip++)); printf "SKIPPED\n";;
@@ -147,6 +151,7 @@ build_one() {
     local toolchainconfig="${2}"
     local cfg="${3}"
     local pkg="${4}"
+    local prepare_only="${5}"
 
     mkdir -p "${dir}"
 
@@ -170,6 +175,11 @@ build_one() {
     # Remove file, it's empty anyway.
     rm -f "${dir}/missing.config"
 
+    # Defer building the job to the caller (e.g. a gitlab pipeline)
+    if [ ${prepare_only} -eq 1 ]; then
+        return 0
+    fi
+
     if [ -n "${pkg}" ]; then
         if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
             return 2
@@ -257,6 +267,10 @@ Options:
         Note: the logfile and configuration is always retained, even without
         this option.
 
+    --prepare-only
+        Only prepare the .config files, but do not build them. Output the
+        list of build directories to stdout, and the status on stderr.
+
 Example:
 
     Testing libcec would require a config snippet that contains:
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
