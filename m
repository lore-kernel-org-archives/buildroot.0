Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D528C4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 21:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78AA181B36;
	Thu, 15 Feb 2024 21:14:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FI_UgUnb4x7N; Thu, 15 Feb 2024 21:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F38181BB0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F38181BB0;
	Thu, 15 Feb 2024 21:14:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF3651BF83A
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 21:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCA036073E
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 21:14:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KvQ_ApvoT48L for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 21:14:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 16AD9606C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16AD9606C5
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16AD9606C5
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 21:14:43 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33ce2d1ab86so36284f8f.2
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 13:14:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708031682; x=1708636482;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/39HuHLOVwlmJ29NokibLOf7ZzZ1OGEtXz4p2O4reLs=;
 b=F/bFWYMeHDQbaCYuP0pcn33KGdxyax++T85TzVgS9KdpErbMToZvAW4VmRkB1Ttz0E
 qHa03jSaAgwapHy7DtRObapx0jqEiy6U8KXqewxfoQvNurSFSoqX41eEumGbOoAbAPpl
 DqmeQr8H2HwKICV3sX8KbQbBcZ3Dd/vc7W/lWveQ6ixOCLzkI4ZWVsCx2kmmrCY6Fn2O
 1f3zHkQZf3ckrzPf40RjSP1lkx2XG5HQ+vMD+OONYUBSdBn8CqV/JtfkaUg0zIdHpNTw
 AiHnA9/cshjZH6CpenrycWghwUZS7TidrKxV0wusN2xmxs86LmEvDlMnXW1Sski1Di1m
 efEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTAE1NWK3vnpZ7eZZF8LWUoGKO7sAjw0JcOLG9/9NfKgrH9VdjrHR162wsmYDhXqjL+J6woKuQWEuofbCLhOdaCSe7rIaoKg==
X-Gm-Message-State: AOJu0Yzssvt0QdgWipFMiBY/ykbAdvGZ4bzKMURTsuxsut9VJsFFEXwg
 8Hzl/0JDFccQF0VJd4bbQX5zo2FaaAi0zutTy7BVFzgdt1rBwH2V
X-Google-Smtp-Source: AGHT+IGC6l4WjoTH9id/T+DxlRk4mEiDxZzXBZQ36n4YgVwsPv3JUNM3ZM3AOIitahfoSxKHruopaw==
X-Received: by 2002:a5d:4a43:0:b0:33c:f627:3bee with SMTP id
 v3-20020a5d4a43000000b0033cf6273beemr1921970wrs.35.1708031681947; 
 Thu, 15 Feb 2024 13:14:41 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 bh12-20020a05600c3d0c00b0041207e096b2sm311958wmb.1.2024.02.15.13.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 13:14:41 -0800 (PST)
Message-ID: <1f1cca3eae4fc651a9f02e4e64407a355cb39f2e.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Thu, 15 Feb 2024 22:14:42 +0100
In-Reply-To: <63114771-4fb0-4b6f-bdac-e4363b4e9e52@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <11856419bb18257086aaf4c5b45663cdae1292cc.camel@gmail.com>
 <63114771-4fb0-4b6f-bdac-e4363b4e9e52@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708031682; x=1708636482; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/39HuHLOVwlmJ29NokibLOf7ZzZ1OGEtXz4p2O4reLs=;
 b=LnCAFgbV30RNkSYld73tX6YFGp6LrJtCbPx2GvtVKpZTGy8ALY4wn23HUb2ZGoeNcJ
 tb1z7jlnI4q23ojP+/DtLJax+pd63Unjnu6WWMDV251D6oGrngIVGNa0t4EAgzXiEGnA
 RBrxa0YAw4F0nIq3XnEDHKM3b27qeiRlnYSZ63h6R3L6iZk5tbzSfiPE1qI/72B46oqC
 ZD05EyER7EKRa3XjNui52/T1UE15AoHCzuzprbYDg6ry5Z1uS2NqAB2YX0KRjx/FJ22S
 21bHN77ZKmT8LgYinEd4bHaUXIJOojSQtGNBCJmxRPPaSPc1KsJNduTV8W7dEtaFYg92
 TwBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LnCAFgbV
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

SGkgUm9tYWluLAoKT24gVGh1LCAyMDI0LTAyLTE1IGF0IDEyOjIzICswMTAwLCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gQWxzbyB0aGUgdGlfYW02Mnhfc2tfZGVmY29uZmlnIGlzIGV4cGVjdGluZyBh
IEdQIFNvQyBzbyB5b3UgbWF5IGhhdmUgdG8KPiBjdXN0b21pemUgdGhlIGltYWdlIGdlbmVyYXRl
ZCBpbiBhIHBvc3QtYnVpbGQgc2NyaXB0Pwo+IAo+IE1heWJlIHlvdSBoYXZlIHRvIHJlcGxhY2Ug
dGhlIHRpYm9vdDMuYmluIGJpbmFyeSBpbmNsdWRlZCBieSBnZW5pbWFnZSB3aXRoIHRoZQo+IG9u
ZSBmb3IgdGhlIEhTLUZTIHZhcmlhbnQgPwo+IAo+IGZvciBqNzIxZToKPiDCoMKgwqAgMjg1NDQ5
IDEzIGbDqXZyLiAxNzoyNyB0aWJvb3QzLmJpbgo+IMKgwqDCoCAyODU0NDkgMTMgZsOpdnIuIDE3
OjI3IHRpYm9vdDMtajcyMWUtZ3AtZXZtLmJpbgo+IMKgwqDCoCAyODYyMjQgMTMgZsOpdnIuIDE3
OjI3IHRpYm9vdDMtajcyMWVfc3IxXzEtaHMtZXZtLmJpbgo+IMKgwqDCoCAyODYyMjQgMTMgZsOp
dnIuIDE3OjI3IHRpYm9vdDMtajcyMWVfc3IyLWhzLWZzLWV2bS5iaW4KPiAKPiBmb3IgYW02Mng6
Cj4gwqDCoMKgIHRpYm9vdDMuYmluIDw8IHNob3VsZCBiZSB0aGUgZ3AgdmFyaWFudCBieSBkZWZh
dWx0Cj4gwqDCoMKgIHRpYm9vdDMtYW02MngtZ3AtZXZtLmJpbgo+IMKgwqDCoCB0aWJvb3QzLWFt
NjJ4LWhzLWZzLWV2bS5iaW4KClRoYXQncyBub3QgdGhlIGNhc2UgYW55IG1vcmUsIGFmdGVyCm1h
a2UgY2xlYW47IG1ha2UgdGlfYW02Mnhfc2tfZGVmY29uZmlnOyBtYWtlCgpJIGdldDoKCiBpbWFn
ZXNdJCBscyAtbAouLi4KLXJ3LXItLXItLSAxIC4uLiAgICAyODI1NDUgRmViIDE1IDIxOjI0IHRp
Ym9vdDMtYW02MngtZ3AtZXZtLmJpbgotcnctci0tci0tIDEgLi4uICAgIDI4NTEzNCBGZWIgMTUg
MjE6MjQgdGlib290My1hbTYyeC1ocy1ldm0uYmluCi1ydy1yLS1yLS0gMSAuLi4gICAgMjg1MTM0
IEZlYiAxNSAyMToyNCB0aWJvb3QzLWFtNjJ4LWhzLWZzLWV2bS5iaW4KLXJ3LXItLXItLSAxIC4u
LiAgICAyODUxMzQgRmViIDE1IDIxOjI0IHRpYm9vdDMuYmluCgpCdXQsIHdlbGwsIHRoaXMgc2Vl
bXMgdG8gYmUgYW4gdXBzdHJlYW0gY2hhbmdlIGluIFUtQm9vdC4KCkhvd2V2ZXIsIHRoZXJlIHNl
ZW1zIHRvIGJlIG5vIGFsdGVybmF0aXZlIHRvCgpCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9T
RUNUWVBFLCBhZnRlciByZW1vdmFsIG9mIApib290L3RpLWszLWltYWdlLWdlbiBwYWNrYWdlLiBQ
ZW9wbGUgd2l0aCBTSy1BTTYyIHdpbGwgZmluZAp0aGVpciBib2FyZHMgc2lsZW50bHkgYnJva2Vu
IChHUCB2YXJpYW50cykuCgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
