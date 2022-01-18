Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DA5C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 13:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A85C8193E;
	Tue, 18 Jan 2022 13:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJZS2fZRXddj; Tue, 18 Jan 2022 13:35:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BD268187F;
	Tue, 18 Jan 2022 13:35:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49E4E1BF5A8
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 13:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FD7140620
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 13:35:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f72W-NcHuat7 for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 13:35:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4CFF40124
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 13:35:28 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9odynhE8ZX0z79odynhC6G; Tue, 18 Jan 2022 14:35:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642512926; bh=JlFJJpsWMiLKGnlp5MJCx8lLjquFsMrxlEtQf4QwCAA=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=UStR5WsefddfWz6fAYOEeYYbkKBFrD4GUfNGmhcsX3t5dxWgsFp41YD8FrKwcvh8v
 TpfJ7YOKAJh62pfTaf5DuQ4bqJJ8F11eLClqyo395/uPr0lGPgmIcP8VbOiLLQ+RKA
 A4oWgbrIvCVRvf669yzywcu8WPzxmJZ5mSKdcbcjzsErff83qSRU3qjBi8gceMYIl8
 oKpJjqzJTQSzG1RTHva0w5XlsCGJ63QASeg+ti7ZbKn2nMvzk1gxaw/kUdjU5tmMaV
 TYuRCGQMikFK209Vf7+msC0aqtSmQsyJtCJoLggoqbF8G7WCZE48AprGlhKiNVgBSr
 LoVOXJ0cyTTuQ==
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
 <20220118104338.2081259-3-giulio.benetti@benettiengineering.com>
 <ddc3beea-3a9d-2544-dac6-fda495554b74@grenoble.cnrs.fr>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <bcbba7a5-4292-3a58-2582-0ccf112ca291@benettiengineering.com>
Date: Tue, 18 Jan 2022 14:35:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ddc3beea-3a9d-2544-dac6-fda495554b74@grenoble.cnrs.fr>
Content-Language: en-US
X-CMAE-Envelope: MS4wfABZH583Ozfzs650wqGFJoWUsZevnH1IRbrBRVszhv22XG2N8IyD+R4NpM5KTVUvXPQ6nX7A+5macvvltg0GaPlOnBSt9WdnhmZHumVRxyEHpyUqoCvz
 tJm2WdNRIhW0BdevbOFler7lAMNtJfbj35CR8zwHT8jg2Y5UIGHqBlZYefDNkM5VDsllpDgXjTbM0JfbYCo85HapFQvYcrjTn3npgRh6eQAs076EY/z5rcOv
 peP22E5kMCrtFYrdZXX0pA==
Subject: Re: [Buildroot] [PATCH 02/28]
 configs/acmesystems_acqua_a5_512mb_defconfig: enable NEON/VFPV4 FPU
 strategy
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Edgar,

On 18/01/22 14:28, Edgar Bonet wrote:
> Hi again!
> 
> Giulio Benetti wrote:
>> As pointed by SAMA5D2 Datasheet [...] So let's enable VFPV4/NEON FPU
>> strategy instead of the default VFPV4-D16.
> 
> BTW, the Acqua is a SAMA5D3[1] (SAMA5D31 or SAMA5D36, depending on the
> version), not a SAMA5D2. The datasheet[2] of the SAMA5D3 states:
> 
>      The Floating-Point Unit (FPU) supports the ARMv7 VFPv4-D16
>      architecture without Advanced SIMD extensions (NEON).

Ah, thank you. I had the SAMA5D3 opened and I couldn't find anymore 
which board used it. I thought it was this one. Thanks for pointing.

> So I guess the patch is not relevant to this board.

Exactly. So please drop this patch and I've set it as rejected in Patchwork.

I'll go in depth later with patch 01/28.

Thank you for the answers!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
