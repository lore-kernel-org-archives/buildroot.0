Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3DCC67871
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 20:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DF85403BE;
	Mon, 16 Jan 2023 20:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DF85403BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bj2SGqczrqQE; Mon, 16 Jan 2023 20:25:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E4A840B8D;
	Mon, 16 Jan 2023 20:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E4A840B8D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 058D71BF3C6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5A54405AC
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5A54405AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2f630YYsrOT for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 20:25:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DB31403BE
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 20:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DB31403BE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B99E87BD2; Mon, 16 Jan 2023 20:25:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 21:24:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07a745e55d76616802a20dcbfd72dfe6fe8e3b05
X-Git-Newrev: 162f656884185662d85e5366871284adca87a465
X-Patchwork-Hint: ignore
Message-Id: <20230116202538.1B99E87BD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: explicitly set GOMODCACHE
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
