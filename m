Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C29C4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 18:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B55640042;
	Mon, 13 Nov 2023 18:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B55640042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EskEGz9ejU4H; Mon, 13 Nov 2023 18:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8D9840133;
	Mon, 13 Nov 2023 18:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8D9840133
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FA0B1BF228
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 18:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCDD960D70
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 18:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCDD960D70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6dezXCGRAzDH for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 18:56:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A2A660A9C
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 18:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A2A660A9C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDC43870D8; Mon, 13 Nov 2023 18:56:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Nov 2023 19:52:57 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 481e7ebc4eef384acfaa8c8cd5a6554f7ae69882
X-Git-Newrev: 622f810f5a3d96d37a7144af9c24d0fae4c5d403
X-Patchwork-Hint: ignore
Message-Id: <20231113185632.DDC43870D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] utils/add-custom-hashes:
 add script to manage global patch dir hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=622f810f5a3d96d37a7144af9c24d0fae4c5d403
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Add a script to manage the .hash files in the BR2_GLOBAL_PATCH_DIR for
packages using custom versions.

To use it, run in a configured Buildroot directory, E.G.

  make foo_defconfig; ./utils/add-custom-hashes

We support multiple patch directories in BR2_GLOBAL_PATCH_DIR.  If multiple
directories are specified then use the last one as that is likely to be the
most specific one.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: silence command -v invocation]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4984d0f230d0962270beb195966603f1d5a56300)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize-patches.txt |   2 +
 utils/add-custom-hashes           | 103 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/docs/manual/customize-patches.txt b/docs/manual/customize-patches.txt
index 72e87c3c04..f33bbcdde7 100644
--- a/docs/manual/customize-patches.txt
+++ b/docs/manual/customize-patches.txt
@@ -79,3 +79,5 @@ the first file to exist is used to check a package download:
 
 * +<global-patch-dir>/<packagename>/<packageversion>/<packagename>.hash+
 * +<global-patch-dir>/<packagename>/<packagename>.hash+
+
+The +utils/add-custom-hashes+ script can be used to generate these files.
diff --git a/utils/add-custom-hashes b/utils/add-custom-hashes
new file mode 100755
index 0000000000..20e48d8ef3
--- /dev/null
+++ b/utils/add-custom-hashes
@@ -0,0 +1,103 @@
+#!/usr/bin/env bash
+set -e
+
+# Add hash files for packages with custom versions for
+# BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+#
+# Run in a configured Buildroot directory, E.G.
+# make foo_defconfig; ./utils/add-custom-hashes
+
+# print BR-style message
+# message <info message>
+message() {
+    tput smso 2>/dev/null
+    echo "$*"
+    tput rmso 2>/dev/null
+}
+
+# print error message and exit
+# die <error message>
+die() {
+    echo "Error: $*" >&2
+    exit 1
+}
+
+# get package(s) for download file, if any
+# get_pkgs <json> <file>
+get_pkgs() {
+    jq --arg file "$2" -r \
+       'to_entries[] | select(.value.downloads[0].source == $file) | .key | strings' "$1"
+}
+
+# get download dir for package
+# get_pkg_dl_dir <json> <package>
+get_pkg_dl_dir() {
+    jq --arg pkg "$2" -r '.[$pkg].dl_dir | strings' "$1"
+}
+
+# generate hash file for download file
+# gen_hash <dir> <file>
+gen_hash() {
+    (
+        cd "$1" && printf '# Locally calculated\nsha256  ' && sha256sum "$2"
+    )
+}
+
+command -v jq >/dev/null || die 'Script needs jq'
+
+[ -e .config ] || \
+  die "No .config found, please run this in a configured Buildroot (O=) directory"
+
+message Collecting data
+
+eval "$(make -s VARS='TOPDIR DL_DIR BR_NO_CHECK_HASH_FOR BR2_GLOBAL_PATCH_DIR' QUOTED_VARS=YES printvars)"
+# global patch dir may already have quotes
+BR2_GLOBAL_PATCH_DIR=$(echo "$BR2_GLOBAL_PATCH_DIR" | tr -d '"')
+
+[ -n "$BR2_GLOBAL_PATCH_DIR" ] || die "No BR2_GLOBAL_PATCH_DIR defined, nothing to do"
+[ -n "$BR_NO_CHECK_HASH_FOR" ] || die "No packages without hashes found, nothing to do"
+
+[ -d "$TOPDIR" ] || die "TOPDIR ($TOPDIR) does not look correct"
+[ -d "$DL_DIR" ] || die "DL_DIR ($DL_DIR) does not look correct"
+
+# patch dir may contain multiple dirs, use the last one
+# shellcheck disable=SC2086 # we need the word splitting
+set -- $BR2_GLOBAL_PATCH_DIR
+if [ $# -gt 1 ]; then
+    BR2_GLOBAL_PATCH_DIR="${!#}";
+    message BR2_GLOBAL_PATCH_DIR contains multiple directories, using "$BR2_GLOBAL_PATCH_DIR"
+fi
+
+# patch dir may be relative to TOPDIR
+case "$BR2_GLOBAL_PATCH_DIR" in
+    /*) ;;
+    *) BR2_GLOBAL_PATCH_DIR="$TOPDIR/$BR2_GLOBAL_PATCH_DIR"
+       ;;
+esac
+
+[ -d "$BR2_GLOBAL_PATCH_DIR" ] \
+  || die "BR2_GLOBAL_PATCH_DIR ($BR2_GLOBAL_PATCH_DIR) does not look correct"
+
+trap 'rm -f "$JSON"' EXIT
+JSON=$(mktemp)
+make show-info > "$JSON"
+
+# ensure files have been downloaded, but without checking
+make BR2_DOWNLOAD_FORCE_CHECK_HASHES= source
+
+message Updating hashes
+
+for file in $BR_NO_CHECK_HASH_FOR; do
+    for pkg in $(get_pkgs "$JSON" "$file"); do
+        HASHFILE="$BR2_GLOBAL_PATCH_DIR/$pkg/$pkg.hash"
+        PKG_DL_DIR=$(get_pkg_dl_dir "$JSON" "$pkg")
+        message "Adding hash for $file to $HASHFILE"
+        mkdir -p "${HASHFILE%/*}"
+        gen_hash "$DL_DIR/$PKG_DL_DIR" "$file" > "$HASHFILE"
+    done
+done
+
+message Verifying hashes
+
+make clean
+make BR2_DOWNLOAD_FORCE_CHECK_HASHES=y source
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
