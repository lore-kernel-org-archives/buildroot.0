Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C39EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 21:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1567B409FF;
	Tue, 28 Jun 2022 21:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1567B409FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bxhtln8yCwm1; Tue, 28 Jun 2022 21:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99DEE40918;
	Tue, 28 Jun 2022 21:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99DEE40918
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B7F21BF31F
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 21:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5310040137
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 21:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5310040137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4EXITCpSkZO8 for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 21:24:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B91C400F3
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B91C400F3
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 21:24:07 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id n1so19456534wrg.12
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 14:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ncdj0wqSytWIuB7j3TECOjd9Q5JSb2ZuHGa1w6jYzQo=;
 b=2YdGrO+w+hbPX2RjBqVZUENbc/x8c3Do7jmn5elEca5BXNvvWQCiMWswSb4BFVoG/Z
 6IQWkhuCANtbQaZfe1yvMQwyIZWSKQWE8478/64ZcMw5ShwhpooM4sDNrHUlyI/9JG9G
 PJ7IgckrngkCe+IgTiv28DIkS20a/4zG7JifpgQFK8tX38nsLxyLax2zKW1DODHaZg0k
 PKX/dIoYWqd3kJYVOV20BCTKsnWRIOLuH8HyfmkXIl+jJ3CfY+QSEBL8qgClKArqmS+C
 4wsQEnok3lvZQyltss+0DT1mQsnitIfngQJwvcKBkSTpE4k7Nr9cVLnNrDUk+oOhZLLo
 YF8Q==
X-Gm-Message-State: AJIora9bzsmZYG4CZuvEPB4SE5Axxl2nse8R9OY6z0e0bpQFXolecGWb
 SaOJZOXcunKFu4qN1UiTSkuN2UumB48=
X-Google-Smtp-Source: AGRyM1uV105zoXxoyVBpbEvCG5G2vT/HzZCdOckLZNVDdPdRQiCoV5DscOjJoaLDzhT9Scpy1o4sUA==
X-Received: by 2002:a05:6000:61e:b0:21b:8ecf:84e7 with SMTP id
 bn30-20020a056000061e00b0021b8ecf84e7mr18756256wrb.49.1656451445352; 
 Tue, 28 Jun 2022 14:24:05 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b002185631adf0sm15090940wre.23.2022.06.28.14.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 14:24:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 23:21:08 +0200
Message-Id: <20220628212108.2862859-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ncdj0wqSytWIuB7j3TECOjd9Q5JSb2ZuHGa1w6jYzQo=;
 b=E8xX0gSSq20UU1zWppBz3KAR9glHyETacjQmWEtyWhHRDR3VVTB42bqNQ9lVYHCWpz
 saUpbiJ/eUzn5zzH3kCVlre5OjBCyEWRY6bbQBrB3sMtNL1u492oYtU0+Q5ozqnSkNGx
 705HaHKKPYdEpFzAEZJY0qPEODbPYj9r8Z5pm7ObQXn9SZFONf7N9hxQAE67BlKhImx4
 sH8t8mlOl8wyfjrnc/Pf0dMEQOhrRXNAo9lG2wBSRXX2ugAnQcQu4UStPsAQz55Ro++D
 Kd2XBNLqKrtws3Wz1/Ek7JDaf2X0A+LBllBn8aJ7imNcdmyGUMKAHcuCQNn3ngA9R9zY
 EIow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=E8xX0gSS
Subject: [Buildroot] [PATCH 1/1] package/pigz: bump to version 2.7
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Use official tarball
- Update hash of README (version and date updated:
  https://github.com/madler/pigz/commit/cb8a432c91a1dbaee896cd1ad90be62e5d82d452)

https://zlib.net/pipermail/pigz-announce_zlib.net/2022-January/000017.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pigz/pigz.hash | 6 ++++--
 package/pigz/pigz.mk   | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/pigz/pigz.hash b/package/pigz/pigz.hash
index 512bf785c7..4a149605b3 100644
--- a/package/pigz/pigz.hash
+++ b/package/pigz/pigz.hash
@@ -1,3 +1,5 @@
+# From http://zlib.net/pigz
+sha256  b4c9e60344a08d5db37ca7ad00a5b2c76ccb9556354b722d56d55ca7e8b1c707  pigz-2.7.tar.gz
+
 # Locally calculated
-sha256  577673676cd5c7219f94b236075451220bae3e1ca451cf849947a2998fbf5820  pigz-2.6.tar.gz
-sha256  830b3e1b05cc20f443d89d7d8703a3c63fd64c57ab716f5e81fd178517df1e11  README
+sha256  67e2b9e30e924724a9d72549a6004ed15a041f51d9ea9ab781e048fa27ae07a2  README
diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
index 3e5e892797..fd48ab463d 100644
--- a/package/pigz/pigz.mk
+++ b/package/pigz/pigz.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PIGZ_VERSION = 2.6
-PIGZ_SITE = $(call github,madler,pigz,v$(PIGZ_VERSION))
+PIGZ_VERSION = 2.7
+PIGZ_SITE = http://zlib.net/pigz
 PIGZ_DEPENDENCIES = zlib
 HOST_PIGZ_DEPENDENCIES = host-zlib
 PIGZ_LICENSE = Zlib
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
