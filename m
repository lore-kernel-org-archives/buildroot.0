Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74302C83F14
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 22:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B62B4187D;
	Wed, 30 Aug 2023 22:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B62B4187D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4UARz0iS8ArF; Wed, 30 Aug 2023 22:33:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FB65418B8;
	Wed, 30 Aug 2023 22:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FB65418B8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C17291BF980
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A257041E26
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A257041E26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AI9N5CoTuQyQ for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 22:32:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 826AC41917
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 22:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 826AC41917
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FE5B866D8; Wed, 30 Aug 2023 22:32:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 22:58:40 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 71bece0f26a030e89ef9304d77ddca6dc04abd19
X-Git-Newrev: 93fb7cccca622cc15d2f33f3c567a6a26b25f4b0
X-Patchwork-Hint: ignore
Message-Id: <20230830223233.6FE5B866D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] utils/docker-run: fix
 support for git-worktrees
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

commit: https://git.buildroot.net/buildroot/commit/?id=93fb7cccca622cc15d2f33f3c567a6a26b25f4b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The docker-run script attempts to support git-new-workdirs and
git-worktrees by resolving the symlink at '$GIT_DIR/config' to get the
true $GIT_DIR. However this does not work for git-worktrees as they do
not use symlinks, instead they change the $GIT_DIR into a regular file
that contains the path to the real $GIT_DIR. To complicate things
further, we actually want the $GIT_COMMON_DIR which is the superset of a
worktree's $GIT_DIR.

git-rev-parse supports the '--git-common-dir' which will resolve the
$GIT_COMMON_DIR for us. However it does not work for git-new-workdirs,
so we still need to detect and handle them.

'--git-common-dir' also appeared only with git 2.10.0, released in 2016,
so it will not be available in older "enterprise-grade" distributions.
In that case, 'git rev-parse --git-common-dir' would return the option
flag '--git-common-dir' as-is, which is incorrect. So, we instruct it to
never return flags.

'--git-common-dir' also returns just '.git' for the main working copy,
but 'docker run' want an absolute path, so we canonicalise it.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
[yann.morin.1998@free.fr:
  - support git versions before --git-common-dir was introduced
  - don't mount GIT_DIR if unknown (i.e. not needed)
  - fix expanding MAIN_DIR
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 90790790925c5d456ce7585afdf6e42aa25fd9ea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/docker-run | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/utils/docker-run b/utils/docker-run
index 17c587a484..b201d28289 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -2,8 +2,13 @@
 set -o errexit -o pipefail
 DIR=$(dirname "${0}")
 MAIN_DIR=$(readlink -f "${DIR}/..")
-# GIT_DIR to support workdirs/worktrees
-GIT_DIR="$(dirname "$(realpath "${MAIN_DIR}/.git/config")")"
+if [ -L "${MAIN_DIR}/.git/config" ]; then
+    # Support git-new-workdir
+    GIT_DIR="$(dirname "$(realpath "${MAIN_DIR}/.git/config")")"
+else
+    # Support git-worktree
+    GIT_DIR="$(cd "${MAIN_DIR}" && git rev-parse --no-flags --git-common-dir)"
+fi
 # shellcheck disable=SC2016
 IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
         sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
@@ -13,9 +18,21 @@ declare -a docker_opts=(
     --rm
     --user "$(id -u):$(id -g)"
     --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}"
-    --mount "type=bind,src=${GIT_DIR},dst=${GIT_DIR}"
     --workdir "${MAIN_DIR}"
 )
+
+# Empty GIT_DIR means that we are not in a workdir, *and* git is too old
+# to know about worktrees, so we're not in a worktree either. So it means
+# we're in the main git working copy, and thus we don't need to mount the
+# .git directory.
+if [ "${GIT_DIR}" ]; then
+    # GIT_DIR in the main working copy (when git supports worktrees) will
+    # be just '.git', but 'docker run' needs an absolute path. If it's an
+    # absolute path already (in a wordir), then that's a noop.
+    GIT_DIR="$(readlink -e "${GIT_DIR}")"
+    docker_opts+=( --mount "type=bind,src=${GIT_DIR},dst=${GIT_DIR}" )
+fi
+
 if tty -s; then
     docker_opts+=( -t )
 fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
