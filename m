Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D518AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 16:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D89840B53;
	Tue, 26 Apr 2022 16:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2sXebIKvd4S; Tue, 26 Apr 2022 16:40:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A570740B48;
	Tue, 26 Apr 2022 16:40:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32D4D1BF94D
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 16:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2097682F9B
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 16:40:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LOis5el363zu for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 16:40:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AE4782F80
 for <buildroot@busybox.net>; Tue, 26 Apr 2022 16:40:34 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id kq17so14099665ejb.4
 for <buildroot@busybox.net>; Tue, 26 Apr 2022 09:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lYTFERRqcf5pw0pszMesaN7nk0lFqq5eEkbNLuHAWOA=;
 b=kaq5s1ixHjnx1f7NR7FczkrwCmBoGhCcqp9pahQv9N8nbyftlbN9QypFKFW8MXCQqB
 p/GR5L3FWk9M+DD6X0Uh7TS1HDQHqv0vC/tX8VndYIRsU+NrZaKE67IcvYZW3wDnilzl
 7bjcDkc3UT7gqZs00msTD7LxVl6TCJP1oIX7TJiNHGmOo4538zjhFQre6bCOR8tYWvPF
 Tm1g0fX+aWrW4cwwXtsRAuySHzTRy1431CAyZ1ZuYBBPy0cGDcxoNuRZ+lc1uYaBcRpi
 QwId8BN2S+lRQEFkSRJDD2xtnOsb/Fa57sSr6YigShFxFU/uH9TGBmT/B5ztMjzO2/8x
 6HuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lYTFERRqcf5pw0pszMesaN7nk0lFqq5eEkbNLuHAWOA=;
 b=OX0l8l6YlflUneRo1wLy5nFogQpVL8QxFZaNzJ9YRui3WAIXXBmBkDYvhg33I7jpLc
 si+FPf5Bq2H+HpD4dX69CbewjiKookYuZYgsrYFA2b/h3Gdq6BBM0NhXoq1a324qAjH/
 K8mDuhHrowuC4Vz6BPDyx+Dyq2fJ90b7xC10rA6IDLIYq1yrsnmBEY+NMKshd3nD2F63
 tr+Y5MS7q3Ai7Jgl8noME/nu69lBkguCBiLoFmu+qkJgxl22wT1Xg19NYVTuIJ5AgssA
 /FjxPsTPq3xk8PYfUcYdISl2bhq1IzrqTjh8R9vhsRYtsXJDGVNY9YHkVMkZNXAfYCv0
 1z3g==
X-Gm-Message-State: AOAM531DKnR8UrTTXOglsEdUdoqiGC6UU/5yRd45IEQrVHS0Na0RIdiL
 Ph3EDck/PwdBQfUsGFpaEbAlVWNp0kU=
X-Google-Smtp-Source: ABdhPJx786S8miucM0x6fd4fFNjViAUJbtGBNkITTlL3dSJHiSU/1YzraVzBUO72Wlbw3/o0ydEp9A==
X-Received: by 2002:a17:906:5d10:b0:6f3:65e6:5fcb with SMTP id
 g16-20020a1709065d1000b006f365e65fcbmr19359384ejt.212.1650991232722; 
 Tue, 26 Apr 2022 09:40:32 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a1709063f9400b006e12836e07fsm5144068ejj.154.2022.04.26.09.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:40:32 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 26 Apr 2022 13:38:00 +0200
Message-Id: <20220426113800.3544633-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/hwdata: bump to version 0.358
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
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 786110685..6c5a091a0 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  0d3d21af57822f35141b524808fd9e4823dbb413df338606195010dc0aa1c935  hwdata-0.355.tar.gz
+sha256  f0bb38588b9fcb43e15dac4ce8461b7580ef38ac20ecab83cef638413646decb  hwdata-0.358.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 4dd9c9e28..b2e183807 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.355
+HWDATA_VERSION = 0.358
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
