Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A56C624D4
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 21:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0A4B405E7;
	Wed,  2 Sep 2026 21:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwZR3ujZR7xk; Wed,  2 Sep 2026 21:39:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B957E405F9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788385155;
	b=Mp36nJVPydNcwDGpra3c6JQpj0TZ80FdjCDbaqW/MGrcAjIN+6MBweax/a02l2Op5OiZ
	 v9lmg+exp7LJWbogLkWn06pUbfL48QlG+VwBbUHYOQO3hof8iMU668q9loeqG9t/ssODT
	 O1yqiknb1plN2Rw3jgQyoMWEH+7MLAevdQItGF9JIE96AAiwqDPeTiZBfWg9FSAXDKJks
	 AOXempvJ5ZMDdQiqQv+fn3RqxqAVF+w0trEuZXU3TVpUXpebupE3Dfg8iKNk87JeMrBU0
	 ChXOs0F61y854ynwn+NWDSazKgZfmDqkU/MIwZNBXf+p+F97aRWjhCekb8TWn3QokvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788385155;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UM21bW3DtNlKUE4OnAAvAgZffujd5weJVdV9vL1E3QE=;
	b=LAv/LZAejVVyfbsxf6pgR67QgxZvFYEzPjYSc8QqoCxmGJLzHNDSQeE987tkj/ugtTFJ
	 qUA0Hw20wbPN8OmXOBzTcSjN3j1AdyOE5BgcFDBUaNnUVBgpjP2cr9Bcnw89HbZrnMNyx
	 47vOElA4+y2Ww86ZdMMsTpclgD5nR+/RLBsNVCcyeXClt4FOLMd5E1mjpiPthtLjdbhPi
	 /fzm39zctIAEAd2kHOvJU3w36yOwLPkv4pqhcRBqyl+xEZf7NvHVx7o4daUXXp3EasOqt
	 +Lvff8IXIrB4aHbb4OHSMldQ86JMwv9PhfqwSfLBSZPZaxtVgR8clU5s0pF9A2OcAiQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788385155;
	bh=UM21bW3DtNlKUE4OnAAvAgZffujd5weJVdV9vL1E3QE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eny54SHWjmDmXQnA0d7opIbucAa4xVeuy494SLZc3KwXOP1zMKwNm52sjYD2miKl8
	 SoHNlNnWTfWt9kcZLEap4hv8UyIB1lcPHV3CEguLc4CRy0fCLJAEW+wnmxQWutMeUW
	 FgpNkDI1BGTfIT2XUi1O0Io/mDSIXRHNUNNbifgLmNKjl/WxcZO3exEMH/YiEsbK0m
	 gw+5A2JdUSlkpVF9D5iwIGgatpJKVxHxENA0pu4m/uFmxPRG2uauc87HjJKAizfirv
	 0LJCsluZ/QEF8fB8ISA9e4Sr3t28Dnqs676itlICWGsRi+LqOqkl6WI2XwDsewPAvW
	 rHWx+XtSUMZog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B957E405F9;
	Wed,  2 Sep 2026 21:39:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED67A1D9
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 21:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D30FD810BE
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 21:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QTZBS3Uu2_jD for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 21:39:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9FDB1810A6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788385154;
 b=bbYDUZDvN4Zj5T4IOZ9aeHLk+sGj9tSUgntpqVtLT2DvU46S+E1lAHbt+Ow/bh3Ew1t0
 kexewVAppVk6ctOWtzbUM8Nm9i3mRBn0Vcxiyh47co9tGqIS8+/Xguh0QdCAFln16xLF3
 wZd63hYyVpf0q2WcxqQZk+C5jVsCh+ouI4l2AQp5IvA1fsegGVtoanBksb/nE9iAbBuqY
 H3RKc05nQYqmdiKgwGn4NcfPPIpi2QREQT0PmHW5fzVzEfbd4Bi38H5V7jMmT5afa4XdA
 J7U1gA8GyXumVSTNbdRw+2y4GhzK2RaVJewq+vwqb2H/z4xD3iMc8eCFvyMeHwv6I/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788385154;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=6EPCL1hgzqc723V34VZS8XkE8lmPXt78qgyBDCEyEcs=;
 b=HNd4SKHevLsZaLvpeNSBVT2YjMZHqnf5vlfAeH+JIJNEi1pG3zh7MxFI6XfVZbSHb2AE
 ecK2FHzUEpW343GgK4pppT0/DGVBzL0qlvXmzv0F3VmcEYZE+yg0qXZTrfU0Fv10ILner
 90qVMD/nqZlfpXo6rspAePzVbJTtSf2kTUf0EFwpD8FmEuzEQKYCKnj0O8Z5KO/NZxcjn
 fuLeDCpDPEE6R2cPB4RzJdOSimQHp9si/BRQphhkFCWvmLQpV2JaKMyKFt3h+Ko5ZCs4u
 b2zSdsRP1ZdEQ3+mpg0oQbZqH1kuwI2UcHRiZEuXozy1n7HpAZWRdb0Is8u6+m0OBvw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=smile.fr; 
 dkim=pass header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=oEyAxJLC; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FDB1810A6
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 21:39:13 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-484362f5c4aso1692060f8f.3
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 14:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788385151; x=1788989951;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6EPCL1hgzqc723V34VZS8XkE8lmPXt78qgyBDCEyEcs=;
 b=H+go6TsHKK636Xz3Jh6ptt+sSGgVQlSXM6BdvFjsaqUTCHIRZIp9lVcZj66t7yh610
 J0ATG8m+mAYJu/ZtZYhOZDbaBbUemOVqg6XB9a1GF3c+m6QMPGvuWS5Qu/FvnbEswDm2
 km5KBPBgSOWiEexToTFBTXhL/uoHs+7JpsNXIUKzuUjl66qEbPZbPV40ABr1GGcYxI8v
 l7m0/VpGLj1UW8UmCMKEhvQsksNpnT7nXcG6kLiG+ETlJiyHsC9re41S6NbcXMP+RxuR
 vq/x/oDJPOKBjXuHgqJ9a6Cl1TS28RCwFJMNkJrvYbZTMcPpMR1wQZPmqWH+ZqN2J3W0
 tYCg==
X-Forwarded-Encrypted: i=1;
 AKwUvByrHZoSXEzcVslzJ0e1T6YorjyKiGggQMtnEAmGR1SNhF5s+Vb7kOzFVQdIDEffkT6ZWc73/7bjPPA=@buildroot.org
X-Gm-Message-State: AFuF++kmo9eTOLsBTCbc/CgKah+AXtcOh/ZMngNyrkex6aa9m6GARhjM
 yQa7nOofyhqZuPvKlTD7qrwmKiYdR0HpD99AHfgjhRrnnfrWg6igq6aepS4zscLglL4=
X-Gm-Gg: AYBFou23BZO19z/MG3oKAtjEjQr1OwGaTnpRSgh+0zQlcfTOf15wER0UD4DC1NHGdE1
 uo7C6VFMGkpF0q8kdNe1NF97HPnSD9279nLZzWKYF6cCy2/9m9VHvzvM2IwcA2teQg2Lu0MTveN
 +UvR9RFIPOMq79XP41uuI225o/We3ZM4jehUHdKKTVdM1SEpZhfpzt/JfI61ydAB3My7zyEv46O
 +wztC261Npyt44koTJgHcZQ4ZVE6iQSwAbuY+kQmmE+G1Z1fA7yiL4hmGYBtud5Vs+SpPIJuywD
 3lN67N42GziLiOhlrYlU78Kt1rhk4aGlggDcjCIMHwyU7IC61s5JFZEbh4otAT2mWLGCuMrIdMh
 efJU7jFFqHT3nHCyoFpKgbZsd3AGQD/db9Bk7G5taHR2dtHwPqVL4jlUCEhK/MAGlbcM7dEarUU
 TaFC+Bi7tJ0HpZypkH4iYHRI8pxAOpTCcyNHzwPu7RaVgjFfhSwU5e1kQdhbesKTXSOOr0QS6Cr
 adk10/n6JFMa8tl5UYPNTVGxOHAS94pRA2dN+N2yUsFf97bN9fbJus5clzp7h/fzdlWDvM6E6K7
 5kjy7eiDMkUV4RSzAxGMn2lq0j8=
X-Received: by 2002:adf:e196:0:b0:484:3310:c4fe with SMTP id
 ffacd0b85a97d-484913bc0b7mr16274851f8f.25.1788385151125; 
 Wed, 02 Sep 2026 14:39:11 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448eea961sm8937342f8f.28.2026.09.02.14.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 14:39:10 -0700 (PDT)
Message-ID: <65952c2a-8c52-4e5c-b185-5c6f19452194@smile.fr>
Date: Wed, 2 Sep 2026 23:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christopher Obbard <chris.obbard@oss.qualcomm.com>, buildroot@buildroot.org
Cc: Christopher Obbard <obbardc@gmail.com>
References: <20260831-wip-obbardc-package-dtui-fix-armv5-v2-0-42eceaa12f55@oss.qualcomm.com>
 <20260831-wip-obbardc-package-dtui-fix-armv5-v2-2-42eceaa12f55@oss.qualcomm.com>
Content-Language: fr
In-Reply-To: <20260831-wip-obbardc-package-dtui-fix-armv5-v2-2-42eceaa12f55@oss.qualcomm.com>
Subject: Re: [Buildroot] [PATCH v2 2/2] package/dtui: require 64-bit atomic
 support
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2hyaXN0b3BoZXIsIEFsbCwKCkxlIDMxLzA4LzIwMjYgw6AgMTc6NDksIENocmlzdG9w
aGVyIE9iYmFyZCB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gZHR1aSBkZXBlbmRzIG9uIHR1
aS10ZXh0YXJlYSB3aGljaCB1bmNvbmRpdGlvbmFsbHkgaW1wb3J0cyBBdG9taWNVNjQgaW4KPiBz
cmMvd2lkZ2V0LnJzIHRvIHBhY2sgYSB2aWV3cG9ydCByZWN0YW5nbGUgaW50byBhIHNpbmdsZSBh
dG9taWMgd29yZDoKPiAKPiAgIHVzZSBzdGQ6OnN5bmM6OmF0b21pYzo6e0F0b21pY1U2NCwgT3Jk
ZXJpbmd9Owo+ICAgcHViIHN0cnVjdCBWaWV3cG9ydChBdG9taWNVNjQpOwo+IAo+IEFzIHRoZXJl
IGlzIG5vIGNmZyh0YXJnZXRfaGFzX2F0b21pYykgZ3VhcmQgaW4gdHVpLXRleHRhcmVhLCBpdHMK
PiBidWlsZCBmYWlscyBvbiBhbnkgdGFyZ2V0IGZvciB3aGljaCBydXN0YyBkb2VzIG5vdCBwcm92
aWRlIDY0LWJpdAo+IGF0b21pY3Mgd2l0aDoKPiAKPiAgIENvbXBpbGluZyB0dWktdGV4dGFyZWEg
djAuNy4wCj4gICBlcnJvcltFMDQzMl06IHVucmVzb2x2ZWQgaW1wb3J0IGBzdGQ6OnN5bmM6OmF0
b21pYzo6QXRvbWljVTY0YAo+ICAgICAtLT4gLi4uL2R0dWktMy4wLjAvVkVORE9SL3R1aS10ZXh0
YXJlYS9zcmMvd2lkZ2V0LnJzOjEwOjI1Cj4gICAgICB8Cj4gICAxMCB8IHVzZSBzdGQ6OnN5bmM6
OmF0b21pYzo6e0F0b21pY1U2NCwgT3JkZXJpbmd9Owo+ICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICBeXl5eXl5eXl4gbm8gYEF0b21pY1U2NGAgaW4gYHN5bmM6OmF0b21pY2AKPiAgICAg
IHwKPiAgIGhlbHA6IGEgc2ltaWxhciBuYW1lIGV4aXN0cyBpbiB0aGUgbW9kdWxlCj4gICAgICB8
Cj4gICAxMCAtIHVzZSBzdGQ6OnN5bmM6OmF0b21pYzo6e0F0b21pY1U2NCwgT3JkZXJpbmd9Owo+
ICAgMTAgKyB1c2Ugc3RkOjpzeW5jOjphdG9taWM6OntBdG9taWNVMzIsIE9yZGVyaW5nfTsKPiAK
PiBUaGlzIGhhcyBiZWVuIHJlcG9ydGVkIHRvIHR1aS10ZXh0YXJlYSB1cHN0cmVhbSwgYnV0IHVu
Zm9ydHVuYXRlbHkgdGhlCj4gcHJvamVjdCBzZWVtcyB0byBiZSB1bm1haW50YWluZWQgKGlzc3Vl
IGxpbmtlZCBiZWxvdykuIEEgc2FuZSB3b3JrYXJvdW5kCj4gaXMgdG8gZGlzYWJsZSB0aGUgcGFj
a2FnZSBvbiB0YXJnZXRzIHdoaWNoIGxhY2sgNjQtYml0IGF0b21pYyBzdXBwb3J0LAo+IHdoaWNo
IGlzIGV4YWN0bHkgd2hhdCBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9IQVNfQVRPTUlD
XzY0CgpBcyBkaXNjdXNzZWQgaW4gdGhlIGZpcnN0IHBhdGNoOiBCUjJfUEFDS0FHRV9IT1NUX1JV
U1RDX0FSQ0hfSEFTX0FUT01JQ19VNjQKCj4gZGVzY3JpYmVzOiBpdCBpcyBuIGZvciBhcm12NXRl
LXVua25vd24tbGludXgte2dudSxtdXNsfWVhYmkgYW5kCj4gcG93ZXJwYy11bmtub3duLWxpbnV4
LWdudSwgdGhlIG9ubHkgcnVzdCB0YXJnZXRzIEJ1aWxkcm9vdCBjYW4gZ2VuZXJhdGUKPiB3aGlj
aCBsYWNrIDY0LWJpdCBhdG9taWNzLCBhbmQgeSBldmVyeXdoZXJlIGVsc2UuCj4gCj4gVGhlIHNh
bWUgcHJvYmxlbSB3YXMgaGl0IGJ5IHBhY2thZ2UvZHVzdCBhbmQgd29ya2VkIGFyb3VuZCBpbiBj
b21taXQKPiAzYWJjM2I5N2JhZDkgKCJwYWNrYWdlL2R1c3Q6IGJ1bXAgdG8gdmVyc2lvbiAxLjEu
MiIpIGJ5IGJ1bXBpbmcgdG8gYQo+IHZlcnNpb24gaW4gd2hpY2ggdXBzdHJlYW0gaGFkIGFkZGVk
IHRoZSBtaXNzaW5nIGd1YXJkLiBUaGF0IGlzIG5vdCBhbgo+IG9wdGlvbiBoZXJlIGFzIHR1aS10
ZXh0YXJlYSAwLjcuMCBpcyB0aGUgbGF0ZXN0IHJlbGVhc2UuCj4gCj4gTm90ZSB0aGF0IGEgcnVu
dGltZSB0ZXN0IGZvciBkdHVpIGNhbm5vdCB1c2UgdGhlIGRlZmF1bHQKPiBpbmZyYS5iYXNldGVz
dC5CQVNJQ19UT09MQ0hBSU5fQ09ORklHLCBzaW5jZSB0aGF0IGJ1aWxkcyB3aXRoCj4gQlIyX1RP
T0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FSTVY1X0VBQklfR0xJQkNfU1RBQkxFLCB3aGVyZSBk
dHVpIGlzIG5vdwo+IGRpc2FibGVkOyBzdWNoIGEgdGVzdCB3b3VsZCBuZWVkIGFuIGFybXY3IG9y
IGFhcmNoNjQgdG9vbGNoYWluIGluc3RlYWQuCgpXZSBoYXZlIGEgZmV3IHRlc3QgY2FzZSB0aGF0
IGFyZSB1c2luZyBhbiBhcm12NyBvciBhYXJjaDY0IGFyY2hpdGVjdHVyZS4KV2UgYWN0dWFsbHkg
cGxhbiB0byBzd2l0Y2ggdGhlIEJ1aWxkcm9vdCB0ZXN0c3VpdGUgdG8gdGhlIGFhcmNoNjQgYXJj
aGl0ZWN0dXJlCmJ5IGRlZmF1bHQuCgpBIHJ1bnRpbWUgdGVzdCBmb3IgZHR1aSBpcyB3ZWxjb21l
IQoKPiAKPiBCdWlsZCB0ZXN0ZWQgd2l0aCB1dGlscy90ZXN0LXBrZyBhZ2FpbnN0Ogo+IC0gQlIy
X1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FSTVY1X0VBQklfR0xJQkNfU1RBQkxFCj4gLSBC
UjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fQVJNVjVfRUFCSV9NVVNMX1NUQUJMRQo+IC0g
QlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX1BPV0VSUENfRTUwME1DX0dMSUJDX1NUQUJM
RQo+IAo+IGFsbCB0aHJlZSBmYWlsIHdpdGggdGhlIGFib3ZlIGVycm9yIGJlZm9yZSB0aGlzIGNo
YW5nZSBhbmQgYXJlIHNraXBwZWQKPiBhZnRlciBpdCwgd2hpbGUgYXJtdjcgKGdsaWJjIGFuZCBt
dXNsKSwgYWFyY2g2NCwgcG93ZXJwYzY0bGUgYW5kIHg4Ni02NAo+IHN0aWxsIHNlbGVjdCBhbmQg
YnVpbGQgdGhlIHBhY2thZ2UuCj4gCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3JoeXNkL3R1
aS10ZXh0YXJlYS9pc3N1ZXMvNjYKPiBGaXhlczogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm9yZy9yZXN1bHRzLzE4OGY2NDQyMzcxNTAwNzMxNDUzZjc1OTgzNTkwYzkyMmVhYjZkNTcKPiBG
aXhlczogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2UyNTRkYjI2NTRm
MThmMWQyMTEwZWI4YjFhMzJiNDNhZDBmMmEzZDYKCldpdGggQlIyX1BBQ0tBR0VfSE9TVF9SVVNU
Q19BUkNIX0hBU19BVE9NSUNfVTY0IHVwZGF0ZWQ6CgogIFJldmlld2VkLWJ5OiBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBPYmJhcmQgPGNocmlzLm9iYmFyZEBvc3MucXVhbGNvbW0u
Y29tPgo+IC0tLQo+ICBwYWNrYWdlL2R0dWkvQ29uZmlnLmluIHwgMiArKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZHR1aS9Db25m
aWcuaW4gYi9wYWNrYWdlL2R0dWkvQ29uZmlnLmluCj4gaW5kZXggNjVkNTFkZjdkNS4uYWVlNzE5
YTYzZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2R0dWkvQ29uZmlnLmluCj4gKysrIGIvcGFja2Fn
ZS9kdHVpL0NvbmZpZy5pbgo+IEBAIC0zLDYgKzMsOCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfRFRV
SQo+ICAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBP
UlRTCj4gIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMgIyBkYnVzCj4gIAlk
ZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgZGJ1cwo+ICsJIyB0dWktdGV4dGFyZWEgdW5jb25kaXRp
b25hbGx5IHVzZXMgQXRvbWljVTY0Cj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVT
VENfVEFSR0VUX0hBU19BVE9NSUNfNjQKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9EQlVTICMgcnVu
dGltZQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfUlVTVEMKPiAgCWhlbHAKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
