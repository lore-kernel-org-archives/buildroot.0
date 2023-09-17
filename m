Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB37CD13CF
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 17:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19E6F81E15;
	Sun, 17 Sep 2023 17:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19E6F81E15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fYoW3CmrzOlS; Sun, 17 Sep 2023 17:52:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 368C981ED9;
	Sun, 17 Sep 2023 17:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 368C981ED9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F34101BF3E5
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 17:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC76281ED9
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 17:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC76281ED9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tpxhU2lQS5Op for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 17:52:22 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9466381E15
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 17:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9466381E15
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b962535808so60535501fa.0
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 10:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694973140; x=1695577940;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r3hChj8pF0MngJwTAmz9O39Hbh9T5Rx62ZNRXiG+tvc=;
 b=k+s7OnN8nd0x07sD3NY/Qrpgjbqt0RpKFVTryy2bfjfoQHoOQHBkN4GxfYomGkBAJS
 3a9e+a6R8oCN+wfQUb9Ho1el1CFLulwCwBzV1O1FfYTHPdg6Msd1YiB5loxvlqlIXMYb
 yKekKB0GCYFbL0PaUXXKe4mqwoq8unCLfBEcOX1+tP9UNLxAhZBnBXbUasBSU2CbmtId
 8IwCauBe7uhYp9IMoMwOZC+056tzKeEUJd/PH7+dHMLe48aT40iwUNCXbYlYaOmj9IAR
 dJNMgDTOpWLAGoC/ZuwGSKLSj0eUyGIql5zTx6hhoVIiMSb2LHJ/8JqOA2HheaEHY4CM
 1wOA==
X-Gm-Message-State: AOJu0Yy2Pt84ylu7AtaN4SxAvh2Gll8QGboi3QGekzvkI0YEanW/DU33
 fkoyd5uZCgRua/m1FIwYvk1oqEbwkA8=
X-Google-Smtp-Source: AGHT+IHco2f/mm6YpCJfO5noIJektFHQPL6mYXp7Gn60WEMxYKa4Cbt0pkB9Q4AKtdQ3c5+pmc6ChA==
X-Received: by 2002:a19:430d:0:b0:502:f469:d4d5 with SMTP id
 q13-20020a19430d000000b00502f469d4d5mr5503483lfa.19.1694973139857; 
 Sun, 17 Sep 2023 10:52:19 -0700 (PDT)
Received: from [192.168.10.7] ([188.191.244.230])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a056512201300b005030b40aa56sm419419lfb.173.2023.09.17.10.52.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Sep 2023 10:52:19 -0700 (PDT)
Message-ID: <670e8d23-a7d8-e993-adae-5ea1935a1a41@gmail.com>
Date: Sun, 17 Sep 2023 20:52:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: ru-RU
To: buildroot@buildroot.org
References: <20230916104655.1855916-1-m.niestroj@grinn-global.com>
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <20230916104655.1855916-1-m.niestroj@grinn-global.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694973140; x=1695577940; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r3hChj8pF0MngJwTAmz9O39Hbh9T5Rx62ZNRXiG+tvc=;
 b=DDpDsLHujACbeE5V1NjVrxKRmoNy0RCBLjamx+YEhKms6wzI2xsWrClfzcnU5pq4P6
 3ouzszSVpO9RScRCeUAHgFBU7Sqjma58+A4Sm+E0RlhM+W1U6iy9zIg4T2cFF8vF9/Vx
 U5FLhZTSqFx18Y1TFGOy6sQD93aGI+BRu3wk7H9UnStwkc+UVPxtfJqL6qC8VH0gPQFp
 OmT4zHtjvyVOpnZJew9JOhcBn7YWYwF324KCgJchS+tv9KZcAgYiLKt51Lssl7YHrHvq
 bhTSu/Joxt6NzB8+h1r/0wTGVAWdQ5oJCwtwUpJhoLC8690HxKuNLroH4Xgtzahj8+TM
 zijw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DDpDsLHu
Subject: Re: [Buildroot] [PATCH] board: add Orangepi Zero3 support
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sIE1hcmNpbiBOaWVzdHJvai4KTmV0d29ya2luZyBkb2VzIG5vdCB3b3JrIHdpdGggdGhp
cyBrZXJuZWwgY29uZmlndXJhdGlvbi4gSSBzdWdnZXN0IHVzaW5nIAp0aGUgImxpbnV4X3N1bnhp
NjQiIGNvbmZpZ3VyYXRpb24uCgoxNi4wOS4yMDIzIDEzOjQ2LCBNYXJjaW4gTmllc3Ryb2og0L/Q
uNGI0LXRgjoKPiBBZGQgaW5pdGlhbCBzdXBwb3J0IGZvciBPcmFuZ2VwaSBaZXJvMyBib2FyZDoK
PiAtIFUtQm9vdCAyMDIxLjA3IGZvcmsgYnkgT3JhbmdlcGkKPiAtIExpbnV4IDYuMS4zMSBmb3Jr
IGJ5IE9yYW5nZXBpCj4gLSBEZWZhdWx0IHBhY2thZ2VzIGZyb20gYnVpbGRyb290Cj4gCj4gRW5h
YmxlIENPTkZJR19NRkRfQUMyMDAgYXMgaXQgaXMgdXNlZCBkaXJlY3RseSBieSBvdGhlciBtb2R1
bGUsCj4gcmVzdWx0aW5nIGluIGJ1aWxkIGZhaWx1cmUgd2hlbiBkaXNhYmxlZC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXJjaW4gTmllc3Ryb2ogPG0ubmllc3Ryb2pAZ3Jpbm4tZ2xvYmFsLmNvbT4K
PiAtLS0KPiAgIGJvYXJkL29yYW5nZXBpL29yYW5nZXBpLXplcm8zL2xpbnV4LmNvbmZpZyB8ICAx
ICsKPiAgIGJvYXJkL29yYW5nZXBpL29yYW5nZXBpLXplcm8zL3JlYWRtZS50eHQgICB8IDM0ICsr
KysrKysrKysrKysKPiAgIGNvbmZpZ3Mvb3JhbmdlcGlfemVybzNfZGVmY29uZmlnICAgICAgICAg
ICB8IDU2ICsrKysrKysrKysrKysrKysrKysrKysKPiAgIDMgZmlsZXMgY2hhbmdlZCwgOTEgaW5z
ZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL29yYW5nZXBpL29yYW5nZXBp
LXplcm8zL2xpbnV4LmNvbmZpZwo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL29yYW5nZXBp
L29yYW5nZXBpLXplcm8zL3JlYWRtZS50eHQKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdz
L29yYW5nZXBpX3plcm8zX2RlZmNvbmZpZwo+IAo+IGRpZmYgLS1naXQgYS9ib2FyZC9vcmFuZ2Vw
aS9vcmFuZ2VwaS16ZXJvMy9saW51eC5jb25maWcgYi9ib2FyZC9vcmFuZ2VwaS9vcmFuZ2VwaS16
ZXJvMy9saW51eC5jb25maWcKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAuLjA5YjdhOTNhNWEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYm9hcmQvb3JhbmdlcGkvb3Jh
bmdlcGktemVybzMvbGludXguY29uZmlnCj4gQEAgLTAsMCArMSBAQAo+ICtDT05GSUdfTUZEX0FD
MjAwPXkKPiBkaWZmIC0tZ2l0IGEvYm9hcmQvb3JhbmdlcGkvb3JhbmdlcGktemVybzMvcmVhZG1l
LnR4dCBiL2JvYXJkL29yYW5nZXBpL29yYW5nZXBpLXplcm8zL3JlYWRtZS50eHQKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjQ4NzJhMzYzZTcKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvYm9hcmQvb3JhbmdlcGkvb3JhbmdlcGktemVybzMvcmVhZG1lLnR4dAo+IEBA
IC0wLDAgKzEsMzQgQEAKPiArSW50cm8KPiArPT09PT0KPiArCj4gK1RoaXMgZGVmYXVsdCBjb25m
aWd1cmF0aW9uIHdpbGwgYWxsb3cgeW91IHRvIHN0YXJ0IGV4cGVyaW1lbnRpbmcgd2l0aCB0aGUK
PiArYnVpbGRyb290IGVudmlyb25tZW50IGZvciB0aGUgT3JhbmdlcGkgWmVybzMuIFdpdGggdGhl
IGN1cnJlbnQgY29uZmlndXJhdGlvbgo+ICtpdCB3aWxsIGJyaW5nLXVwIHRoZSBib2FyZCwgYW5k
IGFsbG93IGFjY2VzcyB0aHJvdWdoIHRoZSBzZXJpYWwgY29uc29sZS4KPiArCj4gK09yYW5nZXBp
IFplcm8zIGxpbms6Cj4gK2h0dHA6Ly93d3cub3JhbmdlcGkub3JnL2h0bWwvaGFyZFdhcmUvY29t
cHV0ZXJBbmRNaWNyb2NvbnRyb2xsZXJzL2RldGFpbHMvT3JhbmdlLVBpLVplcm8tMy5odG1sCj4g
Kwo+ICtUaGlzIGNvbmZpZ3VyYXRpb24gdXNlcyBPcmFuZ2VwaSdzIGZvcmsgb2YgVS1Cb290IGFu
ZCBMaW51eCBrZXJuZWwuCj4gKwo+ICtIb3cgdG8gYnVpbGQKPiArPT09PT09PT09PT09Cj4gKwo+
ICsgICAgJCBtYWtlIG9yYW5nZXBpX3plcm8zX2RlZmNvbmZpZwo+ICsgICAgJCBtYWtlCj4gKwo+
ICtOb3RlOiB5b3Ugd2lsbCBuZWVkIGFjY2VzcyB0byB0aGUgaW50ZXJuZXQgdG8gZG93bmxvYWQg
dGhlIHJlcXVpcmVkCj4gK3NvdXJjZXMuCj4gKwo+ICtIb3cgdG8gd3JpdGUgdGhlIFNEIGNhcmQK
PiArPT09PT09PT09PT09PT09PT09PT09PT09Cj4gKwo+ICtPbmNlIHRoZSBidWlsZCBwcm9jZXNz
IGlzIGZpbmlzaGVkIHlvdSB3aWxsIGhhdmUgYW4gaW1hZ2UgY2FsbGVkICJzZGNhcmQuaW1nIgo+
ICtpbiB0aGUgb3V0cHV0L2ltYWdlcy8gZGlyZWN0b3J5Lgo+ICsKPiArQ29weSB0aGUgYm9vdGFi
bGUgInNkY2FyZC5pbWciIG9udG8gYW4gU0QgY2FyZCB3aXRoICJkZCI6Cj4gKwo+ICsgICQgc3Vk
byBkZCBpZj1vdXRwdXQvaW1hZ2VzL3NkY2FyZC5pbWcgb2Y9L2Rldi9zZFgKPiArICAkIHN1ZG8g
c3luYwo+ICsKPiArSW5zZXJ0IHRoZSBtaWNybyBTRGNhcmQgaW4geW91ciBPcmFuZ2VwaSBaZXJv
MyBhbmQgcG93ZXIgaXQgdXAuIFRoZSBjb25zb2xlCj4gK2lzIG9uIHRoZSBzZXJpYWwgbGluZSwg
MTE1MjAwIDhOMS4KPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9vcmFuZ2VwaV96ZXJvM19kZWZjb25m
aWcgYi9jb25maWdzL29yYW5nZXBpX3plcm8zX2RlZmNvbmZpZwo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uZTg4ZTRhOWZkOAo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9jb25maWdzL29yYW5nZXBpX3plcm8zX2RlZmNvbmZpZwo+IEBAIC0wLDAgKzEsNTYgQEAKPiAr
QlIyX2FhcmNoNjQ9eQo+ICtCUjJfY29ydGV4X2E1Mz15Cj4gK0JSMl9BUk1fRlBVX1ZGUFY0PXkK
PiArCj4gK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl8xPXkKPiArQlIy
X1JPT1RGU19ERVZJQ0VfQ1JFQVRJT05fRFlOQU1JQ19NREVWPXkKPiArQlIyX1NZU1RFTV9ESENQ
PSJldGgwIgo+ICsKPiArIyBGaXJtd2FyZQo+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1X
QVJFPXkKPiArQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTj15
Cj4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9
InYyLjkiCj4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfUExBVEZPUk09InN1bjUw
aV9oNjE2Igo+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0JMMzE9eQo+ICsKPiAr
IyBCb290bG9hZGVyCj4gK0JSMl9UQVJHRVRfVUJPT1Q9eQo+ICtCUjJfVEFSR0VUX1VCT09UX0JV
SUxEX1NZU1RFTV9LQ09ORklHPXkKPiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVEFSQkFMTD15
Cj4gK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbCBnaXRo
dWIsb3JhbmdlcGkteHVubG9uZyx1LWJvb3Qtb3JhbmdlcGksNmZlMTdmYWMzODhhYWQxNzQ5MGNm
Mzg2NTc4Yjc1MzI5NzVlNTY3ZikvdS1ib290LW9yYW5nZXBpLTZmZTE3ZmFjMzg4YWFkMTc0OTBj
ZjM4NjU3OGI3NTMyOTc1ZTU2N2YudGFyLmd6Igo+ICtCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RF
RkNPTkZJRz0ib3JhbmdlcGlfemVybzMiCj4gK0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfRFRDPXkK
PiArQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVOU1NMPXkKPiArQlIyX1RBUkdFVF9VQk9PVF9O
RUVEU19QWVRIT04zPXkKPiArQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWUxJQkZEVD15Cj4gK0JS
Ml9UQVJHRVRfVUJPT1RfTkVFRFNfQVRGX0JMMzE9eQo+ICtCUjJfVEFSR0VUX1VCT09UX1NQTD15
Cj4gK0JSMl9UQVJHRVRfVUJPT1RfU1BMX05BTUU9InUtYm9vdC1zdW54aS13aXRoLXNwbC5iaW4i
Cj4gK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX01BS0VPUFRTPSJTQ1A9L2Rldi9udWxsIgo+ICsK
PiArIyBLZXJuZWwKPiArQlIyX0xJTlVYX0tFUk5FTD15Cj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VT
VE9NX1RBUkJBTEw9eQo+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9UQVJCQUxMX0xPQ0FUSU9O
PSIkKGNhbGwgZ2l0aHViLG9yYW5nZXBpLXh1bmxvbmcsbGludXgtb3JhbmdlcGksMzQ5NWI1ZWUw
NTk0NTY2YzlmZWQ5MzBiOTZiMWNhZTkwNjAwNDEyZSkvbGludXgtb3JhbmdlcGktMzQ5NWI1ZWUw
NTk0NTY2YzlmZWQ5MzBiOTZiMWNhZTkwNjAwNDEyZS50YXIuZ3oiCgpZb3UgbmVlZCB0byByZXBs
YWNlIHRoZSBsaW5lOgo+ICtCUjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09ORklH
PXkKQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9ImxpbnV4X3N1bnhpNjQiCgo+ICtCUjJfTElO
VVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKPiArQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05B
TUU9ImFsbHdpbm5lci9zdW41MGktaDYxNi1vcmFuZ2VwaS16ZXJvMyIKPiArQlIyX0xJTlVYX0tF
Uk5FTF9ORUVEU19IT1NUX09QRU5TU0w9eQo+ICtCUjJfTElOVVhfS0VSTkVMX0lOU1RBTExfVEFS
R0VUPXkKPiArQlIyX0xJTlVYX0tFUk5FTF9EVEJfS0VFUF9ESVJOQU1FPXkKPiArQlIyX0xJTlVY
X0tFUk5FTF9DT05GSUdfRlJBR01FTlRfRklMRVM9ImJvYXJkL29yYW5nZXBpL29yYW5nZXBpLXpl
cm8zL2xpbnV4LmNvbmZpZyIKPiArCj4gKyMgRmlsZXN5c3RlbQo+ICtCUjJfVEFSR0VUX0dFTkVS
SUNfSVNTVUU9IldlbGNvbWUgdG8gT3JhbmdlcGkgWmVybzMiCj4gK0JSMl9UQVJHRVRfUk9PVEZT
X0VYVDI9eQo+ICtCUjJfVEFSR0VUX1JPT1RGU19FWFQyXzQ9eQoKSXQgaXMgbmVjZXNzYXJ5IHRv
IGluY3JlYXNlIHRoZSBzaXplIG9mIHRoZSByb290ZnMsIGJlY2F1c2UgdGhlIGtlcm5lbCAKc2l6
ZSBoYXMgYmVjb21lIGxhcmdlcjoKPiArQlIyX1RBUkdFVF9ST09URlNfRVhUMl9TSVpFPSIxMjBN
IgpCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjIwME0iCgpZb3UgbmVlZCB0byBhZGQgdGhp
cyBsaW5lIHRvIGF2b2lkIGNyZWF0aW5nIGEgdGFyIGFyY2hpdmU6CiMgQlIyX1RBUkdFVF9ST09U
RlNfVEFSIGlzIG5vdCBzZXQKCj4gKwo+ICsjIGhvc3QgdG9vbHMKPiArQlIyX1BBQ0tBR0VfSE9T
VF9HRU5JTUFHRT15Cj4gK0JSMl9QQUNLQUdFX0hPU1RfVUJPT1RfVE9PTFM9eQo+ICsKPiArIyBp
bWFnZSBzY3JpcHRzCj4gK0JSMl9ST09URlNfUE9TVF9CVUlMRF9TQ1JJUFQ9ImJvYXJkL29yYW5n
ZXBpL2NvbW1vbi9wb3N0LWJ1aWxkLnNoIgo+ICtCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBU
PSJzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2giCj4gK0JSMl9ST09URlNfUE9TVF9TQ1JJUFRf
QVJHUz0iLWMgJChCSU5BUklFU19ESVIpL2dlbmltYWdlLmNmZyIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
