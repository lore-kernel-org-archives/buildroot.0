Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722D5CD343F
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 01:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BC9241203;
	Wed, 13 May 2026 01:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0OHRwcFkpN1q; Wed, 13 May 2026 01:39:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35B8E41199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778636398;
	bh=vFeNTgpHGbLcrd2bFYY0XFRi42aud5e1lPiFSwHMIEI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oRZj4151C2ow0SiDlcrKHI8IPN/kP1XxUzsCyyz2PRX74tDZarAHEZmk7b/4SENTX
	 HvgGDm56SOa2Tdgua9na68dBApwHz2FKaBFhq5pVrPUECmtNZGVkp09bRDocfNeBkl
	 mcRyyWmE4p76uLa20hTyF2sl4O8T4uLQ3tfBuVAv2LIiHxztpUqCA+JgCja+y3RStX
	 9+f2wqb27qq8P0Ozz+nXpORGIZBYKAK1T65X8QrmueBLKfoNbUpPP54JNVpk5UAIeS
	 6vDXanxs2CuRLfO3yK+oy9erRFvGQkRRxswXMwX6UhHsN4MvoYgwq4NcCLtB/6nCet
	 0ZxiTQAVYAylA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B8E41199;
	Wed, 13 May 2026 01:39:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD9FC270
 for <buildroot@buildroot.org>; Wed, 13 May 2026 01:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEE1F407B9
 for <buildroot@buildroot.org>; Wed, 13 May 2026 01:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCMAHzuRxpdM for <buildroot@buildroot.org>;
 Wed, 13 May 2026 01:39:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C19EC407B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C19EC407B8
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C19EC407B8
 for <buildroot@buildroot.org>; Wed, 13 May 2026 01:39:55 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-44c4cc7c1cfso5005703f8f.0
 for <buildroot@buildroot.org>; Tue, 12 May 2026 18:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778636394; x=1779241194;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZmtwzitnwMT9rRBjQWOuTDV/VhTIryw/JerrkshFC70=;
 b=a2B2BYbJvqczA/OaIPIKdmsK9HZnshSKUkQug2CzoEEQFg+Jhtq0F4DZBNrfrggCtQ
 KW8aLANjw2cVpwnmrW9CYkLYV1nwg1/qA5sZ0qQMPMp0kATe6OqY/bUzaw5RgIq7Xskm
 qB1u+7mC4IxDBI2b+WN7Dp6rybTS5C63iSk3RxzNlQjoj6lietDpif01VgxfnZ2yGomA
 wLZgo+r6rWr5MoHZ5K+4cFtIwx0vfUVIIF0xxAPZwZQvjd7gV5UNKBWIl2mmwrT5CLP0
 L5GctZpE5R8hXEAdCkZnJYed8lvdAHpX5PjvJpgDiT2oTxogdtBBVHP55HWeLklG8N8X
 YP8Q==
X-Gm-Message-State: AOJu0YzPUzoDGddvjHbfmeudQLvjEeSo0L5ds+sDOy3ySaRkSrutWhXv
 XwSONUZP3/vYSj/DmKX/A3HvNW/RekUB+2IpRvKJ8TYxMtslhzqh/FmXOq/44w==
X-Gm-Gg: Acq92OGugR61zUfEoaPEt0NeKbulWK5M+qEQbUyIUP1TwfHw6aFxpTSDmx87b6I3+Tq
 hdlpybdZVyN99BoXsQMzjHWgZ9qigwRriIhRKjrqL/Ors5bX1bukLbPFav+TRsc2xkarBIRR3pU
 9ocfkuyZBeBmRUfkIR6rT2u0tBRyg4ONVKD3+IGyJVetM8Z2EZWUuKU8vq+RRV+t10u36Gtmri2
 qxcSaciTf1UO7tdRTtpAy+Z00q4jmpTVNqVq4VMZjWq1Yc9+mPl3e+CrSduWjDjbazXGmDDN2mX
 Fdlb8Oy/VfN5j0ZxZCAt0UdqizZTQVaVQyapijc4r9AnTCjb+kJ0h1sOLts5ctN1wUDEkimGFcf
 uCLg87SThb6+QVx6NTBBFD+lL45ndAhZAP1WWjnrxSxWJorV5o7JhsM0cMY+7MXn1xQhqNpwzIq
 fAk4kaXJTI7HSa+TF393ndO7TI4A0IRc9N9QndelToEhlS5X4aCYTBj6DmToI1pCIs6NqpNmZK/
 F03oDvu2H/Ph6e/0YY+KVoUBnrydCDsD0J+1DY=
X-Received: by 2002:a05:6000:2381:b0:43b:445f:3177 with SMTP id
 ffacd0b85a97d-45c7a5e6e0cmr940865f8f.31.1778636393469; 
 Tue, 12 May 2026 18:39:53 -0700 (PDT)
Received: from cuervo.intranet.jlsalvador.online
 (176.85-87-136.dynamic.clientes.euskaltel.es. [85.87.136.176])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548ec6b071sm36781171f8f.14.2026.05.12.18.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 18:39:53 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Date: Wed, 13 May 2026 03:39:19 +0200
Message-ID: <20260513013919.1028509-1-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778636394; x=1779241194; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZmtwzitnwMT9rRBjQWOuTDV/VhTIryw/JerrkshFC70=;
 b=fAPF8E/CY6kXiOfuljupt57Bvo/W+NYbjiaLGA1ZIiEd5SOjHvnA8btmXSdkObwVvx
 w4bNeOe4QKYCdd7WuvJQKp7vCNtdXGP1spM8F5ilYhbTP8C/BK7Cn/ggWWMsm2rTEwFc
 Iak0u8UdkQHKjvhdZiwl16EBxqu1/y7fHRshVH13VEI+3A61bEllA2YNwDEDWkx+o3Po
 MbpeCknnNIczjGjEIVTndp+K+0s1JfuU8M+gzBMIxd6qk6iYLQ3n3i9uQKBtexNusy1E
 LKk4tyLTxP6PRytSOnNBV0r+Iokpxj4VFasGyVYVl6/CkJP9jSyuo+DvrKtVAw1apHFz
 vBkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=fAPF8E/C
Subject: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.4.2
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
ZWFzZXMvdGFnL3pmcy0yLjQuMgoKU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBS
dWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+Ci0tLQogcGFja2FnZS96ZnMvemZzLmhh
c2ggfCA0ICsrLS0KIHBhY2thZ2UvemZzL3pmcy5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96
ZnMvemZzLmhhc2ggYi9wYWNrYWdlL3pmcy96ZnMuaGFzaAppbmRleCA2ZTQ3ZjA3ZWFkLi41MDdk
ZTQ4NGMxIDEwMDY0NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMuaGFzaAorKysgYi9wYWNrYWdlL3pm
cy96ZnMuaGFzaApAQCAtMSw1ICsxLDUgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3Bl
bnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuNC4xL3pmcy0yLjQuMS5zaGEyNTYuYXNj
Ci1zaGEyNTYgIGMxN2I2OTc3MGYwMDIzMTU0ZjU3OGViOGM3NTM2YTcwZjA3ZDZhM2JiMGJkMzhm
MDRmYTBlODgxMWMzYzEzOTAgIHpmcy0yLjQuMS50YXIuZ3oKKyMgRnJvbSBodHRwczovL2dpdGh1
Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuNC4yL3pmcy0yLjQuMi5z
aGEyNTYuYXNjCitzaGEyNTYgIDdlMjYwZDBlNmFmMjk1YmVhNGM1ZTI0MWNhYzBhMWFlZjA3YjU4
ZDhkZDgwMzVmNzg5OGFkZTNiMWJiZWM3OGYgIHpmcy0yLjQuMi50YXIuZ3oKIAogIyBIYXNoIGZv
ciBsaWNlbnNlIGZpbGVzOgogc2hhMjU2ICAxZmZiNzBjMzNjNGY3OWYwNGU5NDdmYWNjNWM3ODUx
ZjI4OTYwOTI1NmFhY2I0N2ZjMTE1ZjcwMDQyN2Q5NTIwICBMSUNFTlNFCmRpZmYgLS1naXQgYS9w
YWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMubWsKaW5kZXggMGVjYzllZWUyZC4u
MDQwYTY4NjlkOCAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZnMvemZzLm1rCisrKyBiL3BhY2thZ2Uv
emZzL3pmcy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAK
LVpGU19WRVJTSU9OID0gMi40LjEKK1pGU19WRVJTSU9OID0gMi40LjIKIFpGU19TSVRFID0gaHR0
cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0kKFpGU19W
RVJTSU9OKQogWkZTX1NFTElOVVhfTU9EVUxFUyA9IHpmcwogWkZTX0xJQ0VOU0UgPSBDRERMCi0t
IAoyLjU0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
