Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D023AE67485
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 22:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D9FE60D5C;
	Thu, 31 Oct 2024 22:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpQWL7yaBOzV; Thu, 31 Oct 2024 22:05:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ADDF60D61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ADDF60D61;
	Thu, 31 Oct 2024 22:05:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BADCB5B1E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8EEE60D5C
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MltAS9a8FcAG for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 22:05:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 55CBE60D61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55CBE60D61
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55CBE60D61
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:05:26 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so15141115e9.1
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 15:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730412324; x=1731017124;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fUKeRvSD/iUTYCRFV/C8+BGRshHjyG9GX9r64/qddb0=;
 b=LaN2+hdKN5k5iPUkeA8nmy0qL2ebrX+YBaaaRk3aKao9UkTJ5Yqc+kix4wX/VFiMCf
 awIxAJOINYa+iUs5yDrjSbZdNst2KytgmeXxDX0dGLruF/8Agw8h5pKwjFzkvLrF/9hp
 wJ0tYXNjW10H2I2YEqvTsxnh32nG9QAVazWrORhG4EgsJOGE7EeOdWmocIWNoPQXoJte
 6PF3kf/RSYnumt457OMiotFfewBG64jO0wFeOyzZMcuWGZdQzQkrcAsoD27/rOGBP1fG
 IL9w7xi5TF2QP+vyg7JF8UUynNhZMsry0vmALGi1QxwY30eH0bOnZwQc91G0X85WF2cH
 OT7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFz/AAeS2GGnPQtfzp+O+/IXvlEfB/KwmZHxdPhcpbN6lbxSmDag+4X4+W072UqYq1JuDpOvD5Q3U=@buildroot.org
X-Gm-Message-State: AOJu0Yy0DYYU4nG4eE0qwSHVbv2/MGEc2alZpfWikyu7NYqcOwdU+o6N
 IKLHy176pCRCan5kudT2fJOGuBkEXSM4UiiVROSWFVeVygYxkQzLd0SeOMSSLTBrCtMmL3G+Cxg
 g
X-Google-Smtp-Source: AGHT+IGpp2gn+RxLXmYvaCKfgc7wwo6pefJYQXb1mMCqEo5iRNSLNhopqdADGZC303ZugzG+zEoHow==
X-Received: by 2002:a05:600c:4e8a:b0:431:54f3:11ab with SMTP id
 5b1f17b1804b1-43283296051mr13055775e9.33.1730412324170; 
 Thu, 31 Oct 2024 15:05:24 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd8e7d23sm68688745e9.7.2024.10.31.15.05.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 15:05:23 -0700 (PDT)
Message-ID: <4c841208-cf2a-4f10-bdcf-ced73d793f7d@smile.fr>
Date: Thu, 31 Oct 2024 23:05:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20241031213348.2057705-1-ju.o@free.fr>
 <20241031213348.2057705-6-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20241031213348.2057705-6-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730412324; x=1731017124; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fUKeRvSD/iUTYCRFV/C8+BGRshHjyG9GX9r64/qddb0=;
 b=B9AtGPIK4QrVaO+QD96AXB5SkcLAEqgw00tn1lE/8LZtHi5MFzTZBtTsh4G0k1h5Pp
 rjE9M7ZD3fZ6RUIKCHC10h3Y63NprFEPKSjxE9L85nrw738gaR0B87IntTMtUqnWaCvf
 1/koJcUu9wUdYt6qYPIp7eCbYOi0sJaL247Bs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=B9AtGPIK
Subject: Re: [Buildroot] [PATCH v3 5/8] support/testing/infra/emulator.py:
 add build host dir to qemu search path
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

SGVsbG8gSnVsaWVuLAoKTGUgMzEvMTAvMjAyNCDDoCAyMjozMywgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBUaGUgcmVsZXZhbnQgcWVtdSBlbXVsYXRvciBpcyBzdGFydGVkIHdpdGggcGV4
cGVjdC5zcGF3bigpIHdpdGggYQo+IGRlZmF1bHQgZW52aXJvbm1lbnQgKGFuZCBQQVRIKS4gVGhp
cyB3aWxsIGFsd2F5cyB1c2UgdGhlIHFlbXUgYXZhaWxhYmxlCj4gb24gdGhlIGhvc3QuIFdoZW4g
cnVubmluZyBpbiB0aGUgcmVmZXJlbmNlIERvY2tlciBpbWFnZSwgaXQgaXMgdXNpbmcgYW4KPiBv
bGQgUWVtdSB2NS4yLjAuIFRoaXMgdmVyc2lvbiBpcyBnZXR0aW5nIHRvbyBvbGQgdG8gcnVuIHdp
dGggbW9yZQo+IHJlY2VudCBjb21wb25lbnRzLCBsaWtlIEVESzIgb3IgQVRGLgo+IAo+IFRoZSBt
YWluIHJlYXNvbiB0byB1c2UgYSBxZW11IHZlcnNpb24gcHJlaW5zdGFsbGVkIGluIHRoZSBEb2Nr
ZXIgaW1hZ2UKPiB3YXMgdG8gc2F2ZSBzb21lIGJ1aWxkIHRpbWUuIEFsc28sIHRoaXMgYmVoYXZp
b3IgaXMgb3Bwb3NpdGUgdG8gdGhlCj4gInN0YXJ0LXFlbXUuc2giIGhlbHBlciBzY3JpcHQgWzFd
LCB3aGljaCB0cmllcyB0byBleGVjdXRlIHRoZQo+IEJ1aWxkcm9vdCBob3N0LXFlbXUgZmlyc3Qg
KGFuZCB0aGVuIGZhbGxiYWNrIHRoZSB0aGUgdmVyc2lvbiBvbiB0aGUKPiBob3N0IHN5c3RlbSwg
aWYgYXZhaWxhYmxlKS4gQW4gb3B0aW9uIHdhcyBhZGRlZCBpbiBbMl0gdG8gbGV0IHRoZSB1c2Vy
Cj4gaGF2ZSBhIGJldHRlciBjb250cm9sIG9uIHdoaWNoIHZlcnNpb24gaXMgdXNlZC4KPiAKPiBB
bHNvLCB1cGRhdGluZyB0aGUgQnVpbGRyb290IHJlZmVyZW5jZSBEb2NrZXIgaW1hZ2UgaGFzIGEg
bGFyZ2VyCj4gaW1wYWN0IG9uIHRoZSB3aG9sZSBwcm9qZWN0IChpLmUuIHVwZGF0aW5nIHRoZSBp
bWFnZSB3b3VsZCBicmluZwo+IGEgbmV3ZXIgcWVtdSB2ZXJzaW9uLCBidXQgbWlnaHQgYnJlYWsg
bWFueSBvdGhlciB0aGluZ3MsIGF0IGEgdGltZQo+IHdoaWNoIGlzIG5vdCBhbHdheXMgY29udmVu
aWVudCkuCj4gCj4gV2Ugbm93IG5lZWQgc29tZSBraW5kIG9mIGNvbnRyb2wgaW4gcnVudGltZSB0
ZXN0cywgdG8gY2hvb3NlIGJldHdlZW4gYQo+ICJzdG9jayIgcWVtdSwgYW5kIGEgbW9yZSByZWNl
bnQgdmVyc2lvbiB3aXRoIGFsbCB0aGUgYmVsbHMgYW5kCj4gd2hpc3RsZXMuCj4gCj4gVGhpcyBj
b21taXQgYWRkcyB0aGUgQnVpbGRyb290IGhvc3QgYnVpbGQgZGlyZWN0b3J5IGluIHRoZSBwYXRo
LiBUaGlzCj4gd2lsbCBtYWtlIHRoZSBydW50aW1lIHRlc3QgaW5mcmFzdHJ1Y3R1cmUgdG8gdXNl
IGEgaG9zdC1xZW11LCBpZgo+IHNlbGVjdGVkIGJ5IGEgcnVudGltZSB0ZXN0IGNvbmZpZ3VyYXRp
b24uCj4gCj4gRm9yIG5vdywgbW9zdCBvZiB0aGUgdGVzdCBjYW4gY29udGludWUgdG8gdXNlIHRo
ZSBxZW11IHZlcnNpb24gcHJvdmlkZWQKPiBpbiB0aGUgRG9ja2VyIGltYWdlLiBPbmx5IHRoZSBw
cm9ibGVtYXRpYyB0ZXN0cyByZWx5aW5nIG9uIGEgcmVjZW50Cj4gdmVyc2lvbiB3aWxsIHNlbGVj
dCBCUjJfUEFDS0FHRV9IT1NUX1FFTVU9eS4gVGhlIGhvc3QtcWVtdSBwYWNrYWdlIGlzCj4gdXN1
YWxseSBtYWludGFpbmVkIHRvIGEgcmVjZW50IHZlcnNpb24sIHNvIHRoaXMgc2hvdWxkIGJlIHN1
ZmZpY2llbnQuCj4gCj4gWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC8tL2Jsb2IvbWFzdGVyL2JvYXJkL3FlbXUvc3RhcnQtcWVtdS5zaC5pbgo+IFsyXSBodHRw
czovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvNWRlNzhmMTgx
YWNjNTM5NTliMGE0NDZhM2ZiMTE2ZWNkZWMxMzU3Nwo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBPbGl2YWluIDxqdS5vQGZyZWUuZnI+CgpSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21h
aW4ubmFvdXJAc21pbGUuZnI+CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gLS0tCj4gIHN1cHBv
cnQvdGVzdGluZy9pbmZyYS9lbXVsYXRvci5weSB8IDYgKysrKystCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9y
dC90ZXN0aW5nL2luZnJhL2VtdWxhdG9yLnB5IGIvc3VwcG9ydC90ZXN0aW5nL2luZnJhL2VtdWxh
dG9yLnB5Cj4gaW5kZXggNTMxODU3N2NkYS4uMjM4ZTEyMzMwMiAxMDA2NDQKPiAtLS0gYS9zdXBw
b3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHkKPiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvaW5m
cmEvZW11bGF0b3IucHkKPiBAQCAtNDQsNiArNDQsNyBAQCBjbGFzcyBFbXVsYXRvcihvYmplY3Qp
Ogo+ICAgICAgZGVmIF9faW5pdF9fKHNlbGYsIGJ1aWxkZGlyLCBkb3dubG9hZGRpciwgbG9ndG9m
aWxlLCB0aW1lb3V0X211bHRpcGxpZXIpOgo+ICAgICAgICAgIHNlbGYucWVtdSA9IE5vbmUKPiAg
ICAgICAgICBzZWxmLnJlcGwgPSBOb25lCj4gKyAgICAgICAgc2VsZi5idWlsZGRpciA9IGJ1aWxk
ZGlyCj4gICAgICAgICAgc2VsZi5kb3dubG9hZGRpciA9IGRvd25sb2FkZGlyCj4gICAgICAgICAg
c2VsZi5sb2dmaWxlID0gaW5mcmEub3Blbl9sb2dfZmlsZShidWlsZGRpciwgInJ1biIsIGxvZ3Rv
ZmlsZSkKPiAgICAgICAgICAjIFdlIHVzZSBlbGFzdGljIHJ1bm5lcnMgb24gdGhlIGNsb3VkIHRv
IHJ1bnMgb3VyIHRlc3RzLiBUaG9zZSBydW5uZXJzCj4gQEAgLTExNiwxMSArMTE3LDE0IEBAIGNs
YXNzIEVtdWxhdG9yKG9iamVjdCk6Cj4gICAgICAgICAgc2VsZi5sb2dmaWxlLndyaXRlKGYiPiBo
b3N0IGxvYWRhdmc6IHtsZGF2Z19zdHJ9XG4iKQo+ICAgICAgICAgIHNlbGYubG9nZmlsZS53cml0
ZShmIj4gdGltZW91dCBtdWx0aXBsaWVyOiB7c2VsZi50aW1lb3V0X211bHRpcGxpZXJ9XG4iKQo+
ICAgICAgICAgIHNlbGYubG9nZmlsZS53cml0ZSgiPiBzdGFydGluZyBxZW11IHdpdGggJyVzJ1xu
IiAlICIgIi5qb2luKHFlbXVfY21kKSkKPiArICAgICAgICBob3N0X2JpbiA9IG9zLnBhdGguam9p
bihzZWxmLmJ1aWxkZGlyLCAiaG9zdCIsICJiaW4iKQo+ICsgICAgICAgIGJyX3BhdGggPSBob3N0
X2JpbiArIG9zLnBhdGhzZXAgKyBvcy5lbnZpcm9uWyJQQVRIIl0KPiAgICAgICAgICBzZWxmLnFl
bXUgPSBwZXhwZWN0LnNwYXduKHFlbXVfY21kWzBdLCBxZW11X2NtZFsxOl0sCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB0aW1lb3V0PTUgKiBzZWxmLnRpbWVvdXRfbXVsdGlw
bGllciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVuY29kaW5nPSd1dGYt
OCcsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb2RlY19lcnJvcnM9J3Jl
cGxhY2UnLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW52PXsiUUVNVV9B
VURJT19EUlYiOiAibm9uZSJ9KQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZW52PXsiUUVNVV9BVURJT19EUlYiOiAibm9uZSIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJQQVRIIjogYnJfcGF0aH0pCj4gICAgICAgICAgIyBXZSB3YW50IG9u
bHkgc3Rkb3V0IGludG8gdGhlIGxvZyB0byBhdm9pZCBkb3VibGUgZWNobwo+ICAgICAgICAgIHNl
bGYucWVtdS5sb2dmaWxlX3JlYWQgPSBzZWxmLmxvZ2ZpbGUKPiAgCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
