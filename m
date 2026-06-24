Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BBECDE002
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 15:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53BCF60AB8;
	Wed, 24 Jun 2026 15:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjtcGRRE5BJj; Wed, 24 Jun 2026 15:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C40F60901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782315391;
	bh=yjHD4mmEOb3PUQHvqMPlOtae2YvLZwGLfjGZ5rEUj+w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IIqIyVl6Djs2OR9np1FPVrH7rVFWFO7DK/Um+D6BmBRAqQ7OcliWBvDNUXjkbp3Ou
	 7TnmxMQKQao8PLguuBlcP1HwV7th2nWHAcVK5hiWYzL+yveznIGZ8a5e8zb7ORu4yl
	 8Pdn00oS5ZUkbmbKK1ll8u8tVsRuYdcImk7Uk8P9JFvNjqW91ituohjrsJCxUIb2yA
	 rNGJB4DH1KMIPWC7mppj3Ruo8aD9PyS/ko6z8CwZfv10Xlq+3GRhapD3ZT9NioGDkz
	 5gKLO3yTxuBOVQzhOeBBmBEp3VT+Ajo7AQGheDXj4yH5u5iTYQGTUJ/mQWfeRgdPWr
	 JhyGpp6sRGJyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C40F60901;
	Wed, 24 Jun 2026 15:36:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D3817367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 15:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B91E540597
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 15:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kozKWbxM0bKl for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 15:36:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8FE1E40594
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FE1E40594
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FE1E40594
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 15:36:28 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45ef189aa1cso912478f8f.0
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 08:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782315386; x=1782920186;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+vTVP6Zc8lc6BCW6s68snnpm0JFWdYrEDmH+0QYzmiE=;
 b=CkSfExeZVcPoKquSbUhK/fFjojNfh9XCzyOWfnlj8KoQPCcJ2fTwgn/UPRUnIWTYFn
 2RfT6Apg6Fgs2lX+MLbJ8qOhMIkyqoju6mFSVcpIOgOF1Tj3lYfC4QzTi3E+0Tqb63KB
 qjlTqywVlt65xcaJWFRHYQl3u1SxKgmCP6OjGzs2wZ7SYrwJ+aesGJxix5m7p4Sjbe0Q
 szVw9AF5vZXku27OibJ4fc4gPy/8BmbGKunZysg7GYfbO5Y5jrXIITETIUjYv4a7NCmT
 Dby64R+Ib/lFTS1imZCu7FON3ZDRZ1ywg0Dog2qRBIuOfcutUZ0utbMxGhVcKuRgIBdT
 RYWg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/J/uWJiqjgxwXTcaid2UFJPQA4eqQvTSXMpUZUnahSNLrN1Yl5ahhOkyXoMb4PT/Raf+QP2UcPm2w=@buildroot.org
X-Gm-Message-State: AOJu0Yy7J//AP5t3e/3HmxFGGZt4VXpq0juOXFNCpKd67odP1CeHWAS9
 HS9AR3iI2AckhAzJ5npQhY52Q5VMo3iQcsYcF0w0D8DxoDGS2NsLWMSqvSUOJvJ0oC5sB8oMVm5
 JqfZ+
X-Gm-Gg: AfdE7cnvWYvXg63ffxqm01+T6By7GMGPlqsWwbxR70lB/vm3BtXKYb0JsAXKmqu4yRi
 6RsSbmnTMVz3y2vcQ4X9jz9HnXq9qviTr4Ny9hIR05Cg3Q3/SCVbfiNnp1YeXbSYYsuV7bemggH
 lDCJ1VgQKOELcHzv0ICmPh4SmU4hPgiNknBNjI1J4cNVPXLopCaWAbqzrpPwfa6ayKv9lxhB40b
 Cn7wNgXVnJxHYIctHpsyOTRH6N1gSwvNje+/StoEdShQVIAt5vkr7DvwShLVSd5GWuW0davrl6d
 Io+cWJdxsvUv2kLj6K1nR9OUduwKe9iWzHpX/EfT1+KbMZ69qfFfVCJd0PbnAZO4VbzxS56tUfc
 UK+CaYEjIaj4hlaNKsUC5shgQcsrUAAniLM+ZiKYL0oQ/tt5vrPuuJT7BhnduxZ3Q46S/rSv/sK
 0kEKpn/ERllaB+e/Z+6zNkcjCAyIQtZBmSaSGd1ccjtjDlcAaZ87/6n1TGFOq5pJ6VwoUWPm/MO
 7A0
X-Received: by 2002:a05:600c:c48e:b0:492:3773:a230 with SMTP id
 5b1f17b1804b1-49260878c12mr56249225e9.27.1782315386370; 
 Wed, 24 Jun 2026 08:36:26 -0700 (PDT)
Received: from [10.5.90.78]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46caa798f43sm3986471f8f.8.2026.06.24.08.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 08:36:26 -0700 (PDT)
Message-ID: <c0b29941-694e-4e9c-b848-b96a557bbdf9@smile.fr>
Date: Wed, 24 Jun 2026 17:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 buildroot@buildroot.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Romain Naour <romain.naour@gmail.com>
References: <20260527-master-v1-1-5ed351103b87@gmail.com>
Content-Language: fr, en-US
In-Reply-To: <20260527-master-v1-1-5ed351103b87@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782315386; x=1782920186; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+vTVP6Zc8lc6BCW6s68snnpm0JFWdYrEDmH+0QYzmiE=;
 b=2YnstD7rskOm5TJb6LGcqP2qICRteE5i0TCE7Ox+lBUWmuePV01q+1ePsjmih8D+qe
 40HFjVfSnf6oJnCfr/hencXrrvAg+/tN9F26QNTE1H/oUhcpIpsTOH9sHZBeX5e2Vzsb
 QhRET9dO8lgOyUBcoe2/11S/4IOrSZ8FC4tAs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=2YnstD7r
Subject: Re: [Buildroot] [PATCH] package/supertuxkart: remove obsolete
 dependencies
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

SGVsbG8gUmFwaGHDq2wsIEFsbCwKCkxlIDI3LzA1LzIwMjYgw6AgMjE6NDIsIFJhcGhhw6tsIEdh
bGxhaXMtUG91IGEgw6ljcml0wqA6Cj4gIC0gWG9yZyAvIFhMSUIgbm8gbW9yZSByZXF1aXJlZAo+
ICAtIEFsbG93IGJ1aWxkIGZvciBvdGhlciBhcmNoIHRoYW4gaTM4Ni94ODZfNjQKPiAgLSBMSUJH
TCBhbHNvIHJlbW92ZWQgc2luY2UgYnVpbHQgb24gdG9wIG9mCj4gICAgU0RMMiAod2hpY2ggY2Fu
IHByb3ZpZGUgRUdML0dMRVMgYmFja2VuZCkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBH
YWxsYWlzLVBvdSA8cmdhbGxhaXNwb3VAZ21haWwuY29tPgo+IC0tLQo+ICBwYWNrYWdlL3N1cGVy
dHV4a2FydC9Db25maWcuaW4gICAgICAgfCA5IC0tLS0tLS0tLQo+ICBwYWNrYWdlL3N1cGVydHV4
a2FydC9zdXBlcnR1eGthcnQubWsgfCAyIC0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTEgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3VwZXJ0dXhrYXJ0L0NvbmZpZy5pbiBi
L3BhY2thZ2Uvc3VwZXJ0dXhrYXJ0L0NvbmZpZy5pbgo+IGluZGV4IDBmNmMyNDQwNTgxOS4uODQw
NjFmZDRkN2QwIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvc3VwZXJ0dXhrYXJ0L0NvbmZpZy5pbgo+
ICsrKyBiL3BhY2thZ2Uvc3VwZXJ0dXhrYXJ0L0NvbmZpZy5pbgo+IEBAIC0xLDE0ICsxLDEwIEBA
Cj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9TVVBFUlRVWEtBUlQKPiAgCWJvb2wgInN1cGVydHV4a2Fy
dCIKPiAtCWRlcGVuZHMgb24gQlIyX0hPU1RBUkNIID0gIng4Nl82NCIgfHwgQlIyX0hPU1RBUkNI
ID0gIng4NiIKPiAtCWRlcGVuZHMgb24gQlIyX2kzODYgfHwgQlIyX3g4Nl82NAoKQnVpbGRyb290
IGNhbiB0YXJnZXQgc29tZSAidGlueSIgY3B1IHRhcmdldCwgbWF5YmUKQlIyX1BBQ0tBR0VfU1VQ
RVJUVVhLQVJUX0FSQ0hfU1VQUE9SVFMgY291bGQgYmUgaW50cm9kdWNlZCB0byBsaXN0IGFsbAph
cmNoaXRlY3R1cmVzIHdoZXJlIHN1cGVydHV4a2F0IGhhcyBiZWVuIHRlc3RlZD8KT3IgdXNlIHRl
c3QtcGtnIHRvIGNoZWNrIGlmIGl0IGJ1aWxkcyBjb3JyZWN0bHkuCgpBcmUgeW91IHRlc3Rpbmcg
b24gYSBhYXJjaDY0IGNwdT8KCj4gIAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgZm9yaygpCj4g
IAlkZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUCAjIG9wZW5hbAo+ICAJZGVwZW5kcyBv
biBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF85ICMgb3BlbmFsCj4gIAlkZXBlbmRzIG9uIEJS
Ml9UT09MQ0hBSU5fSEFTX1RIUkVBRFNfTlBUTCAjIG9wZW5hbAo+ICAJZGVwZW5kcyBvbiBCUjJf
UEFDS0FHRV9PUEVOQUxfQVJDSF9TVVBQT1JUUyAjIG9wZW5hbAo+IC0JZGVwZW5kcyBvbiBCUjJf
UEFDS0FHRV9IQVNfTElCR0wKClN1cGVydHV4a2FydCB3YXMgbWVyZ2VkIGludG8gQnVpbGRyb290
IGJlZm9yZSBCUjJfUEFDS0FHRV9TREwyX09QRU5HTCBvcHRpb24uCkl0IHNlZW1zIHdlIG1pc3Nl
ZCBhbiBvcHBvcnR1bml0eSB0byB1c2UgQlIyX1BBQ0tBR0VfU0RMMl9PUEVOR0wgaW5zdGVhZC4K
ClNpbmNlIFgxMSBpcyByZW1vdmVkLCBhcmUgeW91IHVzaW5nIFdheWxhbmQ/Ck1heWJlIEJSMl9Q
QUNLQUdFX1NETDJfV0FZTEFORCBzaG91bGQgYmUgdXNlZAoKCj4gLQlkZXBlbmRzIG9uIEJSMl9Q
QUNLQUdFX1hPUkc3CgpUaGlzIHNob3VsZCBiZSBkb25lIGluIGEgYW5vdGhlciBjb21taXQuCgo+
ICAJZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wKPiAgCXNlbGVjdCBCUjJfUEFD
S0FHRV9GUkVFVFlQRQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0VORVQKPiBAQCAtMjIsNyArMTgs
NiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfU1VQRVJUVVhLQVJUCj4gIAlzZWxlY3QgQlIyX1BBQ0tB
R0VfT1BFTlNTTCBpZiAhQlIyX1BBQ0tBR0VfTUJFRFRMUwo+ICAJc2VsZWN0IEJSMl9QQUNLQUdF
X09QRU5BTAo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX1NETDIKPiAtCXNlbGVjdCBCUjJfUEFDS0FH
RV9YTElCX0xJQlhSQU5EUgoKQ2FuIHlvdSBhZGQgYSBjb21tZW50IGFib3V0ICJYb3JnIC8gWExJ
QiBubyBtb3JlIHJlcXVpcmVkIj8gV2hlbiBJIHRlc3RlZApzdXBlcnR1eGthcnQgbGFzdCB0aW1l
LCBJIHdhcyB1c2luZyBYMTEgdy8gb3BlbkdMIHJ1bm5pbmcgZW5saWdodGVubWVudCBvbiBhCnJl
YWwgUEMuIFgxMSBkZXBlbmRlbmN5IHNlZW1zIHJlbGF0ZWQgdG8gdGhlIGJ1aWx0aW4gdmVyc2lv
biBvZiBpcnJsaWNodC4KCkNhbiB5b3UgZG91YmxlIGNoZWNrPwpJJ2xsIG1hcmsgdGhpcyBwYXRj
aCAiY2hhbmdlcyByZXF1ZXN0ZWQiLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gIAlzZWxlY3Qg
QlIyX1BBQ0tBR0VfWkxJQgo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0JMVUVaNV9VVElMU19QTFVH
SU5TX0hJRCBpZiBCUjJfUEFDS0FHRV9CTFVFWjVfVVRJTFMgJiYgQlIyX1RPT0xDSEFJTl9IRUFE
RVJTX0FUX0xFQVNUXzNfMTggIyBydW50aW1lCj4gIAloZWxwCj4gQEAgLTM0LDEzICsyOSw5IEBA
IGNvbmZpZyBCUjJfUEFDS0FHRV9TVVBFUlRVWEtBUlQKPiAgCSAgaHR0cDovL3N1cGVydHV4a2Fy
dC5zb3VyY2Vmb3JnZS5uZXQvTWFpbl9QYWdlCj4gIAo+ICBjb21tZW50ICJzdXBlcnR1eGthcnQg
bmVlZHMgYW4gT3BlbkdMIGJhY2tlbmQsIGEgdUNsaWJjIG9yIGdsaWJjIHRvb2xjaGFpbiB3LyBO
UFRMLCBDKyssIGdjYyA+PSA5Igo+IC0JZGVwZW5kcyBvbiBCUjJfSE9TVEFSQ0ggPSAieDg2XzY0
IiB8fCBCUjJfSE9TVEFSQ0ggPSAieDg2Igo+IC0JZGVwZW5kcyBvbiBCUjJfaTM4NiB8fCBCUjJf
eDg2XzY0Cj4gIAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VCj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNL
QUdFX09QRU5BTF9BUkNIX1NVUFBPUlRTCj4gLQlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1hPUkc3
Cj4gIAlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTX05QVEwgXAo+ICAJCXx8
ICFCUjJfSU5TVEFMTF9MSUJTVERDUFAgXAo+ICAJCXx8ICFCUjJfVE9PTENIQUlOX0dDQ19BVF9M
RUFTVF85IFwKPiAtCQl8fCAhQlIyX1BBQ0tBR0VfSEFTX0xJQkdMIFwKPiAgCQl8fCBCUjJfVE9P
TENIQUlOX1VTRVNfTVVTTAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N1cGVydHV4a2FydC9zdXBl
cnR1eGthcnQubWsgYi9wYWNrYWdlL3N1cGVydHV4a2FydC9zdXBlcnR1eGthcnQubWsKPiBpbmRl
eCAzNzdiOTY2OGExYjUuLjVmMTIyMDkyYjMyMiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3N1cGVy
dHV4a2FydC9zdXBlcnR1eGthcnQubWsKPiArKysgYi9wYWNrYWdlL3N1cGVydHV4a2FydC9zdXBl
cnR1eGthcnQubWsKPiBAQCAtMjMsMTQgKzIzLDEyIEBAIFNVUEVSVFVYS0FSVF9ERVBFTkRFTkNJ
RVMgPSBcCj4gIAloYXJmYnV6eiBcCj4gIAlqcGVnIFwKPiAgCWxpYmN1cmwgXAo+IC0JbGliZ2wg
XAo+ICAJbGlib2dnIFwKPiAgCWxpYnBuZyBcCj4gIAlsaWJzcXVpc2ggXAo+ICAJbGlidm9yYmlz
IFwKPiAgCW9wZW5hbCBcCj4gIAlzZGwyIFwKPiAtCXhsaWJfbGliWHJhbmRyIFwKPiAgCXpsaWIK
PiAgCj4gICMgU2luY2Ugc3VwZXJ0dXhrYXJ0IGlzIG5vdCBpbnN0YWxsaW5nIGxpYnN0a2lycmxp
Y2h0LnNvLCBhbmQgc2luY2UgaXQgaXMKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDogMDhmMzc1N2Iw
ZjIxMzNiMGVkNTBlMWVmM2Q3YTVhMWQ5YzgwZGUxYwo+IGNoYW5nZS1pZDogMjAyNjA1MjctbWFz
dGVyLTU5YTZmZDQ1NTVhYgo+IAo+IEJlc3QgcmVnYXJkcywKPiAtLSAgCj4gUmFwaGHDq2wgR2Fs
bGFpcy1Qb3UgPHJnYWxsYWlzcG91QGdtYWlsLmNvbT4KPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
