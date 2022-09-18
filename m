Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E6CC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 13:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4AE783F40;
	Sun, 18 Sep 2022 13:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4AE783F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9216A0wjIU2o; Sun, 18 Sep 2022 13:13:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D93F881B53;
	Sun, 18 Sep 2022 13:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D93F881B53
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCB811BF426
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 13:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97F86606F2
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 13:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97F86606F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2yU_zQI2Bw-X for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 13:13:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C10B605EA
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C10B605EA
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 13:13:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id c11so43116234wrp.11
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 06:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=VTFPaFrwm54I3nNfN3y9iwSnE5BM8Fk36UkxdAbyb2Q=;
 b=SzSqmrYew9vWDCwTZiYYYUHmtiX+9H1pr1NVDCxi2H1d7PX3KBLJUvg0A4vw8qOMGB
 mZ1O6z34kn9+P2pd3Ea2sbY4qvYx1FEsB2rf79XGGQte84VR+27rEkXtU+L6vkFNdBJd
 65IDmRO2Bu6yl+fYmbftrJxDdJdTwkIPImvgFYv+9V1ZhBTrA+NVRS9r6PRT8XCtcLR1
 UQP6895kOhPX49RWh3vC8QqcJQ5KgWKOFRQjUVVrM+LeIIb9izvwFRvUX7zzA3wDuv9E
 a8TLwl+zJnAtMXUZ6ks0+bXa4Dqb+BRKJ2s/G7b5rmA9SKOI1a2qm6+HPwxl9NMXJumV
 Oblw==
X-Gm-Message-State: ACrzQf0Cm+8EVYoA+4WTFMfEB8da22xK88C1keNR5vbsX6QJsRK1/MUo
 YgQbjAENrJwUMg+ycwJO8pqXz2CuGpI=
X-Google-Smtp-Source: AMsMyM7PF7sOVLgbj4LQlfcnfJdeDxOUGniPbV/+v5Jn3Phk0pp1Dw68ylFoGc4WLmjPdA7//Gm7aw==
X-Received: by 2002:a05:6000:78a:b0:22a:c9d9:4449 with SMTP id
 bu10-20020a056000078a00b0022ac9d94449mr7598720wrb.189.1663506828184; 
 Sun, 18 Sep 2022 06:13:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 k1-20020a056000004100b00228de58ae2bsm10709043wrx.12.2022.09.18.06.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 06:13:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 15:13:44 +0200
Message-Id: <20220918131344.301025-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=VTFPaFrwm54I3nNfN3y9iwSnE5BM8Fk36UkxdAbyb2Q=;
 b=WgId8QvmcNHWKwnbT8tPhvDog/YdqZYC6s0pLRuFxakqZDKqN+0Yg8ukx7XqT1d5xk
 BLRNJ4HshXCNhfjxOIWg5lEEvL2VqOSgtc6CALtGAHsoizqbA6j6jO+TFhPqk1w6WXXQ
 q/MDsZsZOMnZOK9b91NTQigotZVq43mf0ZdH78bEA3GbCL8RUHtuPoeaBnFsocWXaZPQ
 POigmPZ/N4EEPuLLQ6SjGSXFQR8kKqymKiJT3ZDpp0aU/Lg7rwc9OEY1n+/ujl1+IlWk
 wIhT93syOc5nZLxcyABU1IdV5PhsshDsdSzk2rbZAY9MeNKVFWWeEQ7vMUtH62IzECvS
 0R5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WgId8Qvm
Subject: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 2.6.5
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

http://git.haproxy.org/?p=haproxy-2.6.git;a=blob;f=CHANGELOG;h=5e4ca2c913fa117587652a6a08844e3e2e3b62eb;hb=987a4e248bbccf4bffe955b27ccfbcbb626348c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 7a870d7c0c..2cd8ff1806 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.1.tar.gz.sha256
-sha256  915b351e6450d183342c4cdcda7771eac4f0f72bf90582adcd15a01c700d29b1  haproxy-2.6.1.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.5.tar.gz.sha256
+sha256  ce9e19ebfcdd43e51af8a6090f1df8d512d972ddf742fa648a643bbb19056605  haproxy-2.6.5.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index de7accf4ce..35b1770d38 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).1
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).5
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
