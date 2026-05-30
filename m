Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209FACD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 806C3853E7;
	Sat, 30 May 2026 17:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iM_j5tuQskfk; Sat, 30 May 2026 17:36:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 508E2853DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780162561;
	bh=2EXQYv9+5TB90STn68USuRuTRRHNqcfgERameUEwqos=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iJSTzJ89lMW5hCcNVN0k6BYb5GWVqok/0JF2Sd+sSLolscYxzzEUyEtxSoggs5v6K
	 1e9w5eeKxj+2GPV/4p0gBBOf9t9F2FGZvrm49nQZz8qmDhgFATogzoBcX6Qo8emH8r
	 WKjezZap04nsyQPOr4RHVasbmuQqLnBQlbCHl40ggYWdtCPuarQUviff9MYdP2n0RY
	 1zlhfxajRbGWzX3/xYunlPWXdMWzGvt8gzNKIrTcK9iL6ldkrBI84AvW3uhbiuv+4n
	 3ZIXtE7AW4gE0XfyO2hwM4aJpPUF4C7oHrWOBkFFO35++503yJYnj6R6n1J1GWrbZq
	 xvo3/5NNMlr4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 508E2853DC;
	Sat, 30 May 2026 17:36:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9EC6F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB4AC42F2A
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nRDW6PDAsOeE for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:35:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8773C42F27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8773C42F27
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8773C42F27
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:35:57 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1683215954; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 17:35:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTNbG-00000005R01-0Brs;
 Sat, 30 May 2026 19:35:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
In-Reply-To: <ebbf4fe0-222f-4408-88ae-8ef86af91e96@rnout.be> (Arnout
 Vandecappelle via buildroot's message of "Sat, 30 May 2026 16:46:28
 +0200")
References: <20260326101033.587997-1-heiko@sntech.de>
 <e41342fb-6354-4ced-a000-ceef2b6ac577@cherry.de>
 <ebbf4fe0-222f-4408-88ae-8ef86af91e96@rnout.be>
Date: Sat, 30 May 2026 19:35:54 +0200
Message-ID: <8733z8ls05.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=V4KgWWqOIsGRD7qi7zIm4ioTtIDQiLTIPULCzMTZLwLeHDMX6fcOb4xEtOsNCTtatwsWvCwVu+WFUDQTT+w0LUhqgN6cuTw99q4Aw9l0vZfvoo4eeTuA3KDa1DeO/WLfCR35dtth1Yan+8lsPq8UqjqvsRGJuAObWTP/TbLkUTMUYksN9gtgYx2CM4Cu24QzMS1mJvJW2vmK9ePDPdUkWnrQmiGrMzmVAcV1AR53+sO9MQao0Lp2OHPVFikxTAnZ6Tvsd7+WoP6LlfU6focUAtJDlPG+HnW0vbMxD6flj20fShAXIdu05zl+oQyzuxvaUMe3rBe1ErXSBfTXSVNA+w==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Tsmupy/QBsg/43X3gvmIDnD9myLEO78GPkcj8TNmjpQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=V4KgWWqO
Subject: Re: [Buildroot] [PATCH v2] package/arm-trusted-firmware: add
 ARM_TRUSTED_FIRMWARE_CPE_ID_*
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
Cc: Heiko Stuebner <heiko.stuebner@cherry.de>,
 Quentin Schulz <quentin.schulz@cherry.de>, Heiko Stuebner <heiko@sntech.de>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

Hi,

 >  Oh, but I notice now that it's using subst, not patsubst, so it
 >  doesn't just remove a prefix. Care to fix that, someone?

I've sent a fix for that here:

https://patchwork.ozlabs.org/project/buildroot/patch/20260530173352.1294980-1-peter@korsgaard.com/

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
