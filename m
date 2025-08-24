Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8DACA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 12:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B9AE41810;
	Sun, 24 Aug 2025 12:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMMNhEXD4wVx; Sun, 24 Aug 2025 12:11:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BA214196B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA214196B;
	Sun, 24 Aug 2025 12:11:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C95119C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 12:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32F0B41810
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 12:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whidHTYlHymu for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 12:11:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 41FCC41B7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41FCC41B7F
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41FCC41B7F
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 12:11:34 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45a20c51c40so28302285e9.3
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 05:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756037492; x=1756642292;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nviq7bdaLJtPIWQxDiJD7K/+HtQ7fM5oNeac5PSjTew=;
 b=GEMrwZJYB9bJVo7BVwkzrJdIttllP2Q4Sk8ll01vWAPGlHyDQ5hrDbuZ/oa2Z5a89f
 V3hJ9+m0P2i7TYu/MgTOjAWlvkH0pYJGxdtpsouPDc0cGC2XPCQ9/Pk1ZMAPEaQzECs6
 oiiY/um92hBFDRHw8HvRcO4Ql6mveG+MF8tVzy59VDy8YGpB048V+N1Oprz8KFbCFFyo
 q9lRTlPaswvTXWC7j4DRj5SHnYTRbp47tQSLPAxW1h0xq4fhDdke/Ttz8A7H8pQzeRHS
 H7ZT33Ajtce7A+ekt0v0zATTHb6SyUBktwGYksyvM2Pkb77LfMPl92+od6TJwbleMjMw
 Bzqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7l6eurkyRazWlSY0MXY20Zbe3L+BrlHwRQvRAhtB2bRUBpp5vSUy+40R+L8RGo37IkxrLISkMcFM=@buildroot.org
X-Gm-Message-State: AOJu0YwZ3qnDnr74ffJ/meMpsHHOs/ly8zFu7c1LHiaejx7FbkAI+Qql
 nYhL6JsQtJZsNq4QcA2+NrAyG/aVoqNyGWngHPIuev0EH/UUXgFpkD8y5Y11DcQ9XxM=
X-Gm-Gg: ASbGnctG7n495BLRP3ZLsrO4FiCICAK1asn+qZiCCisUmvDIxc4i3a4l7CoX0dHg3Zn
 lil5terKLui0aVeZqfbuCVTulqOdhZhUZ7KGUiqaWGax/3+Qti4WUhODsjlfhFwIM5/YhAKMNlE
 BXWNE0dIHzcaC4HN2OEUXa0mtipGo7LdHsylxfOgNAsHoQx10c5c9MNwZ5+ifXEW++uYZFvb9a6
 BA8hAsjmTxLA/UjUpqH15KrQl8fy1Rkle4xnTIDOeH1dcXxBMuqX8DOSeOSPbQThOaw+x4iQgAU
 QE9FRGYEuiGjQGbTb/ACZNAr13kU3F3C06/5QGOglwFVXH5KTNj4Lu4xZ2ynvkK2vM9CH2m+ZDp
 LGfZATgB1gBIP0uk/Ls+zg/8SiMJVi6yRlvyXxikl9k0uuHSp1NoKsXlRRdUaFvJ7tiboAj5SvC
 56RGeN7uosp9TGutZZW2+wXHagiC3zYfABneqZjwHQTX9xG1RbaaTiBiO1GUvz
X-Google-Smtp-Source: AGHT+IFuVmcDGn4cGP4AddoWagDKAEujyXeHXQG+57KQNoqRoMY8BdAAZ1XhvdNospYJqXkrVMXPTA==
X-Received: by 2002:a05:600c:4f43:b0:43c:fc04:6d35 with SMTP id
 5b1f17b1804b1-45b51798fa6mr68484655e9.4.1756037491977; 
 Sun, 24 Aug 2025 05:11:31 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b575736f1sm67815235e9.13.2025.08.24.05.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 05:11:31 -0700 (PDT)
Message-ID: <d4bf892c-8d46-4749-97d6-889bb49479db@smile.fr>
Date: Sun, 24 Aug 2025 14:11:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250823204043.244589-1-thomas.petazzoni@bootlin.com>
Content-Language: fr
In-Reply-To: <20250823204043.244589-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756037492; x=1756642292; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Nviq7bdaLJtPIWQxDiJD7K/+HtQ7fM5oNeac5PSjTew=;
 b=rN+Wg1LMmDRsrQ5aWAfWUJ5PFrdo6VVoqlkVmp1hpSs7upNZFBvmtDH4eaeRZeRyeu
 bKKJCCpcjPtzN8axDj8t/lC8sgN/v3pYIoEtSra4jNBwqskHeQVLeJ4unwanFxNfBuTg
 NfH8igGWvoYF/IaWljunKcwfn5ukhSedJ6PNY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=rN+Wg1LM
Subject: Re: [Buildroot] [PATCH] package/wayland: tweak wayland-scanner.pc
 after installation to fix SDL2 build issue
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAyMy8wOC8yMDI1IMOgIDIyOjQwLCBUaG9tYXMgUGV0YXp6
b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBTb21lIHBhY2thZ2VzIHN1Y2ggYXMgU0RM
MiBkbyB0aGlzOgo+IAo+IFdBWUxBTkRfU0NBTk5FUj1gJFBLR19DT05GSUcgLS12YXJpYWJsZT13
YXlsYW5kX3NjYW5uZXIgd2F5bGFuZC1zY2FubmVyYAo+IAo+IHRvIGZpbmQgdGhlIHBhdGggdG8g
dGhlIHdheWxhbmQtc2Nhbm5lciB0b29sLgo+IAo+IE9mIGNvdXJzZSwgc2luY2UgU0RMMiBpcyBj
b21waWxlZCBmb3IgdGhlIHRhcmdldCwgaXQgZG9lcyB0aGF0IHVzaW5nCj4gdGhlIHBrZy1jb25m
aWcgY29uZmlndXJlZCBmb3IgY3Jvc3MtY29tcGlsYXRpb24sIHdoaWNoIGxvb2tzIGF0Cj4gJChT
VEFHSU5HX0RJUikvdXNyL2xpYi9wa2djb25maWcvd2F5bGFuZC1zY2FubmVyLnBjLgoKQmVmb3Jl
IHRoaXMgcGF0Y2g6Cgpob3N0L2Jpbi9wa2ctY29uZmlnIC0tdmFyaWFibGU9d2F5bGFuZF9zY2Fu
bmVyIHdheWxhbmQtc2Nhbm5lcgovdXNyL2Jpbi93YXlsYW5kLXNjYW5uZXIKCkFmdGVyIHRoaXMg
cGF0Y2g6Cgpob3N0L2Jpbi9wa2ctY29uZmlnIC0tdmFyaWFibGU9d2F5bGFuZF9zY2FubmVyIHdh
eWxhbmQtc2Nhbm5lcgpbLi4uXS9ob3N0L2Jpbi93YXlsYW5kLXNjYW5uZXIKCj4gCj4gU2luY2Ug
aXQgbG9va3MgYXQgdGhlIHZhcmlhYmxlIHdheWxhbmRfc2Nhbm5lciwgd2hpY2ggZG9lc24ndCBn
ZXQKPiBwcmVmaXhlZCBieSBQS0dfQ09ORklHX1NZU1JPT1RfRElSLCB0aGUgU0RMMiBjb25maWd1
cmUgc2NyaXB0IGlzIHRvbGQKPiB0aGF0IHdheWxhbmQtc2Nhbm5lciBpcyBpbiAvdXNyL2Jpbi93
YXlsYW5kLXNjYW5uZXIgY2F1c2luZyB0aGlzIGtpbmQKPiBvZiBidWlsZCBmYWlsdXJlOgo+IAo+
IC9iaW4vYmFzaDogbGluZSAxOiAvdXNyL2Jpbi93YXlsYW5kLXNjYW5uZXI6IE5vIHN1Y2ggZmls
ZSBvciBkaXJlY3RvcnkKPiAvYmluL2Jhc2g6IGxpbmUgMTogL3Vzci9iaW4vd2F5bGFuZC1zY2Fu
bmVyOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gCj4gd2hlbiBidWlsZGluZyBTREwyLgo+
IAo+IFRoZSB0YXJnZXQgd2F5bGFuZCBwYWNrYWdlIGRlcGVuZHMgb24gaG9zdC13YXlsYW5kLCB3
aGljaCBtb3N0IG5vdGFibHkKPiBpcyByZXNwb25zaWJsZSBmb3IgaW5zdGFsbGluZyB3YXlsYW5k
LXNjYW5uZXIgaW4gJChIT1NUX0RJUikvYmluLgo+IAo+IFNvIGluIG9yZGVyIHRvIGZpeCB0aGUg
U0RMMiBidWlsZCBpc3N1ZSBidXQgaW4gYSBnbG9iYWwgd2F5IChwb3NzaWJseQo+IGhlbHBpbmcg
b3RoZXIgcGFja2FnZXMpLCB3aGF0IHRoaXMgcGF0Y2ggZG9lcyBpcyB0d2VhayB0aGUKPiB3YXls
YW5kLXNjYW5uZXIucGMgaW5zdGFsbGVkIGJ5IHRoZSB0YXJnZXQgd2F5bGFuZCBzbyB0aGF0IGl0
cwo+IHdheWxhbmRfc2Nhbm5lciB2YXJpYWJsZSBwb2ludHMgdG8gdGhlIGhvc3Qgd2F5bGFuZC1z
Y2FubmVyCj4gZXhlY3V0YWJsZS4gV2UgZmluZCB0aGlzIGEgYmV0dGVyIHNvbHV0aW9uIHRoYW4g
cGFzc2luZyBhCj4gV0FZTEFORF9TQ0FOTkVSIHZhcmlhYmxlIHRvIGVhY2ggYW5kIGV2ZXJ5IHBh
Y2thZ2UgdGhhdCBuZWVkcwo+IHdheWxhbmQtc2Nhbm5lci4KPiAKPiBUaGUgaXNzdWUgaXMgbm90
IHZpc2libGUgaW4gdGhlIGF1dG9idWlsZGVycywgYnV0IGNhbiBiZSByZXByb2R1Y2VkCj4gdXNp
bmcgdGhlIGZvbGxvd2luZyBkZWZjb25maWc6CgpJdCBzZWVtcyBvYnZpb3VzIHRoYXQgL3Vzci9i
aW4vd2F5bGFuZC1zY2FubmVyIHNob3VsZCBub3QgZXhpc3Qgb24gdGhlIGJ1aWxkCm1hY2hpbmUg
dG8gcmVwcm9kdWNlIHRoZSBpc3N1ZS4gSSBkaWRuJ3QgY2hlY2tlZCB0aGF0IGJlZm9yZSB0cnlp
bmcgdG8gcmVwcm9kdWNlCnRoZSBpc3N1ZSBzbyBzZGwyIGJ1aWxkIGZpbmUuIE1heWJlIC91c3Iv
YmluL3dheWxhbmQtc2Nhbm5lciBpcyBpbnN0YWxsZWQgb24KYXV0b2J1aWxkZXJzPwoKPiAKPiAg
QlIyX2FybT15Cj4gIEJSMl9jb3J0ZXhfYTk9eQo+ICBCUjJfQVJNX0VOQUJMRV9WRlA9eQo+ICBC
UjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElO
PXkKPiAgQlIyX0lOSVRfTk9ORT15Cj4gIEJSMl9TWVNURU1fQklOX1NIX05PTkU9eQo+ICAjIEJS
Ml9QQUNLQUdFX0JVU1lCT1ggaXMgbm90IHNldAo+ICBCUjJfUEFDS0FHRV9TREwyPXkKPiAgQlIy
X1BBQ0tBR0VfU0RMMl9XQVlMQU5EPXkKPiAgQlIyX1BBQ0tBR0VfU0RMMl9PUEVOR0xFUz15Cj4g
IEJSMl9QQUNLQUdFX1JQSV9VU0VSTEFORD15Cj4gIEJSMl9QQUNLQUdFX1dBWUxBTkQ9eQo+ICAj
IEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0Cj4gCj4gVGhlIGlzc3VlIHByb2JhYmx5
IGV4aXN0cyBzaW5jZSBXQVlMQU5EX1NDQU5ORVIgd2FzIHJldHJpZXZlZCB1c2luZwo+IHBrZy1j
b25maWcgaW4gU0RMMidzIGNvbmZpZ3VyZS5hYyBzY3JpcHQsIGluIHVwc3RyZWFtIGNvbW1pdAo+
IDE5ZDM1MDBhZTE5NjM2ZjNmNDEwZTI3MGYxMmUwYmM1ZTgzNDEwZDQsIHdoaWNoIGdvdCBmaXJz
dCBpbnRyb2R1Y2VkCj4gaW4gcmVsZWFzZS0yLjAuNSBvZiBTREwyLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gLS0t
Cj4gTm90ZTogdGhlIGFib3ZlIGNvbmZpZ3VyYXRpb24gZG9lc24ndCBidWlsZCBkdWUgdG8gb3Ro
ZXIgaXNzdWVzIGluCj4gcnBpLXVzZXJsYW5kLCBwYXRjaGVzIGFyZSBjb21pbmcuCgpQYXRjaCBt
ZXJnZWQ6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1p
dC8wZjIwZDlhOWI4YTc1MjBlYzc0N2M3ODVkZTlmNTIyZjVmODEzNzRkCgpBcHBsaWVkIHRvIG1h
c3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+ICBwYWNrYWdlL3dh
eWxhbmQvd2F5bGFuZC5tayB8IDEyICsrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dheWxhbmQvd2F5bGFuZC5t
ayBiL3BhY2thZ2Uvd2F5bGFuZC93YXlsYW5kLm1rCj4gaW5kZXggYmI1Y2VhYmI5Yy4uMjM5MDNi
YWZjYiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dheWxhbmQvd2F5bGFuZC5tawo+ICsrKyBiL3Bh
Y2thZ2Uvd2F5bGFuZC93YXlsYW5kLm1rCj4gQEAgLTIzLDUgKzIzLDE3IEBAIGRlZmluZSBXQVlM
QU5EX1RBUkdFVF9DTEVBTlVQCj4gIGVuZGVmCj4gIFdBWUxBTkRfUE9TVF9JTlNUQUxMX1RBUkdF
VF9IT09LUyArPSBXQVlMQU5EX1RBUkdFVF9DTEVBTlVQCj4gIAo+ICsjIFRoZSB3YXlsYW5kLXNj
YW5uZXIucGMgaW5zdGFsbGVkIGJ5IHRoZSB0YXJnZXQgd2F5bGFuZCBwYWNrYWdlIGlzCj4gKyMg
dXNlZCB0byBmaW5kIHRoZSB3YXlsYW5kLXNjYW5uZXIgdG9vbCwgd2hpY2ggaW4gYSBjcm9zcy1j
b21waWxhdGlvbgo+ICsjIGNvbnRleHQgaXMgY29tcGlsZWQgZm9yIHRoZSBob3N0IChhbmQgaW4g
QnVpbGRyb290LCBjb21waWxlZCBieQo+ICsjIGhvc3Qtd2F5bGFuZCkuIEJlbG93LCB3ZSB0d2Vh
ayB0aGUgdGFyZ2V0IHdheWxhbmQtc2Nhbm5lci5wYyBzbyB0aGF0Cj4gKyMgd2hlbiB0aGUgd2F5
bGFuZF9zY2FubmVyIHZhcmlhYmxlIGlzIHJlcXVlc3RlZCB0aHJvdWdoIHBrZy1jb25maWcsCj4g
KyMgaXQgcG9pbnRzIHRvIHRoZSBob3N0IHdheWxhbmRfc2Nhbm5lciB0b29sLgo+ICtkZWZpbmUg
V0FZTEFORF9UV0VBS19XQVlMQU5EX1NDQU5ORVJfUEFUSAo+ICsJJChTRUQpICdzJV53YXlsYW5k
X3NjYW5uZXI9Liold2F5bGFuZF9zY2FubmVyPSQoSE9TVF9ESVIpL2Jpbi93YXlsYW5kLXNjYW5u
ZXIlJyBcCj4gKwkJJChTVEFHSU5HX0RJUikvdXNyL2xpYi9wa2djb25maWcvd2F5bGFuZC1zY2Fu
bmVyLnBjCj4gK2VuZGVmCj4gK1dBWUxBTkRfUE9TVF9JTlNUQUxMX1RBUkdFVF9IT09LUyArPSBX
QVlMQU5EX1RXRUFLX1dBWUxBTkRfU0NBTk5FUl9QQVRICj4gKwo+ICAkKGV2YWwgJChtZXNvbi1w
YWNrYWdlKSkKPiAgJChldmFsICQoaG9zdC1tZXNvbi1wYWNrYWdlKSkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
