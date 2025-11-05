Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FFCCCFA19
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 22:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1796F412F1;
	Wed,  5 Nov 2025 22:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRRJiB6QHRGX; Wed,  5 Nov 2025 22:30:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 201A6412F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 201A6412F9;
	Wed,  5 Nov 2025 22:30:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 466EEB00
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1B3E408C9
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfC6wVSj0Skn for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBA0A4104F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBA0A4104F
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7EF083DA6; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 23:10:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1187c34d88e16191753bfd0c3b4cd2f914813f31
X-Git-Newrev: 4da66e8130c6d2af9c15534a29df74ca7bbfe629
X-Patchwork-Hint: ignore
Message-Id: <20251105222949.C7EF083DA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts: fix and restrict
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4da66e8130c6d2af9c15534a29df74ca7bbfe629
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/scripts/check-merged-usr.sh | 81 ++++++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 33 deletions(-)

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
+test_merged() {
+	local type="${1}"
+	local root="${2}"
+	local base="${3}"
+	local dir1="${4}"
+	local dir2="${5}"
 
-	inode1="$(stat -c '%i' "${root}${dir1}/." 2>/dev/null)"
-	inode2="$(stat -c '%i' "${root}${dir2}/." 2>/dev/null)"
+	if ! test -e "${root}${base}${dir1}"; then
+		return 0
+	elif [ "$(readlink "${root}${base}${dir1}")" = "${dir2}" ]; then
+		return 0
+	fi
 
-	test -z "${inode1}" || test "${inode1}" = "${inode2}"
+	# Otherwise, this directory is not merged
+	report_error "${type}" "${root}" \
+		'%s%s should be missing, or be a relative symlink to %s\n' \
+		"${base}" "${dir1}" "${dir2}"
 }
 
-test_merged() {
+test_dir() {
 	local type="${1}"
 	local root="${2}"
-	local dir1="${3}"
-	local dir2="${4}"
+	local base="${3}"
+	local dir="${4}"
 
-	if ! is_valid_merged "${root}" "${dir1}" "${dir2}"; then
-		report_error "${type}" "${root}" \
-			'%s should be missing, or be a relative symlink to %s\n' \
-			"${dir1}" "${dir2}"
+	if ! test -e "${root}${base}${dir}" && ! ${strict}; then
+		return 0
+	elif test -d "${root}${base}${dir}" && ! test -L "${root}${base}${dir}"; then
+		return 0
 	fi
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
