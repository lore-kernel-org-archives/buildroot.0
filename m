Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F3FC001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 21:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C7CD40895;
	Mon,  7 Aug 2023 21:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C7CD40895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TQpvssud1WtW; Mon,  7 Aug 2023 21:21:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B179340951;
	Mon,  7 Aug 2023 21:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B179340951
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48CE91BF23C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 217E940951
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 217E940951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CS2sOZnf1rxB for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 21:21:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FFAE40895
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 21:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FFAE40895
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F066A846F2; Mon,  7 Aug 2023 21:21:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 7 Aug 2023 23:20:31 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a0c0bc9d33eb1a3b481e30021d31d20e257b337d
X-Git-Newrev: 3b7c7e61065875707fb22b70553d30f39cb1c498
X-Patchwork-Hint: ignore
Message-Id: <20230807212138.F066A846F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/scripts: fix fix-rpath
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b7c7e61065875707fb22b70553d30f39cb1c498
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 134900401f08 (support/scripts/fix-rpath: parallelize patching
files) broke the rpath fixup, because it improperly quoted or expanded
variables:

  - $@ was expanded in the main() context, rather than in the sub-bash
    as expected, propagating incorrect parameters to patch_file();

  - an array was passed without array expansion, so only the first item
    was passed; that was in turn assigned to a string, anyway loosign
    the array. Liuckily, we only ever put a single item in that array,
    so that worked by chance.

We fix that by inverting the parameters to patch_elf(), where the extra
args are passed last, so we can put as many we want in the future. We
also pass every variables as positional parameters outside the bash -c
command, which allows us proper quoting of all variables, specifically
of the extra args array which now comes last.

The ultralong line was split, too, in a hopefully easier-to-read form.

Fixing all that also required fixing the many shellcheck issues at the
same time (wome were pre-existing before 134900401f08).

While at it, expand two TABs into spaces like the rest of the script.

Note: shellcheck does not seem to warn when a variable expansion will be
used as the command to run, i.e. ${PATCHELF} does not trigger the
quoting error. Still, for consistency, we also double-quote it (we know
it is a single word, as it is already double-quoted once in the script).

Fixes: 134900401f08

Cc: Victor Dumas <dumasv.dev@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore       |  1 -
 support/scripts/fix-rpath | 40 ++++++++++++++++++++++++----------------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d7fab118a9..b229a4e015 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1663,7 +1663,6 @@ support/scripts/check-bin-arch Shellcheck
 support/scripts/check-host-rpath Shellcheck
 support/scripts/expunge-gconv-modules Shellcheck
 support/scripts/fix-configure-powerpc64.sh EmptyLastLine
-support/scripts/fix-rpath Shellcheck
 support/scripts/generate-gitlab-ci-yml Shellcheck
 support/scripts/mkmakefile ConsecutiveEmptyLines Shellcheck
 support/scripts/mkusers Shellcheck
diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index a9b348e189..1e58646cea 100755
--- a/support/scripts/fix-rpath
+++ b/support/scripts/fix-rpath
@@ -53,7 +53,7 @@ Returns:         0 if success or 1 in case of error
 EOF
 }
 
-: ${PATCHELF:=${HOST_DIR}/bin/patchelf}
+: "${PATCHELF:=${HOST_DIR}/bin/patchelf}"
 
 # ELF files should not be in these sub-directories
 HOST_EXCLUDEPATHS="/share/terminfo"
@@ -61,19 +61,23 @@ STAGING_EXCLUDEPATHS="/usr/include /usr/share/terminfo"
 TARGET_EXCLUDEPATHS="/lib/firmware"
 
 patch_file() {
+    local PATCHELF rootdir file
+    local -a sanitize_extra_args
+
     PATCHELF="${1}"
     rootdir="${2}"
-    sanitize_extra_args="${3}"
-    file="${4}"
+    file="${3}"
+    shift 3
+    sanitize_extra_args=("${@}")
 
     # check if it's an ELF file
-    rpath=$(${PATCHELF} --print-rpath "${file}" 2>&1)
+    rpath="$("${PATCHELF}" --print-rpath "${file}" 2>&1)"
     if test $? -ne 0 ; then
         return 0
     fi
 
     # make files writable if necessary
-    changed=$(chmod -c u+w "${file}")
+    changed="$(chmod -c u+w "${file}")"
 
     # With per-package directory support, most RPATH of host
     # binaries will point to per-package directories. This won't
@@ -81,26 +85,27 @@ patch_file() {
     # the per-package host directory is not within ${rootdir}. So,
     # we rewrite all RPATHs pointing to per-package directories so
     # that they point to the global host directry.
-    changed_rpath=$(echo ${rpath} | sed "s@${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@")
+    # shellcheck disable=SC2001 # ${var//search/replace} hard when search or replace have / in them
+    changed_rpath="$(echo "${rpath}" | sed "s@${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@")"
     if test "${rpath}" != "${changed_rpath}" ; then
-        ${PATCHELF} --set-rpath ${changed_rpath} "${file}"
+        "${PATCHELF}" --set-rpath "${changed_rpath}" "${file}"
     fi
 
     # call patchelf to sanitize the rpath
-    ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
+    "${PATCHELF}" --make-rpath-relative "${rootdir}" "${sanitize_extra_args[@]}" "${file}"
     # restore the original permission
     test "${changed}" != "" && chmod u-w "${file}"
 }
 
 main() {
-    local rootdir
-    local tree="${1}"
-    local find_args=( )
-    local sanitize_extra_args=( )
+    local rootdir tree
+    local -a find_args sanitize_extra_args
+
+    tree="${1}"
 
     if ! "${PATCHELF}" --version > /dev/null 2>&1; then
-	echo "Error: can't execute patchelf utility '${PATCHELF}'"
-	exit 1
+        echo "Error: can't execute patchelf utility '${PATCHELF}'"
+        exit 1
     fi
 
     case "${tree}" in
@@ -161,7 +166,10 @@ main() {
 
     export -f patch_file
     # Limit the number of cores used
-    find "${rootdir}" ${find_args[@]} | xargs -0 -r -P ${PARALLEL_JOBS} -I {} bash -c "patch_file '${PATCHELF}' '${rootdir}' '${sanitize_extra_args}' $@" _ {}
+    # shellcheck disable=SC2016  # ${@} has to be expanded in the sub-shell.
+    find "${rootdir}" "${find_args[@]}" \
+    | xargs -0 -r -P "${PARALLEL_JOBS:-1}" -I {} \
+            bash -c 'patch_file "${@}"' _ "${PATCHELF}" "${rootdir}" {} "${sanitize_extra_args[@]}"
 
     # Restore patched patchelf utility
     test "${tree}" = "host" && mv "${PATCHELF}.__to_be_patched" "${PATCHELF}"
@@ -170,4 +178,4 @@ main() {
     return 0
 }
 
-main ${@}
+main "${@}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
