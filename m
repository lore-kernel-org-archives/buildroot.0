Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A4CC3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 19:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E80D94017A;
	Fri, 19 Jul 2024 19:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsgDkBVsO99J; Fri, 19 Jul 2024 19:08:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BA004039D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BA004039D;
	Fri, 19 Jul 2024 19:08:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F85D1BF366
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 19:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BDF940CDF
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 19:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JczVsoteSyYM for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 19:08:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E298D40CC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E298D40CC7
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E298D40CC7
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 19:08:33 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0468so31275311fa.0
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 12:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721416111; x=1722020911;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lur2XRIV4o+c4pFdRvzQf6+pnQh24uWN0kK9fPS1t/o=;
 b=oXKa6X81t+F6A8SX2NOx7Aei4ocSeexIbZHolaffANGWfVepbQEl9eaC4wF4VxKF0B
 Yu7nHY97v7e5MYge95tZfdFo548wPizGWKA/MV6wM6mdoZR7+YygHXPIXn9/qJoJ4X2L
 J/n2paYpNanQsKDg1y5kNoy9y3E6sX8FG5KnPfoOGvfFghWGFedJNkXQ5gIkfKdxmmoc
 6tU6wEkV8ckYCRU5EOLD4KgTKNSwQLp/SNwWrPqnYLrSeAkgs5vdjYfELK4wA08lqKJe
 1Oj6RxOZJtVaY9sIu2mbpNbf/3Ic8/xShuAptUZb3kJl3Mv38Fu8U/rcft9AvDa8beFh
 938g==
X-Forwarded-Encrypted: i=1;
 AJvYcCULBgJXEQSIBfzt6ePkZ7VVjQQwJ3EyfjQbAQQ7+exR/wKYY6OQn8zNdXk0NTG156ZUIAtKdg7E6e6YL5f2HoUgSd1Uu9xYXA==
X-Gm-Message-State: AOJu0Yz3aGiycEwrBnd71yp2zBA9/SQvApBxhKqeX9oIQBN4PfjvGRxd
 OszQIjkwKKmlI+GGPV+hCzgkcPDDrm2w/2+kx6RS96FiA+cZAFA5DJSSpjSzHtg=
X-Google-Smtp-Source: AGHT+IFkQIdv/Y4bFguqqY3Lb9k2ePsQmR59smtwZQeDLaz5r/uiBywT5QHf2FKlh5S+3jWwCv348A==
X-Received: by 2002:a2e:8ed2:0:b0:2ec:543a:b629 with SMTP id
 38308e7fff4ca-2ef168268d8mr4073851fa.34.1721416110884; 
 Fri, 19 Jul 2024 12:08:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ecec0sm2291340f8f.105.2024.07.19.12.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 12:08:30 -0700 (PDT)
Message-ID: <09beb77e-0006-4caa-8d14-bc227929e518@mind.be>
Date: Fri, 19 Jul 2024 21:08:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rajnesh Joshi <rajnesh_joshi@sfu.ca>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <YT2PR01MB4239F7AA538B4C2B46B13D7EF7A12@YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM>
Content-Language: en-GB
In-Reply-To: <YT2PR01MB4239F7AA538B4C2B46B13D7EF7A12@YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721416111; x=1722020911; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Lur2XRIV4o+c4pFdRvzQf6+pnQh24uWN0kK9fPS1t/o=;
 b=gKLIyrCYQ/Aumx24cVGXSclHDlMoxfUBgJlMCgqIjPFksrU2OKBZ23FFXp984SjKrO
 oqNf5rQEPMrKfvMwtePgLaKEC8/g8lcW3FYM762qeu9uBo0VNQfxr6LvOPYRbgjtuLj7
 4TpaWl4zkVosjNH6kEfTVdm4Og43xXpWUTH5W3TvQymQOLwVR4Sv5epNv2+CEJHjPqbN
 f4YOMS5KzaaXgIvgOP9F91eJpMA7FeE/3q3G/FPO4j92qpvDKbxFev2yasDRPmd73377
 +uvoVkq2uZaPe0Ws14CPVT6R1PJhtiQe7duQIxgT6zCUv9eTNN+UZc3IX3QiCGAIEFR1
 qxsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gKLIyrCY
Subject: Re: [Buildroot] 32-bit RISCV build error
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

CgpPbiAxNS8wNy8yMDI0IDIyOjU5LCBSYWpuZXNoIEpvc2hpIHdyb3RlOgo+ICpJIGFtIHJlc2Vu
ZGluZyB0aGlzIGVtYWlsIGFzIEJ1aWxkcm9vdCBBdXRvbWF0ZWQgRW1haWwgdG9sZCBtZSB0aGF0
IEkgd2FzIG5vdCAKPiBzdWJzY3JpYmVkIHRvIHRoZSBtYWlsaW5nIGxpc3QsIGFuZCB0aGVyZWZv
cmUsIGNvdWxkIG5vdCBzZW5kIHRvIGl0LiBJIAo+IGRvdWJsZS1jaGVja2VkLCBhbmQgSSBhbSBh
IHBhcnQgb2YgdGhlIG1haWxpbmcgbGlzdCwgYnV0IHRoaXMgZW1haWwgdGVjaG5pY2FsbHkgCj4g
aGFzIHR3byBhbGlhc2VzIHNvIEkgYWRkZWQgdGhlIG90aGVyIG9uZS4gTGV0J3MgdHJ5IHRoaXMg
YWdhaW4uIFNvcnJ5IGZvciB0aGUgCj4gZG91YmxlIG1lc3NhZ2UgaW4gY2FzZS4qCj4gCj4gRGVh
ciBNYWlsaW5nIExpc3QgUmVhZGVycywKPiAKPiBJIGFtIHRyeWluZyB0byBidWlsZCBhIDMyLWJp
dCBMaW51eCBLZXJuZWwgdXNpbmcgdGhlIHx1Y2xpYmN84oCLwqBsaWJyYXJ5IGZvciBhIAo+IHNv
ZnQtY29yZSBDUFUsIHVzaW5nIGEgY3VzdG9tIExpbnV4IGZvcmsuCj4gCj4gSW4gbXkgfC5jb25m
aWd84oCLLCBJIGhhdmUgdGhlIGZvbGxvd2luZyBsaW5lczogfEJSMl9UT09MQ0hBSU5fR0NDX0FU
X0xFQVNUXzEyPXl84oCLIAo+IHdoaWNoIEkgYmVsaWV2ZSBpcyB0aGUgcGF0Y2ggZm9yIHRoaXMg
aXNzdWUsIGJ1dCBpdCBpcyBub3Qgd29ya2luZyBmb3Igc29tZSByZWFzb24uCj4gCj4gSSBhbSBn
ZXR0aW5nIHRoZSBmb2xsb3dpbmcgZXJyb3JzIHdoZW4gQnVpbGRyb290IGNvbXBsZXRlcyBkb3du
bG9hZGluZyB0aGUgTGludXggCj4gS2VybmVsIGFuZCBiZWdpbnMgYnVpbGRpbmcgdGhlIExpbnV4
IGtlcm5lbC4KPiAKPiAKPiAKPiBUbyBwcm92aWRlIG1vcmUgY29udGV4dCwgaGVyZSBpcyBteSBk
ZWZjb25maWcgZm9yIHRoZSAiYm9hcmQuIgo+IAo+IC9CUjJfcmlzY3Y9eS8KPiAvQlIyX3Jpc2N2
X2N1c3RvbT15Lwo+IC9CUjJfUklTQ1ZfSVNBX1JWTT15Lwo+IC9CUjJfUklTQ1ZfSVNBX1JWQT15
Lwo+IC9CUjJfUklTQ1ZfSVNBX1JWQz1uLwo+IC9CUjJfUklTQ1ZfMzI9eS8KPiAvIyBCUjJfUklT
Q1ZfVVNFX01NVSBpcyBub3Qgc2V0Lwo+IC9CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNf
Q1VTVE9NXzVfMD15Lwo+IC9CUjJfRVhUUkFfR0NDX0NPTkZJR19PUFRJT05TPSItLXdpdGgtYXJj
aD1ydjMyaW1hX3ppY3NyX3ppZmVuY2VpIi8KPiAvQlIyX1dHRVQ9IndnZXQgLS1wYXNzaXZlLWZ0
cCAtbmQgLXQgMyIvCj4gL0JSMl9ST09URlNfT1ZFUkxBWT0iYm9hcmQvbGl0ZXhfdmV4cmlzY3Yv
cm9vdGZzX292ZXJsYXkiLwo+IC9CUjJfTElOVVhfS0VSTkVMPXkvCj4gL0JSMl9MSU5VWF9LRVJO
RUxfQ1VTVE9NX0dJVD15Lwo+IC9CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9SRVBPX1VSTD0iaHR0
cHM6Ly9naXRodWIuY29tL2xpdGV4LWh1Yi9saW51eC5naXQiLwo+IC9CUjJfTElOVVhfS0VSTkVM
X0NVU1RPTV9SRVBPX1ZFUlNJT049IjEwYWIxYzczNTRhM2QwZTNiMGQwNGZmMDg1MGEwZjVlZmYw
NjM5YmQiLwo+IC9CUjJfTElOVVhfS0VSTkVMX1BBVENIPSJwYXRjaGVzIi8KPiAvQlIyX0xJTlVY
X0tFUk5FTF9VU0VfQ1VTVE9NX0NPTkZJRz15Lwo+IC9CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9D
T05GSUdfRklMRT0iYm9hcmQvbGl0ZXhfdmV4cmlzY3YvbGludXguY29uZmlnIi8KPiAvQlIyX1BB
Q0tBR0VfQlVTWUJPWF9DT05GSUc9InBhY2thZ2UvYnVzeWJveC9idXN5Ym94LmNvbmZpZyIvCgog
IFdpdGggdGhpcyBkZWZjb25maWcsIEkgY291bGQgcmVwcm9kdWNlIHRoZSBpc3N1ZS4gQnkgcGFz
c2luZyAKQlIyX0RFQlVHX1dSQVBQRVI9MSBpbiB0aGUgZW52aXJvbm1lbnQgSSBjb3VsZCBzZWUg
dGhlIG9wdGlvbnMgd2l0aCB3aGljaCBnY2MgaXMgCmNhbGxlZCBieSB0aGUga2VybmVsLCBhbmQg
dGhlcmUgaXMgYSAtbWFyY2g9cnYzMmltYSBpbiB0aGVyZS4gSWYgSSByZXBlYXQgdGhlIApzYW1l
IGNvbXBpbGF0aW9uIGNvbW1hbmQgd2l0aG91dCB0aGF0IC1tYXJjaCwgdGhhdCBvbmUgZmlsZSBh
dCBsZWFzdCBidWlsZHMgCndpdGhvdXQgZXJyb3IuCgogIFNvIHlvdSBzaG91bGQgdHJhY2UgZG93
biB3aHkgeW91ciBjdXN0b20ga2VybmVsIHBhc3NlcyB0aGUgd3JvbmcgLW1hcmNoIG9wdGlvbiAK
YW5kIGZpeCBpdC4gWW91IG1heSB3YW50IHRvIHVzZSBhIG1vcmUgcmVjZW50IGtlcm5lbCB2ZXJz
aW9uLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiAKPiBJIGFwcHJlY2lhdGUgYW55IGhlbHAu
IFRoYW5rIHlvdSEKPiAKPiAKPiBTaW5jZXJlbHksCj4gUmFqbmVzaCBKb3NoaQo+IAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
