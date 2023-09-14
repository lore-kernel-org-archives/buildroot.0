Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55CEEEAA71
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F250612C8;
	Thu, 14 Sep 2023 21:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F250612C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iezbBtV1DM5t; Thu, 14 Sep 2023 21:03:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB7D4612C4;
	Thu, 14 Sep 2023 21:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB7D4612C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A35DB1BF368
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6549383A0A
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6549383A0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FpP7MhD_VEaU for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:02:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7873983A3E
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7873983A3E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6181286FF6; Thu, 14 Sep 2023 21:02:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 23:02:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: daa341cb9bc82d8bcb175c46da1ba80fd9203a98
X-Git-Newrev: bcee3ca6d66d30de4b0cd8186ce4c72020705df8
X-Patchwork-Hint: ignore
Message-Id: <20230914210236.6181286FF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download/git: fix shellcheck errors
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bcee3ca6d66d30de4b0cd8186ce4c72020705df8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The quoting around the expansion of ${relative_dir} was indeed incorrect
since it was introduced back in 8fe9894f655f (suport/download: fix git
wrapper with submodules on older git versions): it is in fact already
quoted as part of the whole sed expression.

${GIT} can contain more than one item, but we don't care about splitting
on spaces when we just print it for debug, so we can just quote it
rather than add an exception.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore  | 1 -
 support/download/git | 9 +++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index bf8df8cef5..fde8eceed2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1612,7 +1612,6 @@ support/download/check-hash Shellcheck
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
