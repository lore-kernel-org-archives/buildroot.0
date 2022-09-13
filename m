Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4825ECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 18:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3915560746;
	Tue, 13 Sep 2022 18:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3915560746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9xXwxn-jvoDm; Tue, 13 Sep 2022 18:19:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 761C86068D;
	Tue, 13 Sep 2022 18:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 761C86068D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37AB91BF3EA
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 18:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 134E3812F8
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 18:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 134E3812F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mQDPOudrd5q for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 18:18:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE24780C81
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE24780C81
 for <buildroot@busybox.net>; Tue, 13 Sep 2022 18:18:57 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k9so22189945wri.0
 for <buildroot@busybox.net>; Tue, 13 Sep 2022 11:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=fv4D4L7zSw4AckGeuxQOVZaSlcGwv8H8J5uwIbq6qvI=;
 b=LyCSG83Z3pXNZbMWzhMazPjBdclvjTRjVcknU9E5I26ITuXRqNBdAMwePkZzGbHeqp
 yZu9xOXVGqe+XsaSq9coDIfa2VN9LQjnf6JGO6xeeaZS+wDzJSwwbum6PuZCWFIaaWin
 V9iwmXo1C02MXJOI4i2dW2OpfIiQ3vU9Bxb6ioDvhuPPQ1YuZ0m25whXDEotKpfEF45V
 gNhhbJCNK4/JbYdT/uu/OZrrmDgT62FeAyORdg35RGFuAo0GLbX94F6ceKGvdU8k1jsj
 w5fkHKqV8jk/BRQaKdIblp/5Ty7bi/olNdsCbznBrXS+NBzRGYIR9X3dtHPfRriS+tS1
 KYMQ==
X-Gm-Message-State: ACgBeo0JPjkFjvDiJF4zNr6m//SMIdKwJWCnHjgCeqChLJ01sXexGIkQ
 WwK6O7M3NuaQE29hw6hZfFtu0fhVfQo=
X-Google-Smtp-Source: AA6agR6YRgJEjiBGXDF64EyamdHnOIcgZLpcYFveTp5u6hkdXN9mJFXQiRS3+bsH6XnoMWsFouYkkw==
X-Received: by 2002:a05:6000:508:b0:22a:c5fd:1334 with SMTP id
 a8-20020a056000050800b0022ac5fd1334mr294158wrf.636.1663093129077; 
 Tue, 13 Sep 2022 11:18:49 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a5d620b000000b00228a17f92fesm11418600wru.51.2022.09.13.11.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 11:18:48 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 13 Sep 2022 20:18:41 +0200
Message-Id: <20220913181841.2703389-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=fv4D4L7zSw4AckGeuxQOVZaSlcGwv8H8J5uwIbq6qvI=;
 b=SsYkNHBEhs5Tki2O65NM1yrl8QMx+Fqi5cVK/p0MnUCG+BdVnO+hCqN+loOjWf3Tdi
 Ug9RAa5RVhjae5s9odSp7KZ1B8aLHYY/1TLtwmgZbsw/Qfr+LeSPiKTBvQsR6qi3vm0/
 gziHLB2dIInOtIznJ9yVY6G6b1QPFvKYP5pDSpguDYLppyUUGFmpHcRF6MbNjNwVcDxW
 NTL1BojPTI8yZwud/7Ykqg3A+Ba30uBKDNCF7GnQaapmaP8d5lcMGWiHRxobmNWITUQd
 N09bonYJ4y1/IvndqBLH+CbvHRzcp1Ug75j+S8RHIIQcgRuJ5DJjH9hIMXIKFAcFsizy
 4sSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SsYkNHBE
Subject: [Buildroot] [PATCH] package/libxml2: security bump to version 2.10.2
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

COPYING was a link to Copyright, this link is now removed

with 2.10.0, fix CVE-2022-2309

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libxml2/libxml2.hash | 6 +++---
 package/libxml2/libxml2.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index e67d3b0b8..4d24c6013 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libxml2/2.9/libxml2-2.9.14.sha256sum
-sha256  60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee  libxml2-2.9.14.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libxml2/2.10/libxml2-2.10.2.sha256sum
+sha256  d240abe6da9c65cb1900dd9bf3a3501ccf88b3c2a1cb98317d03f272dda5b265  libxml2-2.10.2.tar.xz
 # License files, locally calculated
-sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  COPYING
+sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 3647549a4..37a4396cb 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-LIBXML2_VERSION_MAJOR = 2.9
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).14
+LIBXML2_VERSION_MAJOR = 2.10
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).2
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_LICENSE = MIT
-LIBXML2_LICENSE_FILES = COPYING
+LIBXML2_LICENSE_FILES = Copyright
 LIBXML2_CPE_ID_VENDOR = xmlsoft
 LIBXML2_CONFIG_SCRIPTS = xml2-config
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
