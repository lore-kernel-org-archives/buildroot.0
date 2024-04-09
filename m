Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23409CD1284
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 11:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0603402E5;
	Tue,  9 Apr 2024 11:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0h4DJLQpjZXy; Tue,  9 Apr 2024 11:41:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7CCB409F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7CCB409F3;
	Tue,  9 Apr 2024 11:41:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D82E21BF3BB
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 11:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D28F2409F3
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 11:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EBYJkOS6h1Z for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 11:41:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A9AA9402E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9AA9402E5
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9AA9402E5
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 11:41:54 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d6fc3adaacso68455391fa.2
 for <buildroot@buildroot.org>; Tue, 09 Apr 2024 04:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712662912; x=1713267712;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RAZd0zxg9xbro7iyZh33Iqh1zdCFgpaUeOxpbjh5oA8=;
 b=q3ZPaD/OsGjp3ZiaIcbo3edwPiby7XPExb597jiGpETSSEV7cWYqihUYu5r/u//eL2
 ixJzNj96QwJWmpdI895Cnff2JNvzSbNuIPOVIriljtpxA00WKouhj+WcNf10MljxzMwA
 Y9Ak1609RTsYvuyUmTlBXVSZ4ZQzOXecdOErbqIapYnCTfsl5ukse5V1d8qWaFHSzGjS
 eewNoOHeHB+7MTlQB8gxHxIktWQQhcqO4zJHpqgxGSPwJfBlTyxbZvm5QSh+UfX+YS5p
 SyaTooSqNhEYglsHuksIJx/Pt6byx59xOyKYgQ1pizCxe3mKHX+SJ1GcYe7C+HNjGA0V
 SLhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN0f0Zp+aj+2u997rMiYp4Jcgw8OwUqwYVBJ/svblLOMvwBOq/FYAIuWwTr5Er6lpfalM+oAQQAkVkCcmeXJtyYFHIlyZ1OQ==
X-Gm-Message-State: AOJu0YxZLFwiZH2aM/wroGRr5hlpiAr+p8t87uSXwB4/jte/pWRPQw7n
 4BF9qPTRnjNw0BZM1NnwPtgiINmP5aRF45+PTYLbHV8CKDDJ0p735b2HvxpvzTU=
X-Google-Smtp-Source: AGHT+IFepQ0dcVtTxfpBOcgINXr0xnKsFs5TZz2n/2fiFnVvgyLMAu6cj8xfjN3YLRcFZwYHcVh/hg==
X-Received: by 2002:a2e:b0fc:0:b0:2d8:87e2:3a4a with SMTP id
 h28-20020a2eb0fc000000b002d887e23a4amr3959196ljl.27.1712662911930; 
 Tue, 09 Apr 2024 04:41:51 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c35c600b004163703fd6asm1479684wmq.1.2024.04.09.04.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 04:41:51 -0700 (PDT)
Message-ID: <6b190dc9-239e-4451-8283-67c38534eacf@smile.fr>
Date: Tue, 9 Apr 2024 13:41:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <20240407103512.1112712-10-romain.naour@smile.fr>
 <61d88146-6450-4d59-9865-9f38babb2a27@mind.be>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <61d88146-6450-4d59-9865-9f38babb2a27@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712662912; x=1713267712;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RAZd0zxg9xbro7iyZh33Iqh1zdCFgpaUeOxpbjh5oA8=;
 b=beI6HfnUfhKVtFlmKX005nTnuoeR6htN4unzACWLrTaEkoVZaOl5qGZNKydYjBvyAs
 e34smntFuPl87n9ptVZnStla4jjFCunP82gGj7CXRSLAZxZhttoPETQ1LGDLYDyXWBlE
 ZQg7bcqT2aNXBJNoYQUURdQPD2Ljh0zRqG4/an4Zw9l4wVtZhnuhH60ECUqXMFHBn2WQ
 aLMZjOnqCDouW9ixWd64/CE/VtVayAcOhtWOc0DYzYVO+dnGuAeiOagwgjCda18y+3Pi
 Shar3PeZ5P/NFZRA+IzuGTbyedSX5o+lMNH7t4OQQ5fEpqdi1RZQ7dczvN4YgXQ24Kgd
 KfpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=beI6HfnU
Subject: Re: [Buildroot] [PATCH v12 09/16] board/ti/am62x-sk: generalize
 post-build.sh
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LAoKTGUgMDgvMDQvMjAyNCDDoCAxNToyNSwgQXJub3V0IFZhbmRlY2FwcGVs
bGUgYSDDqWNyaXTCoDoKPiAKPiAKPiBPbiAwNy8wNC8yMDI0IDEyOjM1LCBSb21haW4gTmFvdXIg
d3JvdGU6Cj4+IEZyb206IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29s
dXRpb25zLmNvbT4KPj4KPj4gUmVtb3ZpbmcgYW55IGV4cGxpY2l0IHJlZmVyZW5jZSB0byB0aGUg
dGlfYW02Mnhfc2tfZGVmY29uZmlnCj4+IGNvbmZpZ3VyYXRpb24sIHRoZSBzY3JpcHQgY2FuIGFs
c28gYmUgdXNlZCBieSBvdGhlciBjb25maWd1cmF0aW9ucyBvciBhdAo+PiBsZWFzdCBieSB0aV9h
bTY0eF9za19kZWZjb25maWcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxk
YXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cj4+IC0tLQo+Pgo+PiBBZGRlZCBpbiB2
OAo+PiAtLS0KPj4gwqAgYm9hcmQvdGkvYW02Mngtc2svcG9zdC1idWlsZC5zaCB8IDEwICsrKysr
KystLS0KPiAKPiDCoEtlZXBpbmcgaW4gbWluZCB0aGUgYWJvdmUgcmVtYXJrIHRoYXQgaXQgY2Fu
IGJlIHJldXNlZCBmb3IgdGlfYW02NHgsIHBlcmhhcHMKPiBtb3ZlIGl0IHRvIGJvYXJkL3RpL2Nv
bW1vbiBvciBib2FyZC90aS9jb21tb24tYW02eCBvciBzb21ldGhpbmcgbGlrZSB0aGF0Pwo+IAo+
IMKgU2FtZSBmb3IgdGhlIGhhc2ggZmlsZXMgQlRXLgo+IAo+IMKgRm9yIG1lIGl0J3MgZmluZSB0
byBhcHBseSBhcyBpcyBhbmQgY2xlYW4gdGhpcyB1cCBhZnRlcndhcmRzLgo+IAo+PiDCoCBjb25m
aWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZ8KgwqAgfMKgIDIgKy0KPj4gwqAgMiBmaWxlcyBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9i
b2FyZC90aS9hbTYyeC1zay9wb3N0LWJ1aWxkLnNoIGIvYm9hcmQvdGkvYW02Mngtc2svcG9zdC1i
dWlsZC5zaAo+PiBpbmRleCA0ZjE5ZjRkNmNmLi5kMDY2ZTI4ZmQwIDEwMDc1NQo+PiAtLS0gYS9i
b2FyZC90aS9hbTYyeC1zay9wb3N0LWJ1aWxkLnNoCj4+ICsrKyBiL2JvYXJkL3RpL2FtNjJ4LXNr
L3Bvc3QtYnVpbGQuc2gKPj4gQEAgLTEyLDggKzEyLDggQEAgRU9GCj4+IMKgwqDCoCBleGl0IDEK
Pj4gwqAgfQo+PiDCoCAtbz0nYzpkOnI6eDonCj4+IC1PPSdjb25zb2xlOixkZXZpY2V0cmVlOixy
b290OixleHRyYS1hcmdzOicKPj4gK289J2M6ZDpsOnI6eDonCj4+ICtPPSdjb25zb2xlOixkZXZp
Y2V0cmVlOixsYWJlbDoscm9vdDosZXh0cmEtYXJnczonCj4+IMKgIG9wdHM9IiQoZ2V0b3B0IC1u
ICIkezAjIyovfSIgLW8gIiR7b30iIC1sICIke099IiAtLSAiJHtAfSIpIgo+PiDCoCBldmFsIHNl
dCAtLSAiJHtvcHRzfSIKPj4gwqAgd2hpbGUgWyAkeyN9IC1ndCAwIF07IGRvCj4+IEBAIC0yNCw2
ICsyNCw5IEBAIHdoaWxlIFsgJHsjfSAtZ3QgMCBdOyBkbwo+PiDCoMKgwqDCoMKgICgtZHwtLWRl
dmljZXRyZWUpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBERVZJQ0VUUkVFPSIkezJ9Ijsgc2hpZnQg
Mgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgOzsKPj4gK8KgwqDCoCAoLWx8LS1sYWJlbCkKPj4gK8Kg
wqDCoMKgwqDCoMKgIExBQkVMPSIkezJ9Ijsgc2hpZnQgMgo+PiArwqDCoMKgwqDCoMKgwqAgOzsK
Pj4gwqDCoMKgwqDCoCAoLXJ8LS1yb290KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgUk9PVD0iJHsy
fSI7IHNoaWZ0IDIKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIDs7Cj4+IEBAIC0zOCw2ICs0MSw3IEBA
IGRvbmUKPj4gwqAgwqAgWyAtbiAiJHtDT05TT0xFfSIgXSB8fCBkaWUgIk1pc3NpbmcgXGBjb25z
b2xlJyBhcmd1bWVudCIKPj4gwqAgWyAtbiAiJHtERVZJQ0VUUkVFfSIgXSB8fCBkaWUgIk1pc3Np
bmcgXGBkZXZpY2V0cmVlJyBhcmd1bWVudCIKPj4gK1sgLW4gIiR7TEFCRUx9IiBdIHx8IGRpZSAi
TWlzc2luZyBcYGxhYmVsJyBhcmd1bWVudCIKPj4gwqAgWyAtbiAiJHtST09UfSIgXSB8fCBkaWUg
Ik1pc3NpbmcgXGByb290JyBhcmd1bWVudCIKPj4gwqAgYXBwZW5kPSJjb25zb2xlPSR7Q09OU09M
RX0gcm9vdD0ke1JPT1R9IHJ3IHJvb3Rmc3R5cGU9ZXh0NCByb290d2FpdCIKPj4gwqAgaWYgWyAt
biAiJHtFWFRSQV9BUkdTfSIgXTsgdGhlbgo+PiBAQCAtNDYsNyArNTAsNyBAQCBmaQo+PiDCoCDC
oCBta2RpciAtcCAiJHtCSU5BUklFU19ESVJ9Igo+PiDCoCBjYXQgPDwtX19IRUFERVJfRU9GID4g
IiR7QklOQVJJRVNfRElSfS9leHRsaW51eC5jb25mIgo+PiAtwqDCoMKgIGxhYmVsIGFtNjJ4LXNr
LWJ1aWxkcm9vdAo+PiArwqDCoMKgIGxhYmVsICR7TEFCRUx9Cj4gCj4gwqBBRkFJSyB0aGUgbGFi
ZWwgaXMgY29tcGxldGVseSBtZWFuaW5nbGVzcyB3aGVuIHlvdSB1c2UgZXh0bGludXguY29uZiBm
cm9tCj4gVS1Cb290LiBJdCdzIHVzZWQgYXMgdGhlIG1lbnUgZW50cnkgaW4gdGhlIGV4dGxpbnV4
IGJvb3Rsb2FkZXIsIGJ1dCBpbiBVLUJvb3QgSQo+IHRoaW5rIGl0J3MganVzdCB0aGUgZmlyc3Qg
b25lIHdoaWNoIGdldHMgY2hvc2VuLCB3aXRob3V0IG1lbnUuIEFuZCByZWdhcmRsZXNzLAo+IHdl
IGhhdmUgb25lIGVudHJ5IGFueXdheS4gU28gY2FuJ3Qgd2UganVzdCBzZXQgdGhlIGxhYmVsIHRv
ICJidWlsZHJvb3QiPwo+IAo+IMKgSWYgd2UgZG8gc2V0IGEgbGFiZWwsIEkgd291bGQgdXNlIEJS
Ml9UQVJHRVRfR0VORVJJQ19IT1NUTkFNRSBpbnN0ZWFkIG9mIGFkZGluZwo+IHlldCBhbm90aGVy
IG9wdGlvbiBpbiB0aGUgcG9zdC1idWlsZCBzY3JpcHQuCgpJJ2xsIGtlZXAgdGhpcyBhcyBpcyBp
biBvcmRlciB0byBtZXJnZSB0aGlzIHNlcmllcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+
IMKgUmVnYXJkcywKPiDCoEFybm91dAo+IAo+PiDCoMKgwqDCoMKgwqDCoCBrZXJuZWwgL0ltYWdl
Cj4+IMKgwqDCoMKgwqDCoMKgIGZkdGRpciAvCj4+IMKgwqDCoMKgwqDCoMKgIGRldmljZXRyZWUg
LyR7REVWSUNFVFJFRX0KPj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29u
ZmlnIGIvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPj4gaW5kZXggZDRiMTllNTAzOS4u
MWM3MDg1ZDA0ZCAxMDA2NDQKPj4gLS0tIGEvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcK
Pj4gKysrIGIvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPj4gQEAgLTMsNyArMyw3IEBA
IEJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl82PXkKPj4gwqAgQlIyX0dM
T0JBTF9QQVRDSF9ESVI9ImJvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMiCj4+IMKgIEJSMl9ET1dO
TE9BRF9GT1JDRV9DSEVDS19IQVNIRVM9eQo+PiDCoCBCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NS
SVBUPSJib2FyZC90aS9hbTYyeC1zay9wb3N0LWJ1aWxkLnNoIgo+PiAtQlIyX1JPT1RGU19QT1NU
X0JVSUxEX1NDUklQVF9BUkdTPSItYyB0dHlTMiwxMTUyMDBuOCAtZCBrMy1hbTYyNS1zay5kdGIg
LXIKPj4gL2Rldi9tbWNibGsxcDIgLXggZWFybHljb249bnMxNjU1MGEsbW1pbzMyLDB4MDI4MDAw
MDAiCj4+ICtCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUX0FSR1M9Ii1jIHR0eVMyLDExNTIw
MG44IC1kIGszLWFtNjI1LXNrLmR0YiAtbAo+PiBhbTYyeC1zay1idWlsZHJvb3QgLXIgL2Rldi9t
bWNibGsxcDIgLXggZWFybHljb249bnMxNjU1MGEsbW1pbzMyLDB4MDI4MDAwMDAiCj4+IMKgIEJS
Ml9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9InN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIK
Pj4gwqAgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVF9BUkdTPSItYyBib2FyZC90aS9hbTYy
eC1zay9nZW5pbWFnZS5jZmciCj4+IMKgIEJSMl9MSU5VWF9LRVJORUw9eQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
