Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04040C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 12:45:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 247266128B
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 12:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 247266128B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA3A560B65;
	Tue, 19 Oct 2021 12:45:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9bvq9-64M-t3; Tue, 19 Oct 2021 12:45:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27D4F60BC1;
	Tue, 19 Oct 2021 12:45:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2E01BF578
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 12:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C51283BF8
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 12:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5lYNDy_GAeud for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 12:45:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A96983B3C
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 12:45:37 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g10so12348953edj.1
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 05:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RWCsWPB2WclGpJjq3yTKflqEeBR4PXJ2xbgfHoBtxmY=;
 b=aBTu07WY/DNjWrOE8qupG6dSnZtIpTYnZwtVIOB9kn+K1//i0u1+zZPWi6WdIJ+G4Q
 kWkBX0nMgXfjvZMFQGpDyf+5H3lJTcyR6tSl4cWeEFVwOzJc9dS/9ESmmD7/5uJhikVm
 lsjFifuNDMZ8V2cYPGHzpcJLILt1z19UfLa0CheakmMqQzvHvE5CyOWg99dXgxtJuDhU
 KWAOlsAvqI7qL5lZa/kiMGoDl+OafqEyuGgwxY30dHMzfi6IU0iEuGHQeotIf/7/NbkH
 az6Th/OMmUICY8mLRihb9DBZ3SjM3fxV6je66iG36hR42NP2DMqrJvK4wN1bOWJNHG3Q
 zb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RWCsWPB2WclGpJjq3yTKflqEeBR4PXJ2xbgfHoBtxmY=;
 b=NV4cMvsFJ1Gs0lwAPdSaCPVJIjzRZ4dVEpsZMiI3sVu5eFfQ9dw6gD3901XxIGeRHr
 sjmIJmodVelULIS49Drm9noBrBvQq3uNcOgbrjyYFom0aLImUJqVL6qZdhmKkWr8502S
 /+ZlnB1i1eidV6ST8eha5bQh+AsmdAU+xjYXTod2XwBDmHaPd3Z9lpTpimW+gydKyHZN
 VH7i6+Zqdmr86ZTmSi9XkWZfmnMmERNlwIO1kDTKK4dFNvuEp05tRtRY1F7SBts10dhN
 xmktjOzDPOch5d3doV6A/kWmwALt9v/xeWDsvlQlp/lJDwpwVn48KHFfPHsXGulpWFES
 JCiw==
X-Gm-Message-State: AOAM532uSynaLLLCl3FdOU01lD+8evxXsysOt/iyGVdUyRcjYLgEiLlB
 401uoL3J/xQLmHwaLcWkpM90dA==
X-Google-Smtp-Source: ABdhPJzu8zF8TtvFadJtVReVD+eTc3fBL0NjKw65PVj1ekGN5wwEWaoIsc4kuecPglsdnH6rhy9E9Q==
X-Received: by 2002:a05:6402:4311:: with SMTP id
 m17mr53295484edc.368.1634647534953; 
 Tue, 19 Oct 2021 05:45:34 -0700 (PDT)
Received: from [10.1.0.154] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185])
 by smtp.gmail.com with ESMTPSA id s12sm3796360edj.82.2021.10.19.05.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 05:45:34 -0700 (PDT)
Message-ID: <c5b8e982-85a3-f01d-ac9b-714aa98c9be3@mind.be>
Date: Tue, 19 Oct 2021 14:45:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: =?UTF-8?Q?Esa=c3=afe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>,
 Andreas Ziegler <br015@umbiko.net>
References: <mailman.16364.1634462006.241441.buildroot@buildroot.org>
 <1641d5624553f991bb7abf9808e6bf99@umbiko.net>
 <CA+eej5PtS6iCJ+W1b6W0mZXk-fQJcB1hhr20_D7cE=fja8NzTw@mail.gmail.com>
 <3f8142a1afd59acc55e141f2d8a95e66@umbiko.net>
 <CA+eej5N4SBtyNcs-hUEsviA4X6wAk-XvqzmxkCVpiizzupm4FQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CA+eej5N4SBtyNcs-hUEsviA4X6wAk-XvqzmxkCVpiizzupm4FQ@mail.gmail.com>
Subject: Re: [Buildroot] how can i implement my kernel module and debug it
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8xMC8yMDIxIDE2OjM0LCBFc2HDr2UgTGVkb3V4IE5KT05HU1NJIEtPVUFNIHdyb3Rl
Ogpbc25pcF0KPiBrZXJuZWxfbW9kdWxlX3Rlc3QubWsgPGh0dHA6Ly9rZXJuZWxfbW9kdWxlX3Rl
c3QubWs+IDoKPiAKPiBLRVJORUxfTU9EVUxFX1ZFUlNJT04gPSAxLjAKPiBLRVJORUxfTU9EVUxF
X1NJVEUgPSAkKEJSMl9FWFRFUk5BTF9LRVJORUxfTU9EVUxFX1RFU1RfUEFUSCkva2VybmVsX21v
ZHVsZV90ZXN0Cj4gS0VSTkVMX01PRFVMRV9TSVRFX01FVEhPRCA9IGxvY2FsCj4gJChldmFsICQo
a2VybmVsX21vZHVsZV90ZXN0KSkKClRoaXMgc2hvdWxkIGJlIGtlcm5lbC1tb2R1bGUsIG5vdCBr
ZXJuZWxfbW9kdWxlX3Rlc3QuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+ICQoZXZhbCAkKGdlbmVy
aWMtcGFja2FnZSkpCltzbmlwXQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
