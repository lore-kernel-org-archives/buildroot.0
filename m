Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14ABC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78626606BA;
	Mon, 25 Mar 2024 22:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODad1qyrQH2l; Mon, 25 Mar 2024 22:59:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 967916082F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 967916082F;
	Mon, 25 Mar 2024 22:59:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48E9B1BF20B
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3631D40130
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orA7UqfjZ_I7 for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:59:45 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org; envelope-from=geoff@infradead.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0FA7E400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FA7E400CE
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FA7E400CE
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:59:45 +0000 (UTC)
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rotI6-0000000HWDe-08YY; Mon, 25 Mar 2024 22:59:42 +0000
Message-ID: <df4231cf-e538-4b19-a004-a815d7494f62@infradead.org>
Date: Tue, 26 Mar 2024 07:59:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Geoff Levand <geoff@infradead.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org, 
 Peter Korsgaard <peter@korsgaard.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=TDomvQco5Tq3fYSUONy+DGZDrikX0Y9+gWYMFs4oogw=; b=wV4h0VtdE0N+do7qYQd2ILnuUR
 93RZSYNAV3SgrVWrS4tTUq9nZN/eOtjE2ZtE06A49LV3tnuu6Fi5cqp4fVHxt+NapyqBtoInzRtvy
 2hq4fZRTPcJv4ahbEYbWoJnfFEbEfKqqkhKKr1N+t06IWpdE5kqVTeXFxBN5N6Brv7M99z9YMCSs9
 /tKBS6BvAGXVtDQfO/IhUtWU9rxSIGoIlEw0848OL6vKWDgZ1vIkXstxrHd5W7diUU1Y05XFCeBQH
 wIqRvLlo0ZQH18/BLVO8iHfbk7Oi1X8nW6nlIzQU0Ro3An/9mC1Y0ib57s+G/7Vhl+g+xz4XUV19o
 3BT4aaRQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=infradead.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=wV4h0Vtd
Subject: [Buildroot] [PATCH] package/flannel: Bump to version 0.24.4
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
index c1ceeed9e8..2e0198debe 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f9e68bc9c5b41ee7f721a754c9fa4eddf3da775faa9e638581a564e33b3fabcf  flannel-0.24.2.tar.gz
+sha256  98dde4eda016fec9aa6394cb4b283bdd972deda6ef9e1f2c3669dd2719ea1fe9  flannel-0.24.4.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index 02e62256cf..5cdfa0e09e 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLANNEL_VERSION = 0.24.2
+FLANNEL_VERSION = 0.24.4
 FLANNEL_SITE = $(call github,flannel-io,flannel,v$(FLANNEL_VERSION))
 
 FLANNEL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
