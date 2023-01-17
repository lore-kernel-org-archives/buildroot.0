Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B694C3DA78
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 09:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC8C8404AA;
	Tue, 17 Jan 2023 09:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC8C8404AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a3QWx3YnBZdY; Tue, 17 Jan 2023 09:41:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 152FE402A7;
	Tue, 17 Jan 2023 09:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 152FE402A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E1E31BF2B1
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7D3C40414
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7D3C40414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bqimy-4TKE0W for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33F20403F9
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33F20403F9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20E8087C3E; Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Jan 2023 10:24:15 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: e227c45200d9ecd996754b7bc4508cc2c4921068
X-Git-Newrev: 5b151fae52ee33e43e2415f1b66c05015e2d1d9e
X-Patchwork-Hint: ignore
Message-Id: <20230117094050.20E8087C3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/go: set GOCACHE
 for download post-process
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b151fae52ee33e43e2415f1b66c05015e2d1d9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

The go mod vendor call in support/download/go-post-process accesses the go
cache, so pass GOCACHE= in the environment to ensure our cache directory is
used.

The go cache defaults to ~/.cache/go-build if not set, so this fixes builds
where that location (or GOCACHE if set in the environment) is not writable:

rm -rf ~/.cache/go-build
chmod -w ~/.cache
make docker-compose-source
..
failed to initialize build cache at /home/peko/.cache/go-build: mkdir /home/peko/.cache/go-build: permission denied
make[1]: *** [package/pkg-generic.mk:189: /home/peko/source/buildroot/output/build/docker-compose-2.14.0/.stamp_downloaded] Error 1

We use two different cache directories for target and host builds, but the
download/vendoring should be independent of the architecture, so use the
target variant even for host-only packages for simplicity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 07a745e55d76616802a20dcbfd72dfe6fe8e3b05)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index d3ed07f03b..c4f72d403c 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -25,6 +25,7 @@ HOST_GO_COMMON_ENV = \
 	GOFLAGS=-mod=vendor \
 	GOROOT="$(HOST_GO_ROOT)" \
 	GOPATH="$(HOST_GO_GOPATH)" \
+	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
 	GOPROXY=off \
 	PATH=$(BR_PATH) \
 	GOBIN= \
@@ -75,7 +76,6 @@ HOST_GO_TARGET_ENV = \
 	$(HOST_GO_COMMON_ENV) \
 	GOOS="linux" \
 	GOARCH=$(GO_GOARCH) \
-	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
 	CGO_CFLAGS="$(TARGET_CFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
