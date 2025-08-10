Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CD8C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 13:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 636494067C;
	Sun, 10 Aug 2025 13:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuxLabfLYdUN; Sun, 10 Aug 2025 13:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A607540D77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A607540D77;
	Sun, 10 Aug 2025 13:50:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4F3A138
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 13:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBEF560F0A
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 13:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MtiLmhc2j5nN for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 13:50:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CDF4E60F44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDF4E60F44
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDF4E60F44
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 13:50:12 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b785a69454so1941907f8f.2
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 06:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754833811; x=1755438611;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lAk+TY+ZllmUAV/35K4UL4hQnPoa9+jlvSkOxPzzKF0=;
 b=u7NGg6xXtLpAy2JJmp40pVz3fbbQHYOG2KW6YzMt74bCkPlSmxl7OEddXWgLpFbf9p
 3fNSB5IChjfO7AAyk9OT7j22NCpVZi1OeS3DmP7y5aDhhc68yzOXy1KuE1figKk8kc7C
 ru/4e4eaYdDHu8k/D0bI+onT08jkx04yzMuRXr0pXy73aZbctNfQ2QMvnByY/tc0Cc5X
 QDblKMLNbKYQdUOTWnFy4RQ31wdRn2L7/gYo5PzmrWp5GUZHMBYYEaqTNLUaTYN1qnKA
 CE/v6LFWu5roahGg6wpX52zgCP/kAqHhcrk1wa86dePHuXr6dzMdcZq941StA9ocJO0X
 QZlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoMqZ85p4jjzphNas7RL5/0inD5xr1xyvdzZcISh+T/P75Hz4fIxrDbMkVdNfeMAiVrs5kKJPqq1g=@buildroot.org
X-Gm-Message-State: AOJu0Yy5sqYlmXI8CB8gtEaxKcom5+9djoKOMAT8UqoB0G1B2Js0o6eY
 6LRirn+t0+NoFCKbUQWjQkHXscHY5sLcQUDHdpQCwfsdvb3tjqOilYWVHMOVUS+skf4=
X-Gm-Gg: ASbGnctB54pJTxLXNQIDgLggjG7W1mtNSqNeZwfOgrRApcOd2oS5uGsJwrUpWrm8bBK
 jJEUGH7z2RXRDTh4lb8Wi9M5xh2k/eUlVnAA025aepY2ga8bujfe86+wKSynCg2eAKZXnq3ozEb
 Lhxb0eK0NkDy8Bgf0BbZR5HnBDtIU7NIHOe/S87/4gWajrsnvPf+C58icmhxj+vzIeDoCaW2b2s
 KAXjUjHZaWv3FiM+EttnVelP+SfbIk6ClTsOTtxvV7vkaxw19X9KLVtPAOSh6FJMhiWFkpH0mNU
 Cf802w2QrAgEl8lMqWtJfXLkM5eOrNSFiOwRnfpU9v8KkVndZB0LrNyhqDNcxa+WGyTTv2BEubN
 y8mR40L5sQLC9ECX/HBsB/GXzGDwVIlcKmuDEONPjB2xSdNRB5m0Pog4JB/itG7zgMLw8GTHAFj
 F9aUyCU0fc9ahNuwI4A47VDx21nNA1lXsRVfIWREoUQ8NYgjA+sG5NezY6XTO+qEcEIaGozhQ=
X-Google-Smtp-Source: AGHT+IFJXRnDfIkz22NRmThgL6OmIL7W3fR5IWCHcWZwQ1tVrIE8lvDOL/hD2n8CMmi41+x2bshvTg==
X-Received: by 2002:a05:6000:220e:b0:3b8:f925:8d4 with SMTP id
 ffacd0b85a97d-3b900b35c4dmr8192220f8f.26.1754833810678; 
 Sun, 10 Aug 2025 06:50:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459de91ea4csm269320575e9.10.2025.08.10.06.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 06:50:10 -0700 (PDT)
Message-ID: <5c8792fc-b5ce-4537-b0d1-a094b8e31ffa@smile.fr>
Date: Sun, 10 Aug 2025 15:50:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250709200737.408235-1-thomas.perale@mind.be>
 <20250709231327.0ed2fa35@windsurf>
Content-Language: fr, en-US
In-Reply-To: <20250709231327.0ed2fa35@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754833811; x=1755438611; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lAk+TY+ZllmUAV/35K4UL4hQnPoa9+jlvSkOxPzzKF0=;
 b=UVAh2EKEvijCM4uBSpDlbCh2cNuIltK5xZymrBmCWWNaWfu9kIwRck8WTtRuM8CTeK
 d48nuMEGaZwTdcptBrahoQRSlJ+R4qtEyM+bg0JGdK71xTN8ojwfiHXH5AusQkiQVh94
 jhy/hZLIhw1m7wM676J8LTMDjamWYyEKc5VO0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=UVAh2EKE
Subject: Re: [Buildroot] [PATCH] package/softether: fix various build errors
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAwOS8wNy8yMDI1IMOgIDIzOjEzLCBUaG9tYXMgUGV0YXp6
b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBPbiBXZWQsICA5IEp1bCAyMDI1IDIyOjA3
OjM2ICswMjAwCj4gVGhvbWFzIFBlcmFsZSB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRy
b290Lm9yZz4gd3JvdGU6Cj4gCj4+IFRoaXMgcGFja2FnZXMgaGFzbid0IGJlZW4gYnVtcGVkIHNp
bmNlIDIwMTkgJiBuby1vbmUgaXMgZm9sbG93aW5nIGl0IG9uCj4+IHRoZSBERVZFTE9QRVJTIGxp
c3QuIEdpdmVuIHRoZSBpbmNyZWFzaW5nIG51bWJlciBvZiBwYXRjaGVzIGFuZAo+PiBkaWZmaWN1
bHR5IHRvIG1haW50YWluIGl0LCBJIHRoaW5rIGl0J3MgYSBnb29kIGNhbmRpZGF0ZSB0byBiZSBy
ZW1vdmVkLgo+IAo+IFRvdGFsbHkgYWdyZWUuCgpBZ3JlZSwgZXNwZWNpYWxseSBzaW5jZSBmaXJz
dCBwYXRjaGVzIHdlcmUgYWRkZWQgYmFjayBpbiAyMDE0LgpBbHNvIEJlcm5kIGRvZXNuJ3QgdXNl
IGl0IHNpbmNlIDIwMjMgWzFdLgpzb2Z0ZXRoZXIgZG9lc24ndCBoYXZlIGFueSBDUEUgaWRlbnRp
ZmllcnMsIHNvIHdlIGRvbid0IGtub3cgaG93IG1hbnkgQ1ZFcwphZmZlY3QgdGhpcyBwYWNrYWdl
LgoKWzFdCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1p
dC8yYjZlYTE4ZTQ3Yzg4Yjg5OWFjNDVkOGU2MGQzYTdiYzJmOTgzZDY2CgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgoKCj4gCj4gVGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
