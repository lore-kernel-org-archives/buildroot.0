Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91101C46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 20:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4372583DAB;
	Tue, 30 Jan 2024 20:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4372583DAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oGY5O6gajwLl; Tue, 30 Jan 2024 20:15:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C07283DA3;
	Tue, 30 Jan 2024 20:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C07283DA3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E33F1BF340
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 20:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0698A83DA3
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 20:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0698A83DA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qE7yzePUmQTB for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 20:15:30 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D0B683CDB
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 20:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D0B683CDB
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33b01484cd7so88540f8f.0
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 12:15:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706645728; x=1707250528;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fMVojXt1PpS8i7nA3Z3UrsBVCeu56X1liD182oEves8=;
 b=mH+p1km7CeO/wEQy0nUIBTxLxwR68XlHAXLRTTlAAa/mjEjtekSV9I0J9z5vpUpg8X
 Us+UzrBDw+cSnH0l7IVcywL26pt2mDFfjK6LRJJppipGQrI3Bbakw8Hw8JyyznhoyqDm
 LSKCwyfnNxkD6ZukMdmvCtaTCbPzd991ptHrJ6DY6HdUykhOf8qz7ejJBcxdPIUIGxa3
 fZr+HHHgHtiY7wy2Bod+td9bheLe2WeLFx6bkLbYgO/osUPvAe+JcqjWAtdCXPbGQSdL
 sDWuIe+5xQTmFc8GqOkxfiuCqTe2+E7MBtmkzEnxFN8RqYsmhfBwCCB7dit8lRD48/sR
 sNGw==
X-Gm-Message-State: AOJu0YzEFRv8EbcoMlUCM7oInI2SSyPGo8pm6TBkYPLPNueVnJUQGpSC
 8JYgl9cIxWOu5PV5XDmRun2VfjIJZZcK2Vns/imlytObpa2Ubk8BYLli59b0P/g=
X-Google-Smtp-Source: AGHT+IG4PreVU0jZpuVIDhEZlN3yNQV8dX1VFa/pj8pEgPegbcqHHRM4dsl79jNqyj2KYvgCj1C15Q==
X-Received: by 2002:adf:f644:0:b0:33a:e67f:cf8 with SMTP id
 x4-20020adff644000000b0033ae67f0cf8mr5475161wrp.20.1706645728163; 
 Tue, 30 Jan 2024 12:15:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ba1-20020a0560001c0100b0033ae593e830sm9058984wrb.23.2024.01.30.12.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 12:15:27 -0800 (PST)
Message-ID: <e8b25253-116d-4384-833b-a2702f58d3e8@mind.be>
Date: Tue, 30 Jan 2024 21:15:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: franco ariel <fran.millocs@live.com.ar>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <PH0PR19MB5409AC2F905D67341DDACED2D07A2@PH0PR19MB5409.namprd19.prod.outlook.com>
In-Reply-To: <PH0PR19MB5409AC2F905D67341DDACED2D07A2@PH0PR19MB5409.namprd19.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1706645728; x=1707250528; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fMVojXt1PpS8i7nA3Z3UrsBVCeu56X1liD182oEves8=;
 b=cESkdzy9vcWhu6R1UO1cWklLNCypGvprgHSW+Nv9M8QYM6eKRT4lAKsWEkn0q8fZ5B
 kP0LhFQcacIEVH70IcP46hjpmQwnPyxBjlNxIsT7TGub+gf+vor09Bhx37Y2CPox+OwD
 QmlfgX9Q+bXVxoTfBOkFM+GbNVBHMqW5v4NSGF3CEiq0b09kHLC754+8riwaZ+iLvZhL
 NxGXzwa6RgWG1OHfRI0kIXRb8tQrokuuQ0KMC8DqA5JnixVGQHuscLdEeq72vek4ldzM
 89tcSfqwru3cDfF1NE3VCX8ifFQiw1ggR3FCZizOEnZmrhIWnsoyO87cwTdzj8w/yIqb
 D0Rg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cESkdzy9
Subject: Re: [Buildroot] [help] Run flutter app on buildroot
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNS8wMS8yMDI0IDIyOjM1LCBmcmFuY28gYXJpZWwgd3JvdGU6Cj4gSGVsbG8gZXZlcnlv
bmUuCj4gCj4gSSdtIGtpbmRhIG5ldyBvbiBidWlsZHJvb3QsIEkgYmVlbiBwbGF5aW5nIGFuZCB3
b3JraW5nIHdpdGggaXQgYXJvdW5kIGZvciAxIHdlZWsgCj4gYW5kIG5vdywgSSB3YW50IHRvIHN0
YXJ0IGJ1aWxkaW5nLgo+IAo+IFRoZSBsYXN0IDMgZGF5cyBJIHdhcyB0cnlpbmcgdG8gcnVuIGFu
IEFwcEltYWdlIEJ1bmRsZSBvZiBhIHZlcnkgc2ltcGxlIEZsdXR0ZXIgCj4gYXBwIGluIG15IFJw
aTQsIGFuZCBJIHdhc24ndCBhYmxlIHRvIG1ha2UgaXQgcnVuLCBhZnRlciBhZGRpbmcgZGVwZW5k
ZW5jaWVzLCAKPiBsaWJyYXJpZXMsIGV0Yy4gwqBJIGp1c3QgZ2V0Ogo+ID0+IMKgZ3RrLXdhcm5p
bmcgKiogY2Fubm90IG9wZW4gZGlzcGxheQoKICBJIGRvbid0IGtub3cgYW55dGhpbmcgYWJvdXQg
Zmx1dHRlciwgYnV0IHRoaXMgZXJyb3IgbG9va3MgbGlrZSBpdCBleHBlY3RzIGFuIFggCnNlcnZl
ciB0byBiZSBydW5uaW5nLCB3aGljaCBpcyBjbGVhcmx5IG5vdCB0aGUgY2FzZSBoZXJlLiBZb3Un
bGwgbmVlZCB0byAKY29uZmlndXJlIGJ1aWxkcm9vdCB0byBpbnN0YWxsIGFuIFggc2VydmVyLCBz
dGFydCB0aGUgWCBzZXJ2ZXIsIGFuZCBtYWtlIHN1cmUgCnRoZSBESVNQTEFZIGVudmlyb25tZW50
IHBvaW50cyB0byBpdCAodHlwaWNhbGx5ICJleHBvcnQgRElTUExBWT06MCIgc2hvdWxkIGJlIApl
bm91Z2gpLgoKCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gU28sIEhvdyBjYW4gSSBtYWtlIGl0
IHdvcms/IG8gSSBoYXZlIHRvIHN0aWxsIHRyeWluZyB0byBtYWtlIGl0IHJ1biBpbiB0aGlzIHdh
eSAKPiBvciBzaG91bGQgSSBidWlsZCB0aGUgYXBwIHdpdGggTWFrZSBhdCB0aGUgbW9tZW50IG9m
IGJ1aWxkcm9vdCBjb21waWxlPwo+IAo+IAo+IFRoYW5rIHlvdSwKPiBGcmFuY28KPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
