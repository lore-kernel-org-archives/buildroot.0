Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7577CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 19:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CBA182F57;
	Tue, 14 Jun 2022 19:25:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 61ItA3PNLweI; Tue, 14 Jun 2022 19:25:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCDB3831DA;
	Tue, 14 Jun 2022 19:25:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B765E1BF5B4
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 19:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3E5940A82
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 19:25:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R6Xlz0xopQh3 for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 19:25:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D89C40A67
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 19:25:04 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id s12so19103997ejx.3
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 12:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=23UHLFXr/b3htdj03AWxJGyA+jFxis2+prP7bCEZPi4=;
 b=EgpysFtQm9zON3C0iY/vY8Pol8pufZCxG7jIO+lbFwfTKDqQMAA62tH7BSW47pZVP+
 d629Hqkhd0Yq4Le2OL5qfkTprayhrqgzYdXsih6bqVsVPCnpf1cFtV5+yYCvvlR6ti2g
 Y+kME8FRscWCOVHjczatzMY5Z0Z55r2U/+G8CCd3yNCDGjIcVrcwe9/tsIBPj/D3Kv2G
 hQQbZtnYfQr1KwIC0aT23bB4ISJJck1MlksAKiGjNp4TUT7dBYlExGNwwSzhuR6lSg6r
 1z25Jl+4sFBVKNOt6f/zZfoQGUdRfnSHujGS5UQ44NZ2H4w/8VOuXPdSY1M2VN7253sF
 +kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=23UHLFXr/b3htdj03AWxJGyA+jFxis2+prP7bCEZPi4=;
 b=yXNPCMEHf6pcBx3Sq0duMalGDuFW6at472obLmbz9ykT+5jnSmExIRC6CJLEoBtJd/
 VhPD6PTjF8FJKVI8YLmG/zv7gRFjgUYv+FuBbNARdpgXvI5lKuhCrlkPmKXWjT2l9X+L
 FJd+FHiD0k1QNVmRQbIL60T29ZGnO/5svuZx9gHYS+tZ47kY9AgbLLoXhOrZFJzdy1FK
 hORNBbrMCALm/Mcp1oWCSgh/eaK9qmmtHsnTGcE2XhA6kHpsedmabTUPaECOrYEH1oxx
 qKhhAiI8UQ6arkaWVfwHHpuD7YZIWx7XoHKgXpbWWDH2F+miMDe88L0qsIQmkpzt/ap6
 3nJQ==
X-Gm-Message-State: AOAM533eokSnTyN0VpZtiUlJLeDX0JAClldzXSFwAmSmaG/nWV1KFUmk
 JHsRdQJhkEedDAiJJnJsN7DthgoL5pNOkA==
X-Google-Smtp-Source: ABdhPJyONx3sDP5kjRkEmMhj5BcTgDzxJsEkLLOm8oeDHnNsHk85fQjlkuf/r9r0WcmSjTrCPDRFEA==
X-Received: by 2002:a17:907:7642:b0:706:fd3a:61f0 with SMTP id
 kj2-20020a170907764200b00706fd3a61f0mr5612043ejc.503.1655234702739; 
 Tue, 14 Jun 2022 12:25:02 -0700 (PDT)
Received: from localhost.localdomain (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 i27-20020a50871b000000b0042dcbc3f302sm7577976edb.36.2022.06.14.12.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 12:25:00 -0700 (PDT)
From: Ben Hutchings <ben.hutchings@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 21:24:45 +0200
Message-Id: <20220614192445.2390329-1-ben.hutchings@mind.be>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/wolfssl: Disable broken asm
 implementations on 32-bit Arm
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

wolfSSL has ARMv8-A assembly implementations of some functions for
both A64 and A32 ISAs.  However, some of the A32 versions use r11,
which is usually not allowed:

wolfcrypt/src/port/arm/armv8-aes.c: In function 'wc_AesCbcEncrypt':
wolfcrypt/src/port/arm/armv8-aes.c:3303:5: error: fp cannot be used in 'asm' here
 3303 |     }
      |     ^

That can be fixed by adding the compiler flag -fomit-frame-pointer,
but then there is another failure:

/tmp/ccV19DQV.s: Assembler messages:
/tmp/ccV19DQV.s:248: Error: first transfer register must be even -- `ldrd r11,r10,[r14,#4*14]'
make[3]: *** [Makefile:5858: wolfcrypt/src/port/arm/src_libwolfssl_la-armv8-chacha.lo] Error 1

This is definitely not a valid instruction in A32, which suggests that
this code isn't being tested at all upstream.  So disable it here.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 package/wolfssl/wolfssl.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 58b6f296ab..ff6a65c397 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -33,14 +33,12 @@ WOLFSSL_CONF_OPTS += --disable-sslv3
 endif
 
 # enable ARMv8 hardware acceleration
-ifeq ($(BR2_ARM_CPU_ARMV8A),y)
+ifeq ($(BR2_aarch64),y)
 WOLFSSL_CONF_OPTS += --enable-armasm
 # the flag -mstrict-align is needed to prevent build errors caused by
 # some inline assembly in parts of the AES structure using the "m"
 # constraint
-ifeq ($(BR2_aarch64),y)
 WOLFSSL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -mstrict-align"
-endif
 else
 WOLFSSL_CONF_OPTS += --disable-armasm
 endif
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
