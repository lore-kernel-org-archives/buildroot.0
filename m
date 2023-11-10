Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0111FC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 13:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE177421EA;
	Fri, 10 Nov 2023 13:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE177421EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tfz-6oY8Mcmf; Fri, 10 Nov 2023 13:37:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8207E4218F;
	Fri, 10 Nov 2023 13:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8207E4218F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B10221BF3E1
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 13:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AD4660FDA
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 13:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AD4660FDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q9lXg9Qd4lyo for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 13:37:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F9F960B99
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 13:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F9F960B99
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AF4A86F4C; Fri, 10 Nov 2023 13:37:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 14:29:25 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: ef14ff2a718448f418b65efecbfaddb9d90c3d24
X-Git-Newrev: 752a0a7a8e282f1e669b810e83c5bf83eb9e6d76
X-Patchwork-Hint: ignore
Message-Id: <20231110133723.5AF4A86F4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] support/download: teach
 dl-wrapper to handle more than one hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=752a0a7a8e282f1e669b810e83c5bf83eb9e6d76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Currently, we expect and only use hash files that lie within the package
directory, alongside the .mk file. Those hash files are thus bundled
with Buildroot.

This implies that only what's known to Buildroot can ever get into those
hash files. For packages where the version is fixed (or a static
choice), then we can carry hashes for those known versions.

However, we do have a few packages for which the version is a free-form
entry, where the user can provide a custom location and/or version. like
a custom VCS tree and revision, or a custom tarball URL. This means that
Buildroot has no way to be able to cary hashes for such custom versions.

This means that there is no integrity check that what was downloaded is
what was expected. For a sha1 in a git tree, this is a minor issue,
because the sha1 by itself is already a hash of the expected content.
But for custom tarballs URLs, or for a tag in a VCS, there is indeed no
integrity check.

Buildroot can't provide such hashes, but interested users may want to
provide those, and currently there is no (easy) way to do so.

So, we need our download helpers to be able to accept more than one hash
file to lookup for hashes.

Extend the dl-wrapper and the check-hash helpers thusly, and update the
legal-info accordingly.

Note that, to be able to pass more than one hash file, we also need to
re-order the arguments passed to support/download/check-hash, which also
impies some shuffling in the three places it is called:
  - 2 in dl-wrapper
  - 1 in the legal-info infra

That in turn also requires that the legal-license-file macro args get
re-ordered to have the hash file last; we take the opportunity to also
move the HOST/TARGET arg to be first, like in the other legal-info
macros.

Reported-by: "Martin Zeiser (mzeiser)" <mzeiser@cisco.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f91e89b6e64d4ad092c359a658a8ee22e848ce66)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                    |  2 +-
 package/pkg-generic.mk      |  2 +-
 package/pkg-utils.mk        |  8 +++---
 support/download/check-hash | 64 ++++++++++++++++++++++++---------------------
 support/download/dl-wrapper | 10 +++----
 5 files changed, 45 insertions(+), 41 deletions(-)

diff --git a/Makefile b/Makefile
index 74f3fca79f..c741e8d24e 100644
--- a/Makefile
+++ b/Makefile
@@ -832,7 +832,7 @@ legal-info-clean:
 .PHONY: legal-info-prepare
 legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call MESSAGE,"Buildroot $(BR2_VERSION_FULL) Collecting legal info")
-	@$(call legal-license-file,buildroot,buildroot,support/legal-info/buildroot.hash,COPYING,COPYING,HOST)
+	@$(call legal-license-file,HOST,buildroot,buildroot,COPYING,COPYING,support/legal-info/buildroot.hash)
 	@$(call legal-manifest,TARGET,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,DEPENDENCIES WITH LICENSES)
 	@$(call legal-manifest,HOST,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,DEPENDENCIES WITH LICENSES)
 	@$(call legal-manifest,HOST,buildroot,$(BR2_VERSION_FULL),GPL-2.0+,COPYING,not saved,not saved)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 34e96c2d1c..e70ed48266 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1132,7 +1132,7 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
 	$(Q)$$(call legal-warning-pkg,$$($(2)_BASENAME_RAW),cannot save license ($(2)_LICENSE_FILES not defined))
 else
-	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$($(2)_HASH_FILE),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
+	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$(F),$$($(2)_DIR)/$$(F),$$($(2)_HASH_FILE))$$(sep))
 endif # license files
 
 ifeq ($$($(2)_REDISTRIBUTE),YES)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index dcab7d9b2a..b91061a572 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -280,13 +280,13 @@ define legal-manifest # {HOST|TARGET}, pkg, version, license, license-files, sou
 	echo '"$(2)","$(3)","$(4)","$(5)","$(6)","$(7)","$(8)"' >>$(LEGAL_MANIFEST_CSV_$(1))
 endef
 
-define legal-license-file # pkgname, pkgname-pkgver, pkg-hashfile, filename, file-fullpath, {HOST|TARGET}
-	mkdir -p $(LICENSE_FILES_DIR_$(6))/$(2)/$(dir $(4)) && \
+define legal-license-file # {HOST|TARGET}, pkgname, pkgname-pkgver, filename, file-fullpath, pkg-hashfile
+	mkdir -p $(LICENSE_FILES_DIR_$(1))/$(3)/$(dir $(4)) && \
 	{ \
-		support/download/check-hash $(3) $(5) $(4); \
+		support/download/check-hash $(5) $(4) $(6); \
 		case $${?} in (0|3) ;; (*) exit 1;; esac; \
 	} && \
-	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
+	cp $(5) $(LICENSE_FILES_DIR_$(1))/$(3)/$(4)
 endef
 
 non-virtual-deps = $(foreach p,$(1),$(if $($(call UPPERCASE,$(p))_IS_VIRTUAL),,$(p)))
diff --git a/support/download/check-hash b/support/download/check-hash
index 5a47f49bc3..03a6557187 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -3,12 +3,12 @@ set -e
 
 # Helper to check a file matches its known hash
 # Call it with:
-#   $1: the path of the file containing all the expected hashes
-#   $2: the full path to the temporary file that was downloaded, and
+#   $1: the full path to the temporary file that was downloaded, and
 #       that is to be checked
-#   $3: the final basename of the file, to which it will be ultimately
+#   $2: the final basename of the file, to which it will be ultimately
 #       saved as, to be able to match it to the corresponding hashes
 #       in the .hash file
+#   $*: the paths of the files containing all the expected hashes
 #
 # Exit codes:
 #   0:  the hash file exists and the file to check matches all its hashes,
@@ -27,28 +27,21 @@ while getopts :q OPT; do
 done
 shift $((OPTIND-1))
 
-h_file="${1}"
-file="${2}"
-base="${3}"
-
-# Bail early if no hash to check
-if [ -z "${h_file}" ]; then
-    exit 0
-fi
-# Does the hash-file exist?
-if [ ! -f "${h_file}" ]; then
-    printf "WARNING: no hash file for %s\n" "${base}" >&2
-    exit 0
-fi
+file="${1}"
+base="${2}"
+shift 2
+declare -a h_files=( "${@}" )
 
 # Check one hash for a file
 # $1: algo hash
 # $2: known hash
 # $3: file (full path)
+# $4: hash file (full path)
 check_one_hash() {
     _h="${1}"
     _known="${2}"
     _file="${3}"
+    _h_file="${4}"
 
     # Note: md5 is supported, but undocumented on purpose.
     # Note: sha3 is not supported, since there is currently no implementation
@@ -70,6 +63,7 @@ check_one_hash() {
         return 0
     fi
 
+    printf "ERROR: while checking hashes from %s\n" "${_h_file}" >&2
     printf "ERROR: %s has wrong %s hash:\n" "${base}" "${_h}" >&2
     printf "ERROR: expected: %s\n" "${_known}" >&2
     printf "ERROR: got     : %s\n" "${_hash}" >&2
@@ -79,21 +73,31 @@ check_one_hash() {
 }
 
 # Do we know one or more hashes for that file?
+nb_h_files=0
 nb_checks=0
-while read t h f; do
-    case "${t}" in
-        ''|'#'*)
-            # Skip comments and empty lines
-            continue
-            ;;
-        *)
-            if [ "${f}" = "${base}" ]; then
-                check_one_hash "${t}" "${h}" "${file}"
-                : $((nb_checks++))
-            fi
-            ;;
-    esac
-done <"${h_file}"
+for h_file in "${h_files[@]}"; do
+    [ -f "${h_file}" ] || continue
+    : $((nb_h_files++))
+    while read t h f; do
+        case "${t}" in
+            ''|'#'*)
+                # Skip comments and empty lines
+                continue
+                ;;
+            *)
+                if [ "${f}" = "${base}" ]; then
+                    check_one_hash "${t}" "${h}" "${file}" "${h_file}"
+                    : $((nb_checks++))
+                fi
+                ;;
+        esac
+    done <"${h_file}"
+done
+
+if [ ${nb_h_files} -eq 0 ]; then
+    printf "WARNING: no hash file for %s\n" "${base}" >&2
+    exit 0
+fi
 
 if [ ${nb_checks} -eq 0 ]; then
     case " ${BR_NO_CHECK_HASH_FOR} " in
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 1e8d6058f6..35428faeef 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -21,8 +21,8 @@ export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:lru:qf:e"
 
 main() {
     local OPT OPTARG
-    local backend output hfile large_file recurse quiet rc
-    local -a uris
+    local backend output large_file recurse quiet rc
+    local -a uris hfiles
 
     # Parse our options; anything after '--' is for the backend
     while getopts ":c:d:D:o:n:N:H:lrf:u:qp:" OPT; do
@@ -33,7 +33,7 @@ main() {
         o)  output="${OPTARG}";;
         n)  raw_base_name="${OPTARG}";;
         N)  base_name="${OPTARG}";;
-        H)  hfile="${OPTARG}";;
+        H)  hfiles+=( "${OPTARG}" );;
         l)  large_file="-l";;
         r)  recurse="-r";;
         f)  filename="${OPTARG}";;
@@ -70,7 +70,7 @@ main() {
     # - fails at least one of its hashes: force a re-download
     # - there's no hash (but a .hash file): consider it a hard error
     if [ -e "${output}" ]; then
-        if support/download/check-hash ${quiet} "${hfile}" "${output}" "${output##*/}"; then
+        if support/download/check-hash ${quiet} "${output}" "${output##*/}" "${hfiles[@]}"; then
             exit 0
         elif [ ${?} -ne 2 ]; then
             # Do not remove the file, otherwise it might get re-downloaded
@@ -154,7 +154,7 @@ main() {
 
         # Check if the downloaded file is sane, and matches the stored hashes
         # for that file
-        if support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
+        if support/download/check-hash ${quiet} "${tmpf}" "${output##*/}" "${hfiles[@]}"; then
             rc=0
         else
             if [ ${?} -ne 3 ]; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
