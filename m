Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F09C77B73
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 19:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82DA260C00;
	Sun, 16 Apr 2023 19:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82DA260C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9rrcaGSIRhuV; Sun, 16 Apr 2023 19:58:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8C2C60BBD;
	Sun, 16 Apr 2023 19:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8C2C60BBD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E42421BF425
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 19:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7A574016B
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 19:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7A574016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LsTgcioOcoEu for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 19:58:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F01A640112
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 19:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F01A640112
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D803E84308; Sun, 16 Apr 2023 19:58:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Apr 2023 21:56:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c73f93218c293cd7a2245763c63d02910de88b8
X-Git-Newrev: c6bb759e2cb14ebaf2603e69652c44d337a39c72
X-Patchwork-Hint: ignore
Message-Id: <20230416195805.D803E84308@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-golang.mk: add osusergo and
 netgo tags in static builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6bb759e2cb14ebaf2603e69652c44d337a39c72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CGO (the Go language C bindings) normally links dynamically with the C
libraries. It seems that passing -extldflags=-static is not sufficient
to make sure they link statically. As a result, a build using CGO will
fail with

runtime.gcdata: missing Go type information for global symbol .dynsym: size 72

There are two modules in the standard Go library that can use CGO:
os/user and net. Both of these have pure Go versions, however, which can
be selected with the osusergo and netgo tags. Since these two are
standard library modules that get used in almost all Go programs, pass
those flags in the common infrastructure.

It's not entirely clear if this is always the case or only depending on
the specific way CGO is used. In the former case, we could instead
disable CGO globally if static libs are enabled. However, it turns out
that this doesn't solve the problem completely anyway (delve still fails
to link, with different errors). Also, it is possible that other cgo
modules do still work. Therefore, just stick to adding the osusergo and
netgo tags.

Cf. Statically compiling Go programs [0]

Fixes:
 - crucible:
   http://autobuild.buildroot.net/results/c2f/c2f29f55b461899e8e15c0494578304e6f74bf51/
 - containerd:
   http://autobuild.buildroot.net/results/699/69910fc6b9f474a7eb0ca7ffa27ac5512cc1bb37/
 - delve:
   http://autobuild.buildroot.net/results/552/55225d5da17e85271943f7adce6f07d014d9717d/
 - probably others...

[0] https://www.arp242.net/static-go.html

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-golang.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index da9c9a21ac..7ba82284f3 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -102,6 +102,7 @@ ifeq ($(4),target)
 
 ifeq ($(BR2_STATIC_LIBS),y)
 $(2)_LDFLAGS += -extldflags '-static'
+$(2)_TAGS += osusergo netgo
 endif
 
 # Build package for target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
