Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADBBCAC5B0
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 09:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 140B340B8D;
	Sat,  4 Oct 2025 09:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58tIvXgMQnTz; Sat,  4 Oct 2025 09:00:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E16340BA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E16340BA0;
	Sat,  4 Oct 2025 09:00:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 018C2909
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 09:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F334840429
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 09:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdPhiju9w6iM for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 09:00:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 70FA1403E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70FA1403E0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70FA1403E0
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 09:00:03 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so528560466b.3
 for <buildroot@buildroot.org>; Sat, 04 Oct 2025 02:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759568402; x=1760173202;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FoN7SYooELi4Bcl7ycgZKOda9mv9K+GyLixfyYefK7U=;
 b=It1m4zhErdKpETLhgypSNgoof1FzKCg4/yh25GNtFnEzZxI99MVO4XeyvkYYVEsObh
 RWDr2qOfsQscURc4swsbXXerwL/x2bZ2dRTlM6knewpNP0r5isp8uEfEXSbB9GLo3d1k
 CTuofuGuSgmwaym1Snf2WhkpATKFT2Ylt38MB8RRgxIAzqU4jh63IjnKQHulLqtCQOIh
 yWrrWIwanRE6T2ufEYw5n4rgzPrtqoEUw3xb59enUmPjBNvEsf+MGHBikPcB6jpV9H05
 P3STMC3plnJXGSP5KrlvotQplfYQUeIm7e9eahpiONJ8SOTnWTlc32Md6Ypaj3gLRntU
 XCMg==
X-Gm-Message-State: AOJu0YzkuBi/YTufQJ2cR1b6kAFT3ZLfSH4eQ40cJS1xEMXyNzxe9TYo
 18aAidJlcc1eTa/f6wBamgryf87vTY0QUkMKXdoeRPM4/yDFURhKyxGcrL6jYsh9p94=
X-Gm-Gg: ASbGnctDarzaf83Otq3L8Hz+D74vkZW7FRyPjmDQeJ1S7CllRpHHxs6imrTLJ2jMKJk
 mPcT+2+KDNu+7Otc5lA+qlngOlsimdENrO2Q1QwHaxdST+1Vjd8mc4yNXi4xxRYs843uWFCLWh0
 6OTiS25NlRlYryT3c+ptH9EeS8/08QpN4/k+Xe1YfsHTJVN8pjyQ3/DJ8pveLBBvw/KwqmFfTxt
 13bOJoBKtU7ovIpbBSwEKBs4tQ5JUXJG69nA4YxFWCxyOzF+lLKqKcg0PBKb+UdZ1JYGBwiJLpW
 1aQ3P/F5SxEMhUU49XNwJWSuH0bsrHx//jBoejwEo6FJ0yiyMTM8PMmstrnaQ505Iis742ShtBm
 K4ECuIdmiR0UQwOK6JuhQWM4Zz30xKK3AgONWG3pdoQOdiRIWfv5uL41w060kp+KZ8slIn/cJey
 /70QqjXbEvp0NiJPVyrHBZjZnqIwgm1sM=
X-Google-Smtp-Source: AGHT+IFxTjHlYS7i5YkYTiwAN/oCRndeMdOvGEkUsm0kUiU18Ann9AyhfvzicYhSOsEm1QB1C+3rYQ==
X-Received: by 2002:a17:907:97d3:b0:b04:67f3:890f with SMTP id
 a640c23a62f3a-b49c3d753d4mr774607766b.33.1759568401672; 
 Sat, 04 Oct 2025 02:00:01 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-637881000c9sm5784634a12.31.2025.10.04.02.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Oct 2025 02:00:01 -0700 (PDT)
Message-ID: <59583072-ee15-4215-8451-d019abe5074d@mind.be>
Date: Sat, 4 Oct 2025 11:00:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
References: <20251003125438.76030-1-titouan.christophe@mind.be>
 <61796e770ac68ed8d6c276f095369cc3@free.fr>
Content-Language: en-US
In-Reply-To: <61796e770ac68ed8d6c276f095369cc3@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1759568402; x=1760173202; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FoN7SYooELi4Bcl7ycgZKOda9mv9K+GyLixfyYefK7U=;
 b=M1TTR/bF+s2x+J/+PDfclzmFv4pQLvkweeCIp7jLNK40ah40cPc0jnWyu6KslhuP/s
 dKOyKsvZkCwHlKnfMr42suYDY2PGQWLfKDKPEEyNqbmoza7sgfm0lnv+O6ffVvbGwulo
 buxXLxNci2vA2Em2VuPDwUazpApnCOCpruU3gxPswoCPbpzhBDNQcr8YT+bWR1ujGRLl
 VtdC4/2TIK/2/yGyQWLVnPCAMIy4uAkFNAsHPhWA0nXa7pwJ0D3gfb1PjvXLwu4VonRO
 BzKLj8dKqhTYZTHbl4aTYKeIeaziaOf3MAbhESd9xTUrMDxAViTpdg6kTzkre6006mv/
 8OfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=M1TTR/bF
Subject: Re: [Buildroot] [PATCH v2] package/ghostscript: security bump to
 v10.06.0
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

Hello,

On 3/10/25 19:15, Julien Olivain wrote:
> Applied to master, thanks.
> For info, I also included the changes from my v1 review that
> you might have overlooked. See:
> https://patchwork.ozlabs.org/project/buildroot/patch/20250930104038.58702-1-titouan.christophe@mind.be/ 
>
> https://gitlab.com/buildroot.org/buildroot/-/commit/6f984089c0ff103fca50617c9fa033eaadf61e51 
>
Yes indeed, I entirely forgot about that. Thank you very much Julien !

>
> Best regards,
>
> Julien.
Titouan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
