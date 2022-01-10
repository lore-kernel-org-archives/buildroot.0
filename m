Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09498C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7713827A8;
	Mon, 10 Jan 2022 07:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUL75MaS1c7t; Mon, 10 Jan 2022 07:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EE9D8277E;
	Mon, 10 Jan 2022 07:54:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19E221BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 167ED60C01
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rpUIkMP88OvB for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:54:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CC3160C00
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:54:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C56A782DFE; Mon, 10 Jan 2022 07:47:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 08:52:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7affc7827aee0e07ec94d3b4d91c2e23bda8d937
X-Git-Newrev: f29239cf9bc21d9632031077354b6ba5c868cc1f
X-Patchwork-Hint: ignore
Message-Id: <20220110074744.C56A782DFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/test-pkg: add check that show-info
 is proper json
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f29239cf9bc21d9632031077354b6ba5c868cc1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

JSON parser are usually rather strict when parsing their input. Both
jq and the python json module choke on non-conformant inputs.

Commit e4c284e6b9 (package/pkg-utils: escape \ in generated legal-info)
fixed the \-escaping case, but we want to ensure that we do not have
other data that would be improperly encoded.

To more easily catch issues, also run show-info and send its output
through jq, to try and validate the output.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/test-pkg | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 526b95b1fb..ce6e43b965 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -13,7 +13,7 @@ do_clean() {
 main() {
     local o O opts
     local cfg dir pkg random toolchains_csv toolchain all number mode prepare_only
-    local ret nb nb_skip nb_fail nb_legal nb_tc build_dir keep
+    local ret nb nb_skip nb_fail nb_legal nb_show nb_tc build_dir keep
     local -a toolchains
     local pkg_br_name
 
@@ -126,6 +126,7 @@ main() {
     nb_skip=0
     nb_fail=0
     nb_legal=0
+    nb_show=0
     for toolchainconfig in "${toolchains[@]}"; do
         : $((nb++))
         toolchain="$(basename "${toolchainconfig}" .config)"
@@ -137,11 +138,12 @@ main() {
         (1) : $((nb_skip++)); printf "SKIPPED\n";;
         (2) : $((nb_fail++)); printf "FAILED\n";;
         (3) : $((nb_legal++)); printf "FAILED\n";;
+        (4) : $((nb_show++)); printf "FAILED\n";;
         esac
     done
 
-    printf "%d builds, %d skipped, %d build failed, %d legal-info failed\n" \
-        ${nb} ${nb_skip} ${nb_fail} ${nb_legal}
+    printf "%d builds, %d skipped, %d build failed, %d legal-info failed, %d show-info failed\n" \
+        ${nb} ${nb_skip} ${nb_fail} ${nb_legal} ${nb_show}
 
     return $((nb_fail + nb_legal))
 }
@@ -197,6 +199,20 @@ build_one() {
         return 3
     fi
 
+    # Validate that we generate proper json as show-info
+    { tput smso; printf '>>> Running show-info\n'; tput rmso; } >> "${dir}/logfile" 2> /dev/null;
+    JQ="$(which jq)"
+    if [ -z "${JQ}" ]; then
+        make O="${dir}" host-jq >> "${dir}/logfile" 2>&1
+        JQ="${dir}/host/bin/jq"
+    fi
+    if ! make O="${dir}" "${pkg:+${pkg}-}show-info" > "${dir}/info.json" 2>> "${dir}/logfile"; then
+        return 4
+    fi
+    if ! "${JQ}" . < "${dir}/info.json" >> "${dir}/logfile" 2>&1; then
+        return 4
+    fi
+
     # If we get here, the build was successful. Clean up the build/host
     # directories to save disk space, unless 'keep' was set.
     if [ ${keep} -ne 1 ]; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
