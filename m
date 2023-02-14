Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACE0C6379F
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 21:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 695AC60F9C;
	Tue, 14 Feb 2023 21:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 695AC60F9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WckaHwHCZDWu; Tue, 14 Feb 2023 21:25:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B36D360DFF;
	Tue, 14 Feb 2023 21:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B36D360DFF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5605C1BF2B3
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DBF5408C1
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DBF5408C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-70dTIhtAv7 for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 21:25:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F12D940894
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F12D940894
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 21:25:03 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id gn39so5070671ejc.8
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 13:25:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KXyd8PKvb7bOQfXU/IVIIHhDZ/ojeTheAjs0gcGv/Fo=;
 b=rryOGbpNh/iDILICH4s/0+PaHnvnnD+F0Tunm3lZPAGlmPYJ1xKu+WayUw1vTN9FzI
 ns0f9Ij/7OkseAazZksAtTK+k2eqJkKfPIHifkDWEhXqjf4gUIN4sKFYrOtYd/01RKtc
 UIuxVHfdaFTo5DSEakEsYUHKr7yzEQYhULVaWzcjquIVDeiGo+MLmbLB+atGP0GzRXnB
 fsfIP7fsq7Uzn0PehnO8Pqxws4+n92Ks4H5QLuiSLKyOj3C8xLxGQYbnCxa61CbufhRI
 esSd/KA8sIhI0V11kGD9y6Ovu9v9RCP/TtYcoOY5/9UL3NRxNjXUKKj07KbdcbUELDEy
 91mQ==
X-Gm-Message-State: AO0yUKWNSPdF5Hh/CgwD8H8tsx3D0QFz8zdUvDxqAXL9w30IfaMtlK7i
 OjEijvlk5LDEm/W3aE1aTKRcXQ==
X-Google-Smtp-Source: AK7set9mk19wVJHwHlpifuSaFwBOSUiaXVvkHftZHhuc/QBypnns+AIb6Dso0T4H9bVerxfEP/HHHQ==
X-Received: by 2002:a17:906:a951:b0:8af:2cf7:dd2b with SMTP id
 hh17-20020a170906a95100b008af2cf7dd2bmr4992114ejb.13.1676409902080; 
 Tue, 14 Feb 2023 13:25:02 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a170906c31600b008b13823b892sm722616ejz.53.2023.02.14.13.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 13:25:01 -0800 (PST)
Message-ID: <e5f2f930-d17f-a2e7-6c8b-0d59d2379ecf@mind.be>
Date: Tue, 14 Feb 2023 22:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20221018034605.800593-1-james.hilliard1@gmail.com>
 <20230212094205.GK2796@scaer> <7d630b5f-69b3-6129-2426-7e9b7499f6d3@mind.be>
In-Reply-To: <7d630b5f-69b3-6129-2426-7e9b7499f6d3@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KXyd8PKvb7bOQfXU/IVIIHhDZ/ojeTheAjs0gcGv/Fo=;
 b=KvWkGeNcrSQK46vx6ZhkuK8epYCekVSUpilqq5ZideXJlBR/q+B/Yf1QEJcI3o3vHq
 WKCsgTkadhoSRcP5nw9MiLgaRFIW2nVeLLKU3tz93ArSZhEfJAaLJXp0Iit6sXHX6gT1
 Xx/SqPD2crXijYqtPwULUQsCScJr7JgqDsHI7kfYXbqg2gXh9/g14Alw7HFwpU3DdUO5
 WryrfVNLtsFNLzsIXPgQ3T22AuohgpJbXQvqu+/FB2bSXWBRcUtnOGg3S9ddDAWZjDB9
 9TUs+nx0JXlTRpG8YnrWTzRZH3b/f2aSzFKZORx/32aVrtvSvjwDgXwdb+0fuDkvOVD9
 GJhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KvWkGeNc
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix rule order
 for re{install, build, configure}
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDE0LzAyLzIwMjMgMjI6MjIsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgpbMV0KPiDC
oEkgbWF5IGJlIHN0dXBpZCwgYnV0IHdoYXQgd2Ugd2FudCBpcyB0byBoYXZlIGFuIG9yZGVyaW5n
IGJldHdlZW4gCj4gY2xlYW4tZm9yLXJlaW5zdGFsbCBhbmQgJCgxKSwgcmlnaHQ/IFNvLCBsZXQn
cyB1c2UgYW4gb3JkZXJpbmcgZGVwZW5kZW5jeT8KPgo+ICQoMSktcmVpbnN0YWxsOsKgwqDCoMKg
wqDCoMKgICQoMSktY2xlYW4tZm9yLXJlaW5zdGFsbCAkKDEpCj4gJCgxKTrCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgJCgxKS1jbGVhbi1mb3ItcmVpbnN0YWxsCgoKIMKgR2FoLCBJIGZvcmdvdCB0
aGUgYWN0dWFsIG9yZGVyLW9ubHkgYml0Li4uCgokKDEpLXJlaW5zdGFsbDrCoMKgICQoMSktY2xl
YW4tZm9yLXJlaW5zdGFsbCAkKDEpCiQoMSk6wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAkKDEpLWNs
ZWFuLWZvci1yZWluc3RhbGwKCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCgo+Cj4KPiDCoFJlZ2Fy
ZHMsCj4gwqBBcm5vdXQKPgo+Pj4gwqAgwqAgJCgxKS1jbGVhbi1mb3ItcmVidWlsZDogJCgxKS1j
bGVhbi1mb3ItcmVpbnN0YWxsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBybSAtZiAk
JCgkKDIpX1RBUkdFVF9CVUlMRCkKPj4+IMKgIC0kKDEpLXJlYnVpbGQ6wqDCoMKgwqDCoMKgwqAg
JCgxKS1jbGVhbi1mb3ItcmVidWlsZCAkKDEpCj4+PiArJCgxKS1yZWJ1aWxkOjrCoMKgwqDCoMKg
wqDCoCAkKDEpLWNsZWFuLWZvci1yZWJ1aWxkCj4+PiArJCgxKS1yZWJ1aWxkOjrCoMKgwqDCoMKg
wqDCoCAkKDEpCj4+PiDCoCDCoCAkKDEpLWNsZWFuLWZvci1yZWNvbmZpZ3VyZTogJCgxKS1jbGVh
bi1mb3ItcmVidWlsZAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcm0gLWYgJCQoJCgy
KV9UQVJHRVRfQ09ORklHVVJFKQo+Pj4gwqAgLSQoMSktcmVjb25maWd1cmU6wqDCoMKgICQoMSkt
Y2xlYW4tZm9yLXJlY29uZmlndXJlICQoMSkKPj4+ICskKDEpLXJlY29uZmlndXJlOjrCoMKgwqAg
JCgxKS1jbGVhbi1mb3ItcmVjb25maWd1cmUKPj4+ICskKDEpLXJlY29uZmlndXJlOjrCoMKgwqAg
JCgxKQo+Pj4gwqAgwqAgIyBkZWZpbmUgdGhlIFBLRyB2YXJpYWJsZSBmb3IgYWxsIHRhcmdldHMs
IGNvbnRhaW5pbmcgdGhlCj4+PiDCoCAjIHVwcGVyY2FzZSBwYWNrYWdlIHZhcmlhYmxlIHByZWZp
eAo+Pj4gLS0gCj4+PiAyLjM0LjEKPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+Pj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
