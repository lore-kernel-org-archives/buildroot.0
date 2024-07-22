Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9295AC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CD9B408C3;
	Mon, 22 Jul 2024 12:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxU5md-Vm24E; Mon, 22 Jul 2024 12:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2448E4090F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2448E4090F;
	Mon, 22 Jul 2024 12:16:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B48951BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A15E080CAE
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5-Ow-pQBEhA for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:16:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F34B680C03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F34B680C03
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F34B680C03
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:16:04 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 3945F2C86617;
 Mon, 22 Jul 2024 14:16:02 +0200 (CEST)
Message-ID: <d6a8b81d-b320-4e13-b28d-db027f80b552@bubu1.eu>
Date: Mon, 22 Jul 2024 14:16:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240721173831.2350206-1-fontaine.fabrice@gmail.com>
 <20240722141443.28d48442@windsurf>
Content-Language: en-US
In-Reply-To: <20240722141443.28d48442@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1721650562; bh=gBZZRVSFLNutjitVpij2vZNEBQUtEM3PQlYxEs7DLis=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=dTnOnvu+mO904J38q9y6tgHT9HnQKyst1QbFTQb953Udo6Le+BHi32Tp+y97NnfaH
 gGVHB8H3Y+UXlG/B1RcUQRNOzuB5uTk0teD27e+7mTn8gobPzUetIyzCokBKyA59vA
 hLeUsPGg9SphNNEAKbWSOZkUlZuQzmScYjNuFKSdqABIHGui3BYKmomYgHfZ7GvdNC
 D6PjNYCTsEJc51L1iR3Af3vSsBLz1XSadVDoP0cW+g2+qI3icNhWQdmmhUavlt662I
 0Hh0HjulVTsOdMjveRbHPJYKue/IP5Dr7HC850vMys8VtuxFPpW5+Gv1l+1VswryUS
 BLtuMfBjNBx/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=dTnOnvu+
Subject: Re: [Buildroot] [PATCH 1/1] package/picotool: fix libusb
 dependencies
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Marcus Hoffmann <bubu@bubu1.eu>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22.07.24 14:14, Thomas Petazzoni via buildroot wrote:
> On Sun, 21 Jul 2024 19:38:31 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>> libusb dependencies are wrong since the addition of the package in
>> commit f7aac1c008f9c59f8c669bade17864b099221065:
>>   - BR2_HOST_GCC_AT_LEAST_4_9 is used instead of
>>     BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>>   - BR2_TOOLCHAIN_HAS_THREADS is missing
>>
>> Fixes: f7aac1c008f9c59f8c669bade17864b099221065
>>   - http://autobuild.buildroot.org/results/22689afc092e33b6e3c1c7ffea0d0e3b5bf76d99
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>>   package/picotool/Config.in | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> Dammit, how could I have left this get through. Thanks for fixing
> applied!

Thanks Fabrice, Thomas for fixing this. No idea how I got this wrong in 
the first place. :-/

Marcus

> 
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
