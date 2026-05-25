Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253F8CD5BBF
	for <buildroot@archiver.kernel.org>; Mon, 25 May 2026 06:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98C9A60AC3;
	Mon, 25 May 2026 06:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gXdy-c63KDv; Mon, 25 May 2026 06:26:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8BBC60EE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779690400;
	bh=rAUrwIHXmb2EtCH/droi9akBw4nIFi49+a0IQ5cddC4=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QkNc16dPmF1s+nJywc5EEL2Y9khp/I7SqWJnLJvd7/5eu4shYsDBZfaHTxk53r87o
	 phkSlZacBjoYtNwSUSBnPPCxS/e9G+hAh3EsUk0xDLP9lxJfn/Gv30ze5CcYzSChXt
	 K1a70cg5JVuGESEIJHKww1tLbX40R5gk4YbMh1CIhx7s7Vxqs6jqFk9809EOkeP3bQ
	 VVwedeUiLQL0zHtvdiczgausIk0L9ip98YySP1hrH+VeaUTojRHj1BxcMZAxecllGf
	 rBq+G7N4GkfqFLm0UgyPu0+CAK7HkVS072NsfT5DGgLDme6Ow6ZfVPj7RB5jvrBE8x
	 Wo7cUzju5f6Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8BBC60EE2;
	Mon, 25 May 2026 06:26:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0859265
 for <buildroot@buildroot.org>; Mon, 25 May 2026 06:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E17BF83D6D
 for <buildroot@buildroot.org>; Mon, 25 May 2026 06:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GRP9JjzcxJ3Z for <buildroot@buildroot.org>;
 Mon, 25 May 2026 06:26:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EEC3983D1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEC3983D1E
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEC3983D1E
 for <buildroot@buildroot.org>; Mon, 25 May 2026 06:26:38 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id DA4DE31E0700; Mon, 25 May 2026 08:26:35 +0200 (CEST)
Date: Mon, 25 May 2026 08:26:35 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ahPrm_0gVDGw5B5-@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.85+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1779690395; bh=vtZBntgFzyRvT73ZTUpjiq0rMzwEadfl0d/K3PJDtpE=;
 h=Date:From:To:Subject:From;
 b=FOfD2mp8iGB7cf2B4R1tR8CgRhW71gmjBAkOOeHIlVHSymjfB5LpllfkFvcX9BAEG
 4+0p4/19yN7vN63qotZWY2Y/vHjQjejqJ8nBLuWxgA5fh+byOKKVKLtHgTR8fOt864
 dnecE7gnzs2kaDRGbPkplYB757USKV1N+ToOtzLg8nbVT13a3TmiYNXcS8Osthkxzi
 GXNitQcyAa5n4Kgf+nFBEaq1Z/E7zqg8l6sGmyrqMYzIkvpJEnDP2ooHeg8zeKgx0t
 XimNYPuWlEc4VmuvOK+hyEFMjcp+bSCoNTbQMEJKe4bc7JsqHdwVkY/2kUXHjSEjgJ
 KIqS+LY61V39w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH for next] package/uclibc: bump to 1.0.58
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TmV3IHJlbGVhc2Ugd2l0aCBmb2xsb3dpbmcgY2hhbmdlczoKCkFkYW0gTGFja29yenluc2tpICgx
KToKICAgICAgdGVybWlvcy5oOiBBZGQgSUJTSElGVAoKQ2hhcmxlcyBNaXJhYmlsZSAoMTEpOgog
ICAgICByaXNjdjogYWRkIGRlZmNvbmZpZ3MKICAgICAgcmlzY3Y6IGFkZCBzdXBwb3J0IGZvciBz
dGF0aWMgcGllIGJpbmFyaWVzCiAgICAgIHJpc2N2OiBhZGQgc3VwcG9ydCBmb3IgdWNvbnRleHQg
ZnVuY3Rpb25zCiAgICAgIHBpcGU6IGRpcmVjdGx5IGludm9rZSBwaXBlMiBmcm9tIGtlcm5lbCB3
aGVuICFVQ0xJQkNfTElOVVhfU1BFQ0lGSUMKICAgICAgRml4IHtnLHN9ZXR0aW1lb2ZkYXkgd2hl
biAhVUNMSUJDX0hBU19SRUFMVElNRQogICAgICBGaXggYnVpbGQgd2l0aCBzdGF0aWMtcGllIGJ1
dCB3aXRob3V0IG5wdGwgdGhyZWFkcwogICAgICBkbyBub3QgcmVtb3ZlIGJpdHMvdUNsaWJjX2N0
eXBlLmggd2hlbiAhVUNMSUJDX0hBU19DVFlQRV9UQUJMRVMKICAgICAgZ2V0b3B0LXN1c3YzOiBy
ZW1vdmUgY2FsbCB0byBnZXR0ZXh0IGBfYCBtYWNybwogICAgICByZWFkZGlyeyxfcn06IHJlbW92
ZSBsb29wIHRvIHNraXAgZmlsZXMgd2l0aCBkX2lubyA9PSAwCiAgICAgIHNwYXduOiBhbGxvdyBm
aWxlIGFjdGlvbnMgb24gbm8tbW11IHRhcmdldHMKICAgICAgZ2V0b3B0LXN1c3YzOiBhZGQgc3Vw
cG9ydCBmb3IgcmVzZXRpbmcgdGhlIHNjYW4gYnkgc2V0dGluZyBvcHRpbmQgdG8gemVybwoKTWFy
Y3VzIEhhZWhuZWwgKDEpOgogICAgICBhYXJjaDY0L2ZwdV9jb250cm9sLmg6IERvbid0IHVzZSBn
Y2MtaW50ZXJuYWwgdHlwZXMKCkphbiBLbMO2dHprZSAoMSk6CiAgICAgIGVsZi9kbC1zdXBwb3J0
LmM6IHJlbW92ZSB1bm5lY2Vzc2FyeSBtZW1zZXQKClJhbWluIE1vdXNzYXZpICg5KToKICAgICAg
bGlic2FuaXRpemVyOiBhcm0vdWNvbnRleHQ6IGZpeCBWRlAgc2F2ZS9yZXN0b3JlIHRvIHVzZSB1
Y19yZWdzcGFjZSBhcmVhCiAgICAgIGxpYnNhbml0aXplcjogYXJtL3Vjb250ZXh0Lmg6IGFkZCBn
bGliYy1zdHlsZSBSRUdfUjAuLlJFR19SMTUgYWxpYXNlcwogICAgICBsaWJzYW5pdGl6ZXI6IGxp
bmsuaC9kbC1pdGVyYXRlLXBoZHI6IGV4cG9zZSBkbF9waGRyX2luZm8gVExTIGZpZWxkcwogICAg
ICBsaWJzYW5pdGl6ZXI6IGxkc286IHRyYWNrIF9kbF9sb2FkX2FkZHMvX2RsX2xvYWRfc3VicyBj
b3VudGVycwogICAgICBsaWJzYW5pdGl6ZXI6IGxkc286IGltcGxlbWVudCBfZGxfdGxzX2dldF9h
ZGRyX3NvZnQgZm9yIGRsX3BoZHJfaW5mbzo6ZGxwaV90bHNfZGF0YQogICAgICBsaWJzYW5pdGl6
ZXI6IGRyb3AgX19wYWdlc2l6ZSwgbWFrZSBfZGxfcGFnZXNpemUgdGhlIHNpbmdsZSBzb3VyY2Ug
b2YgdHJ1dGgKICAgICAgbGlic2FuaXRpemVyOiBzeXMvdXNlci5oOiByZW1vdmUgb2Jzb2xldGUg
QkZEIHRyYWQtY29yZSBOQlBHL1VQQUdFUyBkZWZpbmVzCiAgICAgIGxpYnNhbml0aXplcjogZmVh
dHVyZXMuaDogaGFyZC13aXJlIF9GSUxFX09GRlNFVF9CSVRTPTY0IHRvIG1hdGNoIGxpYnJhcnkn
cyA2NC1iaXQgb2ZmX3QvaW5vX3QKICAgICAgbGlic2FuaXRpemVyOiBmdHMuaDogZHJvcCB0aGUg
Ym9ndXMgX0ZJTEVfT0ZGU0VUX0JJVFM9PTY0ICNlcnJvcgoKV2FsZGVtYXIgQnJvZGtvcmIgKDcp
OgogICAgICBiaXRzL3N0YXR4Lmg6IGFkZCBzb21lIG1pc3NpbmcgZGVmaW5lcwogICAgICBiaXRz
L3N0YXR4Lmg6IHN5bmMgc3RydWN0IHdpdGggZ2xpYmMKICAgICAgc3lzL2Zhbm90aWZ5Lmg6IHN5
bmMgd2l0aCBtdXNsCiAgICAgIGxpYmljb252OiBmaXggdHlwZWRlZiBvZiBpY29udl90CiAgICAg
IG1pc2M6IGFkZCB1bmljb2RlIGNoYXJhY3RlciBmdW5jdGlvbnMgKGMxMSkKICAgICAgbmV0aW5l
dC90Y3AuaDogc3luYyB3aXRoIGdsaWJjCiAgICAgIGJ1bXAgdmVyc2lvbiBmb3IgMS4wLjU4IHJl
bGVhc2UKClNpZ25lZC1vZmYtYnk6IFdhbGRlbWFyIEJyb2Rrb3JiIDx3YnhAb3BlbmFkay5vcmc+
Ci0tLQogcGFja2FnZS91Y2xpYmMvdWNsaWJjLmhhc2ggfCA0ICsrLS0KIHBhY2thZ2UvdWNsaWJj
L3VjbGliYy5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS91Y2xpYmMvdWNsaWJjLmhhc2ggYi9w
YWNrYWdlL3VjbGliYy91Y2xpYmMuaGFzaAppbmRleCBlMGRiYTFiNmI0Li40YzJhNTc5ZGRmIDEw
MDY0NAotLS0gYS9wYWNrYWdlL3VjbGliYy91Y2xpYmMuaGFzaAorKysgYi9wYWNrYWdlL3VjbGli
Yy91Y2xpYmMuaGFzaApAQCAtMSw0ICsxLDQgQEAKLSMgRnJvbSBodHRwczovL2Rvd25sb2Fkcy51
Y2xpYmMtbmcub3JnL3JlbGVhc2VzLzEuMC41Ny91Q2xpYmMtbmctMS4wLjU3LnRhci54ei5zaGEy
NTYKLXNoYTI1NiAgOGJjNzM0YjU4NGUyM2ZmNmFlM2QwZWJiNGMwZmIxZDFkODE0YzU4YzgyODIy
YjkzMTMwZDQzNmFmYTdhY2U4YiAgdUNsaWJjLW5nLTEuMC41Ny50YXIueHoKKyMgRnJvbSBodHRw
czovL2Rvd25sb2Fkcy51Y2xpYmMtbmcub3JnL3JlbGVhc2VzLzEuMC41OC91Q2xpYmMtbmctMS4w
LjU4LnRhci54ei5zaGEyNTYKK3NoYTI1NiAgOWU4MTAwYTQ0MmY3MDc5Yjk3MjhjYTI4NmUzMDM1
ZjY3ZGYwNTc4NjA2MTY2ZWEyZDFlZjg2NWE0YTEyZGRiOSAgdUNsaWJjLW5nLTEuMC41OC50YXIu
eHoKICMgTG9jYWxseSBjYWxjdWxhdGVkCiBzaGEyNTYgIGVjNjBiOTkzODM1ZTJjNmI3OWU2ZDky
MjYzNDVmNGU2MTRlNjg2ZWI1N2RjMTNiNjQyMGMxNWEzM2E4OTk2ZTUgIENPUFlJTkcuTElCCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3VjbGliYy91Y2xpYmMubWsgYi9wYWNrYWdlL3VjbGliYy91Y2xp
YmMubWsKaW5kZXggMGM5MWExNzZmYS4uNmYzNjY4NzE1YiAxMDA2NDQKLS0tIGEvcGFja2FnZS91
Y2xpYmMvdWNsaWJjLm1rCisrKyBiL3BhY2thZ2UvdWNsaWJjL3VjbGliYy5tawpAQCAtNCw3ICs0
LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVVDTElCQ19WRVJTSU9OID0gMS4w
LjU3CitVQ0xJQkNfVkVSU0lPTiA9IDEuMC41OAogVUNMSUJDX1NPVVJDRSA9IHVDbGliYy1uZy0k
KFVDTElCQ19WRVJTSU9OKS50YXIueHoKIFVDTElCQ19TSVRFID0gaHR0cHM6Ly9kb3dubG9hZHMu
dWNsaWJjLW5nLm9yZy9yZWxlYXNlcy8kKFVDTElCQ19WRVJTSU9OKQogVUNMSUJDX0xJQ0VOU0Ug
PSBMR1BMLTIuMSsKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
