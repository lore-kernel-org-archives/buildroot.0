Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA116C282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 09:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94FA881E9D;
	Tue, 11 Mar 2025 09:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KL8ZdDDaQ3OF; Tue, 11 Mar 2025 09:59:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A657E81E7C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A657E81E7C;
	Tue, 11 Mar 2025 09:59:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDAA91C8
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 09:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B404281E61
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 09:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aI_S302Y5XSR for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 09:59:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ABA3881E7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABA3881E7D
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABA3881E7D
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 09:59:06 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3913fdd003bso1281503f8f.1
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 02:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741687145; x=1742291945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ts8RsEXZn/C7AIMm4RGrDOiCUMMcIx7uK6/IX66yCT8=;
 b=RKKp2+DY2/lv4D7Vi2MmowF4mA+FoOs0B4h+ii9PXdfHCpVszpcAUi+fOfFXmp9E9V
 OXMxkPu//FB928vigwvDBaIs1vEnSNwE02oEsyM4jJ26cdGeOjQJus2RmB1jcYKrpCYB
 f0xNRdOcKfWiH3RwXsdcMxlXclHFQd11Oqapz1r3ZZWm4/8/zd3Jp6laVXLvH7IXTrJ9
 C7h9yHTiPKm8ZyzDk2vhNKkh1op+xMYMCow4Qb0hVVDCjnbg9gwSMj0uxuSlkjNe7DEb
 Vndqb3FBtf/OTrgjlvji+0TbaT/USlqNqYnqniWZZCxmORHAZ3WfJC9hzEeh149YC+6a
 3bnA==
X-Gm-Message-State: AOJu0YxY+++Rzt2x4Qi87EVlosCp10DB2CqIIkvIATBxGqcUmw1gsTGR
 IGYf5C52Wfiz2d/6wyvUtIE62dQeTADR74rVc30XJH/dyX1gILBqEYUcyQ==
X-Gm-Gg: ASbGnctdfFROr2XLaCVlnggjatQbOtz+wjQ7rFaaes0aCodIstApK3zlbCKcnltawH4
 mWfJih5bFzHz+R1GByCoQKGkF9Uz3VZciVolMpULUctbPATTKAIxLjoIaxwRrlsTqky65ZAKJSh
 zdwLG8xy6xfEN0Jx/mjEBX9Y3LvuTP+wIyQ9uq0QddByw7sUFA5/WSNuDdAvWi9/av1XS7DcNF0
 Lrs6m1hM2XywKWgc+K4IO/6/GUub9PrK6jjDBn057OBPJ6LYpv5cdbkrQoBqO5fo3rXBSKKbejM
 7n0qImaej5fsJcSdtiHkFP6420EXUpHc9UVYGE0TdpxEU7GJKTL/3r4504WSFhwYCDP9nWyfp0F
 tpHK7xQujztHP0C0M3IFc
X-Google-Smtp-Source: AGHT+IH89QhKZq/seDWoXHcNZ/CeuoptKR74KGjUwDAHbnh4DE0XEVqJY8oDTCvQ1b3qGvHLOWPUSw==
X-Received: by 2002:a5d:6487:0:b0:390:e9e0:5cc6 with SMTP id
 ffacd0b85a97d-3926bdf5c18mr3435558f8f.1.1741687144325; 
 Tue, 11 Mar 2025 02:59:04 -0700 (PDT)
Received: from cuervo.intranet.jlsalvador.online ([207.188.145.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c015d2bsm17154432f8f.43.2025.03.11.02.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 02:59:03 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>
Date: Tue, 11 Mar 2025 10:58:31 +0100
Message-ID: <20250311095831.825806-1-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741687145; x=1742291945; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ts8RsEXZn/C7AIMm4RGrDOiCUMMcIx7uK6/IX66yCT8=;
 b=d3Ou+3H4vcEt1mZP15tvS62rqKNoIxznG2pthfcdOnLvZ49LdW5GZJOe5x9b/HbFX7
 Q5GsRVGbGUIM/Xve8Oeb6EhPOX3TgpZgULl1uBcCSPnNbTzazciYcI8hp15PVmjduFJr
 O4A0UI93xANPem/Uxehc2182ix2wT8g697j3h0lt2WF5EeFR+FhDv2JtiKH31RqLrQ++
 rdiASpIlBYokbZiYehCsC5SN9FFJ0sa1qlkR8sZBI1D9gBG2hteGkxffLHkA0sG27hVf
 Fs0XAiA6Yyj9fPkE9JOT+1pyX/sX3GkpKnAMQ7lMKMicsXF7VLOi1++mZ/LsjKHhexYq
 T35w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d3Ou+3H4
Subject: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.3.1
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
ZWFzZXMvdGFnL3pmcy0yLjMuMQoKU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBS
dWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+Ci0tLQogcGFja2FnZS96ZnMvemZzLmhh
c2ggfCA0ICsrLS0KIHBhY2thZ2UvemZzL3pmcy5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96
ZnMvemZzLmhhc2ggYi9wYWNrYWdlL3pmcy96ZnMuaGFzaAppbmRleCAxODRjZTI3YjBiLi4zNjQw
OTYzYmRiIDEwMDY0NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMuaGFzaAorKysgYi9wYWNrYWdlL3pm
cy96ZnMuaGFzaApAQCAtMSw1ICsxLDUgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3Bl
bnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuMy4wL3pmcy0yLjMuMC5zaGEyNTYuYXNj
Ci1zaGEyNTYgIDZlODc4N2VhYjU1ZjI0YzZiOWMzMTdmM2ZlOWIwZGE5YTY2NWViMzRjMzFkZjg4
ZmYzNjhkOWE5MmU5MzU2YTYgIHpmcy0yLjMuMC50YXIuZ3oKKyMgRnJvbSBodHRwczovL2dpdGh1
Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuMy4xL3pmcy0yLjMuMS5z
aGEyNTYuYXNjCitzaGEyNTYgIDA1MzIzMzc5OTM4NjkyMGJkYzYzNmUyMmQwZTE5YThjMmMzZTY0
MmU4YmQ4NDdmZjg3ZTEwOGY4YmIxZjkwMDYgIHpmcy0yLjMuMS50YXIuZ3oKIAogIyBIYXNoIGZv
ciBsaWNlbnNlIGZpbGVzOgogc2hhMjU2ICAxZmZiNzBjMzNjNGY3OWYwNGU5NDdmYWNjNWM3ODUx
ZjI4OTYwOTI1NmFhY2I0N2ZjMTE1ZjcwMDQyN2Q5NTIwICBMSUNFTlNFCmRpZmYgLS1naXQgYS9w
YWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMubWsKaW5kZXggNGJiMzJjMmFlOS4u
YjJlZGViMTI2OCAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZnMvemZzLm1rCisrKyBiL3BhY2thZ2Uv
emZzL3pmcy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAK
LVpGU19WRVJTSU9OID0gMi4zLjAKK1pGU19WRVJTSU9OID0gMi4zLjEKIFpGU19TSVRFID0gaHR0
cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0kKFpGU19W
RVJTSU9OKQogWkZTX1NFTElOVVhfTU9EVUxFUyA9IHpmcwogWkZTX0xJQ0VOU0UgPSBDRERMCi0t
IAoyLjQ4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
