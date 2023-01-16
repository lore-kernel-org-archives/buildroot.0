Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822A3C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3411E83841;
	Mon, 20 Feb 2023 23:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3411E83841
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9pyn87WzQGS9; Mon, 20 Feb 2023 23:26:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C11A8385D;
	Mon, 20 Feb 2023 23:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C11A8385D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5303D1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C5CE41594
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C5CE41594
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D4tFbs9EQQpJ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AFF441745
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AFF441745
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6888E81979; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 21:24:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 07a745e55d76616802a20dcbfd72dfe6fe8e3b05
X-Git-Newrev: 162f656884185662d85e5366871284adca87a465
X-Patchwork-Hint: ignore
Message-Id: <20230220205236.6888E81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/go: explicitly set
 GOMODCACHE
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

commit: https://git.buildroot.net/buildroot/commit/?id=162f656884185662d85e5366871284adca87a465
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

go mod vendor caches downloaded modules to the Go module cache, which
defaults to $GOPATH/pkg/mod - But can be overridden with the GOMODCACHE
environment variable:

https://go.dev/ref/mod#module-cache

So explicitly set GOMODCACHE= for reproducibility.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/go/go.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index c4f72d403c..c38ae0b99c 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -26,6 +26,7 @@ HOST_GO_COMMON_ENV = \
 	GOROOT="$(HOST_GO_ROOT)" \
 	GOPATH="$(HOST_GO_GOPATH)" \
 	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
+	GOMODCACHE="$(HOST_GO_GOPATH)/pkg/mod" \
 	GOPROXY=off \
 	PATH=$(BR_PATH) \
 	GOBIN= \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
