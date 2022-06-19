Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B97C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECF8D60E35;
	Sun, 19 Jun 2022 16:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECF8D60E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PsHTDF-K0w7h; Sun, 19 Jun 2022 16:56:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1043B60A7B;
	Sun, 19 Jun 2022 16:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1043B60A7B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9763B1BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7173760A7B
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7173760A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cbvp3OdUp0an for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:56:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37130607BC
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37130607BC
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:56:43 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id w17so11656702wrg.7
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HY3krOkYZwHfNWb6Be5M3iyhHZVO6LE93Y0v3Fiq/2E=;
 b=FLKmWTp0fUykUEEQyLexM2podLZa3DzXTLmTK6PWpAiC1Utc/U7Jfk/KmJPCcTlcMf
 w//riNPknEdA+Kw0743wvlJ7WDK+3bCBpNI6ahroMmjezMsIuhmR7K3v8ZP81jao/lZP
 fz4BQ3vYFG2IoiY1LtizarWT5yT5zPcFzA9QQJUJnDHJxIyemtfprcz5WE0aC+INDAxx
 QPG0a9Z0HpKP8ILJRzyMQguvU2j+4yOiCz/gCKSFg5434A4wx0S3PbGfIpg3In+pP/D5
 SpAXRPOG4gjOiU4fDaNcZiA1Slfk3SFWUbQMxtb8vtjP6HSSS/ehx+/Oqxl9WfDMLAtT
 TsQw==
X-Gm-Message-State: AJIora+DBc2xgYGPWBdkVmC3CvUqRvZrXRGj3gRw/M1o11ouVkjQQunn
 3Nrf5Czn2qOgNO1AK8DXbOIUXJNOpb4=
X-Google-Smtp-Source: AGRyM1tWot6xizGzo4Zvj5qkSA1U1sspvQ0Xsb8bLT6PiXrVCM0RspjUzv1+PNqf8q/l9auCDFYc5g==
X-Received: by 2002:adf:d1c1:0:b0:219:e994:6b8a with SMTP id
 b1-20020adfd1c1000000b00219e9946b8amr19014539wrd.462.1655657801272; 
 Sun, 19 Jun 2022 09:56:41 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a1cac06000000b0039c673952bfsm16106343wme.6.2022.06.19.09.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 09:56:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:53:58 +0200
Message-Id: <20220619165358.656210-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HY3krOkYZwHfNWb6Be5M3iyhHZVO6LE93Y0v3Fiq/2E=;
 b=FMpGH7I11FRYK4rI7xPsVZawxOsrr6tJSaveO8PmDvSWaxCOzSF62oOruCLAifrnNk
 CwtjwV1wF/Zv1sUtgxwSmRd6W6LvGPQTaZNS2SjYgFADjDJIx4gcgub9n/i2ubXMFdNa
 Arboz3TpazcHm+cT6H+U+2mzL1vvFL9sh1xByZmSI22LDfKWhWunPwIHwzS/zPW9Qm9q
 sU2LN0qsMiAB6FIF0t0VR70mz+hWNWjl348EKXHZueajT4Wz2tYBGau4ogsV8Q9vXYsB
 jZ22Rw/EiuE/wLIrA8gABPhGfKV+00W466/xXKBQ9ByWtb61tulZiTqxsdW0QOT0V3cr
 Am8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FMpGH7I1
Subject: [Buildroot] [PATCH 1/1] package/udpcast: bump to version 20211207
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

https://udpcast.linux.lu/mailman3/hyperkitty/list/udpcast@udpcast.linux.lu/thread/SC6JCO6PGT3ELHQWRCO4PAIGGDDCKFMI

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/udpcast/udpcast.hash | 2 +-
 package/udpcast/udpcast.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udpcast/udpcast.hash b/package/udpcast/udpcast.hash
index 9cdce0a286..9ce91330fd 100644
--- a/package/udpcast/udpcast.hash
+++ b/package/udpcast/udpcast.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  9c19eebaa6e2f78127f0d59e95d0ce003b687d61e283b5963a1da6b8ac41f21a  udpcast-20200328.tar.gz
+sha256  a3cebee7a87ecf1bca0645f125be78fbd7b37846a4da82fecef96b92cc64d050  udpcast-20211207.tar.gz
 sha256  422befd3503b1f39a6027017f639874c1f274e37ec60ba3174894646b584ccbc  COPYING
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 4c151bb41f..4ea73e20c7 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDPCAST_VERSION = 20200328
+UDPCAST_VERSION = 20211207
 UDPCAST_SITE = http://www.udpcast.linux.lu/download
 UDPCAST_DEPENDENCIES = host-m4
 UDPCAST_LICENSE = BSD-2-Clause, GPL-2.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
