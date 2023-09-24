Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A74CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 16:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBB04416D4;
	Sun, 24 Sep 2023 16:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBB04416D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jajsi8LNDpP; Sun, 24 Sep 2023 16:06:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9F0B416A2;
	Sun, 24 Sep 2023 16:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9F0B416A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DB991BF3BB
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84C7060A9B
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84C7060A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OSpBb9znAUs9 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 16:06:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A244560759
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 16:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A244560759
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90B9987595; Sun, 24 Sep 2023 16:06:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 17:57:54 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 424a575cde64fe4d594930d5ef62e6f79b97b5c4
X-Git-Newrev: 5f09ce4e66b9804522408c65257e1893a2b80fee
X-Patchwork-Hint: ignore
Message-Id: <20230924160627.90B9987595@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] support/download/git: fix
 shellcheck errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f09ce4e66b9804522408c65257e1893a2b80fee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

The quoting around the expansion of ${relative_dir} was indeed incorrect
since it was introduced back in 8fe9894f655f (suport/download: fix git
wrapper with submodules on older git versions): it is in fact already
quoted as part of the whole sed expression.

${GIT} can contain more than one item, but we don't care about splitting
on spaces when we just print it for debug, so we can just quote it
rather than add an exception.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bcee3ca6d66d30de4b0cd8186ce4c72020705df8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore  | 1 -
 support/download/git | 9 +++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3a9a6fb58c..67529ed0d4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1637,7 +1637,6 @@ support/download/check-hash Shellcheck
 support/download/cvs Shellcheck
 support/download/dl-wrapper Shellcheck
 support/download/file Shellcheck
-support/download/git Shellcheck
 support/download/go-post-process Shellcheck
 support/download/hg Shellcheck
 support/download/scp Shellcheck
diff --git a/support/download/git b/support/download/git
index 729c553f8f..6654d98a00 100755
--- a/support/download/git
+++ b/support/download/git
@@ -21,6 +21,7 @@ set -e
 # Environment:
 #   GIT      : the git command to call
 
+# shellcheck disable=SC1090 # Only provides mk_tar_gz()
 . "${0%/*}/helpers"
 
 # Save our path and options in case we need to call ourselves again
@@ -83,12 +84,13 @@ set -E
 # being expanded a second time (in case there are spaces in them)
 _git() {
     if [ -z "${quiet}" ]; then
-        printf '%s ' GIT_DIR="${git_cache}/.git" ${GIT} "${@}"; printf '\n'
+        printf '%s ' GIT_DIR="${git_cache}/.git" "${GIT}" "${@}"; printf '\n'
     fi
     _plain_git "$@"
 }
 # Note: please keep command below aligned with what is printed above
 _plain_git() {
+    # shellcheck disable=SC2086 # We want word-splitting for GIT
     eval GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
 }
 
@@ -174,6 +176,7 @@ fi
 # the working copy as well as the repository, which means submodules
 # will not be cached for older versions.
 #
+# shellcheck disable=SC2016 # Will be expanded by git-foreach
 cmd='printf "Deregistering submodule \"%s\"\n" "${path}" && cd .. && rm -rf "${path##*/}"'
 _git submodule --quiet foreach "'${cmd}'"
 
@@ -200,11 +203,12 @@ if [ ${recurse} -eq 1 ]; then
     # that the archives are reproducible across a wider range of git
     # versions. However, we can't do that if git is too old and uses
     # full repositories for submodules.
+    # shellcheck disable=SC2016 # Will be expanded by git-foreach
     cmd='printf "%s\n" "${path}/"'
     for module_dir in $( _plain_git submodule --quiet foreach "'${cmd}'" ); do
         [ -f "${module_dir}/.git" ] || continue
         relative_dir="$( sed -r -e 's,/+,/,g; s,[^/]+/,../,g' <<<"${module_dir}" )"
-        sed -r -i -e "s:^gitdir\: $(pwd)/:gitdir\: "${relative_dir}":" "${module_dir}/.git"
+        sed -r -i -e "s:^gitdir\: $(pwd)/:gitdir\: ${relative_dir}:" "${module_dir}/.git"
     done
 fi
 
@@ -214,6 +218,7 @@ if [ ${large_file} -eq 1 ]; then
     _git lfs fetch
     _git lfs checkout
     # If there are also submodules, recurse into them,
+    # shellcheck disable=SC2086 # We want word-splitting for GIT
     if [ ${recurse} -eq 1 ]; then
         _git submodule foreach --recursive ${GIT} lfs install --local
         _git submodule foreach --recursive ${GIT} lfs fetch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
