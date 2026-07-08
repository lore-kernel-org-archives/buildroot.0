Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2369C43458
	for <buildroot@archiver.kernel.org>; Wed,  8 Jul 2026 21:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 846B56085D;
	Wed,  8 Jul 2026 21:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVCJk5HchNg3; Wed,  8 Jul 2026 21:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2B6A60760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783544509;
	bh=h6/gZfUYOf8RWqkQbAcYDUUB23VqkjEceqGhvxeRy+A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e4p7gTSVoux/ZL3jmJN2pqEgmXt7hBsRfWMrm7txvrRZkwA/0QxFQ4j3QN08YAqZq
	 kwpNp98zJ0c0c6BrGGVXUJh/d/mJytK9PR/scTxRoeeg+ygNaLSvoZOg8KRi9zCIjG
	 LzjRXTjkD7IspKfDC1OXFo5fkylJysDKIeFU+3vojS6EEO+D/+D+s3GEu2pK2zMj26
	 vAUMpWSloECGZstExtvFP2EwxRYocLE+1yfUMItBEzo6UurNxDs6q5C7yHiL19Dj6H
	 yRPymj8ctt2fJEPlZpo8h0Qv7A0avdmpvK5yh2R5i/+JZzvijFyeEZYHI+y3yBuFGn
	 izZwS7tYt3qfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2B6A60760;
	Wed,  8 Jul 2026 21:01:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA3572D1
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 21:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBE4840024
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 21:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgFN9SqswnXa for <buildroot@buildroot.org>;
 Wed,  8 Jul 2026 21:01:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F2B9440026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2B9440026
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2B9440026
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 21:01:47 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-493bfe9f886so6101375e9.0
 for <buildroot@buildroot.org>; Wed, 08 Jul 2026 14:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783544506; x=1784149306;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=C1EjhLZFnm++XOjYXDqXn3wLTc/fF9yC2L8ukyNyFMA=;
 b=jXD14mT/JLnVlwms9MN3/C1Gz4TPhBonTmqaeREvzeYlGFC0YXTOSRdMygeVUtArVk
 f7gN4oLHzhP6yOnEMjpJdYY1JfVGGlbSDxF7Ut35hoBkVCqAMRez2IoRCEUhwrB0+ymg
 FFlFBDoq9DF5sLosvj0MR+e55CUEjSPJ0PrFBF6Oj5bQkrmSWfSjb5szXpGhXzW8f8bH
 ae4emnm7NmuvVOEJWJQMBj3mpMlUVcWk4ZE7rGwimyJmtCbo1BFZBWoRGD1NRxgeN7QK
 hvpnXMfjshQ6TqXckRN59mC1TMngxXvqZ3EkCazDQGfsU4wuWt0+3T/+EIOdwWVcuc3X
 XzhA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrzNmmn1yln80WV5f6LG3XX1SdLzl882moWmI/XpOkY1TTgI/TvQ2u3gkZ9GxsqW2wwL9d9iXQtGMo=@buildroot.org
X-Gm-Message-State: AOJu0YxPGcaCpHS70BIPbdymMqV2LSZH++kCxrFLfQ5EtgKLDkh3o5yj
 ISaTNdCZPesX3DR5Xdu32dLyCSxIBzG4c1RLuyJ8qbkfhpztHS8aZYKbofHInSnBoWE=
X-Gm-Gg: AfdE7clvz+65fgYkX5tNEoVYpsIahNanfClb7ovDM3jVonX7vl923vUpDPxC5/Mhxas
 6WHwRux7665uFM82N4gIJwxvFaobKD8ST9w9U/Q9rAFvD9WgJxdCp1mKWVYgsr++2Y8Fmy/6hrh
 BrSH/6j6zvwhobmg55M2FvHUtTSjKYnkC0VEx37rk+G5zsaWApwSXsU2m2uJwpmmRSZnIa0vNWZ
 C1kepURxKHFAPVqrSE7g7BYRNnL5nv9Gkjn3qIhgZvAFVsrvO7zLkEaWbNifAOunoKbHYixkyzp
 sh992Hbe4SxjdVsihY61vNYCW8bo8AR7sh/KGK5bndt5pHzrYbixt2JBHot4OjAkVTU/9Q8axYL
 783HOoaT7deB9SSZm6T7tUBN9b4RZbitgVhmB6IO3LZBPThu89e1RpGhYJ5aDB/6VRWIgyAZvMi
 w7NjqsoHaMvVrR2RZS5zKhCwZqVhajm8JqKtb0OUKh6ml+eiBony1Mqy0qWBTBrUXNhKVoY5SHG
 Y9E/O27JZTQmt0NgOF3Y3wH3UG5CACuTksPGG8KQcjq+4bIlIcqeIw=
X-Received: by 2002:a05:600c:a55:b0:493:b163:42e8 with SMTP id
 5b1f17b1804b1-493e685fedfmr43263145e9.21.1783544505737; 
 Wed, 08 Jul 2026 14:01:45 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d6e4csm43041056f8f.10.2026.07.08.14.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 14:01:45 -0700 (PDT)
Message-ID: <d07e299f-d5c6-4418-b55f-9684b0b0da0a@smile.fr>
Date: Wed, 8 Jul 2026 23:01:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
Cc: Titouan Christophe <titouan.christophe@mind.be>
References: <8e7b71af93abe216c7715fb7394428cc6bf06aa2.1783486638.git.yann.morin@orange.com>
Content-Language: fr
In-Reply-To: <8e7b71af93abe216c7715fb7394428cc6bf06aa2.1783486638.git.yann.morin@orange.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1783544506; x=1784149306; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=C1EjhLZFnm++XOjYXDqXn3wLTc/fF9yC2L8ukyNyFMA=;
 b=ONYQUb6AP+Zb5Pc4dnetEzjST0oJm7fXeM7xdQFupxQTa5otJcZ0ZPsf08SIaQ9HrI
 4nvbI5SqCIQ7t0CtE/MXzBe+iF43CFvlJ7wRtE7T9HsLhhssXXeYRLqyo8TyNqODzKQo
 Xjv8NyCkEV/jllMAVEZ/+kNffUAWnKEwhbMag=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ONYQUb6A
Subject: Re: [Buildroot] [PATCH] package/mosquitto: host variant also needs
 cmake >= 4.3
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

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDgvMDcvMjAyNiDDoCAwNjo1NywgeWFubi5tb3JpbkBvcmFu
Z2UuY29tIGEgw6ljcml0wqA6Cj4gRnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9y
YW5nZS5jb20+Cj4gCj4gQ29tbWl0IGRhOWRjZGRmZjE1YSAocGFja2FnZS9tb3NxdWl0dG86IHJl
cXVpcmVzIGNtYWtlID49IDQuMykgYWRkZWQKPiBhIHJlcXVpcmVtZW50IGFnYWluc3QgY21ha2Ug
NC4zIGZvciB0aGUgdGFyZ2V0IHZhcmlhbnQsIGJ1dCBmb3Jnb3QKPiB0byBhZGQgdGhlIHNhbWUg
cmVxdWlyZW1lbnQgdG8gdGhlIGhvc3QgdmFyaWFudC4KPiAKPiBEbyBzbywgZm9yIHRoZSBzYW1l
IHJlYXNvbnMgYXMgcmVwb3J0ZWQgZm9yIHRoZSB0YXJnZXQgdmFyaWFudCBpbgo+IGRhOWRjZGRm
ZjE1YS4KPiAKPiBGaXhlczogZGE5ZGNkZGZmMTVhZjNlOTljYmMyMDI5N2Y0YTNkMjVlODljNjZl
MQo+IAo+IFNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW5Ab3JhbmdlLmNv
bT4KPiBDYzogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgo+IENjOiBUaXRv
dWFuIENocmlzdG9waGUgPHRpdG91YW4uY2hyaXN0b3BoZUBtaW5kLmJlPgoKQXBwbGllZCB0byBt
YXN0ZXIuIFRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IC0tLQo+ICBwYWNrYWdlL21v
c3F1aXR0by9Db25maWcuaW4uaG9zdCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tb3NxdWl0dG8vQ29uZmlnLmluLmhvc3Qg
Yi9wYWNrYWdlL21vc3F1aXR0by9Db25maWcuaW4uaG9zdAo+IGluZGV4IDM5ZTI4N2VlODkuLjdi
OTQwMDNmYWUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tb3NxdWl0dG8vQ29uZmlnLmluLmhvc3QK
PiArKysgYi9wYWNrYWdlL21vc3F1aXR0by9Db25maWcuaW4uaG9zdAo+IEBAIC0xLDQgKzEsNSBA
QAo+ICBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9NT1NRVUlUVE8KPiAgCWJvb2wgImhvc3QgbW9z
cXVpdHRvIChtb3NxdWl0dG9fcGFzc3dkKSIKPiArCXNlbGVjdCBCUjJfSE9TVF9DTUFLRV9BVF9M
RUFTVF80XzMKPiAgCWhlbHAKPiAgCSAgT25seSBpbnN0YWxscyBtb3NxdWl0dG9fcGFzc3dkLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
