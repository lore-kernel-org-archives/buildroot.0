Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF8CC001DE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29C0D8453A;
	Fri, 28 Jul 2023 19:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29C0D8453A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z5t9bhkQeZUO; Fri, 28 Jul 2023 19:28:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CB3E8455F;
	Fri, 28 Jul 2023 19:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CB3E8455F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A6D31BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FF5884561
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FF5884561
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KFhqn1BfxCq7 for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:28:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65ABD8455C
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65ABD8455C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 528898386F; Fri, 28 Jul 2023 19:28:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 21:27:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e53b6659b794e130e1198c1d366192671bf50ec
X-Git-Newrev: bc8e70a08ba083d978c828e31442a7645c9099d7
X-Patchwork-Hint: ignore
Message-Id: <20230728192806.528898386F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: fix go-bootstrap when parent
 dir contains invalid .git
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc8e70a08ba083d978c828e31442a7645c9099d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building host-go within docker fails:

error obtaining VCS status: exit status 128
	Use -buildvcs=false to disable VCS stamping.

Reproduction of the issue:

mkdir go-issue-61620
cd ./go-issue-61620
wget https://go.dev/dl/go1.19.11.src.tar.gz
mkdir go-bootstrap
tar -xf go1.19.11.src.tar.gz -C ./go-bootstrap --strip-components=1
cd ./go-bootstrap/src/
bash make.bash
cd ../../
wget https://go.dev/dl/go1.20.6.src.tar.gz
mkdir go
tar -xf go1.20.6.src.tar.gz -C ./go/ --strip-components=1
printf "gitdir: ../../does/not/exist/.git" > ./.git
cd ./go/src/
GOROOT_BOOTSTRAP=$(pwd)/../../go-bootstrap/ bash make.bash

The error only occurs when the .git that git detects in the parent directory of
the GOROOT_BOOTSTRAP is invalid or not present causing errors when running `git`
commands within GOROOT_BOOTSTRAP.

Report: https://lists.buildroot.org/pipermail/buildroot/2023-July/671344.html
Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186525
Upstream issue: https://github.com/golang/go/issues/61620
Upstream PR: https://github.com/golang/go/pull/61621

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...t-buildvcs-false-when-building-go-bootstr.patch | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
new file mode 100644
index 0000000000..e7158a2b3f
--- /dev/null
+++ b/package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
@@ -0,0 +1,73 @@
+From 6b05378097c6a386ed9912d2471976dc39504e86 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@aperture.us>
+Date: Thu, 27 Jul 2023 21:28:47 -0700
+Subject: [PATCH] cmd/dist: set buildvcs=false when building go-bootstrap
+
+When building go-bootstrap as part of the make.bash process, the cmd/dist
+invokes the bootstrap Go compiler to build the go_bootstrap tool:
+
+${GOROOT_BOOTSTRAP}/bin/go install -tags=math_big_pure_go compiler_bootstrap purego bootstrap/cmd/...
+
+If there is an invalid .git directory in a parent of ${GOROOT_BOOTSTRAP},
+make.bash will fail. Reproduction of the issue:
+
+  mkdir go-issue-61620
+  cd ./go-issue-61620
+  wget https://go.dev/dl/go1.19.11.src.tar.gz
+  mkdir go-bootstrap
+  tar -xf go1.19.11.src.tar.gz -C ./go-bootstrap --strip-components=1
+  cd ./go-bootstrap/src/
+  bash make.bash
+  cd ../../
+  wget https://go.dev/dl/go1.20.6.src.tar.gz
+  mkdir go
+  tar -xf go1.20.6.src.tar.gz -C ./go/ --strip-components=1
+  printf "gitdir: ../../does/not/exist/.git" > ./.git
+  cd ./go/src/
+  GOROOT_BOOTSTRAP=$(pwd)/../../go-bootstrap/ bash make.bash
+
+The build fails with the following error:
+
+  Building Go toolchain1 using [snip]/go-1.19.10.
+  error obtaining VCS status: exit status 128
+    Use -buildvcs=false to disable VCS stamping.
+  go tool dist: FAILED: [snip]/go-1.19.10/bin/go install -tags=math_big_pure_go \
+    compiler_bootstrap purego bootstrap/cmd/...: exit status 1
+
+This change unconditionally sets -buildvcs=false when compiling go-bootstrap. We
+don't need the revision information in those binaries anyway. Setting this flag
+was previously not done as we were unsure if the go-bootstrap compiler would be
+new enough to support the buildvcs build flag. Since Go 1.20.x, Go 1.19.x is the
+minimum version for go-bootstrap, and supports -buildvcs=false. We can now set
+-buildvcs=false without worrying about compatibility.
+
+Related: https://github.com/golang/go/issues/54852
+Fixes: https://github.com/golang/go/issues/61620
+
+---
+
+Upstream PR: https://github.com/golang/go/pull/61621
+
+Signed-off-by: Christian Stewart <christian@aperture.us>
+
+---
+ src/cmd/dist/buildtool.go | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go
+index a528d7aa76..3b411d6ebb 100644
+--- a/src/cmd/dist/buildtool.go
++++ b/src/cmd/dist/buildtool.go
+@@ -221,6 +221,9 @@ func bootstrapBuildTools() {
+ 	cmd := []string{
+ 		pathf("%s/bin/go", goroot_bootstrap),
+ 		"install",
++		// Fixes cases where an invalid .git is present in a parent of GOROOT_BOOTSTRAP.
++		// See: https://github.com/golang/go/issues/61620
++		"-buildvcs=false",
+ 		"-tags=math_big_pure_go compiler_bootstrap purego",
+ 	}
+ 	if vflag > 0 {
+-- 
+2.41.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
