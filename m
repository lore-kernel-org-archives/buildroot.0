Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB89C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 05:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC11560BE1;
	Mon,  4 Jul 2022 05:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC11560BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MURxVQwQnKAc; Mon,  4 Jul 2022 05:57:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D05F960C27;
	Mon,  4 Jul 2022 05:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D05F960C27
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 111241BF3C0
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 05:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC60F60D6E
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 05:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC60F60D6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kTP_y6LDto68 for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 05:57:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13EBB60C27
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13EBB60C27
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 05:57:09 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id e40so10328592eda.2
 for <buildroot@buildroot.org>; Sun, 03 Jul 2022 22:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bqSBQgHymffSppKvmcZd+hw+w2SxZEPH93HmqwUU8fg=;
 b=s5SvY9b9hAOm6QQ6ngx674sVYqq4bW7hy9M3IpP1EDsJcdpC/Z7RSqEBAPHp9pvG5w
 xV1LMSr2+wz4NrfsewVyYA67L85v5t2+zWQwwTWtqI+S9FEKNUHU8BfODNwNhATLHCEB
 uZYtjQ2XdBRLOu88DEp0mWTsIGSIgenia9rz+1inFPO45/yseogInVsaEAQQLdMZQROy
 5iqLnKLjYp8L7rgoCd15fz8gwpbWeK16F6NOAGscsxK5VRex1odlEA+iwF/sV5oDJFN5
 pjOsD3BkGvzgfpiz/oH3LLDHjB3QpegGSqGnkOrdc2kowuWaRQSmb4rNoVQxa20ZexQG
 LdWQ==
X-Gm-Message-State: AJIora/uER5z11+8pWvEHx1IohlDMqN3mqGveOkKptU8sp391aS2yaEr
 8DyXaIBi1pGkAll/CFkGX7S+lkEdhcA=
X-Google-Smtp-Source: AGRyM1t0asdaPUO/D7oElmLv2W8Fa5X210wWelUeeK7QVjBcj2SiSmPDeZ3/wYv/gI0hsm4q3fZgWA==
X-Received: by 2002:a05:6402:1cc8:b0:437:a61a:5713 with SMTP id
 ds8-20020a0564021cc800b00437a61a5713mr36819096edb.340.1656914227973; 
 Sun, 03 Jul 2022 22:57:07 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a170906780600b006fef557bb7asm13729888ejm.80.2022.07.03.22.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 22:57:07 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Jul 2022 07:56:51 +0200
Message-Id: <20220704055649.2780-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220704055649.2780-1-heiko.thiery@gmail.com>
References: <20220704055649.2780-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bqSBQgHymffSppKvmcZd+hw+w2SxZEPH93HmqwUU8fg=;
 b=cVEHeoIqd40s1HIEozMLgrYbNu+JpH+s6oSaU8QVsHNcwtpOWPEHtOL1SvXbSJttBO
 YgezmyRWjjAG034+cOhccP2YSZjYb9tMX0uFTD50HvQ66PlGb0QMKwvEf8sqO2sMI/no
 O0hXnyHYfXrTGWE6zq30ZF0ENagD2cIZqvdllCsrhL0YSMXWgH+kwSmCvj4JZreRGj2C
 O28IMJVbKe3Msxt+2qy1azUkxc3SMnpt2KTx+TuGT5de/cqH7wSNL3GJw7Z4dgBDdTRR
 Cas54YhMZyBr9+kLkZzqg3Pd7qk2QDCSUjnvxUvX0A8oq9vjHU07zmN5KpSy+bkKjwVp
 6xlA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cVEHeoIq
Subject: [Buildroot] [PATCH 3/4] package/libnetconf2: bump version to 2.1.11
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libnetconf2/libnetconf2.hash | 2 +-
 package/libnetconf2/libnetconf2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
index 1d4707f44b..001a51d682 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3044f36c117a5eaad01482d0caffc30cb2a87c66090d3cd9c946fef85b8a2394  libnetconf2-2.1.7.tar.gz
+sha256  0b0f0c84291710b0ca2497e1e02504a5ded7b83d49deeb4992bea7936e1d74b9  libnetconf2-2.1.11.tar.gz
 sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 00d2c08f63..6aa9aa9498 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = 2.1.7
+LIBNETCONF2_VERSION = 2.1.11
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
