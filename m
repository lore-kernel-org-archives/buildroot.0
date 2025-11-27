Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1784ACFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 07:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAEEE60BC9;
	Thu, 27 Nov 2025 07:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CeI7Ay4tu8rp; Thu, 27 Nov 2025 07:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 143B160BA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 143B160BA4;
	Thu, 27 Nov 2025 07:32:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 379B3DE
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 07:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 299C460B25
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 07:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYRk6ej9CBnM for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 07:31:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BAB8260B21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAB8260B21
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAB8260B21
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 07:31:56 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2124336179; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Nov 2025 07:31:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vOWTo-0000000C9Z9-0dk5;
 Thu, 27 Nov 2025 08:31:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20251126202307.1269790-2-neal.frager@amd.com> (Neal Frager's
 message of "Wed, 26 Nov 2025 20:23:06 +0000")
References: <20251126202307.1269790-1-neal.frager@amd.com>
 <20251126202307.1269790-2-neal.frager@amd.com>
Date: Thu, 27 Nov 2025 08:31:52 +0100
Message-ID: <87wm3cexsn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=bpOP3RiJb7aZSFvocghHvOK07mrySVrpjq9nI6+2t2APAX5GQ63sQQDdS1QhB7jc4kNR+2N4Bpcns5ZXlclqmy5NgXEmeQLh1iUMd/52+fwXuDZHLLt0IVQmvt+EC8JsFXHol8SdRDblveP5mLqB9HZz28a6aH0/dOHzH1yp5rAESexEouvmjG07C4SqadxXj7Xs0tuCrES9mQqlxvN/60ffpOw0910ixI75iPvkQqtMxMPB93+hbezc9Wef63dNd0PR/9Pd4nDqI2dnYWBRkxCmJxkDQaqWxhgC6JyDaA4XJ6Hg7e5qbFrM5kng2KLtKjm6pbnf1M/QuByG71tqGA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=xLwrmUpMJJHjM/jsSrZZD9qrndSXe/TP+dxRHQ5aaMA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=bpOP3RiJ
Subject: Re: [Buildroot] [PATCH v1 2/3] boot/xilinx-embeddedsw: bump default
 to xilinx_v2025.2
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
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, buildroot@buildroot.org, brandon.maier@collins.com,
 ju.o@free.fr, thomas.petazzoni@bootlin.com, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > Now that all Xilinx board configs have been bumped to xilinx_v2025.2, bump the
 > default version of xilinx-embeddedsw to xilinx_v2025.2.

 > Signed-off-by: Neal Frager <neal.frager@amd.com>
 > ---
 > To be applied to next branch

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
