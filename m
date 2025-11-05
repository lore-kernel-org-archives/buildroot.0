Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C30CCF9F8
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 20:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1B80613E7;
	Wed,  5 Nov 2025 20:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVyVYW2XxfZy; Wed,  5 Nov 2025 20:53:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D18E60F8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D18E60F8C;
	Wed,  5 Nov 2025 20:53:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9316462
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F9D641013
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZQvJypcyk8m for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 20:53:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 658CE40429
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 658CE40429
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 658CE40429
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:53:17 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-477563bcbbcso1204075e9.0
 for <buildroot@buildroot.org>; Wed, 05 Nov 2025 12:53:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762375995; x=1762980795;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OlaQ5H2hoslmplAIvROu2N9uggz473sCCAWCceLzCCU=;
 b=DedEfnmvykESIe2g4KcLucYcnjYuZ0shX3+tVAmv854ueOKpbOnRJfvI0Uv+ZLth0D
 GBaA6nlukEdp13pLCJDyftAueDRPmg2Psuccfgg4ANmDTS5BPlqkWd3rMcbXUT3XNPdz
 O/SSukUc5OrEGHronFoOkbfP6YmxFUlVWOgrKryQC7xO7AaJm3dlXUyIvY3rz7R/Ugw9
 M6PaQjLeggfslgBI+G14yoeYyFtOlX0F9LOfGMq75Mh9sBbiwYWpZJ2HCdJybA1NCyxm
 rc+sV3ckD/H/SlhVi50ZfYQfD9c3ByY70qvIhfrJGxmroAsB6T77Mmax9ND8dDpW2Dev
 RA0g==
X-Gm-Message-State: AOJu0YwaUg4rjnlkYzW8lQ6rCVsBDLDzaUFlkmvt/x8KTG54jctuPeRK
 YP/+4xJUn6l3MKZa3Z0g6UvZW9NkRpfJpJKkwR5K2Mt1+qI2t3cGDn+N2lrXiGgAcw9AgYu7zii
 vviaoDChwzw==
X-Gm-Gg: ASbGnctJlXGRV3vOgF7PIG1mF7nCaI80WijORSCu/iCD+3UTAJQyD17PNryeDKvWILt
 zBMDKo1HCileaTbhpGqDjonYnDOQ2037f7JINsvtLhsh1bNYFyon5o+DxIyVzmcryKzsWlRjZD+
 ZAbE7jOA0JXPMmAt5gsbohHqK/Jt/D7pJDi6NOCL5yhGgBNSqxUUNWy4kDbMcObbs2L8mwrRI4/
 HfdtIDQEFKlU6y8sqOVPN2kG4dsXeN7DrrKdATUO7d10WEmpLghb6E8WXtgz6cY6gDAHrwAwVvU
 VYiAC5HeTmB6Sf10PHZgAj/GOLtzDVSxxTp3e4QRn1UPc4TrTK2o3H8yrwEOgYfbFL53hwb+5gm
 9uweq2Ojrw63Zx9kjlNqe+kseK7+TSR6n9tnJvRjX6OTdaW5jhiMq+SyWZn1BAj59+XFMS2aeE8
 MvojXOBBW/EelfLKn5baE78X1MrJ3XhAaJRYKCyA3DH79OsE6M6iCzdMiWP8sfxHN1LFijez0aW
 wQlrBR+JeDAK7XY8kwaC1+h0kZmyESu1bdSHXjoKNc=
X-Google-Smtp-Source: AGHT+IGM5EuG6hVm/ubjA0yxME29CK6JWgxrf2Y99UIQfZTqz3jh/ctB9IXEK+dPygyHWyrW2XBKhQ==
X-Received: by 2002:a05:600c:310c:b0:477:55de:8b22 with SMTP id
 5b1f17b1804b1-4775cdc93e0mr34200155e9.16.1762375995074; 
 Wed, 05 Nov 2025 12:53:15 -0800 (PST)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429ebdab56bsm397369f8f.36.2025.11.05.12.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 12:53:14 -0800 (PST)
Message-ID: <71d310f0-9131-42a2-892c-35c04d24c6b8@smile.fr>
Date: Wed, 5 Nov 2025 21:53:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
 <34f309044544536e35eb8632020e9ddff0a53553.1756717276.git.yann.morin.1998@free.fr>
 <d59ae35b-71fe-49a5-b63e-9d690b05a0dd@smile.fr> <aQt0f_BMYDizxBgT@landeda>
Content-Language: en-US
In-Reply-To: <aQt0f_BMYDizxBgT@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1762375995; x=1762980795; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OlaQ5H2hoslmplAIvROu2N9uggz473sCCAWCceLzCCU=;
 b=QR8UzYntqBiWKw2KbEMrscmXZ7H4wR3pWozYamYM3mA1gsCYcQCarVWwPbqOyXAo8T
 lepPchaMarER4B9FjvGrS39VAjHu5BA93v+laoIp2V5kKLIDwSXWwSSEuHzYJc6MHKBb
 SIQ9LtrAO7ZB/mxA7cQ/7ciYCm1yINKGuWtmM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=QR8UzYnt
Subject: Re: [Buildroot] [PATCH 07/18 v3] support/scripts: move merged-usr
 errors message into check-merged-usr.sh
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDUvMTEvMjAyNSDDoCAxNjo1OSwgWWFubiBFLiBNT1JJTiBh
IMOpY3JpdMKgOgo+IFJvbWFpbiwgQWxsLAo+IAo+IE9uIDIwMjUtMTEtMDUgMTE6NTIgKzAxMDAs
IFJvbWFpbiBOYW91ciBzcGFrZSB0aHVzbHk6Cj4+IExlIDAxLzA5LzIwMjUgw6AgMTE6MDEsIFlh
bm4gRS4gTU9SSU4gdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IFstLVNOSVAtLV0KPj4+ICsJ
QCQoY2FsbCBNRVNTQUdFLCJTYW5pdHkgY2hlY2sgaW4gb3ZlcmxheXMgJChjYWxsIHFzdHJpcCwk
KEJSMl9ST09URlNfT1ZFUkxBWSkpIikKPj4+ICsJc3VwcG9ydC9zY3JpcHRzL2NoZWNrLW1lcmdl
ZC11c3Iuc2ggXAo+Pj4gKwkJLS10eXBlIG92ZXJsYXkgXAo+Pj4gKwkJJChjYWxsIHFzdHJpcCwk
KEJSMl9ST09URlNfT1ZFUkxBWSkpCj4+IEJSMl9ST09URlNfT1ZFUkxBWSBjYW4gaGF2ZSBhIGxp
c3Qgb2Ygb3ZlcmxheSBkaXJlY3RvcnkuCj4+IFdlIGhhZCBhIGZvcmVhY2ggbG9vcCB0byBjaGVj
ayBhbGwgb2YgdGhlbS4KPiAKPiBFeGFjdGx5LiBOb3cgdGhleSBhcmUgcGFzc2VkIGFzIGFyZ3Vt
ZW50cyB0byB0aGUgY2hlY2stbWVyZ2VkLXVzci5zaAo+IHNjcmlwdCwgc28gdGhhdC4uLgo+IAo+
IFstLVNOSVAtLV0KPj4+ICtmb3Igcm9vdDsgZG8KPj4gSSdtIG5vdCBzdXJlIHRvIGZvbGxvdyBo
ZXJlLgo+PiBXaGVyZSByb290IGlzIGRlZmluZWQ/Cj4gCj4gLi4uIHRoZXkgbm93IGl0ZXJhdGVk
IG92ZXIgYnkgdGhpcyBmb3ItbG9vcC4KPiAKPiBXaGVuIHRoZXJlIGlzIG5vICdpbicgcGFydCB0
byBhIGZvciBsb29wLCBpdCBpdGVyYXRlcyBvdmVyIHRoZQo+IHBvc2l0aW9uYWwgcGFyYW1ldGVy
czoKPiAKPiAgICAgJCBjYXQgZm9vCj4gICAgICMhL2Jpbi9zaAo+ICAgICBmb3IgaTsgZG8gcHJp
bnRmICdpPSVzXG4nICIke2l9IjsgZG9uZQo+IAo+ICAgICAjIC4vZm9vIGEgYiBjIGQKPiAgICAg
aT1hCj4gICAgIGk9Ygo+ICAgICBpPWMKPiAgICAgaT1kCj4gCj4gU28sIHRob3NlIHR3byBsaW5l
cyBhcmUgZXF1aXZhbGVudDoKPiAKPiAgICAgZm9yIGk7IGRvCj4gICAgIGZvciBpIGluICIke0B9
IjsgZG8KPiAKPiBTZWUgc2VjdGlvbiAyLjkuNC4yIG9mIHRoZSBPcGVuIEdyb3VwIEJhc2UgU3Bl
Y2lmaWNhdGlvbnMgSXNzdWUgODoKPiAgICAgaHR0cHM6Ly9wdWJzLm9wZW5ncm91cC5vcmcvb25s
aW5lcHVicy85Nzk5OTE5Nzk5L3V0aWxpdGllcy9WM19jaGFwMDIuaHRtbCN0YWdfMTlfMDlfMDQK
ClRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLgoKSSBwZXJzb25hbGx5IGRvbid0IHJlYWxseSBs
aWtlIHRoaXMgaW1wbGljaXQgdXNlIG9mIHBvc2l0aW9uYWwgcGFyYW1ldGVycyBidXQKaXQncyBt
YXR0ZXIgb2YgdGFzdGUgOikKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBSZWdhcmRzLAo+
IFlhbm4gRS4gTU9SSU4uCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
