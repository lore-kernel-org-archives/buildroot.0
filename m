Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7AECD98CC
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 10:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EB5180A92;
	Thu, 11 Jun 2026 10:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3bKmXPAY9JYQ; Thu, 11 Jun 2026 10:54:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4D6980E19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781175291;
	bh=vvFTFZfKXKBOxqfC7HwdHJgqPWAfXM8p8eILT56jb5c=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=bTvzo6L9CHNfjHCB08h8s+j29RGdsyDLnxLv6maflQc547UQ0loomZnTluTZYEmLo
	 XDjlHP/YFBLqCvDlNv/XwgxFQkSmo7oqk6LH1GSKh0GSPUkapVaIfHv2Dy568slGfq
	 bVDasp6qR3Wm3rMO9rIbouQ3/vBis1hvY5rbdWnr/EqilcLBRaYI8CPUiCZAjKgLYA
	 ITHXepz1nP24Bv6UbLV10OaTVI3tJMaryILrPRKjPREMdr4UN1eQgABJ/pzE3QI1PG
	 s83w1hZ4YdQ3Wu6D5h3ilceLF1NOCVxali/EXbVDinJoLLwiXzZMLQfuNG3aIzodcN
	 D23cxhmVrUwzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4D6980E19;
	Thu, 11 Jun 2026 10:54:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id A1F6D237
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 10:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with UTF8SMTP id 9180E80D3F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 10:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id 7q1GhboG7xIY for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 10:54:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB5F080593
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB5F080593
Received: from sea.source.kernel.org (sea.source.kernel.org
 [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
 by smtp1.osuosl.org (Postfix) with UTF8SMTPS id CB5F080593
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 10:54:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with UTF8SMTP id 0008642B68
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 10:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 506A01F00893;
 Thu, 11 Jun 2026 10:54:47 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Date: Thu, 11 Jun 2026 13:54:34 +0300
Message-ID: <20260611105434.3164134-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel.org; s=k20260515; t=1781175287;
 bh=yP0dr9/2Y/BhDaioe2rA8rOgXsv2WJ9cz/foolnhyKo=;
 h=From:To:Cc:Subject:Date;
 b=kZlsCn4IaEjwVvvDrHb5dwAIZ2Z8Cwcg+2z7wMluQQalnivpD0T7+e6Kk6RY0tUs8
 QsI4PoKSu7jX80kU5e6EgtWtscPaB1B68jUeK6AWhlBJZe2FOK9hl+2Ri2KA2G49Nb
 GAnQY9WFrxf1EboD1IZI96ug7qgx6SfnjXC65XswhUwp6mhipmYjAh7J63O1Tj65kx
 husKD/akWIMsQ9AXgZXAVGPEhSnxNFVE7B5R/uZ+SbTWbwkLu1fuq4kdN6SJwh1w3P
 AAYCdmB+9eV4T2YMbvjwNIaH20KDYfts1hkDh1wW8vqTedMF8KWPZSRly482aANyl9
 KdDnmrtT5Rrpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20260515 header.b=kZlsCn4I
Subject: [Buildroot] [PATCH] package/tpm2sh: new package tpm2sh 0.17.2
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
From: Jarkko Sakkinen via buildroot <buildroot@buildroot.org>
Reply-To: Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dHBtMnNoIGlzIGEgVFBNIDIuMCBjb21tYW5kLWxpbmUgc2hlbGwgYW5kIHRyb3VibGVzaG9vdGlu
ZyB0b29sIGZvciBMaW51eAp3aXRoIGxvdyBkZXBlbmRlbmNpZXMuIEl0IGNvbW11bmljYXRlcyBk
aXJlY3RseSB3aXRoIC9kZXYvdHBte3JtfTAuIEl0CmlzIG1vc3QgdXNlZnVsIGluIGtlcm5lbCB0
ZXN0aW5nLgoKQW1vbmcgb3RoZXIgdGhpbmdzIGl0IGNhbiBiZSB1c2VkIHRvIHF1ZXJ5IGFuZCBt
YW5pcHVsYXRlIHRoZSBjaGlwCm1lbW9yeToKCn4gbWFpbgrina8gdHBtMnNoIG1lbW9yeQpIQU5E
TEUgICAgIENMQVNTICAgICAgREVUQUlMUwowMWMwMDAwMiAgIG52LWluZGV4ICAgcnNhLTIwNDg6
c2hhMjU2CjAxYzAwMDBhICAgbnYtaW5kZXggICBlY2MtbmlzdC1wMjU2OnNoYTI1NgoKfiBtYWlu
CuKdryB0cG0yc2ggbWVtb3J5IDAxYzAwMDBhCi0tLS0tQkVHSU4gQ0VSVElGSUNBVEUtLS0tLQpb
Q0VOU09SRURdCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0KCkFuZCBhbGwgdGhpcyBtYWtlcyBp
dCBhbHNvIHNvcnQgb2YgdXNlZnVsIGVtYmVkZGVkIGRlYnVnZ2luZyB0b29sIHRvby4KClNpZ25l
ZC1vZmYtYnk6IEphcmtrbyBTYWtraW5lbiA8amFya2tvQGtlcm5lbC5vcmc+Ci0tLQpTb3JyeSBp
ZiBJIG1pc3NlZCBzb21lIGRldGFpbC4gVHJpZWQgdG8gY2hlY2sgYnV0IHRoaXMgaXMgbXkgZmly
c3QgUnVzdApwYWNrYWdlIGZvciBCUjIgc28gYW55dGhpbmcgaXMgcG9zc2libGUuCiBwYWNrYWdl
L0NvbmZpZy5pbiAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvdHBtMnNoL0NvbmZpZy5pbiAgIHwg
MTggKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL3RwbTJzaC90cG0yc2guaGFzaCB8ICAyICsr
CiBwYWNrYWdlL3RwbTJzaC90cG0yc2gubWsgICB8IDE0ICsrKysrKysrKysrKysrCiA0IGZpbGVz
IGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Rw
bTJzaC9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3RwbTJzaC90cG0yc2gu
aGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdHBtMnNoL3RwbTJzaC5tawoKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5kZXggNjMwNjYy
NDc3Yi4uMDViNTA2MDY1MSAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysrIGIvcGFj
a2FnZS9Db25maWcuaW4KQEAgLTI4ODgsNiArMjg4OCw3IEBAIG1lbnUgIlN5c3RlbSB0b29scyIK
IAlzb3VyY2UgInBhY2thZ2UvdHBtLXRvb2xzL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uv
dHBtMi1hYnJtZC9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3RwbTItdG9vbHMvQ29uZmln
LmluIgorCXNvdXJjZSAicGFja2FnZS90cG0yc2gvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2Fn
ZS90cG0yLXRvdHAvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS91Z2V0dHkvQ29uZmlnLmlu
IgogCXNvdXJjZSAicGFja2FnZS91bnNjZC9Db25maWcuaW4iCmRpZmYgLS1naXQgYS9wYWNrYWdl
L3RwbTJzaC9Db25maWcuaW4gYi9wYWNrYWdlL3RwbTJzaC9Db25maWcuaW4KbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNTI2OGQwZGY2ZQotLS0gL2Rldi9udWxsCisrKyBi
L3BhY2thZ2UvdHBtMnNoL0NvbmZpZy5pbgpAQCAtMCwwICsxLDE4IEBACitjb25maWcgQlIyX1BB
Q0tBR0VfVFBNMlNICisJYm9vbCAidHBtMnNoIgorCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9T
VF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUworCXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1JV
U1RDCisJc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfUEtHQ09ORgorCXNlbGVjdCBCUjJfUEFDS0FH
RV9PUEVOU1NMCisJc2VsZWN0IEJSMl9QQUNLQUdFX09QRU5TU0xfRk9SQ0VfTElCT1BFTlNTTAor
CXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJPUEVOU1NMCisJaGVscAorCSAgVFBNIDIuMCBjb21tYW5k
LWxpbmUgaW50ZXJmYWNlLgorCisJICB0cG0yc2ggaXMgYSBjb21tYW5kLWxpbmUgaW50ZXJmYWNl
IGZvciBpbnRlcmFjdGluZyB3aXRoIFRQTSAyLjAgY2hpcHMKKwkgIGRpcmVjdGx5IHRocm91Z2gg
L2Rldi90cG0wIG9yIC9kZXYvdHBtcm0wLgorCisJICBodHRwczovL2dpdGxhYi5jb20vdHBtLXBy
b3RvY29sL3RwbTJzaAorCitjb21tZW50ICJ0cG0yc2ggbmVlZHMgYSB0b29sY2hhaW4gd2l0aCBS
dXN0IHN1cHBvcnQiCisJZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRf
QVJDSF9TVVBQT1JUUwpkaWZmIC0tZ2l0IGEvcGFja2FnZS90cG0yc2gvdHBtMnNoLmhhc2ggYi9w
YWNrYWdlL3RwbTJzaC90cG0yc2guaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwLi41NjdhNzc1MWY5Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS90cG0yc2gvdHBt
MnNoLmhhc2gKQEAgLTAsMCArMSwyIEBACitzaGEyNTYgIDkwYjU1N2I2ZDZhNmE4ZjhlMmJmOTQ2
ZWRmNWRiMThjZDMzYjA5MjQ1YzExZDM4ZTg1NDNmZjBmNDg2ZjZhNDAgIHRwbTJzaC0wLjE3LjIt
Z2l0NC1jYXJnbzUudGFyLmd6CitzaGEyNTYgIDM5NzJkYzk3NDRmNjQ5OWYwZjliMmRiZjc2Njk2
ZjJhZTdhZDhhZjliMjNkZGU2NmQ2YWY4NmM5ZGZiMzY5ODYgIExJQ0VOU0UKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvdHBtMnNoL3RwbTJzaC5tayBiL3BhY2thZ2UvdHBtMnNoL3RwbTJzaC5tawpuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi41NzNlYjg4YWQ1Ci0tLSAvZGV2L251
bGwKKysrIGIvcGFja2FnZS90cG0yc2gvdHBtMnNoLm1rCkBAIC0wLDAgKzEsMTQgQEAKKyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHRwbTJzaAorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKKworVFBNMlNIX1ZFUlNJT04gPSAwLjE3LjIKK1RQTTJTSF9TSVRFID0gaHR0cHM6Ly9naXRs
YWIuY29tL3RwbS1wcm90b2NvbC90cG0yc2gKK1RQTTJTSF9TSVRFX01FVEhPRCA9IGdpdAorVFBN
MlNIX0xJQ0VOU0UgPSBHUEwtMy4wLW9yLWxhdGVyCitUUE0yU0hfTElDRU5TRV9GSUxFUyA9IExJ
Q0VOU0UKK1RQTTJTSF9ERVBFTkRFTkNJRVMgPSBob3N0LXBrZ2NvbmYgb3BlbnNzbAorCiskKGV2
YWwgJChjYXJnby1wYWNrYWdlKSkKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
