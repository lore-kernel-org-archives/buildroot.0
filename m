Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA08C63797
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 09:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82CE9402A7;
	Tue, 17 Jan 2023 09:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82CE9402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VbRmcrpgrGhx; Tue, 17 Jan 2023 09:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACD1340A6E;
	Tue, 17 Jan 2023 09:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACD1340A6E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 412EF1BF95E
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B36A8138B
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B36A8138B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CxF66VVUUkwC for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C8808138F
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C8808138F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D39A87C3B; Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Jan 2023 10:24:23 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 5b151fae52ee33e43e2415f1b66c05015e2d1d9e
X-Git-Newrev: 50952c56ef133730004c9a9af543ed1831ecbcb4
X-Patchwork-Hint: ignore
Message-Id: <20230117094050.2D39A87C3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/go: explicitly
 set GOMODCACHE
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

commit: https://git.buildroot.net/buildroot/commit/?id=50952c56ef133730004c9a9af543ed1831ecbcb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

go mod vendor caches downloaded modules to the Go module cache, which
defaults to $GOPATH/pkg/mod - But can be overridden with the GOMODCACHE
environment variable:

https://go.dev/ref/mod#module-cache

So explicitly set GOMODCACHE= for reproducibility.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 162f656884185662d85e5366871284adca87a465)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
