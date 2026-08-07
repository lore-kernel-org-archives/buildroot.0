Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91466C5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A54560A6C;
	Fri,  7 Aug 2026 11:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jUqlVT6l5Alr; Fri,  7 Aug 2026 11:52:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A9AA60A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786103557;
	bh=dcK2qT2GM2z3ADMMsIGqFH43wpuzWisoZb3srEU57oc=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=sRasZ8ULmaJ6gJu5eRalQisUTpPLo4KmRTrNJrY02yK658TLetK0hk1sNj5GdUtfG
	 RUMlblCQAP9xTkeVgD1NXLvk58my5TjnWYlW5WXlUk+whVf8I3DUrRFmLkmQ7NRys2
	 5ue4BR5Ulo8HtamEZachsAKYN8YnQ2a8VZAqf4H77eMXYT0kMwK3lNruK66OMx+2vX
	 2GvtPd63CnhNX9SiDYCaXVOBWR5y4zTvk0MWqWpDBCEs4AAB40CCoHlQhKiAywnvIm
	 BZL2FZ85DL2TGwOubWvsqoDEWXtnhMc47dEE8uTIl8kuqsP1kFqnccvyFlasVVT2f7
	 9yRlz0WQQ7A+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A9AA60A4C;
	Fri,  7 Aug 2026 11:52:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA203D3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC51240A6F
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0N2GhCl1hv_H for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:52:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D90EE40A31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D90EE40A31
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D90EE40A31
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:52:34 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-47f703a9d05so2144480f8f.0
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103553; x=1786708353;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3LUSKOQmk+6/riPamgL1O9fBbtCFNJfqMDI6fhAN74M=;
 b=MDFxtDicfkj4H88CujLXisGT4oxdutxoOQGzt04D/zEecgo6jIF5DNgm0opcP7+piG
 4MdlDT6YNYK13OQQTeDdYeG26WHnHkT7q9t4QSdMLEg7tYpwcfYH/4fyre+dxxIzc8PK
 Zxv3oYcxx+7G6wtZKKVn0fzBC0k6SutrWblS9A/bwFl2XkRINW0Y//GiEahlhQuSOT4A
 Y6qY+gFKrdjIEPqKXaEPkG9XJfPC5KFu08fkwbRif5fQ4LUjJ64muqcmtzuAjtGuzadX
 QMi74QQRGCsl3jalRPBp0oLFEha8p5W6b9kUvz46kTyfvfQgr0Brec34du2WMws1nynA
 yX1Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrDaBBAmmK8k/IEnOoAoKRsIcuMCEqaSqDAFKGSEkAAKCQz+CmU8A5rjSn/DXKPjQWmYHWmwJ+1NPk=@buildroot.org
X-Gm-Message-State: AOJu0YyO4EMDq4tT7zJ8IiuY/LodiYW+tVRAJq+SmeBC730/eiTdKbVw
 I720TANwVsYJejpZqQKrxSRyrbtpI6EvylpIHTxaIYEgd6K+Itd0i43x7+ys7JYkR9I=
X-Gm-Gg: AR+sD114AY1L7Ct/id16EnNE2kZnjApVI60C5pNM124oLfo8jvDUyX1Kz5VENRZ+/pu
 Ufmz8T9TpUtv5+RWSXVQ6iiuRZTGv7IL3/l0xw0J6sfnCrWmjnyL8TVC4PO/oeTg7UTumwyQ1fn
 k1Itf1zE7WwJImddbXUqTd655TY6Hhp2AWSzVNEtYLRSAQvdWjvb8T8Zy+s/kvY2NJO2YvJ9Ph7
 WfcTrrV5GySrHtZ65uoBXqW5vnW8Hh9sn0aI7gJbIaEVgjSkR5HYydJCmB6+EqA7obdwsnwJ3vN
 wxw5vxB7yBvCmIdSmLGduwM9gc3Wra7M0BtVhcO7yf70Z7o5TXOJKnRuPMJFDfCxJ/6dEoPRDZl
 sUIoax1AW5td+lulovjbXj86XVZIhz1PxRJKNHSIsHNGrpgK6EBCQtNT0DOV+UBlAMLFbae3PYa
 w50JrBaQ4kpushA9aJ35xTArw4qAB52re2zPss2FH88stRpuSxoLzhbIfxAhTWtvJckalE8ntPe
 C177oFBEt7daneUa2fQfT+e5cbdbXLmebaLC6Hv1HTd1VcbByN6Jb1+HNE=
X-Received: by 2002:a05:6000:611:b0:47f:756f:9a8f with SMTP id
 ffacd0b85a97d-480026edbbcmr4673662f8f.26.1786103552650; 
 Fri, 07 Aug 2026 04:52:32 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4800220ab04sm4667324f8f.37.2026.08.07.04.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:52:32 -0700 (PDT)
Message-ID: <fc8b4510-2e2b-483f-9a84-6b7ec70b2894@mind.be>
Date: Fri, 7 Aug 2026 13:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20260725235857.2053672-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20260725235857.2053672-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786103553; x=1786708353; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3LUSKOQmk+6/riPamgL1O9fBbtCFNJfqMDI6fhAN74M=;
 b=Y9xQtok3yss/bJXzpChB7ugXohUcrskuXa7Wnwve48jlTanmynCHnFLkWPMuFak63R
 Gw8KuzFp6FATwtBby8ooFkw4W2bkoeutF9m5co3pFL6jAbT6sbC2c7ZbeV/HmE30iE7N
 MS4pMYH64lg9MitfshbyW3GafXjiL3cn8fS5BFslJPJhuLkfF60ywmFr0HAssQPIvhcW
 DM1Ifqu9+rtx1z0dkIR9q9bBMWlL3i53iIWSLQc/r62p+dTo4XxbU/Z9UVzXIHPGwaVu
 m4VmrMemIBypkUEC1ynqJ3h9hMMIqyPocxrS+jOBGqqSwPEbAo5UH93vfqzwqfUeSdKS
 Axgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y9xQtok3
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: guile: new runtime test
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



On 26/07/26 01:58, Julien Olivain via buildroot wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/15535258777
Applied to 2025.02.x and 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
