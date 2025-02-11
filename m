Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10BFC0219B
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 17:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E333A81127;
	Tue, 11 Feb 2025 17:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwDuqEOMmYpw; Tue, 11 Feb 2025 17:58:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94CA981130
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94CA981130;
	Tue, 11 Feb 2025 17:58:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CD0A6C
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CA536067D
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zcv9I9Lc-oYP for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 17:58:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A64D6605D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A64D6605D4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A64D6605D4
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:58:26 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43957634473so2616555e9.0
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 09:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739296704; x=1739901504;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JEachvLyUP5ehHD6l5xvjnWUEtl4QhAmI4TJb05qWko=;
 b=DKzBN4VRe4AckrvqEEnUDBdkbLjAN/jvbFRKYaGivceNaVHDKo7mc2XxVVjVoghAbD
 9sVd3s/fDq0jV2fmoipw4ar/+/I3DUBKkHrwjyBSO83CTVmvYT/4rcG68gJUjMI8l1Pl
 lWoYHoNbc3HPNVjBOcvAY8OS8tZ/Qv/EijgmtyABvxNPYT7qcYl6/2l3WCp/3rb3eVuj
 bC+CSUjTi1Q/QYBr4Xk28MZWkH1jGjCMy2y/n4bV9bwILRPXoORQwbcooL32peuQlQcm
 uojwkJ9uyJsFWf4UB1kKEaJM9Aqmuplk9vRQqawl1QibzxM0fc/HvJZtNahqzbNA3Ox5
 TZNw==
X-Gm-Message-State: AOJu0YwBzBtkFlUimevKSwqxOobReyURAGzYIqvkx+UgE5FIvrFhDiej
 CaYcaP7RTymqQaRywn2uTnRU1MYIwrNG5HXhQDxB+qomR5VfG6X+lvR444xLDnkmq/nSBeqQZoE
 F
X-Gm-Gg: ASbGnctR6kKgkSb20nGu8/9IGmyWgwPRS0z9duVy7ld5ffnxDqDaVQVn/co0QBT68oT
 H3zZCEDqhycoWPds7Ap50IS1l2E4I9tat8amGlRZ5xPL7CRXZnpH8Rl3BNn48E9RbCOP2MG8X6v
 eJ09/KsIhpACkHo9vOqCmLhdODQtxga4uwqw3PU2dvuPorWzijxdPR1po9wHbylMF2uQnVI9IJu
 d7sYbST/vOIO/DPjromuBTge+qtPpaXsayVCs8d/N1d5rjb0FXdK/RlFGalCZO+jOfw6AvxpWu0
 udK09EQMLAbB76yFPwSfgpPbGlwZh1DmgYVrZwld4tcykWb7dWpCPf5U6I5JAqXO6C9qpmBgsMJ
 /Yz9WTL/mW4H31LwuPUSI1eDojxvKK6YZGZFcEs5wfC7kNSrWGpE=
X-Google-Smtp-Source: AGHT+IGsq/QsDhENdpH8dE7EnvXCN+i3a1f32cI3NC0TKIgmrx13bvtN3qEwIPyhq9wYyUy3SPZnGw==
X-Received: by 2002:a05:600c:1552:b0:439:4589:1ab0 with SMTP id
 5b1f17b1804b1-43958176af3mr2117035e9.13.1739296704539; 
 Tue, 11 Feb 2025 09:58:24 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd2e0765esm10205261f8f.82.2025.02.11.09.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 09:58:24 -0800 (PST)
Message-ID: <e508e642-3942-47e8-9ff2-a23f16d9d706@smile.fr>
Date: Tue, 11 Feb 2025 18:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, Han Gao <rabenda.cn@gmail.com>
Cc: buildroot@buildroot.org, Drew Fustini <dfustini@tenstorrent.com>,
 Drew Fustini <drew@beagleboard.org>, robertcnelson@beagleboard.org,
 jkridner@beagleboard.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250101205435.1513140-1-kilian.zinnecker@mail.de>
 <10590208.nUPlyArG6x@kilian-laptop>
 <CAAT7Ki9Y3ZfcbnQnYytgUon6iY8P8o6o2YXCXOeTw++gsoHJUg@mail.gmail.com>
 <3335914.44csPzL39Z@kilian-laptop>
Content-Language: fr
In-Reply-To: <3335914.44csPzL39Z@kilian-laptop>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739296704; x=1739901504; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JEachvLyUP5ehHD6l5xvjnWUEtl4QhAmI4TJb05qWko=;
 b=0VEpIczrxpXn4F0OmO1qRB2STlpW1CNDqoq6YLDFVzat51fSVOsiF3OY2sR2bngWjH
 DrYaS9rT+x2rmFT5HiFsq9H72okUFSujtwntdIqmkUfsgyRQ77NToz0xjZoju+GWMalO
 Ef4bYKz1gxD8s5ZUnAgzDLc/Shp2E8VvLfBfQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=0VEpIczr
Subject: Re: [Buildroot] [PATCH v6 0/2] Add board support for the
 BeagleV-Ahead
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

SGVsbG8gS2lsaWFuLCBBbGwsCgpMZSAwNy8wMS8yMDI1IMOgIDIyOjIyLCBLaWxpYW4gWmlubmVj
a2VyIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBIaSBIYW4sCj4gCj4gWy0tU05JUC0tXQo+
IAo+Pj4gRnVydGhlcm1vcmUsIHRoZXJlIGlzIG5vdyBhIHJlcG8sIGNvbnRhaW5pbmcgdGhlICJY
dWFudGllLWJpbnMiLCB3aGljaCBoYXMKPj4+IGEgTElDRU5TRSBmaWxlIGluIGl0WzFdISBJIHN3
aXRjaGVkIHRvIHVzaW5nIHRoYXQgcmVwb3NpdG9yeS4gQXMgaXQgaXMgYQo+Pj4gY291cGxlIG9m
IDEwME1CcyBsYXJnZSwgSSBjaGFuZ2VkIHRoZSBwYWNrYWdlIG1ha2VmaWxlIHRvIG9ubHkgZmV0
Y2ggdGhlCj4+PiBuZWVkZWQgYmluYXJpZXMgYW5kIHRoZSBMSUNFTlNFIGZpbGUuIEhlbmNlLCBJ
IHByZXBhcmVkIGEgN3RoIGl0ZXJhcnRpb24KPj4+IG9mIHRoZSBib2FyZC4KPj4gUmVnYXJkaW5n
IHRoZSBsaWNlbnNlIG9mIHh1YW50aWUtYmluWzFdLCB0aGUgeHVhbnRpZSB0ZWFtIHRoaW5rcyBp
dAo+PiBzaG91bGQgYmUgcmVsZWFzZWQgdW5kZXIgdGhlIGFwYWNoZSBsaWNlbnNlLCBidXQgSSBk
b3VidCBpZiB0aGlzCj4+IGFwcGxpZXMgdG8gYmluYXJ5IGZpbGVzPwo+IAo+IEkgYW0gbm90IHN1
cmUsIGJ1dCBJIGFzc3VtZWQgdGhlIEFwYWNoZSBMaWNlbnNlIGNvdWxkIGFsc28gY292ZXIgYmlu
YXJpZXMsIAo+IGkuZS4sIHN1Y2ggdGhhdCB0aGV5IG1heSBiZSByZWRpc3RyaWJ1dGVkPyBDYW4g
c29tZW9uZSBzaGVkIGEgYml0IGxpZ2h0IG9uIAo+IHRoaXM/CgpJZiB1bnN1cmUsIHVzZSBYVUFO
VElFX0JJTlNfUkVESVNUUklCVVRFID0gTk8gbGlrZSBmb3IgdGhlIGFtbG9naWMtYm9vdC1maXAK
cGFja2FnZSBbMV0KCkl0IHNlZW1zIHdlIGhhdmUgbG9zdCB0aGUgcHJvdmVuYW5jZSBvZiB0aGlz
IGJpbmFyeSAod2hvIGJ1aWx0IGl0KS4gVGhlIHh1YW50aWUKcHJvamVjdCB1c2VzIGFuIGFwYWNo
ZSBsaWNlbnNlIGFuZCB0aGUgRGViaWFuIGltYWdlIGZyb20gQmVhZ2xlYm9hcmQgcHJvamVjdApw
cm92aWRlIGl0cyBvd24gdmVyc2lvbi4KCnh1YW50aWUteW9jdG8gZGVwbG95IHRoZXNlcyBiaW5h
cmllcyBibG9iIChsaWdodF9hb25fZnBnYS5iaW4gYW5kIG1hbnkgbW9yZSkKZnJvbSBhIGNsb3Nl
ZCBzb3VyY2UgcGFja2FnZSBbMl0uCgpLaWxpYW4sIGNhbiB5b3UgdHJ5IHRvIGFzayBvbiB0aGUg
WHVhdGllIGdpdGh1Yj8KClsxXQpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9ibG9iL21hc3Rlci9wYWNrYWdlL2FtbG9naWMtYm9vdC1maXAvYW1sb2dpYy1ib290
LWZpcC5taz9yZWZfdHlwZT1oZWFkcyNMMTEKWzJdCmh0dHBzOi8vZ2l0aHViLmNvbS9YVUFOVElF
LVJWL3h1YW50aWUteW9jdG8vYmxvYi9tYXN0ZXIvbWV0YS1saWdodC9yZWNpcGVzLWJzcC9vcGVu
c2JpL29wZW5zYmlfMC45LmJiI0wyCgo+IAo+PiBGb3IgYW5vdGhlciBiaW5hcnksIHBsZWFzZSBk
byBub3QgdXNlIHRoZSB2ZXJzaW9uIGZyb20gdGhlCj4+IHh1YW50aWUteW9jdG8gcmVwb3NpdG9y
eS4gVGhpcyBpcyB2MC45LjUgU0RLLgo+PiBUaGUgcmV2eW9zIHJlcG9zaXRvcnkgaGFzIHJlbGVh
c2VkIHYyLjAuMiBTREssIHdoaWNoIG5lZWRzIHRvIGJlIHVzZWQKPj4gaW4gY29uanVuY3Rpb24g
d2l0aCBpdC4KPj4KPj4gVGhlIGJlaGF2aW9yIG9mIHRoZSBhb24gaGFzIGJlZW4gbW9kaWZpZWQg
aW4gdGhlIFNESyAxLjQuMCB2ZXJzaW9uIHVwZGF0ZS4KPiAKPiBUaGFua3MgZm9yIHRoZSBpbmZv
cm1hdGlvbiEgRG8geW91IHJlZmVyIHRvIHRoZSBiaW5hcmllcyBpbiB0aGlzIHJlcG9zaXRvcnks
IAo+IGhlcmU6Cj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL3Jldnlvcy90aDE1MjAtYm9vdC1maXJt
d2FyZS90cmVlL21hc3Rlci9hZGRvbnMvYm9vdAo+IAo+IEkgY291bGQgc3dpdGNoIHRvIHVzaW5n
IHRob3NlLCBidXQgYWdhaW4sIEkgd291bGQgbmVlZCBzb21lIGluZm9ybWF0aW9uIGFib3V0IAo+
IHRoZSBsaWNlbnNlIG9mIHRoZXNlIGJpbmFyaWVzIGluc2lkZSB0aGUgcmVwb3NpdG9yeSwgZS5n
LiwgdmlhIGEgTElDRU5TRSBmaWxlLiAKPiBJdCBpcyBpbXBvcnRhbnQsIHRoYXQgcGVvcGxlIGFy
ZSBhbGxvd2VkIHRvIHVzZSB0aGUgYmluYXJpZXMgYW5kIHJlZGlzdHJpYnV0ZSAKPiBpbWFnZXMg
Y29udGFpbmluZyB0aGVtLiBXb3VsZCBpdCBiZSBwb3NzaWJsZSwgdGhhdCBhIGxpY2Vuc2UgaXMg
YWRkZWQ/IEUuZy4sIAo+IFJvY2tjaGlwIGFkZGVkIHRoaXMgbGljZW5zZSB0byBhIHJlcG9zaXRv
cnksIHdoaWNoIGNvbnRhaW5zIGJpbmFyeSBibG9icyBmb3IgCj4gdGhlaXIgU29DczoKPiAKPiBo
dHRwczovL2dpdGh1Yi5jb20vcm9ja2NoaXAtbGludXgvcmtiaW4vYmxvYi9tYXN0ZXIvTElDRU5T
RQo+IAo+Pj4gSG93ZXZlciwgSSBoYXZlIGZ1cnRoZXIgcXVlc3Rpb25zLCBJIHdhbnRlZCB0byBh
c2sgYmVmb3JlIHNlbmRpbmcgYSB2NzoKPj4+IFRoZXJlIGV4aXN0IHZ1bG5lcmFiaWxpdGllcyBy
ZXBvcnRlZCBmb3IgdGhlIGJvYXJkJ3MgU29DLCBlLmcuLAo+Pj4gIkdob3N0d3JpdGUiWzJdLiBI
b3cgd291bGQgYmUgYSBwcm9wZXIgd2F5IHRvIGRlYWwgd2l0aCBzdWNoIGlzc3Vlcz8KPj4+IFNw
ZWNpZmljYWxseSByZWdhcmRpbmcgR2hvc3R3cml0ZSB0aGUgYXV0aG9ycyBzYXksIHRoYXQgdG8g
bWl0aWdhdGUgb25lCj4+PiB3b3VsZCBoYXZlIHRvIGRpc2FibGUgdGhlIFNvQ3MgdmVjdG9yIGV4
dGVuc2lvbi4gSG93ZXZlciwgdGhlIG9ubHkgd2F5IEkKPj4+IGFtIGN1cnJlbnRseSBhd2FyZSB0
byBkbyB0aGF0IGlzIHRvIGRpc2FibGUgdGhlIFNvQydzIHZlbmRvciBleHRlbnNpb25zCj4+PiBh
bGwgdG9naGV0aGVyICh1c2luZyB0aGUgInRoZWFkaXNhZWUiIGJpdCBpbiB0aGUgIm14c3RhdHVz
IiByZWdpc3RlcikuIElmCj4+PiBJIGRvIHNvLCBJIGRvIGdldCBhIGtlcm5lbCBvb3BzIHVwb24g
Ym9vdGluZywgYXMgdGhlIGtlcm5lbCBpcyBleGVjdXRpbmcKPj4+IHNvbWUgdmVuZG9yIHNwZWNp
ZmljIGluc3RydWN0aW9ucy4gSXMgdGhlcmUgYSBwcm9wZXIgd2F5IHRvIGRpc2FibGUgdGhlCj4+
PiB1c2Ugb2YgdGhlIHZlbmRvciBzcGVjaWZpYyBpbnN0cnVjdGlvbnMgYnkgdGhlIGtlcm5lbCwg
d2hpY2ggZG9lcyBub3QKPj4+IGludHJvZHVjZSBvdGhlciBpc3N1ZXM/IE9yIGFsdGVybmF0aXZl
bHkgd291bGQgaXQgYmUgb2sgdG8gb25seSBtZW50aW9uCj4+PiB0aGUgdnVsbmVyYWJpbGl0eSBp
biB0aGUgYm9hcmQncyByZWFkbWUsIChvZmMuIGluY2x1ZGluZyBsaW5rcyBhbmQgQ1ZFcyksCj4+
PiBzdGF0aW5nIHRoYXQgdGhlIGJvYXJkIHN1cHBvcnQgZG9lcyBub3QgZml4IHRoZXNlcyBpc3N1
ZXM/Cj4+Pgo+Pj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9YVUFOVElFLVJWL3h1YW50aWUteW9j
dG8KPj4+IFsyXSBodHRwczovL2dob3N0d3JpdGVhdHRhY2suY29tLwo+Pj4gWzNdCj4+PiBodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMi42L3NvdXJjZS9hcmNoL3Jpc2N2L2Vy
cmF0YS90aGVhZC8KPj4+IGVycmF0YS5jCj4+Cj4+IFRoZSBtYWlubGluZSBrZXJuZWwgZG9lcyBu
b3Qgc3VwcG9ydCB4dGhlYWR2ZWN0b3IgeWV0LCBzbyBpdCBpcyBub3QKPj4gYWZmZWN0ZWQgYnkg
R2hvc3R3cml0ZS4KPj4gSSB0aGluayB0aGUgd2F5IHRvIHR1cm4gaXQgb2ZmIGlzIHRvIGRlbGV0
ZSB0aGUgeHRoZWFkdmVjdG9yCj4+IGRlc2NyaXB0aW9uIGluIHRoZSBkdHMsIGJ1dCBpdCBkb2Vz
bid0IGV4aXN0IG5vdywgc28gZG9uJ3Qgd29ycnkgYWJvdXQKPj4gaXQuCj4gCj4gRnJvbSBteSB1
bmRlcnN0YW5kaW5nIG9mICJHaG9zdHdyaXRlIiwgaXQgaXMgbm90IHN1ZmZpY2llbnQsIHRoYXQg
dGhlIGtlcm5lbCAKPiBkb2VzIG5vdCBzdXBwb3J0IGFueSB4dGhlYWR2ZWN0b3IgaW5zdHJ1Y3Rp
b25zOiBGcm9tIG15IHVuZGVyc3RhbmRpbmcsIGFzIGxvbmcgCj4gYXMgdGhlIHh0aGVhZHZlY3Rv
ciBleHRlbnNpb24gaXMgYWN0aXZhdGVkLCBhbnkgdXNlcnNwYWNlIHByb2dyYW0gY291bGQgCj4g
ZXhlY3V0ZSB4dGhlYWR2ZWN0b3IgaW5zdHJ1Y3Rpb25zLCBpbmNsdWRpbmcgdGhlIG9uZXMsIHdo
aWNoIG1heSBiZSBtaXNzdXNlZCAKPiBmb3IgYSBwcml2aWxlZ2UgZXNjYWxhdGlvbi4gSGVuY2Ug
SSB0aGluayB0aGF0IGFzIGEgbWl0aWdhdGlvbiB0aGUgCj4geHRoZWFkdmVjdG9yIHdvdWxkIGFj
dHVhbGx5IGhhdmUgdG8gYmUgZGlzYWJsZWQsIGUuZy4sIGlmIHBvc3NpYmxlIGJ5IHNldHRpbmcg
Cj4gcHJvcGVyIGNvbmZpZ3VyYXRpb24gYml0cy4gSSBhdHRlbXB0ZWQgdGhhdCwgYnV0IHNvIGZh
ciBJIGNvdWxkIG9ubHkgaWRlbnRpZnkgYSAKPiBjb25maWd1cmF0aW9uIGJpdCwgd2hpY2ggZGlz
YWJsZXMgYWxsIHZlbmRvciBleHRlbnNpb24gaW5zdHJ1Y3Rpb25zIGFsbCAKPiB0b2doZXRoZXI6
ICJ0aGVhZGlzYWVlIi4gSWYgSSBkaXNhYmxlIGFsbCB2ZW5kb3IgZXh0ZW5zaW9uIGluc3RydWN0
aW9ucywgSSBnZXQgCj4gYSBrZXJuZWwgb29wcywgYmVjYXVzZSB0aGUga2VybmVsIGlzIGV4ZWN1
dGluZyBzb21lIHZlbmRvciBleHRlbnNpb24gCj4gaW5zdHJ1Y3Rpb25zWzFdIC0gbm90IGZyb20g
eHRoZWFkdmVjdG9yLCBidXQgZS5nLiwgZnJvbSB4dGhlYWRjbW8uIFNvIEkgYW0gbm90IAo+IHN1
cmUgaG93IHRvIGRlYWwgd2l0aCB0aGF0LiBFaXRoZXIsIHRoZXJlIGlzIHNvbWUgY29uZmlndXJh
dGlvbiBiaXQsIHdoaWNoIGNhbiAKPiBwcmVjaXNlbHkgb25seSBkaXNhYmxlIHRoZSB4dGhlYWR2
ZWN0b3IgZXh0ZW5zaW9uIGFsb25lLiBPciBtYXliZSBvbmUgY2FuIAo+IGNvbmZpZ3VyZS9wYXRj
aCB0aGUga2VybmVsIHRvIG5vdCB1c2UgYW55IHZlbmRvciBleHRlbnNpb24gaW5zdHJ1Y3Rpb24s
IHdpdGhvdXQgCj4gaW50cm9kdWNpbmcgb3RoZXIgaXNzdWVzLiBPciBlbHNlIEkgcHV0IGEgbm90
aWNlIGludG8gdGhlIGJvYXJkcyByZWFkbWUsIHRoYXQgCj4gdGhlIGJvYXJkIHN1cHBvcnQgbWF5
IGJlIHN1c2NlcHRpYmxlIHRvICJHaG9zdHdyaXRlIiwgaWYgdGhhdCBpcyBhY2NlcHRhYmxlIAo+
IGZvciBhIGJvYXJkIHN1cHBvcnQgaW4gYnVpbGRyb290PyBBbnkgaGVscCwgaG93IEkgY2FuIGFu
ZCBzaG91bGQgZGVhbCB3aXRoIHRoZSAKPiBpc3N1ZSBhcHByZWNpYXRlZCEKCkluIEJ1aWxkcm9v
dCB3ZSBjYW4ndCB0cmFjayBpZiBhbiBoYXJ3YXJlIG1pdGlnYXRpb24gaGFzIGJlZW4gZW5hYmxl
ZCBvciBub3QuCkl0IHdvdWxkIGJlIHRoZSBzYW1lIGlzc3VlIGZvciBTcGVjdHJlIFYxL1YyIGV0
Yz8KCkF0IGxlYXN0LCB0aGlzIHRvcGljIGRlc2V2ZSB0byBiZSBhZGRlZCBpbnRvIHRoZSBjb21t
aXQgbG9nIGFuZCBwcm9iYWJseSBpbnRvCnRoZSBib2FyZCByZWFkbWUudHh0IHRvby4KCkJ1aWxy
b290IGRlZmNvbmZpZyBhcmUgcHJvdmlkZWQgYXMgdGhlIG1pbmltYWwgY29uZmlndXJhdGlvbiB0
byBib290IHRoZSBib2FyZCwKbm90IHRvIHByb2R1Y2UgYSBmaW5hbC9jdXN0b21lciBpbWFnZS4K
CllvdSBjYW4gYWRkIGEgbm90ZSBmb3IgdGhlIHVzZXIgYWJvdXQgdGhlICJHaG9zdHdyaXRlIiBp
c3N1ZT8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBUaGFua3MgYW5kIGJlc3QgcmVnYXJk
cywKPiBLaWxpYW4KPiAKPiBbMV0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYu
MTIuNi9zb3VyY2UvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvCj4gZXJyYXRhLmMKPiAKPiAKPiAK
PiAKPiAKPiAKPiAKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
