Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5901CFD3764
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 14:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC6E241C01;
	Wed, 25 Feb 2026 14:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bb0ngYrGjsFo; Wed, 25 Feb 2026 14:32:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E59EF417FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772029978;
	bh=IX2GRa8Ohbrfz4Ll+kArMsjH0THhR/mK+PkBo6ffUco=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j6zI2qqIna8DBNa3z68L7zYoWCan5KU50u2GNEqhK3ck7iVbtfnWCCdL+u/5QSYzy
	 xZvEGnvwRtOqm6KCK1Jj0Aj+tIunfWS9CFFkDTk9q9fbeFnAhR3RDYgjhd0UXzlPQv
	 upN20UKSgA6Mxfg4YbAYVlBJehB6nzOXTj1YplUyT6iuyx5AYwvC8PJKky8BvVQByR
	 D6/8KgCNiVeQjKXAF5ksKnzz67WL0VrFgA+7h0FopQy4kDO+hpBhC8MGgkPUAIL/Q0
	 1zDSo+L+3cdptbVQBNPEPXp9OtdAgC40Volzf8dWgFAgEXC0GGabaYmUa9LpmDsuUc
	 UsWoXpVK1S2Pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E59EF417FA;
	Wed, 25 Feb 2026 14:32:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 960B31B8
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 14:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 877C46078F
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 14:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NB9gAMJCYArd for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 14:32:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE456606FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE456606FF
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE456606FF
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 14:32:55 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so65368475e9.1
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 06:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772029974; x=1772634774;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ah3EFn9zl5Iue7FsRPYU4U31y/oTwsP3p4CEfvzImw=;
 b=We4fvd+h4U516J5V9Q7mR8/2PAYxYG4um8zMDDfmO93Wqtf6Kr7CKTro8cUACndOKj
 Yp8BFFyuPQKiYMbgHlENbF3YxktW85dbLKIFPAKCf3k2wfua5pJHB8uWkJyLdyli9BOm
 IfpMTmfTgQDKsjIMnnkAgc2u+7bQOLS3Su635pEK/ANN956H7QbtYyKZsXJW2kVZb3+X
 egDrWcHrBzGS7xTMrqn2IKU0xfLbrMt1TcXiVw+dwnKM/EK2c8MYufrwWg91MCuiATuH
 cu+QCj1GdJjO08F54G66fDTf9OJYhGvo9km5lv57dAdImDUjmEPR8pcjGMdUG7eF65Xh
 xz3g==
X-Gm-Message-State: AOJu0Yy9fVe5oMUEshKPOVMXmm9QEUmFQQPJAoBIrLi+VTq8kuz/TrGG
 /09KjgifDgNAyqV0IAxHY5U9cY+UMFny6ZewQ1t5p0BLde00kmDfX39JQoa76QVT
X-Gm-Gg: ATEYQzyaO5UUt/iSgw7PGFfhDc7Rqa7EuhTZHZw6QmOTL4oi9NbNjjVOvE3xEWTmNGy
 9GAJCjApgz1OI6WlMOvWpD1jQN7SIplIBAJrV6B0dDdEzJlXCAFNaPoWZ0CXOuQXW4ZMeLKlQXy
 50wr08qG0rE8Dx3zz3Gr3JsUnDxLCvTvPKdtW2ePWe6K0DVXaQjNQMuHtlPZrgZ5/oeYYeoBsid
 xl9hEo2g+3ZetjaE6aUrMKfugjfy54YZ7KKNjfi6zmX3U01d275KartQK1MiiaNZKQFAkGMK2/t
 odyeRGu7w2WZVI7WychRAb6iPU2EtJ3Qmxf9ZpUVyTUrwJI+AJy0R75czde611CjNecIi2PngzA
 Crj7io3UBR0w+CYnwagfyq4ODrMnMx2aklbPfnnXKenO4jWDCPYqfIZdM8dqzvz8X8VNGhlBA7W
 lkXfb4t5SmU5EptrM2QW8RKZ2vZ02+IaKBpi7tWnGdw4R05YmHnfMyKmf+RIe/4VvuMQALXhaU3
 IDfdRUm/ZKHSOj/EcBoFw38n8oM1pxT//MKgww=
X-Received: by 2002:a05:600c:468d:b0:480:7162:fa48 with SMTP id
 5b1f17b1804b1-483a95c8f2dmr300476915e9.13.1772029973283; 
 Wed, 25 Feb 2026 06:32:53 -0800 (PST)
Received: from cuervo.intranet.jlsalvador.online
 (151.85-87-136.dynamic.clientes.euskaltel.es. [85.87.136.151])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb77abdsm12918425e9.2.2026.02.25.06.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 06:32:52 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Date: Wed, 25 Feb 2026 15:32:27 +0100
Message-ID: <20260225143226.1028442-2-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772029974; x=1772634774; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5ah3EFn9zl5Iue7FsRPYU4U31y/oTwsP3p4CEfvzImw=;
 b=Wjqiey1ppetR/1gj0v0B6D8K+7R4CHhnV1XSo2AIFbfIKBWqkqlRGVcBedMduZyBmA
 MISmg6Tdw9zBrVYOj6orfl9a39O7MfrI65G9dsUkw/pCstj/+D005+X/dsPCUrqwZ+ph
 rtF2J7lWo5Gce/4dc6aFLDVPQbzkCsCW4TxUj+TqH1syrbhJ/00tQtXitSskTT1Aa1uc
 LRzrwanGhSNfLBlWNyQKE9e7yl84/XFu7o77Nl07+pkOI+/NY4WGIvEQD2QVlRYmiPN5
 Gy4Fz5ukN51AqRiT6y1VVeHkMms9iMA4HwY2dmxLQ9SEbS1MNoWUQZWJOEivF1vJBYeS
 BEsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Wjqiey1p
Subject: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.4.1
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
ZWFzZXMvdGFnL3pmcy0yLjQuMQoKU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBS
dWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+Ci0tLQogcGFja2FnZS96ZnMvemZzLmhh
c2ggfCA0ICsrLS0KIHBhY2thZ2UvemZzL3pmcy5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96
ZnMvemZzLmhhc2ggYi9wYWNrYWdlL3pmcy96ZnMuaGFzaAppbmRleCA4N2Y0ZTQ2MmYxLi42ZTQ3
ZjA3ZWFkIDEwMDY0NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMuaGFzaAorKysgYi9wYWNrYWdlL3pm
cy96ZnMuaGFzaApAQCAtMSw1ICsxLDUgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3Bl
bnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuNC4wL3pmcy0yLjQuMC5zaGEyNTYuYXNj
Ci1zaGEyNTYgIDdiZGYxM2RlMGE3MWQ5NTU1NGMwZTNlNDdkNWU4ZjUwNzg2YzMwZDRmNGI2M2I3
YzU5M2IxZDExYWY3NWM5ZWUgIHpmcy0yLjQuMC50YXIuZ3oKKyMgRnJvbSBodHRwczovL2dpdGh1
Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuNC4xL3pmcy0yLjQuMS5z
aGEyNTYuYXNjCitzaGEyNTYgIGMxN2I2OTc3MGYwMDIzMTU0ZjU3OGViOGM3NTM2YTcwZjA3ZDZh
M2JiMGJkMzhmMDRmYTBlODgxMWMzYzEzOTAgIHpmcy0yLjQuMS50YXIuZ3oKIAogIyBIYXNoIGZv
ciBsaWNlbnNlIGZpbGVzOgogc2hhMjU2ICAxZmZiNzBjMzNjNGY3OWYwNGU5NDdmYWNjNWM3ODUx
ZjI4OTYwOTI1NmFhY2I0N2ZjMTE1ZjcwMDQyN2Q5NTIwICBMSUNFTlNFCmRpZmYgLS1naXQgYS9w
YWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMubWsKaW5kZXggMzAyMDdmN2NmNy4u
MGVjYzllZWUyZCAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZnMvemZzLm1rCisrKyBiL3BhY2thZ2Uv
emZzL3pmcy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAK
LVpGU19WRVJTSU9OID0gMi40LjAKK1pGU19WRVJTSU9OID0gMi40LjEKIFpGU19TSVRFID0gaHR0
cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0kKFpGU19W
RVJTSU9OKQogWkZTX1NFTElOVVhfTU9EVUxFUyA9IHpmcwogWkZTX0xJQ0VOU0UgPSBDRERMCi0t
IAoyLjUzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
