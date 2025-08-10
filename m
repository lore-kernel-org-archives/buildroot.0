Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77E8C87FDA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 20:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1A4C40D8D;
	Sun, 10 Aug 2025 20:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJ5PgITK_rLq; Sun, 10 Aug 2025 20:42:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF73D40C7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF73D40C7D;
	Sun, 10 Aug 2025 20:42:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56CFC31
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4899F40B1D
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LiFjr_yOVmMd for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 20:42:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3ED3F40B12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ED3F40B12
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3ED3F40B12
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:42:24 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55b823c9129so3796750e87.3
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 13:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754858542; x=1755463342;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wTSVH+wCNc1dKoVYD860dbYt9CL/BI4TrnaE4Dwi7fw=;
 b=AzgqXoAgek0z95gtrQGIGZNS6LrI7zCctvWs8I2A0BoFonFzxactYdlXfqpfkP4NrP
 YFJtGC09lCgqnzOpgxS2dOjX6GIjqVdOmVcYkbqmRqwvGTIgNfl4njO12H77A3n+cCdL
 WeRbV56Gjpcul9oulDIdge2ss2EhXQV3TzmPHnb7ekiSEJLQwU3lADKU2EmfaK2oOxJI
 FZ0O38v01L+E87rAQYn0abF1KZVr2Hwc5/pNCMtxFjb7G9bswJfjXmqRt5N49WMSfQFx
 RfM84KnIeSWMQDxVaMlhlpn4yJeNJgeH4/nDCqnB/YQB8q5MTvppl1BOrl/pm/3B9a+m
 EIqg==
X-Gm-Message-State: AOJu0YwMVe6R95AbQOcaq23alyZMwm3Cx7Umn2U+5dIS7cq2/gCPHi7K
 e6xJdsggNDvkZCykTYM3fFl9GvtqvAo3e9zaaoVe1aE+kjcEPhAR1Kbk0lB5AXkaHiheFthfhMM
 9UBz8K45BfKhjJUIeksKVu2tur+vk/48dWfkk
X-Gm-Gg: ASbGncsRQF1aRKAceD/xKUzac2yaIuTHUX4w9lJ0D9TrRKQB0xqebvmG8PMF5D79wIP
 dcxw/ErN4kt2vSC9WW5bLMBik5aMzMAT186JU1q6j/ldOkcN1auBNW+ZoLLqRKA0cg7vzsDfGqd
 uyGpGnut1p+VqBsjLRut+K45XoQ/2EFjQZ5nuXvl8w14gwgrpw/2pmcf4Plvd5BmZO1QGWMisGc
 8ftErar
X-Google-Smtp-Source: AGHT+IFAvaqz0h/QIB27zS2jhRla2IcRFqZw/jo9Q5Dm2FX5VrWfa+emZb/LcxLqHVQTGnAJ1btE+mSNzpmvuOZKRVc=
X-Received: by 2002:a05:6512:110c:b0:553:a456:a0d4 with SMTP id
 2adb3069b0e04-55cc00a8204mr2527911e87.15.1754858541481; Sun, 10 Aug 2025
 13:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250602101435.764559-1-yegorslists@googlemail.com>
 <e7f0be5f-50d8-4c63-970a-a3211702a431@smile.fr>
In-Reply-To: <e7f0be5f-50d8-4c63-970a-a3211702a431@smile.fr>
Date: Sun, 10 Aug 2025 22:42:08 +0200
X-Gm-Features: Ac12FXwGRKSMc8iK4sJ0395bFLoKAJnlv_G4_RojcZRqABQWx5pp1CTamq7R78Y
Message-ID: <CAGm1_kuHMGo-LF4PQbuvP+=vGvH+UdagGk_7g7Cszp2+9qqMHw@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Daniel Sangue <daniel.sangue@sangue.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1754858542; x=1755463342; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wTSVH+wCNc1dKoVYD860dbYt9CL/BI4TrnaE4Dwi7fw=;
 b=Rrx9OXMBLNCJH87ME7XWzK3ueQJPp1LRMTR2T/smvtm/9qBC1G4m7CjT+5Hn6mV10+
 P8hN8Yi8V0WQsmv5hbbh8yM4CPIPpFTY+YpsQCPPL1/yI8LNYuBU7tzad8gyrEEXWtod
 Fk/dfazWPwu8LQmABeXRYzxz7Xz3Fi9XANNNAYRr4jF3mzgo4YP8zMKW8nNKlBbdGZbH
 +F3+FYTmSc1mRaPp2m+HZiGbR9V9kEuIrwMZghkgNY3Co66RrmlvbFg5fdbg7Uo9ZuT4
 arA4OUW9crBSQL53fhCayVZMwlpRDsP8Br00/090xXdZdApR60j4ug5ycJju08hNlMfp
 1AQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Rrx9OXMB
Subject: Re: [Buildroot] [PATCH] package/libftdi1: fix static building
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gU3VuLCBBdWcgMTAsIDIwMjUgYXQgODo0MuKAr1BNIFJvbWFpbiBOYW91
ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPgo+IEhlbGxvIFllZ29yLCBBbGwsCj4K
PiBMZSAwMi8wNi8yMDI1IMOgIDEyOjE0LCB5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbSBhIMOp
Y3JpdCA6Cj4gPiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5j
b20+Cj4gPgo+ID4gUmVzdG9yZSB0aGUgZm9sbG93aW5nIHBhdGNoLCBhcyB0aGUgdXBzdHJlYW0g
c3RpbGwgY2Fubm90IHByb2R1Y2Ugc3RhdGljCj4gPiBvbmx5IGxpYnJhcmllczoKPiA+Cj4gPiAw
MDAxLWNtYWtlLXVzZS10aGUtc3RhbmRhcmQtQ01ha2UtZmxhZy10by1kcml2ZS10aGUtc2hhcmUu
cGF0Y2gKPiA+Cj4gPiBGaXhlczoKPiA+Cj4gPiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qu
b3JnL3Jlc3VsdHMvMDc3NDRiNjdiNTNkMmIyNWU3OGUwZjYxYjUxMWEzNDI2NzdlMmFiYi8KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFp
bC5jb20+Cj4gPiAtLS0KPiA+ICAuLi5hbmRhcmQtQ01ha2UtZmxhZy10by1kcml2ZS10aGUtc2hh
cmUucGF0Y2ggfCA5MyArKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDkz
IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJmdGRpMS8w
MDAxLWNtYWtlLXVzZS10aGUtc3RhbmRhcmQtQ01ha2UtZmxhZy10by1kcml2ZS10aGUtc2hhcmUu
cGF0Y2gKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJmdGRpMS8wMDAxLWNtYWtlLXVz
ZS10aGUtc3RhbmRhcmQtQ01ha2UtZmxhZy10by1kcml2ZS10aGUtc2hhcmUucGF0Y2ggYi9wYWNr
YWdlL2xpYmZ0ZGkxLzAwMDEtY21ha2UtdXNlLXRoZS1zdGFuZGFyZC1DTWFrZS1mbGFnLXRvLWRy
aXZlLXRoZS1zaGFyZS5wYXRjaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAw
MDAwMDAwMDAuLjg1NjU4N2I3YTYKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3BhY2thZ2Uv
bGliZnRkaTEvMDAwMS1jbWFrZS11c2UtdGhlLXN0YW5kYXJkLUNNYWtlLWZsYWctdG8tZHJpdmUt
dGhlLXNoYXJlLnBhdGNoCj4gPiBAQCAtMCwwICsxLDkzIEBACj4gPiArRnJvbSBiMGVhNTc3M2M5
MGUzNjY1NGRhMzc1NjJhMDNlNjJkOWE2NjU3NWJmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+
ID4gK0Zyb206IFNhbXVlbCBNYXJ0aW4gPHMubWFydGluNDlAZ21haWwuY29tPgo+ID4gK0RhdGU6
IFN1biwgMjUgSmFuIDIwMTUgMDk6NDU6MDQgKzAxMDAKPiA+ICtTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlOiB1c2UgdGhlIHN0YW5kYXJkIENNYWtlIGZsYWcgdG8gZHJpdmUgdGhlIHNoYXJlZCBvYmpl
Y3QKPiA+ICsgYnVpbGQKPiA+ICsKPiA+ICtSZW1vdmUgdGhlIFNUQVRJQ0xJQlMgQ01ha2Ugb3B0
aW9uIChhbmQgdGhlIGNvZGUgaGFuZGxpbmcgaXQpIGFuZCBsZXQKPiA+ICt0aGUgc3RhbmRhcmQg
Q01ha2UgZmxhZ3MgZHJpdmUgdGhlIHNoYXJlZCBvYmplY3QgYnVpbGQuCj4gPiArCj4gPiArU2ln
bmVkLW9mZi1ieTogU2FtdWVsIE1hcnRpbiA8cy5tYXJ0aW40OUBnbWFpbC5jb20+Cj4gPiArW0Zh
YnJpY2U6IHVwZGF0ZSBmb3IgMS41XQo+ID4gK1NpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFp
bmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+Cj4gY2hlY2stcGFja2FnZSB3YXJuIGR1
ZSB0byBtaXNzaW5nIFVwc3RyZWFtOiB0YWcuCj4KPiBXQVJOSU5HOgo+IHBhY2thZ2UvbGliZnRk
aTEvMDAwMS1jbWFrZS11c2UtdGhlLXN0YW5kYXJkLUNNYWtlLWZsYWctdG8tZHJpdmUtdGhlLXNo
YXJlLnBhdGNoOjA6Cj4gbWlzc2luZyBVcHN0cmVhbSBpbiB0aGUgaGVhZGVyCj4KPiBXaGF0J3Mg
dGhlIHVwc3RyZWFtIHN0YXR1cyBvZiB0aGlzIHBhdGNoPyBub3QgYXBwbGljYWJsZT8KClVwc3Ry
ZWFtIGhhcyBub3cgYSBwcm9wZXIgc29sdXRpb24gWzFdIGFuZCBJIGFtIHdhaXRpbmcgZm9yIGEg
cmVsZWFzZS4KU28sIHdlIGNhbiBkcm9wIHRoZSBwYXRjaCBmb3Igbm93LgoKWzFdIGh0dHA6Ly9k
ZXZlbG9wZXIuaW50cmEybmV0LmNvbS9naXQvP3A9bGliZnRkaTthPWNvbW1pdDtoPTJhOTkyMzA2
YzBhY2Y5MzhiMjlmYTBjZDVmYmMxNjBlMjQ0MjQyMDkKClllZ29yCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
