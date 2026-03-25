Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69F9106B53F
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 13:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DC4A838D7;
	Wed, 25 Mar 2026 13:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Glp80AAO3CK; Wed, 25 Mar 2026 13:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A3C982323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774446336;
	bh=7l/HomPj6r42JquLutPNgo9zF7hX3777dNHstLR6HfA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gbgQrCC+H9JyW6cw7DjV35fBkUwUgeIr84sSE8M+TK/4QyCFNjcsCkRbAX5hsvK1/
	 w7LohVJaQ8YBkUoahK7zRT+/tJF2OhBBOiwQRbEDodtKvIBuVy6AoGVyLFlh/oAVOB
	 J1/yRe2L5U6WvcvLeK7GXeKJWMi5Ew++8t1SsqGzxRBgtn/Hrdua+3HXSBafJc3yDO
	 40XYpbxZGc5Cc8LqSwkFacEhtkZQH8zq281b2BN7K3mFB61yM6m/wN8SN+lGtcJ1Tq
	 QpF1l5pIvjU1grYUEieBg2ibkoILmkzWqGHPz70AR5YUipIJw/q0aA6XGiImRbyoBi
	 MmuzVw2eJxU7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A3C982323;
	Wed, 25 Mar 2026 13:45:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C5E2353
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D9796133C
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2C4VTn9dx8oQ for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 13:45:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 52D776133B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52D776133B
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52D776133B
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:45:33 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-38bd3c6c502so34106921fa.1
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 06:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774446330; x=1775051130;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=V23iQh438gYra4kq50n7Uj6vH0vISk3b6PA+ZgfA1/U=;
 b=o6zWSWb9gUBnqxLlDIjY30gPvS6fE2CDx2tjWrGSCuY3+4rabA/k/TWAQOlTW4/nfk
 lmLqrGnhkNwriPHB4b+JzK1ETA5D0y90TZaAP9lxxvu5BhpJm+JSA4SEXypA/NHZSwiF
 9kLbTJJZgeuRRy+kbBX3D1aJVgVUS831ReqACViJaUaza/U1iGG1OJZj0SVwwc7j3Tnz
 ZqCZersnKL/Xcb9yehih5zu18Uq8XGMQgLJcUMs21Qm54YJQGJXZT4lNB9BFL4IcZ4k6
 I2pnxxI2L32qmn6PCeJ2u8GkIKLZ8fYpNdGMZMqouSFQmtcHyibF4OJTYKpL2i2dpvfu
 KLTg==
X-Gm-Message-State: AOJu0YwI+rl7B1L/m2QK+0HZulVXtN0TVz8GcxTyC03oES0pqe1SecSN
 2/AlNVbOhlw1ngSqeuwtfxTMQv6rL+Dl6sonoj7by6q5qltpoPpXqxB8oioNLg==
X-Gm-Gg: ATEYQzwC3ZF4CD3EpeHt/nViZu5+LqcmZRbeVmUxu/WjQchMLPJG66RgdyxHBHaU4UL
 qSlP0ViSpV5M4YtaaZ3KdFl6lPkYtdDmWATeueDUw5qS0VSkJBNEkyVAl+Nt53nuHUjDDCM6yQj
 art3N4oUxP4+fOOLKvYTJWDyMrsxFcx+TkwtauUK0L1qnPfFuP6NgpDqt249CisVEjb9Z3h3JJ8
 PUdEJjZGTcHiI19fBdi6V/JJ0xuLjNfxOuC0ypkOTwfBX6yIXna2TuHAwdk1PAPJnzJ9e2M/0HV
 cr2RjOA4RkKuyMkekeIXM904sHP7AGA0fLipTGg2KRhGldipxolx+gFwOCMa1ArwBQPRUowoYPo
 WeSPHwAc3u+Eq41rAO32aE16/9EYyVcORR3hc+uh2TWggmqQdDP1k0Z0OsjQFMgsyGYhyqNEjWQ
 iMAiSlR+/Q8IlwbFqVG9byOJMyYT92BDOqGirLxvWKvP0hornGaPEeE6Z+1fo=
X-Received: by 2002:a2e:ab10:0:b0:38c:d2:9d82 with SMTP id
 38308e7fff4ca-38c4302ba65mr13035731fa.9.1774446329941; 
 Wed, 25 Mar 2026 06:45:29 -0700 (PDT)
Received: from tollan.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38bf9ac220csm35659911fa.36.2026.03.25.06.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 06:45:29 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Wed, 25 Mar 2026 14:45:26 +0100
Message-ID: <20260325134526.3550234-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774446330; x=1775051130; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V23iQh438gYra4kq50n7Uj6vH0vISk3b6PA+ZgfA1/U=;
 b=f1cxf4zLJScO8cuLvcTtMJ5n9LGS9ZoA6Udkiyl6GTvdBkLXvqi7Yt8WsLuuk13i/y
 Lr9olfPaRxkJg56q/MjoypYb2sJYmBDEQNGQvChu4gmlpA8JkPzcZo3RhGDOzpIygcPH
 qtoZIOecQ3LorV+qUAQiQiVyazklWsZP6zV2qHsbNv9Yh6NNBN42mCd47AmEbNOPsLVI
 CNQP0WTpKMN33G6Ur2DVVJZ3DuPGo9uSjUmRsz64JVnAq37bNmdSU1Z5e9fIjg08x5oh
 5nyOe2atxgLdhYCeji03q/q9YihRWT52a3GkLMNr4O9lXJPnLdXlADQmG7rCJaITOwd8
 nRHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=f1cxf4zL
Subject: [Buildroot] [PATCH 1/1] package/nghttp2: security bump to 1.68.1
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

VGhpcyBmaXggQ1ZFLTIwMjYtMjcxMzUKClNpZ25lZC1vZmYtYnk6IE1hdHRpYXMgV2Fsc3Ryw7Zt
IDxsYXp6ZXJAZ21haWwuY29tPgotLS0KIHBhY2thZ2UvbmdodHRwMi9uZ2h0dHAyLmhhc2ggfCAy
ICstCiBwYWNrYWdlL25naHR0cDIvbmdodHRwMi5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9u
Z2h0dHAyL25naHR0cDIuaGFzaCBiL3BhY2thZ2UvbmdodHRwMi9uZ2h0dHAyLmhhc2gKaW5kZXgg
MzBjMmM5MDc4ZS4uNmFmN2IzZWVjYiAxMDA2NDQKLS0tIGEvcGFja2FnZS9uZ2h0dHAyL25naHR0
cDIuaGFzaAorKysgYi9wYWNrYWdlL25naHR0cDIvbmdodHRwMi5oYXNoCkBAIC0xLDMgKzEsMyBA
QAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgNTUxMWQzMTI4ODUwZTAxYjViMjZlYzky
YmYzOWRmMTUzODFjNzY3YTYzNDQxNDM4YjI1YWQ2MjM1ZGVmOTAyYyAgbmdodHRwMi0xLjY4LjAu
dGFyLnh6CitzaGEyNTYgIDZhYmQ3YWIwYTdmMTU4MGQ1OTE0NDU3Y2IzYzg1ZWI4MDQ1NTY1N2Vl
NTExOTIwNmVkYmQ3Zjg0OGMxNGYwYjIgIG5naHR0cDItMS42OC4xLnRhci54egogc2hhMjU2ICA2
Yjk0ZjNhYmMxYWFiZDBjNzJhN2M3ZDkyYTc3Zjc5ZGRhN2M4YTBjYjNkZjgzOWE5Nzg5MGI0MTE2
YTJkZTJhICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL25naHR0cDIvbmdodHRwMi5tayBi
L3BhY2thZ2UvbmdodHRwMi9uZ2h0dHAyLm1rCmluZGV4IDNkYjQ4ZTczMjMuLjUwYjk0NTgyZTEg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbmdodHRwMi9uZ2h0dHAyLm1rCisrKyBiL3BhY2thZ2Uvbmdo
dHRwMi9uZ2h0dHAyLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAotTkdIVFRQMl9WRVJTSU9OID0gMS42OC4wCitOR0hUVFAyX1ZFUlNJT04gPSAxLjY4LjEK
IE5HSFRUUDJfU09VUkNFID0gIG5naHR0cDItJChOR0hUVFAyX1ZFUlNJT04pLnRhci54egogTkdI
VFRQMl9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL25naHR0cDIvbmdodHRwMi9yZWxlYXNlcy9k
b3dubG9hZC92JChOR0hUVFAyX1ZFUlNJT04pCiBOR0hUVFAyX0xJQ0VOU0UgPSBNSVQKLS0gCjIu
NDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
