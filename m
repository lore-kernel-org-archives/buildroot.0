Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289B8C3ABA0
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 15:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C644240136;
	Sun, 15 Sep 2024 15:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GV9zpT_1Pw0C; Sun, 15 Sep 2024 15:26:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8920940447
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8920940447;
	Sun, 15 Sep 2024 15:26:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CC411BF239
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 15:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1968380B67
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 15:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 595YsOrleqU5 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 15:26:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB25580B5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB25580B5C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB25580B5C
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 15:26:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0249240002;
 Sun, 15 Sep 2024 15:26:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1spr90-005lfH-04;
 Sun, 15 Sep 2024 17:26:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 17:26:32 +0200
Message-Id: <20240915152632.1374847-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] docs/manual/manual.adoc: unbreak BR2_VERSION
 logic
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The behaviour of asciidoc on my laptop (Debian 10.2.0-1) changed at the end
of last year, causing the BR2_VERSION logic to no longer work:

grep 'manual generated' buildroot-2023.02.*/docs/manual/manual.text
buildroot-2023.02.6/docs/manual/manual.text:Buildroot 2023.02.6 manual generated on 2023-10-16 08:41:26 UTC from
buildroot-2023.02.7/docs/manual/manual.text:Buildroot ${BR2_VERSION%%-git*} manual generated on 2023-11-14
buildroot-2023.02.8/docs/manual/manual.text:Buildroot ${BR2_VERSION%%-git*} manual generated on 2023-12-04

We don't really NEED to strip the -git suffix, so just drop that to unbreak
the version output.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/manual.adoc b/docs/manual/manual.adoc
index 31d5f80bae..cfcc3e52a9 100644
--- a/docs/manual/manual.adoc
+++ b/docs/manual/manual.adoc
@@ -4,7 +4,7 @@
 = The Buildroot user manual
 :toc:
 
-Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on {localdate}
+Buildroot {sys:echo $BR2_VERSION} manual generated on {localdate}
 {localtime} from git revision {sys:git rev-parse --short HEAD}
 
 The Buildroot manual is written by the Buildroot developers.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
