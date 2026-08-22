Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB120C5DF94
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 00:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 737EB409BB;
	Sat, 22 Aug 2026 00:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rv4aDJ7g-1P3; Sat, 22 Aug 2026 00:37:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787359037;
	bh=elM3JaAQtuPKJlT9GpSLiEgNTNjht8F7L6Vhas3TUZk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cCnKf/QafkscaiG97EZiyt36aDszttpdiRwkBzNnMPwc30zAokAoG4obBWa/UetEp
	 z8pmxpKHJx/uyyttrVgHgy0kWdtFYKsxkYu/3V3F8vKILKm8rhkDaFBh3+qh+8qLYU
	 RqArmB/s0qRzWoYT1nn1IOAz4s+j89PxjkgPdKgREOyYscnoQ0IVWcNWNL1qJmQ12t
	 3nma7ZjBzCaT5ue9j+faRZz/vzxeWKG2wZoyd9JE5/ooRUEe/tqQU6LU7fNzpxCHuV
	 ubIe37KN5HtGUnq8gMFcgIn9hh50K02YC3R70iyqDryzVJ2A72Mu2LO+06uCyMTkTI
	 kBILj4LlAbh3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44E0B409B3;
	Sat, 22 Aug 2026 00:37:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF9AB476
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 00:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7530400FB
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 00:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgYnZte9daOc for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 00:37:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=f1mHrBxu
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A46E540085
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 00:37:12 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-476a130c138so1578715f8f.0
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 17:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787359030; x=1787963830; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=DM5R6uXpvraLM4KDu+gyxJGZA+zyGo5dI+n4RLQgca8=;
 b=f1mHrBxuIABH1QHSro4epU1MnKr/rEX5VZjJFCUU6Zqcbh2AcTtLosvHhjMAjEeYoL
 N9RDuot/zidKNmnQO4qh4YPBBBpWZU3IWIDMj+XAdtNCphRG8LrDXUlhff14WxpFFZol
 R2MKdI+yBLHxiRMUyl0WBpYp5SnNogD1Tn35M4meIRarxbpduTV0EHlyF1WYYYf48si2
 HQ+pP9pUq+LGgZV2EQW7nzgj3T6Up1n6MhiZ2CA//DCDTtug5X/cRLtB1h327mcAuoEE
 ki8UCyf/BScphgxB89gfQs8VHiEd/LZXSfy/aQRypbRc/SfKO4VQrZWxcL+nuc4sKpmn
 mnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787359030; x=1787963830;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=DM5R6uXpvraLM4KDu+gyxJGZA+zyGo5dI+n4RLQgca8=;
 b=fOmFKahISTK+E0Vb6QUNh5wlvaHhmnK7vkTLCKkmG/JcFhWVGeURE75BdudhjmCsNt
 9MVwJAkdwm1zZl7gn0HF1MKamRBnlvzpSv4LMzPkSJletUKHHELDYMuXItNdfjD3ABwE
 XlOFHp3nAJkiT3aWzrIJSYcaQOK8AMWlDZRb7zdTCDAJeQy4swsIKe2Lp1jJF44fW+MY
 dJES46ZwA0Y2O9N5BgbYNQaDo+m+Zm5Wpa1p77w8lPDt99sdXeRPUxB2BlgJmcavtv2F
 u6jS4ElEtLQdwCTH/WX1/9b9WNk1McIma3/aAUpMXSg8ks+asdFMbX1YG2UMC0KdkEZw
 WT7Q==
X-Gm-Message-State: AFuF++mjeeVFjgNZCV+Zlj/2+ZfbQKXfLK/38CQm8ghq3eYU9NM96qWe
 Z8m5yHaxcnrUhOaqu7LpRvcBJomrrcSMbQxCsg3En+5qu0gneyNJYn+/nq+TdA==
X-Gm-Gg: AR+sD1133G5peU9mKBtRYYNLZY9AHpvO+QP3A0hvZ3xIWZVG38hioC9y2WXk7/KOzKC
 oreY+HYn8AISIsxprRCZPG3PDMrajgPPEs3FXxPkAafpMehXM/duntmDOCYSpYpw45+chiWtsD1
 oZd1rqOP4A7ladSTTehV+58SIdrzF7PdlC5Fw2IiqrhS3E1OYM+8AcI3bFm6LX/Nr9t/v2X0G6j
 z7Di4J9DIywMmo8sW+vnlb2hHP0mQ/fUTsvC6/KiUtgdOkk2dvvk0AW22vP8OIH5L1ZUDTgwH+J
 JGzJsdATxHzB3eIvBjcSOm28kbYMcTpkrOANPrl1g0l1nop1wEaGzDJBxCM83e4hd8VJ4ljKRIM
 8qQO2IkkC2T6srp0oBlgkXSj5UOzcqwJuOmu/C7l0uRMtPiOdEKyCC6uv4c8c7v7WJeUZJoB3m8
 F6ajoTgMgUCtT7EEth0A/NcvG/hnEi0cM1u3uK7XKGwiGovbp0X5GwBR+CntMI5OPTFQC4mUQ2O
 SToZhgFP4J5TsmsR5sM2mYPzSBbAR8vbA2UUl+0mc59fkX7mYLrB8Uu27szPWZViJw6hxkMVMLz
X-Received: by 2002:a05:6000:2f84:b0:482:bf78:300a with SMTP id
 ffacd0b85a97d-482c0ba4732mr13622929f8f.17.1787359030299; 
 Fri, 21 Aug 2026 17:37:10 -0700 (PDT)
Received: from cuervo.intranet.jlsalvador.online
 (249.85-87-140.dynamic.clientes.euskaltel.es. [85.87.140.249])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482c9c0acaesm477011f8f.29.2026.08.21.17.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 17:37:08 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Date: Sat, 22 Aug 2026 02:36:38 +0200
Message-ID: <20260822003637.1732254-2-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.4.4
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

Rm9yIHJlbGVhc2Ugbm90ZSwgc2VlOgpodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVs
ZWFzZXMvdGFnL3pmcy0yLjQuNAoKU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBS
dWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+Ci0tLQogcGFja2FnZS96ZnMvemZzLmhh
c2ggfCA0ICsrLS0KIHBhY2thZ2UvemZzL3pmcy5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96
ZnMvemZzLmhhc2ggYi9wYWNrYWdlL3pmcy96ZnMuaGFzaAppbmRleCBhYThhZjhiOGMzLi5lNWM1
MGFkMTQxIDEwMDY0NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMuaGFzaAorKysgYi9wYWNrYWdlL3pm
cy96ZnMuaGFzaApAQCAtMSw1ICsxLDUgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3Bl
bnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuNC4zL3pmcy0yLjQuMy5zaGEyNTYuYXNj
Ci1zaGEyNTYgIDFmMDhmMmQxNTRmNTE4OWI1ZjEzODI4NDhhMzI2NjdiM2QzNDA2NjE0NWI0NzRj
NDljZDNkNDFhNWZiYTU5YTcgIHpmcy0yLjQuMy50YXIuZ3oKKyMgRnJvbSBodHRwczovL2dpdGh1
Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuNC40L3pmcy0yLjQuNC5z
aGEyNTYuYXNjCitzaGEyNTYgIDJhM2M3MGQ1NWEzN2NjNzE2MThhOTVhNjBlODFhZDY2NTMwMjAx
ZWIxMThkMzc3NDFkYzkyZWZjZjg0OGM4YjEgIHpmcy0yLjQuNC50YXIuZ3oKIAogIyBIYXNoIGZv
ciBsaWNlbnNlIGZpbGVzOgogc2hhMjU2ICAxZmZiNzBjMzNjNGY3OWYwNGU5NDdmYWNjNWM3ODUx
ZjI4OTYwOTI1NmFhY2I0N2ZjMTE1ZjcwMDQyN2Q5NTIwICBMSUNFTlNFCmRpZmYgLS1naXQgYS9w
YWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMubWsKaW5kZXggMmNkZTY4MzA3ZC4u
MDcxNTU3YmYzZSAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZnMvemZzLm1rCisrKyBiL3BhY2thZ2Uv
emZzL3pmcy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAK
LVpGU19WRVJTSU9OID0gMi40LjMKK1pGU19WRVJTSU9OID0gMi40LjQKIFpGU19TSVRFID0gaHR0
cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0kKFpGU19W
RVJTSU9OKQogWkZTX1NFTElOVVhfTU9EVUxFUyA9IHpmcwogWkZTX0xJQ0VOU0UgPSBDRERMCi0t
IAoyLjU1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
