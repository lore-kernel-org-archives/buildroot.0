Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BECAC77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 10:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33F7840B6F;
	Sun, 23 Apr 2023 10:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33F7840B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MW2koa9ckyg4; Sun, 23 Apr 2023 10:33:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D80140BCB;
	Sun, 23 Apr 2023 10:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D80140BCB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A8121C2B5C
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E64440B23
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E64440B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mtjzYfTuzIpL for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 10:33:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 302A040AB1
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 10:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 302A040AB1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19E36843EA; Sun, 23 Apr 2023 10:33:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 12:32:10 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 6cee24af5316dd1104cc2a8198fdbddafeaa60d1
X-Git-Newrev: 95741c08f1d635a68c5f555f97e2c751fde629b5
X-Patchwork-Hint: ignore
Message-Id: <20230423103322.19E36843EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/pkg-golang.mk:
 add osusergo and netgo tags in static builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=95741c08f1d635a68c5f555f97e2c751fde629b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit c6bb759e2cb14ebaf2603e69652c44d337a39c72)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
