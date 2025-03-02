Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249F3C19F32
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 15:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B748D40B35;
	Sun,  2 Mar 2025 15:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4kNQeTzJX6T; Sun,  2 Mar 2025 15:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E44B40C80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E44B40C80;
	Sun,  2 Mar 2025 15:01:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A36C8D2
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 15:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92914400E4
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 15:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PmCHr78S612 for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 15:01:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A7DF40245
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A7DF40245
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A7DF40245
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 15:01:09 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-30b83290b7bso42771891fa.1
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 07:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740927666; x=1741532466;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kvlXsA3AcybeRw9PEvDcWH+wPys6SCdL0JcSgTEwP3E=;
 b=SmWgBLTFLNBdb8af0bf8Lprx8gBMVhYTiGE2m4qi7x3fSzFLj0ynwiGlKTkj8vu91Z
 7hOg1GOxLshFpgqctGEhueSD4MChYfy5h6E3sLcqswUzK6dWxhU98vEeKR0mjyjP5Zz5
 TwnrYcGR161TUyB+K6hOWFh8Nse3etANJYlh9SsXKGZi34LgFBR9eoPZOiXKzG2/9H93
 +RNuZpd2OT+9kQcutoSgK0PzFSuyy969/KSC15cxLeGOCNOugT/DYBgBycqrHqOWC52Y
 LaFTNjksFuMaszFv8L/G3ReyjiuhAjw0fkS4gbhkotsVyekzn9dyE6HaxVEk7IvG3ctQ
 hJMA==
X-Gm-Message-State: AOJu0YyGAbSfaPUY7HnV8rUxa2NUJQ1A7pAO7XVybEb61H/dCgU2volp
 hy31sEZL2i8o61FGQYnNOxO3R9xg10BXLvUOBi0FGRjh+IUvqDO8qIRpNEdAa6cFIFJvc7CaZKC
 gmaOr+bjwoXLsa8Z4qn8dn+tBHrgapXLm
X-Gm-Gg: ASbGnctAL3/MDk5UFeCtKNTfjaiTtpl4YlKBOEItn8qO8vnBpPxXMzKXa1UMT2WNatk
 Djq9Uzzq+iog34aTphlpVzARHvfvlCC+SRFx68B7mJaBdDJsLRTcYR2aWNVDzlOYEW/nN4UDScN
 2ZygZROapo1JDhFtUikKHK+1BFQ+Q=
X-Google-Smtp-Source: AGHT+IEV1I67OMPDdrObzij9JxELFirxpbLzBRZ//xYNpagM/b9gkOwLATG+Ovx9MeR+yStmdj2L1WgfCFPvw/C2+Sc=
X-Received: by 2002:a2e:b8d5:0:b0:302:2598:de91 with SMTP id
 38308e7fff4ca-30b932357c0mr35300281fa.16.1740927666094; Sun, 02 Mar 2025
 07:01:06 -0800 (PST)
MIME-Version: 1.0
References: <20250302143758.300057-1-fancp2007@gmail.com>
In-Reply-To: <20250302143758.300057-1-fancp2007@gmail.com>
From: Scott Fan <fancp2007@gmail.com>
Date: Sun, 2 Mar 2025 23:00:53 +0800
X-Gm-Features: AQ5f1Jrh6k3pYzGQet4aw85fnEyd0aPZkdJ1KJOT5WILsbIAFRJcNl_Vm2mB7aA
Message-ID: <CAFkzVZbWicY58swiTT5MrUO+hOD2-JqBRLFR7qcV3ixPyryR7w@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740927666; x=1741532466; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kvlXsA3AcybeRw9PEvDcWH+wPys6SCdL0JcSgTEwP3E=;
 b=fZhy8aKgPc/RSzA2LtjGCae6JCNdQFyHYlYuKaLFM25TBeZ2ByZfaBTuZhPp+OFlDG
 W+lEkzAaAYEnaN8IQLtmYsnFXEFeAU9A2y9Vzi6XhUpLun117avEu9mKs5ATyW2KI9+K
 RZdnVW2Dg3H4IMRoEn9CCcKr0smrF/1YxNth19BgDBoqVb1UXLp1m2qh6EIEMt4ydfti
 S+vyepm10xKaUZhICSjqHkOS50Tqq7wANVMNedY5vGbqr6BZWuoaJXDk3QgKs9ohBBvB
 4/r6PdrKAL5XdtwpqfdSQkcYszow5HY+abuLWirSbRALHFLQ8UYjv0LfOcat8UWglchp
 zbLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fZhy8aKg
Subject: Re: [Buildroot] [PATCH 2024.02.x] package/postgresql: bump version
 to 16.8
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gdGhlIGxhc3QgYnVtcCB0byAxNi43LCBQZXRlciBmb3Jnb3QgdG8gdXBkYXRlIHRoZSBsaWNl
bnNlIGhhc2ggb2YKdGhlIENPUFlSSUdIVCBmaWxlLCB3aGljaCBjYXVzZWQgdGhlIGZvbGxvd2lu
ZyB0d28gYnVpbGRzIHRvIGZhaWwuCgpGaXhlcyAoMjAyNC4xMS54KToKaHR0cHM6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2ZkNTY5NDk1YzU2NzM3ZDNkNGI1MWYxMjIwYzc2OGI1
NDY1ZjdmZmEvCgpGaXhlcyAoMjAyNC4wMi54KToKaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm9yZy9yZXN1bHRzL2Y1ZWEyN2FjODJiYTIzMzNhMjUyNzExYmFjOTZmZjBhM2JkZWViODcvCgoK
U2NvdHQgRmFuCgpPbiBTdW4sIE1hciAyLCAyMDI1IGF0IDEwOjM44oCvUE0gU2NvdHQgRmFuIDxm
YW5jcDIwMDdAZ21haWwuY29tPiB3cm90ZToKPgo+IFJlbGVhc2Ugbm90ZXM6Cj4gaHR0cHM6Ly93
d3cucG9zdGdyZXNxbC5vcmcvZG9jcy9yZWxlYXNlLzE2LjgvCj4gaHR0cHM6Ly93d3cucG9zdGdy
ZXNxbC5vcmcvYWJvdXQvbmV3cy9wb3N0Z3Jlc3FsLTE3NC0xNjgtMTUxMi0xNDE3LWFuZC0xMzIw
LXJlbGVhc2VkLTMwMTgvCj4KPiBVcGRhdGVkIGxpY2Vuc2UgaGFzaCBkdWUgdG8gY29weXJpZ2h0
IHllYXIgYnVtcDoKPiBodHRwczovL2dpdC5wb3N0Z3Jlc3FsLm9yZy9naXR3ZWIvP3A9cG9zdGdy
ZXNxbC5naXQ7YT1jb21taXRkaWZmO2g9NzU5NjIwNzE2YWRiMzQ3YzFkOGM4YjJlNmY3ZDg4Yjk0
N2E1NGM5OAo+Cj4gU2lnbmVkLW9mZi1ieTogU2NvdHQgRmFuIDxmYW5jcDIwMDdAZ21haWwuY29t
Pgo+IC0tLQo+ICBwYWNrYWdlL3Bvc3RncmVzcWwvcG9zdGdyZXNxbC5oYXNoIHwgNiArKystLS0K
PiAgcGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwuaGFzaCBiL3BhY2thZ2UvcG9zdGdyZXNxbC9w
b3N0Z3Jlc3FsLmhhc2gKPiBpbmRleCAxMWMwZTc3YjA1Li41YzdhNDY2YThmIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvcG9zdGdyZXNxbC9wb3N0Z3Jlc3FsLmhhc2gKPiArKysgYi9wYWNrYWdlL3Bv
c3RncmVzcWwvcG9zdGdyZXNxbC5oYXNoCj4gQEAgLTEsNCArMSw0IEBACj4gLSMgRnJvbSBodHRw
czovL2Z0cC5wb3N0Z3Jlc3FsLm9yZy9wdWIvc291cmNlL3YxNi43L3Bvc3RncmVzcWwtMTYuNy50
YXIuYnoyLnNoYTI1Ngo+IC1zaGEyNTYgIDYyZTAyZjc3ZWJmYzRhMzdmMTcwMGMyMGNjM2NjZDg1
ZmY3OTdiNTYxMzc2NmViZjk0OWE3ODk5YmIyMTEzZmUgIHBvc3RncmVzcWwtMTYuNy50YXIuYnoy
Cj4gKyMgRnJvbSBodHRwczovL2Z0cC5wb3N0Z3Jlc3FsLm9yZy9wdWIvc291cmNlL3YxNi44L3Bv
c3RncmVzcWwtMTYuOC50YXIuYnoyLnNoYTI1Ngo+ICtzaGEyNTYgIDk0NjgwODNhNTZjZTBlZTdk
Mjk0NjAxYjc0ZGFkM2RkOWZjNjlkODdhZmY2MWYwYTlmYjYzYzgxM2ZmN2VmZDggIHBvc3RncmVz
cWwtMTYuOC50YXIuYnoyCj4gICMgTGljZW5zZSBmaWxlLCBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAt
c2hhMjU2ICA5YmYyMGVlNDkzOTI2YTdlMTdhNzRiYzdmMDUwODlmYmMwMTQyNjk2NjdiMTU0MGJj
MzVhNmIxOTRhNDBjOWRlICBDT1BZUklHSFQKPiArc2hhMjU2ICBlMzgyMmM0Nzk3ZmFkY2FiMzFh
M2ZjNzNmNzVjMjhhYzIwYzczZDcyYjU2NWRhOTFlOTk3NGNmOTM5OGVmNGQyICBDT1BZUklHSFQK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwubWsgYi9wYWNrYWdl
L3Bvc3RncmVzcWwvcG9zdGdyZXNxbC5tawo+IGluZGV4IGY0YjM4NGVkODIuLjQ5ZjBjMGRlNzAg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwubWsKPiArKysgYi9w
YWNrYWdlL3Bvc3RncmVzcWwvcG9zdGdyZXNxbC5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4g
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4KPiAtUE9TVEdSRVNRTF9WRVJTSU9OID0gMTYuNwo+
ICtQT1NUR1JFU1FMX1ZFUlNJT04gPSAxNi44Cj4gIFBPU1RHUkVTUUxfU09VUkNFID0gcG9zdGdy
ZXNxbC0kKFBPU1RHUkVTUUxfVkVSU0lPTikudGFyLmJ6Mgo+ICBQT1NUR1JFU1FMX1NJVEUgPSBo
dHRwczovL2Z0cC5wb3N0Z3Jlc3FsLm9yZy9wdWIvc291cmNlL3YkKFBPU1RHUkVTUUxfVkVSU0lP
TikKPiAgUE9TVEdSRVNRTF9MSUNFTlNFID0gUG9zdGdyZVNRTAo+IC0tCj4gMi40My4wCj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
