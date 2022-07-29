Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FF4C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 18:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07C2684038;
	Fri, 29 Jul 2022 18:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07C2684038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MyukWPR06aE8; Fri, 29 Jul 2022 18:57:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E54183F10;
	Fri, 29 Jul 2022 18:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E54183F10
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 823A71BF575
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 18:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59DBE421E6
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 18:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59DBE421E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AwHsigsEebox for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 18:57:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7E1E4190D
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7E1E4190D
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 18:57:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id mf4so10090265ejc.3
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 11:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HqAmAFnCY7jiiWnQ+G8fU4zjfOtZ+9/3JiWytii3DkA=;
 b=E/IDU/zue3jH8eM9NI46jovolnkAYdNdiFkPSENeSNlkA25VZK+kHRhN44HOdPms2u
 O+ZtOhm6PGh1fTsd3Ln1OIYhVsvZpi3lEKdKH/V2gXWcD2tZpBpxknKxRxA551TJAVbS
 ui7wt9ebESK9H7MuIDr1UCDOf/FTE4Bn01lI9kxMqWzRLKTj4PxsL2LgpudVR5vSa/Tm
 J/95sMJjpBrFa1Awj+B0a2Z4QKkiO2V9DOpnDDtzXgg6z7ewlMAkUli3X85TH2AGaDk9
 iQ0XK+peWDqliQrbHyLK4Nq5D6rJarl7MQnPpLiEm45UugEYd6mtIGXwyqT4rtm/uSNL
 QvOg==
X-Gm-Message-State: AJIora8Uz/MMLPm3PKFD39U0ckL7LHLMOmQkebv4EZoFpCJ/FBfqe9/y
 r/bZcupNulZkyIcDBVTyoHuCcA==
X-Google-Smtp-Source: AGRyM1smRrm1eo59Fs/s9EiAb3nZ+MD+FJk0kpW/3mkSD+Uw89WpNLacWLEGDBcGnnWC/sibfwoD/A==
X-Received: by 2002:a17:906:cc12:b0:72b:67bb:80c3 with SMTP id
 ml18-20020a170906cc1200b0072b67bb80c3mr3849068ejb.668.1659121034972; 
 Fri, 29 Jul 2022 11:57:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a056402094500b0043c8ad3c38fsm2736576edz.58.2022.07.29.11.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 11:57:14 -0700 (PDT)
Message-ID: <6aea4e69-28db-68a7-3ed1-e70c18bc5862@mind.be>
Date: Fri, 29 Jul 2022 20:57:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Andy Yan <andyshrk@163.com>
References: <5868454e.114f.18036cf775d.Coremail.andyshrk@163.com>
 <de698bb9-334a-b132-f417-7f7c3e39ea06@mind.be>
 <3a1fd6ce.4164.18249217d7b.Coremail.andyshrk@163.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <3a1fd6ce.4164.18249217d7b.Coremail.andyshrk@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HqAmAFnCY7jiiWnQ+G8fU4zjfOtZ+9/3JiWytii3DkA=;
 b=BR+Pac3UkrY/uqz5vJfMnAS7bM0tmPrgrOKW4a2fAGVwKznBMrWVWgCpY0BZd5Bkdy
 GKofGSyyLcJxpszi5DYq6yg0carJnbOAu+XI4/NGwvSv/wYcAqRgaoO54LPx/jupeFL2
 c5Udhodimb9H2zWW+B2Gp1brqgbk769WnozyardvF3Vnp+dQ8fXIxNoGYOy+KTEkQcFS
 dBVuTszHX622XAXyAQiEnrOHem65DuH9P43PmD0XHqAhSLLBeJNv2Ap3wupWNFlKG0tR
 fWrMpFPYcUypeRkWtsMx1ahLJhEn/XxWMyKY175qcADzWxoqnoXY20gEgdqrIMKmZhFp
 0RGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BR+Pac3U
Subject: Re: [Buildroot] Is there any plan for supporting Qt6
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
Cc: ps.report@gmx.net, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyOS8wNy8yMDIyIDEwOjQ1LCBBbmR5IFlhbiB3cm90ZToKPiAKPiBIaSBBcm5vdXTvvJoK
PiAKPiBBdCAyMDIyLTA3LTI3IDA0OjEzOjE4LCAiQXJub3V0IFZhbmRlY2FwcGVsbGUiIDxhcm5v
dXRAbWluZC5iZT4gd3JvdGU6Cj4+Cj4+Cj4+IE9uIDE3LzA0LzIwMjIgMTE6MTYsIEFuZHkgWWFu
IHdyb3RlOgo+Pj4KPj4+Cj4+PiBIZWxsbzoKPj4+ICAgICAgICAgQnVpbGRyb290IGlzIGEgZ3Jl
YXQgcHJvamVjdCwgaXQgZ2F2ZSBtZSBtYW55IGNvbnZpbmNlIGZvciBidWlsZGluZyBlbWJlZGRl
ZCByb290ZnMuCj4+PiAgICAgICAgIEkgZm91bmQgUGV0ZXIgaGFzIHN1Ym1pdHRlZCBRdDYgc3Vw
cG9ydCBhdCB0aGUgZWFybHkgb2YgMjAyMVswXSwgYnV0IGl0IHNlZW1zIHRoaXMgc2VyaWVzIGhh
cwo+Pj4gbm90IGJlZSBtZXJnZWQgeWV0LiBNYXkgaSBLbm93IGlmIHRoZXJlIGlzIGFueSBmdXJ0
aGVyIHBsYW4gZm9yIFF0NiBzdXBwb3J0IGluIGJ1aWxkcm9vdD8KPj4KPj4gICBXZSBub3cgbWVy
Z2VkIHRoZSB2ZXJ5IG1pbmltYWwgdmVyc2lvbiBvZiBxdDZiYXNlLiBUaGUgbmV4dCBzdGVwIGlz
IGZvcgo+PiBzb21lb25lIHRvIHN0ZXAgdXAgYW5kIGFkZCB0aGUgZGlmZmVyZW50IHF0NmJhc2Ug
ZmVhdHVyZXMsIGFuZCB0aGUgb3RoZXIgcXQ2Cj4gCj4+IG1vZHVsZXMuCj4gCj4gCj4gR3JlYXQg
d29ya++8jCB0aGFuayB5b3XvvIEKCiAgTm90ZSB0aGF0IHRoZXJlJ3Mgc3RpbGwgYSBsb3Qgb2Yg
d29yayB0byBiZSBkb25lLCBhcyBkZXNjcmliZWQgYWJvdmUsIGFuZCBpdCdzIApub3QgZ29pbmcg
dG8ganVzdCBhcHBlYXIgb3V0IG9mIG5vd2hlcmUgLSBzb21lb25lIGhhcyB0byBzdGVwIHVwIGFu
ZCBkbyBpdC4KCiAgSW4gb3RoZXIgd29yZHM6IGZlZWwgZnJlZSB0byBzZW5kIHBhdGNoZXMgdG8g
ZW5hYmxlIG1vcmUgcXQ2YmFzZSBmZWF0dXJlcyAKKG1vZGVsbGVkIGFmdGVyIGhvdyBpdCdzIGRv
bmUgZm9yIHF0NSkgYW5kIGFkZGl0aW9uYWwgcXQ2IHBhY2thZ2VzIQoKICBSZWdhcmRzLAogIEFy
bm91dAoKPiAKPj4KPj4gICBSZWdhcmRzLAo+PiAgIEFybm91dAo+Pgo+Pj4KPj4+IFswXWh0dHBz
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvY292ZXIvMjAyMTAyMTMx
NzQwMTMuMzI1ODQtMS1wcy5yZXBvcnRAZ214Lm5ldC8KPj4+Cj4+PiBNYW55IHRoYW5rcy4KPj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+Pj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
