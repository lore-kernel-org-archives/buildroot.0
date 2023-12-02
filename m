Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CAAC10DC1
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 21:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD30F813B6;
	Sat,  2 Dec 2023 21:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD30F813B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id txw7sdr3V0ag; Sat,  2 Dec 2023 21:45:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35F9481398;
	Sat,  2 Dec 2023 21:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35F9481398
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67E581BF3B9
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 21:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E5D540360
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 21:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E5D540360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V2L82Gk3XUVx for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 21:45:37 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C72540217
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 21:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C72540217
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33318b866a0so3054239f8f.3
 for <buildroot@buildroot.org>; Sat, 02 Dec 2023 13:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701553535; x=1702158335;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ihAxcSX/EpNHNcEV/ZBilFJ3bJZ8+qkTZGoanBfM9uU=;
 b=WX4TCnib5X1Wa8xBsNVy84Kbx84n2RoLpcnLW6Jw87UY4w7Zz0sjbaoVmS6/Ip992g
 AANPXmi5NFdDBeU9Q7wfPy2mOQIfe2B7gU3Xz38VoreQXqGa/3PV9SpMJbuttBJzBg9c
 X+EGSi8SEW/btyjhq3egCAvd+J/PP/wkKfVUcyimp4zB58vLpX+Nppmv8aYaHOIO8UST
 pwZSLXAr2fI1XvobDfCHFfpLe1VrSm0A07JDnyGnzkfyjC2U8XLKS9GtJ3ODxvxb6NVH
 XhKoDklo82m1RP4Tk6xyX/Xsum6SD3qALLemkYBElDvpKRmIZwxbZCLd+w3S1dybRwYP
 TlEA==
X-Gm-Message-State: AOJu0Yy0gffsPo569JJ3cMSwpQsJ6M6Z59cCTSUzHMJTENdymxTCbp7f
 l6sPXeujQTaSbxaE8GjmZCVRUNPezrw=
X-Google-Smtp-Source: AGHT+IGMw7Y95bCpPVy0kJv0x4T25q3+IUwhztexlYj/H+/KwnDK0L/eKNNjYymGYrwbORBZ2nROeQ==
X-Received: by 2002:a5d:6889:0:b0:333:39dd:3ae2 with SMTP id
 h9-20020a5d6889000000b0033339dd3ae2mr950522wru.134.1701553534407; 
 Sat, 02 Dec 2023 13:45:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c1-20020adfa301000000b003333a216682sm2475739wrb.97.2023.12.02.13.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 13:45:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 22:45:29 +0100
Message-ID: <20231202214529.8858-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701553535; x=1702158335; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ihAxcSX/EpNHNcEV/ZBilFJ3bJZ8+qkTZGoanBfM9uU=;
 b=X3gyHSDdZ91D8dp9SMoCdHE0bCvDtjRo0GBU8/frAQF6RrMsg51lGrchiB8NTDh8/b
 K8CLuxdktctJwaQ/+u8Gw6VL6Ffr8u2xGO+e7A6nAI9dmUU51I3SoN9hjqLjokIHaWar
 3UYM6CBabMxTj4wIoqhwMDaGATM5u7iN8ExVm49FGVVlPTzQr6yh19TNsw0Pp2LCmV1M
 MeiDVKb1IhumtMsBjWhLSL/FaV/FJjEIdsZusR08ggSoswqwqyMB+YFN1gVm/zr7bFRU
 TBMSyqJwspcGB8Ui7kUF3BpjHdfhiJIgfVp1QlViNzhLZibAfx37NHfOQOPehrMRFwIa
 pgmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X3gyHSDd
Subject: [Buildroot] [PATCH 1/1] package/putty: disable gssapi
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
Cc: Alexander Dahl <post@lespocky.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PUTTY_GSSAPI is enabled by default resulting in the following build
failure since bump to version 0.78 in commit
5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4:

 /home/fabrice/buildroot/output/build/putty-0.79/unix/gss.c:133:10: fatal error: gssapi/gssapi.h: No such file or directory
  133 | #include <gssapi/gssapi.h>
      |          ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d6d06b5aa0df070c3880399e044fb3cd3a830aec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/putty/putty.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 529edd51c8..4c9164d05e 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -10,6 +10,7 @@ PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
 PUTTY_CPE_ID_VENDOR = putty
 PUTTY_DEPENDENCIES = host-pkgconf
+PUTTY_CONF_OPTS = -DPUTTY_GSSAPI=OFF
 
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 PUTTY_DEPENDENCIES += libgtk3
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
