Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64E5C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E97981461;
	Tue,  4 Feb 2025 15:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8wmwB6q3W4U; Tue,  4 Feb 2025 15:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84E1A8164A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84E1A8164A;
	Tue,  4 Feb 2025 15:55:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B88B212A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A768160B44
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybHRuG03G4zl for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:55:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F2C860AE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F2C860AE1
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F2C860AE1
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:55:52 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38daf156e97so427804f8f.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 07:55:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738684550; x=1739289350;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NAlsAgbroqc4ukFXwSP2HHdy3jp0pbZiSMnNypbgTPg=;
 b=Tt59fe8VtzFnCJuRL2LPD7JGSagHP+FCTFJKrN9/Uy5vHEPy8sgTp7pTQNYj/hJTcK
 fm3CpOBhh1tNaapD+fqRARvKB3lj/yWT7RlAyp+ToU1LNlp/WO1un1GdteZVCksv67Jk
 BxRXw+GNzoz8aUXtWjSk2GFNtfhO9h43UiRGsj9FKQrVfsHHGdJNzIODOVCiJyeiKxkp
 A6Y0491i3rt3GSkcgQDm9P9r2HOxNbzKzbwVkBo+3y2YNSNAR+P25VMMARX0kgOd2ztM
 BukTMd9S/4saq0yPbemV2jLh11vVVucoKedpCmzip2ohSq80BI2uikmRumc66QrFS4PH
 Rq6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCVUZZDnPyyT6LlDQSmtmqXTUae2/pXl8RPmvDZ0KEiTcYUkDgOSAMipVvrsN3nOd135jZtfNZHgI=@buildroot.org
X-Gm-Message-State: AOJu0YydDBZnegaukV3r2Rnhf/pphoWl9UJRnQh64acFQNewqy4o+a2C
 mfLu7KsMPl1vFkv+fwWRUhi7Y31fEsyYGqa7DbxzXvI+6Yooq/BZsrHn8MS/K8A=
X-Gm-Gg: ASbGnctcvhSfsnRMuRDG/nR+9VJ10Aq6kIJFY/All4ut7d9p9U7kOhkzEsGceJ9xo62
 fFSeCFm7DxhWPfi2DNg48IwJ84mr3mhSYTS5TjiLvAc0fTTTeIlBmU3qn1cbCFOSsU7NHByfnl2
 7HuMwAWdRMEQ8LjYqhtZOtdvXdu3ECiZKS+y3nUTIaS16MFfqSHGDaIVwzJFpjNaLt7pm4mnBjK
 S09tGoe/lx2SLO9PUKVsJ/iOTl33BRKe3N3feAKbsdmG3oVpoRIQ5axLSWP2ZMQBULJjp/03yrk
 zbSxKGGERO8vJuCIcdj3oypsNBNNVzEw7wMRoUPFz0dWQGSRXwAcB8CB
X-Google-Smtp-Source: AGHT+IGH1xHkRpCuWSpCMinu9cpQp7KUJLYkan6RZsjYtW/OxEmO/aQ2vceHT49NqhrNSV+17/EV9Q==
X-Received: by 2002:a5d:47c5:0:b0:385:f092:e00 with SMTP id
 ffacd0b85a97d-38c520975b7mr21729067f8f.50.1738684550347; 
 Tue, 04 Feb 2025 07:55:50 -0800 (PST)
Received: from [172.16.2.119] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm228482625e9.37.2025.02.04.07.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 07:55:49 -0800 (PST)
Message-ID: <a54a9784-e374-4191-8199-f72ab54e2688@smile.fr>
Date: Tue, 4 Feb 2025 16:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>,
 buildroot@buildroot.org
Cc: Niklas Cassel <niklas.cassel@wdc.com>, =?UTF-8?Q?Ga=C3=ABl_PORTAY?=
 <gael.portay@rtone.fr>, Julien Grossholtz <julien.grossholtz@openest.io>,
 Fiona Klute <fiona.klute@gmx.de>, Michael Walle <michael@walle.cc>,
 Christian Stewart <christian@aperture.us>, Martin Bark <martin@barkynet.com>
References: <20240902203533.3961108-1-gael.portay@rtone.fr>
 <20240902203533.3961108-2-gael.portay@rtone.fr>
Content-Language: fr
In-Reply-To: <20240902203533.3961108-2-gael.portay@rtone.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738684550; x=1739289350; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NAlsAgbroqc4ukFXwSP2HHdy3jp0pbZiSMnNypbgTPg=;
 b=Bbq+oinhRb7kj1xUHwtuZktPMqOJxphP6+kw8SrKIrwAsYXRMZV+qnt5AvcqANLwvu
 4yShRlY8mX5AfpKNSXUnpVx1ADfsLxt+tyFC1ccfLMyBIMuzjI6PEzieqcr4mm1nLATp
 Opu5I6FgBeQQrhnrkV13n4p4nQc1DQNZjfn/8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Bbq+oinh
Subject: Re: [Buildroot] [PATCH 1/2] linux: add device-tree blob overlays
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

SGVsbG8gR2HDq2wsCgpMZSAwMi8wOS8yMDI0IMOgIDIyOjM1LCBHYcOrbCBQT1JUQVkgYSDDqWNy
aXTCoDoKPiBUaGUgZGV2aWNlLXRyZWUgYmxvYiBvdmVybGF5IGlzIGFuIHVwc3RyZWFtIGZlYXR1
cmU7IG9uZSBjYW4gYnVpbGQgYQo+IC5kdGJvIGZyb20gLmR0c28gdGhhbmtzIHRvIGNvbW1pdCAz
NjM1NDdkMjE5MWMgKGtidWlsZDogQWxsb3cgRFRCCj4gb3ZlcmxheXMgdG8gYnVpbHQgZnJvbSAu
ZHRzbyBuYW1lZCBzb3VyY2UgZmlsZXMpWzFdIChsaW51eC02LjEtcmMyKS4KPiAKPiBUaGlzIGlu
dHJvZHVjZXMgdGhlIHRocmVlIG5ldyBkdGJvIGNvbmZpZ3MgdG8gYnVpbGQgaW4tdHJlZSBvcgo+
IG91dC1vZi10cmVlIGR0Ym9zLCBhbmQgdG8ga2VlcCB0aGUgZGlyZWN0b3J5IG5hbWUuCj4gCj4g
VGhlIHRocmVlIGNvbmZpZ3MgYXJlIHRoZSBlcXVpdmFsZW50IHRvIGV4aXN0aW5nIGR0cyBjb25m
aWdzOgo+ICAtIEJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19PVkVSTEFZX05BTUVTIGlzIGVx
dWl2YWxlbnQgdG8KPiAgICBCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRSAoaXQgdGFr
ZXMgaW4tdHJlZSBmaWxlcyByZWxhdGl2ZSB0bwo+ICAgIGR0cyBkaXJlY3RvcnksIHdpdGhvdXQg
ZmlsZSBleHRlbnRpb246IGkuZS4gd2l0aG91dCAuZHRzKQo+ICAtIEJSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX0RUU19PVkVSTEFZX1BBVEggaXMgZXF1aXZhbGVudCB0bwo+ICAgIEJSMl9MSU5VWF9L
RVJORUxfQ1VTVE9NX0RUU19QQVRIIChpdCB0YWtlcyBvdXQtb2YtdHJlZSBmaWxlcyByZWxhdGl2
ZQo+ICAgIHRvIGJ1aWxkcm9vdCBkaXJlY3RvcnksIHdpdGggZmlsZSBleHRlbnRpb24gLmR0c28p
Cj4gIC0gQlIyX0xJTlVYX0tFUk5FTF9EVEJPX0tFRVBfRElSTkFNRSBpcyBlcXVpdmFsZW50IHRv
Cj4gICAgQlIyX0xJTlVYX0tFUk5FTF9EVEJfS0VFUF9ESVJOQU1FCj4gCj4gWzFdOiBodHRwczov
L2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0LzM2MzU0N2QyMTkxY2JjMzJjYTk1NGJh
NzVkNzI5MDg3MTIzOThmZjIKCkFzIGRpc2N1c3NlZCBkdXJpbmcgdGhlIEJ1aWxkcm9vdCBtZWV0
aW5nLCB0aGUgZGV2aWNldHJlZS10cmVlIG92ZXJsYXlzIHdpbGwgYmUKYWRkZWQgd2l0aCBhbm90
aGVyIHBhdGNoIHNlcmllcyB3aXRoIGEgc2xpZ2x0eSBkaWZmZXJlbnQgaW1wbGVtZW50YXRpb24g
dGhhdAphbHNvIHRha2UgaW50byBhY2NvdW50IHRoZSByZWNlbnQgaXNzdWUgd2l0aCBsYXRlc3Qg
a2VybmVscyA2LjEyLgoKUGxlYXNlLCByZWJhc2UgeW91ciBwYXRjaCAyLzIgd2hlbiB0aGUgZGV2
aWNldHJlZS10cmVlIG92ZXJsYXlzIGlzIG1lcmdlZC4KClRoYW5rcyEKCkJlc3QgcmVnYXJkcywK
Um9tYWluCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXlAcnRv
bmUuZnI+Cj4gLS0tCj4gIGxpbnV4L0NvbmZpZy5pbiB8IDI0ICsrKysrKysrKysrKysrKysrKysr
KysrKwo+ICBsaW51eC9saW51eC5tayAgfCAzNCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9saW51eC9Db25maWcuaW4gYi9saW51eC9Db25maWcuaW4KPiBpbmRleCA1MjZkZDlmZjAw
Li40MWY1ZWIyNzFkIDEwMDY0NAo+IC0tLSBhL2xpbnV4L0NvbmZpZy5pbgo+ICsrKyBiL2xpbnV4
L0NvbmZpZy5pbgo+IEBAIC00NDAsNiArNDQwLDMwIEBAIGNvbmZpZyBCUjJfTElOVVhfS0VSTkVM
X0RUQl9PVkVSTEFZX1NVUFBPUlQKPiAgCSAgQ2hvb3NlIHRoaXMgb3B0aW9uIHRvIHN1cHBvcnQg
RGV2aWNlIFRyZWUgb3ZlcmxheXMKPiAgCSAgb24gdGhlIHRhcmdldCBzeXN0ZW0uCj4gIAo+ICtj
b25maWcgQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX09WRVJMQVlfTkFNRVMKPiArCXN0cmlu
ZyAiSW4tdHJlZSBEZXZpY2UgVHJlZSBTb3VyY2UgT3ZlcmxheSBmaWxlIG5hbWVzIgo+ICsJZGVw
ZW5kcyBvbiBCUjJfTElOVVhfS0VSTkVMX0RUQl9PVkVSTEFZX1NVUFBPUlQKPiArCWhlbHAKPiAr
CSAgTmFtZSBvZiBpbi10cmVlIGRldmljZSB0cmVlIHNvdXJjZSBmaWxlLCB3aXRob3V0Cj4gKwkg
IHRoZSB0cmFpbGluZyAuZHRzLiBZb3UgY2FuIHByb3ZpZGUgYSBsaXN0IG9mCj4gKwkgIGR0cyBm
aWxlcyB0byBidWlsZCwgc2VwYXJhdGVkIGJ5IHNwYWNlcy4KPiArCj4gK2NvbmZpZyBCUjJfTElO
VVhfS0VSTkVMX0NVU1RPTV9EVFNfT1ZFUkxBWV9QQVRICj4gKwlzdHJpbmcgIk91dC1vZi10cmVl
IERldmljZSBUcmVlIFNvdXJjZSBPdmVybGF5IGZpbGUgcGF0aHMiCj4gKwloZWxwCj4gKwkgIFBh
dGhzIHRvIG91dC1vZi10cmVlIERldmljZSBUcmVlIFNvdXJjZSBPdmVybGF5ICguZHRzbykKPiAr
CSAgYW5kIERldmljZSBUcmVlIFNvdXJjZSBJbmNsdWRlICguZHRzaSkgZmlsZXMsIHNlcGFyYXRl
ZCBieQo+ICsJICBzcGFjZXMuIFRoZXNlIGZpbGVzIHdpbGwgYmUgY29waWVkIHRvIHRoZSBrZXJu
ZWwgc291cmNlcyBhbmQKPiArCSAgdGhlIC5kdHNvIGZpbGVzIHdpbGwgYmUgY29tcGlsZWQgZnJv
bSB0aGVyZS4KPiArCj4gK2NvbmZpZyBCUjJfTElOVVhfS0VSTkVMX0RUQk9fS0VFUF9ESVJOQU1F
Cj4gKwlib29sICJLZWVwIHRoZSBkaXJlY3RvcnkgbmFtZSBvZiB0aGUgRGV2aWNlIFRyZWUgT3Zl
cmxheSIKPiArCWRlcGVuZHMgb24gQlIyX0xJTlVYX0tFUk5FTF9EVEJfT1ZFUkxBWV9TVVBQT1JU
Cj4gKwloZWxwCj4gKwkgIElmIGVuYWJsZWQsIHRoZSBkZXZpY2UgdHJlZSBibG9iIG92ZXJsYXlz
IGtlZXAgdGhlaXIKPiArCSAgZGlyZWN0b3J5IHByZWZpeGVzIHdoZW4gdGhleSBnZXQgY29waWVk
IHRvIHRoZQo+ICsJICBvdXRwdXQgaW1hZ2UgZGlyZWN0b3J5IG9yIHRoZSB0YXJnZXQgZGlyZWN0
b3J5Lgo+ICsKPiAgZW5kaWYKPiAgCj4gIGNvbmZpZyBCUjJfTElOVVhfS0VSTkVMX0lOU1RBTExf
VEFSR0VUCj4gZGlmZiAtLWdpdCBhL2xpbnV4L2xpbnV4Lm1rIGIvbGludXgvbGludXgubWsKPiBp
bmRleCAxNmQ5ZjE5NDcwLi5kM2VhNDI3MzM2IDEwMDY0NAo+IC0tLSBhL2xpbnV4L2xpbnV4Lm1r
Cj4gKysrIGIvbGludXgvbGludXgubWsKPiBAQCAtMjAyLDYgKzIwMiwxOCBAQCBMSU5VWF9EVFNf
TkFNRSArPSAkKGJhc2VuYW1lICQoZmlsdGVyICUuZHRzLCQobm90ZGlyICQoY2FsbCBxc3RyaXAs
JChCUjJfTElOVVhfSwo+ICAKPiAgTElOVVhfRFRCUyA9ICQoYWRkc3VmZml4IC5kdGIsJChMSU5V
WF9EVFNfTkFNRSkpCj4gIAo+ICtpZmVxICgkKEJSMl9MSU5VWF9LRVJORUxfRFRCX09WRVJMQVlf
U1VQUE9SVCkseSkKPiArTElOVVhfRFRTX09WRVJMQVlfTkFNRVMgKz0gJChjYWxsIHFzdHJpcCwk
KEJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19PVkVSTEFZX05BTUVTKSkKPiArCj4gKyMgV2Ug
a2VlcCBvbmx5IHRoZSAuZHRzbyBmaWxlcywgc28gdGhhdCB0aGUgdXNlciBjYW4gc3BlY2lmeSBi
b3RoIC5kdHNvCj4gKyMgYW5kIC5kdHNpIGZpbGVzIGluIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9N
X0RUU19PVkVSTEFZX1BBVEguIEJvdGggd2lsbCBiZQo+ICsjIGNvcGllZCB0byBhcmNoLzxhcmNo
Pi9ib290L2R0cywgYnV0IG9ubHkgdGhlIC5kdHNvIGZpbGVzIHdpbGwKPiArIyBhY3R1YWxseSBi
ZSBnZW5lcmF0ZWQgYXMgLmR0Ym8uCj4gK0xJTlVYX0RUU19PVkVSTEFZX05BTUVTICs9ICQoYmFz
ZW5hbWUgJChmaWx0ZXIgJS5kdHNvLCQobm90ZGlyICQoY2FsbCBxc3RyaXAsJChCUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9EVFNfT1ZFUkxBWV9QQVRIKSkpKSkKPiArCj4gK0xJTlVYX0RUQk9TID0g
JChhZGRzdWZmaXggLmR0Ym8sJChMSU5VWF9EVFNfT1ZFUkxBWV9OQU1FUykpCj4gK2VuZGlmCj4g
Kwo+ICBpZmVxICgkKEJSMl9MSU5VWF9LRVJORUxfSU1BR0VfVEFSR0VUX0NVU1RPTSkseSkKPiAg
TElOVVhfSU1BR0VfTkFNRSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfTElOVVhfS0VSTkVMX0lNQUdF
X05BTUUpKQo+ICBMSU5VWF9UQVJHRVRfTkFNRSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfTElOVVhf
S0VSTkVMX0lNQUdFX1RBUkdFVF9OQU1FKSkKPiBAQCAtNDYyLDEwICs0NzQsMjYgQEAgZGVmaW5l
IExJTlVYX0lOU1RBTExfRFRCCj4gIAkJCSQoMSkvJChpZiAkKEJSMl9MSU5VWF9LRVJORUxfRFRC
X0tFRVBfRElSTkFNRSksJChkdGIpLCQobm90ZGlyICQoZHRiKSkpCj4gIAkpCj4gIGVuZGVmCj4g
K2RlZmluZSBMSU5VWF9CVUlMRF9EVEJPCj4gKwkkKExJTlVYX01BS0VfRU5WKSAkKEJSMl9NQUtF
KSAkKExJTlVYX01BS0VfRkxBR1MpIC1DICQoQEQpICQoTElOVVhfRFRCT1MpCj4gK2VuZGVmCj4g
K2RlZmluZSBMSU5VWF9JTlNUQUxMX0RUQk8KPiArCSQoZm9yZWFjaCBkdGJvLCQoTElOVVhfRFRC
T1MpLCBcCj4gKwkJaW5zdGFsbCAtRCBcCj4gKwkJCSQod2lsZGNhcmQgJChMSU5VWF9BUkNIX1BB
VEgpL2Jvb3QvZHRzLyQoZHRibykpIFwKPiArCQkJJCgxKS8kKGlmICQoQlIyX0xJTlVYX0tFUk5F
TF9EVEJPX0tFRVBfRElSTkFNRSksJChkdGJvKSwkKG5vdGRpciAkKGR0Ym8pKSkKPiArCSkKPiAr
ZW5kZWYKPiAgZW5kaWYgIyBCUjJfTElOVVhfS0VSTkVMX0FQUEVOREVEX0RUQgo+ICBlbmRpZiAj
IEJSMl9MSU5VWF9LRVJORUxfRFRCX0lTX1NFTEZfQlVJTFQKPiAgZW5kaWYgIyBCUjJfTElOVVhf
S0VSTkVMX0RUU19TVVBQT1JUCj4gIAo+ICtpZmVxICgkKEJSMl9MSU5VWF9LRVJORUxfRFRTX09W
RVJMQVlfU1VQUE9SVCkseSkKPiArZGVmaW5lIExJTlVYX0JVSUxEX0RUQk8KPiArCSQoTElOVVhf
TUFLRV9FTlYpICQoQlIyX01BS0UpICQoTElOVVhfTUFLRV9GTEFHUykgLUMgJChARCkgJChMSU5V
WF9EVEJPUykKPiArZW5kZWYKPiArZW5kaWYgIyBCUjJfTElOVVhfS0VSTkVMX0RUU19PVkVSTEFZ
X1NVUFBPUlQKPiArCj4gIGlmZXEgKCQoQlIyX0xJTlVYX0tFUk5FTF9BUFBFTkRFRF9EVEIpLHkp
Cj4gICMgZHRicyBtb3ZlZCBmcm9tIGFyY2gvJEFSQ0gvYm9vdCB0byBhcmNoLyRBUkNIL2Jvb3Qv
ZHRzIHNpbmNlIDMuOC1yYzEKPiAgZGVmaW5lIExJTlVYX0FQUEVORF9EVEIKPiBAQCAtNTA4LDEw
ICs1MzYsMTQgQEAgZGVmaW5lIExJTlVYX0JVSUxEX0NNRFMKPiAgCSQoZm9yZWFjaCBkdHMsJChj
YWxsIHFzdHJpcCwkKEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIKSksIFwKPiAgCQlj
cCAtZiAkKGR0cykgJChMSU5VWF9BUkNIX1BBVEgpL2Jvb3QvZHRzLwo+ICAJKQo+ICsJJChmb3Jl
YWNoIGR0c28sJChjYWxsIHFzdHJpcCwkKEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19PVkVS
TEFZX1BBVEgpKSwgXAo+ICsJCWNwIC1mICQoZHRzbykgJChMSU5VWF9BUkNIX1BBVEgpL2Jvb3Qv
ZHRzLwo+ICsJKQo+ICAJJChMSU5VWF9NQUtFX0VOVikgJChCUjJfTUFLRSkgJChMSU5VWF9NQUtF
X0ZMQUdTKSAtQyAkKEBEKSBhbGwKPiAgCSQoTElOVVhfTUFLRV9FTlYpICQoQlIyX01BS0UpICQo
TElOVVhfTUFLRV9GTEFHUykgLUMgJChARCkgJChMSU5VWF9UQVJHRVRfTkFNRSkKPiAgCSQoTElO
VVhfQlVJTERfRFRCKQo+ICAJJChMSU5VWF9BUFBFTkRfRFRCKQo+ICsJJChMSU5VWF9CVUlMRF9E
VEJPKQo+ICBlbmRlZgo+ICAKPiAgaWZlcSAoJChCUjJfTElOVVhfS0VSTkVMX0FQUEVOREVEX0RU
QikseSkKPiBAQCAtNTMzLDYgKzU2NSw3IEBAIGlmZXEgKCQoQlIyX0xJTlVYX0tFUk5FTF9JTlNU
QUxMX1RBUkdFVCkseSkKPiAgZGVmaW5lIExJTlVYX0lOU1RBTExfS0VSTkVMX0lNQUdFX1RPX1RB
UkdFVAo+ICAJJChjYWxsIExJTlVYX0lOU1RBTExfSU1BR0UsJChUQVJHRVRfRElSKS9ib290KQo+
ICAJJChjYWxsIExJTlVYX0lOU1RBTExfRFRCLCQoVEFSR0VUX0RJUikvYm9vdCkKPiArCSQoY2Fs
bCBMSU5VWF9JTlNUQUxMX0RUQk8sJChUQVJHRVRfRElSKS9ib290KQo+ICBlbmRlZgo+ICBlbmRp
Zgo+ICAKPiBAQCAtNTQ3LDYgKzU4MCw3IEBAIGVuZGVmCj4gIGRlZmluZSBMSU5VWF9JTlNUQUxM
X0lNQUdFU19DTURTCj4gIAkkKGNhbGwgTElOVVhfSU5TVEFMTF9JTUFHRSwkKEJJTkFSSUVTX0RJ
UikpCj4gIAkkKGNhbGwgTElOVVhfSU5TVEFMTF9EVEIsJChCSU5BUklFU19ESVIpKQo+ICsJJChj
YWxsIExJTlVYX0lOU1RBTExfRFRCTywkKEJJTkFSSUVTX0RJUikpCj4gIGVuZGVmCj4gIAo+ICBp
ZmVxICgkKEJSMl9TVFJJUF9zdHJpcCkseSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
