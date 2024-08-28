Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C7CC54747
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 01:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B16E181254;
	Wed, 28 Aug 2024 01:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KbeLxnUtM_9r; Wed, 28 Aug 2024 01:08:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58EB881251
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58EB881251;
	Wed, 28 Aug 2024 01:08:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C1E81BF215
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 01:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 074D860676
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 01:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pZnVFCZmHgY for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 01:08:30 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org; envelope-from=geoff@infradead.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D3BAA60622
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3BAA60622
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3BAA60622
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 01:08:26 +0000 (UTC)
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1sj7Aa-0000000HTwd-1Pnc; Wed, 28 Aug 2024 01:08:20 +0000
Message-ID: <8b037972-abe1-47c4-951b-ab3cdb6e0f1c@infradead.org>
Date: Wed, 28 Aug 2024 10:08:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Geoff Levand <geoff@infradead.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=iINxdCMGPlSHoQGI6TTczjGRal03huTf9AWg2HFFUSE=; b=JNamEVUMggAhvSZLt5fMQ+ovyH
 HNid+VxXliQwUNEfRD5f7PkuJ1bC82v0ISOHIfIkaGoqvTZSRILBKb4ZWXnSDIIHL2AQ3wbBPWhPo
 whMIV8nmvA9Ih7xu6r6eh8g1b3Gh++i5HRmScUXny4Lpl2npWceMv1jUHI+aUOR71lQCDxdZt8QTp
 dDv8ijukFplEneAPBwke401+GsJpcUEU1WJK66GoypWfEWGW3Jo1QNu18dD3V85yO56ISoRYQNzPI
 8uakEkGKKBAXtyQNlpIi4ZARFa7FtH2t6Z+sp08wUpZvJok9huA/vjnXZFq1ZJbM7jRpDXjDNslwV
 kMI8NxQw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=infradead.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=JNamEVUM
Subject: [Buildroot] package/flannel: bump to version 0.25.6
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

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/flannel/flannel.hash | 2 +-
 package/flannel/flannel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
index d1f03a9d38..b57ac3f6d6 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e6f312d8a7e635ef707f3811313f045f0f80312d96dfcc722de973ffa2910204  flannel-0.25.5-go2.tar.gz
+sha256  4eea610dbcf26f3e37faa48c347931ba36411421d3adad2b08aff450531563db  flannel-0.25.6-go2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index 7705bdbefe..e09319494a 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLANNEL_VERSION = 0.25.5
+FLANNEL_VERSION = 0.25.6
 FLANNEL_SITE = $(call github,flannel-io,flannel,v$(FLANNEL_VERSION))
 
 FLANNEL_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
