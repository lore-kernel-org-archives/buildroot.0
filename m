Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3434EC7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 19:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CEE960AEA;
	Sun, 19 Mar 2023 19:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CEE960AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id edtbTbfyufWw; Sun, 19 Mar 2023 19:25:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4BF160808;
	Sun, 19 Mar 2023 19:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4BF160808
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5C461BF59D
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 19:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E66F817E4
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 19:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E66F817E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aic6CaohEGQB for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 19:25:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D522817D3
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D522817D3
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 19:25:34 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id p16so6204893wmq.5
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 12:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679253932;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AU2GjRsMry6HxaAkBaOmUndNbk9mJ6P+5qLQuxMxGpY=;
 b=ie7o4danWFKt2BOAK6S8XfSHqzit0Jveaucv2z99g29k5YpK7S1DD0IIG/pj5eLDR/
 X7DDcnIceBYNlrOEAEeYXA5WXC/203PQYMMrtyPy3lyoXw6mnpVhd7/DNu8fj1KaocJq
 cUcvjUb8JWpj+LLT+SVfqVe2T04vcChymKDzRsVad+d+7HwU+wspcA8TP0FoFPdFmsPv
 SgHU1dfOomkwWNbdwESo5rAKPpW8AMzwAWI9wGClXb/VWN5ISkYkp+nJHjNdBelcIYmX
 T2F4gGbr05o0N+Ie2b6q2HFHpgzHZjSMiRh0cAEFtqZ318Ax2GdhFb+C+qmnIujLkOVL
 ozvA==
X-Gm-Message-State: AO0yUKWxicQ0QDMrQ3GXveXo6Fy4YaA4b9SxKl+offF8ZEcB7iyD7Mqn
 xAjU51UlPRkoAQUd+21T7fuKFNGl6SA=
X-Google-Smtp-Source: AK7set9BGLCxtGnoD0v3eQ2co7Nr32t9vrTUKThRoHN+ES4W97Y/8lDSyt7DSGUafYefry8hyGyavQ==
X-Received: by 2002:a1c:4c17:0:b0:3ed:95a5:3257 with SMTP id
 z23-20020a1c4c17000000b003ed95a53257mr6798156wmf.2.1679253931652; 
 Sun, 19 Mar 2023 12:25:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c458600b003ebff290a52sm14756001wmo.28.2023.03.19.12.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Mar 2023 12:25:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 20:25:26 +0100
Message-Id: <20230319192526.915856-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679253932;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AU2GjRsMry6HxaAkBaOmUndNbk9mJ6P+5qLQuxMxGpY=;
 b=VXQNUF8YK8n5xtR194Ac5KHXwOUbNgEF5fZn+1ZqMIPRM+4I/ZIJtyCbbBSoGLy9hk
 r/YCU2dn22w1T5wNJof6q7BY6Mer11oktU6tLmAG9Segl3TXETQmK61LOEsrbZUMEbNj
 wJVjQvTATy+Q5OdyebO2cisAz+kTG6ZkLXI1UweJbyvjfPYUC/+z5ReAqgLhfYJYWkt3
 8/r1YnNuT0vBVc3R9Y7VFuQ8Qt9wUvW9Co9vaiLsxuHe57ECQhnwCRnpx6RJaOSngl6h
 wFOywwYyMNTXNHOw8TnYoWcCCyeUFh/VJKci9qfIpFix1ho6arA6eMIdOfWa0I3sTsNA
 pkoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VXQNUF8Y
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to version
 4.0.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-1161: ISO 15765 and ISO 10681 dissector crash in Wireshark
4.0.0 to 4.0.3 and 3.6.0 to 3.6.11 allows denial of service via packet
injection or crafted capture file

https://www.wireshark.org/security/wnpa-sec-2023-08.html
https://www.wireshark.org/news/20230302.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 7128b560ae..d89caa5de8 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.3.txt
-sha1  243b0057cfe6d447662e81b5646110aaf8b63c81  wireshark-4.0.3.tar.xz
-sha256  6c51e15bcc0afb93734e686dbff354ffd159f570bd2904bcbbad6f3feb7e9511  wireshark-4.0.3.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.4.txt
+sha1  ae3c28d6966c420ee3a8d058ea212a1b6adab50f  wireshark-4.0.4.tar.xz
+sha256  a4a09f6564f00639036ffe5064ac4dc2176adfa3e484c539c9c73f835436e74b  wireshark-4.0.4.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 12c36575df..f5a8e1f070 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.0.3
+WIRESHARK_VERSION = 4.0.4
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
