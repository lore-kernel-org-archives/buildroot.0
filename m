Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE4BC4829E
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 21:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1E79406C8;
	Mon, 12 Feb 2024 21:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1l21uPEsYSqU; Mon, 12 Feb 2024 21:51:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C64BD40703
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C64BD40703;
	Mon, 12 Feb 2024 21:51:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CCAB1BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15E8540609
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:51:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LtEOUgy5SFKX for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:51:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E0631404BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0631404BC
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0631404BC
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:51:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33b8806c22aso588697f8f.0
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 13:51:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707774708; x=1708379508;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ttLxXQYyLS6sU7bJCSrCKrl9DxPk6LHpz++lC5R0brM=;
 b=LeU7vtvMx9UPOb2F5SJ4XMNd8ZpF5iGbambFr2QENxPU8I1jaAON3O3BSUjNZLudmm
 9Ca3oSJbZlsE97HXn2XQgWhsgM3h69WWIvrGUIEarULy+qG6Py9y96W17MlIMQvrY6gz
 CMUt/CFkwJTq1IwYCuMRROyEv+eCHtHCMz9t/yGaiftcAW/TLsjWD5vm+Z+5c0goHMz6
 134aOz+hUvw8wxohF2YhUDISpM3Kd2rP+BpziKDzQFTCXyk1OUrf9l2X0Aj6mdz0B5/e
 ReVo530VzBD8GbkUE64jmqU16nsHTTc3jpBTAOJVZdQgzbOaNAs562hjqoI1sbfTXjFH
 AanQ==
X-Gm-Message-State: AOJu0YxDGz9n5WSYGDOLXFjqQY2C23nMp6pvbNB4DcHMRlX7wGk8gjJT
 p2Lpzxr9LjX1fyuqCB90SgRuMFlObWUskuMmYUWAKiIGbs3oMHqHAqoGqbBhhus=
X-Google-Smtp-Source: AGHT+IGVYZZ4bKJLrw4wbCHzwwPNBZG8xTxC4Lzm7AVYX/+II+Myl61aGVAdlIwG80DyTf47pTW9Vg==
X-Received: by 2002:a5d:4ccf:0:b0:33b:266f:3505 with SMTP id
 c15-20020a5d4ccf000000b0033b266f3505mr5643275wrt.63.1707774708321; 
 Mon, 12 Feb 2024 13:51:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX80MzLCtxXIHuoDlCwigARPCiZk9yh69+CHJwrA32lliaAd9VER5sVqquLdYmD+KvSkhArkDLOa7lWOu6X9GLffKDSf/8zJaMEwg==
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bu13-20020a056000078d00b0033b6d5a1244sm7750643wrb.12.2024.02.12.13.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 13:51:47 -0800 (PST)
Message-ID: <17870736-446d-43bb-a453-80e9efbd2274@mind.be>
Date: Mon, 12 Feb 2024 22:51:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Yegor Yefremov <yegorslists@googlemail.com>
References: <20240206132051.2838897-1-yegorslists@googlemail.com>
 <ZcI0bZt04f3jRhPk@landeda> <67502ba4-3f73-428e-802e-6ee9cbc1fe6a@mind.be>
 <CAGm1_kthjzi2yHBeo9uBd_ojW2FjY-i4USEgUV0QHL5G0=8Z5w@mail.gmail.com>
 <Zcp6cCeYLfRu95BC@landeda>
In-Reply-To: <Zcp6cCeYLfRu95BC@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707774708; x=1708379508; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ttLxXQYyLS6sU7bJCSrCKrl9DxPk6LHpz++lC5R0brM=;
 b=hjCtmLKMKOTmGNgGXwz4VbhoU8z9KrhQoHa+zK8X2KAVCZfwzENQvVkMBjwxY/y+Ak
 T0eFtmW73psgHUZWVeUk9uOsd5/SrWK0RjHhAkvdGl5EYpqLbywGpp3U5fcGFgqOGx2C
 tz6/DPliMFiOCTecTlPj10VIVkTHIAtV7u3R3ERbkRDCR4Cvu3d3shOA/Q7QoK6YFWAX
 PNdTLRJ1TNsHL4rB1egLnJsZ5K85+2BKkQmM/dIWPieQxx1HIkfXuA982oyT5sOdDhmn
 c+UpsV1d8l/VOfpiMIYOdr9dJGMxRrLlYDodyslyH2IyyyveoG4szUNTkl0iSOwkutoG
 PpTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hjCtmLKM
Subject: Re: [Buildroot] [PATCH] Create a .gitignore file in the CANONICAL_O
 directory
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMi8wMi8yMDI0IDIxOjA3LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+IFllZ29yLCBBbGws
Cj4gCj4gT24gMjAyNC0wMi0xMiAxMDowMCArMDEwMCwgWWVnb3IgWWVmcmVtb3YgdmlhIGJ1aWxk
cm9vdCBzcGFrZSB0aHVzbHk6Cj4+IE9uIFR1ZSwgRmViIDYsIDIwMjQgYXQgMjozN+KAr1BNIEFy
bm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4+PiBPbiAwNi8wMi8y
MDI0IDE0OjMwLCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+Pj4+IE9uIDIwMjQtMDItMDYgMTQ6MjAg
KzAxMDAsIHllZ29yc2xpc3RzLS0tIHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+Pj4+PiBG
cm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4+Pj4+IFRo
aXMgLmdpdGlnbm9yZSBmaWxlIGlnbm9yZXMgYWxsIGZpbGVzIGluIGFuIG91dHB1dCBkaXJlY3Rv
cnkgYW5kCj4+Pj4+IGhlbmNlIGRvZXNuJ3QgY2hhbmdlIHRoZSBnaXQgc3RhdHVzLgo+Pj4+IFdo
YXQgYXJlIHlvdSB0cnlpbmcgdG8gYWNoaWV2ZSB3aXRoIHRoaXMgdGhhdCBkb2VzIG5vdCB3b3Jr
IGN1cnJlbnRseT8KPj4+ICAgIEkgeW91IGRvIGBtYWtlIE89b3V0cHV0LXRlc3QtbXlwa2dgICh3
aGljaCBJIGRvIHF1aXRlIGEgbG90KSwgdGhhdCBvdXRwdXQKPj4+IGRpcmVjdG9yeSBkb2Vzbid0
IGdldCBpZ25vcmVkIGJ5IGdpdC4gV2UgY291bGQgaWdub3JlIG91dHB1dCogYnV0IG1heWJlIHlv
dSBuYW1lCj4+PiB0aGUgb3V0cHV0IGRpcmVjdG9yeSBvLWZvbyBvciBzb21ldGhpbmcuCj4+Pgo+
Pj4gICAgUHV0dGluZyBhIC5naXRpZ25vcmUgaW4gYSBnZW5lcmF0ZWQgZGlyZWN0b3J5IGlzIGEg
dmVyeSBlbGVnYW50IHNvbHV0aW9uIGZvcgo+Pj4gdGhhdC4gSXQgaXMgdXNlZCBieSBlLmcuIHZp
cnR1YWxlbnYsIHB5dGVzdCwgYW5kIGEgbG9hZCBvZiBvdGhlciBhcHBsaWNhdGlvbnMKPj4+IHRo
YXQgZ2VuZXJhdGUgb3V0cHV0IGluIGEgZGlyZWN0b3J5Lgo+Pj4KPj4+ICAgIFNpbmNlIHRoZSAu
Z2l0aWdub3JlIGlzIGNyZWF0ZWQgaW4gdGhlIG91dHB1dCBkaXJlY3RvcnksIGl0IGlzIG5vIGxv
bmdlcgo+Pj4gbmVjZXNzYXJ5IHRvIHB1dCBvdXRwdXQvIGluIHRoZSAuZ2l0aWdub3JlIGZpbGUu
Cj4+PiAgICBBbGwgb2YgdGhlIGFib3ZlIGNvdWxkIGJlIHB1dCBpbiB0aGUgY29tbWl0IG1lc3Nh
Z2UsIG9mIGNvdXJzZSwgYnV0IGZvciBtZQo+Pj4gWWVnb3IncyBjb21taXQgbWVzc2FnZSB3YXMg
c3VmZmljaWVudGx5IGNsZWFyIDotKQo+PiBXZXJlIHdlIGFibGUgdG8gY29udmluY2UgeW91Pwo+
IAo+IEkgbm93IHVuZGVyc3RhbmQgdGhlIHB1cnBvc2UuIFNheWluZyBJJ20gY29udmluY2VkIGlz
IGFub3RoZXIgc3RyaWRlLgo+IAo+IEluIG15IGNhc2UsIEkgaGF2ZSBhbGwgbXkgb3V0cHV0IGRp
cmVjdG9yaWVzIG91dHNpZGUgb2YgdGhlIGJ1aWxkcm9vdAo+IHRyZWUuIEhhdmluZyBhIC5naXRp
Z25vcmUgaW4gdGhlcmUgd291bGQgYmUgdG90YWxseSB1c2VsZXNzIGFuZAo+IHNwdXJpb3VzLCBh
bmQgd291bGQgZ2V0IGNhdWdodCBieSBteSAoc3VwZXJmaWNpYWwpIHRlc3RzIHRoYXQgbm8gdW5r
bm93bgo+IGZpbGVzIGdldHMgY3JlYXRlZCBvdXRzaWRlIHRoZSBidWlsZC8gdGFyZ2V0LyBhbmQg
c3VjaCBkaXJzIGZvciBleGFtcGxlLgoKICBUaGF0IHNvdW5kcyBsaWtlIHNvbWV0aGluZyB5b3Ug
c2hvdWxkIHVwZGF0ZSByZWd1bGFybHksIGJlY2F1c2Ugd2UgcmVndWxhcmx5IAphZGQgbmV3IHN0
dWZmIGluIHRoZSBvdXRwdXQgZGlyZWN0b3J5LgoKCj4gU28gdGhlcmUgYXJlIHByb3MgYW5kIGNv
bnMgZWl0aGVyIHdheXMuLi4KPiAKPiBNYXliZSBqdXN0IGNyZWF0ZSAuZ2l0aWdub3JlIG9ubHkg
aWYgJChPKSBhIHN1Yi1kaXIgb2YgJChUT1BESVIpID8KCiAgVGhhdCB3b3VsZCBiZSBxdWl0ZSBj
b21wbGljYXRlZCwgd2hpbGUgdGhpcyBwYXRjaCBpcyBwcmV0dHkgc2ltcGxlLgoKICBSZWdhcmRz
LAogIEFybm91dAoKPiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
