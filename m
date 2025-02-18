Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E089C021AA
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 22:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A98961094;
	Tue, 18 Feb 2025 22:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gcyxFqvpGLn; Tue, 18 Feb 2025 22:12:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34BCE610AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34BCE610AE;
	Tue, 18 Feb 2025 22:12:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8862CC8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 22:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 693AA40D5F
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 22:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SPBrRpCP7Flv for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 22:12:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B72B40D50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B72B40D50
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B72B40D50
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 22:12:38 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4398738217aso23678515e9.3
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 14:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739916756; x=1740521556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UBblotqftZXQcH2pa7HpigwOVFLXfdc6rd4R0RDB+ZY=;
 b=P7iYP6jV7AcDezpZ0OvVB6FjVk/PR3UVrgroOT6y5C2rZHBuhJfCjxXSXxq++9fkSu
 8/z+wwU8QI2sLcHJF4jBXjUQ3CyQkt3F9gx71IpZ4lG8isWJ7V1SCaFKRLR1GGSS2aFD
 TliCksQ7OVpfjd6AmaoSWxesRP/KsJbaWuEwi5y/eUTPvA8eKsLhf1fciryVjlXO5MV3
 hack3WypdKIEWF4PUv4x33W3HcR68u+8sv8PA5ElFJwBXRGNQ38taFb8BfaW5HFy2k7A
 OcvnLkMrw8laAJJ2nf+RWah3oemOiyYDONhsuIrKBQjFvUiN3gvdTeJIoobTtuuucuGR
 MgGQ==
X-Gm-Message-State: AOJu0Yy+KPk4R3FxCu8/lzkkvYuRed2xjRJzxeSgA6s23ktvHRHvP6IE
 rAIX8QAeo60CqEms82eLjzgDX/qS760l+YZxIyVvIma95XNfWcvGjx5c74kN0a9LT6Ev7vM0pFr
 LWdvSEg==
X-Gm-Gg: ASbGncvNsT11DXELg10ClbIIUdxgdVy+ssSXXF7tU0Qfy6FqHPR5wXSpG0pSvTHFJmb
 hS1GBM371t2FMZs3QYmSuQBVFQ6e62FMaQwFDtLHkDzHhhSQ4VXGVLV0MCY3OX+tugUPVqcg8Mn
 WolQnvUXq8V5HZBWCXFPnjkTu3zNV2JzoQun35C3Bp0T+5/J1WJxcA0R6UtMbmS++aV8ZFyp2T8
 ZZiKXWR/fBlGdHo+PS/L5HDGBYUe6x9DISOHkd62+tc4Ctfs1RcJRCsfLO9GTcebpKO2P2yTkqd
 Rko2NXFxoduPlnrD84rvbG3VnKWG57GQAQ==
X-Google-Smtp-Source: AGHT+IF+JLCRHVZsHlo22GFJ6+SD7rP0woK9sOY4/IKVhjLk3BVxkRrbg4bDNjmh12dN7BP7bLuUXw==
X-Received: by 2002:a05:600c:3ba6:b0:439:9543:9488 with SMTP id
 5b1f17b1804b1-43999dd1f1dmr10524365e9.21.1739916756161; 
 Tue, 18 Feb 2025 14:12:36 -0800 (PST)
Received: from debian-hp-1.my-cloud.eu ([91.26.90.210])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439872b5a46sm62047975e9.32.2025.02.18.14.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 14:12:35 -0800 (PST)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Tue, 18 Feb 2025 23:11:42 +0100
Message-ID: <20250218221145.140519-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739916756; x=1740521556; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UBblotqftZXQcH2pa7HpigwOVFLXfdc6rd4R0RDB+ZY=;
 b=MnqxrKwhz7rSGVCLATd18+XTFbgRRbCq6Ssvt19aTPipnzAofxJ5h72iWpswkEyHDy
 fwJqD3M/+JhkUVsxwwm6tqSW4oiAZ3wl6TKHLmaI6cT7Uj6Y6T9N6vnR0+eG7L2nnQhN
 51mM2DyUevYaJf1XQr3MKi0spdNnZE7gS/ihyv0ChVsl72i1qoA0tUmQK3ALlALivlMs
 nCynVoBtTyPwOpnzgyKj5U3uQK97X64R8lF3Vn/Wr9vUg/CxGsa74VVFSgWWlhY7S/yd
 tsPGr04NzS9Xw6rQyBl0NdLrcPLFt26pccFPx5YBGlcI1OCZsz3Y/RyMi8UFBiXg0awV
 pO6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MnqxrKwh
Subject: [Buildroot] [PATCH 1/1] package/jbig2dec: bump to version 0.20
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U3RhcnRpbmcgZnJvbSB0aGlzIHZlcnNpb24gbmV3ZXIgcmVsZWFzZXMgYXJlIG9ubHkgYXZhaWxh
YmxlIGF0IGEgbmV3CmRlZGljYXRlZCByZXBvc2l0b3J5LCBzbyB0aGUgc2l0ZSBpcyB1cGRhdGVk
IGFjY29yZGluZ2x5LgoKSGFzaCBmaWxlcyBubyBsb25nZXIgZXhpc3QgaW4gdGhlIG5ldyByZXBv
LCBzbyByZW1vdmUgdGhlIHJlbGF0ZWQKY29tbWVudC4KCkl0IHR1cm5zIG91dCB0aGF0IGluc3Rh
bGwtc2ggaGFzIGJlZW4gYXZhaWxhYmxlIGluIHRoZSB0YXJiYWxsIHNpbmNlCnZlcnNpb24gMC4x
OSwgc28gcmVtb3ZlIEpCSUcyREVDX0FVVE9SRUNPTkYuCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOr
bCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogcGFja2FnZS9qYmlnMmRl
Yy9qYmlnMmRlYy5oYXNoIHwgNCArLS0tCiBwYWNrYWdlL2piaWcyZGVjL2piaWcyZGVjLm1rICAg
fCA2ICsrLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9qYmlnMmRlYy9qYmlnMmRlYy5oYXNoIGIvcGFja2Fn
ZS9qYmlnMmRlYy9qYmlnMmRlYy5oYXNoCmluZGV4IDVhMzRhZjM3ZjYuLmU5NjY0Yzg0NTAgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvamJpZzJkZWMvamJpZzJkZWMuaGFzaAorKysgYi9wYWNrYWdlL2pi
aWcyZGVjL2piaWcyZGVjLmhhc2gKQEAgLTEsNyArMSw1IEBACi0jIGh0dHBzOi8vZ2l0aHViLmNv
bS9BcnRpZmV4U29mdHdhcmUvZ2hvc3RwZGwtZG93bmxvYWRzL3JlbGVhc2VzL2Rvd25sb2FkL2dz
OTUzMC9NRDVTVU1TCi0jIGFuZCBTSEE1MTJTVU1TIGFyZSBtaXNzaW5nIHRoZSBoYXNoZXMgZm9y
IHRoaXMgZmlsZS4KICMgTG9jYWxseSBjb21wdXRlZDoKLXNoYTI1NiAgMjc5NDc2Njk1YjM4ZjA0
OTM5YWE1OWQwNDFiZTU2ZjZiYWRlMzQyMjAwM2E0MDZhODVlOTc5MmMyNzExOGEzNyAgamJpZzJk
ZWMtMC4xOS50YXIuZ3oKKzdiNjNmZjY0NzAyODk1NDdlN2EzYTBmMTQ1Y2I4ZWE2YzJhZmZmZGQ2
NTY0NWI3ZDg3ZDNiN2ZlYmM5NmZiM2EgIGpiaWcyZGVjLTAuMjAudGFyLmd6CiAKICMgSGFzaCBm
b3IgbGljZW5zZSBmaWxlczoKIHNoYTI1NiAgMWJmNTI1OGFmZTQ1MzkzNDQ4NGZkMGNlYTk3NTA4
YjcyMzAxNjMzYTZhNzhiMGFlOGE5ZWU0NGFjNzhmMjZkOSAgTElDRU5TRQpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9qYmlnMmRlYy9qYmlnMmRlYy5tayBiL3BhY2thZ2UvamJpZzJkZWMvamJpZzJkZWMu
bWsKaW5kZXggOGQ4ODExMzZhZC4uODUwOWE2MDljNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9qYmln
MmRlYy9qYmlnMmRlYy5taworKysgYi9wYWNrYWdlL2piaWcyZGVjL2piaWcyZGVjLm1rCkBAIC00
LDE0ICs0LDEyIEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1KQklHMkRFQ19WRVJT
SU9OID0gMC4xOQorSkJJRzJERUNfVkVSU0lPTiA9IDAuMjAKIEpCSUcyREVDX1NJVEUgPSBcCi0J
aHR0cHM6Ly9naXRodWIuY29tL0FydGlmZXhTb2Z0d2FyZS9naG9zdHBkbC1kb3dubG9hZHMvcmVs
ZWFzZXMvZG93bmxvYWQvZ3M5NTMwCisJaHR0cHM6Ly9naXRodWIuY29tL0FydGlmZXhTb2Z0d2Fy
ZS9qYmlnMmRlYy9yZWxlYXNlcy9kb3dubG9hZC8kKEpCSUcyREVDX1ZFUlNJT04pCiBKQklHMkRF
Q19MSUNFTlNFID0gQUdQTC0zLjArCiBKQklHMkRFQ19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQog
SkJJRzJERUNfQ1BFX0lEX1ZFTkRPUiA9IGFydGlmZXgKIEpCSUcyREVDX0lOU1RBTExfU1RBR0lO
RyA9IFlFUwotIyB0YXJiYWxsIGlzIG1pc3NpbmcgaW5zdGFsbC1zaCwgaW5zdGFsbC5zaCwgb3Ig
c2h0b29sCi1KQklHMkRFQ19BVVRPUkVDT05GID0gWUVTCiAKICQoZXZhbCAkKGF1dG90b29scy1w
YWNrYWdlKSkKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
