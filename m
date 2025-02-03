Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC23C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC7A250159;
	Fri, 28 Feb 2025 17:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jgy5rWMo_NWw; Fri, 28 Feb 2025 17:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6D52506E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6D52506E2;
	Fri, 28 Feb 2025 17:08:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10D59711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0338A42EEF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ik9NLY8KaLcp for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8546342F07
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8546342F07
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B9D98616F; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 11:07:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 777aa5ede03c4f993c72d9e3846720536be4d1ea
X-Git-Newrev: 85376a71814eefb00212caa6b2d526fcddfbb084
X-Patchwork-Hint: ignore
Message-Id: <20250228163024.7B9D98616F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/scripts/fix-rpath:
 Reduce overhead of parallelization
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=85376a71814eefb00212caa6b2d526fcddfbb084
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Rather than fork+exec:ing a whole bash process for every file of
interest, split up the work into ${PARALLEL_JOBS} separate file lists,
and then fork off a single worker per list.

Since workers now run in a fork, we also don't have to re-parse the
arguments on every call to patch_file().

In the worker, we also add a low-overhead check for the ELF magic,
which allows us to skip all non-ELFs without having to fork off
additional processes. In the event that we encounter an invalid ELF,
that is still taken care of by the existing exitcode-test in
patch_file().

On a 4-core/8-thread box, this cuts down the time it takes to fix the
RPATHS in the host directory from around 25s to 1.5s.

Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
[Peter: fix shellcheck issues]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/fix-rpath | 44 ++++++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index d3421504a5..afca7074c8 100755
--- a/support/scripts/fix-rpath
+++ b/support/scripts/fix-rpath
@@ -60,15 +60,11 @@ HOST_EXCLUDEPATHS="/share/terminfo"
 STAGING_EXCLUDEPATHS="/usr/include /usr/share/terminfo"
 TARGET_EXCLUDEPATHS="/lib/firmware"
 
-patch_file() {
-    local PATCHELF rootdir file
-    local -a sanitize_extra_args
+declare -a sanitize_extra_args
+rootdir=
 
-    PATCHELF="${1}"
-    rootdir="${2}"
-    file="${3}"
-    shift 3
-    sanitize_extra_args=("${@}")
+patch_file() {
+    local file="${1}"
 
     # check if it's an ELF file
     rpath="$("${PATCHELF}" --print-rpath "${file}" 2>&1)"
@@ -97,9 +93,21 @@ patch_file() {
     test "${changed}" != "" && chmod u-w "${file}"
 }
 
+patch_files() {
+    while read -r -d $'\0' file; do
+	# for performance reasons, we want to do as little work as
+	# possible on non-ELF files. therefore, make sure that the
+	# file at least starts with the ELF magic before handing it of
+	# to patchelf, which will then perform the proper validation.
+	read -r -n4 magic <"${file}" && test "${magic}" != $'\x7fELF' && continue
+
+	patch_file "${file}"
+    done
+}
+
 main() {
-    local rootdir tree
-    local -a find_args sanitize_extra_args
+    local tree
+    local -a find_args
 
     tree="${1}"
 
@@ -162,14 +170,18 @@ main() {
             ;;
     esac
 
-    find_args+=( "-type" "f" "-print0" )
+    work=$(mktemp --tmpdir -d fix-rpath.XXXXXXXX)
 
-    export -f patch_file
-    # Limit the number of cores used
-    # shellcheck disable=SC2016  # ${@} has to be expanded in the sub-shell.
+    find_args+=( "-type" "f" "-print0" )
     find "${rootdir}" "${find_args[@]}" \
-    | xargs -0 -r -P "${PARALLEL_JOBS:-1}" -I {} \
-            bash -c 'patch_file "${@}"' _ "${PATCHELF}" "${rootdir}" {} "${sanitize_extra_args[@]}"
+    | split -t '\0' -a4 -d -n "r/${PARALLEL_JOBS:-1}" "-" "${work}/part"
+
+    for part in "${work}/part"*; do
+	patch_files <"${part}" &
+    done
+    wait
+
+    rm -rf "${work}"
 
     # Restore patched patchelf utility
     test "${tree}" = "host" && mv "${PATCHELF}.__to_be_patched" "${PATCHELF}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
