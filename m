Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8E2C5AD4E
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 09:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52CE740577;
	Mon, 10 Aug 2026 09:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MULlXn0W_jmf; Mon, 10 Aug 2026 09:52:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29CE44057B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786355532;
	bh=VrpIqGlzzAAjNYoqo2ozPRuyWvfh8MeglkvXX9KCQ+k=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PMQ8XQ77ewiEVvd+lkryMigV2Ik5e6aXt6PQXqhCZkzOLXq5zWPfZJXFD7Ze83vX1
	 ZP0zeCHT5P0YVP8jRgg1UqEUN/6hQHVNmEAZ7jwlmICw4zWM6Jq0P8+UYjuDPkTitF
	 yoSijblP2qt99cmuBpB7xd1XAq1vnepk5qQ8c0hnPGx19eA2X+OCtwEB5QhB555ICR
	 +2sdsfBppXddUWb5wn36lyFgDQ4UfQf0vGp9tmeg7/rG/InAhrt7gVUEOJr/SOObzt
	 VcjLzG8FwjW/j1HCkyPaqSvqdIFiOtMLhXIqQvxDhkOyJzBptnzfHopH5gaSMT1QqK
	 wizyPr3fmGpRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29CE44057B;
	Mon, 10 Aug 2026 09:52:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76677259
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 09:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 651EB80C9A
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 09:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ylvBbJScbmae for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 09:52:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4DFA280CB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DFA280CB8
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DFA280CB8
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 09:52:10 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-481412f1828so223842f8f.1
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 02:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786355528; x=1786960328;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YI+kTi5E9P2V+eQGeTU9h8L5FRPbdxbhYidelMSnSG0=;
 b=mdsARoCojKHcsMWDpuQKO0b4YpxGePOQtWvSU6jKUeN20110aNLJpLaOhV8y1aEcyK
 9OUl5DNNqfDtz5Z3d1aAwZIyv5qvQwgV+fdG5iqTo9Qvs7zDIAiq0CY6i2STUwaEpVb3
 IIhaj6I/Hxn0bMjXDJclNrJmLlvEvSLLxPshDpVyCFa2V0vmDIf6klN2qisAeF+31JnJ
 0kQT4yA3iIFicmDRGH3VuVzSqhbsEGJ0L/d7gdTQl0NCMp1XDGlg0yljD1Hs+9CRnhba
 F+jEiYK6CP5R7DXWQlV41vlZDCJt3Fxd49GW2+9QhGLJB5kXFy6V/v07ts2kDOTFnEy4
 MNvQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqqUtYoSW7pXQU/ML0OVyhm+cFLJAXtVfiqDOVj09yIBQ+TuQkaB6IYlR2VDCQxxCNcX12cRy4VJcc=@buildroot.org
X-Gm-Message-State: AOJu0Yw8keM9Iaw0lQ2TBpalR6iHEnDOViEUGKJfHR/GRlIxanKOSXV+
 It0gZAv90o+egUa2vBTveVC+YFe94c1tolkvSj2G5/hczv7Xw12/C4Cp
X-Gm-Gg: AR+sD1108bMZLqs1vM4MIi8vhoSenZprQGzwbqnqF/XNaCdt34cw14jDHnsw0BsZqdR
 e5pU8dPYDv2HOXl+cq2gwhQVtWh14ZFJBDRmHYwi2tRf8exh71E6jq+WqtvSxWDQNb57HzfqVh3
 5rnaZ4SVPdT2/jg1riJK1echjMYDX4xl+jyQL5PPkf0y13SWh6eRUDB39sxHiX8cxZD4sBAEGqF
 dw6NX4YM3J1cBIaffVorm6be3mvSiSRE2t1184gGf6+mSnDxo0m9j1iZeQlzLZ9dDiWtBURqAxd
 B9L5LbBTXtMot0rk2DNab6QXsKqCqrUcUSq0yICoFVG5claSi7oPChy73lo8tlXdRUYiYS1KjH+
 IEdQi2Ui9Q5Pxy9Aejl5X/X8DdmBm/23Ej0tE3y9en3K1kRNRqw8374Co3K5a/y7UtdSI2mvPNZ
 XSGtKMqfOQ05mD6nqp9gpNQtTKrlnDWXwgCF/HNbd41lF25IzptUwtCPQpak3DO8WGNTEFkbMm1
 y+LueSJJFCE4JWg7y6i7RHaOzQlmfA5Qtcb
X-Received: by 2002:a05:6000:298e:20b0:47f:7c4c:8144 with SMTP id
 ffacd0b85a97d-48130e9564fmr17318194f8f.10.1786355527956; 
 Mon, 10 Aug 2026 02:52:07 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:f99c:d6cf:27e6:2b03?
 ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480020be8f3sm31261076f8f.0.2026.08.10.02.52.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2026 02:52:07 -0700 (PDT)
Message-ID: <6db03f79-b74a-4c8e-88f7-72d324ab4cde@gmail.com>
Date: Mon, 10 Aug 2026 11:51:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alsey Coleman Miller <alseycmiller@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Zwing?= <nerv@dawncrow.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260809201403.3855903-1-alseycmiller@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20260809201403.3855903-1-alseycmiller@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786355528; x=1786960328; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=YI+kTi5E9P2V+eQGeTU9h8L5FRPbdxbhYidelMSnSG0=;
 b=V9yWf/75ekIus/lv7hnE8SLf36FIdYpP4r17TNVcuwIMQ0vduPlg9bYLOYlfN8EknP
 ymFtlhsJh2cylvRkDNaWEeutJxIwWsBrVA2dpI1wZWHw1J3TALYknVBNeMoUIROqTO5Y
 h53jNndsnfq4giMHsyO4RZSgHtoz5nmOgxbQuZuw/sqnTEW/laZFGGiTdPjT7CX0neY3
 seMusBzcpGlOmyzR5i3XVYLKaP+K3+aNswqs9mvszw2NA855iGYxC+LfojYhPIGzavEr
 IZyJQRjZTnFqlpvhxrHC9NnmxuIoLMeq6517UGXZSUjh/uafGzUKhxp/riZHa6ZXbCCg
 rdtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=V9yWf/75
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libxkbcommon: build
 libxkbregistry when libxml2 is available
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpGb3IgaW5mb3JtYXRpb24sIEkndmUgcHJvdmlkZWQgYSBzaW1pbGFyIGZpeCBoZXJlOgpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyNjA1MjctbWFzdGVyLXYxLTEtMGQ5
NzVmM2IzZjBkQGdtYWlsLmNvbS8gCmVhcmxpZXIgdGhpcyBzdW1tZXIuCgpSb21haW4gc3RhdGVk
IHRoYXQgeGticmVnaXN0cnkgaGFkIGJlZW4gZGlzYWJsZWQgb24gcHVycG9zZVsxXSBhbmQgdG8g
CndoaWNoIG15IHF1ZXN0aW9uIGhhcyByZW1haW5lZCB1bmFuc3dlcmVkIGluIHRoaXMgdGltZSBv
ZiBob2xpZGF5cy4KCkJlc3QgcmVnYXJkcywKUmFwaGHDq2wKClsxXSAKaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYnVpbGRyb290L2NiZmI5NDk1LTM1ZDItNDQ3ZS1hOWUxLTIyYzgzNGQwN2RjNUBz
bWlsZS5mci8gCgoKTGUgMDkvMDgvMjAyNiDDoCAyMjoxNCwgQWxzZXkgQ29sZW1hbiBNaWxsZXIg
YSDDqWNyaXTCoDoKPiBsaWJ4a2JyZWdpc3RyeSBpcyB0aGUga2V5Ym9hcmQgbGF5b3V0IGNhdGFs
b2d1ZSBoYWxmIG9mIHRoZSBsaWJyYXJ5LiBJdAo+IHBhcnNlcyB0aGUgWE1MIGxheW91dCByZWdp
c3RyeSBhbmQgc28gbmVlZHMgbGlieG1sMiwgd2hpY2ggaXMgcHJlc3VtYWJseQo+IHdoeSBpdCB3
YXMgZGlzYWJsZWQgdW5jb25kaXRpb25hbGx5IHJhdGhlciB0aGFuIHdpcmVkIHRvIGEgZGVwZW5k
ZW5jeS4KPiAKPiB3aW5lIG5lZWRzIGl0LiBJdHMgY29uZmlndXJlLmFjIHJlcXVpcmVzIFhLQlJF
R0lTVFJZX0xJQlMgYWxvbmdzaWRlCj4gd2F5bGFuZC1jbGllbnQsIHdheWxhbmQtc2Nhbm5lciwg
eGtiY29tbW9uIGFuZCBsaW51eC9pbnB1dC5oIGJlZm9yZSBpdAo+IHdpbGwgYnVpbGQgdGhlIFdh
eWxhbmQgZHJpdmVyLCBhbmQgd2luZS5tayBwYXNzZXMgLS13aXRoLXdheWxhbmQgZm9yIGFueQo+
IGJ1aWxkIHdpdGggQlIyX1BBQ0tBR0VfV0FZTEFORCAtIHdoaWNoIHR1cm5zIHRoYXQgbm90aWNl
IGludG8gYSBoYXJkCj4gZXJyb3I6Cj4gCj4gICAgY2hlY2tpbmcgZm9yIHdheWxhbmQtY2xpZW50
LmguLi4geWVzCj4gICAgY2hlY2tpbmcgZm9yIHdsX2Rpc3BsYXlfY29ubmVjdCBpbiAtbHdheWxh
bmQtY2xpZW50Li4uIHllcwo+ICAgIGNoZWNraW5nIGZvciB3YXlsYW5kLXNjYW5uZXIuLi4gLi4u
L2hvc3QvYmluL3dheWxhbmQtc2Nhbm5lcgo+ICAgIGNoZWNraW5nIGZvciB4a2JfY29udGV4dF9u
ZXcgaW4gLWx4a2Jjb21tb24uLi4geWVzCj4gICAgY2hlY2tpbmcgZm9yIHdheWxhbmQtZWdsLmgu
Li4geWVzCj4gICAgY2hlY2tpbmcgZm9yIHdsX2VnbF93aW5kb3dfY3JlYXRlIGluIC1sd2F5bGFu
ZC1lZ2wuLi4geWVzCj4gICAgY29uZmlndXJlOiBlcnJvcjogV2F5bGFuZCBkZXZlbG9wbWVudCBm
aWxlcyBub3QgZm91bmQsIHRoZSBXYXlsYW5kCj4gICAgICBkcml2ZXIgd29uJ3QgYmUgc3VwcG9y
dGVkLgo+ICAgIFRoaXMgaXMgYW4gZXJyb3Igc2luY2UgLS13aXRoLXdheWxhbmQgd2FzIHJlcXVl
c3RlZC4KPiAKPiBFdmVyeSBvdGhlciB0ZXJtIG9mIHRoYXQgdGVzdCBwYXNzZXM7IG9ubHkgWEtC
UkVHSVNUUllfTElCUyBpcyBlbXB0eSwgc28KPiB3aW5lIGFuZCB3YXlsYW5kIHRvZ2V0aGVyIGNv
dWxkIG5vdCBiZSBidWlsdCBvbiBhbnkgYXJjaGl0ZWN0dXJlLgo+IAo+IEdhdGVkIG9uIEJSMl9Q
QUNLQUdFX0xJQlhNTDIgcmF0aGVyIHRoYW4gdHVybmVkIG9uIG91dHJpZ2h0LCBiZWNhdXNlCj4g
bWVzb24uYnVpbGQgdGFrZXMgZGVwZW5kZW5jeSgnbGlieG1sLTIuMCcpIHVuY29uZGl0aW9uYWxs
eSBvbmNlCj4gZW5hYmxlLXhrYnJlZ2lzdHJ5IGlzIHNldCwgc28gYSB0YXJnZXQgd2l0aG91dCBs
aWJ4bWwyIHdvdWxkIGZhaWwgdG8KPiBjb25maWd1cmUuCj4gCj4gUmVnYXJkaW5nIHNpbmNlIHdo
ZW4gdGhpcyBpcyBicm9rZW4sIHRocmVlIHBpZWNlcyBoYWQgdG8gY29tZSB0b2dldGhlcjoKPiAK
PiAgIC0gbGlieGtiY29tbW9uIGhhcyBwYXNzZWQgLURlbmFibGUteGticmVnaXN0cnk9ZmFsc2Ug
c2luY2UgY29tbWl0Cj4gICAgIDE3OTFiYzMwYTUgKCJwYWNrYWdlL2xpYnhrYmNvbW1vbjogYnVt
cCB2ZXJzaW9uIHRvIDEuMC4xIiwgU2VwIDIwMjApLAo+ICAgICBpLmUuIEJ1aWxkcm9vdCAyMDIw
LjExLiBsaWJ4a2JyZWdpc3RyeSBoYXMgdGhlcmVmb3JlIG5ldmVyIGJlZW4gYnVpbHQKPiAgICAg
aW4gQnVpbGRyb290Lgo+IAo+ICAgLSB3aW5lJ3MgY29uZmlndXJlIGdhaW5lZCB0aGUgWEtCUkVH
SVNUUllfTElCUyB0ZXJtIGluIGl0cyBXYXlsYW5kCj4gICAgIHRlc3QgaW4gd2luZSA5LjAsIHdp
dGggdXBzdHJlYW0gY29tbWl0IGQ2NGVhOGU0YTZjOQo+ICAgICAoIndpbmV3YXlsYW5kLmRydjog
RW51bWVyYXRlIFhrYiBsYXlvdXRzIGFuZCBjcmVhdGUgbWF0Y2hpbmcgSEtMLiIsCj4gICAgIE5v
diAyMDIzKS4KPiAKPiAgIC0gd2luZS5tayBzdGFydGVkIHBhc3NpbmcgLS13aXRoLXdheWxhbmQg
aW4gY29tbWl0IDdjYjQ5ZTc3MTIKPiAgICAgKCJwYWNrYWdlL3dpbmU6IGJ1bXAgdG8gdmVyc2lv
biA5LjE5IiwgT2N0IDIwMjQpLCB3aGljaCBpcyB3aGF0IHR1cm5zCj4gICAgIHRoZSBtaXNzaW5n
IFhLQlJFR0lTVFJZX0xJQlMgZnJvbSBhIG5vdGljZSBpbnRvIGEgaGFyZCBlcnJvci4KPiAKPiBU
aGUgYnJlYWthZ2UgdGhlcmVmb3JlIGRhdGVzIGZyb20gQnVpbGRyb290IDIwMjQuMTEsIGFuZCBl
dmVyeSBicmFuY2gKPiBzaW5jZSBpcyBhZmZlY3RlZCwgaW5jbHVkaW5nIHRoZSBMVFMgb25lOiAy
MDI1LjAyLnggY2FycmllcyB3aW5lIDEwLjAsCj4gd2hvc2UgY29uZmlndXJlIGhhcyB0aGUgWEtC
UkVHSVNUUllfTElCUyBjaGVjaywgdG9nZXRoZXIgd2l0aAo+IGxpYnhrYmNvbW1vbiAxLjkuMiBi
dWlsdCB3aXRoIC1EZW5hYmxlLXhrYnJlZ2lzdHJ5PWZhbHNlLCBhbmQgaXRzIHdpbmUubWsKPiBw
YXNzZXMgLS13aXRoLXdheWxhbmQuIDIwMjUuMDUueCBhbmQgMjAyNS4wOC54IGFyZSBpbiB0aGUg
c2FtZSBzdGF0ZS4KPiBBIGJhY2twb3J0IHRvIDIwMjUuMDIueCBpcyB0aHVzIG5lZWRlZC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbHNleSBDb2xlbWFuIE1pbGxlciA8YWxzZXljbWlsbGVyQGdtYWls
LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAgIENoYW5nZXMgc2luY2UgdjE6Cj4gICAgICAg
LSBFeHRlbmQgdGhlIGNvbW1pdCBsb2cgdG8gZG9jdW1lbnQgc2luY2Ugd2hlbiB0aGUgcHJvYmxl
bSBleGlzdHMsIGFuZAo+ICAgICAgICAgd2hldGhlciB0aGUgMjAyNS4wMi54IExUUyBicmFuY2gg
aXMgYWZmZWN0ZWQgKHN1Z2dlc3RlZCBieSBUaG9tYXMKPiAgICAgICAgIFBldGF6em9uaSkuIE5v
IGNoYW5nZSB0byB0aGUgY29kZS4KPiAKPiAgIHBhY2thZ2UvbGlieGtiY29tbW9uL2xpYnhrYmNv
bW1vbi5tayB8IDEwICsrKysrKysrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlieGtiY29tbW9u
L2xpYnhrYmNvbW1vbi5tayBiL3BhY2thZ2UvbGlieGtiY29tbW9uL2xpYnhrYmNvbW1vbi5tawo+
IGluZGV4IDIxYTJiOTM3ZWYuLjQwNmFmZmU0MDEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJ4
a2Jjb21tb24vbGlieGtiY29tbW9uLm1rCj4gKysrIGIvcGFja2FnZS9saWJ4a2Jjb21tb24vbGli
eGtiY29tbW9uLm1rCj4gQEAgLTEyLDggKzEyLDE0IEBAIExJQlhLQkNPTU1PTl9DUEVfSURfVkVO
RE9SID0geGtiY29tbW9uCj4gICBMSUJYS0JDT01NT05fSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4g
ICBMSUJYS0JDT01NT05fREVQRU5ERU5DSUVTID0gaG9zdC1iaXNvbiBob3N0LWZsZXgKPiAgIExJ
QlhLQkNPTU1PTl9DT05GX09QVFMgPSBcCj4gLQktRGVuYWJsZS1kb2NzPWZhbHNlIFwKPiAtCS1E
ZW5hYmxlLXhrYnJlZ2lzdHJ5PWZhbHNlCj4gKwktRGVuYWJsZS1kb2NzPWZhbHNlCj4gKwo+ICtp
ZmVxICgkKEJSMl9QQUNLQUdFX0xJQlhNTDIpLHkpCj4gK0xJQlhLQkNPTU1PTl9DT05GX09QVFMg
Kz0gLURlbmFibGUteGticmVnaXN0cnk9dHJ1ZQo+ICtMSUJYS0JDT01NT05fREVQRU5ERU5DSUVT
ICs9IGxpYnhtbDIKPiArZWxzZQo+ICtMSUJYS0JDT01NT05fQ09ORl9PUFRTICs9IC1EZW5hYmxl
LXhrYnJlZ2lzdHJ5PWZhbHNlCj4gK2VuZGlmCj4gICAKPiAgIGlmZXEgKCQoQlIyX1BBQ0tBR0Vf
WE9SRzcpLHkpCj4gICBMSUJYS0JDT01NT05fQ09ORl9PUFRTICs9IC1EZW5hYmxlLXgxMT10cnVl
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
