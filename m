Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC3EC5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45B3F40F13;
	Fri, 14 Aug 2026 14:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAeq36Zo4pHz; Fri, 14 Aug 2026 14:23:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51D9640E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786717423;
	bh=NnetDPwNHc4k2Nw/uJ8zIN7YKOU4laU8qsF6QW3pQnk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xbp9Ukxb0p6Ufhfb7EJSRb4e9O1rhxrmdznYc27dFeibp7UeaE8mUmrlEmqWT/G7Y
	 N8jI1uYqZYSNcnmXO54NhZ15AF/9/RL5R2BQDbStZl4O1pL0YlkUErCEJK2KDpcW1O
	 2Ip1nvQ1qxQwm0AH7N7vr1aUEyKqIco6K8zVb7Kc6bEqbEXxPCTrhVzORW3QvM3Q6n
	 C7TsuvdEkjI/eVo9nGYlOU0x1sP9cfaquuTUODw+RTvMTE1j282i8pedsU/Wf+srtc
	 vR5Yq55MBtplJy4b67vE7W0kxlc2X43QPStl1hVJgp65Ln2FOrt34Swnh0hwRIy1pP
	 3eqvnmYboEq4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51D9640E72;
	Fri, 14 Aug 2026 14:23:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AEBD23F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08F4A403B4
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfNwT4W7Ir7r for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:23:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 228FC4011F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 228FC4011F
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 228FC4011F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:23:41 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-47f7872abb6so596899f8f.3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786717419; x=1787322219;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=++CPr9IhN7mtCmfu13+I3ZmSQp0xPZr3l8jDc0ubSOQ=;
 b=qJgt+4dQit5mFZmKPR/a/L1Ps2LgoIBs/LhyUnMKtB6oUShNPYQa1B0ZtFe6qDjmTD
 YlsvXFaLdTLLr2HMTrnYvbXLbA4pSr4Pwf4dQGxI/IKNU5tkbdgcoqvU01woDJae2t8W
 iCmwbnO6oH4oMtiMQQiJzc9o3dtZfLeI5sxcND2QzjylXPIWoWYJyT1VuznA1IgPO5tD
 c7/FuqGiJ7TFiXewBYdNL4NSt8cB3G/2j6fx5BIL2leO/Yjnl9r2kmUIPzVL7Q9G0gBB
 Dud5v7u0/peIhKa5C/NQuLTO8iAi/qo904MOsUB10FNborUBgRXJayJxEobv7/SGdZRA
 8ycw==
X-Gm-Message-State: AOJu0Yy54a1t1H0/MWL0FhX1z13joMPo1HiG+EvnoLz+saH9/p7llvoq
 09R0pa78NQ0TOC+Arq0bYiRAVglq0aGBgN+/LfHDPJqLSYDoDfJfxcFHQa9km3Fz15ymFWkAlhF
 bnMz20b4=
X-Gm-Gg: AR+sD10nlDccmh4TNwTzzrMjkARJ70LI02rfXG/y9VbJgw4Lefpb4QPbAKAsf037pvD
 QMMboJDusMhyhxe/O4tq/0oYc9Ui/Yr56wuT3yMT+QoLRP1BIWKqBbNL8z1s8Ywaup9lr2eb+mH
 UySk94FtiZMpAI+N7NfJ0TtW+fuk6g6k1hd8rsWEtEL5Atx6aQ+Da1zs+5UE/1imcxqKdhF+iqr
 7udBtxYksh0q3WfH1/phW90KSi1jk1+wAzbnHOMxwn6Ly4DL0CXKbUUcTn4XUk2wOkJZ+ahSUIE
 6OZEFlJMoC3u/uz4Cp91bjhoQh/QpbAoyrzzsdEujIS4KLuJFaT156KG53WplnOc8UBxc/vqqEu
 U95aE7Z4LVVrPDRHG3TgZZl57VHFi0js5rY5QOLP2HW3wITYXp2ZSrThskdxUM9iJ3MxpwuG5XU
 BsZbDzY4p02zAydtYVqU4n+0ubtoKiHGUO2ipFIfi3dy5QTxjIF7Bn3T8aiqb1qU25Mnl30KMfp
 uI5kasoQ33R84j/cW5C2LTGqLXboymHaULEvzgLpRqeMHVN
X-Received: by 2002:a05:6000:470d:b0:481:5167:d526 with SMTP id
 ffacd0b85a97d-481606f4665mr9730048f8f.6.1786717419057; 
 Fri, 14 Aug 2026 07:23:39 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f200752sm9190764f8f.1.2026.08.14.07.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:23:38 -0700 (PDT)
Message-ID: <c98fac21-5607-403e-aee9-c898a06a8e75@mind.be>
Date: Fri, 14 Aug 2026 16:23:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, James Hilliard <james.hilliard1@gmail.com>
References: <20260726092711.212660-1-ju.o@free.fr>
 <a8a63d9b-fdc3-4e44-aeed-846d1406af93@mind.be>
 <6e608820fd7573c7acfe09e92deda3e6@free.fr>
 <1e3c4b9d-5c3a-499f-9771-a2a407812af2@mind.be>
Content-Language: en-US
In-Reply-To: <1e3c4b9d-5c3a-499f-9771-a2a407812af2@mind.be>
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pydal: needs python xml
 module at runtime
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/08/26 16:22, Titouan Christophe wrote:
> Hello Julien,
>
> On 10/08/26 20:31, Julien Olivain wrote:
>> Hi Titouan,
>>
>> On 07/08/2026 13:53, Titouan Christophe wrote:
>>> On 26/07/26 11:27, Julien Olivain via buildroot wrote:
>>>> pyDAL is using xmlrpc at runtime. See:
>>>> https://github.com/web2py/pydal/blob/v20260313.1/pydal/_compat.py#L114
>>>>
>>>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>>>
>>> Applied to 2025.02.x and 2026.05.x, thanks
>>
>> I saw you included other new runtime tests in maintenance branches,
>> but you skipped the pydal one:
>> https://gitlab.com/buildroot.org/buildroot/-/commit/67d6e6602fec095084f64560050cb1195dff7765 
>>
>>
>> Is there a specific reason, or did you just missed it?
>
> It was an overlook from my side, indeed.
> Now applied to 2025.02.x, thank you for the heads up !

And also applied to 2026.05.x, sorry for the noise

>
>>
>> Best regards,
>>
>> Julien.
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
