Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E5ACD3447
	for <buildroot@archiver.kernel.org>; Sat,  9 May 2026 19:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 149BB42657;
	Sat,  9 May 2026 19:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WcDALQZnVdmX; Sat,  9 May 2026 19:00:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 189E24238C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778353258;
	bh=mh83UxlVYwGBuji3PDU/YsMlayhgiLdv+Dj7Q5xZsNY=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KWVfzE4N6kpbmYkTkRdBSIDP9xTslMA6koqg1c7jA6nTSanfSWX9XiK9qgz2fRE9N
	 6w4oAAIzUhf1bw+46r/r7g7pof+vQYyN03UVYAELmrlelZOWW5ZL/UZySUMZK4OHeM
	 ddq/6pTFW3dRBhQlvIwC3f7LnqFYcHfxesQufmg+QLrclXKA+Y5InQLcementzYfjZ
	 ydc+4ybbRWAqvTp1YLbpbfOiYiHXwOXXUXjGPmzu8jSX+Yxj7dUwGmFaIvo8RT9iKC
	 e5vpTLCrqDRVpBB3Gp0N03DfaTDZwx3fZxqgYjCe+pfW7nl6Yatap91B731IbZhYn7
	 6kf9OOKorCV0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 189E24238C;
	Sat,  9 May 2026 19:00:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B3AA272
 for <buildroot@buildroot.org>; Sat,  9 May 2026 19:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C5F16172E
 for <buildroot@buildroot.org>; Sat,  9 May 2026 19:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvA-npJfxmY8 for <buildroot@buildroot.org>;
 Sat,  9 May 2026 19:00:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e36; helo=mail-vs1-xe36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 62AC961722
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62AC961722
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62AC961722
 for <buildroot@buildroot.org>; Sat,  9 May 2026 19:00:55 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-6324ee4040cso133420137.0
 for <buildroot@buildroot.org>; Sat, 09 May 2026 12:00:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778353254; cv=none;
 d=google.com; s=arc-20240605;
 b=cth2I8KcWcWzbM4ph7jLxZq2ATDLp6t6ZfEUwoPLZ30duMef9hivMnXS7mrTQsmrHA
 4UHDySoqM+6ZcCD1ii6m9tmRoABnmFizV8B6EF7O2P2rrXu/HRr0YRKb5U2BYc1rwLsT
 cDpiK+S/sXfSAUylJdBw84PGee+zHfjxrLZiwrAqNUfxB1C6KHgQ6ElyGwK/Bjy11TjU
 Fm8xbEXXh8uy3hWJQptKOknEc1KZjl7L+HTs5Dugz/lCsiqvVRz1UQnJ7TgXTsl2T/nY
 nnO+KaqqppuA0NHPqigyoc386ySYe/VP7PoDx16yPhgKZj8oD/a4Ka6VweJX0yr5iOJB
 umQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TaJKa1wUT0O1DMp32gDaTgjjDz6K1Qa9D+BlTlCP2JY=;
 fh=WlFnCFz7m6o7wxhrhbPX/EUGCJv5pyYkzHIy5LDKj9Y=;
 b=kHZGQkqy5Y/82mU4Escq9BcwiwEi3ojoGeqPMMQlQluaAR+Zw1luMS9sDb/Rdke8fi
 JW7r2lHb2SG1WS14tbRVg7eRaOadXWa8ODXD61X95uIfvQJoMVePkr1gct4KkuHYQ6r1
 2KRQxiRMtFRtt75tb6Y+SirMZ+Td2OkVrwS6KjutqzLBMq+Ete8bzxzKg37D5NC2y4us
 xpqI04HAzJXruLO9tHxWWPAt0zLnqqjNuct3L1C5ixZdD9oUuLF4T/ABvd71zwcCbNhn
 /z/4PgeZ99UfTYjS8cw8bUODrDWsQ5UiTW2hwXGR+yN8B+gzcg3lAWcUSlPhd51DFC2Z
 UgWw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778353254; x=1778958054;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TaJKa1wUT0O1DMp32gDaTgjjDz6K1Qa9D+BlTlCP2JY=;
 b=qWERn1hzMaCqEO+x1D0+1H19acyuxREAVx25z4mKJ9ko7KStVQAluH3xu2p+tz6Q1/
 ld+IQkYGLPEiy1iSfD4mX1VHiF/uC4my8W5sL86SyebvE+/nOwt6n115luL3ND7PYE0y
 d8x8vaTYkOcYGaIdSHgBu8cemKTgRJCXOZJG9V9esi5TIdySZWMkXcfzpKEBeNkM4RGG
 N1TGcH1subpQDLKZwguv451z5rEkzRSiRTo5I5fpWGljYc/HeoYkXjf+wxVUbTYfuBMs
 O82/u5MOrYlZWOXQwasnSaEaryzg8cH/agVUtzynu5Jg8ibITB+MVV3AflFGGv3381Cw
 N/VA==
X-Gm-Message-State: AOJu0YyWhvXjJq/6F8aS0UcQ3y+6/+D1HasmEPOsfn7HnIOrbQsAflfh
 YOFUtobkzFeDv/IT1B0CCA1Sf5wK553OHBHCZjimtcvT26rEYL/s76pKVgD7aiwmnbrEFxDyLNL
 d9XSDD5xpI67phwZEWjuySpiImJ8SuBA=
X-Gm-Gg: Acq92OEXJ01cflwjRhGoiYQ0W55YV0wCTuyxKv5EVAX8IkCXgk3P6r+U2BokXb1Lt0N
 IzCFiC89S0ZRSWgHk+mcbgjVJml+dIFMEPeJqBCPY1+LSw/H1ABX6lCBW+Nv8ZT+jWl1LivEAw0
 eaFAnabB0xJQ39e9PF6UpkZKqU2ceVN8qPb/Ev5jfQCNhLauhC6Cpab2xqZ8LMcpZTbG5G9L4HG
 j3NuK1sLK+OzVdjLTXBxfTACvijzdGSL/B0Cr9YawvOkWzPpw/myseCC4AU2LRkPqFzj8xC9OfD
 eZYvQdeRztPx+z3o3syDKcDKY9mfN/PNCPaERcYQgLCEqxI2s2Nn48EJ0vQq9lgnnfJb0A==
X-Received: by 2002:a05:6102:80a2:b0:632:a3f3:91d with SMTP id
 ada2fe7eead31-632a3f30b4emr716475137.17.1778353253886; Sat, 09 May 2026
 12:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260509093853.1651716-1-peter@korsgaard.com>
In-Reply-To: <20260509093853.1651716-1-peter@korsgaard.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 9 May 2026 13:00:42 -0600
X-Gm-Features: AVHnY4IY7g50a4nCs52N322Zb0j9ihnyLqjFBHjMzSlo0L9VqC-PhoGsOm81mDo
Message-ID: <CADvTj4p1VpLavsumv0zp4dZic7ejyooSXGthS_=qqgP6=yd1Tg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778353254; x=1778958054; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TaJKa1wUT0O1DMp32gDaTgjjDz6K1Qa9D+BlTlCP2JY=;
 b=PYwx5qO8y2uDqpZMc/t/ClJ0BDzHYerRj52U4hr8UYuPH8BPSdu7ZsIROfUqhzc49b
 gRvV7IniWOlFEMT3/5X1ArGITYUKYtHNty0lt3ZgNeJL3KWoOMUFczuf4pwFI/SJ3nU2
 qeEqNd3h5Hjn2pL8rhp5fVE+Jj3PoO9nzewoqlT03X2gwuZ4m/gYQJiJKb/XXo5AwK4E
 7blAd3XZqY8WWePO2ZEjy/YiSTeWBHVEVEwTx5lpv9uKlZtI7HeWIX/rn4+MLE48xukE
 6fhOD+McddUa3QISTeNgrBFLg/XgMc7w0Q+0ZUVo1Mb1MeXxXbxxuXBYeWZRbIx/mNq1
 4NlQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PYwx5qO8
Subject: Re: [Buildroot] [PATCH] Revert "package/python-setuptools: bump to
 version 82.0.0"
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBNYXkgOSwgMjAyNiBhdCAzOjM44oCvQU0gUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBr
b3JzZ2FhcmQuY29tPiB3cm90ZToKPgo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgNTEzNjVmZjA2Mzc5
YWFmNmZjYzlhNzUxZThmZjMyYWM2OTRmM2U5Mi4KPgo+IFRoaXMgYnJlYWtzIHUtYm9vdCA8IHYy
MDI1LjEwIGJ1aWxkcyB1c2luZyBiaW5tYW4sIHNvIHJldmVydCBpdCBmb3Igbm93Cj4gZ2l2ZW4g
dGhhdCB2MjAyNS4xMCBpcyBhIHF1aXRlIHJlY2VudCByZWxlYXNlLgo+Cj4gRml4ZXM6IGh0dHBz
Oi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTQyNDkzMzIwMTYK
PiBBbmQgbWFueSBtb3JlLgo+Cj4gTG9uZ2VyIHRlcm0gd2UgZWl0aGVyIHdhbnQgdG8gdXBncmFk
ZSBhbGwgdGhlIGRlZmNvbmZpZ3MgKHdoaWNoIHdpbGwgbm90IGZpeAo+IHRoZSBpc3N1ZSBmb3Ig
ZXh0ZXJuYWwgdXNlcnMpIG9yIGZpbmQgYSB3YXkgdG8gcGF0Y2ggb2xkZXIgdS1ib290IHZlcnNp
b25zLgoKTWF5YmUgd2UgY2FuIGluc3RhbGwgdGhpcyBzb21laG93IGZvciBjb21wYXRpYmlsaXR5
PzoKaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvcGtnX3Jlc291cmNlcwoKPgo+IFNpZ25lZC1vZmYt
Ynk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KPiAtLS0KPiAgcGFja2Fn
ZS9weXRob24tc2V0dXB0b29scy9weXRob24tc2V0dXB0b29scy5oYXNoIHwgNCArKy0tCj4gIHBh
Y2thZ2UvcHl0aG9uLXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMubWsgICB8IDQgKystLQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRvb2xzLmhh
c2ggYi9wYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRvb2xzLmhhc2gKPiBp
bmRleCAwMjM2YTEzOTk5Li5kMGVkMjcwZTljIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9u
LXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMuaGFzaAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9u
LXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMuaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAj
IG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3NldHVwdG9vbHMvanNvbgo+
IC1tZDUgIDZlNjViODhkMjQ2NmIzNWU4NmU1MTg3Yjk5NTAyYjFjICBzZXR1cHRvb2xzLTgyLjAu
MC50YXIuZ3oKPiAtc2hhMjU2ICAyMmUwYTJkNjk0NzRjNmFlNGZlYjAxOTUxY2I2OWQ1MTVlZDIz
NzI4Y2Y5NmQwNTUxM2QzNmU0MmI2MmIzN2NiICBzZXR1cHRvb2xzLTgyLjAuMC50YXIuZ3oKPiAr
bWQ1ICA4MmUxZDY3ODgzYjcxM2Y5NDkzNjU5YjUwZDEzYjQzNiAgc2V0dXB0b29scy04MC45LjAu
dGFyLmd6Cj4gK3NoYTI1NiAgZjM2YjQ3NDAyZWNkZTc2OGRiZmFmYzQ2ZThlNDIwN2I0MzYwYzY1
NGYxZjNiYjg0NDc1ZjBhMjg2MjhmYjE5YyAgc2V0dXB0b29scy04MC45LjAudGFyLmd6Cj4gICMg
TG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gIHNoYTI1NiAgODZkYTBmMDFhZWFl
NDYzNDhhM2MzZDQ2NTE5NWRjMWNlY2NkZTc5Zjc5ZTg3NzY5YTY0YjhkYTA0YjJhNDc0MSAgTElD
RU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1
cHRvb2xzLm1rIGIvcGFja2FnZS9weXRob24tc2V0dXB0b29scy9weXRob24tc2V0dXB0b29scy5t
awo+IGluZGV4IDNjOTQ5MzFmYmUuLmUwMTMwMDBjNTcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9w
eXRob24tc2V0dXB0b29scy9weXRob24tc2V0dXB0b29scy5tawo+ICsrKyBiL3BhY2thZ2UvcHl0
aG9uLXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMubWsKPiBAQCAtNCw5ICs0LDkgQEAKPiAg
Iwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+Cj4gLVBZVEhPTl9TRVRVUFRPT0xTX1ZFUlNJ
T04gPSA4Mi4wLjAKPiArUFlUSE9OX1NFVFVQVE9PTFNfVkVSU0lPTiA9IDgwLjkuMAo+ICBQWVRI
T05fU0VUVVBUT09MU19TT1VSQ0UgPSBzZXR1cHRvb2xzLSQoUFlUSE9OX1NFVFVQVE9PTFNfVkVS
U0lPTikudGFyLmd6Cj4gLVBZVEhPTl9TRVRVUFRPT0xTX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5
dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvODIvZjMvNzQ4ZjRkNmY2NWQxNzU2YjlhZTU3N2YzMjlj
OTUxY2RhMjNmYjkwMGU0ZGU5ZjcwOTAwY2VkOTYyMDg1Cj4gK1BZVEhPTl9TRVRVUFRPT0xTX1NJ
VEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMTgvNWQvM2JmNTdk
Y2QyMTk3OWI4ODdmMDE0ZWE4M2MyNGFlMTk0Y2ZjZDEyYjllMGZkYTY2Yjk1N2M2OWQxZmNhCj4g
IFBZVEhPTl9TRVRVUFRPT0xTX0xJQ0VOU0UgPSBNSVQKPiAgUFlUSE9OX1NFVFVQVE9PTFNfTElD
RU5TRV9GSUxFUyA9IExJQ0VOU0UKPiAgUFlUSE9OX1NFVFVQVE9PTFNfQ1BFX0lEX1ZFTkRPUiA9
IHB5dGhvbgo+IC0tCj4gMi40Ny4zCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
