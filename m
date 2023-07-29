Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DC1C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 15:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44BCB81E2E;
	Sat, 29 Jul 2023 15:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44BCB81E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q-pel1OhF3Pt; Sat, 29 Jul 2023 15:24:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51D9981DFF;
	Sat, 29 Jul 2023 15:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51D9981DFF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A31371BF3EA
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 15:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82C9E81DFA
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 15:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82C9E81DFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MsWwhJtdjk-2 for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 15:24:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65BDF81D18
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 15:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65BDF81D18
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51E7A83AE7; Sat, 29 Jul 2023 15:24:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 17:22:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4bcbf467c307a8bb07e7937ebf4b35e27eb66305
X-Git-Newrev: 90790790925c5d456ce7585afdf6e42aa25fd9ea
X-Patchwork-Hint: ignore
Message-Id: <20230729152426.51E7A83AE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker-run: fix support for
 git-worktrees
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

commit: https://git.buildroot.net/buildroot/commit/?id=90790790925c5d456ce7585afdf6e42aa25fd9ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
