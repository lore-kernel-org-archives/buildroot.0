Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCE5C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 16:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94C0140D6A;
	Sun, 10 Aug 2025 16:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXzV6xeIfvVh; Sun, 10 Aug 2025 16:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DEF140DEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DEF140DEC;
	Sun, 10 Aug 2025 16:59:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 46487138
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CE1B4017B
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I4iqNnjqJT7E for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 16:59:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2740B401CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2740B401CB
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2740B401CB
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:59:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b780bdda21so2924758f8f.3
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 09:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754845151; x=1755449951;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lpk+rFZUclrUaVuGwzo4YKXKLK2xwb2O7+TDazf6w2I=;
 b=La5u1MwQQJKWgcx+9VfbS6gtibJA2qTT7SKBVSPmS6hfBDtiprwukN83uUnxUnJmsn
 6J4ZfWZw64bt9fQ00iI1jqbA3xs8WbTVn4SMdl6JVIEzidvzu8QYq5p0WQsDieXUPkYp
 YF2X8YyjaJOuU6Z3hKkwIimQStWPMzQxD1hjJApMYcwszQp3Oe4B7bWcEPwlxpErWcYV
 oXnbmjaNHy9d1Gp06PlQDJSU1AMwsyL8QtrglRbz97igPvprUzgxDT2IYIVHH2EMS2sq
 G3JVYV+fEXghQIGkdhPI+bvFGwVgv3HjaD5AlEra4NEI6MH658rLAbsY0vkXmvqkMhGL
 XE3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgnLkcv+u1K0N2Kh+a864netRarg0zyLw1ejtuVYU5k/1CIqs+9unL+iDygLInef+h1EbJb1BqnQE=@buildroot.org
X-Gm-Message-State: AOJu0YzLr/FwSFrJy0nfQhHGNhFLrpYND7RqkME3Lbx9DQi8qP/cPHre
 S6taO5KTMcLBL7JU1Rm4+BSwCjQNK56oBCl7RgEbtspK0FtnkTjcFS0ahF0q6/tdIr4=
X-Gm-Gg: ASbGncslcGZiFlogfgFzExcnnGlgERoltTrfkbdHbEFSy7h1Ei6+ICvQz+BnES/sxhO
 qFG8J9iMfuG00Ww3HYfyqvGWCrzY0WEfvwrxJ5qu9jPDIaXZEOzeMcpS1WC0hJxZ+P02YED6+pX
 GaYnmMFj+VGheIYP7i+K7b15CINDKRAv/s24i6UTULySrUzncRkeYXB8QjXYK3uqGm6ME9sudXb
 CyiHbZoZNeCNZb75QZZl2fZY2ahGwI7nC5N4PkpEAITP321bKQkkr+4E7jWml2rtMbp9dLKj+AZ
 B2SW4Phf5KfkYCSR01jq7bKbltCsBsUuq25KWcyrjkxuLz9gQCdYml4Us5AGhWgJ18VgbQyMg2i
 o14JTYYBbKe7OX7DaftdOx1hcIWzcgOe+mJ+qEK9Kr5hz+hv62JZesGZAaXk4Txfa18YQu9yz0E
 OWHYA5wPMOwE3Fai0gu0rff1X/2HCcpIpkIRDRIfRKom+bjgW/1uks6ra+a2dg3sCFDdVjOPA=
X-Google-Smtp-Source: AGHT+IEX129Wz+9P0gC5HbD7wph6QoElrSVYzHlDvHkO0SY8Rr4TAVkJpFYI/Qu5HXKt11HygdizEQ==
X-Received: by 2002:a05:6000:401e:b0:3b8:d138:41d3 with SMTP id
 ffacd0b85a97d-3b900b8101emr7932778f8f.56.1754845151102; 
 Sun, 10 Aug 2025 09:59:11 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abf0csm36898192f8f.14.2025.08.10.09.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 09:59:10 -0700 (PDT)
Message-ID: <6836e056-ab08-432c-b773-59e4740747c8@smile.fr>
Date: Sun, 10 Aug 2025 18:59:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>
References: <20250810163029.19877-1-fl@n621.de>
Content-Language: fr, en-US
In-Reply-To: <20250810163029.19877-1-fl@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754845151; x=1755449951; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lpk+rFZUclrUaVuGwzo4YKXKLK2xwb2O7+TDazf6w2I=;
 b=IfxXKDaAYQejBGBe1nsFGqwUrbmAVapYh+V0G/+e6uJ57xKg+UDLsBoOogKNMMqVB/
 i/vJOxxsA062C4VjO4Qju66FkUDjeNOa5YTI8pD3/ikTMsVjdP1YVEihJrb9Y7MV6xB9
 G5Nw2csP8pGt8rtxfbPc+aRm1ix2Bjy1wODa8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=IfxXKDaA
Subject: Re: [Buildroot] [PATCH v2 0/2] fix build issues with modern GCC
 versions
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

SGVsbG8gRmxvcmlhbiwgQWxsLAoKTGUgMTAvMDgvMjAyNSDDoCAxODozMCwgRmxvcmlhbiBMYXJ5
c2NoIGEgw6ljcml0wqA6Cj4gVGhpcyBpcyBhIG5ldyB2ZXJzaW9uIG9mIFsxXSB0aGF0IHNwbGl0
cyB1cCB0aGUgR0NDIDE0IGFuZCBHQ0MgMTUKPiBjaGFuZ2VzIGFzIGRpc2N1c3NlZCB0aGVyZS4g
SSB3YXMgdW5kZXIgdGhlIG1pc3Rha2VuIGltcHJlc3Npb24gdGhhdCBJCj4gaGFkIHNlZW4gYXV0
b2J1aWxkIGZhaWx1cmVzIHdpdGggR0NDIDE1IGJ1dCB0aGF0IG11c3QganVzdCBoYXZlIGJlZW4g
b24KPiBteSBtYWNoaW5lIChvdXRzaWRlIG9mIEJ1aWxkcm9vdCkuCj4gCj4gTm9uZXRoZWxlc3Ms
IEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gYWxzbyBmaXggdGhlIEdDQyAxNSBpc3N1ZSBub3cK
PiB0b28uCj4gCj4gVGhlIHZlcnNpb24gSSd2ZSBzdWJtaXR0ZWQgdG8gdXBzdHJlYW0gaXMgdGhl
IGNvbWJpbmF0aW9uIG9mIGJvdGggb2YKPiB0aGVtLCBidXQgSSBzdHJvbmdseSBleHBlY3QgdGhh
dCBlaXRoZXIgYm90aCBvciBub25lIHdpbGwgZ2V0IGFwcGxpZWQgLQo+IHRoZSBwcm9qZWN0IHNl
ZW1zIHRvIGJlIHByZXR0eSBtdWNoIGFiYW5kb25lZC4KClRoYW5rcyBmb3IgdGhlIHJlc3Bpbi4K
CkluZGVlZCwgbmFub2NvbSAxLjAgd2FzIHJlbGVhc2VkIGJhY2sgaW4gMjAwNSEKaHR0cHM6Ly9z
b3VyY2Vmb3JnZS5uZXQvcHJvamVjdHMvbmFub2NvbS9maWxlcy9uYW5vY29tL3YxLjAvCgpJdCdz
IGEgZ29vZCBjYW5kaWRhdGUgZm9yIHJlbW92YWwuLi4KCkZvciBub3csIEknbGwgYXBwbHkgeW91
IHBhdGNoZXMuClNlcmllcyBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRz
LApSb21haW4KCgo+IAo+IFsxXSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
YnVpbGRyb290L3BhdGNoLzIwMjUwODEwMTUwNTA5LjEzNjUzLTEtZmxAbjYyMS5kZS8KPiAKPiBG
bG9yaWFuIExhcnlzY2ggKDIpOgo+ICAgcGFja2FnZS9uYW5vY29tOiBmaXggYnVpbGQgd2l0aCBH
Q0MgMTQKPiAgIHBhY2thZ2UvbmFub2NvbTogZml4IGJ1aWxkIHdpdGggR0NDIDE1Cj4gCj4gIC4u
Li9uYW5vY29tLzAwMDItZml4LWJ1aWxkLXdpdGgtZ2NjLTE0LnBhdGNoICB8IDE5ICsrKysrKysr
KysrKysrKysrKysKPiAgLi4uL25hbm9jb20vMDAwMy1maXgtYnVpbGQtd2l0aC1nY2MtMTUucGF0
Y2ggIHwgMTkgKysrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDM4IGluc2Vy
dGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbmFub2NvbS8wMDAyLWZpeC1i
dWlsZC13aXRoLWdjYy0xNC5wYXRjaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9uYW5v
Y29tLzAwMDMtZml4LWJ1aWxkLXdpdGgtZ2NjLTE1LnBhdGNoCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
