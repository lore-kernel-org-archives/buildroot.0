Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537E4CE8D7A
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 11:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19DE884733;
	Thu, 19 Sep 2024 11:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4KhVo3hy7eH; Thu, 19 Sep 2024 11:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D55184740
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D55184740;
	Thu, 19 Sep 2024 11:56:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD30B1BF33B
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB65F424BE
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VdZNz1Vr6vVb for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 11:55:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F6A7424B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F6A7424B6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F6A7424B6
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:55:58 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so104391066b.3
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 04:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726746956; x=1727351756;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2x0nZArp6wATB9dLutuo9gdCa9IanrPTW6CEOfblhO4=;
 b=gRJ1WjBFCLD/vyE3ZkUqYdro2MIembu+dXpgk/KiA06uHjRrgoOcPvQmboqnKJLZdS
 ALEc5L83nFTwdTuPi/KrFmfLa/Z4e8VAQOnQYY9A8kf6Kljr7mzlZm+4qiYHNjjszYtv
 sjwNzC+eXsWsZM4bTqgI0jZ0LNQphdXaxpSQ6RatLEmJWBgvzZrScqwpxuHtHLYu6OS8
 ZrHhALNGqaRCcJvpHvqM4spInAwCGJC8KfFWtx0E+jKFibyJtoajOKAE7stZKCVhwWvp
 q8YiJUFDh6A5yW6Aajiio6LIn02HQq9XZUqmTSMXCI2whWQrdQucWHSC+CRKvd0YAHDt
 iH4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrcNA92s1wZJuz/3TNSiubqsew2koFDIGnyQ9gbcYEi3nNbwO9FxcljHIRQs/jgXQSlwnLZONDVkg=@buildroot.org
X-Gm-Message-State: AOJu0YziNKS+gVnjzh+JXKSp+Z47Kn2wvb3E2AVsdQIuacFaZZhyI17K
 HPmVaIFZWvUmVhDAf1r178B0BSNfLm/NBHpLRRP5xU9D/CZNHzikl+EawhN/VcIhS0S/XCYTDaz
 FUMI=
X-Google-Smtp-Source: AGHT+IH2JNFKswMdtljC7llCWYKX0D/OxSp86hqrlIcqPImOU3R2jElMY8D6ZPo11ygQzEsF4Qe12A==
X-Received: by 2002:a17:907:e686:b0:a8d:75ab:17ca with SMTP id
 a640c23a62f3a-a902949a224mr2407548366b.31.1726746956093; 
 Thu, 19 Sep 2024 04:55:56 -0700 (PDT)
Received: from [10.130.6.116] ([83.68.141.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90613316c2sm707476966b.211.2024.09.19.04.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2024 04:55:55 -0700 (PDT)
Message-ID: <18b7c354-da3a-47fd-a424-d0391eea9fac@mind.be>
Date: Thu, 19 Sep 2024 13:55:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <CAOMZO5D3LL=gCQt-k5e3350tQ+XULrzhV233q1GZbGFDD5f3Cg@mail.gmail.com>
 <20240724221001.7ec77c1b@windsurf>
 <CAOMZO5DbYXhKjwpyoLUFhV97_VZ076ExChBWmAzU8Z5FN-M6kQ@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAOMZO5DbYXhKjwpyoLUFhV97_VZ076ExChBWmAzU8Z5FN-M6kQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726746956; x=1727351756; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2x0nZArp6wATB9dLutuo9gdCa9IanrPTW6CEOfblhO4=;
 b=HrgWaudsVVjDbClDi+HOrc2N3yJb1fiAaX62s1bTXmDwISICisiqVdlkpGHkVTZXSq
 OnEcV8bH57ERZ8SZ07pKm6KsYpp4Sf/oDdg3nhF/LytRzfXoM/UQovrQibjNqzMDFqAc
 8aKtIi/yDE96z2PRSLN9wqari6oBKBNO+6e/4pq+moZmWe6Fx72ZfCxmUq2E3psHXkgQ
 c/oGmxboyDeX42Z7pYyQ1jPeTP0NmIAjbyDgYqJ71MII6zBy6YYXKM68HixHkMeVvJJ3
 NGwgjRq22im2jP9B5L8cE+1VE1zkx/G7NInQ6Qt+9w7FAiS1prLgswOf6Gojl4zPfq/A
 6JEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HrgWauds
Subject: Re: [Buildroot] crucible: Build failure on riscv64/mips64el
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
Cc: Christian Stewart <christian@aperture.us>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8wOS8yMDI0IDA1OjIxLCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IFdlZCwgSnVsIDI0LCAyMDI0IGF0IDU6MTDigK9QTSBUaG9tYXMgUGV0YXp6b25pCj4gPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+IAo+PiBJIGFncmVlIHRoYXQgd2UgZG9u
J3QgcmVhbGx5IGNhcmUgYWJvdXQgY3J1Y2libGUgb24gUklTQy1WIDY0LWJpdCBhbmQKPj4gbWlw
czY0ZWwuIEhvd2V2ZXIsIHRoZSBidWlsZCBmYWlsdXJlcyB5b3UncmUgcG9pbnRpbmcgdG8gZG9u
J3Qgc2VlbSB0bwo+PiBiZSBjYXVzZWQgYnkgYW55dGhpbmcgQVJNLXNwZWNpZmljIGluIHRoZSBj
cnVjaWJsZSBjb2RlIGJhc2UuIEluc3RlYWQKPj4gdGhleSBsb29rIGxpa2UgcmVsYXRpdmVseSBn
ZW5lcmljIGlzc3VlcyB3aXRoIG91ciBHbyBpbnRlZ3JhdGlvbi4KPj4KPj4gQ2hyaXN0aWFuLCBk
byB5b3UgdGhpbmsgeW91IGNvdWxkIGhhdmUgYSBsb29rIGF0IHRoZSBhYm92ZSB0d28KPj4gZmFp
bHVyZXMsIHdoaWNoIHJlYWxseSBkb24ndCBzZWVtIHRvIGJlIHJlbGF0ZWQgdG8gdGhlIGNydWNp
YmxlIGNvZGUsCj4+IGJ1dCBtb3JlIGdlbmVyYWwgR28gaXNzdWVzLgo+Pgo+PiBUaGUgZmlyc3Qg
b25lOgo+Pgo+PiAkV09SSy9iMDcxL19wa2dfLmEoX3gwMDEubyk6IHVua25vd24gcmVsb2NhdGlv
biB0eXBlIDE3OyBjb21waWxlZCB3aXRob3V0IC1mcGljPwo+PiAkV09SSy9iMDc4L19wa2dfLmEo
X3gwMDUubyk6IHVua25vd24gcmVsb2NhdGlvbiB0eXBlIDE3OyBjb21waWxlZCB3aXRob3V0IC1m
cGljPwo+Pgo+PiBpcyByZWFsbHkgbXlzdGVyaW91cyB0byBtZS4KPj4KPj4gVGhlIHNlY29uZCBv
bmU6Cj4+Cj4+IC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtOS9vdXRwdXQtMS9o
b3N0L2xpYi9nY2MvbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LWdudS8xMy4zLjAvLi4vLi4vLi4v
Li4vbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LWdudS9iaW4vbGQ6IC90bXAvZ28tbGluay0yMDQ0
MjQ4ODAzL2dvLm86IGxpbmtpbmcgLW1uYW49bGVnYWN5IG1vZHVsZSB3aXRoIHByZXZpb3VzIC1t
bmFuPTIwMDggbW9kdWxlcwo+Pgo+PiBpcyByZWxhdGVkIHRvIHRoZSBmYWN0IHRoYXQgZGlmZmVy
ZW50IG9iamVjdCBmaWxlcy9saWJyYXJpZXMgaGF2ZSBiZWVuCj4+IGJ1aWx0IHdpdGggZGlmZmVu
dCAtbW5hbiBhcmd1bWVudHMsIGFuZCB3ZSB0cnkgdG8gbGluayB0aGVtIHRvZ2V0aGVyLAo+PiB3
aGljaCBpc24ndCBjb3JyZWN0LiBUaGUgY29uZmlndXJhdGlvbiBoYXMgQlIyX01JUFNfTkFOXzIw
MDg9eSwgc28KPj4gd2UncmUgc3VwcG9zZWQgdG8gYmUgYnVpbGRpbmcgZXZlcnl0aGluZyB3aXRo
IC1tbmFuPTIwMDgsIGJ1dCBpdCBzZWVtcwo+PiBsaWtlIHNvbWUgR28gc3R1ZmYgdHJpZXMgdG8g
dXNlIC1tbmFuPWxlZ2FjeSBpbnN0ZWFkLgo+Pgo+PiBJZiB5b3UgY291bGQgaGVscCB3aXRoIHRo
b3NlIHdlaXJkIEdvIGlzc3VlcywgaXQgd291bGQgYmUgbXVjaCwgbXVjaAo+PiBhcHByZWNpYXRl
ZC4KPiAKPiBDYW4gYW55b25lIHBsZWFzZSBoZWxwIHdpdGggdGhlc2UgR28gaXNzdWVzPwo+IAo+
IEkga2VlcCBnZXR0aW5nIGJ1aWxkIGZhaWx1cmUgcmVwb3J0cyBmb3IgdGhlIGNydWNpYmxlIHBh
Y2thZ2UuCj4gCj4gSGVyZSBpcyBhbm90aGVyIG9uZToKPiBodHRwczovL2F1dG9idWlsZC5idWls
ZHJvb3Qub3JnL3Jlc3VsdHMvYjU2ZDkzNzZiZDc1ODA4MWUyN2JjMzQ5YzE5Mjc4M2VjZTIyYTRm
Yi9idWlsZC1lbmQubG9nCgogIElmIHdlIGRvbid0IGZpbmQgYSBzb2x1dGlvbiBJIHRoaW5rIHdl
IHNob3VsZCBkaXNhYmxlIEdvIGVudGlyZWx5IGZvciB0aGVzZSAKYXJjaGl0ZWN0dXJlcy4gVW50
aWwgc29tZW9uZSBzaG93cyB1cCB3aG8gaXMgd2lsbGluZyB0byBwdXQgaW4gdGhlIGVmZm9ydCB0
byAKbWFrZSBpdCB3b3JrLgoKICBSZWdhcmRzLAogIEFybm91dAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
