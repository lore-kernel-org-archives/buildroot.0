Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F59E67494
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 02:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AEC9408C0;
	Fri,  1 Nov 2024 02:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1vJRG0p6GmE7; Fri,  1 Nov 2024 02:03:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 320A4408D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 320A4408D5;
	Fri,  1 Nov 2024 02:03:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDA305E4F
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 02:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC4A68114A
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 02:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVYjuZlfEfSq for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 02:03:02 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org; envelope-from=geoff@infradead.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5AA5180E8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AA5180E8E
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AA5180E8E
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 02:02:58 +0000 (UTC)
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1t6h00-0000000FMVg-0miX; Fri, 01 Nov 2024 02:02:53 +0000
Message-ID: <157f9e29-56b6-447e-b304-703095602113@infradead.org>
Date: Fri, 1 Nov 2024 11:02:46 +0900
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
 bh=CKbPo5WFh32wNlHfL/lcozGO6xciyZRCoumxKNUcsBg=; b=WtBmBknm1pGnDd4WJD78NlEfgd
 /sHZ+k2rUWxrI6LTBjOwgTXi8WlJQmhNSGg43O6JmeuM9pInOrLH+GYvD5tMzYU7dZZ/nlm0E6UYz
 bT9wAP78ZH82LRmmlE3a8VWOM/xCpnKnEXMxkj30Q7/fxwjewV2+J+c1bj7fFqmU7M1pAGh4sbKcO
 S3rBoMChNyzIMVfa8ejYfilhflNR4Es+lmU/+EInNupMYo0dh110/4Lc+UbCQrlR4KrfP7oQHbqKg
 hTZoEleKs1cNlMlv1UglcjCqQ+jd9QEwWK0XLOK/U3HSRhQ9txPr3YLSV4kWGgj+GaBtEDzB4qBfS
 TG+0iPjw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=infradead.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=WtBmBknm
Subject: [Buildroot] package/flannel: bump to version 0.26.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
index f18948e55f..10f793462f 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9941bfb958b8583c080d61cf0664207f311f2e2500db2ae5c3413ff2dbdf2195  flannel-0.25.7-go2.tar.gz
+sha256  1b8411bd6d4691be374bdae7f95d814aaaa197f83f56861a274d6264144a8b3d  flannel-0.26.0-go2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index c23c3ae9bd..920705680f 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLANNEL_VERSION = 0.25.7
+FLANNEL_VERSION = 0.26.0
 FLANNEL_SITE = $(call github,flannel-io,flannel,v$(FLANNEL_VERSION))
 
 FLANNEL_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
