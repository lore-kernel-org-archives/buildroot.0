Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405BD107BCE6
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 23:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1151240F04;
	Fri, 13 Mar 2026 23:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id azubtdeDJapM; Fri, 13 Mar 2026 23:03:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B12E40EB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773442991;
	bh=JHxVSt8pl2sw4HUmLMNIXTnvYafIYRgzevIYVGwb3r0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cr7ZV9BEu6TOaNkKRkJUOd6HbZlnW/0N9UCC0F5aYzUgllL4aE8lLIGIyAB/2qxec
	 KmKOeOvg5DdMMiDNTxC80VIO5G2bvLJHR0zs6XOJYs4fhNUlGNHXn8SqR5Cn+rL3Nn
	 CkGmeu+WwCg4VaCSua1Z0SBS73MXkkn0Kt+3M2qVilsaCEFGYcA9gsvDjXxgHP1oE0
	 fSqJAzKWx7AP/3sGF3j0jYun+IAoXjL25dhSfaGO0fFicN64qXJZYemH2cyzwaQ5wQ
	 +PXjKnpmP7GyYtyIG8MGwehuR3mgI8YLs3KjrDtf/WG7ZnH6px5/sr/Ut+CR60kpBA
	 z4t3fHl7JLtQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B12E40EB0;
	Fri, 13 Mar 2026 23:03:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F5141B4
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 23:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2121340653
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 23:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haFJ0vCucRdy for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 23:03:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E130340649
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E130340649
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E130340649
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 23:03:08 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48529c325f0so19847545e9.0
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773442987; x=1774047787;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n5BUkEpkl1328dFCjKWt2GBYELjPhv6SkbL5XCd5RyY=;
 b=qDqvqB3s/J+qjcQjGr9cOoGj3ppC/fJiieqjEy+OiXnwjT/lfi8moz2Bswq5XRn11I
 tAzopHrtQkAxKFMYshr1sqpxTOsJj6NJkFvwZK160YxVCuO9saQJtp/I8/JhYJkglozI
 gnP96NpSQGp/3CSKxO6/oSiO7C9JyrJBV2r40l8dZi92TgWIkzgFyfzqag0apXMSBie8
 oxwiYG82ZcaW/Beet++DgT4jwikcRr6LmmhIfH3Sc8seKZ7ish5reKaXjcOK38xcd0pe
 LmmcPEpt3rylAsZcUX48/p1Wd6gVkYtmEKJZVJ8UcT2lLoacCmVXj+mFOP9RDxHQbvcc
 v02w==
X-Gm-Message-State: AOJu0YwXXG1VuWH2t34iGcka0L1iFmu+l5mxGbVM/4LlwjKYYFwyKJWV
 4Z7pxN11W4UvlzZA5OErDT4vGFPNV41ZQMUNft4y3eRQCxLiXHnKkqmkUZxHE/sfiZQ=
X-Gm-Gg: ATEYQzySuz19JMXv1uEVVx0uD3kshCs3KvEd+Qi+yQYzi1CFzb7YJHYkk6XoLIz2MFe
 55DZZK7wpIi0uAdwdxcYspF73YLM0/cjTjvg7Oin6d4MbsACcgNIDCnNKLaat9I8vQzpGsgd8c/
 Z3wTI0pFPc+9RacoMH/skPUD866zUwsvMYdP1vK+PMXcJOepP+Gq7UiWprcEf8W8810tKdysKO1
 fsmXk4Eb2AvyO3/yx2UM7QK2fVW3/27KUpn2lEpYz+JM4C6FZLC7uawqLvN0hJ+NmAs+d2tShHw
 sou6xuRQPnNRWKtn3CSsgiLfwrhJg6PyeBMGQkImsheIHRHIlcCvRiffxDVHd/5365S0Oo6nDnS
 cdn7DAbmEMTmoZaA0OMwzkkFaWYSZlM/1V5rwWSkYQbATOgOctFx5dhGSW1tGElq0o7k92lKpel
 dtBgc0JBbiArdZi3epJ5hPpEy5B9RYnK/8lr9ZsNlppfKrOAXYPTnBlv6S5q5/B9AgsKktYN1IY
 z0USwmBcRo93Ccbjll03iDSF68Fxd9kcfIKlri/LMak+MjRMplHaLNYWOWNTKeb+A==
X-Received: by 2002:a05:600c:1388:b0:485:3ee1:eba5 with SMTP id
 5b1f17b1804b1-4855670297amr81801805e9.27.1773442986518; 
 Fri, 13 Mar 2026 16:03:06 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b47145dsm238295145e9.0.2026.03.13.16.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 16:03:06 -0700 (PDT)
Message-ID: <ba01a67a-f635-4f71-b202-d567b99617b3@smile.fr>
Date: Sat, 14 Mar 2026 00:03:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <john.ernberg@actia.se>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Rustam Abdullaev <rustamabd@gmail.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Andreas Ziegler <br025@umbiko.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?M=C3=A5rten_Svanfeldt?= <marten.svanfeldt@actia.se>
References: <20251227211415.2269024-1-rustamabd@gmail.com>
 <20251227232420.1644a29f@windsurf>
 <5188f4ad-3451-4992-849f-c9ea92d23911@actia.se>
Content-Language: fr
In-Reply-To: <5188f4ad-3451-4992-849f-c9ea92d23911@actia.se>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773442987; x=1774047787; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n5BUkEpkl1328dFCjKWt2GBYELjPhv6SkbL5XCd5RyY=;
 b=kzMrP1NwzSPSRqCRKB1DT8nAGB0Q/jLQwHw5/UDbwlOlc1QP++iPdu3fMCdMLISxzA
 X2ECMpp812otfoRsxHz1LYD82d9odvMeRJCHhhlzQeOYPpT1VPirU28HfIA7hJAtuLcG
 mm/Z549mYPOX49OS+Xf4yp2C8Ci2FnW21l5Hg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=kzMrP1Nw
Subject: Re: [Buildroot] [PATCH v2 1/1] toolchain/toolchain-external:
 introduce BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS
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

SGVsbG8gSm9obiwgUnVzdGFtLCBBbGwsCgpMZSAwMi8wMi8yMDI2IMOgIDE0OjQxLCBKb2huIEVy
bmJlcmcgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IEhpIFRob21hcywgUnVzdGFtLAo+IAo+
IE9uIDEyLzI3LzI1IDExOjI0IFBNLCBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4+IEhlbGxvIFJ1c3RhbSwKPj4KPj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+Pgo+PiBP
biBTYXQsIDI3IERlYyAyMDI1IDIxOjE0OjE1ICswMDAwCj4+IFJ1c3RhbSBBYmR1bGxhZXYgPHJ1
c3RhbWFiZEBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+Pj4gSXQgaXMgaW1wb3J0YW50IHRvIGhhdmUg
bWF0Y2hpbmcga2VybmVsIGhlYWRlcnMgd2hlbiBidWlsZGluZyBwYWNrYWdlcwo+Pj4gdGhhdCBt
YWtlIHVzZSBvZiBrZXJuZWwgZmVhdHVyZXMgc3VjaCBhcyBzZWNjb21wLCBhcyB0aGV5IGRlcGVu
ZCBvbgo+Pj4gc3lzdGVtIGNhbGwgZGVmaW5pdGlvbnMgaW4gbGludXgvdW5pc3RkLmguIEEgdHlw
aWNhbCBleGFtcGxlIG9mIHRoaXMgaXMKPj4+IG9wZW5zc2ggLSBidWlsZGluZyBpdCB3aXRoIHRo
ZSBvZmZpY2lhbCBBUk0gR05VIHRvb2xjaGFpbiBhbmQga2VybmVsIDYueAo+Pj4gcmVzdWx0cyBp
biBhIG5vbi13b3JraW5nIHNzaGQuCj4+Cj4+IERvIHlvdSBoYXZlIG1vcmUgZGV0YWlscyBvbiB0
aGlzPyBXaGljaCB2ZXJzaW9uIG9mIHRoZSBBUk0gR05VCj4+IHRvb2xjaGFpbj8gV2hpY2gga2Vy
bmVsIGhlYWRlciB2ZXJzaW9uIGRvIHRoZXkgdXNlPyBXaGljaCBrZXJuZWwKPj4gdmVyc2lvbiBh
cmUgeW91IHJ1bm5pbmc/Cj4+Cj4+IEluZGVlZCwgdGhlcmUgYXJlIHR3byBjYXNlczoKPj4KPj4g
LSBUaGUga2VybmVsIGhlYWRlcnMgaW4gdGhlIHRvb2xjaGFpbiBhcmUgbmV3ZXIgdGhhbiB0aGUg
a2VybmVsIHlvdSdyZQo+PiAgICBydW5uaW5nID0+IHlvdSBhcmUgZG9pbmcgaXQgd3JvbmcsIGFu
ZCB1cGRhdGluZyB0aGUgaGVhZGVycyBpbiB0aGUKPj4gICAgdG9vbGNoYWluIGFyZSBub3QgZ29p
bmcgdG8gZml4IHRoZSBmYWN0IHRoYXQgeW91ciBDIGxpYnJhcnkgaXMgYnVpbHQKPj4gICAgd2l0
aCBoZWFkZXJzIHRoYXQgYXJlIHRvbyByZWNlbnQgZm9yIHlvdXIga2VybmVsIChldmVuIHRob3Vn
aCBJIGFkbWl0Cj4+ICAgIGdsaWJjIGhhcyBzb21lIHRvbGVyYW5jZSBvbiB0aGlzKQo+Pgo+PiAt
IFRoZSBrZXJuZWwgaGVhZGVycyBpbiB0aGUgdG9vbGNoYWluIGFyZSBvbGRlciB0aGFuIHRoZSBr
ZXJuZWwgeW91J3JlCj4+ICAgIHJ1bm5pbmcgYW5kIHlvdSdyZSBzZWVpbmcgYnJlYWthZ2UgPT4g
dGhpcyBpcyBhIGtlcm5lbCBidWcgYXMgaXQKPj4gICAgc2hvdWxkbid0IGhhcHBlbi4KPj4KPj4g
SW4gYm90aCBjYXNlcywgeW91ciBwcm9wb3NlZCBwYXRjaCBzaG91bGQgdGhlcmVmb3JlIG5vdCBi
ZSBuZWVkZWQuCj4+Cj4+IENvdWxkIHlvdSBjbGFyaWZ5IHdoaWNoIHNpdHVhdGlvbiB5b3UncmUg
aW4sIHNvIHRoYXQgd2UgY2FuCj4+IHVuZGVyc3RhbmQgYmV0dGVyIHdoZXRoZXIgdGhlIHVzZS1j
YXNlL2lzc3VlIHlvdSdyZSBoYXZpbmcgd2FycmFudHMKPj4gdGhpcyBhZGRpdGlvbmFsIGNvbXBs
ZXhpdHk/Cj4+Cj4+PiBDdXJyZW50bHkgcmVzdHJpY3RlZCB0byBnbGliYy1iYXNlZCB0b29sY2hh
aW5zIGFzIGdsaWJjIGlzIGJhY2t3YXJkLSBhbmQKPj4+IGZvcndhcmQtY29tcGF0aWJsZSB3aXRo
IGRpZmZlcmVudCBrZXJuZWwgdmVyc2lvbnMgd2hpbGUgdUNsaWJjIGFuZCBtdXNsCj4+PiBhcmUg
bm90Lgo+Pgo+PiBOb3Qgc3VyZSB3aHkgdGhpcyBtYXR0ZXJzIGhlcmUgdGhvdWdoLiBDb3VsZCB5
b3UgY2xhcmlmeT8KPiAKPiBXZSByYW4gaW50byB0aGUgc2FtZSBpc3N1ZSB3aXRoIHRoZSBwcmUt
Y29tcGlsZWQgdG9vbGNoYWluIGZyb20gQVJNLgo+IFdlIG5lZWRlZCB0aGUgQ0FOIEoxOTM5IHNv
Y2tldCBzdXBwb3J0IGluIHB5dGhvbiwgYW5kIHB5dGhvbiBlbmFibGVzIAo+IHRoaXMgYmFzZWQg
b24gdGVzdHMgZG9uZSBvbiB0aGUgaW5zdGFsbGVkIGtlcm5lbCBoZWFkZXJzLgo+IAo+IFNpbmNl
IHRoZSBKMTkzOSBzdXBwb3J0IGxhbmRlZCBhZnRlciBMaW51eCA0LjIwIHdlIGVuZGVkIHVwIHNw
ZW5kaW5nIAo+IHNvbWUgaG91cnMgZmlndXJpbmcgb3V0IGhvdyBweXRob24gZW5hYmxlZCB0aGUg
Q0FOIEoxOTM5IHNvY2tldCBzdXBwb3J0Lgo+IAo+IEhhdmluZyB0aGUgYWJpbGl0eSB0byB1c2Ug
a2VybmVsIGhlYWRlcnMgZnJvbSB0aGUgc2VsZWN0ZWQga2VybmVsIHdvdWxkIAo+IGFsbGV2aWF0
ZSBzdWNoIHByb2JsZW1zIHdoZXJlIHRoZSBwcm9qZWN0IGRlcGVuZHMgb24gdGhlIGluc3RhbGxl
ZCAKPiBrZXJuZWwgaGVhZGVycyB0byBlbmFibGUgLyBkaXNhYmxlIGZlYXR1cmVzLgo+IAo+IFVu
bGVzcyB0aGUgcHl0aG9uIHBhY2thZ2UgaXMgYnJva2VuIGluc3RlYWQgYW5kIHNob3VsZCBidW5k
bGUgdGhlIAo+IG5lY2Vzc2FyeSBoZWFkZXJzIHJhdGhlciB0aGFuIGRlcGVuZGluZyBvbiB0aGVt
IGJlaW5nIHByb3ZpZGVkIGJ5IHRoZSAKPiB0b29sY2hhaW4/CgpJdCByZW1pbmRzIG1lIHRoZSBp
c3N1ZSB3aXRoIG9wZW5zc2ggd2l0aCB0aGUgQVJNIHRvb2xjaGFpbnM6CgoiVGVzdE9wZW5Tc2gg
bmVlZHMgYSB0b29sY2hhaW4gPj0gNS54IGR1ZSB0byBhIG9wZW5zc2ggaXNzdWUKKFNpbWlsYXIg
dG86IGh0dHBzOi8vYnVncy5idXN5Ym94Lm5ldC9zaG93X2J1Zy5jZ2k/aWQ9MTM2NzEpClVzZSB0
aGUgQm9vdGxpbiB0b29sY2hhaW4gYmxlZWRpbmctZWRnZSAyMDIyLjA4LTEgcmhhdCBwcm92aWRl
Cmtlcm5lbCBoZWFkZXJzIDUuNCIKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1
aWxkcm9vdC8tL2NvbW1pdC9mODlmNTIxNjhmY2I2NjdhM2U4ZTQzZjZmNDRkNWIxY2EzOTYxYThj
CgpDYW4geW91IHRyeSB3aXRoIHRoaXMgbmV3ZXIgQVJNIHRvb2xjaGFpbiB0aGF0IHVzZXMgNi42
IGxpbnV4LWhlYWRlcnM/CgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVp
bGRyb290L2xpc3QvP3Nlcmllcz00OTU1NjcKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBC
ZXN0IHJlZ2FyZHMgLy8gSm9obiBFcm5iZXJnCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
