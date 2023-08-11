Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0ADC0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 20:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6889613CE;
	Fri, 11 Aug 2023 20:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6889613CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QjGqNqZFagQf; Fri, 11 Aug 2023 20:18:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D89E360F13;
	Fri, 11 Aug 2023 20:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D89E360F13
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F1BE1BF588
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 20:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 537A8408AE
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 20:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 537A8408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rQSrUJBhBFU7 for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 20:18:21 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2152E4089F
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 20:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2152E4089F
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51e2a6a3768so3158613a12.0
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 13:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691785099; x=1692389899;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1u+tooWEl7vXAkjEw1O8smKYwPVQRDaS5gZcVRHBGpU=;
 b=RksAq5v1vfvYCqBxk6tvLvZ7LfKWD/nXwDq68GLWvnYXpYkXLpMCTHr7YSKbtW5skm
 t71Ksst4lj+6hx02kFa5JG1Yr+bOCv5YJ1UizS8/n4iZFdxT2dEru1Zq/cZa/2CH5x0S
 PcuwlUpHpP+jWSh3SPRMwS//w4E3FN3/MQXOYLXhcfs+v83HIMFPcwO09qrGWvUdD7Ek
 WIv+oQzjG98WaCEnX8jXNCscEW57qKOgppLE1U8Bvq9gcIx439VoAPdGr5YzIN4y/qaF
 Yw5ezxGGEb0hC4bqQ28h6X4V/YpsbMYQMmKXqaptPdJf0dnpsdpM5mCwgjuaKFpeGQpj
 3ucA==
X-Gm-Message-State: AOJu0Yxwq9MfWW+DDslJIZCZP+cEoU37HE4fR5uUiiPnx0WlVhEzU0FS
 BLONq+/mgO6VwX1Bkdt5MfapHg==
X-Google-Smtp-Source: AGHT+IFtV8BPQw9JlYhzVDbhn+c+vU1dgicqK3VPwxzpLZTifgRHU9YRrmGijUd2I8ZSDr39GWFL5A==
X-Received: by 2002:a17:906:23ea:b0:99b:f44e:6daa with SMTP id
 j10-20020a17090623ea00b0099bf44e6daamr2061560ejg.62.1691785099204; 
 Fri, 11 Aug 2023 13:18:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a1709063ec300b0099bcb44493fsm2657654ejj.147.2023.08.11.13.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 13:18:18 -0700 (PDT)
Message-ID: <03e35eba-6a35-f185-2d32-b7eab93beb05@mind.be>
Date: Fri, 11 Aug 2023 22:18:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Nicolas Boichat <drinkcat@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230806121729.3552502-1-drinkcat@google.com>
 <20230806153308.4c0cf791@windsurf>
 <CAHRZCZXdNk2w2965JOubzue=_+i+8DU1YvVvwUKv5PrsKeVMOA@mail.gmail.com>
In-Reply-To: <CAHRZCZXdNk2w2965JOubzue=_+i+8DU1YvVvwUKv5PrsKeVMOA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1691785099; x=1692389899;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1u+tooWEl7vXAkjEw1O8smKYwPVQRDaS5gZcVRHBGpU=;
 b=e90gRvqTNp1btWNM/M8yqcOiW0Uj5jdKAryW5kjGXHeqYzYVraUNGW1h2dVwHSXYem
 wGWIoUTYKVOByXOg3hbf8Gu1w4AMDYv6EcprAvA3Zv0HEJDVa4Tfu1h1SAg4laZ2yYXQ
 IyulMUf9g3bVFzTAeSms5NvdfBjbK6tWUHBzaJBv04dsCLvhH9lL9QUsugJPfI+A3TbO
 UeZnLC3ALicbIjHKVCkoZBDzMfFI2nEL/VHQqzfOnGrH4LvwiMkEksDxiMdKVHAjTB6c
 apJEN3cDpohTSFDCHBq0kRDhoakYKRE5/VOQwr2jwjIHeugCyXAiNG5RSOgXP28Xym9b
 IAXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e90gRvqT
Subject: Re: [Buildroot] [PATCH 1/1] package/screenfetch: Add mawk/gawk
 dependency, and upstream detection patch.
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Nicolas Boichat via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNy8wOC8yMDIzIDEwOjIyLCBOaWNvbGFzIEJvaWNoYXQgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBIaSBUaG9tYXMsCj4gCj4gT24gU3VuLCBBdWcgNiwgMjAyMyBhdCA5OjMz4oCvUE0gVGhv
bWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbSAKPiA8bWFpbHRvOnRo
b21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+PiB3cm90ZToKPiAKPiAgICAgSGVsbG8gTmljb2xh
cywKPiAKPiAgICAgT24gU3VuLMKgIDYgQXVnIDIwMjMgMTI6MTc6MjkgKzAwMDAKPiAgICAgTmlj
b2xhcyBCb2ljaGF0IHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gICAg
IDxtYWlsdG86YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+PiB3cm90ZToKPiAKPiAgICAgID4gc2Ny
ZWVuZmV0Y2ggcmVxdWlyZXMgYW4gImF3ayIgaW1wbGVtZW50YXRpb246IGFkZCB0aGF0IHRvIGRl
cGVuZGVuY2llcy4KPiAgICAgID4KPiAgICAgID4gQWxzbywgdXBzdHJlYW0gd291bGQgb25seSB1
c2UgYW4gZXhlY3V0YWJsZSBjYWxsZWQgImF3ayI6IHBpY2sgdXAKPiAgICAgID4gdXBzdHJlYW0g
cGF0Y2ggdGhhdCBjYW4gYXV0b2RldGVjdCBhd2sgaW1wbGVtZW50YXRpb24sIHNvIHRoYXQKPiAg
ICAgID4gIm1hd2siIGNhbiBiZSB1c2VkLgo+ICAgICAgPgo+ICAgICAgPiBTaWduZWQtb2ZmLWJ5
OiBOaWNvbGFzIEJvaWNoYXQgPGRyaW5rY2F0QGdvb2dsZS5jb20KPiAgICAgPG1haWx0bzpkcmlu
a2NhdEBnb29nbGUuY29tPj4KPiAKPiAgICAgVGhhbmtzIGZvciB0aGUgcGF0Y2guIE9uZSBxdWVz
dGlvbiBiZWxvdy4KPiAKPiAgICAgID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc2NyZWVuZmV0Y2gv
Q29uZmlnLmluIGIvcGFja2FnZS9zY3JlZW5mZXRjaC9Db25maWcuaW4KPiAgICAgID4gaW5kZXgg
YzBlNzEwMGYzOC4uMDAyNDhiYWZjZiAxMDA2NDQKPiAgICAgID4gLS0tIGEvcGFja2FnZS9zY3Jl
ZW5mZXRjaC9Db25maWcuaW4KPiAgICAgID4gKysrIGIvcGFja2FnZS9zY3JlZW5mZXRjaC9Db25m
aWcuaW4KPiAgICAgID4gQEAgLTIsOCArMiwxMiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfU0NSRUVO
RkVUQ0gKPiAgICAgID7CoCDCoCDCoCDCoGJvb2wgInNjcmVlbmZldGNoIgo+ICAgICAgPsKgIMKg
IMKgIMKgZGVwZW5kcyBvbiBCUjJfVVNFX01NVSAjIGJhc2gKPiAgICAgID7CoCDCoCDCoCDCoGRl
cGVuZHMgb24gQlIyX1BBQ0tBR0VfQlVTWUJPWF9TSE9XX09USEVSUyAjIGJhc2gKPiAgICAgID4g
K8KgIMKgIMKgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9HQVdLIHx8IEJSMl9QQUNLQUdFX01BV0sg
IyBydW50aW1lIGRlcGVuZGVuY3kKPiAKPiAgICAgV291bGQgdGhlICJhd2siIGltcGxlbWVudGF0
aW9uIGZyb20gQnVzeWJveCBhbHNvIHdvcms/IEl0J3MgdGhlIGF3awo+ICAgICBpbXBsZW1lbnRh
dGlvbiB0aGF0IHdlIHVzZSBieSBkZWZhdWx0Lgo+IAo+IAo+IEkgaGFkIGEgcXVpY2sgdHJ5LCBh
bmQgeWVzLCBJIHRoaW5rIGJ1c3lib3gncyBhd2sgaXMgZ29vZCBlbm91Z2guCgogIFdlIGFzc3Vt
ZSB0aGF0ICJub3JtYWwgdG9vbHMiIGFyZSBhdmFpbGFibGUgaW4gdGhlIHJvb3RmcyBhbmQgZG9u
J3QgYWRkIApleHBsaWNpdCBzZWxlY3RzIGZvciB0aGVtLiBOb3JtYWwgdG9vbHMgaW5jbHVkZSBz
ZWQsIHNvcnQsIGdyZXAsIGFuZCBJTUhPIGFsc28gCmF3ay4gU28gSSBkb24ndCB0aGluayB0aGVy
ZSdzIGEgbmVlZCBmb3IgdGhpcyBhdCBhbGwuCgogIEFuZCBhbnl3YXksIHRoZSBwcmVzZW5jZSBv
ZiBidXN5Ym94IGRvZXNuJ3QgZ3VhcmFudGVlIGF0IGFsbCB0aGF0IGF3ayBpcyAKcHJlc2VudCwg
YmVjYXVzZSB5b3UgY2FuIGNvbmZpZ3VyZSBpdCBvdXQuCgogIFNvIEknZCBrZWVwIHRoZSBwYXRj
aCwgYnV0IG5vdCB0aGUgcmVzdCBvZiB0aGlzIGNvbW1pdC4KCiAgUmVnYXJkcywKICBBcm5vdXQK
CltzbmlwXQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
