Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717F2E83823
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 19:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBD3B81DF1;
	Mon, 16 Feb 2026 19:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WaSLPguEEcDR; Mon, 16 Feb 2026 19:05:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A01581BF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771268704;
	bh=KVoa+lS+QyyDYax1/6nOVRcEpo6L/I2bdoIkjbm6ws4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X4oSRto3FZFqEoEvKi3Bhr2Tuh3KA0hx+YhU2xi7mTIFosp6QRVtkIeSXyjlUmCG4
	 SWeDOxIzcuE9y+yAepsOXC9TCWlZTjvIEZJZIfy6ZEY9KxZisbCoDNRux9UGvY3HXm
	 VCySJrKsUchEf7KbBnJYCKZRvd2jXEtl5b1oGGuzCzKnto69vAuPGQxuoKYIjlw//c
	 shj4LxumGgvNxGixrHkFQuT1Mc2A1YCZMXaJiXVXf2JvVOHBuyUeYEpc7pyav4tt1M
	 LFqyoisRXngrhkeAZ5x/lOpoyOkm6s0urLLADjNorIk4gta+1WwvePFr+JgoMWPnie
	 KHhCi5B5bnWaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A01581BF4;
	Mon, 16 Feb 2026 19:05:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A3CC270
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0776B60BB9
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbAc1ZFKUo_1 for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 19:05:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6FBDF60A35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FBDF60A35
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FBDF60A35
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:04:59 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -258559993; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 16 Feb 2026 19:04:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vs3tu-0000000AoVk-3NjM;
 Mon, 16 Feb 2026 20:04:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Martin Bachmann via buildroot <buildroot@buildroot.org>
Cc: Martin Bachmann <martin.bachmann@designwerk.com>,  Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <ZR0P278MB0869C77817F0EDA8220929F88B6CA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
 (Martin Bachmann via buildroot's message of "Mon, 16 Feb 2026 08:27:34
 +0000")
References: <ZR0P278MB0869C77817F0EDA8220929F88B6CA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
Date: Mon, 16 Feb 2026 20:04:54 +0100
Message-ID: <87o6loldbd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=fb+8LYjEBFQMYVJzKrHAeGpo5sCwKHwISmNEpDZmH1fS8osiBRXgXch0rklKaBKzyurT7EMn4HJ98t0jdB6LJ2d/xXEbt1N9Wyg2BdjarHs4wVtjznF0aLj69Jsy7cu22dzzXbTiSdyrXxVlryRFiWyOSGyy6i00LvNIDO8Sk69m0jbQS7rgksLzEqOPtVg3Fj2My0tA+VMQXIjsMptfgdl1ks+yNBfiMM1EirISJJWovjIsA4OfwqSuSQzey9F/c8g5HkIg0X+Y6NT4d+/eTtM7z/d+xFEvYjR5JBpX5k0ry2h5u0u00yOV3CaY2PxuErSYXl0q78THycIpC70X1w==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=VgU61upduj7IGwTKDh3kiOvIITWQ+8bhhT7Oc9wE+V0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=fb+8LYjE
Subject: Re: [Buildroot] [PATCH 1/1] Fixing typo,
 which prevents automated license parsing
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

>>>>> "Martin" == Martin Bachmann via buildroot <buildroot@buildroot.org> writes:

 > From bbb70ffb0e33022ab02c69cc220f28268a5a1b4f Mon Sep 17 00:00:00 2001
 > From: Martin Bachmann <martin.bachmann@designwerk.com>
 > Date: Fri, 6 Feb 2026 15:44:10 +0100
 > Subject: [PATCH 1/1] Fixing typo, which prevents automated license parsing

Thanks. Your mailer had corrupted the patch (tabs->spaces) and the
summary line should be something like:

package/util-linux: correct missing comma in license info

Committed after fixing that, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
