Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBBBC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 12:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4233D81214;
	Tue,  7 Nov 2023 12:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4233D81214
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijIWqYNOpXzW; Tue,  7 Nov 2023 12:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 679F080C35;
	Tue,  7 Nov 2023 12:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 679F080C35
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B958D1BF39E
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 12:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9223A80C14
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 12:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9223A80C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OIYO7T9KaO9f for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 12:44:52 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AF1380C0A
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 12:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AF1380C0A
Received: by mail.gandi.net (Postfix) with ESMTPSA id E14521C000C;
 Tue,  7 Nov 2023 12:44:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1r0LRo-00HE9m-0d;
 Tue, 07 Nov 2023 13:44:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  7 Nov 2023 13:44:38 +0100
Message-Id: <20231107124439.4105974-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] utils/add-custom-hashes: add script to manage
 global patch dir hashes
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a script to manage the .hash files in the BR2_GLOBAL_PATCH_DIR for
packages using custom versions.

To use it, run in a configured Buildroot directory, E.G.

  make foo_defconfig; ./utils/add-custom-hashes

We support multiple patch directories in BR2_GLOBAL_PATCH_DIR.  If multiple
directories are specified then use the last one as that is likely to be the
most specific one.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize-patches.adoc |   2 +
 utils/add-custom-hashes            | 103 +++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100755 utils/add-custom-hashes

diff --git a/docs/manual/customize-patches.adoc b/docs/manual/customize-patches.adoc
index 72e87c3c04..f33bbcdde7 100644
--- a/docs/manual/customize-patches.adoc
+++ b/docs/manual/customize-patches.adoc
@@ -79,3 +79,5 @@ the first file to exist is used to check a package download:
 
 * +<global-patch-dir>/<packagename>/<packageversion>/<packagename>.hash+
 * +<global-patch-dir>/<packagename>/<packagename>.hash+
+
+The +utils/add-custom-hashes+ script can be used to generate these files.
diff --git a/utils/add-custom-hashes b/utils/add-custom-hashes
new file mode 100755
index 0000000000..857ca3dd4c
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
+command -v jq || die 'Script needs jq'
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
