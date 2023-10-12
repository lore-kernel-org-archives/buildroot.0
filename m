Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1C3CDB46E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 16:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 140128237B;
	Thu, 12 Oct 2023 16:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 140128237B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AcOyfEUkPDN4; Thu, 12 Oct 2023 16:03:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B5DC82315;
	Thu, 12 Oct 2023 16:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B5DC82315
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA25F1BF3DA
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92E9482278
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92E9482278
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HgnG8N5pRZ63 for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 16:03:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E79782702
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 16:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E79782702
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 762558460E; Thu, 12 Oct 2023 16:03:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 18:02:28 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e57c04d9204736f331cb522d441f9981065b79c3
X-Git-Newrev: e1d045174bfc99ee8eaf0833805628a300765023
X-Patchwork-Hint: ignore
Message-Id: <20231012160336.762558460E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/go: cgo for the
 target needs the toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1d045174bfc99ee8eaf0833805628a300765023
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Building go with cgo support needs to build some .c files to generate target
support code, and thus calls the cross C compiler, which is failing when the
toolchain is not built before host-go:

    >>> host-go 1.21.1 Building
    cd .../build/host-go-1.21.1/src && GO111MODULE=off GOCACHE=.../per-package/host-go/host/share/host-go-cache GOROOT_BOOTSTRAP=.../per-package/host-go/host/lib/go-1.19.11 GOROOT_FINAL=.../per-package/host-go/host/lib/go GOROOT=".../build/host-go-1.21.1" GOBIN=".../build/host-go-1.21.1/bin" GOOS=linux CC=/usr/bin/gcc CXX=/usr/bin/g++ CGO_ENABLED=1 CC_FOR_TARGET=".../per-package/host-go/host/bin/arm-linux-gcc" CXX_FOR_TARGET=".../per-package/host-go/host/bin/arm-linux-g++" GOOS="linux" GOARCH=arm  GOARM=6 GO_ASSUME_CROSSCOMPILING=1 ./make.bash
    Building Go cmd/dist using .../per-package/host-go/host/lib/go-1.19.11.  (go1.19.11 linux/amd64)
    go tool dist: cannot invoke C compiler [".../per-package/host-go/host/bin/arm-linux-gcc"]: fork/exec .../per-package/host-go/host/bin/arm-linux-gcc: no such file or directory

    Go needs a system C compiler for use with cgo.
    To set a C compiler, set CC=the-compiler.
    To disable cgo, set CGO_ENABLED=0.

This happens systematically with PPD, and happens without PPD when
host-go is explicitly built (by running: "make host-go").

Since only CGO support needs to compile C files, only add the toolchain
dependency in that case.

When the target is not supported by go, then there is obviously no need
to depend on the toolchain (even if we unconditionally enable cgo
support in only-for-the-host host-go).

Signed-off-by: Christian Stewart <christian@aperture.us>
[yann.morin@orange.com:
  - only add the toolchain dependency for target cgo
  - reword commit log
]
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Anisse Astier <anisse@astier.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1a44f9242c960dcb114f60674043c8044c71c2c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index d75c1afa9e..01442b0f62 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -89,6 +89,7 @@ HOST_GO_TARGET_ENV = \
 # any target package needing cgo support must include
 # 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+HOST_GO_DEPENDENCIES += toolchain
 HOST_GO_CGO_ENABLED = 1
 else
 HOST_GO_CGO_ENABLED = 0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
