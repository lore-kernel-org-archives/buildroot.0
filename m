Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E06CC4321E
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 11:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB00D60D5B;
	Tue, 29 Nov 2022 11:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB00D60D5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 72EYKhuwaOFK; Tue, 29 Nov 2022 11:41:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2E1460D70;
	Tue, 29 Nov 2022 11:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2E1460D70
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 220F91BF2C3
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 11:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B10181409
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 11:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B10181409
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_lZsRojN3FY for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 11:41:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDDA1812E7
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDDA1812E7
 for <buildroot@busybox.net>; Tue, 29 Nov 2022 11:41:05 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q7so20736153wrr.8
 for <buildroot@busybox.net>; Tue, 29 Nov 2022 03:41:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sIM/H4rTax6ufnrWhnc//1Gtwqi1K10mrrz8JuVfgec=;
 b=0V5958YY4ALxOpUD7MGhvTcL68JJ4KXLJxzmLd++yA+GMu9fA+dYHKaYL0g+JO66Eg
 v/xJT7VoPX3ecIx7I+xvoidsVm/0BC8zAsxHa48U1M7CJ98uauNnXOJR8lpMQeYg4wZT
 xguWAiK1AsNSWsdpPHCY6JGKBA46wgjnrbXAJprxYs99HtOozV2FWVmdZ8OuGQyvdroQ
 VwGC8LRDNnRM8mgJAydCnPfXo0yo31ZQCeUJ/kZaKOBQn4ET2K3GavQtSxGas9LxhLE0
 s0e8GEiaFXm5B44XZg3Rzv3RS00fhonuu/iOsqtEy+nU7grmVCfk4e8Jk/6n11Qifute
 J9ZA==
X-Gm-Message-State: ANoB5pnYyephD9bhWmqE5OnRRLxRyOu1H680sYQOFbBD2kIZmIhGI57m
 l3M07SqJOei+GagB5U9C5U2qZouLSoo=
X-Google-Smtp-Source: AA0mqf5yLnd3QpCCvLzauJGU0RpRKC+ppus/InJcA1mBJh5F7iD8uiEZBkHxroWcvYK5FEUeLI5ryA==
X-Received: by 2002:adf:ec8f:0:b0:235:470e:a9f3 with SMTP id
 z15-20020adfec8f000000b00235470ea9f3mr33328597wrn.263.1669722064158; 
 Tue, 29 Nov 2022 03:41:04 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a5d5141000000b002365cd93d05sm13252799wrt.102.2022.11.29.03.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 03:41:03 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 29 Nov 2022 12:40:59 +0100
Message-Id: <20221129114059.1372269-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sIM/H4rTax6ufnrWhnc//1Gtwqi1K10mrrz8JuVfgec=;
 b=hoJ0NevmUe0OfYQHCEMXC04bMOw9I8aCRNiQ8TtTdSYFoZRcaQl1DEN7wPlizcOEiL
 Q7J2/RbSsom3rcA/YANPUGrSsU8RdpLdqgfJncMzrBGrG06zHY7FrHnYem8L5o4kX8I4
 hrK+CJURRodP3D+YPtl2fg7RyXqsCHAcB1rABp+mweieyH54DMvWT9ACnhpn07Ig0ho+
 /iUdSoZKA6Kig5zkEhh01wma0S2M6OKTBnuOONfeA7TYx15M4r38e0I3f4IC3AwXpslv
 RFWLFMJjXhG5Fn5cibXC+AqYfFh1ndXWxhKHxoNF9B0i7unoEEYhzcXYjwQdMwZuVC/S
 kw1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hoJ0Nevm
Subject: [Buildroot] [PATCH] package/libpng: bump to version 1.6.39
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch | 4 ++--
 package/libpng/libpng.hash                                | 8 ++++----
 package/libpng/libpng.mk                                  | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch b/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
index d232e4d62..d16bdb2b1 100644
--- a/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
+++ b/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
@@ -40,8 +40,8 @@ index a66f6aa..4e67782 100644
 -bin_PROGRAMS = pngfix$(EXEEXT) png-fix-itxt$(EXEEXT)
 +bin_PROGRAMS =
  @PNG_ARM_NEON_TRUE@am__append_2 = arm/arm_init.c\
- @PNG_ARM_NEON_TRUE@	arm/filter_neon.S arm/filter_neon_intrinsics.c
- 
+ @PNG_ARM_NEON_TRUE@	arm/filter_neon.S arm/filter_neon_intrinsics.c \
+ @PNG_ARM_NEON_TRUE@	arm/palette_neon_intrinsics.c
 -- 
 2.7.3
 
diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 34b0a8a8b..c1f65c93a 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.38/
-md5  122e6b7837811698563083b352bc8ca2  libpng-1.6.38.tar.xz
-sha1  60960ed110094843e5efa221df6a7d21614a4dba  libpng-1.6.38.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.39/
+md5  aa1ae92e172417039bda072b702f6326  libpng-1.6.39.tar.xz
+sha1  3f2386d61eccae211ec4f57899e4ac2ca60d390b  libpng-1.6.39.tar.xz
 # Locally computed:
-sha256  b3683e8b8111ebf6f1ac004ebb6b0c975cd310ec469d98364388e9cedbfa68be  libpng-1.6.38.tar.xz
+sha256  1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937  libpng-1.6.39.tar.xz
 sha256  dfe5a536b0e5a531f844fb9c101a3089aca60772a503893b8e15f9457e369960  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 43b4f373f..a18c36fe7 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.38
+LIBPNG_VERSION = 1.6.39
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
