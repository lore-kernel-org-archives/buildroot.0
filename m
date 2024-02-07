Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6FBC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B12C140136;
	Wed,  7 Feb 2024 10:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kFo-LGyNGom2; Wed,  7 Feb 2024 10:26:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EB7340A48
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EB7340A48;
	Wed,  7 Feb 2024 10:26:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E97BE1BF255
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D793F60A5D
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:26:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01o9_y0Cum5J for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:26:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9A29060591
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A29060591
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A29060591
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:26:05 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41008ab427fso3929085e9.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 02:26:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707301563; x=1707906363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kc6iWILMhsDfpGEncCCbeCiHCrVBUQqEGcwm0BpteRw=;
 b=xTisGhpsXBAjPWxZsBAKhb5diVAHzwg87HolKhm/m5+TD8bdYoU1iZmXxMl0G4pmT4
 b9/cp21XR1+q5LBdZDlE7krJVwaRUL2MTkk3TZ5210KQ2xNgmS3zGkoWFsuSD0qIts4V
 SC+f3VvBjqcZX1l9GlcESneBAfeX3QrnBJxO00Lq3ksWNReUHfWqqvmfGjqDx8RUm6+e
 0+qhS4DKF62COS/HLdPNDQiNxKqgTsYAkFmuylR6jW5n3QPhRSnjT6HTJfwnc9593pMx
 pdaB/ZrAtUojr3NMLnJoXbfsB/CQxbUkg49Q9l+2W8pfnIfieh+mH3nFuCojhtc32rcJ
 1BTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGUOjhP359W1Br+APqsDg1TlVVYUTa/uF4knF8VTJLyEMMEx6xrv0hwKINhprIffrqVlvmU7n0L4FbmvTjkDqKTsSEiYAfKg==
X-Gm-Message-State: AOJu0Ywm2HgN+nscc+RqtnpZhpceugXOR1qNSaef/dzBU90/9fvpjpWb
 /kP8720vm+lqkzJzmN4sChvAy3oa8KA5o6/XYD8Mh68RI7MUPzEyweMLb7M/20Y=
X-Google-Smtp-Source: AGHT+IGqEBOnwVwyNgRMOvW2ssBA3eMRBjWCxOmceYpG8H/m3IOZ1I8EGMLfgCITG74hTkBgasb9+g==
X-Received: by 2002:adf:e707:0:b0:33b:153a:de12 with SMTP id
 c7-20020adfe707000000b0033b153ade12mr3480417wrm.13.1707301563647; 
 Wed, 07 Feb 2024 02:26:03 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWBUALTPEYf/9GQbR6z+HKJSZngXGYKrb9sAF/iQkc0X1eygTn45vHuW9KXSkMNWffnZ35+ESFc/cbEnq9ekZFCuv2aAEswgMdLWhpfsJn6RdufLe12dquDQ+Ee7zt1zHKnaSYYIrNwjWB1/k9EtSuvoCI/2sQMVIVM4iidVgBR7UVgCCU74IS7f4DvGEc7PwTKn9ruL3JINtLyCzjFaLy4YcXUhzzaYSSaWsaNDmhrPAMqnKGj3/YlMt+FqmYIpBSNsKl1zSRYSs/mS7UE6ryk419mo2/Wv9nnz0tHPHaU0erUWP4iNRLaGjH8A8Vtvk1W678=
Received: from [192.168.17.126] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 h18-20020adffa92000000b0033afe6968bfsm1136570wrr.64.2024.02.07.02.26.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 02:26:03 -0800 (PST)
Message-ID: <cf568953-a387-47c5-844c-2e1278ef4364@smile.fr>
Date: Wed, 7 Feb 2024 11:26:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
 <20231218081958.506691-9-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20231218081958.506691-9-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707301563; x=1707906363;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kc6iWILMhsDfpGEncCCbeCiHCrVBUQqEGcwm0BpteRw=;
 b=jYydxs5+r3wJE7R9Jo345KmIFRaU7Nk6zmoa4+OeuIQXEYgF3HX9TnT8gkBwXteioQ
 3QJoSjsTcplaQPHx46XMbvFLFsD6b6NwL8LEhxybnORDgBcIw6zhCRtXv+jA3GDJUl6x
 K6dA3nSW0seLNsGA8IIf2KfKomrP2FynAr5H0P6RaX34zwK0UoxNhXHhv9WmuIQkXhCI
 YP2TlrCNHPPSDg9qe3+8+zB+NdCa4c7ib7DLytkBiyDBGappBcOczyDgpxrF2vXo5/aY
 0JrG1gwrwODRQGekEENpH5P8mp989d0HPAgHiBDERl7SSa4x5GP3pJc57TdhdnrhwYAb
 apOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=jYydxs5+
Subject: Re: [Buildroot] [PATCH v3 08/11] boot/ti-k3-r5-loader: set binman
 environment
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAxOC8xMi8yMDIzIMOgIDA5OjE5LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFJlY2VudCB2ZXJzaW9uIG9mIFUtQm9vdCB1c2UgYmlubWFuIHRvIHByb3ZpZGUg
YSBtZWNoYW5pc20gZm9yIGJ1aWxkaW5nCj4gaW1hZ2VzLCBmcm9tIHNpbXBsZSBTUEwgKyBVLUJv
b3QgY29tYmluYXRpb25zLCB0byBtb3JlIGNvbXBsZXgKPiBhcnJhbmdlbWVudHMgd2l0aCBtYW55
IHBhcnRzLgo+IAo+IFRoZSBwYXRjaCBzZXQgdGhlIEJJTk1BTl9JTkRJUlMgZW52aXJvbm1lbnQg
dmFyaWFibGUgdG8gcHJvdmlkZSB0aGUKPiBkaXJlY3RvcnkgdG8gc2VhcmNoIGZvciBiaW5hcnkg
YmxvYnMgYW5kIHNlbGVjdCB0aGUgcGFja2FnZXMgcmVxdWlyZWQgYnkKPiBiaW5tYW4uCj4gCj4g
Q28tZGV2ZWxvcGVkLWJ5OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRp
b25zLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFy
dWxhc29sdXRpb25zLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8u
YmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gCj4gLS0tCj4gCj4gQ2hhbmdlcyBpbiB2
MjoKPiAtIENoYW5nZSBjb21taXQgbWVzc2FnZQo+IC0gQWRkIEJSMl9UQVJHRVRfVElfSzNfUjVf
TE9BREVSX1VTRV9CSU5NQU4gb3B0aW9uCj4gLSBTZWxlY3QgcGFja2FnZXMgcmVxdWlyZWQgYnkg
YmlubWFuIGlmCj4gICBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9VU0VfQklOTUFOIGlzIGVu
YWJsZWQKPiAKPiAgYm9vdC90aS1rMy1yNS1sb2FkZXIvQ29uZmlnLmluICAgICAgICAgIHwgMTMg
KysrKysrKysrKysrKwo+ICBib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsg
fCAxNSArKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbiBiL2Jvb3Qv
dGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbgo+IGluZGV4IDhjODM2OGExYTVhOC4uYTQwZWFlZDk0
NjdiIDEwMDY0NAo+IC0tLSBhL2Jvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbgo+ICsrKyBi
L2Jvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbgo+IEBAIC05Myw0ICs5MywxNyBAQCBjb25m
aWcgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQ1VTVE9NX0NPTkZJR19GSUxFCj4gIAloZWxw
Cj4gIAkgIFBhdGggdG8gdGhlIFRJIEszIFI1IExvYWRlciBjb25maWd1cmF0aW9uIGZpbGUuCj4g
IAo+ICtjb25maWcgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJTk1BTgo+ICsJYm9v
bCAiVS1Cb290IHVzZXMgYmlubWFuIgo+ICsJc2VsZWN0IEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNf
UFlMSUJGRFQKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1BZVEhPTl9BVFRSUwo+ICsJc2Vs
ZWN0IEJSMl9QQUNLQUdFX0hPU1RfUFlUSE9OX0pTT05TQ0hFTUEKPiArCXNlbGVjdCBCUjJfUEFD
S0FHRV9IT1NUX1BZVEhPTl9KU09OU0NIRU1BX1NQRUNJRklDQVRJT05TCj4gKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfSE9TVF9QWVRIT05fUFlZQU1MCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVF9Q
WVRIT05fUkVGRVJFTkNJTkcKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1BZVEhPTl9SUERT
X1BZCgpUaGVyZSBpcyBubyBzdWNoIEJSMl9QQUNLQUdFX0hPU1RfUFlUSE9OXyogc3ltYm9scyBh
ZGRlZCB3aGVuIHlvdSBlbmFibGVkIGhvc3QKdmFyaWFudC4gV2UgZG9uJ3QgcmVhbGx5IG5lZWQg
c3VjaCBvcHRpb24gZm9yIGhvc3QgcGFja2FnZSwganVzdCBhZGQgdGhlbSBpbgp0aS1rMy1yNS1s
b2FkZXIgYnVpbGQgZGVwZW5kZW5jeSBmcm9tIC5tayBmaWxlLgoKPiArCWhlbHAKPiArCSAgU2Vs
ZWN0IHRoaXMgb3B0aW9uIGlmIHlvdXIgVS1Cb290IHZlcnNpb24gdXNlcyBiaW5tYW4KPiArCSAg
Zm9yIGJ1aWxkaW5nIGltYWdlcy4KCkl0IHNlZW1zIHRoYXQgdGhpcyBpcyBhIFRJIHNwZWNpZmlj
IHNjcmlwdCB0b29scy9iaW5tYW4vZXR5cGUvdGlfYm9hcmRfY29uZmlnLnB5CnRoYXQgcmVxdWly
ZXMgcHl0aG9uLWpzb25zY2hlbWEgYnV0IGl0cyBhbHJlYWR5IGEgcmVxdWlyZW1lbnQgZm9yIGJ1
aWxkbWFuIFsxXS4KClNvIGl0IHNob3VsZCBhbHNvIGJlIGhhbmRsZWQgaW4gdS1ib290IHBhY2th
Z2UuCgpbMV0KaHR0cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvdS1ib290Ly0vYmxvYi9tYXN0
ZXIvdG9vbHMvYnVpbGRtYW4vcmVxdWlyZW1lbnRzLnR4dD9yZWZfdHlwZT1oZWFkcwoKQmVzdCBy
ZWdhcmRzLApSb21haW4KCj4gKwo+ICBlbmRpZgo+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLXI1
LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1y
NS1sb2FkZXIubWsKPiBpbmRleCAwZmZjYjgyMzVmMmUuLjdmNmRhMGZiMjRlYSAxMDA2NDQKPiAt
LS0gYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiArKysgYi9ib290
L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiBAQCAtNDksNiArNDksMjAgQEAg
VElfSzNfUjVfTE9BREVSX0tDT05GSUdfREVQRU5ERU5DSUVTID0gXAo+ICAJJChCUjJfQklTT05f
SE9TVF9ERVBFTkRFTkNZKSBcCj4gIAkkKEJSMl9GTEVYX0hPU1RfREVQRU5ERU5DWSkKPiAgCj4g
K2lmZXEgKCQoQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWUxJQkZEVCkseSkKPiArVElfSzNfUjVf
TE9BREVSX0RFUEVOREVOQ0lFUyArPSBob3N0LXB5dGhvbi1weWxpYmZkdAo+ICtlbmRpZgo+ICsK
PiAraWZlcSAoJChCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9VU0VfQklOTUFOKSx5KQo+ICtU
SV9LM19SNV9MT0FERVJfREVQRU5ERU5DSUVTICs9IFwKPiArCWhvc3QtcHl0aG9uLWF0dHJzIFwK
PiArCWhvc3QtcHl0aG9uLWpzb25zY2hlbWEgXAo+ICsJaG9zdC1weXRob24tanNvbnNjaGVtYS1z
cGVjaWZpY2F0aW9ucyBcCj4gKwlob3N0LXB5dGhvbi1weXlhbWwgXAo+ICsJaG9zdC1weXRob24t
cmVmZXJlbmNpbmcgXAo+ICsJaG9zdC1weXRob24tcnBkcy1weQo+ICtlbmRpZgo+ICsKPiAgaWZl
cSAoJChCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9VU0VfREVGQ09ORklHKSx5KQo+ICBUSV9L
M19SNV9MT0FERVJfS0NPTkZJR19ERUZDT05GSUcgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdF
VF9USV9LM19SNV9MT0FERVJfQk9BUkRfREVGQ09ORklHKSlfZGVmY29uZmlnCj4gIGVsc2UgaWZl
cSAoJChCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9VU0VfQ1VTVE9NX0NPTkZJRykseSkKPiBA
QCAtNTgsNiArNzIsNyBAQCBUSV9LM19SNV9MT0FERVJfTUFLRV9PUFRTID0gXAo+ICAJQ1JPU1Nf
Q09NUElMRT0kKEhPU1RfRElSKS9iaW4vYXJtLW5vbmUtZWFiaS0gXAo+ICAJQVJDSD1hcm0gXAo+
ICAJSE9TVENDPSIkKEhPU1RDQykgJChzdWJzdCAtSS8sLWlzeXN0ZW0gLywkKHN1YnN0IC1JIC8s
LWlzeXN0ZW0gLywkKEhPU1RfQ0ZMQUdTKSkpIiBcCj4gKwlCSU5NQU5fSU5ESVJTPSQoQklOQVJJ
RVNfRElSKSBcCj4gIAlIT1NUTERGTEFHUz0iJChIT1NUX0xERkxBR1MpIgo+ICAKPiAgZGVmaW5l
IFRJX0szX1I1X0xPQURFUl9CVUlMRF9DTURTCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
