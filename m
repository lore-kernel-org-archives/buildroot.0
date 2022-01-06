Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32F5C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 10:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E42040139;
	Thu,  6 Jan 2022 10:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id esOazPKU9C8D; Thu,  6 Jan 2022 10:35:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A9DD40A09;
	Thu,  6 Jan 2022 10:35:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2C31BF47D
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 10:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9708782BBA
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 10:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6x9uCDNCvwSg for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 10:35:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7416982B81
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 10:35:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F11C08344C; Thu,  6 Jan 2022 10:29:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 6 Jan 2022 11:32:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4841d722fb37f8c8c4715c7fe8b2502c9a3a9dd
X-Git-Newrev: cff428fe313a9163098243789e2ac2bd7c20d447
X-Patchwork-Hint: ignore
Message-Id: <20220106102930.F11C08344C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] download/git: support Git LFS
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

commit: https://git.buildroot.net/buildroot/commit/?id=cff428fe313a9163098243789e2ac2bd7c20d447
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Git Large File Storage replaces large files with text pointers in the
Git repository while storing the contents on a remote server.  If a
repository is using this extension, then git-lfs must be used to
checkout the large files before the source archive is generated.

Signed-off-by: John Keeping <john@metanate.com>
[vfazio:
  - add git-lfs to DL_TOOLS_DEPENDENCIES
  - fixup for 5a0d6813948fea2cdb88a2e35984520eec856dec
    ("infra/pkg-download: make the DOWNLOAD macro fully parameterised")
]
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
[Arnout:
 - don't "git lfs install";
 - recurse into submodules.
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/adding-packages-generic.txt |  4 ++++
 package/pkg-download.mk                 |  1 +
 package/pkg-generic.mk                  |  3 +++
 support/download/dl-wrapper             |  9 +++++----
 support/download/git                    | 13 +++++++++++++
 5 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 1384466f9b..8723da214a 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -344,6 +344,10 @@ not and can not work as people would expect it should:
   submodules when they contain bundled libraries, in which case we
   prefer to use those libraries from their own package.
 
+* +LIBFOO_GIT_LFS+ should be set to +YES+ if the Git repository uses
+  Git LFS to store large files out of band.  This is only available for
+  packages downloaded with git (i.e. when +LIBFOO_SITE_METHOD=git+).
+
 * +LIBFOO_STRIP_COMPONENTS+ is the number of leading components
   (directories) that tar must strip from file names on extraction.
   The tarball for most packages has one leading component named
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 5c2bdfdb23..823b34981c 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -119,6 +119,7 @@ define DOWNLOAD
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
 		$(if $($(2)_GIT_SUBMODULES),-r) \
+		$(if $($(2)_GIT_LFS),-l) \
 		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
 		$(QUIET) \
 		-- \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5626af1d87..6a5fe5507b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1207,6 +1207,9 @@ ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
 else ifeq ($$($(2)_SITE_METHOD),git)
 DL_TOOLS_DEPENDENCIES += git
+ifneq ($$($(2)_GIT_LFS),)
+DL_TOOLS_DEPENDENCIES += git-lfs
+endif
 else ifeq ($$($(2)_SITE_METHOD),bzr)
 DL_TOOLS_DEPENDENCIES += bzr
 else ifeq ($$($(2)_SITE_METHOD),scp)
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 6cf0b89cba..3185887541 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -17,15 +17,15 @@
 # We want to catch any unexpected failure, and exit immediately.
 set -e
 
-export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:ru:qf:e"
+export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:lru:qf:e"
 
 main() {
     local OPT OPTARG
-    local backend output hfile recurse quiet rc
+    local backend output hfile large_file recurse quiet rc
     local -a uris
 
     # Parse our options; anything after '--' is for the backend
-    while getopts ":c:d:D:o:n:N:H:rf:u:q" OPT; do
+    while getopts ":c:d:D:o:n:N:H:lrf:u:q" OPT; do
         case "${OPT}" in
         c)  cset="${OPTARG}";;
         d)  dl_dir="${OPTARG}";;
@@ -34,6 +34,7 @@ main() {
         n)  raw_base_name="${OPTARG}";;
         N)  base_name="${OPTARG}";;
         H)  hfile="${OPTARG}";;
+        l)  large_file="-l";;
         r)  recurse="-r";;
         f)  filename="${OPTARG}";;
         u)  uris+=( "${OPTARG}" );;
@@ -127,7 +128,7 @@ main() {
                 -f "${filename}" \
                 -u "${uri}" \
                 -o "${tmpf}" \
-                ${quiet} ${recurse} -- "${@}"
+                ${quiet} ${large_file} ${recurse} -- "${@}"
         then
             # cd back to keep path coherence
             cd "${OLDPWD}"
diff --git a/support/download/git b/support/download/git
index 1e690d4444..41c3160099 100755
--- a/support/download/git
+++ b/support/download/git
@@ -51,10 +51,12 @@ _on_error() {
 }
 
 quiet=
+large_file=0
 recurse=0
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  quiet=-q; exec >/dev/null;;
+    l)  large_file=1;;
     r)  recurse=1;;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
@@ -205,6 +207,17 @@ if [ ${recurse} -eq 1 ]; then
     done
 fi
 
+# If there are large files then fetch them.
+if [ ${large_file} -eq 1 ]; then
+    _git lfs fetch
+    _git lfs checkout
+    # If there are also submodules, recurse into them,
+    if [ ${recurse} -eq 1 ]; then
+        _git submodule foreach --recursive ${GIT} lfs fetch
+        _git submodule foreach --recursive ${GIT} lfs checkout
+    fi
+fi
+
 popd >/dev/null
 
 # Generate the archive.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
