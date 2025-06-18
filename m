Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A469C7115A
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 14:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC22680801;
	Wed, 18 Jun 2025 14:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O82VJvbGqcgv; Wed, 18 Jun 2025 14:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0339480CF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0339480CF3;
	Wed, 18 Jun 2025 14:28:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 827CD151
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 14:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66EE940986
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 14:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ntVYwEXUtzPf for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 14:28:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2F94408EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2F94408EC
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2F94408EC
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 14:28:35 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4530921461aso60787755e9.0
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 07:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750256910; x=1750861710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I2enwTSvPmuGevlbk+P2Tr2HjGfDANK+p5/3HYtMdPA=;
 b=mcZIhgLVGQdWyqOEzrmGgj1a/lb/hhcJ5UBOs8ijyaejDvtQd8qqTrMZRBkDFToYnf
 gDhAfa+jcolzr7gQ2NJVyGuge0UEuDoIN3H/3cL6QevMe84dUbJ9g2nHU+ya7JL9Vrx3
 L8LD8OqyUgFTWW+0x52LJei7tt9L+V9I/WUf7jbMCLVtL57ufyF0VlqZkJA7MhUQbvKn
 hFefjTPaLKeGkoMYOqweOqBhmsH+ZpHVCt7tvKOqt1GBPDK8ve3JrAAF0XlmrEqkMr+n
 VsIs19QnqQX7nnQ7eS4u8q56cRyHdmrIVQmkkECxFVr3S6WMrhKN5Jz9D7ghqCOXbcOH
 G+zg==
X-Gm-Message-State: AOJu0YwuwkVPf7LQhCBCdrMB5zLloydbrYNRmXoN5M5eJ05Zm9J92xQj
 yXe9+q5tFj3YoDfZttQGdRHuSCL03zkE3lMzY8ZP0/CD4FqEUIvVC9bLfXoSXNsWPVmCjXL50dS
 /eGzTZ8A=
X-Gm-Gg: ASbGncupPUvgbPPlL42xrBYzx8mqhOJDOdNyo4WXF87HxCoBUyF+9wRJCLAPyttmFBY
 RC8F0lnxSD+mpLfJOM9roFpvnOK5bUG+Q9jPRoYccd++FoQ1febwDvDiWg6VU7+s+gRebBL/vTU
 GFbgkX0qfFqZ70Qx5HVN176GGu04PkWo7btcaWDzJ31ywcKgfTpkCfOCNZMykDfdTGvc+5Ber5r
 WsmMa88vxfsInIW7XwVJqkbcxQsf/nEgUbsCzq5gdFtND5v7+dM7GDTwbaDR0OarFkEKix7HxWx
 hLEsKNB2lsdKyu/AKfULFoiZQTikNsAHL2EJXU3pCfj4jxDSkn91/uC8hcq3D3E=
X-Google-Smtp-Source: AGHT+IE6/rzpAx8buTdUvkGuuqmg7HgixHUlT/n3aj6oHO8Jiv19fp/ftpZmAbSx0ymRA8Sh09SlMA==
X-Received: by 2002:a05:600c:4ed1:b0:453:78f:fa9f with SMTP id
 5b1f17b1804b1-4533ca510afmr161241695e9.11.1750256910260; 
 Wed, 18 Jun 2025 07:28:30 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b08a2bsm17353621f8f.62.2025.06.18.07.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 07:28:28 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B2B5A5F891;
 Wed, 18 Jun 2025 15:28:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 18 Jun 2025 15:28:20 +0100
Message-ID: <20250618142825.758131-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250618142825.758131-1-alex.bennee@linaro.org>
References: <20250618142825.758131-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750256910; x=1750861710; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I2enwTSvPmuGevlbk+P2Tr2HjGfDANK+p5/3HYtMdPA=;
 b=JGM6Lk1IrXCZUHQFSEWAD/SV+aIYB2dPVpp8OclIi8GzOT1YE+SJwGVCnfwIaEJTkx
 HXyoktQDpNnXIVredfmEJ0Wbe/qa9Wj1mTDClI4qHbb3edVBEMyQBMMI4fpKxpPjEXDz
 JnN3BTZIvKlU8fO/5rf6UJuqpRSyhyiH3KLAiOWp6ryBEREN4opqP4/6oDCakKdhdvYZ
 ud8yJwZOSR7giRMvIm+RThgoyk/LSxwEd71lFMfh/Jc4hGJ+M7uGzwv/x1ekseVtA6aG
 Fpc05Er4J4lltuhTgi/VlngfDcdKXEelQEL+5xTB+ah9Rtyh+7vYmsjW+yHMnfoE7Iys
 Fnqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JGM6Lk1I
Subject: [Buildroot] [PATCH v7 1/4] package/vulkan-sdk: new package
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHByaW5jaXBsZSBjb21wb25lbnQgb2YgdGhpcyBpcyB0aGUgbmV3IHZvbGsgbWV0YS1sb2Fk
ZXIgd2hpY2ggaXMKcmVxdWlyZWQgZm9yIG1vcmUgcmVjZW50IHZlcnNpb25zIG9mIHZ1bGthbi10
b29scy4gVGhlcmUgZG9lcyBzZWVtIHRvCmJlIGEgbGl0dGxlIGNvbmZ1c2lvbiB3aXRoIGdpdGh1
YiBSZWxlYXNlcyBsYWdnaW5nIGJlaGluZCB0YWdnZWQKdmVyc2lvbnMgb2YgdGhlIHNkay4gSSd2
ZSBnb25lIGZvciB0aGUgbGF0ZXN0IFNESyB2ZXJzaW9uIHRvIHN0YXkgYXMKY2xvc2VseSBhbGln
bmVkIHRvIHRoZSByZXN0IG9mIHRoZSBzeXN0ZW0gYXMgSSBjYW4uCgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+CgotLS0KdjcKICAtIGFkZCBkZXBl
bmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBkbGZjbi5oCiAgLSBhZGQgZGVwZW5kcyBvbiBCUjJf
SU5TVEFMTF9MSUJTVERDUFAgZm9yIEMrKwp2NgogIC0gYnVtcCB0byB2dWxrYW4tc2RrLTEuNC4z
MTMuMAotLS0KIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNr
YWdlL3Z1bGthbi1zZGsvQ29uZmlnLmluICAgICAgIHwgMTIgKysrKysrKysrKysrCiBwYWNrYWdl
L3Z1bGthbi1zZGsvdnVsa2FuLXNkay5oYXNoIHwgIDMgKysrCiBwYWNrYWdlL3Z1bGthbi1zZGsv
dnVsa2FuLXNkay5tayAgIHwgMTggKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQs
IDM0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Z1bGthbi1zZGsv
Q29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS92dWxrYW4tc2RrL3Z1bGthbi1z
ZGsuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdnVsa2FuLXNkay92dWxrYW4tc2Rr
Lm1rCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgpp
bmRleCAyMjdjODFlYmVkLi44MTZjNzgzMGU4IDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5p
bgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMzc1LDYgKzM3NSw3IEBAIGNvbW1lbnQgIkdy
YXBoaWMgbGlicmFyaWVzIgogCXNvdXJjZSAicGFja2FnZS90ay9Db25maWcuaW4iCiAJc291cmNl
ICJwYWNrYWdlL3Z1bGthbi1oZWFkZXJzL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvdnVs
a2FuLWxvYWRlci9Db25maWcuaW4iCisJc291cmNlICJwYWNrYWdlL3Z1bGthbi1zZGsvQ29uZmln
LmluIgogCXNvdXJjZSAicGFja2FnZS92dWxrYW4tdG9vbHMvQ29uZmlnLmluIgogCiBjb21tZW50
ICJPdGhlciBHVUlzIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS92dWxrYW4tc2RrL0NvbmZpZy5pbiBi
L3BhY2thZ2UvdnVsa2FuLXNkay9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uMzIyYmZjYjE0ZQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvdnVsa2Fu
LXNkay9Db25maWcuaW4KQEAgLTAsMCArMSwxMiBAQAorY29uZmlnIEJSMl9QQUNLQUdFX1ZVTEtB
Tl9TREsKKwlib29sICJ2dWxrYW4tc2RrIgorCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUyAj
IGRsZmNuLmgKKwlkZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUCAjIEMrKworCXNlbGVj
dCBCUjJfUEFDS0FHRV9WVUxLQU5fSEVBREVSUworCWhlbHAKKwkgIFRoZSBWdWxrYW4gbWV0YS1s
b2FkZXIKKworCSAgaHR0cHM6Ly9naXRodWIuY29tL3pldXgvdm9saworCitjb21tZW50ICJWdWxr
YW4tU0RLIG5lZWQgdG9vbGNoYWluIHcvIEMrKywgZHluYW1pYyBsaWJyYXJ5IgorCWRlcGVuZHMg
b24gIUJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCBCUjJfU1RBVElDX0xJQlMKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvdnVsa2FuLXNkay92dWxrYW4tc2RrLmhhc2ggYi9wYWNrYWdlL3Z1bGthbi1zZGsv
dnVsa2FuLXNkay5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmYw
ZjNkYTBlNzkKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3Z1bGthbi1zZGsvdnVsa2FuLXNk
ay5oYXNoCkBAIC0wLDAgKzEsMyBAQAorIyBMb2NhbGx5IGNhbGN1bGF0ZWQKK3NoYTI1NiAgZDg2
YmNmMWFmZjQ5OWY0MWEzZTQ0NWI1NWRmNWUzOTNhNWNlNDliMWJkYTY4OWViNzMzNWIwYTBhNTRh
M2MwYiAgdnVsa2FuLXNkay0xLjQuMzEzLjAudGFyLmd6CitzaGEyNTYgIDMzYzgzMWY3NmI3OTUw
MTY2NWU2NmMyM2FjOGY4NzYwMjA0NTdjMjE2ZDQ0NTI2YThmNzQ3ZGE4OTc5OTliMzUgIExJQ0VO
U0UubWQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdnVsa2FuLXNkay92dWxrYW4tc2RrLm1rIGIvcGFj
a2FnZS92dWxrYW4tc2RrL3Z1bGthbi1zZGsubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uMDUwZjZjMDNmMwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvdnVsa2Fu
LXNkay92dWxrYW4tc2RrLm1rCkBAIC0wLDAgKzEsMTggQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCisjCisjIHZ1bGthbi1zZGsKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK1ZVTEtB
Tl9TREtfVkVSU0lPTiA9IDEuNC4zMTMuMAorVlVMS0FOX1NES19TSVRFID0gaHR0cHM6Ly9naXRo
dWIuY29tL3pldXgvdm9say9hcmNoaXZlL3JlZnMvdGFncworVlVMS0FOX1NES19TT1VSQ0U9IHZ1
bGthbi1zZGstJChWVUxLQU5fU0RLX1ZFUlNJT04pLnRhci5negorVlVMS0FOX1NES19MSUNFTlNF
ID0gTUlUCitWVUxLQU5fU0RLX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLm1kCitWVUxLQU5fU0RL
X0lOU1RBTExfU1RBR0lORyA9IFlFUworCitWVUxLQU5fU0RLX0RFUEVOREVOQ0lFUyA9IHZ1bGth
bi1oZWFkZXJzCisKK1ZVTEtBTl9TREtfQ09ORl9PUFRTICs9IC1EVk9MS19JTlNUQUxMPU9OCisK
KyQoZXZhbCAkKGNtYWtlLXBhY2thZ2UpKQotLSAKMi40Ny4yCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
