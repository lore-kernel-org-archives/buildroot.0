Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFE1C46467
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 10:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D51528138C;
	Mon, 16 Jan 2023 10:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D51528138C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHhtoCH8oh64; Mon, 16 Jan 2023 10:52:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 266278139C;
	Mon, 16 Jan 2023 10:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 266278139C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FB021BF404
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 10:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3518C400F1
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 10:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3518C400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OzKEhTcS3K8Q for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 10:52:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03C30400AC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03C30400AC
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 10:52:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 34DD860004;
 Mon, 16 Jan 2023 10:52:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1pHN67-007w1W-Gt; Mon, 16 Jan 2023 11:52:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 11:50:32 +0100
Message-Id: <20230116105032.1890904-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230116105032.1890904-1-peter@korsgaard.com>
References: <20230116105032.1890904-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/go: explicitly set GOMODCACHE
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

go mod vendor caches downloaded modules to the Go module cache, which
defaults to $GOPATH/pkg/mod - But can be overridden with the GOMODCACHE
environment variable:

https://go.dev/ref/mod#module-cache

So explicitly set GOMODCACHE= for reproducibility.

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
