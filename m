Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013EFC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 05:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 909F2607EB;
	Sun, 14 Jul 2024 05:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TW-lZPjRwFRs; Sun, 14 Jul 2024 05:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41ABA606C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41ABA606C4;
	Sun, 14 Jul 2024 05:37:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C5231BF57B
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 05:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A30E81E1F
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 05:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pbsJMXsuF0fz for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 05:37:54 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org; envelope-from=geoff@infradead.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C05081E08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C05081E08
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C05081E08
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 05:37:52 +0000 (UTC)
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sSrve-0000000EFnv-2lmK; Sun, 14 Jul 2024 05:37:47 +0000
Message-ID: <5809d7c9-8cd2-4eb1-8227-901e6722a068@infradead.org>
Date: Sun, 14 Jul 2024 14:37:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Geoff Levand <geoff@infradead.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Peter Korsgaard <peter@korsgaard.com>, Arnout Vandecappelle
 <arnout@mind.be>, buildroot@buildroot.org
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=kckPKw7h+hL9nvv4tssPro05vGwKhgMiIa3T4KzwmHU=; b=kaxOC7+VkkdOVs3ykOfv6zwjAi
 l2dCos3+CjKDzg6o8OxG+vSG65eo4ELJq/l7C718N4qQm2BY5rwGpZ2QPbq+KMaJWcFF+sOYpcczT
 reFvp6oxfYeDIbR/pJ8UNyaC0UftbAOKqBDBMk+3EBaedW5vGX8ZfSjyDDBCpxy3fMEd3NcBf2Zq7
 IlVSpBgNOAqtrqbxJEtbwPgx7CkS80oRWqkqj9PXWg2I5PEm66ok1d5cRXYv92GKIeezrNH/+Wcxz
 7eKCZfCc6vJYVXGCRt1FFAGFIGUeUGsZUzP4AYDLAmwo5SNkbVAWkafiET5ctreamRGp5RWl/cHcw
 BvrMWe9g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=infradead.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=kaxOC7+V
Subject: [Buildroot] package/flannel: Bump to version 0.25.4
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

diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
index b3caf907db..85bc184368 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  73c832ab860ceae15d6f890fae7c71e265af4825f885b5c367a91bd884eb2c09  flannel-0.25.3-go2.tar.gz
+sha256  e4946abe7212d0a3f89f64ff9d4310dd21fafa782d7e5c1c7d44ea264ab25d5c  flannel-0.25.4-go2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index ffbfad888f..5231d41de8 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLANNEL_VERSION = 0.25.3
+FLANNEL_VERSION = 0.25.4
 FLANNEL_SITE = $(call github,flannel-io,flannel,v$(FLANNEL_VERSION))
 
 FLANNEL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
