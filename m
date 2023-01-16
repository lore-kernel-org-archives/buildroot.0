Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D50C54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 10:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FD7640134;
	Mon, 16 Jan 2023 10:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FD7640134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9AtNLyIe75i5; Mon, 16 Jan 2023 10:58:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CAF9400F1;
	Mon, 16 Jan 2023 10:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CAF9400F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 398971BF404
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 10:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12006606C0
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 10:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12006606C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tcBfeyCk_4kb for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 10:58:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E96C96066D
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E96C96066D
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 10:58:31 +0000 (UTC)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id ED1A2CE732
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 10:52:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 61FBD100007;
 Mon, 16 Jan 2023 10:52:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1pHN66-007w1S-O1; Mon, 16 Jan 2023 11:52:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 11:50:31 +0100
Message-Id: <20230116105032.1890904-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/go: set GOCACHE for download
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
Cc: Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
