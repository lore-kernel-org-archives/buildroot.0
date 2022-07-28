Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74820C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 19:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0667641754;
	Thu, 28 Jul 2022 19:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0667641754
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lPgl71apT2d7; Thu, 28 Jul 2022 19:16:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C58084173D;
	Thu, 28 Jul 2022 19:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C58084173D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7ECD1BF21A
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0697402BC
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0697402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9YywBr0ghN98 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 19:16:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E85B040127
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E85B040127
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 19:16:49 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id i13so3333511edj.11
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 12:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6EQow5hM3w/srM3txazJA59JT4wXIhg9QMQr4irSGig=;
 b=UzWSTSkpDh6QPAwqeYIyGC/ZN5+hOZVFDZh52k7I8XPexEruJ0pkkxGimoAQm9eei6
 xedybJz7x4x8pLL1BswzkzLs7bdy8aE6Ofg3x6O6Yvq1dU83mTL01N+x2SIjWSwFfn/1
 xhmXj+jILnjpIkOM0S4mEfuQV8zzhbjHoUDERK4UegZH8YA8DiszOZG9+f3HVy/xsta4
 68lrRx+yifk4i7qU2Efp0RgJ4SAa/+DDr3l61+sLKwWQeNqkomEbh5y6smUVXDAaEJqs
 hG5L6sp9fOKfKYwzXYWExqJihr+RyHuNdRQ85kegr4lzsAjeIGwcR1hjVsK4J9R3UP4m
 Sz0A==
X-Gm-Message-State: AJIora9He/hEpY2yg7N1tqT4HhDI3DyKhfXEHcShjoxRzJ6Rz1tHF944
 zzMAlLkLIEUg2CHWqr27NwBhOA==
X-Google-Smtp-Source: AGRyM1vJbyHeAw95z9qBpbxVOasanh7XOvjkSLYnY4F01wrRyISwINu2hOBBX4aZmDJvDpdfQOXUIQ==
X-Received: by 2002:a05:6402:14cf:b0:43c:f7bd:181c with SMTP id
 f15-20020a05640214cf00b0043cf7bd181cmr381923edx.163.1659035808162; 
 Thu, 28 Jul 2022 12:16:48 -0700 (PDT)
Received: from [10.101.1.216] (ip-185-104-137-32.ptr.icomera.net.
 [185.104.137.32]) by smtp.gmail.com with ESMTPSA id
 ck23-20020a170906c45700b0072af3deb944sm702832ejb.223.2022.07.28.12.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 12:16:47 -0700 (PDT)
Message-ID: <bde96e33-ba1a-bbc6-c9e6-7e0219a84661@mind.be>
Date: Thu, 28 Jul 2022 21:16:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20220222102211.74573-1-nolange79@gmail.com>
 <20220222102211.74573-8-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222102211.74573-8-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6EQow5hM3w/srM3txazJA59JT4wXIhg9QMQr4irSGig=;
 b=MQkZ0+ZsZiAXcod72lR821gwlBt7ljz+n1ClK8DX2M3GDQZgCCZD1NYkDArHVCZCnQ
 GG4lPvHVUc5IGrEW1GUgiXsUJ1bgynNeGa6jvXQevKIalMUw0BoqA6cgn02tLT0Ryd5c
 RWgV0FEvFvSt6EvMjE9IdzsyAxY59EEVbUdGSlZio531cA0ODQzet+QKYmrIP4sJxhLb
 ROP/xYm6an4ny8n8LgJPhC4tqwpcQp/DkUAssQ4aYK6VeRo04R2bF8rNZLFRdvCrdxvE
 h9AegCTMAzZkYVTDGpnknHlemr0ptwWTMMwe02L8ew3oRcIbSIVTrB0piKg/rI7iQKdu
 nBZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MQkZ0+Zs
Subject: Re: [Buildroot] [PATCH v3 7/7] package/zsh: enable static regex
 module
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
Cc: Phil Eichinger <phil.eichinger@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIyLzAyLzIwMjIgMTE6MjIsIE5vcmJlcnQgTGFuZ2Ugd3JvdGU6Cj4gdGhlIGJ1aWx0aW4g
c3RyaW5nID1+IHJlZ2V4cCBvcGVyYXRvciBuZWVkcyB0byBsb2FkIHRoZSByZWdleAo+IG1vZHVs
ZS4gVGhpcyBvcGVyYXRvciBpcyByZWFkaWx5IHVzZWQgaW4genNoIHNjcmlwdHMsCj4gc28gYWx3
YXlzIGVuYWJsZSBpdC4KCiDCoEkgd2Fzbid0IHNvIHN1cmUgYWJvdXQgdGhpcyBvbmUgLSBidXQg
dGhlbiBhZ2FpbiwgdGhlcmUncyBsaXR0bGUgcmVhc29uIHRvIApoYXZlIGFueSBkeW5hbWljIG1v
ZHVsZXMgaW4gYSBzaGVsbCB0byBiZWdpbiB3aXRoLiBJIHRydXN0IHlvdXIganVkZ2VtZW50IG9u
IHRoYXQuCgoKIMKgUmVnYXJkcywKIMKgQXJub3V0CgoKPgo+IFNpZ25lZC1vZmYtYnk6IE5vcmJl
cnQgTGFuZ2UgPG5vbGFuZ2U3OUBnbWFpbC5jb20+Cj4gLS0tCj4gICBwYWNrYWdlL3pzaC96c2gu
bWsgfCA2ICsrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvenNoL3pzaC5tayBiL3BhY2thZ2UvenNoL3pzaC5tawo+IGluZGV4
IGMyNmEwMGM0MzAuLjg1YzIxNDM3MmEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS96c2gvenNoLm1r
Cj4gKysrIGIvcGFja2FnZS96c2gvenNoLm1rCj4gQEAgLTQ0LDYgKzQ0LDEyIEBAIFpTSF9DT05G
X09QVFMgKz0genNoX2N2X3NoYXJlZF9lbnZpcm9uPXllcyB6c2hfY3Zfc2hhcmVkX3RnZXRlbnQ9
eWVzIFwKPiAgIAl6c2hfY3Zfc3lzX2R5bmFtaWNfc3RyaXBfZXhlPXllcyB6c2hfY3Zfc3lzX2R5
bmFtaWNfc3RyaXBfbGliPXllcwo+ICAgZW5kaWYKPiAgIAo+ICsjIHJlZ2V4IGlzIGNvbW1vbmx5
IHVzZWQgYnkgY29tcGxldGlvbiBzY3JpcHRzLCBsaW5rIGl0IHN0YXRpY2FsbHkKPiArZGVmaW5l
IFpTSF9VU0VfU1RBVElDX1JFR0VYX01PRFVMRQo+ICsJJChTRUQpICdzLGVjaG8gZHluYW1pYyxl
Y2hvIHN0YXRpYywnICQoQEQpL1NyYy9Nb2R1bGVzL3JlZ2V4Lm1kZAo+ICtlbmRlZgo+ICtaU0hf
UE9TVF9QQVRDSF9IT09LUyArPSBaU0hfVVNFX1NUQVRJQ19SRUdFWF9NT0RVTEUKPiArCj4gICAj
IEFkZCAvYmluL3pzaCB0byAvZXRjL3NoZWxscyBvdGhlcndpc2Ugc29tZSBsb2dpbiB0b29scyBs
aWtlIGRyb3BiZWFyCj4gICAjIGNhbiByZWplY3QgdGhlIHVzZXIgY29ubmVjdGlvbi4gU2VlIG1h
biBzaGVsbHMuCj4gICBkZWZpbmUgWlNIX0FERF9aU0hfVE9fU0hFTExTCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
