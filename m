Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AD1EB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 13:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9B1B817E4;
	Wed, 14 Jun 2023 13:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9B1B817E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQFwspnuL26w; Wed, 14 Jun 2023 13:53:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4C30818E8;
	Wed, 14 Jun 2023 13:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4C30818E8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 153DE1BF2BA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19A9F839E0
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19A9F839E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9FInS-Pg79QG for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 13:52:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34849839DC
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 13:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34849839DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DB69836BE; Wed, 14 Jun 2023 13:52:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 15:49:40 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 457cc3325859afad28f761dc30281e916157a536
X-Git-Newrev: f13dcd6c651df81f241b74e42c64588d6db2a862
X-Patchwork-Hint: ignore
Message-Id: <20230614135235.1DB69836BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/go: security bump
 to version 1.9.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=f13dcd6c651df81f241b74e42c64588d6db2a862
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes the following security issues:

- cmd/go: cgo code injection

  The go command may generate unexpected code at build time when using cgo.
  This may result in unexpected behavior when running a go program which
  uses cgo.

  This may occur when running an untrusted module which contains directories
  with newline characters in their names.  Modules which are retrieved using
  the go command, i.e.  via "go get", are not affected (modules retrieved
  using GOPATH-mode, i.e.  GO111MODULE=off, may be affected).

  Thanks to Juho Nurminen of Mattermost for reporting this issue.

  This is CVE-2023-29402 and Go issue https://go.dev/issue/60167.

- runtime: unexpected behavior of setuid/setgid binaries

  The Go runtime didn't act any differently when a binary had the
  setuid/setgid bit set.  On Unix platforms, if a setuid/setgid binary was
  executed with standard I/O file descriptors closed, opening any files
  could result in unexpected content being read/written with elevated
  prilieges.  Similarly if a setuid/setgid program was terminated, either
  via panic or signal, it could leak the contents of its registers.

  Thanks to Vincent Dehors from Synacktiv for reporting this issue.

  This is CVE-2023-29403 and Go issue https://go.dev/issue/60272.

- cmd/go: improper sanitization of LDFLAGS

  The go command may execute arbitrary code at build time when using cgo.
  This may occur when running "go get" on a malicious module, or when
  running any other command which builds untrusted code.  This is can by
  triggered by linker flags, specified via a "#cgo LDFLAGS" directive.

  Thanks to Juho Nurminen of Mattermost for reporting this issue.

  This is CVE-2023-29404 and CVE-2023-29405 and Go issues
  https://go.dev/issue/60305 and https://go.dev/issue/60306.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 620ce32227b0722c9c68c5d0cd42d8600a18ca6b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index ffe42bf395..874737ea2d 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  131190a4697a70c5b1d232df5d3f55a3f9ec0e78e40516196ffb3f09ae6a5744  go1.19.9.src.tar.gz
+sha256  13755bcce529747d5f2930dee034730c86d02bd3e521ab3e2bbede548d3b953f  go1.19.10.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 89c3577982..545d2117b7 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.9
+GO_VERSION = 1.19.10
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
