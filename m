Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9288EC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A23383C3A;
	Wed,  7 Feb 2024 16:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQG4SG4gyc0u; Wed,  7 Feb 2024 16:29:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16AD483C3E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16AD483C3E;
	Wed,  7 Feb 2024 16:29:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7D231BF59A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B496340246
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63gSK6rHQ0xe for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:28:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51588421C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51588421C8
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51588421C8
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:28:57 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-dc6d8bd612dso891254276.1
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 08:28:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707323336; x=1707928136;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tUGwJS2lVweP3GYoJlOBrtBZNB8DHlpC2GkpidocFtI=;
 b=Gobkz331EHuxeVE6KCm7qDiWt/YNg53ombrXGW8i8JVYpYuFPF/kjhTg/ul1s35rWc
 LwIRnYw3WweiM/yRaykpq3TllmQtnmIWC5dNHp/NpLgzu0WAC7HmPZthDpPmq5viD1Rh
 XbsP2W6xTZgG2jXZdyPeBz7zzVxC7HIYnr0viACSd/hdTrYj72UaDtr6u6opYg0Ls8u8
 48WCT5mYgUWCEQmv9RejzQUErsS0iWWGDSTkQSIODBantvXCS87682PU+6n3m7PWR13V
 gQIKazhojJfwdud39rlPl6et4UpIOkYXF5FTvP7DHxLBSJ+2UvqDT8c1woeI0F35vYhZ
 r/bg==
X-Gm-Message-State: AOJu0YwgJOtHpmv7tN6Y68zVQN0A3oilVDb73gG9YUPEfBZQpj0Q9IBf
 W+YnvOLLRCaQ3aASRzB2pwbbylnID5jmiO/hVtqDky9/g4wHnuC73uGpJMqan/1MaO+y3r3LS2C
 k46Ka6B8qHlVcwIml5cwVcSgb5R/UbBO2KFXjXg==
X-Google-Smtp-Source: AGHT+IGig69rAuk5spKGV4dT9JIVIoQwW1xxCF1aL7+/i8vGRQFYH4Yp2Eai2F2utlzUN9i1u1SxEHrdDu5jfUg6PoY=
X-Received: by 2002:a25:b09:0:b0:dc2:46ca:e968 with SMTP id
 9-20020a250b09000000b00dc246cae968mr4588971ybl.4.1707323336104; Wed, 07 Feb
 2024 08:28:56 -0800 (PST)
MIME-Version: 1.0
References: <20240206175330.570115-1-dario.binacchi@amarulasolutions.com>
 <20240206175330.570115-2-dario.binacchi@amarulasolutions.com>
 <ZcNTut8WZPcPbLfl@landeda>
In-Reply-To: <ZcNTut8WZPcPbLfl@landeda>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 7 Feb 2024 17:28:45 +0100
Message-ID: <CABGWkvpyQwdGYpBaAB5dT0N8vEFBj_+9hnBJtjjoghekWPvJKA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1707323336; x=1707928136;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tUGwJS2lVweP3GYoJlOBrtBZNB8DHlpC2GkpidocFtI=;
 b=IxTms86XNY8b5i+DZazjltWctq1yhx6nvBxeEjKytBXS/bpL4rC2/KUfucfJq7adRY
 2uybQtA5MJ4t0mGtfCrm8aPaQkk0LfhBE91lm+gsUHryFQFt03jelT1OtohrzFgbjUHq
 L/6rJ75MhXqjBQe7tlSW9X535UQBFtYMDJACE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=IxTms86X
Subject: Re: [Buildroot] [PATCH 2/2] package/uuu: bump to version 1.5.165
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgQWxsCgpPbiBXZWQsIEZlYiA3LCAyMDI0IGF0IDEwOjU24oCvQU0gWWFubiBFLiBNT1JJ
TiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gRGFyaW8sIEFsbCwKPgo+IE9u
IDIwMjQtMDItMDYgMTg6NTMgKzAxMDAsIERhcmlvIEJpbmFjY2hpIHNwYWtlIHRodXNseToKPiA+
IEl0IHJlcXVpcmVzIHRoZSBob3N0LXRpbnl4bWwyIHBhY2thZ2UuCj4gPgo+ID4gVGhlIGhhc2gg
b2YgUkVBRE1FLm1kIGhhcyBjaGFuZ2VkIGJlY2F1c2UgYSByZWZlcmVuY2UgdG8gdGhlIHRpbnl4
bWwyCj4gPiBsaWNlbnNlIGhhcyBiZWVuIGFkZGVkOgo+ID4KPiA+ICAgICArIC0gdGlueXhtbCAo
emxpYiBsaWNlbnNlKSBpcyBmcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9sZWV0aG9tYXNvbi90aW55
eG1sMgo+Cj4gVGhhbmtzIGZvciBleHBsYWluaW5nIHRoZSBoYXNoIGNoYW5nZS4gOi0pCj4KPiBJ
IHdvbmRlciBpZiBpdCByZWFsbHkgbWFrZXMgc2Vuc2UgdG8ga2VlcCB1c2luZyB0aGUgUkVBRE1F
IGZpbGUgYXMgYQo+IGxpY2Vuc2UgZmlsZSBpbiBCdWlsZHJvb3QuCgpJIGFncmVlIHdpdGggeW91
LiBUaGUgbGljZW5zZSBvZiB0aGUgcGFja2FnZSBpcyBsb2NhdGVkIGluIHRoZSBmaWxlIExJQ0VO
U0UuCkFkZGl0aW9uYWxseSwgYnkgcmVtb3ZpbmcgdGhlIGZpbGUgUkVBRE1FLm1kIGZyb20gdGhl
IGxpY2Vuc2UgZmlsZXMsIHdlCnNpbXBsaWZ5IHRoZSBidW1wIHRvIG5ldyB2ZXJzaW9ucy4KU28s
IGlmIHlvdSBhZ3JlZSwgSSB3aWxsIHN1Ym1pdCBhIHBhdGNoIGZvciB0aGUgcmVtb3ZhbCBvZiBS
RUFETUUubWQgZnJvbQp0aGUgbGljZW5zZSBmaWxlcy4KClRoYW5rcyBhbmQgcmVnYXJkcywKRGFy
aW8KCj4gSW5kZWVkLCB0aGUgbGljZW5zaW5nIHRlcm1zIGFyZSBmb3IKPiB0aGlyZC1wYXJ0eSBs
aWJyYXJpZXMgdXV1IGxpbmtzIHRvLCBhbmQgZXZlbiB0aG91Z2ggdGhleSBhcmUgYnVuZGxlZCBp
bgo+IHRoZSBzb3VyY2UgdHJlZSBvZiB1dXV8bWZndG9vbHMsIHRoZXkgYXJlIG5vdCB1c2VkIGJ5
IEJ1aWxkcm9vdCBhcyB3ZQo+IHVzZSB0aGUgb25lcyB3ZSBidWlsZC4KPgo+IFRob3VnaHRzPwo+
Cj4gPiBSZWxlYXNlIG5vdGVzOgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL254cC1pbXgvbWZndG9v
bHMvcmVsZWFzZXMvdGFnL3V1dV8xLjUuMTYzCj4gPiBodHRwczovL2dpdGh1Yi5jb20vbnhwLWlt
eC9tZmd0b29scy9yZWxlYXNlcy90YWcvdXV1XzEuNS4xNjUKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4K
PiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgo+Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklO
Lgo+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL3V1dS91dXUuaGFzaCB8IDQgKystLQo+ID4gIHBhY2th
Z2UvdXV1L3V1dS5tayAgIHwgNCArKy0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdXV1L3V1
dS5oYXNoIGIvcGFja2FnZS91dXUvdXV1Lmhhc2gKPiA+IGluZGV4IDIwODE2YjUwODFkYi4uYzIz
MWQ1ZDcyOWYwIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS91dXUvdXV1Lmhhc2gKPiA+ICsrKyBi
L3BhY2thZ2UvdXV1L3V1dS5oYXNoCj4gPiBAQCAtMSw0ICsxLDQgQEAKPiA+ICAjIGxvY2FsbHkg
Y29tcHV0ZWQKPiA+IC1zaGEyNTYgIDY5NzJjN2ExZTc2ZDYwYTIyMjEyOTEzYTg4NjdiNzM3MTA0
NDEwYzJhNDdhZDg4YzhhZjQ2MGJkNDg4NWVjMDkgIHV1dV9zb3VyY2UtdXV1XzEuNS4xNDEudGFy
Lmd6Cj4gPiArc2hhMjU2ICA2ZTY1ZmMwMjhhZmFjYzk0YjgwNWFlMzc2ZTNkYTM4NjRkY2IyNTcw
ZDQyNTAzNzgyMGU3MTYyMDdhYjcwMzczICB1dXVfc291cmNlLXV1dV8xLjUuMTY1LnRhci5nego+
ID4gIHNoYTI1NiAgY2M4ZDQ3ZjdiOTI2MGY2NjY5ZWNkNDFjMjQ1NTRjNTUyZjE3NTgxZDgxZWU4
ZmM2MDJjNmQyM2VkYjhiZjQ5NSAgTElDRU5TRQo+ID4gLXNoYTI1NiAgMmQ4NzJjNmU1YWFlYTE1
ZWMxOTMyYmZiMzc4ZmI2MmUyNGVlN2VjMzk5ZmU3Zjk5OGYwM2Q5YjcyODIxNTMzNSAgUkVBRE1F
Lm1kCj4gPiArc2hhMjU2ICAxYjNkMDMwYTE4MjRkNjMzZjc1MTk0NzQzYmQ5MmJjMWVkMmQ5YTRi
ZjE5MTViYzExZTQ5YmY0YzBjNTQwMTJkICBSRUFETUUubWQKPiA+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3V1dS91dXUubWsgYi9wYWNrYWdlL3V1dS91dXUubWsKPiA+IGluZGV4IDkzYzc0OGVlNDZk
OC4uZDFiYWU2MWY1MjhlIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS91dXUvdXV1Lm1rCj4gPiAr
KysgYi9wYWNrYWdlL3V1dS91dXUubWsKPiA+IEBAIC00LDExICs0LDExIEBACj4gPiAgIwo+ID4g
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPgo+ID4gLVVVVV9WRVJTSU9OID0gMS41LjE0MQo+
ID4gK1VVVV9WRVJTSU9OID0gMS41LjE2NQo+ID4gIFVVVV9TT1VSQ0UgPSB1dXVfc291cmNlLXV1
dV8kKFVVVV9WRVJTSU9OKS50YXIuZ3oKPiA+ICBVVVVfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNv
bS9OWFBtaWNyby9tZmd0b29scy9yZWxlYXNlcy9kb3dubG9hZC91dXVfJChVVVVfVkVSU0lPTikK
PiA+ICBVVVVfTElDRU5TRSA9IEJTRCAzLUNsYXVzZSAiTmV3IiBvciAiUmV2aXNlZCIgTGljZW5z
ZQo+ID4gIFVVVV9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRSBSRUFETUUubWQKPiA+IC1IT1NUX1VV
VV9ERVBFTkRFTkNJRVMgPSBob3N0LWJ6aXAyIGhvc3Qtb3BlbnNzbCBob3N0LXpsaWIgaG9zdC1s
aWJ1c2IgaG9zdC16c3RkCj4gPiArSE9TVF9VVVVfREVQRU5ERU5DSUVTID0gaG9zdC1iemlwMiBo
b3N0LW9wZW5zc2wgaG9zdC16bGliIGhvc3QtbGlidXNiIGhvc3QtenN0ZCBob3N0LXRpbnl4bWwy
Cj4gPgo+ID4gICQoZXZhbCAkKGhvc3QtY21ha2UtcGFja2FnZSkpCj4gPiAtLQo+ID4gMi40My4w
Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
Pgo+IC0tCj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJl
YWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTog
fAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdO
ICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0t
LS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8
IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAg
fCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCgoKCi0tIAoK
RGFyaW8gQmluYWNjaGkKClNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRhcmlvLmJp
bmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCgoKQW1hcnVsYSBTb2x1dGlvbnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAw
IFRyZXZpc28sIFZlbmV0bywgSVQKClQuICszOSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFydWxhc29s
dXRpb25zLmNvbQoKd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
