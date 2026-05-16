Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6911ECD4F3C
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 19:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F8224230F;
	Sat, 16 May 2026 19:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDVufoKYYvOD; Sat, 16 May 2026 19:09:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5604042308
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778958580;
	bh=VgzJ4xPm3wxD32L9fSrlyJm7AINrJjvmGuLYQY4GcR8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=jay++Cg9sJPUeykdx4c/RiIwzSbQKDmQGpP784sLQmjGIfePevhO3s04agRILgo6o
	 hToaTM0t/hLVGZWB354SgZmIRSrK58hWYSW5KG83ZrhZTgqS8aMuhUiN8Ns+bFFHaI
	 lKCiZtOYauH1hBue0u3urF/YPYN/J/SzzgT+Gb0uJWeDtza3TEslla0O1AoXekFRYm
	 xOSAb3xMvlSNuXg3s3HSHgNlKq2GHSsYIAmwLwcv7SGP3V6GzUhgQTo5yVgm+qhBn5
	 WkxUM4ppD4DUa/eIZMvAK/SNpjgMZv+wMh0ivSK1arKIgJKoJisMnVmhI7FTdqQfds
	 du3f9eDlT7BtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5604042308;
	Sat, 16 May 2026 19:09:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A0940282
 for <buildroot@buildroot.org>; Sat, 16 May 2026 19:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85F2B42307
 for <buildroot@buildroot.org>; Sat, 16 May 2026 19:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCLOBdPp2Ohl for <buildroot@buildroot.org>;
 Sat, 16 May 2026 19:09:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4BFE642301
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BFE642301
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BFE642301
 for <buildroot@buildroot.org>; Sat, 16 May 2026 19:09:38 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5a88db610ccso1274830e87.2
 for <buildroot@buildroot.org>; Sat, 16 May 2026 12:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778958575; x=1779563375;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=O5RGWi/KL3dJHCPQ0XzH+gyspZzV3DwwpwB85W687mA=;
 b=qe/SGqglgVV4/dd7ZSnuvh161Hp34x+V2/xYgdnUChHxQLOcjSzH/LKunh5Apy10Lg
 TwLspFLVdeR5jUUxmPEULCo4GU3Q45HHMm9KAFcRi3iPXV4fAIiXZ1eM/KhFg2WpfCtJ
 PCmQSZgcfgzm6sDxlY7HD890GSQhv5mNGSlMUFDmWw/mz+QhJGLrsDf1GirXXlanS6R6
 v8Jp8uOsrm//WcFS5kvhxX9NqsCvJ/p5Jg1dwurlyqkd9+3f7VhaCo1JGZ8xDPJpvW2y
 pT208aTQ1u5T1Sr0usTY3T6WsdZKNtMzifi0EylpbmE7ZTz7B/V9Ukw+RTLEjsW7IRct
 3pQQ==
X-Gm-Message-State: AOJu0YzZ4zv5JjYv4ZIC2cnswn/9QnzTA/yPFurdqBNzAUB41POXE5wv
 1qT+yl/qoDo8kjf8HciJ8y6VnDYaa7bSUk2/TguecObkgMJCvLaAcVFY2oso3A==
X-Gm-Gg: Acq92OEgW+8NSNPV8LpR2sSFwPmKqdWkZOBL6+1iAYFYNfp8RObIx3H5GqjqQMHdSVg
 ja42SapDke2a6YJztwsoZqCwPKeAEYoXWtpyRlb2sYq6bWSA5TcXgp+G8cNOPVy/seXXQZvOxEX
 VB6YEb0ecNKcsPVgj2BGUYHwjOf1WDDqbEv1NdnHCKpR37jQZWDDoTUn/H5AcP4mZhOB+83zMxr
 ZFm604GSFJNuOYv4E8V/qpZJNukWZJzoUryRPgdTU1clTZ+tX/AKbdfHC3hHU9FqPBKvzBswGl2
 L3ZXSLz1UpRxa8pCPXWwyXo+Ybowbtzn0QbLgAkzkAfW8nIMDVkDWa/tpmJB8FhNRm5/qAKwthQ
 GR0wZSC+5zBWreBrFj4OF6+d1fDgl4aLmaO0rlP1ZcMjnaoPndTxzWEIPv50mqkuKsNChaMP1AR
 LZCIZY2DbNmT7PGJ+DY58byof2q1bfEsJKbcd+Kn6F5Q6H8uDkFjHzTgDT2gfqVDOJ
X-Received: by 2002:a05:6512:3d03:b0:5a8:6f4a:6a62 with SMTP id
 2adb3069b0e04-5aa0e7753edmr2712802e87.41.1778958574914; 
 Sat, 16 May 2026 12:09:34 -0700 (PDT)
Received: from tollan.addiva.ad (h-155-4-122-253.A259.priv.bahnhof.se.
 [155.4.122.253]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a90f10c806sm2147076e87.9.2026.05.16.12.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 12:09:34 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 May 2026 21:09:18 +0200
Message-ID: <20260516190918.398905-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778958575; x=1779563375; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O5RGWi/KL3dJHCPQ0XzH+gyspZzV3DwwpwB85W687mA=;
 b=Y9gxwUanTEQDr1wp3zUgGebg5NVdbIdOt1wxSnOmwVD6DuV6OV+fppJcpeJPA6vzHz
 pxw+Vzs+cHyHzBIgfHqwD7sUQGe8XH0oqtiE1YIp56qd1ru5Y8XmHBsJwhnaQ1SRPSPX
 P28VzoBDANlZ8w81Q/SRpyywG7dVit4BOctsddyUuLzGlXjdnMDHgcoHZK7Xt4YCI2cK
 LEXi+yrWDQngZSoCpKXIHAIFd56jvzCtsXk4b4EMXFMuD94Y4k9ypXaJRumhXah8z7s/
 zrqm5fEZCZk3LnB8fXMERaXZzrKuwwTsaRs6/bJ3VHVq/bHg084jzXjgNsugMbYSR7xJ
 K1Ig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Y9gxwUan
Subject: [Buildroot] [PATCH v2 1/1] package/linux-firmware: Add MediaTek
 MT7916 WiFi 6E firmware files
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogTWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+Ci0tLQog
cGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4gICAgICAgICB8IDUgKysrKysKIHBhY2th
Z2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsgfCA5ICsrKysrKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saW51eC1m
aXJtd2FyZS9Db25maWcuaW4gYi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbgppbmRl
eCA1OGJhNjBlOWMzLi5kOTFkOTBlNTYyIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpbnV4LWZpcm13
YXJlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbgpAQCAt
NDc2LDYgKzQ3NiwxMSBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfTUVESUFU
RUtfTVQ3NlgyRQogCWhlbHAKIAkgIE1lZGlhVGVrIE1UNzZ4MmUKIAorY29uZmlnIEJSMl9QQUNL
QUdFX0xJTlVYX0ZJUk1XQVJFX01FRElBVEVLX01UNzkxNgorCWJvb2wgIk1lZGlhVGVrIE1UNzkx
NiIKKwloZWxwCisJICBNZWRpYVRlayBNVDc5MTYKKwogY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVY
X0ZJUk1XQVJFX01FRElBVEVLX01UNzkyMQogCWJvb2wgIk1lZGlhVGVrIE1UNzkyMSIKIAloZWxw
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rIGIv
cGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tawppbmRleCA4MTg3ZDFmZWFm
Li5hOWFhMTJhODcyIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZp
cm13YXJlLm1rCisrKyBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsK
QEAgLTM5OCw2ICszOTgsMTUgQEAgTElOVVhfRklSTVdBUkVfRklMRVMgKz0gbWVkaWF0ZWsvbXQ3
NjYyLmJpbiBtZWRpYXRlay9tdDc2NjJfcm9tX3BhdGNoLmJpbgogTElOVVhfRklSTVdBUkVfQUxM
X0xJQ0VOU0VfRklMRVMgKz0gTElDRU5DRS5yYWxpbmtfYV9tZWRpYXRla19jb21wYW55X2Zpcm13
YXJlCiBlbmRpZgogCisjIE1UNzkxNgoraWZlcSAoJChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FS
RV9NRURJQVRFS19NVDc5MTYpLHkpCitMSU5VWF9GSVJNV0FSRV9GSUxFUyArPSBtZWRpYXRlay9t
dDc5MTZfZWVwcm9tLmJpbiBcCisJCQltZWRpYXRlay9tdDc5MTZfcm9tX3BhdGNoLmJpbiBcCisJ
CQltZWRpYXRlay9tdDc5MTZfd2EuYmluIFwKKwkJCW1lZGlhdGVrL210NzkxNl93bS5iaW4KK0xJ
TlVYX0ZJUk1XQVJFX0FMTF9MSUNFTlNFX0ZJTEVTICs9IExJQ0VOQ0UubWVkaWF0ZWsKK2VuZGlm
CisKICMgTVQ3OTIxCiBpZmVxICgkKEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX01FRElBVEVL
X01UNzkyMSkseSkKIExJTlVYX0ZJUk1XQVJFX0ZJTEVTICs9IG1lZGlhdGVrL1dJRklfTVQ3OTYx
X3BhdGNoX21jdV8xXzJfaGRyLmJpbiBcCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
