Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC8FC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 03:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B9E3607E3;
	Wed,  1 May 2024 03:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhE0E79MvAl3; Wed,  1 May 2024 03:33:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32450605BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32450605BA;
	Wed,  1 May 2024 03:33:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D9341BF870
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 03:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57EF881ABA
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 03:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIfVgN3NunlC for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 03:33:39 +0000 (UTC)
X-Greylist: delayed 2390 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 01 May 2024 03:33:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78588819FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78588819FC
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN> 
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78588819FC
 for <buildroot@buildroot.org>; Wed,  1 May 2024 03:33:36 +0000 (UTC)
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
 by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1s205s-0000000HDnV-2Y8k; Wed, 01 May 2024 02:53:23 +0000
Message-ID: <f6398ca5-a3b5-48a2-ade8-d31b363ca937@infradead.org>
Date: Wed, 1 May 2024 11:53:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Geoff Levand <geoff@infradead.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org, 
 Peter Korsgaard <peter@korsgaard.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=BNdR6/a7cWc+ity/GNpxX25Rn6CZ4t0VL85wWa03QCk=; b=LW81x573HZzmRPjAmsqJ79/eno
 wzhE6++zhh3s1ynQYXS1QmtUSRc17M+AoHrCTrYCGo0BeKX15/qICbVHuTlkpuxdPd9fmB5vUqc6C
 hXOCF+cCycE/Vu5hUv7UFzgXeNfIW834QbhI9kgqw1jrPQR/N9oofG0T/F3v5NNM52et9b1goCfrC
 l6rt0dDB9fyyS7B8ywXoQtq+zUJmm7v+h0CHt5MeptnkxLrwEHHUDrVB6rEtnr6F+mvBO02KwMV+l
 FJ266UCdVCgTwxdulYyXqCX+h04aWo5DhfN82QqGfmfrk+bf035qqtnDbI+/D7FYigVaupBBf5tEd
 ZJJ4ae7w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=infradead.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=desiato.20200630 header.b=LW81x573
Subject: [Buildroot] [PATCH] package/flannel: Bump to version 0.25.1
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
index 2e0198debe..97700d37ec 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  98dde4eda016fec9aa6394cb4b283bdd972deda6ef9e1f2c3669dd2719ea1fe9  flannel-0.24.4.tar.gz
+sha256  c0de130efa2b14bc0f057a17df07bfd61154b30ce4a5eca24594c5b533ce661d  flannel-0.25.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index 5cdfa0e09e..aa24644764 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLANNEL_VERSION = 0.24.4
+FLANNEL_VERSION = 0.25.1
 FLANNEL_SITE = $(call github,flannel-io,flannel,v$(FLANNEL_VERSION))
 
 FLANNEL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
