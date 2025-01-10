Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D84AE7719E
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 19:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A5D540E52;
	Fri, 10 Jan 2025 19:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KmMLJGqNbmeK; Fri, 10 Jan 2025 19:54:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12FC0411C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12FC0411C8;
	Fri, 10 Jan 2025 19:54:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0C4F94F
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B08F83131
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9mUupG3zfGfE for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 19:54:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 54B118372B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54B118372B
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54B118372B
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:17 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so18353935e9.1
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 11:54:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736538855; x=1737143655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZR0xTbO9lpDNEPrGaM9bt8C+wVenQ6PEVvqYInBHmYI=;
 b=xFgYJZCE/FMkSjqBwvRrSViro4v/0YNzG8hsZt6VbzjUbUOIE3zE1M1B9A/DiVMSjy
 YhgUhog9Ev27AT/Mwzfg52ZkjiMto2d/II1dPADdekTSBpM7RZpz/VqLrPVyZG2/OiKV
 eLC9WWRTwEI4RA008WphaU0gjjKWcqdT5QJVMc12rt2PshGkf3SpY5iv++0fRIRViFAi
 zQ3PXjpjhdRa/dB4nYXT/jp7DM5hVcl8iykp7klsc8GpTDZL64XCxSqAvp05B42qKKr0
 fbBZ7LE78whmJaaP1dUAt4gtogSH3WgmD2vxMD5W9HWorajDgO466PTSojidvw2mFFbO
 dKsg==
X-Gm-Message-State: AOJu0YzfiznMAgEIsGUW7gv06C+0JTbSXVtsaZgBOJysuGtu3L9YYadN
 FtkZip2sUDfnjg55WD8oh/7g25x+chUsxhrwLWnjlap8KeGVY3IJk2WuCQ5Nk5Kdf9EQ4RoxPG5
 v
X-Gm-Gg: ASbGncs+Lyn7yogeU78d41u2vvJrvtNXyL2aajMjnOc7J6F/S3dGv4v1Rvox2p/Kt8u
 hXCoy6HD20GBFJFZHQcNVW8MIGciuRNKJx7+U5IWjY+m5WZ3WSMPbNHEkOJvHSmblRoafbRJ6yV
 IL7J2VTHEOgdhAFPzXN1iwc36RPe0iS9HEn6KNkfAVmIlzz42SsyFvxC4WX+Lnrhbm4pO+swfAo
 AIxJrqct3rb208mKC+7xWdiYtkF7SYb1sOnaLotBjUbjC+CrGZqdAgdDap7tivbGb4tTQ7+cc1b
 uSgG1GZVd8Fcg8A56cDa7sPwTO1A6R8tqgvSh5G2fFTARN47tKX4ag==
X-Google-Smtp-Source: AGHT+IFA+8KDFrRKz9ARo3GkP7O5cgid+E5MJJ9lqa7byAIe3kaJlmeWIUNbKmcCW2n6XRscRED0Vw==
X-Received: by 2002:a05:600c:4713:b0:434:ff08:202b with SMTP id
 5b1f17b1804b1-436e26970bcmr116773975e9.12.1736538855470; 
 Fri, 10 Jan 2025 11:54:15 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da66fcsm96439635e9.6.2025.01.10.11.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 11:54:15 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri, 10 Jan 2025 20:53:57 +0100
Message-ID: <20250110195359.3358022-10-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110195359.3358022-1-romain.naour@smile.fr>
References: <20250110195359.3358022-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736538855; x=1737143655; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZR0xTbO9lpDNEPrGaM9bt8C+wVenQ6PEVvqYInBHmYI=;
 b=lPvuDtPwS25DKwwkn9OiEp/41Ah4hfuMKhcLWcX+p3nfD9cxAeBaHTDJhKuLjm8cW2
 ni7NbsMTc9V2wOdi3gzaDIxWtJWi6xrgRAaknvavtjl529UwE1bdd/U2v+rizwQGmefL
 qeBN5O+DaAHI+X+DFw88Z9lLXGSBKyQkzuPIQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=lPvuDtPw
Subject: [Buildroot] [PATCH v2 10/12] toolchain: remove
 BR2_TOOLCHAIN_HAS_GCC_BUG_99410 (nios2 only)
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/belle-sip/belle-sip.mk |  4 ----
 package/matio/matio.mk         |  4 ----
 toolchain/Config.in            | 10 ----------
 3 files changed, 18 deletions(-)

diff --git a/package/belle-sip/belle-sip.mk b/package/belle-sip/belle-sip.mk
index c9bcc3f55d..b4de3612ce 100644
--- a/package/belle-sip/belle-sip.mk
+++ b/package/belle-sip/belle-sip.mk
@@ -35,10 +35,6 @@ endif
 
 BELLE_SIP_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_99410),y)
-BELLE_SIP_CFLAGS += -O0
-endif
-
 BELLE_SIP_CONF_OPTS += -DCMAKE_C_FLAGS="$(BELLE_SIP_CFLAGS)"
 
 $(eval $(cmake-package))
diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index dc9be2ac18..d378f06e5b 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -19,10 +19,6 @@ MATIO_CONF_ENV = ac_cv_va_copy=yes
 
 MATIO_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_99410),y)
-MATIO_CFLAGS += -O0
-endif
-
 MATIO_CONF_ENV += CFLAGS="$(MATIO_CFLAGS)"
 
 # mat73 require hdf5 (not available), extented-sparse take 2KB
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 23123138e5..86ab3710a0 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -180,16 +180,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
 		|| BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
-# Error: branch offset out of range on Nios II. This bug
-# no longer exists in gcc 8.x but reappeared on gcc 9.x and still exists
-# on gcc 12.x
-config BR2_TOOLCHAIN_HAS_GCC_BUG_99410
-	bool
-	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9
-	depends on BR2_nios2
-
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
 # ICE: SH4 -Os causes internal compiler error. This bug
 # still exists in gcc = 11.1.0
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
