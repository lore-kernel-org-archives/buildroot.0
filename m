Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD789C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E5DF4157B;
	Thu, 26 Oct 2023 09:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E5DF4157B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urNN490j-GkM; Thu, 26 Oct 2023 09:55:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 333FC40A71;
	Thu, 26 Oct 2023 09:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 333FC40A71
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB5571BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A62A240971
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A62A240971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ckpUI7DvoZQS for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:55:23 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80306409E6
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80306409E6
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c50906f941so10538881fa.2
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698314121; x=1698918921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WLspFdTmn7cAmta4C5QoKJ70aWvO/ANXtHHHNgczmTw=;
 b=NkSOnueM8ISza1Bgxa9nXJZeqQYrPxorwSAcKAKskqE7O1s4iRxhAypBTZFJRW6VWU
 ccUwybiUZKEu9/V0vEBmLzOu7yYiwOt8Fgyj5loberN890m/gOSsdU4o3TIhbsdVjKJn
 FiAaaFdefYjPAZ4fqfjK7ZJaJa4RnkKqyucaR6jdYYv8LxQRxtsx8mBda4v2Ufa5Yp9v
 8fS5aaB8m5f/I6EnIR1jMzeazZmQe+Wyo96+gBwqtx4j2/AOO37m8z2QyuuJmplah+eh
 wsbgGxTLazCdRTYkeUtOd2Hd0UngGPxelm/yWByoqjl3fWzOEVlNoxMomnkDAObRN5xB
 7WGw==
X-Gm-Message-State: AOJu0YyCJvOdNZlyUrm7PDmkEgkZxrMUWyoI2sHAi9jRxUY2jtjYQk9h
 hslhRzU9IfuqONAZPgdDZYl3Idl1Vf5uAZJnKEYdKw==
X-Google-Smtp-Source: AGHT+IFif/KShrrIy1Y5P+GECIQnguD0t1YBaLa7VC7H9mpSyhlusQIDt9iZuqpylYM+43Q33kbdFA==
X-Received: by 2002:a05:651c:1542:b0:2bc:d94f:ad04 with SMTP id
 y2-20020a05651c154200b002bcd94fad04mr13426948ljp.13.1698314119924; 
 Thu, 26 Oct 2023 02:55:19 -0700 (PDT)
Received: from p-nan-fatho.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c35cf00b003fee53feab5sm2147196wmq.10.2023.10.26.02.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:55:19 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:55:06 +0200
Message-Id: <20231026095506.876284-1-fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1698314121; x=1698918921;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WLspFdTmn7cAmta4C5QoKJ70aWvO/ANXtHHHNgczmTw=;
 b=Y2hcBHv3BvKEltgxM4ZuIz1QT2AKGtW+bYbZUbkwfGjH24qj9MucQOGOGzUjT2C/T2
 p+NVrbC9ri0A89zN1ixQ2aoMz1N1ztXoWJ7ic/T5uu5QCIx3Jc5Oeh26exzLDNAA/3NG
 wP/Ske9HEbUENynmIpnMMwZ6Wh+6beCDA74gyMwwiImY9w7QWAjr+EhaZR9R5oiJHvFk
 UmtdW42NK9yxkc38F72hMgrPViRz98wVEinhxsggKfmf+py0vcI2Nz81djhAlf8VkErn
 In1S3vgWKWLuxMgefenqw9QSMbwuIjdxsbqF+o7cJ+HN86NPhd5Pp7jHEw9GdFBY+OaC
 bdTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Y2hcBHv3
Subject: [Buildroot] [PATCH] package/nettle: add missing host-gmp dependency
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
Cc: Fabien Thomas <fabien.thomas@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the generic package infrastructure removed auto derivation of
host dependencies [1] (2016.08), the host dependencies must be
explicitly set.

While adding the nettle host variant [2] the gmp dependency was not
duplicated and host-nettle was built without host-gmp (or built with
gmp installed on the build machine).

While building host-gnutls required for building mkeficapsule u-boot
tool, the configure script check if Libhogweed (nettle's companion
library) is build with libgmp support.

If internal toolchain is used, luckily host-gmp is built before
building host-nettle (and host-gnutls). But when using prebuilt
external toolchain, following error shows up :

Libhogweed (nettle's companion library) 3.6 was not found. Note that you must compile nettle with gmp support.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/4bdb067e380e72c3a6cb9c6ccf3791a6cf8661e0
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/dac6e3011883ce3b35cbf64ec156186153bf0032
[3] https://gitlab.com/gnutls/gnutls/-/commit/eb24bfa808ee029e9b3b198d66d29256eea3fd08

Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 package/nettle/nettle.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index dd4dfbbe38..e2e3219057 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -15,6 +15,8 @@ NETTLE_CPE_ID_VENDOR = nettle_project
 # with static linking
 NETTLE_CONF_OPTS = --disable-openssl
 
+HOST_NETTLE_DEPENDENCIES = host-gmp
+
 # ARM assembly requires v6+ ISA
 ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV7M),y)
 NETTLE_CONF_OPTS += --disable-assembler
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
