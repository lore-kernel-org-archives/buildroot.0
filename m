Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C0AC25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 07:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 685B04078F;
	Thu, 16 May 2024 07:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLvlsqofDVb2; Thu, 16 May 2024 07:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10CE540792
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10CE540792;
	Thu, 16 May 2024 07:07:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A2441BF358
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 07:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7651D40BAE
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 07:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwVKWI5pSV59 for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 07:07:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2916D401CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2916D401CA
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2916D401CA
 for <buildroot@buildroot.org>; Thu, 16 May 2024 07:07:48 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4200ee78f35so37706075e9.1
 for <buildroot@buildroot.org>; Thu, 16 May 2024 00:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715843266; x=1716448066;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7oR6FJXvFowtGmYpCCNt0M9kepZrXlh81Pvi1vjOQbs=;
 b=uWvuNl+bVC7YivIYT1RYHfDuYxbjzfHtXi6Jm7bVqCio29/H0I1qjdL1s6Qog7MQmZ
 C15h5NRfrlDWbL3x54CK6nWHXKoowGmyd/pV4grF/awep+T/2G9Il54FUdAnHjvNyauY
 5nqHI4/ZAY2ohp9H3/LQK6yzzcG+6Zn1prI+XW2u9+wQhFXu5TXG22/fS32VgNsEnnTC
 +RQlPan4A794i6BQcgFKJEoUNPjszaTeZVNH++bsWG8TymJgWcWt75/9efeo25YoHjaj
 3skDLcPn6kGNmu33W3VgtUAskp6u6tFpTTWa+8NTtaP5URZ+nhRVNLpyP6mklb/qUVKA
 aP9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQZ3tjVsyV8zwqDp4uQZfBJTeS164v/A39pom6AaDmGyDK19qEY9Hnc21itckpFnfF1oOrMPpwpOLEGEp8M+yTG5mC7FBQMg==
X-Gm-Message-State: AOJu0Yxs0teykmaKLN9LcbRLSSCwCyC3ZCvvGZbVBVi7HpdalKLIRZf4
 nZUZe5cbjPhAMh0BRuzi/HRqXM69yT24Z0+0XgHBFMsREk8LO5c+j5emVj5PdHKP+E13imvwn6T
 q
X-Google-Smtp-Source: AGHT+IFYMmzUpGqHDrSajiDHq6e22ltFcRikxb+YQS8b+DkKOrsBH+r0Nw3HiS9ZIpppMO0RWAoetg==
X-Received: by 2002:a05:600c:42c2:b0:41f:e4ad:9ae4 with SMTP id
 5b1f17b1804b1-41feaa4391fmr189109475e9.23.1715843266415; 
 Thu, 16 May 2024 00:07:46 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-420149b1c24sm148118275e9.41.2024.05.16.00.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 00:07:46 -0700 (PDT)
Message-ID: <c13030fe-4308-415b-8717-e1c0af3d68fc@smile.fr>
Date: Thu, 16 May 2024 09:07:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Romain Naour <romain.naour@smile.fr>
To: Christian Stewart <christian@aperture.us>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240307015107.2908128-1-christian@aperture.us>
 <20240514102318.1cdeba18@windsurf>
 <CA+h8R2peXHHtzBXdg-uW7bptT8mmGY+kgzbvPNFW9MQy3xOJhQ@mail.gmail.com>
 <CA+h8R2rgJ1AKsqBCAFkf8xRaf+8EmnMmh9uKj+nwq_WphWECbQ@mail.gmail.com>
Content-Language: fr, en-US
In-Reply-To: <CA+h8R2rgJ1AKsqBCAFkf8xRaf+8EmnMmh9uKj+nwq_WphWECbQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1715843266; x=1716448066;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7oR6FJXvFowtGmYpCCNt0M9kepZrXlh81Pvi1vjOQbs=;
 b=pY+6OBYxO1RL5jMjeaStRUKftE1+gkyZTJ1FhI5raLKbdSjuFTlI2p8WX1xTjEWByV
 sZmpQCAPSTbZARJX37ZeCe+y+HuUUqy7s1W31Vs49QqSG54dVnfOADJ/ozOWFeQIQjv9
 3P00vNSvtZQHEmEz2qKlzCqw180c90De4wFj9V8ol+f9oA9oY9M7sWcUo5yPQ+zHdQTA
 7DyCAzc4cBIZffQrHyRY7lpIgDewbChFgbiURwIw2MkchaJJ5PXjIr+FcK6PwgfqI0Ja
 Tu7KCrrLT/Jf0u6NVv/IccH/MT1gLVYRsjiqSNKVhivJpJHQPcCuSGL3MJgDj0qecUnn
 miDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=pY+6OBYx
Subject: Re: [Buildroot] [PATCH v1 1/3] package/go-bootstrap-stage2: bump
 version to go1.19.13
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
Cc: Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2hyaXN0aWFuLCBBbGwsCgpMZSAxNS8wNS8yMDI0IMOgIDAxOjM4LCBDaHJpc3RpYW4g
U3Rld2FydCB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gSGkgVGhvbWFzLAo+IAo+IE9uIFR1
ZSwgTWF5IDE0LCAyMDI0IGF0IDQ6MznigK9BTSBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFu
QGFwZXJ0dXJlLnVzPiB3cm90ZToKPj4gT24gVHVlLCBNYXkgMTQsIDIwMjQsIDE6MjPigK9BTSBU
aG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPj4+
Cj4+PiBJIGRvbid0IHRoaW5rIGl0J3MgdGhpcyBwYXRjaCBjYXVzaW5nIHRoZSBpc3N1ZSwgYnV0
IHdlIGhhdmUgYSBHbyBidWlsZAo+Pj4gZmFpbHVyZSBpbiBvdXIgR2l0bGFiIENJOgo+Pj4KPj4+
IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNjgzMzMw
NzgyMwo+Pj4KPj4+IENvdWxkIHlvdSBoYXZlIGEgbG9vaz8KPj4KPj4gVGhpcyBsb29rcyBsaWtl
IHdlIG5lZWQgdG8gcGFzcyAtYnVpbGR2Y3M9ZmFsc2UgdG8gR28uIEknbGwgaGF2ZSBhIGxvb2sg
YXQgc3VibWl0dGluZyBhIHBhdGNoIGZvciB0aGlzLgo+IAo+IEkgZm91bmQgdGhpcyBjb21taXQg
aW4gR28gd2hpY2ggZml4ZWQgJiBhZGRlZCBhIHRlc3QgdG8gZW5zdXJlIHRoYXQKPiAtYnVpbGR2
Y3M9ZmFsc2UgaXMgc2V0IHdoZW4gR09ST09UX0JPT1RTVFJBUCBpcyBzZXQgKHdoaWNoIGl0IHdh
cyBpbgo+IHRoZSBmYWlsaW5nIGpvYikuCj4gCj4gY29tbWl0IDQyYTQ2MjA2Yjk3Y2E3Y2Y0MjQ2
ZDNjMTIzMGE3MGNmNDJhZDViYjAKPiBBdXRob3I6IEJyeWFuIEMuIE1pbGxzIDxiY21pbGxzQGdv
b2dsZS5jb20+Cj4gRGF0ZTogICBGcmkgU2VwIDkgMTc6Mjk6MTIgMjAyMiAtMDQwMAo+IAo+ICAg
ICBjbWQvZ286IG9taXQgVkNTIHN0YW1waW5nIGR1cmluZyBib290c3RyYXAKPiAKPiAgICAgY21k
L2Rpc3QgY2FuJ3QgZWFzaWx5IGhhcmQtY29kZSAtYnVpbGR2Y3M9ZmFsc2UgYmVjYXVzZSBub3Qg
YWxsCj4gICAgIHZlcnNpb25zIG9mIGNtZC9nbyBzdXBwb3J0ZWQgZm9yIGJvb3RzdHJhcHBpbmcg
cmVjb2duaXplIHRoYXQgZmxhZy4KPiAKPiAgICAgSG93ZXZlciwgd2UgZG9uJ3Qgd2FudCB0byBz
dGFtcCB0aGUgYm9vdHN0cmFwIGJpbmFyaWVzOiB0aGUgc3RhbXBpbmcKPiAgICAgaXMgcmVkdW5k
YW50IHdpdGggdGhlIFZFUlNJT04gZmlsZSB3cml0dGVkIGR1cmluZyBib290c3RyYXBwaW5nICh3
aGljaAo+ICAgICBpcyB3aHkgaXQgaXMgbm9ybWFsbHkgb21pdHRlZCBmb3Igc3RhbmRhcmQtbGli
cmFyeSBwYWNrYWdlcyBhbmQKPiAgICAgY29tbWFuZHMpLCBhbmQgaXQgbWF5IGFsc28gaW50ZXJm
ZXJlIHdpdGggYnVpbGRpbmcgdGhlIEdvIHJlcG8gZnJvbSBhCj4gICAgIHNvdXJjZSB0YXJiYWxs
IG9yIHppcCBmaWxlLgo+IAo+ICAgICBGaXhlcyAjNTQ4NTIuCj4gCj4gICAgIENoYW5nZS1JZDog
SWYyMjNmMDk0YWYxMzdjNGMyMDJkNmJmNjIyNjE5YmQyZGEzOTdlYzQKPiAgICAgUmV2aWV3ZWQt
b246IGh0dHBzOi8vZ28tcmV2aWV3Lmdvb2dsZXNvdXJjZS5jb20vYy9nby8rLzQzMjQzNQo+IAo+
IFNlZTogaHR0cHM6Ly9naXRodWIuY29tL2dvbGFuZy9nby9jb21taXQvNDJhNDYyMDZiOTdjYTdj
ZjQyNDZkM2MxMjMwYTcwY2Y0MmFkNWJiMAo+IAo+IEhvd2V2ZXIgaXQgc2VlbXMgdGhhdCBib290
c3RyYXAgc3RlcCBpcyBmYWlsaW5nIGR1ZSB0byAtYnVpbGR2Y3M9ZmFsc2UKPiBub3QgYmVpbmcg
c2V0Lgo+IAo+IEkgd2lsbCB0cnkgdG8gZGVidWcgZnVydGhlci4gVGhpcyBjb3VsZCBiZSBhIEdv
IHJlZ3Jlc3Npb24uCgpJIHRyaWVkIHRvIHJlcHJvZHVjZSB1c2luZyBkb2NrZXItcnVuIHNjcmlw
dCBidXQgdGhlIGJ1aWxkIHN1Y2NlZWQuCgpBY3R1YWxseSB0aGlzIGlzc3VlIHJlbWluZCBtZSB0
aGUgaXNzdWUgd2UgaGFkIHdpdGggbmV3ZXIgZ2l0IHJlbGVhc2UgYW5kIGhvdwpnaXRsYWIgY2hl
Y2tzIG91dCB0aGUgcmVwb3NpdG9yeToKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3Jn
L2J1aWxkcm9vdC8tL2NvbW1pdC9hMDE2YjY5M2Y3ODMwZjNjOGFlODE1ODUxZDMyMDRiOGI2ZTk5
ODIxCgpJbmRlZWQsIHdpdGhpbiBnaXRsYWItY2kgYnVpbGQgY29udGV4dCB0aGUgYnVpbGQgZmFp
bCBkdWUgdG8gdGhlIG93bmVyc2hpcCBvZgp0aGUgKGJ1aWxkcm9vdCkgZ2l0IHRyZWUuCgppcyBn
byBpZ25vcmUgdGhlIC5naXRjb25maWcgZmlsZSBzb21laG93ID8KCkFueXdheSwgZ28gc2hvdWxk
IG5vdCB0cnkgdG8gdXNlIGdpdCB0byByZXRyaWV2ZSBzb21lIGluZm8gc2luY2Ugd2UgYXJlIG5v
dCBpbgp0aGUgZ28gcmVwb3NpdG9yeS4KCkkgYXBwbGllZCB0aGUgc2FtZSBwYXRjaCAiZml4IGdv
LWJvb3RzdHJhcCB3aGVuIHBhcmVudCBkaXIgY29udGFpbnMgaW52YWxpZAouZ2l0IiBmcm9tIFsx
XSB0byBnby1ib290c3RyYXAtc3RhZ2UzCgpbMV0KaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9v
dC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2JjOGU3MGEwOGJhMDgzZDk3OGM4MjhlMzE0NDJhNzY0
NWM5MDk5ZDcKCkFuZCB0aGUgYnVpbGQgc3VjY2VlZCBvbiBnaXRsYWItY2k6Cmh0dHBzOi8vZ2l0
bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0vam9icy82ODYwNjcwMjkyCgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgoKCj4gCj4gQmVzdCByZWdhcmRzLAo+IENocmlzdGlhbiBTdGV3YXJ0Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
