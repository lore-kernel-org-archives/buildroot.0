Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BF1E77354
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 07:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F7C140336;
	Sat, 30 Sep 2023 07:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F7C140336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EX04uEBd8ZOs; Sat, 30 Sep 2023 07:00:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1035840438;
	Sat, 30 Sep 2023 07:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1035840438
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7308F1BF82C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A70B40136
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A70B40136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZ5IzgOfsmmP for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 07:00:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58011405CB
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 07:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58011405CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4199C822B4; Sat, 30 Sep 2023 07:00:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 08:41:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 540e512f9f88c028e48a6c0936c7bf2c12c1c1f8
X-Git-Newrev: 1a44f9242c960dcb114f60674043c8044c71c2c0
X-Patchwork-Hint: ignore
Message-Id: <20230930070004.4199C822B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: cgo for the target needs the
 toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a44f9242c960dcb114f60674043c8044c71c2c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/go/go.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index aa5d7f97b5..1cb3fb40ee 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -90,6 +90,7 @@ HOST_GO_TARGET_ENV = \
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
