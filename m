Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC93C63797
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 09:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28F9A40198;
	Tue, 17 Jan 2023 09:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28F9A40198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rGz7fQ6Eg3rK; Tue, 17 Jan 2023 09:35:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6325940364;
	Tue, 17 Jan 2023 09:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6325940364
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D20301BF2B1
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4713D400BF
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4713D400BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m4JuaznKdhmp for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 09:34:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65DA440A6E
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 09:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65DA440A6E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55ECA87C18; Tue, 17 Jan 2023 09:34:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Jan 2023 10:24:36 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b007397e809ee9742196e2caf6c8c32ccb403dbc
X-Git-Newrev: a6a0b2c08fc08b634509c44f131807c4e675d21a
X-Patchwork-Hint: ignore
Message-Id: <20230117093419.55ECA87C18@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/go: explicitly
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6a0b2c08fc08b634509c44f131807c4e675d21a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index 5de043100d..84c6582afd 100644
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
