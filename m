Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FECBC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 20:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19BB54018A;
	Tue, 26 Dec 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19BB54018A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e2mqMCjbuJ6a; Tue, 26 Dec 2023 20:51:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D49C4098F;
	Tue, 26 Dec 2023 20:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D49C4098F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 26ED61BF3EE
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B32A4098F
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B32A4098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjlZGN6WRV51 for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 20:51:51 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7897C4018A
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7897C4018A
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33677fb38a3so4813008f8f.0
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 12:51:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703623908; x=1704228708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aY9tLoSvHeNwBexuKwpVL9zP7wd6c4yiKFSd1QSN6a8=;
 b=xPYioSxg4JDU9CPvLQD0Z66qlnmqiv0HwVlY4BRgLDbpq/SYsA4FQNDLBlHcRWkA2R
 KpJ5RjZgC2kuSZ3nUz8DLnsJEusmAaR6XH5MKUMRmSBbFCr37krjp88TC3ReGlGEA7ZQ
 A7FkdL4QxOX+DxhnNiW5IZkRS033MgPrcyZNknyYcYElAPkr2QPe8wMWcbQVg+Z5ywdv
 AqmRYTUKEHWvvSjkZwsTp6UiOkdl1q0/ezGhngO3b2VDKAXpvekZv7TAc08bYZofMwUL
 yQf8EL0TggU4xavAZ+KQyUby1GgD01nJhykSHiSO+UJ17qcPIWlyS3p3T7Is5Cv8AMVw
 GxnQ==
X-Gm-Message-State: AOJu0YxTEBHC4YEv9UFij5S2yqgA/I2ETsnjuhkRxvAFH1o1voZtHwu2
 eNlWqjW/SykBQZHheHym2jE/8zosYpU=
X-Google-Smtp-Source: AGHT+IHGlQcfhpgVQylo9pYdFxHhyYlHFXiSWnTIyv4YrdXZYoUrMItez/0pRcTSTvLvporSqQ6CoA==
X-Received: by 2002:a5d:45d0:0:b0:333:2fd2:2ef2 with SMTP id
 b16-20020a5d45d0000000b003332fd22ef2mr3548439wrs.107.1703623908407; 
 Tue, 26 Dec 2023 12:51:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 df15-20020a5d5b8f000000b00336c43b366fsm4765878wrb.12.2023.12.26.12.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 12:51:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 21:51:44 +0100
Message-ID: <20231226205144.1393927-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703623908; x=1704228708; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aY9tLoSvHeNwBexuKwpVL9zP7wd6c4yiKFSd1QSN6a8=;
 b=XDiT1G/TvL+gJFMId3TJAayhobZrEpsiPPqTesRIlA984k5CId9Ey4TfvAK7OnMW9u
 M03n+r3Ml8GVuNCSIcpANZkUVl8xWrQ+5S6MqJmJZ50o7qWxmMKbOK7vw/BCFPYAokqJ
 +bcIriWFPl1afwn46fDbfiu0bhnCoFAG45rKhhn1gvl+OkNm3+Y360KLiW/Z+m789UZM
 x//lm2033wTihTS3zPQFzX1e8B2NKFXg2zzhMugcid0AU4x6Vnsb3So2tfzRhVbOXLgG
 2bidKXG/8bcsNaGc4qGI5Ar2gCpC/7yU9XL64ct7/LW0qXV82KY5llDiBhyzUIyZuYOm
 ax0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XDiT1G/T
Subject: [Buildroot] [PATCH 1/1] package/ofono: bump to version 2.2
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

https://git.kernel.org/pub/scm/network/ofono/ofono.git/tree/ChangeLog?h=2.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ofono/ofono.hash | 2 +-
 package/ofono/ofono.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index f1760d6f13..9e2fd413f9 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
-sha256  92913dcce9a15cac2174daca249457716a0ec036878d22035e83af0e19e79c52  ofono-2.1.tar.xz
+sha256  5e13121c0f885a81ad882db065549ea13477abbcc219f150b38a8d2ac92521de  ofono-2.2.tar.xz
 # Locally computed
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 5f91e4985d..1ff43092c4 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 2.1
+OFONO_VERSION = 2.2
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPL-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
