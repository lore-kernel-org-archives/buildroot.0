Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87D7E748E5
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 404ED41B93;
	Sat, 30 Sep 2023 19:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 404ED41B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XKckvUI5Wqgh; Sat, 30 Sep 2023 19:52:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E98A41807;
	Sat, 30 Sep 2023 19:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E98A41807
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FB101BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81300417B6
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81300417B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vdh57Nw7kHTZ for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:51:59 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BD7C417AB
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BD7C417AB
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4065dea9a33so17067165e9.3
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 12:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696103517; x=1696708317;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t3Mr5/oDkDn1Ol2C4mPbfYZgMNkbThMcNNwLzT11ypI=;
 b=d9KqIuzoKbsYy161jdIxyEP0/vE6lOCmXIUNl5JDgZenmeSS2N1dclXVb9aA6CfBrO
 y9Gjyy3F9cfaIUfpSlrbHwZy8gOBmkMC2qLIqx5XYQltNph4YDu3tTSeIMzcc49fFMYC
 mMHUlOvZE7M94hrA5ajeIrm+JE/YvFqZgN6QYxZZbZ/y7BENUnutG3PfIBQf76Dawli+
 xrm31VYRaeiiTn66jkeVhrPr4qsBoC9uwuVJf9XweHK/W+AobPkKJlwtU0f/0z6tnoqn
 r7qF5pWXodGJjzfCgEO7qc+N39S0khLKl0DonkHZGi2q8cFJQDO5K+6gv5bqchz0nooG
 01jA==
X-Gm-Message-State: AOJu0Yzy79beELcvsBYeQiZKsLBmoAUc7f/WgYfN9FPcXMeZpxynKHR1
 B0pEEq4gxYNlxWo8rRjbc0iG6g==
X-Google-Smtp-Source: AGHT+IGgsKyaH/YxwpkmkL59lbuffjK3qc+GbaHu+2KR11rnGwlHMQJP7ryN63QbGu0EP8/0qM7YxA==
X-Received: by 2002:a7b:c419:0:b0:405:4002:825a with SMTP id
 k25-20020a7bc419000000b004054002825amr6519246wmi.13.1696103516836; 
 Sat, 30 Sep 2023 12:51:56 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264?
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a1c6a15000000b0040641a9d49bsm3970892wmc.17.2023.09.30.12.51.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 12:51:56 -0700 (PDT)
Message-ID: <82538d9b-4326-0566-be9b-4fbc62fe708d@mind.be>
Date: Sat, 30 Sep 2023 21:51:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220809094109.2279598-1-james.hilliard1@gmail.com>
 <507e45e1-3a75-536a-8e8a-7f9b997b6974@mind.be>
 <CADvTj4pekaH4L-VhJXxLsBWhH25Z6iG+D=D5Ap9F2VgHfUrvsw@mail.gmail.com>
 <69be23ee-2902-033b-0e8d-1b2624a32d97@mind.be>
 <CADvTj4ogVg+_3xJxTvEDV9CxCq3Fa2J-M63Y9-ET6wCbT3_iZg@mail.gmail.com>
In-Reply-To: <CADvTj4ogVg+_3xJxTvEDV9CxCq3Fa2J-M63Y9-ET6wCbT3_iZg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696103517; x=1696708317; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t3Mr5/oDkDn1Ol2C4mPbfYZgMNkbThMcNNwLzT11ypI=;
 b=VTgWXqCKiQS1F4qB0E4nyKBf+4YIyemf9Sm80lPuO63CJuuPuPalDcC++3Bv5lacCd
 lKijaz9fFn3IZihJC/72lAg5S//7tpbU4HSZZ6Zlrrii8OskraQoTMT5z+xYfKCYaKqC
 tyH7q4qbw8TPIPSP8aOEoexUVI52m/prUa/IYGMeE1kYU7gtiHuBgsljtQmMrCQmzYcO
 XjhAGSb6I5pYDilU/6/81Z5XgFRzD55VQEhdHBrpk75uWq9mA7IZl9mrzoWQmRgZt3Cq
 PwIpJScM7mnup2X8jo854EXlGFevtwRHjtAcw3ntkr/SkZ41LpgMECNnAleM8ags4UNb
 4WLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VTgWXqCK
Subject: Re: [Buildroot] [PATCH 1/2] package/gcc/gcc-bpf: add BPF target
 support
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
Cc: "Jose E . Marchesi" <jose.marchesi@oracle.com>,
 David Faust <david.faust@oracle.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAzMC8wOS8yMDIzIDE5OjU3LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBPbiBTYXQsIFNl
cCAzMCwgMjAyMyBhdCAxMDoyNuKAr0FNIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWlu
ZC5iZT4gd3JvdGU6Cj4+Cj4+ICAgIEhpIEphbWVzLAo+Pgo+PiBPbiAzMC8wOS8yMDIzIDE3OjU2
LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPj4+IE9uIFNhdCwgU2VwIDMwLCAyMDIzIGF0IDk6MDbi
gK9BTSBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IHdyb3RlOgoKW3NuaXBd
Cj4+ICAgIGxpYmMgaXNuJ3QgYnVpbHQgZm9yIEJQRiBzbyB0aGVyZSB3b3VsZCBiZSBubyBwb2lu
dCBkZXBlbmRpbmcgb24gaXQuCj4gCj4gSXNuJ3QgbGliYyBuZWVkZWQgYnkgZ2NjIGl0c2VsZj8K
CiAgTm90IHJlYWxseS4gaG9zdC1nY2MtZmluYWwgZGVwZW5kcyBvbiBsaWJjIGJlY2F1c2UgaXQg
ZGVmYXVsdHMgdG8gbGlua2luZyB3aXRoIApsaWJjIHNvIGl0IG5lZWRzIHRvICJzZWUiIGl0LiBC
dXQgaXQncyBub3QgcmVhbGx5IHVzZWQgYnkgZ2NjLgoKICBUaGUgIi1ub25lIiBwYXJ0IG9mIHRo
ZSB0dXBsZSBicGYtYnVpbGRyb290LW5vbmUgaW5kaWNhdGVzIHRoYXQgaXRzIGEgCmZyZWVzdGFu
ZGluZyBjb21waWxlciwgd2l0aG91dCBsaWJjLgoKW3NuaXBdCj4+ICAgIEkgdGhpbmsgaXQncyBh
IG1pc3Rha2UgdG8gdGhpbmsgb2YgZ2NjLWJwZiBhcyBwYXJ0IG9mIHRoZSB0b29sY2hhaW4uIEV2
ZW4gaWYKPj4geW91IGJ1aWxkIHN5c3RlbWQgd2l0aCBnY2MsIHlvdSBjYW4gc3RpbGwgZWFzaWx5
IHVzZSBjbGFuZy1icGYgdG8gYnVpbGQgdGhlIEJQRgo+PiBzdHVmZi4gVGhpcyBhbHJlYWR5IGlu
ZGljYXRlcyB0aGF0IHRoZSBicGYgY29tcGlsZXIgaXMgbm90IHBhcnQgb2YgdGhlCj4+IHRvb2xj
aGFpbi4gWW91IGNvdWxkIGFsc28gY29tcGFyZSBpdCB0byB0aGUgdGktY2d0LXBydSBjb21waWxl
ciBmb3IgdGhlIFBSVQo+PiBjb250cm9sbGVyOiBpdCdzIGp1c3QgYSBjb21waWxlciBmb3Igc29t
ZXRoaW5nIGVsc2UgdGhhbiBvdXIgdGFyZ2V0LCBzbyBpdCBoYXMKPj4gbm8gcmVhbCByZWxhdGlv
bnNoaXAgd2l0aCB0aGUgdG9vbGNoYWluLgo+IAo+IEhtbSwgc28gaG9zdC1jbGFuZyBhbHNvIGhh
cyBhIHRvb2xjaGFpbiB3cmFwcGVyIGZyb20gdGhlIGxvb2tzIG9mIGl0LAoKICBZZXMsIGJlY2F1
c2UgaG9zdC1jbGFuZyBidWlsZHMgZm9yIHRoZSB0YXJnZXQuIE5vdywgY2xhbmcgb2YgY291cnNl
IGFsd2F5cyAKaW5jbHVkZXMgYWxsIGl0cyBiYWNrZW5kcywgc28geW91IGNhbiBhY3R1YWxseSB1
c2UgaXQgdG8gYnVpbGQgZm9yIGFueSB0YXJnZXQuIApJZiB5b3UgdXNlIGl0IGZvciBhIGRpZmZl
cmVudCB0YXJnZXQgdGhhbiB0aGUgYnVpbGRyb290IHRhcmdldCwgaXQncyB2ZXJ5IHdlbGwgCnBv
c3NpYmxlIHRoYXQgc29tZSBvZiB0aGUgb3B0aW9ucyBpbmplY3RlZCBieSB0aGUgdG9vbGNoYWlu
IHdyYXBwZXIgd291bGQgY3JlYXRlIApjb25mbGljdHMgb3Igb3RoZXIgcHJvYmxlbXMuCgo+IEkn
bSBjb25mdXNlZAo+IHdoeSB0aGF0IHdvdWxkIG5lZWQgb25lIGFuZCB0aGlzIHdvdWxkbid0LgoK
ICBCZWNhdXNlIGhvc3QtY2xhbmcgYnVpbGRzIGZvciB0aGUgc2FtZSB0YXJnZXQgYXMgaG9zdC1n
Y2MtZmluYWwgKGZvciAKYnVpbGRyb290J3MgbWFpbiB0YXJnZXQpLiBJZiB3ZSBzdGFydCB1c2lu
ZyBob3N0LWNsYW5nIHRvIGJ1aWxkIGZvciBCUEYsIHdlIAppZGVhbGx5IHNob3VsZG4ndCB1c2Ug
dGhlIHdyYXBwZXIuIEF0IGxlYXN0LCBJIHRoaW5rIHNvLgoKCj4gSSdtIG5vdCBzdXJlIGhvdyB0
aS1jZ3QtcHJ1IGNvbXBhcmVzIGluIHRoaXMgY2FzZSBzaW5jZSBnY2MtYnBmIGlzCj4gY29tcGls
aW5nIGNvZGUKPiB0byBydW4gb24gb3VyIHRhcmdldCBDUFUuCgogIE5vIGl0IGRvZXNuJ3QuIEl0
IGNvbXBpbGVzIGNvZGUgdG8gQlBGLCB3aGljaCBpcyBieXRlY29kZS4gVGhhdCBieXRlY29kZSBp
cyAKYXJjaGl0ZWN0dXJlLWluZGVwZW5kZW50LiBJdCBnZXRzIGludGVycHJldGVkIGJ5IHRoZSBr
ZXJuZWwgKGFuZCBKSVQtY29tcGlsZWQgdG8gCm1hY2hpbmUgY29kZSkuIEl0J3MgY29tcGFyYWJs
ZSB3aXRoLCBzYXksIFdlYkFzc2VtYmx5LgoKPiBBIGNsYW5nL2xsdm0gdG9vbGNoYWluIGNhbiB0
YXJnZXQgYm90aCBicGYgYW5kIG91cgo+IHByaW1hcnkgQ1BVIGFyY2hpdGVjdHVyZSB3aXRoaW4g
dGhlIHNhbWUgdG9vbGNoYWluIGFzIHdlbGwuCgogIFllcywgSSBhZ3JlZSB0aGF0IHRoZSBmYWN0
IHRoYXQgY2xhbmcgY2FuIHRhcmdldCBhbGwgYXJjaGl0ZWN0dXJlcyB3aXRoIHRoZSAKc2FtZSBi
dWlsZCBtYWtlcyB0aGluZ3MgYSBiaXQgY29uZnVzaW5nLgoKICBSZWdhcmRzLAogIEFybm91dAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
