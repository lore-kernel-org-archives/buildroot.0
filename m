Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC38CCFA13
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 22:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 031DF6F649;
	Thu, 30 Apr 2026 22:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SD3WtlGcRvWC; Thu, 30 Apr 2026 22:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02DC86F644
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777587150;
	bh=JbPUEL+DorqY5gMcqoEy8tt3B9vEvdlOh0Gnvuh+jWw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ga4bfRrb3jpjoU2NvCcnRNoZd6DKTxvsBq5MivMgmIzVK7KFrWfxK8xLrHr0hvek6
	 eh9cIklqOQZDtjI19vdNykzmkQyhP1H58Z14f8OW2H9XJbE4b9n419+dLuq5sKWkLG
	 PZcK9rJ51p9a2bVgOQ68aqe7OuMl0fn1cROFwD9mE4FOs6c5jn3aom0BppLHDg9rIw
	 HaRJ9gIMLctqsXQHvODB80yHoYyZlcXG9d0/E4l0LlFyjOy6Qxv3oX/f+GTMIhtwJZ
	 +C6NktnTGrIYRBOJjfJQAOPX7u0t2JjJd9CZHv+vbNbfSNc2Dc1cPNTnCaklnj0ZMG
	 bhg5aMUDlSi8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02DC86F644;
	Thu, 30 Apr 2026 22:12:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2597192
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 22:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9465841EEC
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 22:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JW-mPDtVkYSb for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 22:12:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA89141EE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA89141EE0
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA89141EE0
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 22:12:27 +0000 (UTC)
Received: from [10.42.0.16] (ip-109-42-51-131.web.vodafone.de [109.42.51.131])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 82F762C80C0F;
 Fri, 01 May 2026 00:12:24 +0200 (CEST)
Message-ID: <31305309-1ebd-4021-b287-75222f8ab886@bubu1.eu>
Date: Fri, 1 May 2026 00:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>
References: <20260425085657.474422-1-fiona.klute@gmx.de>
 <20260425085657.474422-6-fiona.klute@gmx.de>
 <87be7e74-d1d7-4116-890b-7ae7d6557017@bubu1.eu>
 <80008ff3-a0f5-421d-8a34-be66fc65beb7@gmx.de>
Content-Language: en-US
In-Reply-To: <80008ff3-a0f5-421d-8a34-be66fc65beb7@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777587144; bh=fwUhMqAlDiIg0QPOuQg/OFwJCO/8DyCJKsj1hSwy+Mc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=IDMbYJiS06ymVyGCIAVgCxntDOrKjgC0bVFa64W4yoXQrH53IDJgd/UPlm6NW7kC3
 oCI6VxUrr7BnRqd3U1fVQMwW3Fbgs9yeTIyQkzLKwsqcfryu77G7fy9+Bb2lpmB/dE
 WiToeMfUAYMuVisHq0pYU3cbmfCVd3BHhQ4+Rlb88IMzzwOd+909iWWyx/6IfXP1lo
 sZNDnT51YLrn593uV6zYDx/BoDW246RmIBxsWcqsAne7I+aFOIpIBwD7k3JHlLIpd1
 +VO0XdgUf/7nF57NK4gJ6r4Co8yqKD4O1gsnUV1TLMWpzAMYBzOyGVpVOcabx9vVUm
 BZTU5RNY2AucA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=IDMbYJiS
Subject: Re: [Buildroot] [PATCH 5/5] package/kmod: enable dlopen() for
 compression libraries (if any)
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

On 4/30/26 15:57, Fiona Klute via buildroot wrote:
> Hi Marcus!
> 
> Am 30.04.26 um 14:41 schrieb Marcus Hoffmann:
>> Hi Fiona,
>>
[...]
>>
>> I don't think this is covered as part of the existing kmod test, right?
>> Could we add a test covering loading compressed modules without too 
>> much effort? There's probably a lot of possible variations here 
>> (kernel can load compressed modules on it's own, or not, and the 
>> various compression algorithms) but maybe some base functionality that 
>> this still works with this change can be covered by a test?
> 
> The test already builds its own kernel, so I suppose we could extend the 
> kernel config to enable CONFIG_MODULE_COMPRESS=y, 
> CONFIG_MODULE_COMPRESS_ALL=y but leave CONFIG_MODULE_DECOMPRESS=n (so 
> kernel modules are compressed during build, but the kernel does not 
> support decompression). That way kmod would have to handle decompression 
> for the test to pass (might need enabling the right library package, too).
> 
> What do you think of that?

Sounds good!

> 
> Best regards,
> Fiona
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
