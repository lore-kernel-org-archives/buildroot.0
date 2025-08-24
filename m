Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ACFCA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 13:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FC7884092;
	Sun, 24 Aug 2025 13:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0cjP674_H4F; Sun, 24 Aug 2025 13:52:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 927C5840D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 927C5840D2;
	Sun, 24 Aug 2025 13:52:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 442F11D9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 13:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33EB384092
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 13:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubH822nEXaJ0 for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 13:52:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCB4C84060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCB4C84060
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCB4C84060
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 13:52:35 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb78d5dcbso519295066b.1
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 06:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756043553; x=1756648353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NFaNfgxmGnlwytEndJLvQ+++pxO9ZZlXykC1v9HX5QY=;
 b=h2G3R7Oo9DLAG8oe4bZpkZ31qqUC3OCQn4mVIw+MFiqd16suMwG/JEpTjwPsX+yvKh
 NScpnuRIXOWD77ETqISyrWlcRHazsF8Phm3p4qlfyzG8t1lBtlKkwrELod75eOBhSkYy
 lHxqu0SlCz3dxHBDT0NrnlW24e7MrzZLQP0BDaCjOCQW6gwM9kTt8CzQLHp58USfTLl1
 ozpIZtdfHuAX2hkpp9SJEf0upXpK7DDi3o4rTuUYdQMh9wXHowNbrah/TJAFHBTeWeoE
 PoQazwfc46++A0xeVfp07npypGoUcoukuy4RgipM2Tt+s569PSsxxLCC0hJd5iXvVUqn
 GZ6Q==
X-Gm-Message-State: AOJu0Yw68eDVoHVR+O369E+hrotS/H0Sji2ELTBK3VgYbSvdjyG9Az0E
 N48YG3dLdDMlPSaW8EmpCP5A6vNwvL5PWdoQ8Z+mo3fnDC8/dRr1nKBy5PfAEsE=
X-Gm-Gg: ASbGnctlp33WtA4qyfbHZ6mW2XrOdsinkU065kTj+A5VUU3+xzMwFAObQ4RiOYvD2x1
 3pLxDMTRLN2EvBt1kj2h+9m1AMWd1JpMcQK6/G+8mpUFjM4sIHgm2QM/MAwmgVSq093XKpbTsMP
 GEcedZkfbbZCR+9ypIxebIyzAeyoeDgLC8sb5dewmPsX8q7vXCtC+VkOxO3e91gdz+pig6WNBJT
 03NRkkZ5ChS1Eru/giCITB0rN7ePELsckSpxL9fzD6AS7hm0ZsIJDfkZP6f1SWkErqkSpB3Hppz
 lNQURDxrisC0u6krcM+PsbwGWcvQGYIBturDoErABbHEkQNILkNjggw4q3i7ti8OZ14Sm0xHU8X
 uWZZTrL1azxDt1jICsl0vDnIM+9ql6jJUAWvBJw==
X-Google-Smtp-Source: AGHT+IEWiPf4lJJfdt5oULyrt0IiAx+lNLS+cMF8VKB1rlmKS0BHqjA7e0ZM5QlVGxAMjlEXDyWERw==
X-Received: by 2002:a17:907:3e08:b0:af9:a5f8:2f34 with SMTP id
 a640c23a62f3a-afe2963b046mr933943466b.53.1756043553350; 
 Sun, 24 Aug 2025 06:52:33 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe48fbdb8bsm377430466b.39.2025.08.24.06.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 06:52:32 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 15:52:17 +0200
Message-ID: <20250824135229.120140-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715125737.798491-1-shirokovalexs@gmail.com>
References: <20250715125737.798491-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756043553; x=1756648353; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NFaNfgxmGnlwytEndJLvQ+++pxO9ZZlXykC1v9HX5QY=;
 b=JOLMjlxYxLDUwGPCBpb1+UBTTxNuBM3G1dRXyFeEpIBDuMarxGQJbV6QFuliVdcQlm
 X006fzQfYF+8WyD512RGG4Ld05+tCo7nu/DAtKqSKuivWF7H1O6gIOhMKalN681iTaGv
 baYQF5muH/3yBLR104jx5RTVnUdgauH9w6H4vSHf/mtk1ksXuZGzLN6p02JQHjyIL5jQ
 RoMjkUyLa1YYeFhyAMHZu4VDWf+2vxcPbVLIxxS6PIKaf0cAiEcwTys/88zrTT05AFyL
 hZ4n/YQ1bycdqChxRZykVATOUYfgXLRo60aMmlgdP8QBTfhX4AWGDiOPH58D/2np9YiE
 7oHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JOLMjlxY
Subject: [Buildroot] [v2,1/1] package/nnn: new package
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
Cc: Alexander Shirokov <shirokovalexs@gmail.com>, arnout@mind.be
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bm5uIGlzIGEgZmFzdCBhbmQgbWluaW1hbCB0ZXh0LWJhc2VkIGZpbGUgbWFuYWdlci4gSXQgaXMg
d3JpdHRlbiBpbiBDCmFuZCBoYXMgbWluaW1hbCBkZXBlbmRlbmNpZXMsIHdoaWNoIG1ha2VzIGl0
IHBvcnRhYmxlIGFuZCBzdWl0YWJsZSBmb3IKZW1iZWRkZWQgc3lzdGVtcy4KClByb2plY3QgcGFn
ZTogaHR0cHM6Ly9naXRodWIuY29tL2phcnVuL25ubgpXaWtpOiBodHRwczovL2VuLndpa2lwZWRp
YS5vcmcvd2lraS9Obm5fKGZpbGVfbWFuYWdlcikKClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBT
aGlyb2tvdiA8c2hpcm9rb3ZhbGV4c0BnbWFpbC5jb20+CgotLS0KQ2hhbmdlcyB2MSAtPiB2MjoK
ICAtIFVwZGF0aW5nIGRlcGVuZGVuY2llcyBhbmQgc2VsZWN0aW5nICJuY3Vyc2VzIiBmbGFncwog
IC0gVXNpbmcgInJlYWRsaW5lIiBhcyBhbiBvcHRpb25hbCBkZXBlbmRlbmN5CiAgLSBTaW1wbGlm
eWluZyBidWlsZCBhbmQgaW5zdGFsbGF0aW9uIHN0ZXBzCiAgLSBGaXhpbmcgdGhlIHBhY2thZ2Ug
dmVyc2lvbgogIC0gUGxhY2luZyB0aGUgcGFja2FnZSB0byB0aGUgIlRleHQgZWRpdG9ycyBhbmQg
dmlld2VycyIgc2VjdGlvbi4KICAgIENsb3NlIHRvICJtYyIKICAtIFVwZGF0aW5nIERFVkVMT1BF
UlMKClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTaGlyb2tvdiA8c2hpcm9rb3ZhbGV4c0BnbWFp
bC5jb20+Ci0tLQogREVWRUxPUEVSUyAgICAgICAgICAgIHwgIDMgKysrCiBwYWNrYWdlL0NvbmZp
Zy5pbiAgICAgfCAgMSArCiBwYWNrYWdlL25ubi9Db25maWcuaW4gfCAxNCArKysrKysrKysrKysr
KwogcGFja2FnZS9ubm4vbm5uLmhhc2ggIHwgIDMgKysrCiBwYWNrYWdlL25ubi9ubm4ubWsgICAg
fCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwg
NTQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvbm5uL0NvbmZpZy5p
bgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvbm5uL25ubi5oYXNoCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9ubm4vbm5uLm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVM
T1BFUlMKaW5kZXggODkxNWViNjczOC4uZTNlMTA5NzkyMSAxMDA2NDQKLS0tIGEvREVWRUxPUEVS
UworKysgYi9ERVZFTE9QRVJTCkBAIC05MSw2ICs5MSw5IEBAIEY6CXBhY2thZ2UvbW9kZW0tbWFu
YWdlci8KIE46CUFsZWtzYW5kciBNYWthcm92IDxhbGVrc2FuZHIuby5tYWthcm92QGdtYWlsLmNv
bT4KIEY6CXBhY2thZ2UvY3BwLWh0dHBsaWIvCiAKK046CUFsZXhhbmRlciBTaGlyb2tvdiA8c2hp
cm9rb3ZhbGV4c0BnbWFpbC5jb20+CitGOglwYWNrYWdlL25ubi8KKwogTjoJQWxlc3NhbmRybyBQ
YXJ0ZXNvdHRpIDxhLnBhcnRlc290dGlAZ21haWwuY29tPgogRjoJcGFja2FnZS9vYXRwcC8KIApk
aWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCAx
MzdmNzRlZDgyLi5iNGVhYzVjZjkxIDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysg
Yi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMjk3Myw2ICsyOTczLDcgQEAgbWVudSAiVGV4dCBlZGl0
b3JzIGFuZCB2aWV3ZXJzIgogCXNvdXJjZSAicGFja2FnZS9tZy9Db25maWcuaW4iCiAJc291cmNl
ICJwYWNrYWdlL21vc3QvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9uYW5vL0NvbmZpZy5p
biIKKwlzb3VyY2UgInBhY2thZ2Uvbm5uL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvdWVt
YWNzL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvdmltL0NvbmZpZy5pbiIKIGVuZG1lbnUK
ZGlmZiAtLWdpdCBhL3BhY2thZ2Uvbm5uL0NvbmZpZy5pbiBiL3BhY2thZ2Uvbm5uL0NvbmZpZy5p
bgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4wNzVhZmY5ZDIxCi0tLSAv
ZGV2L251bGwKKysrIGIvcGFja2FnZS9ubm4vQ29uZmlnLmluCkBAIC0wLDAgKzEsMTQgQEAKK2Nv
bmZpZyBCUjJfUEFDS0FHRV9OTk4KKwlib29sICJubm4iCisJIyBCdWlsZGluZyBubm4gd2l0aG91
dCB3aWRlY2hhci9VVEYgc3VwcG9ydCBpcyB0aGVvcmV0aWNhbGx5CisJIyBwb3NzaWJsZSwgYnV0
IGluIHByYWN0aWNlIGl0IGxlYWRzIHRvIHVuc3RhYmxlIGJ1aWxkcy4KKwkjIFRoYXTigJlzIHdo
eSB0aGUgV0NIQVIgZGVwZW5kZW5jeSBpcyBoZXJlLgorCWRlcGVuZHMgb24gQlIyX1VTRV9XQ0hB
UgorCXNlbGVjdCBCUjJfUEFDS0FHRV9OQ1VSU0VTCisJc2VsZWN0IEJSMl9QQUNLQUdFX05DVVJT
RVNfV0NIQVIKKwloZWxwCisJICBubm4gaXMgYSBsaWdodHdlaWdodCB5ZXQgcG93ZXJmdWwgdGVy
bWluYWwgZmlsZSBtYW5hZ2VyLgorCSAgSXQgaXMgd3JpdHRlbiBpbiBDLCBoYXMgbWluaW1hbCBk
ZXBlbmRlbmN5LCBhbmQgd29ya3MKKwkgIG91dCBvZiB0aGUgYm94LgorCisJICBodHRwczovL2dp
dGh1Yi5jb20vamFydW4vbm5uCmRpZmYgLS1naXQgYS9wYWNrYWdlL25ubi9ubm4uaGFzaCBiL3Bh
Y2thZ2Uvbm5uL25ubi5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAu
LjY3MGE1OTFhZmIKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL25ubi9ubm4uaGFzaApAQCAt
MCwwICsxLDMgQEAKKyMgTG9jYWxseSBjb21wdXRlZAorc2hhMjU2ICA5ZmFhZmYxZTNmNWEyZmQz
ZWQ1NzBhODNmNmZiM2JhZjBiZmM2ZWJkNmE5YWJhYzE2MjAzZDA1N2FjM2ZmZmUzICBubm4tNS4x
LnRhci5negorc2hhMjU2ICA4MjlmNDg1ZGM0ZjJmNTFjMjQ3MWIzNmE5OWUyMmYxNWZmMjE0OTY2
ZTE2YjcyY2Q3OTc2OGIyMzM4YjQxMzJiICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL25u
bi9ubm4ubWsgYi9wYWNrYWdlL25ubi9ubm4ubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uNzVlNzFjYTBlOAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uvbm5uL25u
bi5tawpAQCAtMCwwICsxLDMzIEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBubm4K
KyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK05OTl9WRVJTSU9OID0gNS4xCitOTk5fTElD
RU5TRSA9IEJTRC0yLUNsYXVzZQorTk5OX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCitOTk5fU0lU
RSA9ICQoY2FsbCBnaXRodWIsamFydW4sbm5uLHYkKE5OTl9WRVJTSU9OKSkKK05OTl9ERVBFTkRF
TkNJRVMgPSBuY3Vyc2VzCitOTk5fTUFLRV9GTEFHUyA9IENGTEFHU19PUFRJTUlaQVRJT049CisK
KyMgInJlYWRsaW5lIiBpcyBhbiBvcHRpb25hbCBkZXBlbmRlbmN5LiBJZiB0aGUgcGFja2FnZSBp
cyBlbmFibGVkLAorIyBhZGQgaXQgdG8gdGhlIGRlcGVuZGVuY2llcyBsaXN0LiBPdGhlcndpc2Us
IGJ1aWxkIHRoZSAibm9ybCIgdGFyZ2V0LgoraWZlcSAoJChCUjJfUEFDS0FHRV9SRUFETElORSks
eSkKK05OTl9ERVBFTkRFTkNJRVMgKz0gcmVhZGxpbmUKK2Vsc2UKK05OTl9NQUtFX0ZMQUdTICs9
IG5vcmwKK2VuZGlmCisKK2RlZmluZSBOTk5fQlVJTERfQ01EUworCSQoVEFSR0VUX01BS0VfRU5W
KSAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgJChNQUtFKSBcCisJLUMgJChARCkgJChOTk5fTUFL
RV9GTEFHUykKK2VuZGVmCisKK2RlZmluZSBOTk5fSU5TVEFMTF9UQVJHRVRfQ01EUworCSQoVEFS
R0VUX01BS0VfRU5WKSAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgJChNQUtFKSBcCisJLUMgJChA
RCkgJChOTk5fTUFLRV9GTEFHUykgXAorCURFU1RESVI9JChUQVJHRVRfRElSKSBQUkVGSVg9L3Vz
ciBpbnN0YWxsCitlbmRlZgorCiskKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQotLSAKMi41MC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
