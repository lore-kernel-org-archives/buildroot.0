Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F759C54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 20:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FA8540362;
	Mon, 16 Jan 2023 20:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FA8540362
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nJQ58EfQjhsU; Mon, 16 Jan 2023 20:25:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 216F340352;
	Mon, 16 Jan 2023 20:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 216F340352
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A65B1BF956
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14EA440352
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14EA440352
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 153buQdhzxd2 for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 20:25:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23B8740341
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 20:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23B8740341
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 106E687BD1; Mon, 16 Jan 2023 20:25:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 21:24:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aac8ce4999c3c2e105347fd247ba65304ab0d26a
X-Git-Newrev: 07a745e55d76616802a20dcbfd72dfe6fe8e3b05
X-Patchwork-Hint: ignore
Message-Id: <20230116202538.106E687BD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: set GOCACHE for download
 post-process
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

commit: https://git.buildroot.net/buildroot/commit/?id=07a745e55d76616802a20dcbfd72dfe6fe8e3b05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
