Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD910C48BC4
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 22:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D048402D0;
	Thu, 15 Feb 2024 22:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0GTZu7gvR0f; Thu, 15 Feb 2024 22:14:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0335340386
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0335340386;
	Thu, 15 Feb 2024 22:14:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C30A1BF2BE
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 22:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18B5440386
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 22:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BON57FMzBVyy for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 22:13:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 24D76402D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24D76402D0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24D76402D0
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 22:13:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33d10936af1so584041f8f.1
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 14:13:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708035235; x=1708640035;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gdZVajykILO0BH36W5nVoYaKig/aEODks8xXrNCYdPI=;
 b=s/vSBoPnwMt/ub9L/VXlJYuYY0STq2Erh2XFB35gAkA3tKr5YihleHVPu7qfKriuGN
 9gyrvC0andoMmQ3tmgnQgjBL8E4coQv+YrcdpMZFXOI7uDjyam5dTlFCuQCDqbApI14z
 LGia+sRp9nWKj33VLes/wC3f4Zj6ik9bgZthg65+rXhEW2JWOUzqRoMeMWpPcFoKjHzL
 Nt81Ct2QpksYMHW/AP6fssykO5Lhl/BP2enLDKD27zOP9TZFXKSYgAx28LikVvpa7ip0
 ZLrHuYKmPcyaw1tQ45gD7K0Er3xjkOrQo/iaftdzUGxQXuvA4WU94tcaXsIzyvC9PpaS
 4oww==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8iuTnF5u/ibfk4Gc1DLcHHC/P1T1ghIDWGnhRJ51SaKDmGtNZxfhkEroUGoBIKKwlpww71E71/OZGqfPam6ItJV45WVKqdg==
X-Gm-Message-State: AOJu0YzvLD2o58vrdRYUw+ba1npSolqtu5RmQcNndg//sgc/SEoNURNG
 D5I5w6qu8idvmhJOgO1lcClKiLeCxJCrzyC6PLfBiBiqEqgTPxtqIYdNqg4gklQQwZVJKxg1h1b
 p
X-Google-Smtp-Source: AGHT+IGJlSvLVyg1zkQl8K7h0KBpIRwrMEKw7mbEG7/ltQSmZ2sAa7jF/INa6CY8ShDseAlb0Dn9ow==
X-Received: by 2002:adf:ffc7:0:b0:33d:f4b:d488 with SMTP id
 x7-20020adfffc7000000b0033d0f4bd488mr1717583wrs.7.1708035234719; 
 Thu, 15 Feb 2024 14:13:54 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 fs14-20020a05600c3f8e00b00411a595d56bsm393979wmb.14.2024.02.15.14.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 14:13:54 -0800 (PST)
Message-ID: <b06a4887-7c80-4a08-a992-0095bdc89596@smile.fr>
Date: Thu, 15 Feb 2024 23:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr, en-US
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, buildroot@buildroot.org
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <11856419bb18257086aaf4c5b45663cdae1292cc.camel@gmail.com>
 <63114771-4fb0-4b6f-bdac-e4363b4e9e52@smile.fr>
 <1f1cca3eae4fc651a9f02e4e64407a355cb39f2e.camel@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <1f1cca3eae4fc651a9f02e4e64407a355cb39f2e.camel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708035235; x=1708640035;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gdZVajykILO0BH36W5nVoYaKig/aEODks8xXrNCYdPI=;
 b=Ee4SkfpDhM2HkZ+c6u2OQ0bXEw2iZThetmAor9oV7O/vJf3UtkvsxFdL5q5lmXQwZC
 C39G0CXH7L9344COxMiULvXtc4LBNfD77BCLBOmlQ7pVrNt356T7CsKAsMzHPRCih336
 4HuY0tf6KSNiDJfg9eA2lTpp1PhP2ddnZPNs5m5fqQwrhlxOFVRYzcEV6Yjt8JFlCR5q
 ziFDrGCg70fotyVrUvompgoNUx4DKKvKL+sUyQxfNzw3JIl/6DZFCrYyIPjSby+Se3o0
 OH8GTq5KTDbpdUC/XHet7Zi2bSedlD+tsSicmlca2M/K+fskW6xvquwLPSBivxnLT24O
 +ppg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Ee4SkfpD
Subject: Re: [Buildroot] [PATCH 00/21] Add ti_j721e_sk_defconfig
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleGFuZGVyLAoKTGUgMTUvMDIvMjAyNCDDoCAyMjoxNCwgQWxleGFuZGVyIFN2ZXJk
bGluIGEgw6ljcml0wqA6Cj4gSGkgUm9tYWluLAo+IAo+IE9uIFRodSwgMjAyNC0wMi0xNSBhdCAx
MjoyMyArMDEwMCwgUm9tYWluIE5hb3VyIHdyb3RlOgo+PiBBbHNvIHRoZSB0aV9hbTYyeF9za19k
ZWZjb25maWcgaXMgZXhwZWN0aW5nIGEgR1AgU29DIHNvIHlvdSBtYXkgaGF2ZSB0bwo+PiBjdXN0
b21pemUgdGhlIGltYWdlIGdlbmVyYXRlZCBpbiBhIHBvc3QtYnVpbGQgc2NyaXB0Pwo+Pgo+PiBN
YXliZSB5b3UgaGF2ZSB0byByZXBsYWNlIHRoZSB0aWJvb3QzLmJpbiBiaW5hcnkgaW5jbHVkZWQg
YnkgZ2VuaW1hZ2Ugd2l0aCB0aGUKPj4gb25lIGZvciB0aGUgSFMtRlMgdmFyaWFudCA/Cj4+Cj4+
IGZvciBqNzIxZToKPj4gwqDCoMKgIDI4NTQ0OSAxMyBmw6l2ci4gMTc6MjcgdGlib290My5iaW4K
Pj4gwqDCoMKgIDI4NTQ0OSAxMyBmw6l2ci4gMTc6MjcgdGlib290My1qNzIxZS1ncC1ldm0uYmlu
Cj4+IMKgwqDCoCAyODYyMjQgMTMgZsOpdnIuIDE3OjI3IHRpYm9vdDMtajcyMWVfc3IxXzEtaHMt
ZXZtLmJpbgo+PiDCoMKgwqAgMjg2MjI0IDEzIGbDqXZyLiAxNzoyNyB0aWJvb3QzLWo3MjFlX3Ny
Mi1ocy1mcy1ldm0uYmluCj4+Cj4+IGZvciBhbTYyeDoKPj4gwqDCoMKgIHRpYm9vdDMuYmluIDw8
IHNob3VsZCBiZSB0aGUgZ3AgdmFyaWFudCBieSBkZWZhdWx0Cj4+IMKgwqDCoCB0aWJvb3QzLWFt
NjJ4LWdwLWV2bS5iaW4KPj4gwqDCoMKgIHRpYm9vdDMtYW02MngtaHMtZnMtZXZtLmJpbgo+IAo+
IFRoYXQncyBub3QgdGhlIGNhc2UgYW55IG1vcmUsIGFmdGVyCj4gbWFrZSBjbGVhbjsgbWFrZSB0
aV9hbTYyeF9za19kZWZjb25maWc7IG1ha2UKPiAKPiBJIGdldDoKPiAKPiAgaW1hZ2VzXSQgbHMg
LWwKPiAuLi4KPiAtcnctci0tci0tIDEgLi4uICAgIDI4MjU0NSBGZWIgMTUgMjE6MjQgdGlib290
My1hbTYyeC1ncC1ldm0uYmluCj4gLXJ3LXItLXItLSAxIC4uLiAgICAyODUxMzQgRmViIDE1IDIx
OjI0IHRpYm9vdDMtYW02MngtaHMtZXZtLmJpbgo+IC1ydy1yLS1yLS0gMSAuLi4gICAgMjg1MTM0
IEZlYiAxNSAyMToyNCB0aWJvb3QzLWFtNjJ4LWhzLWZzLWV2bS5iaW4KPiAtcnctci0tci0tIDEg
Li4uICAgIDI4NTEzNCBGZWIgMTUgMjE6MjQgdGlib290My5iaW4KPiAKPiBCdXQsIHdlbGwsIHRo
aXMgc2VlbXMgdG8gYmUgYW4gdXBzdHJlYW0gY2hhbmdlIGluIFUtQm9vdC4KCkdvb2QgY2F0Y2gh
CgpJbmRlZWQsIHRoZXJlIGlzIGFuIGluY29uc2lzdGVuY3kgYmV0d2VlbiBLMyBTb0Mgc3VwcG9y
dCBpbiBiaW5tYW4sIHRoZSBqNzIxZSBieQpkZWZhdWx0IGlzIEdQIHdoaWxlIG90aGVyIGFyZSBo
cy1mcy4KCkl0IHNlZW1zIHJlbGF0ZWQgdG8gKi1iaW5tYW4uZHRzaSBmaWxlIChub3RpY2Ugd2Vy
ZSBpcyBwbGFjZWQgdGhlIHByb3BlcnR5CnN5bWxpbmsgPSAidGlib290My5iaW4iOykKCiZiaW5t
YW4gewoJdGlib290My1hbTYyeC1ocy1mcy1ldm0uYmluIHsKCQlmaWxlbmFtZSA9ICJ0aWJvb3Qz
LWFtNjJ4LWhzLWZzLWV2bS5iaW4iOwoJCXN5bWxpbmsgPSAidGlib290My5iaW4iOwoKaHR0cHM6
Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvdS1ib290Ly0vYmxvYi92MjAyNC4wMS9hcmNoL2FybS9k
dHMvazMtYW02MjUtc2stYmlubWFuLmR0c2k/cmVmX3R5cGU9dGFncyNMNTgKCiZiaW5tYW4gewoJ
dGlib290My1hbTY0eF9zcjItaHMtZnMtZXZtLmJpbiB7CgkJZmlsZW5hbWUgPSAidGlib290My1h
bTY0eF9zcjItaHMtZnMtZXZtLmJpbiI7CgkJc3ltbGluayA9ICJ0aWJvb3QzLmJpbiI7CgoKaHR0
cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvdS1ib290Ly0vYmxvYi92MjAyNC4wMS9hcmNoL2Fy
bS9kdHMvazMtYW02NHgtYmlubWFuLmR0c2k/cmVmX3R5cGU9dGFncyNMNTAKCiZiaW5tYW4gewoJ
dGlib290My1qNzIxZS1ncC1ldm0uYmluIHsKCQlmaWxlbmFtZSA9ICJ0aWJvb3QzLWo3MjFlLWdw
LWV2bS5iaW4iOwoJCXN5bWxpbmsgPSAidGlib290My5iaW4iOwoKaHR0cHM6Ly9zb3VyY2UuZGVu
eC5kZS91LWJvb3QvdS1ib290Ly0vYmxvYi92MjAyNC4wMS9hcmNoL2FybS9kdHMvazMtajcyMWUt
YmlubWFuLmR0c2k/cmVmX3R5cGU9dGFncyNMMjEwCgpNYXliZSBpdCB3b3VsZCBiZSBhIGdvb2Qg
aWRlYSB0byBpZ25vcmUgdGhlIHN5bWxpbmsgY3JlYXRlZCBieSB1Ym9vdCBhbmQgY3JlYXRlCnRo
ZSBzeW1saW5rIG91cnNlbGYgaW4gQklOQVJJRVNfRElSLgoKPiAKPiBIb3dldmVyLCB0aGVyZSBz
ZWVtcyB0byBiZSBubyBhbHRlcm5hdGl2ZSB0bwo+IAo+IEJSMl9UQVJHRVRfVElfSzNfSU1BR0Vf
R0VOX1NFQ1RZUEUsIGFmdGVyIHJlbW92YWwgb2YgCj4gYm9vdC90aS1rMy1pbWFnZS1nZW4gcGFj
a2FnZS4gUGVvcGxlIHdpdGggU0stQU02MiB3aWxsIGZpbmQKPiB0aGVpciBib2FyZHMgc2lsZW50
bHkgYnJva2VuIChHUCB2YXJpYW50cykuCj4gCgpXaGF0IGFib3V0IEJSMl9UQVJHRVRfVElfSzNf
UjVfTE9BREVSX1NFQ1RZUEUgb3B0aW9uIHRvIHNlbGVjdCB0aGUgZGVmYXVsdAp0aWJvb3QzLmJp
biAoYW5kIHN5c2Z3Lml0YiBpZiBhbnkpPwoKQmVzdCByZWdhcmRzLApSb21haW4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
