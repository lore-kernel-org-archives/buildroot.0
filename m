Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7B0EB64D0
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 16:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9630A409C8;
	Tue, 13 Jun 2023 16:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9630A409C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3G4Csyg0ugg; Tue, 13 Jun 2023 16:46:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AFF540396;
	Tue, 13 Jun 2023 16:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AFF540396
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A95B21BF95E
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 16:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9072240396
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 16:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9072240396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ehwu38dehndY for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 16:46:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CD7E400BF
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 16:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CD7E400BF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 282C382AF2; Tue, 13 Jun 2023 16:46:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 18:40:17 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: bcddc639d08716f285ceb24a735ce4f918d28352
X-Git-Newrev: f3ba4a27285912d6e7bc040ca96b54391f090024
X-Patchwork-Hint: ignore
Message-Id: <20230613164621.282C382AF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] utils/docker-run: make it
 work in workdirs/woktrees
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3ba4a27285912d6e7bc040ca96b54391f090024
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

It is quite customary to use a single repository with multiple workdirs,
one for each active branch, with either the aging 'git new-workdir' or
the more recent 'git worktree'.

However, in a workdir/worktree, most entries in .git/ are only symlinks
to the actual files in the main repository.

Currently, utils/docker-run only bind-mounts the current working copy.
If that is a workdir/worktree, then it is going to be missing the actual
git data, resulting in errors like:

    $ ./utils/docker-run make check-package
    fatal: not a git repository (or any parent up to mount point [....]/buildroot)
    Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
    No files to check style
    make: *** [Makefile:1257: check-package] Error 1

So, we also bind-mount the actual git directory. If that is a subdir
of the current working copy, then it is already mounted and thus the
bind-mount is superfluous but harmless; for simplicity, we mount it
unconditionally.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
(cherry picked from commit 791c163b2f9f07d4c02b18eabd9b195918e1c603)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/docker-run | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
index 135a1451b6..17c587a484 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -2,6 +2,8 @@
 set -o errexit -o pipefail
 DIR=$(dirname "${0}")
 MAIN_DIR=$(readlink -f "${DIR}/..")
+# GIT_DIR to support workdirs/worktrees
+GIT_DIR="$(dirname "$(realpath "${MAIN_DIR}/.git/config")")"
 # shellcheck disable=SC2016
 IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
         sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
@@ -11,6 +13,7 @@ declare -a docker_opts=(
     --rm
     --user "$(id -u):$(id -g)"
     --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}"
+    --mount "type=bind,src=${GIT_DIR},dst=${GIT_DIR}"
     --workdir "${MAIN_DIR}"
 )
 if tty -s; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
