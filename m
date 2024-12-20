Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E67E7718A
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 08:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AEB98382D;
	Fri, 20 Dec 2024 08:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zx4bozhLo0gd; Fri, 20 Dec 2024 08:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80C3083863
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80C3083863;
	Fri, 20 Dec 2024 08:55:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 99A9B920
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 08:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8679C41552
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 08:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hhSabqxpJuZi for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 08:55:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F607414C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F607414C9
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F607414C9
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 08:55:34 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-3035046d4bfso14885031fa.0
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 00:55:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734684931; x=1735289731;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zr4PWNJ9JWbMIXbN/10oXW2xhzPzx4ynez/d16k5lfE=;
 b=C56z1NCDHXhuE1pCaclKHjSVevjCkksiAeV76oho0goZAzL43s5r6w15e18pg0lW1s
 HAzSZpd3f3DvS7UQ0hvOC5FClEDbYretSuWx31U9PEvD745kAJSYtoo5pvw4k7D9ihvf
 1UMed8HmTdbcl9vydRywupW+OBMf4xepoh7Jfe96mkJ2mF/Gc/ew9uSR6gZ/nH0acpQu
 hikBpk6HiJ2DuF0wA0d2F2hqRnDirvIejWNqtrKd+peltQ3snzFqEVqET9rxn7yMkCzt
 iT8c4IXufdlG4SRP5tHQLt7zgI6RwGcfoRt/do2YXy9bZ31VVSbrRf8Ta96X0x/hssmq
 yI6w==
X-Gm-Message-State: AOJu0Yy+liIv2E+E5nW3ELRX8LR60WfFkyCbOYbPb1ZouYuBC7zZQlLV
 BScDV5Bhg8lsLK2xEKGHCzw8abO1N5oEcsC3xXohnN6utQ/H9+6ELMA+QwcAiXEkm2lXb1hsWkj
 Xna1KrfC7L8/NtWfbYjCJJFssPquL3YdZ
X-Gm-Gg: ASbGncuC0gWlc9RkjqYmxdv5VtxrWYMt0sFLtAp6Xow2cVeDtxVkMhaSezsAJ/Py30G
 cU+j+MUecuufI27eTndAnts5Pdo3eM6EB53uERhY=
X-Google-Smtp-Source: AGHT+IGIv6iFhM8dglay3JbjvD5UG4Wu4PgDNkPAbA9w9j0ZSKwHLrSCU3emzkya39JpU18p8QKLiFxe0JEqS+/rIFk=
X-Received: by 2002:a2e:b888:0:b0:302:1dd5:6b5d with SMTP id
 38308e7fff4ca-30468546b75mr6286431fa.14.1734684931223; Fri, 20 Dec 2024
 00:55:31 -0800 (PST)
MIME-Version: 1.0
References: <6764f1fc.050a0220.142ef5.521b@mx.google.com>
In-Reply-To: <6764f1fc.050a0220.142ef5.521b@mx.google.com>
Date: Fri, 20 Dec 2024 09:56:03 +0100
Message-ID: <CAGm1_ktiWPLOXr6cTGyBxiywHk1Jy8hNKhyS+Vb9dsebNtiqSQ@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1734684931; x=1735289731; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zr4PWNJ9JWbMIXbN/10oXW2xhzPzx4ynez/d16k5lfE=;
 b=C9vuk8Lux+oZUuOLJChjSJD0QRerw0MPbnEbDNUBwk817e2XMKIPa4SVtWgspIS9HY
 3UqxZ8j1GFsJ1XDf8caawjFl1Kta9pNon83ehdzkv6MM5fuWD+131reAe5zFisUA8Gou
 X53Yox+QX3li2S09LaFpbRFQZgtzn+GMUvEVOUmUrnikWmBl5CBWYvpVAEBApkO/GDRN
 QPojMH2pnzBPILOfHC+doQDeUryZobz2GVOLewu9MDEwOWhiHD3NY75CEHD1QOMSEmBy
 W4kq7dN2GyrJq78Ua+bTBK1oXNpWCuSlZPd0YU+DfjL5kZijl0+gEf7vKKgVItoxZB00
 O8GQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C9vuk8Lu
Subject: Re: [Buildroot] [autobuild.buildroot.org] Your daily results for
 2024-12-19
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxsLAoKT24gRnJpLCBEZWMgMjAsIDIwMjQgYXQgNToyNuKAr0FNIEJ1aWxkcm9vdCBOb3Rp
ZmljYXRpb25zCjxidWlsZHJvb3Qubm90aWZpY2F0aW9uc0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4g
SGVsbG8sCj4KPiBBdXRvYnVpbGRlciBmYWlsdXJlcwo+ID09PT09PT09PT09PT09PT09PT09Cj4K
PiBCZWxvdyBpcyBhIGxpc3Qgb2YgYnVpbGQgZmFpbHVyZXMgcmVwb3J0ZWQgYnkgdGhlIEJ1aWxk
cm9vdCBhdXRvYnVpbGRlcnMKPiBpbiByZWxhdGlvbiB0byBwYWNrYWdlcyBvciBDUFUgYXJjaGl0
ZWN0dXJlcyB5b3UgYXJlIGluIGNoYXJnZSBvZi4KPiBQbGVhc2UgaGVscCB1cyBpbXByb3Zpbmcg
dGhlIHF1YWxpdHkgb2YgQnVpbGRyb290IGJ5IGludmVzdGlnYXRpbmcgdGhvc2UKPiBidWlsZCBm
YWlsdXJlcyBhbmQgc2VuZGluZyBwYXRjaGVzIHRvIGZpeCB0aGVtLgo+Cj4gUmVzdWx0cyBmb3Ig
dGhlICdtYXN0ZXInIGJyYW5jaAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPgo+
IEJ1aWxkIGZhaWx1cmVzIHJlbGF0ZWQgdG8geW91ciBwYWNrYWdlczoKPgo+ICAgICBhcmNoICAg
ICB8ICAgICAgICAgICAgIHJlYXNvbiAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdXJsCj4gLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIHJpc2N2NjQgICAgfCAg
IGhvc3QtcHl0aG9uLWdyZWVubGV0LTMuMS4xICAgfCBodHRwczovL2F1dG9idWlsZC5idWlsZHJv
b3Qub3JnL3Jlc3VsdHMvNmU0NzM4M2YwMGIyMjRkZGMzYmU1ZTU2YzkyZjc3NGQ3OTQ5NjQ1Mwo+
ICAgIHg4Nl82NCAgICB8ICAgaG9zdC1weXRob24tZ3JlZW5sZXQtMy4xLjEgICB8IGh0dHBzOi8v
YXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9kMzY5YzI4YWVhNjZkMWZiYjczZmJlNTgx
N2M1MGEyZWQ3ZWY3ZGY2Cj4gICAgYXJtZWIgICAgIHwgICBob3N0LXB5dGhvbi1ncmVlbmxldC0z
LjEuMSAgIHwgaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzJhNDFjMmQ3
MWI1MTY5OWY0NzM0MWEwYmZjMjhmNTBlM2Q0YTMyY2QKPiAgIGFhcmNoNjQgICAgfCAgICBweXRo
b24tYXV0b2NvbW1hbmQtMi4yLjIgICAgfCBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3Jn
L3Jlc3VsdHMvMDI2NzA0MjRmZDQ0ZjEwYjVhYjA3ZjQzMTgxNzJjZjBlMTI1ZGViZQo+ICAgICBh
cmMgICAgICB8ICAgIHB5dGhvbi1hdXRvY29tbWFuZC0yLjIuMiAgICB8IGh0dHBzOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9lMzNiNDA1ZGY5MTNhMGY5YmE3ZTcwNmVhNjgwMzQx
ODZhNjJhZjFjCj4gICAgIGFybSAgICAgIHwgICAgcHl0aG9uLWF1dG9jb21tYW5kLTIuMi4yICAg
IHwgaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzdkYzJkNzNiMTI0ZmRi
ZjFlODU2MDg1N2Y1M2Q5YzMxNjAyZTdlMTIKClNvbHZlZCB2aWEgaHR0cHM6Ly9wYXRjaHdvcmsu
b3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MTIxMjA3MDg0NS4xNjIzMzUw
LTEteWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20vCgpZZWdvcgoKPgo+Cj4gVGhhbmtzIGZvciB5
b3VyIGNvbnRyaWJ1dGlvbiB0byBCdWlsZHJvb3QhCj4KPiAtLQo+IGh0dHBzOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5vcmcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
