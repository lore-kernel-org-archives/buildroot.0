Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8D5C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 14:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C3E760E24;
	Tue, 22 Apr 2025 14:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93r8gIujEWAW; Tue, 22 Apr 2025 14:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8293960BEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8293960BEC;
	Tue, 22 Apr 2025 14:19:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D17868
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3368B400B8
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65xvbIqcCiLi for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 14:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=mickael.tansorier@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34CAF4053D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34CAF4053D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34CAF4053D
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:19:50 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43d0c18e84eso24514355e9.3
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745331589; x=1745936389;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CUX7tgTNYSWazHOswQ+A+GwjfRZTpoWe379BWc5zSb0=;
 b=mesyiNezGVuzD4NtO5R8NXjfcqqE9VMoZzTPm/zBklS/BcO2wh8+/BcTExdxLpG5ms
 W8PSNx3fQoukyw/PxaaKKWE1v/oA3INcIrNjTeTlKPjqB4dJNdUZOOejMfz4E31/2LbT
 4OF1lvLOBKH60BVLgV5br3FdxuoyiROyoqBXEL9IcGqjk8+lYNEiTaeRDB3VmgxPu8T4
 k+OQBwcPO4NWyRfPTog5pu3/ssbqipGixlT9Sl4H7RkPkBclTB8Lq13YHV7FpT0BX4Ax
 rzR7reTqGaI/coMKmnXOtDbjdJVLkdQwZEorMRi2RFbb2WIguwTmmaDgFgOz/yTjBROQ
 XdlQ==
X-Gm-Message-State: AOJu0Yz6QFgaRxxoUUITbt/J0fzL3995oBJ7hMRraJznce5FgW9vI5tE
 CAmqdhH99kv8FGynhx/l+4L+u8C6WGRhZ9t4u8SfBNb7IWDZmrOfdvt2Gsg+wwsCs8ePdmJh3PI
 Q
X-Gm-Gg: ASbGncscgGaK0UzdqMKDXHq2L659OF26sSZvJSs8o4JnW1HFV1ilb9pMYmWv0vRqdnD
 svfV+XVJUzypvdaUgIb50h6lV4gwtECvagHpVbCDwopTAyGPjOMFWr2hcBj/KM4Ju07z10y7hM7
 kLmkzWnq7EKBlWFin0A+Gf2GNniIqmoieUFrb5FMD3BA3DngwnVqrMAi+ccAEih/lCyM7vGf9eC
 ysmEcoSXFtUSBxjh51UmEEsPjCHB5T3rXbHfqwoCdxRcCEV98tn8wx4mk54k4PNybOonHQU/rca
 xuw0MNu2aUAdrz12vYq+QM5/zIAJfN/madp4HslI5zQiJOANyhAZ3sCoMUun/t/60IIqPnwRQBo
 Rp+yA7OWcdPN70Pz4MUeXAFPHYka6pn2XmyhY2hh5
X-Google-Smtp-Source: AGHT+IG39+Zu+qajPl3qBIJBKxXa3Z+W+YwQ1Wj2BtLnFAI+sRzKsOrHdSg/b3CjybXt1krxwdP6/w==
X-Received: by 2002:a05:600c:b8c:b0:43c:fc04:6d48 with SMTP id
 5b1f17b1804b1-4406aa8955bmr156072685e9.0.1745331588987; 
 Tue, 22 Apr 2025 07:19:48 -0700 (PDT)
Received: from baku.localdomain
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5a9df6sm180714555e9.1.2025.04.22.07.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 07:19:48 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 16:19:39 +0200
Message-ID: <20250422141943.51161-1-mickael.tansorier@smile.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745331589; x=1745936389; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CUX7tgTNYSWazHOswQ+A+GwjfRZTpoWe379BWc5zSb0=;
 b=xLMql5RT89Qv0ek5rydb4RGmrCYtmf85oAUDLJq+GQcZ3tIgvCR83kAsXAnQzEg3g7
 7dfeGurRnJaP1wZ23ETFTRzWChhVDcigvIjNtCwFVU9aJxkC+ydc9UM25BryvbZQXI2x
 h4A3eGDb5PEtCkMioXAEEOPXtGT70eSIyaaTY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=xLMql5RT
Subject: [Buildroot] [PATCH 1/5] package/minetest: bump to version 5.9.1
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
From: =?utf-8?q?Micka=C3=ABl_Tansorier_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Cc: Romain Naour <romain.naour@gmail.com>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXBkYXRlIG1pbmV0ZXN0IHZlcnNpb24KClNlZToKaHR0cHM6Ly9kb2NzLmx1YW50aS5vcmcvYWJv
dXQvY2hhbmdlbG9nLyM1OTAtLTU5MQoKSXJybGljaHRNdCBoYXMgYmVlbiBtb3ZlZCBpbnRvIHRo
ZSBtYWluIE1pbmV0ZXN0IHJlcG9zaXRvcnkgZHVyaW5nIE1pbmV0ZXN0IDUuOSBkZXZlbG9wbWVu
dC4gWzFdCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL21pbmV0ZXN0L2lycmxpY2h0L2Jsb2IvbWFz
dGVyL1JFQURNRS5tZAoKU2lnbmVkLW9mZi1ieTogTWlja2HDq2wgVGFuc29yaWVyIDxtaWNrYWVs
LnRhbnNvcmllckBzbWlsZS5mcj4KLS0tCiBwYWNrYWdlL21pbmV0ZXN0L0NvbmZpZy5pbiAgICAg
fCAgMyAtLS0KIHBhY2thZ2UvbWluZXRlc3QvbWluZXRlc3QuaGFzaCB8ICA1ICsrLS0tCiBwYWNr
YWdlL21pbmV0ZXN0L21pbmV0ZXN0Lm1rICAgfCAxOSArKystLS0tLS0tLS0tLS0tLS0tCiAzIGZp
bGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9taW5ldGVzdC9Db25maWcuaW4gYi9wYWNrYWdlL21pbmV0ZXN0L0NvbmZpZy5p
bgppbmRleCA0ZTEzOWFjM2UyLi5jMTQ3NjgwMTZiIDEwMDY0NAotLS0gYS9wYWNrYWdlL21pbmV0
ZXN0L0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL21pbmV0ZXN0L0NvbmZpZy5pbgpAQCAtMSwxMCAr
MSw3IEBACiBjb25maWcgQlIyX1BBQ0tBR0VfTUlORVRFU1QKIAlib29sICJtaW5ldGVzdCIKLQlk
ZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUCAjIGlycmxpY2h0TXQgKGJ1bmRsZWQpCiAJ
ZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF81ICMgQysrMTEKIAlkZXBlbmRz
IG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKLQlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1hP
Ukc3ICMgaXJybGljaHRNdCAoYnVuZGxlZCkKLQlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBU19M
SUJHTCAjIGlycmxpY2h0TXQgKGJ1bmRsZWQpCiAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9MVUFK
SVQKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfR01QCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0pTT05DUFAK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWluZXRlc3QvbWluZXRlc3QuaGFzaCBiL3BhY2thZ2UvbWlu
ZXRlc3QvbWluZXRlc3QuaGFzaAppbmRleCBlYzY3ZDQxMzZkLi4wNDc3ZGM1ZDJhIDEwMDY0NAot
LS0gYS9wYWNrYWdlL21pbmV0ZXN0L21pbmV0ZXN0Lmhhc2gKKysrIGIvcGFja2FnZS9taW5ldGVz
dC9taW5ldGVzdC5oYXNoCkBAIC0xLDYgKzEsNSBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNo
YTI1NiAgMTQ0MDYwM2UxOWRjYTcwZTI2OTFlODZhNzRjODIyZWUyYzRhMzZmY2VlZTMyYjJkODVh
ZTc0NzcyMTQ5ZTlhMyAgbWluZXRlc3QtNS42LjEudGFyLmd6Ci1zaGEyNTYgIDI3NTk0MjQyZGE4
YzdjYzFlNWVmNDU5MjJlMWRmZGQxMzBjMzdkNzc3MTliNWQ5MjczNTllYjQ3OTkyMDUxZTAgIGly
cmxpY2h0LTEuOS4wbXQ4LnRhci5negorc2hhMjU2ICBmODE3MzQzNjc4MmI1YTI1NDRhYTE5YzU0
ZjU3MmE4MTgzMWI2Y2ZjODk0ODA3MzdjY2Y2NzY4OTkyYzY1MWVhICBtaW5ldGVzdC01LjkuMS50
YXIuZ3oKIAogc2hhMjU2ICBiMzhjOGQ0MjhjZWRkZjhlOWI0OWRjYTYzNjEwYzc0NDk5ZDk1Mjg5
NWQ3NTZiN2VhYjVmNWQ0Y2VmMjk1NGY2ICBMSUNFTlNFLnR4dAotc2hhMjU2ICBjYTM4ZjFiYTRh
YjkwMTExMWY2ZWVlNTAwMDliZDQ2ZGJkODY2ZTZiZWI5OGQ1OTJkODQzZjdjMTYyZDczNDA5ICBs
aWIvaXJybGljaHRtdC9kb2MvaXJybGljaHQtbGljZW5zZS50eHQKK3NoYTI1NiAgMmM5NDM0ODg2
ZDMxNDRlYWQ2MDZiOTU5Y2Y2MWRjNDE5MzVkMTc1NGMwNzRmNDczNTQxZGE0YTNkZDQwNGVmYSAg
aXJyL0xJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWluZXRlc3QvbWluZXRlc3QubWsgYi9w
YWNrYWdlL21pbmV0ZXN0L21pbmV0ZXN0Lm1rCmluZGV4IDM5MDRiZDY4N2MuLmIwN2VhNTdlYTcg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWluZXRlc3QvbWluZXRlc3QubWsKKysrIGIvcGFja2FnZS9t
aW5ldGVzdC9taW5ldGVzdC5tawpAQCAtNCwyNyArNCwxNCBAQAogIwogIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKIAotTUlORVRFU1RfVkVSU0lPTiA9IDUuNi4xCitNSU5FVEVTVF9WRVJTSU9OID0g
NS45LjEKIE1JTkVURVNUX1NJVEUgPSAkKGNhbGwgZ2l0aHViLG1pbmV0ZXN0LG1pbmV0ZXN0LCQo
TUlORVRFU1RfVkVSU0lPTikpCi1NSU5FVEVTVF9MSUNFTlNFID0gTEdQTC0yLjErIChjb2RlKSwg
Q0MtQlktU0EtMy4wICh0ZXh0dXJlcyBhbmQgc291bmRzKSwgWmxpYiAoaXJybGljaHQpCi1NSU5F
VEVTVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQgbGliL2lycmxpY2h0bXQvZG9jL2lycmxp
Y2h0LWxpY2Vuc2UudHh0CitNSU5FVEVTVF9MSUNFTlNFID0gTEdQTC0yLjErIChjb2RlKSwgQ0Mt
QlktU0EtMy4wICh0ZXh0dXJlcyBhbmQgc291bmRzKQorTUlORVRFU1RfTElDRU5TRV9GSUxFUyA9
IExJQ0VOU0UudHh0CiBNSU5FVEVTVF9DUEVfSURfVkVORE9SID0gbWluZXRlc3QKIAogTUlORVRF
U1RfREVQRU5ERU5DSUVTID0gZ21wIGpzb25jcHAgbHVhaml0IHNxbGl0ZSB6bGliIHpzdGQKIAot
TUlORVRFU1RfSVJSTElDSFRNVF9WRVJTSU9OID0gMS45LjBtdDgKLU1JTkVURVNUX0VYVFJBX0RP
V05MT0FEUyA9ICQoY2FsbCBnaXRodWIsbWluZXRlc3QsaXJybGljaHQsJChNSU5FVEVTVF9JUlJM
SUNIVE1UX1ZFUlNJT04pKS9pcnJsaWNodC0kKE1JTkVURVNUX0lSUkxJQ0hUTVRfVkVSU0lPTiku
dGFyLmd6Ci0KLWRlZmluZSBNSU5FVEVTVF9JUlJMSUNIVE1UX0VYVFJBQ1QKLQlta2RpciAtcCAk
KEBEKS9saWIKLQkkKGZvcmVhY2ggZiwgJChub3RkaXIgJChNSU5FVEVTVF9FWFRSQV9ET1dOTE9B
RFMpKSwgXAotCQkkKGNhbGwgc3VpdGFibGUtZXh0cmFjdG9yLCQoZikpICQoTUlORVRFU1RfRExf
RElSKS8kKGYpIHwgXAotCQkJJChUQVIpIC1DICQoQEQpL2xpYiAkKFRBUl9PUFRJT05TKSAtCi0J
KQotCWxuIC1zZiBpcnJsaWNodC0kKE1JTkVURVNUX0lSUkxJQ0hUTVRfVkVSU0lPTikgJChARCkv
bGliL2lycmxpY2h0bXQKLWVuZGVmCi1NSU5FVEVTVF9QT1NUX0VYVFJBQ1RfSE9PS1MgKz0gTUlO
RVRFU1RfSVJSTElDSFRNVF9FWFRSQUNUCi0KIE1JTkVURVNUX0NPTkZfT1BUUyA9IFwKIAktRERF
RkFVTFRfUlVOX0lOX1BMQUNFPU9GRiBcCiAJLURFTkFCTEVfR0xFUz1PRkYgXAotLSAKMi40OS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
