Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A596EC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3949D607F0;
	Thu, 28 Jul 2022 21:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3949D607F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g6onpgTPCrjT; Thu, 28 Jul 2022 21:12:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F58D60ACD;
	Thu, 28 Jul 2022 21:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F58D60ACD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B90E81BF3C2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EEDB415BB
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EEDB415BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RKL8LTm8yEk3 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 21:12:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7481415B5
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7481415B5
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 21:12:16 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id u17so3230573lji.5
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 14:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SzmmcH287Z85kYOrNkq2MZPjeEs5JJYwH6FS2U6JkIM=;
 b=FOIE+UmJTbVCN2DsNkY6lPFIYWwXmAqD76wtV87l+Z6N1z/OAcMr62Zu8yBcQWeqb9
 y9YewC86ALvxeQv7ywipLtO2slMiddF0mVb1D1XhVm91/2E/ZHP+/zRftuozxSlXkaEB
 Da0DrR4r5gkIfutWzBTO70FB5eBakqgLSk2TWp1tQgDl6UaBO8Hsb+zMvSHgWJ68C37D
 RV6vtcRx6YlpLOhUpA3ks1q2Nf4bXqCyks7rl3xDh43DvqUXkcJJv7qz9tbOuOchXDDP
 tEk2lOYR7to16qiFSRUOgsJWf6epN0Dfk4XgY4bUsEfZWF+MG4Oj1pX+TaH5Ca/2CZMV
 d33g==
X-Gm-Message-State: AJIora/mFNkLs2lOeoW7FOFcJKf9wmIZIZOp/ueKDRBYVUd+w725QUJX
 ForuHeTQo7A3XWb7l4P/W5UD7wJ3Gjq5BYS+HzIzmrHp
X-Google-Smtp-Source: AGRyM1tG/h/Dhk+5cH2p9WVQ70BcVJHp/IKTbB5wM1FwQ7tsGYHqpT+gNQAPVeF7FqjN5wRNeqYE4aQXbmT2+K+exG0=
X-Received: by 2002:a05:651c:150b:b0:25d:ead1:dfa1 with SMTP id
 e11-20020a05651c150b00b0025dead1dfa1mr202386ljf.172.1659042734512; Thu, 28
 Jul 2022 14:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220326220727.827332-1-angelo@amarulasolutions.com>
 <5e884286-3554-a6c6-5dec-493ddf9dd73d@smile.fr>
In-Reply-To: <5e884286-3554-a6c6-5dec-493ddf9dd73d@smile.fr>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 28 Jul 2022 23:11:37 +0200
Message-ID: <CA+TH9Vkx7Uk0kB0Poqia1-V6d8XjPiaAZZR6oAE3=5qDYk3neg@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SzmmcH287Z85kYOrNkq2MZPjeEs5JJYwH6FS2U6JkIM=;
 b=NU/bqB/1S8Cwd6nCt9zS0sYjvrMK2Qk5CAHHlWR10ejpPUBSTcOFbaVsCPp/gs9uG3
 Y1t0erbLl/BZv7WJw9RY7Cx0aAlvmumNrh+FcawpzSTKWOGUtsMtbeIFip0bkOFV6ePG
 DDR8qgATiVoWnh+L2Vq2qtIfu5UA6W1mcsUYM9RSLJdZz6kwxj59yoGY/1cGOPcfcnxM
 ij/yYlU++33PD+4uP4nCmxjOomAfzqfdrvyv6fOWPTyQaeSWbT6vXBeNI65RlZ69MOAF
 vMqaVE5FSliVL1rWqZerRp3ibNcF20/VNXoNTpKDz/VRu6aXhMXAUkNKkYEEkdC/+QUW
 Li3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NU/bqB/1
Subject: Re: [Buildroot] [PATCH v2] package/libdill: new package
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
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SWwgZ2lvcm5vIG1hciAyNiBsdWcgMjAyMiBhbGxlIG9yZSAyMzo0OSBSb21haW4gTmFvdXIKPHJv
bWFpbi5uYW91ckBzbWlsZS5mcj4gaGEgc2NyaXR0bzoKPgo+IEhlbGxvIEFuZ2VsbywKPgo+IExl
IDI2LzAzLzIwMjIgw6AgMjM6MDcsIEFuZ2VsbyBDb21wYWdudWNjaSBhIMOpY3JpdCA6Cj4gPiBM
aWJkaWxsIGlzIGEgQyBsaWJyYXJ5IHRoYXQgbWFrZXMgd3JpdGluZyBzdHJ1Y3R1cmVkIGNvbmN1
cnJlbnQgcHJvZ3JhbXMKPiA+IGVhc3kuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5nZWxvIENv
bXBhZ251Y2NpIDxhbmdlbG9AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiAtLS0KPiA+IHYxLXYy
Ogo+ID4gQmV0dGVyIGNvbmZpZ3VyYXRpb24gb3B0aW9ucyBoYW5kbGluZzoKPiA+IGxpYmRpbGwg
YnVpbGQgY2FuIGFjdHVhbGx5IGJlIGN1c3RvbWl6ZWQgb25seSB3aGVuIHVzaW5nIGNvbmZpZ3Vy
ZQo+ID4gaW5kZWVkIGNtYWtlIGRvZXNuJ3Qgb2ZmZXIgdGhlIHNhbWUgY29uZmlndXJhdGlvbiBv
cHRpb24sCj4gPgo+ID4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gPiAg
cGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICB8ICAxICsKPiA+ICBwYWNrYWdlL2xpYmRpbGwv
Q29uZmlnLmluICAgIHwgIDcgKysrKysrKwo+ID4gIHBhY2thZ2UvbGliZGlsbC9saWJkaWxsLmhh
c2ggfCAgMyArKysKPiA+ICBwYWNrYWdlL2xpYmRpbGwvbGliZGlsbC5tayAgIHwgMjUgKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygr
KQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmRpbGwvQ29uZmlnLmluCj4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliZGlsbC9saWJkaWxsLmhhc2gKPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJkaWxsL2xpYmRpbGwubWsKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiA+IGluZGV4IDcwZDcxMTg2ZWQuLjk0MTA5
NDQ1ODQgMTAwNjQ0Cj4gPiAtLS0gYS9ERVZFTE9QRVJTCj4gPiArKysgYi9ERVZFTE9QRVJTCj4g
PiBAQCAtMTY3LDYgKzE2Nyw3IEBAIEY6ICAgICAgICBwYWNrYWdlL2kyYy10b29scy8KPiA+ICBG
OiAgIHBhY2thZ2UvanEvCj4gPiAgRjogICBwYWNrYWdlL2xpYmFwcGFybW9yLwo+ID4gIEY6ICAg
cGFja2FnZS9saWJiNjQvCj4gPiArRjogICBwYWNrYWdlL2xpYmRpbGwvCj4gPiAgRjogICBwYWNr
YWdlL21lbmRlci8KPiA+ICBGOiAgIHBhY2thZ2UvbWVuZGVyLWFydGlmYWN0Lwo+ID4gIEY6ICAg
cGFja2FnZS9tb25vLwo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2Fn
ZS9Db25maWcuaW4KPiA+IGluZGV4IDBkNWQ3NjMxODAuLjQ3Zjg0YTA4ZGMgMTAwNjQ0Cj4gPiAt
LS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ID4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiA+IEBA
IC0xOTY4LDYgKzE5NjgsNyBAQCBtZW51ICJPdGhlciIKPiA+ICAgICAgIHNvdXJjZSAicGFja2Fn
ZS9saWJjcm9zc2d1aWQvQ29uZmlnLmluIgo+ID4gICAgICAgc291cmNlICJwYWNrYWdlL2xpYmNz
di9Db25maWcuaW4iCj4gPiAgICAgICBzb3VyY2UgInBhY2thZ2UvbGliZGFlbW9uL0NvbmZpZy5p
biIKPiA+ICsgICAgIHNvdXJjZSAicGFja2FnZS9saWJkaWxsL0NvbmZpZy5pbiIKPiA+ICAgICAg
IHNvdXJjZSAicGFja2FnZS9saWJlYXN0bC9Db25maWcuaW4iCj4gPiAgICAgICBzb3VyY2UgInBh
Y2thZ2UvbGliZWUvQ29uZmlnLmluIgo+ID4gICAgICAgc291cmNlICJwYWNrYWdlL2xpYmV2L0Nv
bmZpZy5pbiIKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmRpbGwvQ29uZmlnLmluIGIvcGFj
a2FnZS9saWJkaWxsL0NvbmZpZy5pbgo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4
IDAwMDAwMDAwMDAuLjBlNjc1N2I4MDkKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3BhY2th
Z2UvbGliZGlsbC9Db25maWcuaW4KPiA+IEBAIC0wLDAgKzEsNyBAQAo+ID4gK2NvbmZpZyBCUjJf
UEFDS0FHRV9MSUJESUxMCj4KPiBIYXZlIHlvdSBjaGVja2VkIHdpdGggdGVzdC1wa2cgPwoKTm90
IHJlYWxseSwgSSB0ZXN0ZWQgaXQgd2l0aCBzb21lIGNvbmZpZ3VyYXRpb24gSSdtIHdvcmtpbmcg
d2l0aC4gSSdsbApkbyBhIHJ1biB3aXRoIHRlc3QtcGtnIHRvby4KCj4KPiA+ICsgICAgIGJvb2wg
ImxpYmRpbGwiCj4gPiArICAgICBoZWxwCj4gPiArICAgICAgIExpYmRpbGwgaXMgYSBDIGxpYnJh
cnkgdGhhdCBtYWtlcyB3cml0aW5nIHN0cnVjdHVyZWQgY29uY3VycmVudAo+ID4gKyAgICAgICBw
cm9ncmFtcyBlYXN5Lgo+ID4gKwo+ID4gKyAgICAgICBodHRwOi8vbGliZGlsbC5vcmcKPiA+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2xpYmRpbGwvbGliZGlsbC5oYXNoIGIvcGFja2FnZS9saWJkaWxs
L2xpYmRpbGwuaGFzaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAw
MDAuLjRhMWZiOTFhNTcKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3BhY2thZ2UvbGliZGls
bC9saWJkaWxsLmhhc2gKPiA+IEBAIC0wLDAgKzEsMyBAQAo+ID4gKyMgc2hhMjU2IGxvY2FsbHkg
Y29tcHV0ZWQKPiA+ICtzaGEyNTYgIDZkZjc1MjdlOGYxZTkxZjUxMDZjMjFjNWJmZWFhNjllZWU0
NzBiZWM0NzZjNzQ1ODUxNDNlM2U0Mzk4NjQ0MDQgIGxpYmRpbGwtZmEwMTY0OGNmMmE4ZDA2ZTUz
Yzk2NWI0NWVlYWNmYjNhYzU3YmQwNC50YXIuZ3oKPiA+ICtzaGEyNTYgIDNmNzhkOWM0MmM4OTE5
Y2I2ZGM2M2U1MWRlMTdiOWViNDBhNDlkOWNkZDg3NmNlNTllNzczOTI3MjFlOGMyYzYgIENPUFlJ
TkcKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmRpbGwvbGliZGlsbC5tayBiL3BhY2thZ2Uv
bGliZGlsbC9saWJkaWxsLm1rCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAw
MDAwMDAwMC4uOGVmZTFmZjM1Ngo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvcGFja2FnZS9s
aWJkaWxsL2xpYmRpbGwubWsKPiA+IEBAIC0wLDAgKzEsMjUgQEAKPiA+ICsjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ID4gKyMKPiA+ICsjIGxpYmRpbGwKPiA+ICsjCj4gPiArIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPiA+ICsKPiA+ICtMSUJESUxMX1ZFUlNJT04gPSBmYTAxNjQ4Y2YyYThkMDZl
NTNjOTY1YjQ1ZWVhY2ZiM2FjNTdiZDA0Cj4gPiArTElCRElMTF9TSVRFID0gJChjYWxsIGdpdGh1
YixzdXN0cmlrLGxpYmRpbGwsJChMSUJESUxMX1ZFUlNJT04pKQo+ID4gK0xJQkRJTExfTElDRU5T
RSA9IE1JVAo+ID4gK0xJQkRJTExfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiA+ICtMSUJESUxM
X0NQRV9JRF9WRU5ET1IgPSBsaWJkaWxsCj4gPiArTElCRElMTF9DUEVfSURfUFJPRFVDVCA9IGxp
YmRpbGwKPiA+ICtMSUJESUxMX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ID4gK0xJQkRJTExfQVVU
T1JFQ09ORiA9IFlFUwo+Cj4gVXN1YWxseSB3ZSByZXF1aXJlcyBhIGNvbW1lbnQgdG8gcmVtZW1i
ZXIgd2h5IGF1dG9yZWNvbmYgaXMgbmVlZGVkLgo+IEhlcmUgaXQncyBkaXJlY3RseSBmZXRjaGVk
IGZyb20gZ2l0aHViIGFuZCB3ZSBuZWVkIGF1dG9yZWNvbmYgdG8gZ2VuZXJhdGUgdGhlCj4gY29u
ZmlndXJlIHNjcmlwdC4KCkknbGwgYWRkIHRvIFYyCgo+Cj4gPiArCj4gPiAraWZuZXEgKCQoQlIy
X1RPT0xDSEFJTl9IQVNfVEhSRUFEUykseSkKPiA+ICtMSUJESUxMX0NPTkZfT1BUUyArPSAtLWRp
c2FibGUtdGhyZWFkcwo+ID4gK2VuZGlmCj4gPiArCj4gPiAraWZlcSAoJChCUjJfUEFDS0FHRV9P
UEVOU1NMKSx5KQo+ID4gK0xJQkRJTExfREVQRU5ERU5DSUVTID0gb3BlbnNzbAo+Cj4gT3BlbnNz
bCBpcyBhIHZpcnR1YWwgcGFja2FnZS4gRGlkIHlvdSBjaGVjayB3aXRoIG90aGVyIHNzbCBwcm92
aWRlZCBzdWNoIGxpYnJlc3NsID8KClllcyBhbmQgaXQgd29yayB3aXRoIGJvdGggb3Blbi9saWJy
ZXNzbAoKPgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPgo+Cj4gPiArTElCRElMTF9DT05GX09Q
VFMgKz0gLS1lbmFibGUtdGxzCj4gPiArZW5kaWYKPiA+ICsKPiA+ICskKGV2YWwgJChhdXRvdG9v
bHMtcGFja2FnZSkpCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKCgotLSAKUHJvZmlsZTogaHR0cDovL2l0LmxpbmtlZGluLmNvbS9pbi9jb21wYWdudWNjaWFu
Z2VsbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
