Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44179C7EE2C
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 09:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8598A605B3;
	Wed, 24 May 2023 09:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8598A605B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gG61ZIDUK4lE; Wed, 24 May 2023 09:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BE7560B99;
	Wed, 24 May 2023 09:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BE7560B99
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BFB11BF3A7
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 09:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1239983C60
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 09:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1239983C60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KiBoMj4dV6wt for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 09:28:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63F7F81DFD
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63F7F81DFD
 for <buildroot@buildroot.org>; Wed, 24 May 2023 09:28:20 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-30959c0dfd6so536458f8f.3
 for <buildroot@buildroot.org>; Wed, 24 May 2023 02:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684920498; x=1687512498;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FCITjorWPPZLIkKbP/4txM9lH0jwL5EDmpPohIK9R0g=;
 b=iON2RtxIWtXldfGhX2VeuDckbOaSffVX6K79TIQqU7tOpWt7C9B2SMON9ZPTPFbb8X
 0cvaZLQAamkVyCIGxExOv7GNmB6WhssVdeV4CTSWLGHBUBu+XiWFFyrLfKLvU9VikSDG
 ox97OhX89hnMLYZmLU9ZUWYXfbcFCjmvQHOlbrTd16vuxmImconWHtmuwlXESXyokWsu
 fM81JwGeriuhGi1rSmoPrzzvGofwaCqiznpEnXiMHXju8L0fyUDJBf9Su6phGYytcB0Q
 QKmT4CLSc872XZI5dKfNG6G6+++mUMhoAKCmdVE7KS9/hYVYz1AbX6DBiV2f5zXIN9aI
 7hyw==
X-Gm-Message-State: AC+VfDxvR95BlrEFjj1lKgHU69r3vSDm6amDjR7OW2LvYqOdRn3hbx8g
 ZQHZQbGn1GFRFZernalOECDA0w==
X-Google-Smtp-Source: ACHHUZ7la71KFPkBA+GaUz4+ETPeE1A5+KgtlaYtJnSisvV07tTNlWeYXQdPAxLU9GTSKZJuSA515g==
X-Received: by 2002:a5d:4109:0:b0:306:41d3:fcb9 with SMTP id
 l9-20020a5d4109000000b0030641d3fcb9mr11504069wrp.27.1684920498497; 
 Wed, 24 May 2023 02:28:18 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a1ce915000000b003f421979398sm1646876wmc.26.2023.05.24.02.28.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 02:28:18 -0700 (PDT)
Message-ID: <14b71a8e-b821-2ba3-449e-298f1c6c0a53@smile.fr>
Date: Wed, 24 May 2023 11:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>
References: <20230428224051.259264-1-romain.naour@gmail.com>
 <20230521201134.GD621937@scaer>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230521201134.GD621937@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1684920498; x=1687512498;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FCITjorWPPZLIkKbP/4txM9lH0jwL5EDmpPohIK9R0g=;
 b=Lvyq2qmiRVbzBxp7XxX/ey+OLF6OYHuPNfTlxRtFLxZ99ufT7S4aShlx/zWbrusLQP
 F4QFQbWrENPQWlPOAr/d8X3fyR2sxOWWSElccmB3SJm1cVK4XVLIMlS3ItP67MT1WKzt
 QHJPao9DC3HJ/FztrfNQEPkFy0DdIoO1CYg5PqPjNbeZ8e2UNUU18sg9ZZqTzY7hgdEh
 rN8PZ1lCqLfobMi2AFmdItEQOuRN0qQr1R3J6EG/iTBF4ERNr0big29v3bopFUzzMsU6
 +M7j40jvgK/uho9DCUwWjH/TCMk2fys9w800em7SLpowNWGLNl72Jba0RSbLZMGMfUBS
 2RuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=Lvyq2qmi
Subject: Re: [Buildroot] [PATCH v4] configs/qemu: update defconfigs to Linux
 6.1.26
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCkxlIDIxLzA1LzIwMjMgw6AgMjI6MTEsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBTZWJhc3RpYW4sIFJvbWFpbiwgQWxsLAo+IAo+ICtKYW4tQmVuZWRpY3QgZm9yIEJa
ICMxNTU4MQo+IAo+IE9uIDIwMjMtMDQtMjkgMDA6NDAgKzAyMDAsIFJvbWFpbiBOYW91ciBzcGFr
ZSB0aHVzbHk6Cj4+IEZyb206IFNlYmFzdGlhbiBXZXllciA8c2ViYXN0aWFuLndleWVyQHNtaWxl
LmZyPgo+Pgo+PiBKdXN0IHVwZGF0aW5nIGFsbCBxZW11IGRlZmNvbmZpZ3MgdG8gdGhlIGxhdGVz
dCBLZXJuZWwgTFRTIHZlcnNpb24KPj4gaW5jbHVkaW5nIGZpcnN0IGdjYyAxMy4xIGZpeGVzIFsx
XQo+IFstLVNOSVAtLV0KPj4gIGNvbmZpZ3MvcWVtdV9wcGNfbXBjODU0NGRzX2RlZmNvbmZpZyAg
ICAgIHwgNCArKy0tCj4gWy0tU05JUC0tXQo+PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X3Bw
Y19tcGM4NTQ0ZHNfZGVmY29uZmlnIGIvY29uZmlncy9xZW11X3BwY19tcGM4NTQ0ZHNfZGVmY29u
ZmlnCj4+IGluZGV4IGI5YTA4MTJkNTIuLmNhMWE0MjkxNjcgMTAwNjQ0Cj4+IC0tLSBhL2NvbmZp
Z3MvcWVtdV9wcGNfbXBjODU0NGRzX2RlZmNvbmZpZwo+PiArKysgYi9jb25maWdzL3FlbXVfcHBj
X21wYzg1NDRkc19kZWZjb25maWcKPj4gQEAgLTE1LDEyICsxNSwxMiBAQCBCUjJfUk9PVEZTX1BP
U1RfSU1BR0VfU0NSSVBUPSJib2FyZC9xZW11L3Bvc3QtaW1hZ2Uuc2giCj4+ICBCUjJfUk9PVEZT
X1BPU1RfU0NSSVBUX0FSR1M9IiQoQlIyX0RFRkNPTkZJRykiCj4+ICAKPj4gICMgTGludXggaGVh
ZGVycyBzYW1lIGFzIGtlcm5lbAo+PiAtQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NV
U1RPTV81XzE3PXkKPj4gK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl8x
PXkKPj4gIAo+PiAgIyBLZXJuZWwKPj4gIEJSMl9MSU5VWF9LRVJORUw9eQo+PiAgQlIyX0xJTlVY
X0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Cj4+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJT
SU9OX1ZBTFVFPSI1LjE3LjciCj4+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSI2LjEuMjYiCj4+ICBCUjJfTElOVVhfS0VSTkVMX1VTRV9DVVNUT01fQ09ORklHPXkKPj4g
IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC9xZW11L3BwYy1tcGM4
NTQ0ZHMvbGludXguY29uZmlnIgo+PiAgQlIyX0xJTlVYX0tFUk5FTF9WTUxJTlVYPXkKPiAKPiBE
aWQgeW91IGFjdHVhbHkgdGVzdCB0aGlzIGNoYW5nZT8gSXQgZmFpbHMgdG8gZXZlbiBwYXRjaCB0
aGUga2VybmVsOgo+IAo+ICAgICAkIG1ha2UgZGlzdGNsZWFuCj4gICAgICQgbWFrZSBxZW11X3Bw
Y19tcGM4NTQ0ZHNfZGVmY29uZmlnCj4gICAgICQgbWFrZSBsaW51eC1wYXRjaAo+ICAgICA+Pj4g
bGludXggNi4xLjI2IFBhdGNoaW5nCj4gCj4gICAgIEFwcGx5aW5nIDAwMDEtcG93ZXJwYy1GaXgt
bWNwdS1vcHRpb25zLWZvci1TUEUtb25seS1jb21waWxlci5wYXRjaCB1c2luZyBwYXRjaDoKPiAg
ICAgcGF0Y2hpbmcgZmlsZSBhcmNoL3Bvd2VycGMvTWFrZWZpbGUKPiAgICAgSHVuayAjMSBzdWNj
ZWVkZWQgYXQgMTAgKG9mZnNldCAtMiBsaW5lcykuCj4gICAgIEh1bmsgIzIgRkFJTEVEIGF0IDE2
NC4KPiAgICAgSHVuayAjMyBzdWNjZWVkZWQgYXQgMTc0IHdpdGggZnV6eiAyIChvZmZzZXQgLTEg
bGluZXMpLgo+ICAgICAxIG91dCBvZiAzIGh1bmtzIEZBSUxFRCAtLSBzYXZpbmcgcmVqZWN0cyB0
byBmaWxlIGFyY2gvcG93ZXJwYy9NYWtlZmlsZS5yZWoKPiAgICAgbWFrZVsxXTogKioqIFtwYWNr
YWdlL3BrZy1nZW5lcmljLm1rOjI1MTogLi4uLi4vYnVpbGQvbGludXgtNi4xLjI2Ly5zdGFtcF9w
YXRjaGVkXSBFcnJvciAxCj4gICAgIG1ha2U6ICoqKiBbTWFrZWZpbGU6MjM6IF9hbGxdIEVycm9y
IDIKPiAKPiBEaXR0byBmb3IgbGludXgtaGVhZGVycywgb2YgY291cnNlLi4uCj4gCj4gU2VlOgo+
ICAgICBodHRwczovL2J1Z3MuYnVzeWJveC5uZXQvc2hvd19idWcuY2dpP2lkPTE1NTgxCj4gCj4g
Q291bGQgeW91IHJlLWNoZWNrIG9uIHlvdXIgc2lkZSwgYW5kIGFsc28gdmVyaWZ5IHRoZSBvdGhl
ciBkZWZjb25maWcKPiBmaWxlcywgcGxlYXNlPwoKT2sgb3VyIGJhZC4uLgoKVGhlIHBwYy1tcGM4
NTQ0ZHMgaXMgdGhlIG9ubHkgcWVtdSBjb25maWd1cmF0aW9uIHRoYXQgcmVxdWlyZXMgYSBrZXJu
ZWwgcGF0Y2g6CmJvYXJkL3FlbXUvcHBjLW1wYzg1NDRkcy9wYXRjaGVzL2xpbnV4LzAwMDEtcG93
ZXJwYy1GaXgtbWNwdS1vcHRpb25zLWZvci1TUEUtb25seS1jb21waWxlci5wYXRjaAoKQnV0IHRo
aXMgcGF0Y2ggZG9lc24ndCBhcHBseSBhZnRlciBhIGJhY2twb3J0IGJldHdlZW4gdjYuMS4yMCBh
bmQgdjYuMS4yMQoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2lkPWRhMGJlYWUyNDQ5Mzc2MzI2MDg2ZTlmNTc0
NjhmZDJiNjQ3MzZkMmEKClNvIHRoZSBwYXRjaCAwMDAxLXBvd2VycGMtRml4LW1jcHUtb3B0aW9u
cy1mb3ItU1BFLW9ubHktY29tcGlsZXIucGF0Y2ggZG9lc24ndApzZWVtIHJlcXVpcmVkIGFueW1v
cmUuCgpXZWxjb21lIHRvIEJ1aWxkcm9vdApidWlsZHJvb3QgbG9naW46IHJvb3QKIyB1bmFtZSAt
YQpMaW51eCBidWlsZHJvb3QgNi4xLjI4ICMxIFdlZCBNYXkgMjQgMDk6MDg6MjcgVVRDIDIwMjMg
cHBjIEdOVS9MaW51eAojIGNhdCAvcHJvYy9jcHVpbmZvCnByb2Nlc3Nvcgk6IDAKY3B1CQk6IGU1
MDB2MgpjbG9jawkJOiA0MDAuMDAwMDAwTUh6CnJldmlzaW9uCTogMy4wIChwdnIgODAyMSAwMDMw
KQpib2dvbWlwcwk6IDgwMC4wMAoKdGltZWJhc2UJOiA0MDAwMDAwMDAKcGxhdGZvcm0JOiBNUEM4
NTQ0IERTCm1vZGVsCQk6IE1QQzg1NDREUwpNZW1vcnkJCTogMTI4IE1CCgoKU2luY2UgdGhlIGlz
c3VlIGhhcyBiZWVuIHJlcG9ydGVkICh0YW5rcyBKYW4tQmVuZWRpY3QhKSwgaXQgc2VlbXMgc29t
ZSB1c2VycwpzdGlsbCBjYXJlIG9mIHRoaXMgZGVmY29uZmlnIGFuZCB0aGlzIHBwYyB2YXJpYW50
IGJ1dCBpdCByZXF1aXJlcyBnY2MgOCB3aGlsZSB3ZQphcmUgZ29pbmcgdG8gYWRkIGdjYyAxMyBh
bmQgcmVtb3ZlIGdjYyAxMAooaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVp
bGRyb290L2xpc3QvP3Nlcmllcz0zNTUyMjUpLgoKSSdtIG5vdCBzdXJlIGhvdyBsb25nIHdlIHdp
bGwgaGF2ZSB0byBrZWVwIGdjYyA4IGZvciBwcGMgd2l0aCBzcGUuCgpCZXN0IHJlZ2FyZHMsClJv
bWFpbgoKPiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
