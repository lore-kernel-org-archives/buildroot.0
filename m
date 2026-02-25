Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D052FD3756
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 12:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5E66846EB;
	Wed, 25 Feb 2026 12:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E71wsQZujh7L; Wed, 25 Feb 2026 12:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17E58846EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772023443;
	bh=Vp80AyRqaKUxbpxPgd2LsoeaAhy5+PkRgONDSbvyj0Q=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Bfjt6H6nyx0tR5tMYG7sQ5Zn+G1V32p1DuM6OjDhHhozMsW52Yy3Va6Dh5zlH2/d8
	 +kG+QdKnYG/a2PqFbwcFRQ8D76EMEixl/Vn28daLC5kDuO2lF0oXN/TYsAZXRltD6+
	 sr5SKBzCHMGWNZhlfUe0T1OKTIJ2ekB+XdFfmL7futj0GkkD3egnP3KQnqCPJL/2Sw
	 awZ+iTnCtIyXXcahzWcgicc3+epn/yk447QQ0rTsD+2OdjeBpiZRFS0gWqoZGhJ+Xm
	 6J9RUigzrLl/ACAPKJ9QNba9rMTGyHL8CU4N3Uw0YWWRybt7L6dE2bZFAjx47QJmTj
	 Ohmueh5+4bUpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17E58846EF;
	Wed, 25 Feb 2026 12:44:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 638D6204
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 12:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 493DD846EF
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 12:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3RkX6aHpo4EL for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 12:44:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=jonhenrik@qbee.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 45574846EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45574846EB
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45574846EB
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 12:44:00 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-59e5aa4ca41so6281554e87.2
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 04:43:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772023437; x=1772628237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wSUc0dtAVuA85wZrZZxhZ5hqdq1T9aJmrw8ZU+A+Acg=;
 b=jvrMNqUMaDip1tLfLMMfNyQ/dhpawH8dzzFHMt9eaUbk2hn9JeASYhK3M3ppaKD4DN
 4jsDQeWTVecpw4/nXqN+EPF/+fHhlQoE40li3u8USARkJy1Y391xFxvTqcYlfbDxqC6p
 YlXJwJ5IhU5Ys2dDWPO3EMqF0K/omZ2O6QFHGm038QTDlk2tRuE9VIK9drAFg0Joi+zq
 wXuAjEu8d8SBwt3dHVO8hofP9XcWdwOqgsQQEUhcWar4s7Fmh0SR9QHKSH3rrJFLF+v1
 GI7Kfm4H8ywtK3hXf5/5TcKyf67k1Q9Lt758ZSbDYSlvNmi64D+5SxDfHNEdDlW/VUms
 BgKg==
X-Gm-Message-State: AOJu0YzNsxU0oHFXDJTAWc9jL0AjK+Akz+P6EBNwmdI6hdvbuNnC83/6
 ha7HyXLI9VWOfaVZOHHrzSBfwdOfltzZbb87Gos4gOypVMNsKRsAXYuYn8JubklyMnGUN9YiAHa
 R6Glo
X-Gm-Gg: ATEYQzyYot/cpjUtPdAmveGHKNnJCkFULQZHqDq42wKwCEb9v4Y0svv+asv/z2XS7fe
 rJn3IyqC9nRmNlHrecADu/0znyT1f0Mbro03IRR/cRdhUrHrSfBk3fTRm/ZbpcTCg0MLJpbKODq
 EsWu7d6ZO90ZyseziE47LbqX07wYnUD7cfk7n2Bnxzwx8rD5XuXX6wv5zPS29uDQINWEqPwGLCD
 2A3n3t1vfLfT+R5IL1Xj4iRvjJaArh8er4hdauOjC9NSS2SJPncJ9RzhYKOn7rZ72SzsOUKlV11
 eVRKEix2ypajqzkkl/ctTDQZ98T1oFAswSAhEVGZG7DvRqGqMAX4nPJ6UHAC+ecghg78gWsCeWl
 HCMkkyx9P1WUfFEXXCeMhUs3FcJi1s/b5XVqizjEJcyaXJSyZneUAKbhZUPgmW76fOYN3ADttOw
 2tNWahQig6FweZ7z+k55E1rWSb8lzqCHuT
X-Received: by 2002:a05:6512:1243:b0:59f:7a02:8e90 with SMTP id
 2adb3069b0e04-5a0ed8a5f8emr4705620e87.24.1772023437424; 
 Wed, 25 Feb 2026 04:43:57 -0800 (PST)
Received: from nola.getinternet.no ([2a02:fe1:410f:a500:ed1d:fe07:f774:49d4])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb4592dsm2937321e87.65.2026.02.25.04.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 04:43:57 -0800 (PST)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Date: Wed, 25 Feb 2026 13:43:52 +0100
Message-Id: <20260225124352.503896-1-jonhenrik@qbee.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qbee.io; s=google; t=1772023437; x=1772628237; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wSUc0dtAVuA85wZrZZxhZ5hqdq1T9aJmrw8ZU+A+Acg=;
 b=bXfaAPY0KEWXJrS8BrQlYhKXBWzGFFsXKuqwjfzOqzf60ulOonPEI1DNU1D/OUm6J8
 hy1aclo0GUfMTRfTwxVZ+2ymGGvmd6ToEDs8Q+jskt93FcBFM3bKlYV7yc/2mI5J4jxH
 jomH3Jay9w+tEcEBhEzDlHOkvVCbQHZqk5xMg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=qbee.io
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=qbee.io header.i=@qbee.io header.a=rsa-sha256
 header.s=google header.b=bXfaAPY0
Subject: [Buildroot] [PATCH 1/1] package/qbee-agent: bump version to 2026.10
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
From: =?utf-8?q?Jon_Henrik_Bj=C3=B8rnstad_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSm9uIEhlbnJpayBCasO4cm5zdGFkIDxqb25oZW5yaWtAcWJlZS5pbz4K
LS0tCiBwYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoIHwgMiArLQogcGFja2FnZS9x
YmVlLWFnZW50L3FiZWUtYWdlbnQubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQuaGFzaCBiL3BhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lmhhc2gK
aW5kZXggNTNhMWYxYWM1NS4uMjA5MGQwMTY5MiAxMDA2NDQKLS0tIGEvcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQuaGFzaAorKysgYi9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5o
YXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgNzVlMmZm
ZjIwNzdjZDEzYzZkNDJiMmY0MmMyZGE1ZDA0ZmNlNDE0MDhlZmQ2Yjc3Y2FmMWUxM2NlZTgwMDcz
YyAgcWJlZS1hZ2VudC0yMDI1LjQ5LWdvMi50YXIuZ3oKK3NoYTI1NiAgNWYxY2E3MzNhZjU5NmFl
YmRlYzQ5Yzg5MGI1OWU1NDA2YjQyMTdlMjhkYTAwZTYxNmI3MTcwNmY3ZGU5OGI4NyAgcWJlZS1h
Z2VudC0yMDI2LjEwLWdvMi50YXIuZ3oKIHNoYTI1NiAgMDJkMDdkOTZiZTk5ZWIwNDJiMDFiYTY1
MDA3OWE0NDBjZTI2YTc4YzVlMGUxZTgwNjBjMzNhOGM5ZTIwMDQwNCAgTElDRU5TRQpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawppbmRleCBmNDBkZDQwYmY4Li5jNGY4OTFiMGZhIDEwMDY0NAotLS0g
YS9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5taworKysgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawpAQCAtNSwxMiArNSwxMiBAQAogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAogIyBrZWVwIFFCRUVfQUdFTlRfQ09NTUlUX0lEIGluIHN5bmMgd2hlbiB1cGRhdGluZwot
UUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNS40OQorUUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNi4x
MAogUUJFRV9BR0VOVF9TSVRFID0gJChjYWxsIGdpdGh1YixxYmVlLWlvLHFiZWUtYWdlbnQsJChR
QkVFX0FHRU5UX1ZFUlNJT04pKQogUUJFRV9BR0VOVF9MSUNFTlNFID0gQXBhY2hlLTIuMAogUUJF
RV9BR0VOVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQogCi1RQkVFX0FHRU5UX0NPTU1JVF9JRCA9
IDk0OTNhNTdmN2Y0ZjJjYjRjMGRiM2RmZDE4MTIwNDJiOTY0NzlmYzIKK1FCRUVfQUdFTlRfQ09N
TUlUX0lEID0gY2ZlZWM5OTFiOTc2NDhhYWVjYjg5NGQ0YzkzODlmZmRlNzcxMWFhOAogCiBRQkVF
X0FHRU5UX0dPTU9EID0gZ28ucWJlZS5pby9hZ2VudAogCi0tIAoyLjM0LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
