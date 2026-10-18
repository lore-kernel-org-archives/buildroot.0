Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00FFCCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 18:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8136560656;
	Sun, 18 Oct 2026 18:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D6yf_eDxZZSh; Sun, 18 Oct 2026 18:25:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9D9D660622
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792347916;
	b=gQYkaSfAWAVkkjlzYauDrIc4AEoEaKMPMyej+T08WpklyI5bL8kA1jf5Ecna4Xq7QLqn
	 HAHfK5A4e5SoKV94U6kbqam0mGstTUZ+3yDcbjzqBf/hDWXQL0CNPiSXXwOMOxxaTnPDt
	 p4zAdMzaalxND6VTrWuVHKVQgV1uidLW6ie73T2rqYd1PZcuHXfPHGMMOFOsy5/mBfEEy
	 wC99MW29xZlXlYPzMGkAJgKnCM/pYSTx1hpmgcMegD/ArsGio7Kubc9QAn5qy0VQjjQL0
	 FVy/SOyN+r8UvNtfm+xoaSjXEA1exr0uB9vM3FvO3HvU/Y4V1KKXAvyLFOV6aMHflBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792347916;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NbK41+6QADSedD3/W+9KKrg3L77V8iR0DrVreAE+YCw=;
	b=T00ll26k2O3ef77drr1EgrLp6XT4XkRcQ0uBhrzNElS/d1RDTCK6V+M6583FWx7ZZdi8
	 mv6u1IfirlfU7FeCajlEcEzVHnsaenll55x0yfsrWhr9yfPrtHycOMX7nZuEScJfiUP+u
	 5LTBpyvb4F5RPNUdkDGsql+pnI2H9+MFMXdBTN/F7FegH3Yg2MVBm6oI1OYbD9A1OC/DM
	 a943wEehjqFaAgyWbtUjzY6ZVGaaMmP+SA50gKoqq20K2m7a7y6J8vprZIMyS2FleK1j4
	 tzoII0dW9qxwUK/NfYQAqpjF6I73n62cmbF1WEENMPcn/EjG/+5QgxRu8fwGJkxaRNg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792347916;
	bh=NbK41+6QADSedD3/W+9KKrg3L77V8iR0DrVreAE+YCw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=rULAQ7cjhLR2WyusvySK7Twvhdz1lSTLdKrz8WXSeZN7AduXVZUkJUEMiuqQoz7TJ
	 dtClPxZj7r0nDKE81xAPuNDL0orc+31HiIJlDXABc42kbhv4Wa/G/Vq3JLEXwkHyCR
	 tlV7TyEHuTc/HWyLjVKyIktfTpVSuAfc5vgJ5rbd+YwNITje1CLol2Jawb223rfQTe
	 533s58AyqBvAE4KRGT3Sk4LSZJqHqNEdbQjJXou2I7KNeav/pPSlJJtOcbGlsIFUGu
	 UgBaFoLk8TQxC+KZNGWlT5cCQp1s+NSqlsfC2h/al4tYhEjNIuhOaEAMVGxMtnvvXm
	 zLT3603RtYkow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D9D660622;
	Sun, 18 Oct 2026 18:25:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E7E231AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC447406C3
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbtLfxPTVuUF for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 18:25:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D043440677
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::236"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792347913;
 b=oVWqXXrq1thMrPQSP7WktIsrRCJSh03NJ3dYgXz1V9xBdPh2lGO1d4EC1HqO9iy1M6Eh
 1AcTspIhhXSVfFoBEOIDAmuuZ5hypAy94cQ9NAtj/AFgehihOZ1gJMF9P8FTX/TXVFJUW
 2NlUVw4ggCXCZdxs6LzapP93lnvE1UPLNm4ZfY8NsoAIVdoeaaLRrwEL5Zr70S8mpj5OM
 fRELgY0fhs6YjOlmt6UPwugRLMXLNtX/d6CvsuIzYoMSfkNay5MniVNQMVm7M4dXOojEc
 dA7qZ/q4IkUZ2VRWBoYkH6ToTgGZ2mytNXK5ODUhOgwSCUW9cjSfxmAxbXo4KNrX3tg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792347913;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=oPpYocx6IdWgZIxb/p7x4NYUjeU+6MATxGMBKmTtKHU=;
 b=FYMfZPinFwRYN22gfnER3CTV6vHVUTsfBhK8fGVR6zYDQp4yQjbAinnZSfdMYHHL9gqC
 /mxKMpGXO1ArgFmvEjmGDN8HtC3Ig8a3UA84s4tz/ljlZxzRmvXyZe1J+p758r+I3mdQt
 d6hiKKrxBb4oRqZfyKB4/Ybe5d5cMvziPGra1o2wPJx92gxtMCUu6X+uDX6fB/ncJM/RM
 zyaqjZ9x+Rcc8bQzKa/t1g9n5rTbT7TgT7diNLlkMk/NUvRdX5UREUFTGUhnDcn9cNXH3
 t/37k3rhSrIhsvqdbupGOD4t+HGuUUBpKjFwGcypi+Z4UpxtVQbVSSWzow1H8AkCc7Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="J/23XbLk"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::236"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=J/23XbLk
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D043440677
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:12 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-4f48d91ba7dso899488b6e.2
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792347911; x=1792952711; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oPpYocx6IdWgZIxb/p7x4NYUjeU+6MATxGMBKmTtKHU=;
 b=J/23XbLkQ3e5TXQausThitPhYbhQsuuw7HCUrpj13fI2n7/caIpB7FVq35tENPx1pc
 TkZNAIX+L3OGGsfADNf7QHebF8GnlCRv7RA1egUafH0x6y9zH/oqcfEzKvPqosrFtCO+
 h1ihdA310dyD0MLpXNqyI8JTjh/6p8wTNu/GHm8eaF8JAWtF8hZllrxkSg8J+470JpJH
 S+83TtVcNu5kZTlLTUOylkLaZ43/SNa8eTpe30g3dtAeh9sMQz4PTX0djvJrdxxjSCQG
 7y2FXZpJiMhAMoPNqKS/Tbc7ynCdntkypLrWZl036Gkt0VrzGq/vJO0+c2HWgHGrgr2D
 cDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792347911; x=1792952711;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oPpYocx6IdWgZIxb/p7x4NYUjeU+6MATxGMBKmTtKHU=;
 b=hHS772/2VdanjVa0m0eQEY4Sa+xZI8HWF5CUGvfGwETWGW6v7axCpznGf1el1GP4v7
 vB0UAigcfl6fo42QNeK9qUPaIYyaNHEIqbhJZ8uyzXGIA/swnhk9Qe0mJiie8TN40JrG
 ZJOEnZl1De6M0rw+dfeSlKtTuQwjAtbTWzOhxqKvIvOaaysXsuDcgHj1b2D8gyowjvE6
 2Rqk6q706hoMNzZ1Kw6pBOJ4y4bnXvKt6vwjjYq8uY5i1+YGxPB1/LJFEwDkL8NSTJIu
 AEBb0P7/5EfKEq4dgy6RZjlnHrNtrMOQLlUPvH+OF9av4qRPP1ngCuWvYk4XPo//5jCo
 2evg==
X-Gm-Message-State: AFq9FYIkeM36ZKGa3iYjTIVemm69oVwRS7YNstcK6FNiMyJ1pcWt9UOg
 50WIVmiE4UKKlw2vBZReN4zwjfc4IfvuNccBx+xn7bJpQIfFj+t5p/rwo10tnw==
X-Gm-Gg: AYBFou0NgoJY1ZUmroGsldiSmDxzA2JLpsRBP89/IiGNsYCWsKJO/VaZxBpes7v+iw/
 ivbztqSXHSQL9+6mkpHfGgs3NLLJUwKgV1s13TUBHkXDUgSuG4C4hvKaI4tsSBFuEkcrWxAyxGW
 U/AUhGDIfGpfRgpe6Wwl5wHw9aMpTH5hUZWOjNIah5TXLtuQj+E9EbUfzQbmBOYjbPKzivyFCau
 LcsZj1Kqi4Hdtl1SyYuJ2KbretrMTZKIkWtOfHlaZ9T2KH6q6tTlCpi4zCGCFprFkEP/VA8EVhl
 EeJSOrQScnbxgBIlYYX7u5I269ClJSPcr/Um9qd40zCe3uiIrhSJwBjB44+DmeJup2ei0wid4G0
 andvG19mmCr/WSnKsCudky5rGON2ionkNQ/JXwbND7O1QCN9hjMq394r8i/WaUwAfT0tH5EqrUs
 7y3ajx/WZvRLQkfw2fO0cUuh5vcIh2b+/OP/cX6kC+09/QgjfD2HeRAIqatnEa1KxLs/m6eVe6z
 cJ6eEQPWYLfyjHZVr8O0tpat4C39q3wfEfCwLAD07XPaIR/8T2k8nA7h+/1sb1kSEYUfc5sycAX
 WOJHm+6wmXBdFylGGxOxEMFNxm0dIhh805wZlDqLHpJyNkkf6ozDfoIAfQOIe9Kw+vRf49UAW7y
 CpiFswkzYLdsdfRksa0KPqjxwiXaYMDgLXAfnzd7YNrA=
X-Received: by 2002:a05:6808:11c1:b0:53a:6769:c365 with SMTP id
 5614622812f47-53cd1cbb033mr4698454b6e.12.1792347911395; 
 Sun, 18 Oct 2026 11:25:11 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5388a5572b4sm5715659b6e.6.2026.10.18.11.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 11:25:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:24:42 -0600
Message-ID: <20261018182507.536698-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-certifi: bump to version
 2026.10.18
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index a0c24e66f3..c6e0206ea8 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  926857e560a3ae443ee35c2de270d75b  certifi-2026.7.22.tar.gz
-sha256  741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55  certifi-2026.7.22.tar.gz
+md5  915d53b5fceb004991800f62b552e0c0  certifi-2026.10.18.tar.gz
+sha256  b9995d97b64d0431a5af837d8ca8cd6238104d1f319f04bd93ea43124d6c861e  certifi-2026.10.18.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 17c6925ae7..5430596350 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2026.7.22
+PYTHON_CERTIFI_VERSION = 2026.10.18
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/7e/eb/a2aa1ac3ea30dd3f30ca57f40232138b6b0040719316ecb85daf61167771
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
