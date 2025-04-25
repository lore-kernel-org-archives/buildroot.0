Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E931C369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 17:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB35E40631;
	Fri, 25 Apr 2025 17:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFs1D5Vkh1Wf; Fri, 25 Apr 2025 17:01:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6C1B403FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6C1B403FF;
	Fri, 25 Apr 2025 17:01:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C56D159
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 17:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E455612EF
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 17:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQw7Nkmt5lwF for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 17:01:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9EDA8612E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EDA8612E4
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EDA8612E4
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 17:01:32 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5f4d0da2d2cso4751807a12.3
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 10:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745600490; x=1746205290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8yxvKJXIVigyDg2BmW+AkCIvIavxZpvwKXS0v0nF680=;
 b=rPresgu1gj98yIjobfI3BY+doUR3wYM6SXof2auXGeKAzeFEL8SP6Kzi/Sh9XLTzZY
 FgnUkU3hXoMZM125H3d5+Yn+0lpH409+0wLDRhJ7mDKmNFGDtyHRz78PDfrpSVPXaVBd
 RQZ2C4W7xfOJ1AJ3+OR4LpAmHcofcsvKfG8JRb9cPFNqxNX9o70Xxi5s6L3kSis18Mxf
 nN6ek3F08au3iw7OzWs3gHbY96PFFw6uTnnVASM0q/juuz6AUcXnaHFVcg/z7jOYnIhL
 z1Ym3tGydmEGqedY1VEF82gxSqMky/CatoelRRomn5vnzPQiWVGDcJG0LifPw2h9Hiam
 KYzA==
X-Gm-Message-State: AOJu0YxYK5owgF7ReFBxJKi/heKTQXOYYpNQ04tq4vS6o2QJYJtYlk9v
 m+6EmDoSZiL0fIpA7ipMSkn7fxfqBn9KIVooOKX3gi/GKK3VJlIdBhXSxo0tKVom73KkdXbHnSi
 F/aUY5Q==
X-Gm-Gg: ASbGnct7jllbqSj3wGF4fAeMt3gKiuMr3EOLMtHYCngK1sMc8j86mWQZTif594/iua+
 fAtRc4BgSr1072/v1LZNZlDRtBOi8BVmoKeZlJQezbCe5k/spM/K5oNgogDJOhVWZ+xf/AVLCHg
 fu+3NwTPy2sCEqa7IvVOBA6rLnv7Yulkvy4jxy7Nsa7iBFTzaWU6Ty05ZeytZFI76svnvhDAZ8k
 cuiio9ZvgPKUA8FZdfAa4Us9DnOw5+Le2pzmvgkesdgIRlDWECak3kvuDZrJGlp5VQhl2BVWnKa
 PfL3cTbIRG2T1hOO3sVr1+5O5K16iTnujzoXBC3X80fsD5acG48LdljPZybHxIDrMw==
X-Google-Smtp-Source: AGHT+IFAbVPDrLkIUSu2DhSeOqQ2lPXXXnRDgu1M8kmqaJW1dxbEKa4vhF6xlpleZFeLIgvoq3YDRg==
X-Received: by 2002:a05:6402:d08:b0:5f6:25d6:71e1 with SMTP id
 4fb4d7f45d1cf-5f7394d88famr225433a12.0.1745600489870; 
 Fri, 25 Apr 2025 10:01:29 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f703833c8csm1480438a12.72.2025.04.25.10.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 10:01:29 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 25 Apr 2025 19:01:07 +0200
Message-Id: <20250425170107.1110426-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1745600490; x=1746205290; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8yxvKJXIVigyDg2BmW+AkCIvIavxZpvwKXS0v0nF680=;
 b=SDkj4I1mvdzgPlMLG4s9UqyYb6VqZqSbgvlq4Hdz1UE6rhTGEkSP5bXYnzUkJ6LhGS
 yRLTckn/PcKgumaDB+p6C3qYwf5CvLkyLFKfzDeMvH+qWJFGgKOUAVO3708HxFGBfnVc
 +5ZMtvHWwi4m4GiRr0TmbHtmicc0dfJ658svwjkpQ0V/E0AEPJUm/gv70/sKDcFWTW2F
 XzRddAkTm4SLz9lKixEN9D9qMuniYr7zA33E+74IivCYBv4dOGOl8/H7p96onWgrNq45
 02wOZeC4NvwnpSBXe6MKneHWnnza9IVz2vmaxMAS3I8D39fQbohxH0gXmJ6ixcOPy0Gm
 eOqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SDkj4I1m
Subject: [Buildroot] [PATCH 1/1] package/strongswan: fix build w/ wolfssl
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package strongswan relies on the `wc_RsaKeyToDer` & `wc_MakeRsaKey`
functions of WolfSSL. Building this package with the WolfSSL backend
by selecting the variable `BR2_PACKAGE_STRONGSWAN_WOLFSSL` would give
the following error:

```
libtool: compile:  /home/buildroot/instance-0/output-1/host/bin/sparc-linux-gcc -DHAVE_CONFIG_H -I. -I../../../.. -I../../../../src/libstrongswan -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DWC_NO_RNG -rdynamic -Wno-format -Wno-format-security -Wno-implicit-fallthrough -Wno-missing-field-initializers -Wno-pointer-sign -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Og -g0 -include /home/buildroot/instance-0/output-1/build/strongswan-5.9.14/config.h -c wolfssl_ed_public_key.c -o wolfssl_ed_public_key.o >/dev/null 2>&1
wolfssl_rsa_private_key.c: In function 'get_encoding':
wolfssl_rsa_private_key.c:366:31: error: implicit declaration of function 'wc_RsaKeyToDer'; did you mean 'wc_EccKeyToDer'? [-Wimplicit-function-declaration]
  366 |                         len = wc_RsaKeyToDer(&this->rsa, encoding->ptr, len);
      |                               ^~~~~~~~~~~~~~
      |                               wc_EccKeyToDer
libtool: compile:  /home/buildroot/instance-0/output-1/host/bin/sparc-linux-gcc -DHAVE_CONFIG_H -I. -I../../../.. -I../../../../src/libstrongswan -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DWC_NO_RNG -rdynamic -Wno-format -Wno-format-security -Wno-implicit-fallthrough -Wno-missing-field-initializers -Wno-pointer-sign -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Og -g0 -include /home/buildroot/instance-0/output-1/build/strongswan-5.9.14/config.h -c wolfssl_ec_private_key.c -o wolfssl_ec_private_key.o >/dev/null 2>&1
wolfssl_rsa_private_key.c: In function 'wolfssl_rsa_private_key_gen':
wolfssl_rsa_private_key.c:490:13: error: implicit declaration of function 'wc_MakeRsaKey'; did you mean 'wc_FreeRsaKey'? [-Wimplicit-function-declaration]
  490 |         if (wc_MakeRsaKey(&this->rsa, key_size, WC_RSA_EXPONENT, &this->rng) < 0)
      |             ^~~~~~~~~~~~~
      |             wc_FreeRsaKey
```

Those functions are only present when building the WolfSSL library with
the keygen supports (`--enable-keygen`).

This patch change the selected package to enable all the option of
WolfSSL, which include the keygen as well.

Fixes:
  - https://autobuild.buildroot.org/results/d0e/d0e94f501ad1afd25ae4112443f9af101dfa5dea

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/strongswan/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index a62688f9c3..22caa2a573 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -59,6 +59,7 @@ config BR2_PACKAGE_STRONGSWAN_GMP
 config BR2_PACKAGE_STRONGSWAN_WOLFSSL
 	bool "wolfssl"
 	select BR2_PACKAGE_WOLFSSL
+	select BR2_PACKAGE_WOLFSSL_ALL
 
 endchoice
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
