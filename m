Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1210C6FD1F
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 08:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5324416CB;
	Wed,  3 Apr 2024 08:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zv86lud0Uraz; Wed,  3 Apr 2024 08:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D51C416D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D51C416D2;
	Wed,  3 Apr 2024 08:40:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A1CD1BF44A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE50882023
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqEKWJx-uplv for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 08:40:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0205E82027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0205E82027
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0205E82027
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 08:40:42 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a4e8904bd71so206659766b.1
 for <buildroot@busybox.net>; Wed, 03 Apr 2024 01:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712133641; x=1712738441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HYwHMbJbN/9VsghrbRL/cY3iu7egb/BMsn4X7A1xq2I=;
 b=ZqxYHJP8QGeD9b4SB4GNaUtEW9xhmbcjZYK9SmE+TwP0v4WVEPSHZfOieuGU23TvuQ
 vhFgkN3ykHQZITwjFbQ5ZLf0f2FuM63v64KE+5s0GCZjnQH/L2oUVo1dT2Er23RpzGw1
 3y68AazS6hPUOgpM/x+uLaI52BtabcrUmQqYhDGdmjOhY1NmBuDRK8/I3effAKBjjcgi
 Z26Z/lbuXw7jOqaVigPTusi8mhTg3AaLa6qRdOP3ZkrtBnIWEMCoRE+qUj7rvoB8Y2lo
 sHEImfgKLF/V4hfyBe7NWMftxtGlfeu1BRYL0JpwUEhIOCDoy+/k95FiXn/R2+xAKm34
 kYaA==
X-Gm-Message-State: AOJu0YziSMXnNlhYeoHYZp2RYwIYhtqDZA8r/yJLAj1bciYMHhSxuyrR
 PHzzBrHX8cxw18ca11FjJETp6fRFcTYaVkMMTkpLXv4TAfkI6vPNuWUx5Ur+rJ+xfobvMs0TqL0
 =
X-Google-Smtp-Source: AGHT+IFNiJ23jAHTKv1yRMD1qOTuAlu9hpZgnDkIPBaUmkG5442zqQuMh8WMR1oIQpohGwsL6ZhzYw==
X-Received: by 2002:a17:906:7f97:b0:a4e:89f2:c625 with SMTP id
 f23-20020a1709067f9700b00a4e89f2c625mr2875722ejr.26.1712133640906; 
 Wed, 03 Apr 2024 01:40:40 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 n9-20020a1709062bc900b00a469d3df3c1sm7510691ejg.96.2024.04.03.01.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:40:40 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Apr 2024 10:40:32 +0200
Message-Id: <20240403084033.512286-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240403084033.512286-1-francois.perrad@gadz.org>
References: <20240403084033.512286-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712133641; x=1712738441; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HYwHMbJbN/9VsghrbRL/cY3iu7egb/BMsn4X7A1xq2I=;
 b=fYib16Mxe3g+LGFaHF+PvbfauZlgMagrLKvAdsdhICx6AtUgx5NTTccUQMMuVhqbN2
 o1pIWnWOhviUEOMX//D7sYzu/ywOfeeSVCSZLOLWTYB4HEDnKolYXh+W8JuHB2uFOFwl
 SQTLrXECzcH1qxzgK+rPz+LLXcvHl1M/G13FQfwIZV0AnWjq0w68UD8p8lWFS80yxsG2
 Iw3zwEFjPFKrehdJWVKsVO2VafcZ8AmlWefa3XvSVwseTwVNzuyRpsRQBsDEiuAv4mb/
 bSH2hTiIn6PG+YmyWbQHn4d0BYM9Ai4CnScoke7ZihSMQgpyUGU72oLZ94VwfY5WMZwH
 gFpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=fYib16Mx
Subject: [Buildroot] [PATCH 4/5] package/libnpth: bump to version 1.7
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
 package/libnpth/libnpth.hash | 7 +++----
 package/libnpth/libnpth.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libnpth/libnpth.hash b/package/libnpth/libnpth.hash
index b9f72e077..a140a23f6 100644
--- a/package/libnpth/libnpth.hash
+++ b/package/libnpth/libnpth.hash
@@ -1,7 +1,6 @@
-# Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/npth/npth-1.6.tar.bz2.sig
-# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  1393abd9adcf0762d34798dc34fdcf4d0d22a8410721e76f1e3afcd1daa4e2d1  npth-1.6.tar.bz2
+# From https://www.gnupg.org/download/integrity_check.html
+sha1  a9f7adc1b1f6707071d29bfb3338c28b995ca1ce  npth-1.7.tar.bz2
+sha256  8589f56937b75ce33b28d312fccbf302b3b71ec3f3945fde6aaa74027914ad05  npth-1.7.tar.bz2
 
 # Hash for license file:
 sha256  ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING.LIB
diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
index ecfef863f..dc603b607 100644
--- a/package/libnpth/libnpth.mk
+++ b/package/libnpth/libnpth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNPTH_VERSION = 1.6
+LIBNPTH_VERSION = 1.7
 LIBNPTH_SOURCE = npth-$(LIBNPTH_VERSION).tar.bz2
 LIBNPTH_SITE = https://www.gnupg.org/ftp/gcrypt/npth
 LIBNPTH_LICENSE = LGPL-2.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
