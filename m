Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAD9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 20:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A53BE40871;
	Mon, 11 Apr 2022 20:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SewKHXHacBro; Mon, 11 Apr 2022 20:33:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 303B14033B;
	Mon, 11 Apr 2022 20:33:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39B421BF32D
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 20:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89CF14007F
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 20:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MUSy1yWyT2zK for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 20:33:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3694640998
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 20:33:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 90BC3839FF; Mon, 11 Apr 2022 20:23:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 22:21:38 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ffe31cfec703c12e3d7c5840a5b63040e374a873
X-Git-Newrev: 46a92832cf57fb7fdb5bb67471bc80b1a10d4a99
X-Patchwork-Hint: ignore
Message-Id: <20220411202317.90BC3839FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/containerd:
 correct download hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=46a92832cf57fb7fdb5bb67471bc80b1a10d4a99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Something happened to the tarball logic on github, changing the hash of the 1.5.11 release:

6a289406c1c0583763e5a9754e31a1eced55cd5f162a7bc2a3a315d5eb05c7a1  old/containerd-1.5.11.tar.gz
02b79d5e2b07b5e64cd28f1fe84395ee11eef95fc49fd923a9ab93022b148be6  new/containerd-1.5.11.tar.gz

-rw-r--r-- 1 peko peko 7494478 Apr 11 20:53 old/containerd-1.5.11.tar.gz
-rw-r--r-- 1 peko peko 7494477 Apr  5 20:39 new/containerd-1.5.11.tar.gz

Extracting and comparing them gives:

--- a/containerd-1.5.11/vendor/k8s.io/client-go/pkg/version/base.go     2022-03-24 01:09:42.000000000 +0100
+++ b/containerd-1.5.11/vendor/k8s.io/client-go/pkg/version/base.go     2022-03-24 01:09:42.000000000 +0100
@@ -55,7 +55,7 @@ var (
        // NOTE: The $Format strings are replaced during 'git archive' thanks to the
        // companion .gitattributes file containing 'export-subst' in this same
        // directory.  See also https://git-scm.com/docs/gitattributes
-       gitVersion   string = "v0.0.0-master+3df54a85234"
+       gitVersion   string = "v0.0.0-master+3df54a8523"
        gitCommit    string = "3df54a852345ae127d1fa3092b95168e4a88e2f8" // sha1 from git, output of $(git rev-parse HEAD)
        gitTreeState string = ""            // state of git tree, either "clean" or "dirty"

The file in the repo uses $Format:%H$ and set the export-subst git attribute:

	gitVersion   string = "v0.0.0-master+$Format:%H$"
	gitCommit    string = "$Format:%H$" // sha1 from git, output of $(git rev-parse HEAD)

https://github.com/containerd/containerd/blob/main/vendor/k8s.io/client-go/pkg/version/base.go

So presumably it is related to that.  In any case, update the hash to match
what Github is now serving to fix the build.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/containerd/containerd.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 23dacded88..3f5c9865e6 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  6a289406c1c0583763e5a9754e31a1eced55cd5f162a7bc2a3a315d5eb05c7a1  containerd-1.5.11.tar.gz
+sha256  02b79d5e2b07b5e64cd28f1fe84395ee11eef95fc49fd923a9ab93022b148be6  containerd-1.5.11.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
