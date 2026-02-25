Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E040AF4BB9C
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 10:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7E8F614C9;
	Wed, 25 Feb 2026 10:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BnXeP85xMTuS; Wed, 25 Feb 2026 10:55:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0448060FCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772016952;
	bh=cX/l48kM3FzBE05eV2sAseIvhT2P8KZeanypXOFL2dk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QThaKDwdbDKXg++TuqNNJV7ScHER8xohBpeK/a1fO+Fhia6DYH5mKpjXLY/LMrS/L
	 KnUyMYSE3+jEZte40/hSETzyy/VGkzrAcL2N1NSf3bco2UAJ8V8VcdpXmMjCfqUf4N
	 p4OtBSvtPuarxxcC/IWDWXo/AcnvCinAbpNaucu0QkyBiqOBkp6nL6f98OeaLqNSJE
	 016ihyP73FdEEaJuHUOYnxpV0CYoM0KVQE6Ni1Q15ckKPS2g9er18IkUNbt49yGZGJ
	 Ib0gp5FveK6+zUaBCVc0zlGhCtAwHftEyh4oIZhj6soFjFiAMi5Iykx6cZUiAmN0a6
	 nUW8elI39FPvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0448060FCC;
	Wed, 25 Feb 2026 10:55:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 94B83204
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FD4D41E4E
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTSVy2iiEKFU for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 10:55:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::641; helo=mail-ej1-x641.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90F0041E6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90F0041E6C
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90F0041E6C
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:46 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-b8849dc12f6so943289966b.1
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 02:55:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772016944; x=1772621744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6ARVmGrFKYXwZLwlCVuKBky2CFtf/tzO/HRZaAfdTHU=;
 b=lz2ibVqhFIK2KTLKhdTyGR7TAkGC+WHYDeDW3XWMLWI0VqsQ78Pu4KTG38KnPHOH21
 /h+J/FtR5APSwx3ZFsmusCGnqw0npe73vfmtRgMmiFClO59QcniPdTnMYkYuVzNbrUU1
 szegVxlN71E7eTDbjEt4DAFf03QuZvzzuIPROSjhSLGFkLTY6rHwvqanieCx8116yx8K
 w3HLupflvnvGBY9C/OCxTOVqGzKrvhBaCjt81JV88KQCURNq6kSCh5jpvYfJSX1Q/u9s
 bbNIithanPljCXW7jtodOkgZJm9Jjmivg4vy9H1MuSNIwRMj7EyYv41r4H9a8gVDM1n7
 SNmg==
X-Gm-Message-State: AOJu0YzYdks7rmylnhdDuyNLoLmERmPbqE1vEBpfutPdkmz1obxvnTdR
 ENolpAgAg7T7yH9QddzG/8qPG5JXC/sbAAQIVrBQcQ3b4mWkpZoPEwyh6wiTMA3XJabtsVFqOjy
 MMDjp
X-Gm-Gg: ATEYQzyurYBy8Mfn8UHGwo4SZmwixKSfY/roFzg+Q20F1rmASZCtQggjQX7Ik1CSufa
 6ykmFmWCidAfVfEG46ymUN93aEcPvXegKzNdPzyXaRp6QmSl8uTPpJmePj+Z7VAsfFE//NDsoUz
 NXlP3dSsSAu42o8EMclxN0S4Zh4VMwxK9LmoaX4PdnMIoS6S4OGTyrWs7Duuc1T7NM3/G/7bQVx
 MJBT1C9LvLb7L3qjIcKVUjQcC0cq2mr9hlrtjItLdEYJmD624zRn3MjqAUnB+1Ut34rYqliJIRu
 Us2tVaVCb5nG0dcXhiQTduwS/HAaKRzdHnhriTtlDhVVJJxBcUbMN3OttRnqeGba3lahSxn3P3H
 uV5QgCzPtLRfii8srTjcAoIjtcMCmG7RbOLawwngPwXi6+2XaGgIqyaSA4H0QJ04XFvN/AE//gs
 3WnOHFxEEqA6foN8d4s++SG/g=
X-Received: by 2002:a17:906:e5a:b0:b87:6f58:a848 with SMTP id
 a640c23a62f3a-b9081c04dbbmr683940666b.51.1772016943889; 
 Wed, 25 Feb 2026 02:55:43 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9084e87c92sm512327066b.45.2026.02.25.02.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 02:55:40 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6ED035F8C1;
 Wed, 25 Feb 2026 10:55:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 25 Feb 2026 10:55:32 +0000
Message-ID: <20260225105537.1420002-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225105537.1420002-1-alex.bennee@linaro.org>
References: <20260225105537.1420002-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772016944; x=1772621744; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ARVmGrFKYXwZLwlCVuKBky2CFtf/tzO/HRZaAfdTHU=;
 b=W9RTYoY2Z08JBkEcLmFU3BshpVHYnX0GS+i3w33vYut4aJSPagXPFg0aAkNTEHBZ0g
 XFbkuHhBl4OTjFLqOr9SiHVnzEe76weOgkT2G2pFbFF6OwCi3eTj8c8FQu8Hb0kFDY1J
 8bABx1IYPoielyADCDbGs7lhyT/1uCB91Y2jWYWZlIsg3zu0ySJpAq1ZOEgq+fgS+5vE
 81B97Spgf/rsr/fIG7100zxphIDdRRDXSQksojJIQSSzV2Jz1Ov/yq2PFeivL/jZWZd+
 CdPYo5vmfjPum3b49BM/dieTn48b+AwHjkg1DbM9PAR/fTN358EuSibOPo8DxOnpNbEI
 ntqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=W9RTYoY2
Subject: [Buildroot] [PATCH v6 3/6] package/kvm-unit-tests: bump to
 v2025-07-31
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
Cc: Thomas Huth <huth@tuxfamily.org>, Thomas Huth <th.huth+br@posteo.eu>,
 Cyril Bur <cyrilbur@gmail.com>, Jesse Taube <jesse@rivosinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXBkYXRlIHRvIHRoZSBjdXJyZW50IHZlcnNpb24gb2YgS1ZNIHVuaXQgdGVzdHMuIFRoZSBtYWlu
IGNoYW5nZQpzaW5jZSB0aGUgbGFzdCBjaGVjayBwb2ludCBpcyBzdXBwb3J0IGZvciBrdm10b29s
IHRvIGxhdW5jaCB0ZXN0cy4KClJldmlld2VkLWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3Np
bmMuY29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIEh1dGggPGh1dGhAdHV4ZmFtaWx5Lm9yZz4KU2ln
bmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgoKLS0tCnYz
CiAgLSByZXdvcmQgY29tbWl0CiAgLSBtb3ZlIHRvIGN1cnJlbnQgbWFzdGVyIHNvIHdlIGNhbiB1
c2Uga3ZtdG9vbCBhcyB3ZWxsCiAgLSBkaWRuJ3QgYXBwbHkgdGhfaHV0aCdzIHItYiBhcyBtb3Zl
ZCB0byBtYXN0ZXIKdjQKICAtIGNoYW5nZSBmcm9tIHNuYXBzaG90IHRvIHYyMDI1LTA3LTMxCiAg
LSByZXdvcmQgY29tbWl0IG1lc3NhZ2UgYWdhaW4KLS0tCiBwYWNrYWdlL2t2bS11bml0LXRlc3Rz
L2t2bS11bml0LXRlc3RzLmhhc2ggfCAyICstCiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11
bml0LXRlc3RzLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11
bml0LXRlc3RzLmhhc2ggYi9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLmhh
c2gKaW5kZXggYWQwOTIyZGY1OS4uNmZiN2RlYTJjNiAxMDA2NDQKLS0tIGEvcGFja2FnZS9rdm0t
dW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5oYXNoCisrKyBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVz
dHMva3ZtLXVuaXQtdGVzdHMuaGFzaApAQCAtMSw0ICsxLDQgQEAKICMgTG9jYWxseSBjb21wdXRl
ZAotc2hhMjU2ICA2MDAxNWIwMjNmMzQyNjFjMTM0ZDcxNGY0NjcwOTI2YWM4MTQ4M2UyODZhMTY0
NzVlYjRhNWNlZGFiMDBlZWZhICBrdm0tdW5pdC10ZXN0cy12MjAyNS0wNi0wNS50YXIuYnoyCitz
aGEyNTYgIDgwNTJlMWY3MGJmYjNiMGM4OTRiOGVmNzFlMzg0N2Y1MzNiM2Q5NTcyNzdkZDA0YjMy
NzBmMzMzMzJkNDE3MGIgIGt2bS11bml0LXRlc3RzLXYyMDI1LTA3LTMxLnRhci5iejIKIHNoYTI1
NiAgYjNjOWNhOWUyNTdmMmVhYWUwNzBjZjBjY2RmODc3MDc2NGYwNWE5NDdhMzlhODM1ZTYzMzQx
Mzc1MGE1Nzc3YiAgQ09QWVJJR0hUCiBzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRk
OGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIExJQ0VOU0UKZGlmZiAtLWdp
dCBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsgYi9wYWNrYWdlL2t2
bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rCmluZGV4IDFlZDkwMmIxYTAuLjFkN2VlYzJk
MjEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsK
KysrIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tawpAQCAtNCw3ICs0
LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUtWTV9VTklUX1RFU1RTX1ZFUlNJ
T04gPSAyMDI1LTA2LTA1CitLVk1fVU5JVF9URVNUU19WRVJTSU9OID0gMjAyNS0wNy0zMQogS1ZN
X1VOSVRfVEVTVFNfU09VUkNFID0ga3ZtLXVuaXQtdGVzdHMtdiQoS1ZNX1VOSVRfVEVTVFNfVkVS
U0lPTikudGFyLmJ6MgogS1ZNX1VOSVRfVEVTVFNfU0lURSA9IGh0dHBzOi8vZ2l0bGFiLmNvbS9r
dm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy8tL2FyY2hpdmUvdiQoS1ZNX1VOSVRfVEVTVFNf
VkVSU0lPTikKIEtWTV9VTklUX1RFU1RTX0xJQ0VOU0UgPSBHUEwtMi4wLCBMR1BMLTIuMAotLSAK
Mi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
