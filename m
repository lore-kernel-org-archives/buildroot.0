Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF5AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EC98813E9;
	Sun,  6 Feb 2022 14:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kthZXKMWj3BW; Sun,  6 Feb 2022 14:35:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90392813E5;
	Sun,  6 Feb 2022 14:35:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B3AD1BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44EC660B75
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Loh6m-RNMuty for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:35:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77FAA60D6E
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:35:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E77CB82B2E; Sun,  6 Feb 2022 14:28:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 15:35:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fcceee0b2ed2b36e6671c8209d17ccc4dd689548
X-Git-Newrev: 242e9d72e7d2217d6213f63f65d93c5ba3b01f7c
X-Patchwork-Hint: ignore
Message-Id: <20220206142819.E77CB82B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker-run: new script
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

commit: https://git.buildroot.net/buildroot/commit/?id=242e9d72e7d2217d6213f63f65d93c5ba3b01f7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a small script to run commands in the same docker image used in the
GitLab CI.

For instance, one can run check-package unit tests without installing
pytest directly in the host:
$ ./utils/docker-run python3 -m pytest -v utils/checkpackagelib/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Arnout: fix shellcheck errors; add exec]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/docker-run | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
new file mode 100755
index 0000000000..0614f1325d
--- /dev/null
+++ b/utils/docker-run
@@ -0,0 +1,10 @@
+#!/usr/bin/bash
+set -o errexit -o pipefail
+DIR=$(dirname "${0}")
+MAIN_DIR=$(readlink -f "${DIR}/..")
+# shellcheck disable=SC2016
+IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
+        sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
+
+set -x
+exec docker run -v "${MAIN_DIR}:/home/br-user" -t "${IMAGE}" "$@"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
