Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A42C369A1
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 09:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B347F61153;
	Tue,  8 Apr 2025 09:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mUMtgHme-5A; Tue,  8 Apr 2025 09:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E062360750
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E062360750;
	Tue,  8 Apr 2025 09:42:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CC061F1
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 09:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8109E82C3C
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 09:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kG62E86hibQU for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 09:42:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7102A810E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7102A810E8
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7102A810E8
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 09:42:24 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ac2bfcd2a70so708117666b.0
 for <buildroot@buildroot.org>; Tue, 08 Apr 2025 02:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744105342; x=1744710142;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vrS82XfCmo5CqgTyGidLhEth/ou4fDpZjgiglh7oeH8=;
 b=Wfpq+nFcGtZwqTVer1VdMNtujoZjI5BGWq16QdEzU0/vMOTfSrJXaxCxndHkXJuZMi
 ieW4eNkN/V1PEj4OnUIQVCGI1emsJ6TQTsEuAMNN3fEHS3N+OQ5quTo+jKKjmD6f2CrN
 8ssUR59CDwQP9bQz3F8lCZdaIOK5CoRiryGIvvOfm0JHSjUfKyvrDIHUjg/ATlqTm38C
 OKCEhDGpZuI69UR2cUDOEkOUCaiX+UhQdXC7EsuJgeb3nHuBCGDFZosxGBC90hN6LHZU
 i2DcEGPXlUJJ7OMLtY64p1qF9cyvIUjdMgMnusljdGNxs09TInJMD65tYVVvoZksGbQU
 H2qA==
X-Gm-Message-State: AOJu0Yxo/15EaejkbBqUxSpam3fgcOdjfjyBqzi6FwD377uSwewYgTUu
 cJq7UElY9EDWEtAq16MmFL6AtqWmt4Fa8yfrRFtyeEhhqlHsVEN50cPdsI4w
X-Gm-Gg: ASbGncsS9BywEHEeROLvtzNe2albYPz/2gOtaUsJ++0lurnafelqh/6U2ZZTHAztwcW
 wddJqtQwwa0xQkoEwTrzX1hXZExQFefER0Go6Qn///Qeqf0LJ66CLpR1146+kxU+IYay3337c/a
 4etiRfWFWoRMjZYQKBkxQquXSV4nmQxvzJ+bfkLc6mZm0uNXyBB1HLqowWg9yDvwGO5OFdMiRYj
 C8xBvBIP977j907sU2UCUHcrJlduuAhO28mdLyRy8jNsZ6XRno4DxTllO+2PwebSFbWRxxRbWYj
 1S1yFYXwZGyNFmYoTwEDcbZuUCaZ/4jpXUU8NizPtowVd01bZler6cP7KG8mJvJHUiHv7UNLmM8
 17FIn
X-Google-Smtp-Source: AGHT+IFqt15HunmYdsmaSovDMkjBzwBLDcd6n6hUN1/oDLeOA17aIDW6ZcdKKd9J+mUavGhEow+KkQ==
X-Received: by 2002:a17:907:2d86:b0:ac3:422b:a834 with SMTP id
 a640c23a62f3a-ac7d177488cmr1371096566b.21.1744105341493; 
 Tue, 08 Apr 2025 02:42:21 -0700 (PDT)
Received: from tollan.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c018b26asm903435966b.146.2025.04.08.02.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 02:42:20 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Tue,  8 Apr 2025 11:41:58 +0200
Message-ID: <20250408094158.3725214-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744105342; x=1744710142; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vrS82XfCmo5CqgTyGidLhEth/ou4fDpZjgiglh7oeH8=;
 b=CArTsi/7HD2MOltqw0E0fWCMow5umJmN5uqVOYiEkCULGl3Frg2SUJd8uE07FjJJeu
 /oOpL77I4pVRVXJhE3ikbZvKBJYHFlruRB3oCPwFiufSSEuGATIyT81hM2c6InnGb8eq
 tOFLu0hrRvfYvagLe4iKPlhs6FC4PTuwpIZVm3rQU7DcUpfYfAzhgqh0/6HcdVq7+9kG
 Vlnn7kwaZ933tq7Gl23m+noi6IOS7fdTKqe6jbO7XH0Ed8qYVoAD9YWySsqwfHfJ17wL
 2Yf9r7TMszQ9vV81ITx9kKi2/rKYOmA8S0jyp33J0+j2CDYlWzOk0l4gmOXYz1QQ2Vfj
 mbCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CArTsi/7
Subject: [Buildroot] [PATCH 1/1] package/ethtool: bump version to 6.14
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

Q2hhbmdlbG9nOgpodHRwczovL3dlYi5naXQua2VybmVsLm9yZy9wdWIvc2NtL25ldHdvcmsvZXRo
dG9vbC9ldGh0b29sLmdpdC90cmVlL05FV1M/aD12Ni4xNAoKU2lnbmVkLW9mZi1ieTogTWF0dGlh
cyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+Ci0tLQogcGFja2FnZS9ldGh0b29sL2V0aHRv
b2wuaGFzaCB8IDMgKystCiBwYWNrYWdlL2V0aHRvb2wvZXRodG9vbC5tayAgIHwgMiArLQogMiBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9ldGh0b29sL2V0aHRvb2wuaGFzaCBiL3BhY2thZ2UvZXRodG9vbC9ldGh0b29s
Lmhhc2gKaW5kZXggNmZjMGMxM2QzYi4uOTVjYzE0YzQ5MCAxMDA2NDQKLS0tIGEvcGFja2FnZS9l
dGh0b29sL2V0aHRvb2wuaGFzaAorKysgYi9wYWNrYWdlL2V0aHRvb2wvZXRodG9vbC5oYXNoCkBA
IC0xLDUgKzEsNiBAQAogIyBGcm9tIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL3NvZnR3YXJl
L25ldHdvcmsvZXRodG9vbC9zaGEyNTZzdW1zLmFzYwotc2hhMjU2ICA4ZDkxZjVjNzJhZTNmMjVi
N2U4OGQ0NzgxMjc5ZGNiMzIwZjcxZTMwMDU4OTE0MzcwYjFjNTc0Yzk2YjMxMjAyICBldGh0b29s
LTYuMTEudGFyLnh6CitzaGEyNTYgIDkzMzhiYjAwZTQ5Mjg3OGQzYmJlM2NkMjg5NGU2MGRiMzU4
MTM2MzRjMjA4ZGIwYjIwZjVjN2VlODRkYTY5YjEgIGV0aHRvb2wtNi4xNC50YXIueHoKKwogIyBM
b2NhbGx5IGNhbGN1bGF0ZWQKIHNoYTI1NiAgODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5
ODZjNjc1YWZiNTE0ZDRlNjhhNDA0MDEwNTIxYjg4MDY0MyAgQ09QWUlORwogc2hhMjU2ICA1ZDYz
MjkzNDM5NmY5MGM4MmRmZWJlM2M5NTEyNjQ4YmJiNjMzM2I0MDYxMTNkMGNkMzMxYjBlMGFhMmQz
NGExICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL2V0aHRvb2wvZXRodG9vbC5tayBiL3Bh
Y2thZ2UvZXRodG9vbC9ldGh0b29sLm1rCmluZGV4IGZjMDYyMmMwNGEuLjY1NGZjNDAxYjcgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvZXRodG9vbC9ldGh0b29sLm1rCisrKyBiL3BhY2thZ2UvZXRodG9v
bC9ldGh0b29sLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
IAotRVRIVE9PTF9WRVJTSU9OID0gNi4xMQorRVRIVE9PTF9WRVJTSU9OID0gNi4xNAogRVRIVE9P
TF9TT1VSQ0UgPSBldGh0b29sLSQoRVRIVE9PTF9WRVJTSU9OKS50YXIueHoKIEVUSFRPT0xfU0lU
RSA9ICQoQlIyX0tFUk5FTF9NSVJST1IpL3NvZnR3YXJlL25ldHdvcmsvZXRodG9vbAogRVRIVE9P
TF9MSUNFTlNFID0gR1BMLTIuMAotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
