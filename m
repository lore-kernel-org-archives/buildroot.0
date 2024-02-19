Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA6BC48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 09:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CFCC407AD;
	Mon, 19 Feb 2024 09:58:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id edGc2BgJT1ph; Mon, 19 Feb 2024 09:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8FA3407A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8FA3407A1;
	Mon, 19 Feb 2024 09:58:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97F6F1BF5E9
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 09:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 914F54064F
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 09:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YlAZ0Y_GTV6t for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 09:58:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB8E0405F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB8E0405F9
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB8E0405F9
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 09:58:30 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-512bc0e8ce1so396093e87.0
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 01:58:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708336708; x=1708941508;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gye0dfYlFFi08TSwv3h8uujwBwq5FHnVDprMKzsLgDs=;
 b=t4Mk+LuOY7/BXshlRSP743yabIIrRpXLuXWBe6mMlRyvDfDSjMBIjRa4JnJm6783D1
 efVwPgABziI6J027FoLQkUGFBipi820awfsZ20bcT3DBULmzKDeCCGqJAwLlq4cFQjHe
 CtTiww/rnmdmuox013iqtFkiJMPUZOmoez00CfTn+cGVGeGOct2GkjWhGDfZj6cBV+X4
 UHXs2Xv2CFb96AJ6HeIRvncifAfqiH+JCHwo/5CmevpyLilyB8NvhauxwNEqDNWh91O1
 umoTuABIIUHvUPzVueuBCz0uzrKrRGU2qh0481jgYIo9xKZuy9iZMnbufk6rKc0yk809
 fS4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwfP5J/YWNTj6xTdYzM7CRjNh8+ScyG910gyp3P3GrpZZx2PlpNdTfy0Xa5S/I35w54n+eDnra4iXj2xd+iUM3OABqvThF4A==
X-Gm-Message-State: AOJu0YyUpK/ywZ2mHojlEsWAYfKarihNIYTPnTsPDSjRK8/y0b/zNQ02
 NzZTSG70yJ3882N8KKqaYwq5XnF8V6cZAeTC34zSYmkem68TIIMJ0Y+rpTSpgxvzfAL8kHZj/4n
 0
X-Google-Smtp-Source: AGHT+IG6KjfWit36D5HiDWcqgKM7ksnJDXP3a2V8mOdEkqypjB+aT2z25RWPQjYFa9Mxw+wVrrvTjA==
X-Received: by 2002:a05:6512:1322:b0:512:bbf9:1ce1 with SMTP id
 x34-20020a056512132200b00512bbf91ce1mr693291lfu.68.1708336707609; 
 Mon, 19 Feb 2024 01:58:27 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a05600c11c700b00411c3c2fc55sm10716960wmi.45.2024.02.19.01.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 01:58:27 -0800 (PST)
Message-ID: <8dca9e04-832f-4ffc-b6b0-d1deed31259b@smile.fr>
Date: Mon, 19 Feb 2024 10:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-8-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240217160244.1320482-8-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708336708; x=1708941508;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gye0dfYlFFi08TSwv3h8uujwBwq5FHnVDprMKzsLgDs=;
 b=gR6TBm+tZdebRyJS843a7VjfSRZ2E2UQwThhHUdsbGCA8+PCEqR7/3jXG2ryAcrzM/
 UvJ2k2GH5BOhbiVDk7ggyfx+/KTVIUyFhbIIdvqXMBvnsWR39HTFhWABOhIT3D0/s+Vv
 a7qlyefLIS5RDIRC1mfkIKrEKuYny7+032tvQ4ilan/4iYR7+RgTnsXv3WxF3ccKU7lE
 jHb6+fOInN5+fPCrHZC5mrHd7blfQ1JtoGKnBYgjIKEmNyKb6sPzrdax4H+vekUpK5QD
 QuoAb90QP92EpCzYGxZwMPOPpYDMpofnczDbZPgw578u058wQ3MKsj5ScuEuyGwpaUka
 VIKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=gR6TBm+t
Subject: Re: [Buildroot] [PATCH v4 07/20] boot/ti-k3-image-gen: manage HS
 hardware
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAxNy8wMi8yMDI0IMOgIDE3OjAyLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFRoZSBwYXRjaCBzZXRzIHRoZSBjb25maWd1cmF0aW9ucyByZXF1aXJlZCBieSBU
SSBIUyBzeXN0ZW1zLiBTb21lIG9mIHRoZXNlCj4gY29uZmlndXJhdGlvbnMgKGkuIGUuIEhTIFNZ
U0ZXIGltYWdlIHNpZ25pbmcga2V5LCBIUyBTb2Z0d2FyZSBSZXZpc2lvbikKPiBhcmUgcHJvdmlk
ZWQgYnkgdGhlIHRpLWszLWNvcmUtc2VjZGV2IHBhY2thZ2UgaW4gdGhlIGJpbmFyaWVzIGRpcmVj
dG9yeS4KClN1Y2gga2V5cyBoYXMgYmVlbiBhZGRlZCB0byB1LWJvb3QgdjIwMjMuMTA6CgpodHRw
czovL2dpdC50aS5jb20vY2dpdC9zZWN1cml0eS1kZXZlbG9wbWVudC10b29scy9jb3JlLXNlY2Rl
di1rMy90cmVlL2tleXMKCmh0dHBzOi8vc291cmNlLmRlbnguZGUvdS1ib290L3UtYm9vdC8tL2Nv
bW1pdC9kNWIxZWYzMGQ3ZmZhYmI5ZjU3ZDVjNjJiOWYwNjA4ODM3YWYwZjRmCgpEbyB3ZSBuZWVk
IHNvbWV0aGluZyBlbHNlIGZyb20gdGktazMtY29yZS1zZWNkZXYgcGFja2FnZSB0aGF0IGlzIG5v
dCBhbHJlYWR5CnByb3ZpZGVkIGJ5IHUtYm9vdD8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+
IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29s
dXRpb25zLmNvbT4KPiAKPiAtLS0KPiAKPiBubyBjaGFuZ2VzIHNpbmNlIHYzOgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25z
LmNvbT4KPiAtLS0KPiAgYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluICAgICAgICAgIHwg
IDEgKwo+ICBib290L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4ubWsgfCAxNiArKysr
KysrKysrKysrKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmlu
IGIvYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluCj4gaW5kZXggZDc2Y2VmODJlOTExLi4z
OGQxNTk4ZDlmYzAgMTAwNjQ0Cj4gLS0tIGEvYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmlu
Cj4gKysrIGIvYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluCj4gQEAgLTIsNiArMiw3IEBA
IGNvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTgo+ICAJYm9vbCAidGktazMtaW1hZ2Ut
Z2VuIgo+ICAJZGVwZW5kcyBvbiBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUgo+ICAJc2VsZWN0
IEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRQo+ICsJc2VsZWN0IEJSMl9UQVJHRVRfVElf
SzNfQ09SRV9TRUNERVYgaWYgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU0VDVFlQRV9IU19G
UyB8fCBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0hTCj4gIAkjIFdlIG5lZWQg
RklUIHN1cHBvcnQgaW4gdWJvb3QtdG9vbHMsIHdoaWNoIGlzIHdoeSB3ZSBzZWxlY3QgYQo+ICAJ
IyBob3N0IHBhY2thZ2UKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1VCT09UX1RPT0xTCj4g
ZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5tayBiL2Jv
b3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5tawo+IGluZGV4IDY0YmU5YTE4ZjJj
NC4uNzRiNGZjYjRiZjg5IDEwMDY0NAo+IC0tLSBhL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWsz
LWltYWdlLWdlbi5tawo+ICsrKyBiL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdl
bi5tawo+IEBAIC0yOSwxMCArMjksMjEgQEAgVElfSzNfSU1BR0VfR0VOX0ZXX1RZUEUgPSAkKGNh
bGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fRldfVFlQRSkpCj4gIFRJX0sz
X0lNQUdFX0dFTl9TT0MgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9USV9LM19JTUFHRV9H
RU5fU09DKSkKPiAgVElfSzNfSU1BR0VfR0VOX1NFQ1RZUEUgPSAkKGNhbGwgcXN0cmlwLCQoQlIy
X1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU0VDVFlQRSkpCj4gIAo+IC1USV9LM19JTUFHRV9HRU5f
U1lTRlcgPSAkKFRJX0szX0lNQUdFX0dFTl9GV19UWVBFKS1maXJtd2FyZS0kKFRJX0szX0lNQUdF
X0dFTl9TT0MpLSQoVElfSzNfSU1BR0VfR0VOX1NFQ1RZUEUpLmJpbgo+ICtpZmVxICgkKEJSMl9U
QVJHRVRfVElfSzNfSU1BR0VfR0VOX1NFQ1RZUEVfR1ApLHkpCj4gK1RJX0szX0lNQUdFX0dFTl9T
WVNGVyA9IFwKPiArCSQoVElfSzNfSU1BR0VfR0VOX0ZXX1RZUEUpLWZpcm13YXJlLSQoVElfSzNf
SU1BR0VfR0VOX1NPQyktJChUSV9LM19JTUFHRV9HRU5fU0VDVFlQRSkuYmluCj4gK2Vsc2UKPiAr
VElfSzNfSU1BR0VfR0VOX0RFUEVOREVOQ0lFUyArPSB0aS1rMy1jb3JlLXNlY2Rldgo+ICsKPiAr
VElfSzNfSU1BR0VfR0VOX1NZU0ZXID0gXAo+ICsJJChUSV9LM19JTUFHRV9HRU5fRldfVFlQRSkt
ZmlybXdhcmUtJChUSV9LM19JTUFHRV9HRU5fU09DKS0kKFRJX0szX0lNQUdFX0dFTl9TRUNUWVBF
KS1lbmMuYmluIFwKPiArCSQoVElfSzNfSU1BR0VfR0VOX0ZXX1RZUEUpLWZpcm13YXJlLSQoVElf
SzNfSU1BR0VfR0VOX1NPQyktJChUSV9LM19JTUFHRV9HRU5fU0VDVFlQRSktY2VydC5iaW4KPiAr
ZW5kaWYKPiAgCj4gIGRlZmluZSBUSV9LM19JTUFHRV9HRU5fQ09ORklHVVJFX0NNRFMKPiAtCWNw
ICQoQklOQVJJRVNfRElSKS90aS1zeXNmdy8kKFRJX0szX0lNQUdFX0dFTl9TWVNGVykgJChARCkK
PiArCSQoZm9yZWFjaCB0LCQoVElfSzNfSU1BR0VfR0VOX1NZU0ZXKSxcCj4gKwkJY3AgJChCSU5B
UklFU19ESVIpL3RpLXN5c2Z3LyQodCkgJChARCkvCj4gKwkpCj4gIGVuZGVmCj4gIAo+ICBkZWZp
bmUgVElfSzNfSU1BR0VfR0VOX0JVSUxEX0NNRFMKPiBAQCAtNDAsNiArNTEsNyBAQCBkZWZpbmUg
VElfSzNfSU1BR0VfR0VOX0JVSUxEX0NNRFMKPiAgCSQoQlIyX01BS0UpIC1DICQoQEQpIFwKPiAg
CQlTT0M9JChUSV9LM19JTUFHRV9HRU5fU09DKSBcCj4gIAkJU09DX1RZUEU9JChUSV9LM19JTUFH
RV9HRU5fU0VDVFlQRSkgXAo+ICsJCVRJX1NFQ1VSRV9ERVZfUEtHPSQoQklOQVJJRVNfRElSKS90
aS1rMy1jb3JlLXNlY2RldiBcCj4gIAkJQ09ORklHPWV2bSBcCj4gIAkJQ1JPU1NfQ09NUElMRT0k
KEhPU1RfRElSKS9iaW4vYXJtLW5vbmUtZWFiaS0gXAo+ICAJCVNCTD0kKEJJTkFSSUVTX0RJUikv
cjUtdS1ib290LXNwbC5iaW4gXAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
