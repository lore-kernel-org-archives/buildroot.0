Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD6BC982CC
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 03:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3DE56062B;
	Thu, 17 Sep 2026 03:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvHsALJyIicT; Thu, 17 Sep 2026 03:27:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 28E946062D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789615634;
	b=gtm7bQRmlEIUmJVhheCZBMIpnFZqQIGsnkkURc5xyIjFdV8Q+Dhl6Q80T7fsGIlbZ+Oa
	 3BSBPjaisgA6R9iY2CCSZ30yYlBU3lNeKNW2NvzavJrIoCGddN3i+wXpHLUZVwpPjwVg6
	 2nfL2Ak89baEVhHqpG3HTAVyynsvyo0aP6njgSVRi+5PCQ4bIzzLVICpPqcbrkw754Req
	 WbZoepeyQDET+UQQsmUCSy5NzamLfDsV42D4Ht2mRpxu9YfI+zNAOmnPCiQVl8EPdg3jC
	 4qsApcT5UpBQxsp2UYQXgGmt2JPcFf2Kyj7kN/L277IbXiOEZ6mdH06StAD5F6EMcfQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789615634;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Received:X-Received:MIME-Version:References:In-Reply-To:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1Dv9ehD8u41Hf2ZlsTDKW4hZa2CUOG2Zfqbx5Wd3T4I=;
	b=gloaxlPmzQyJYQN2EP9/SySV3/0vaNxLcZvhKgi4FJq772kTpWp2Ew/onKpAvN87jw0i
	 imK6uuI6nI4MOpOfykSmBrcJDJdSjAQ/LNR//B7WBcSgQczo8efEsFqtvDIfOtWRFwX8w
	 aJTE5ovGD210GdF4elhoYNXy0NO1IthBcDJ44yXsbeJytKXXV/0bgPCnYJPXObmZfoMoT
	 t0YznEDPNmb+Dm+Ez3hLT0asbDydyDvREWiazNawPf1pNfy8us03rgVxFdru1CdE9q/hI
	 ufADuhWbfZ++OuriGoXNAEdvFLq/B1qEjVxxo/r8Uaac6SIlYuJKm61WsLgT3sVpvOw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789615634;
	bh=1Dv9ehD8u41Hf2ZlsTDKW4hZa2CUOG2Zfqbx5Wd3T4I=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gmry/RfdijnEfnEtBHGuPxz14lq0Leul+zRtiaj+CyqfVRvxiaret1R9UlQFZPMMV
	 UTK0XK1zciYI7fhSWtFu5gXDDs5loQbbr72I5o7EDJYEUiIYdZlIoVK+2Il/NnRmkh
	 G2tqf7iYogO2+KVT0EW8/wpfEsn6UZS0xh9uNZm7gUQH4k54orTXBuHHjYd3iTQMAF
	 aJ03UuC6Ki06P/pfKeSDco7LRs3y+vrRNcbB8KhAat4yx/H7Ee+WcYp8n9oIzstnt5
	 /af5Y6OJ+OC2jHDDHDSdS6zzgjS+XNWjlw60zO3SgPge5Nfb4ynTgPN2Nb+//aHCl3
	 +dWjM5RKIY5xQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28E946062D;
	Thu, 17 Sep 2026 03:27:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D068A13D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 03:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5EBC6062B
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 03:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpA_YLmrx8U8 for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 03:27:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org ACFE56062D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789615632;
 b=nY0bnYx488yVQ4GRzWMR4S6JePt4NauHsCGaX2hueFGleSBUy0VThwRr6p8t57WVXB6u
 rL3++EfPi412Lso0HZit7NGm941KYKsmCF2YbCFVX3u74OgH9UoHD+5MH3yTeO1FwnAj4
 fEPjweVvuzwaGNXoQkPUE54Yl6zAbZEipzbzOjbRJ6rnRJH/EyWAe3+l+v+ddayUv6G9y
 0/P73EwIe8hZIiU1ba+uyO6YANStqhQncTNFGXRZo2xfVHIqv4FNENWfPo+nOHEWbhnG9
 y8CWUakb4ulu4tAIZMSV2LaUmt8AOaBtxlaOM/Nb4UcNUt4OA70dn8iOBcW//KyWoMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789615632;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:
 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=+7Sbf7fYHK2NfeDaGUGA9SMxenkpfUhtr6sEL/4gG0c=;
 b=pKl2+u6Pd0EFm7fYJNpeZcyu0BdtoJ0fkMhx1vEvVAGTawOzVsTOlIozfHGx4kIYvo4N
 ANH5jcocrJ7GQEPQicoIU0G1oDQXbV8owlfD5jQipSIYYl6iLGDP40w1Ooq4Aq/sG5ia1
 s4NtdydGjfd0fi6mpxSqla/6gw4uJgDBfOFQdjRrZLWFmPw+qv60PQtfL51tx/jLwtSDx
 MsJp5eGKMh2TtVMACPWOCQ01kkHOJYqUeHdQE/iXqznfSkNU2QXRYBr+dwSJjOHXwUSXQ
 xvV8SqAkTQihJubSXgapR5wKPhVznnCD83zauICYH5Z/pKjPKK7qBmzlOxEazuZXiWg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=aperture.us; 
 dkim=pass header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=ZFtb+dGK; 
 arc=none smtp.remote-ip="2a00:1450:4864:36::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:36::10; helo=mail-lf2-x10.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
Received: from mail-lf2-x10.google.com (mail-lf2-x10.google.com
 [IPv6:2a00:1450:4864:36::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACFE56062D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 03:27:11 +0000 (UTC)
Received: by mail-lf2-x10.google.com with SMTP id
 2adb3069b0e04-5b5e4f16f12so272349e87.1
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789615629; x=1790220429;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+7Sbf7fYHK2NfeDaGUGA9SMxenkpfUhtr6sEL/4gG0c=;
 b=siGm+ifa2wg+f4NH4wy2nTwkwTMadaVPV5wV/F7iwxNvTmI2Nh/bGGZXp9XqblbV3h
 Vuxme0OD1D3C7G6lLfAww1q9PBRQ2tKFZkRCGoYCE2wFG0iB7FgwBOLegmoX/YJevFRY
 ovIqX2BDwGPAIl0W30pj1V+Qwu9wHshkeNPqPQ7lzSD4pc1GvEKb6wkcP8PZx8BbvjAi
 GBVdR6R6NJeh5R5a63XxHU+qXpAA9MOvJSnt59GGiCzegx1gccw1pgJNY1YFTrwXlJo5
 f1gTldZ3dS5dX8oLQN32M8y3Yoi6rqF88T5PRTIgGr5Nboompfr/blAgqzv8/NfIRuNw
 R/HA==
X-Gm-Message-State: AFuF++mYp/tamjMgxm5Jq/rGuXDX3yxZAGCHdAPV0ddRFIfEciCcwXmF
 RJir3y9AKZKnp/eyzE3fNhp2tbJugjPWBlENJ+eNgC9TYQzunP7120a2X5IeMMs7phIg5MIXmW+
 lSV5lD91f5w==
X-Gm-Gg: AYBFou3uvGG7AwRqE1CNHDzR85yA0h8p/wsOJL/zPWFlUQBftQQ3mC64Itn1ERxambZ
 p4aRxP0KQYxtN1dfu4wDR7voNz13kg6yT/nDcaSlfijRGyR56QfGPJM0CWSG2F8e4uOeLmgopAs
 x+FXhy0Cb/sOTJjiQioA7xKJEquvBX4Kmw8i0GRGw23rFKmQg7XqbvFUjIz85v/H3Q6QU2NrPAJ
 BoWAxFVqk5nJm29shczVxqlZNtsMo26QLA0ry+OIrCIR+2kOzbKAyGolCu+BqsbDbxRZUOSIoq8
 wR4mTbznz/bPX+mfDqASLamqvqukOyYMEIcvZ3mpdZHaz0fuxTV/Ql2t3aA+TPOcqwUzN/5Vk8L
 FRMlev9a8naewXhmKiiS3UEfFVHWGh1N8W6tWrorbwI9vC9iAeguC5aTVsrAfVTalqHDAErGfG+
 5Th0kcoQR3d2wiiES+MQsMTUniCAwJiRUm8VSzQ1WozBDqUQcD4cS29farzBEkw22bJ4BE37cWw
 YvFwwVRnmgnrfD/FxyapgxaraXh4WlQGaGqBg==
X-Received: by 2002:a05:6512:3b0f:b0:5b7:f75a:d62a with SMTP id
 2adb3069b0e04-5b8b661a2b4mr2867039e87.2.1789615628916; 
 Wed, 16 Sep 2026 20:27:08 -0700 (PDT)
Received: from mail-lr2-f27.google.com (mail-lr2-f27.google.com.
 [74.125.230.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a5daf0e6d1sm10247791fa.3.2026.09.16.20.27.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 20:27:08 -0700 (PDT)
Received: by mail-lr2-f27.google.com with SMTP id
 38308e7fff4ca-3a5b6840edcso3169071fa.1
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:27:07 -0700 (PDT)
X-Received: by 2002:a05:651c:31c5:b0:3a5:f044:fcbd with SMTP id
 38308e7fff4ca-3a5f045016dmr616741fa.23.1789615626732; Wed, 16 Sep 2026
 20:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <CA+h8R2oed-F_NN0s0OA2yF1+YLZCsMp2+Vnb=TR+ANTZnHLeyQ@mail.gmail.com>
 <aqsEbnaZphecvrlt@windsurf>
In-Reply-To: <aqsEbnaZphecvrlt@windsurf>
Date: Wed, 16 Sep 2026 20:26:52 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pMha93DcRCsknH4qJ+wL1RCgAqJF8g8=dFWVBz9gvLTg@mail.gmail.com>
X-Gm-Features: AcwNN1XoN89XgNTT1JNHDZiFIUXWN-TKkwbCKHRKq19aM52OPxYreyfOuew3xOc
Message-ID: <CA+h8R2pMha93DcRCsknH4qJ+wL1RCgAqJF8g8=dFWVBz9gvLTg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [RFC PATCH v1 1/1] package/rtl8821cu: bump to
 version 2026-08-21
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gV2VkLCBTZXAgMTYsIDIwMjYgYXQgMjowNeKAr1BNIFRob21hcyBQZXRh
enpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBB
dWcgMjksIDIwMjYgYXQgMDQ6MjY6NDVQTSAtMDcwMCwgQ2hyaXN0aWFuIFN0ZXdhcnQgdmlhIGJ1
aWxkcm9vdCB3cm90ZToKPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJp
c3RpYW5AYXBlcnR1cmUudXM+Cj4gPiAtLS0KPiA+ICAuLi4vMDAwMS1maXgtYnVpbGQtd2l0aC1s
aW51eC03LjIucGF0Y2ggICAgICAgfCAgOTEgKysrKwo+ID4gIC4uLjAyLWZpeC1jZmc4MDIxMS1i
dWlsZC13aXRoLWxpbnV4LTcuMi5wYXRjaCB8IDQ1MiArKysrKysrKysrKysrKysrKysKPiA+ICBw
YWNrYWdlL3J0bDg4MjFjdS9ydGw4ODIxY3UuaGFzaCAgICAgICAgICAgICAgfCAgIDIgKy0KPiA+
ICBwYWNrYWdlL3J0bDg4MjFjdS9ydGw4ODIxY3UubWsgICAgICAgICAgICAgICAgfCAgIDIgKy0K
PiA+ICA0IGZpbGVzIGNoYW5nZWQsIDU0NSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3J0bDg4MjFjdS8wMDAxLWZpeC1idWlsZC13
aXRoLWxpbnV4LTcuMi5wYXRjaAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4gcGFja2FnZS9y
dGw4ODIxY3UvMDAwMi1maXgtY2ZnODAyMTEtYnVpbGQtd2l0aC1saW51eC03LjIucGF0Y2gKPgo+
IFRoYW5rcyBmb3IgeW91ciBwYXRjaCBidXQgaXQgaXMgbGluZS13cmFwcGVkLiBDb3VsZCB5b3Ug
cmVzZW5kIHdpdGggImdpdCBzZW5kLWVtYWlsIi4KPgo+IEFsc28sIHdoeSBpcyBpcyB0YWdnZWQg
UkZDPwoKSSBzZW50IHdpdGggZ2l0IHNlbmQtZW1haWwgYnV0IHVzaW5nIHRoZSBHbWFpbCBBUEkg
LSB3aGljaCBhcHBhcmVudGx5CnN0aWxsIGlzIGZvcmNpbmcgbGluZS13cmFwcGluZyBhdCA3OCBj
aGFycy4KCldpbGwgZ28gYmFjayB0byBzZW5kaW5nIHdpdGggU01UUC4KCldhcyB0cnlpbmcgdG8g
dXNlIHRoZSBBUEkgYmVjYXVzZSB0aGUgU01UUCBtZXNzYWdlcyBhcmUgbWFya2VkIHdpdGggYQpy
ZWQgImRhbmdlcm91cyIgc2lnbmFsIGluIEdtYWlsIGFuZCBtYXJrZWQgYXMgaW5hdXRoZW50aWMu
CgpJcyB0aGVyZSBzb21lIHdheSB0byBzZW5kIHBhdGNoZXMgdmlhIGdtYWlsIHRoYXQgZG9lc24n
dCBoYXZlIHRoZXNlIGxpbWl0YXRpb25zPwoKT3Igc2hvdWxkIEkganVzdCBzd2l0Y2ggdG8gR2l0
bGFiIG9yIHNvPwoKSSB3aWxsIHVwZGF0ZSB0aGUgVXBzdHJlYW06IGFuZCByZS1zdWJtaXQuCgpB
bmQgdGhlIFJGQyAtIG9vcHMsIEkganVzdCBoYWQgdGhlIC0tcmZjIGZsYWcgb24gZm9yIHNvbWUg
cmVhc29uLgoKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3J0bDg4MjFjdS8wMDAxLWZpeC1idWls
ZC13aXRoLWxpbnV4LTcuMi5wYXRjaAo+ID4gYi9wYWNrYWdlL3J0bDg4MjFjdS8wMDAxLWZpeC1i
dWlsZC13aXRoLWxpbnV4LTcuMi5wYXRjaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGlu
ZGV4IDAwMDAwMDAwMDAuLjMxYTBjMzAxYzcKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3Bh
Y2thZ2UvcnRsODgyMWN1LzAwMDEtZml4LWJ1aWxkLXdpdGgtbGludXgtNy4yLnBhdGNoCj4gPiBA
QCAtMCwwICsxLDkxIEBACj4gPiArRnJvbTogQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBh
cGVydHVyZS51cz4KPiA+ICtEYXRlOiBTYXQsIDI5IEF1ZyAyMDI2IDAwOjAwOjAwIC0wNzAwCj4g
PiArU3ViamVjdDogW1BBVENIXSBGaXggYnVpbGQgd2l0aCBMaW51eCA3LjIKPiA+ICsKPiA+ICtM
aW51eCA3LjIgaGlkZXMgdGhlIFBQUG9FIGZsZXhpYmxlIGFycmF5IG1lbWJlcnMgZnJvbSBrZXJu
ZWwgY29kZS4gRGVyaXZlCj4gPiArdGhlIHRhZyBhbmQgdGFnLWRhdGEgYWRkcmVzc2VzIGZyb20g
dGhlaXIgZW5jbG9zaW5nIHN0cnVjdHVyZXMgaW5zdGVhZC4KPiA+ICsKPiA+ICtVcHN0cmVhbTog
Ti9BLCBiYXNlZCBvbiBmaXhlcyBmcm9tIHRoZSByZWxhdGVkIDg4eDJidSBkcml2ZXIKPgo+IFdo
eSBOL0E/IFlvdSBjYW5ub3Qgc3VibWl0IHRvIGh0dHBzOi8vZ2l0aHViL21vcnJvd25yLzg4MjFj
dS0yMDIxMDkxNiA/CgpIbW0sIEkgZ3Vlc3MgeWVzLCBJIHRoaW5rIG1lbnRhbGx5IEkgbWl4ZWQg
dGhpcyB1cCB3aXRoCmh0dHBzOi8vZ2l0aHViLmNvbS9haXJjcmFjay1uZy9ydGw4ODEyQVUKCndo
aWNoIGhhcyBhICJUSEVTRSBEUklWRVJTIElTIERFUFJFQ0FURUQuIiBub3RpY2UgYW5kIGFyZW4n
dCBtZXJnaW5nIFBScwoKQnV0IC0gdGhlIG1vcnJvd25yIG9uZSAtIEkgc3VwcG9zZSBpcyBzdGls
bCBtYWludGFpbmVkIGFuZCB3b3VsZCBhY2NlcHQgdGhlIFBSLgoKU3VibWl0dGVkOiBodHRwczov
L2dpdGh1Yi5jb20vbW9ycm93bnIvODgyMWN1LTIwMjEwOTE2L3B1bGwvMjEzCgpUaGFua3MsCkNo
cmlzdGlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
