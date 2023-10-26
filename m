Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E73C25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 812D64114E;
	Thu, 26 Oct 2023 09:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 812D64114E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zYJRAjT3WvnM; Thu, 26 Oct 2023 09:30:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C66241749;
	Thu, 26 Oct 2023 09:30:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C66241749
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40F941BF98E
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BE386124E
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BE386124E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OD8OvmqhkntG for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:21 +0000 (UTC)
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 154096124C
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 154096124C
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-99357737980so107334166b.2
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312439; x=1698917239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lpb/pfhITRFfU2yLK2wwQ4zbwbSGyAK9XH2lBwWhm5Q=;
 b=dX/CfHezxJEkZ+hR32r7iAsG9joTiuIIqKKUmOVd5ge5BoO8zXtYZikZZFXRN38Bnu
 cJe6q+ZO87uCw4B9JaoYit3P+RxrcBdW0pa/+fQM0IyJl9Q8IsPPMCg6DRwtnP4ek3cR
 FzRCT4JTxV0yb3d9o3XXlmjP9uaJzBdHTc/rWThbDEEbwGfhllBzUiUYAmNDFIw4MK48
 zxKhVQjCz0BhZE2cvGzGmhf+hWIGSGbMNAdoMfbXRl6TzRjPT6KbVN0iymFW26tWBhPR
 F94olHFOOoqt6MpE85f0yRpTStXpNHuG4QK7h6uWQ0QmaLlcwOmnh/VXA42dI6AOuU7k
 7zyQ==
X-Gm-Message-State: AOJu0YwXz97cR8xRk1docnly8NabGd12Cuai5zOJ63xeZA4MC8jclNEP
 1ZLuzLx53MCLNqynhELoFeYt8v8oaR0i9VvPMOTEltHN4KR2W1nc
X-Google-Smtp-Source: AGHT+IGMLdpGtLuk8U5b6NgU1ya3Pm1bQm5gB9x4eOqouA0nB2j7yecDAOkBLLyEJeqNG39wxLbJQA==
X-Received: by 2002:a17:907:a0c9:b0:9c5:cfa3:d030 with SMTP id
 hw9-20020a170907a0c900b009c5cfa3d030mr13954949ejc.54.1698312439016; 
 Thu, 26 Oct 2023 02:27:19 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:18 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:46 +0200
Message-ID: <20231026092701.12345-16-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312439; x=1698917239;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lpb/pfhITRFfU2yLK2wwQ4zbwbSGyAK9XH2lBwWhm5Q=;
 b=RfJS+a/dULGmUBaCl0Zd4EHd6OIEqmPmuuRGo+uo0bZwlX9IqVahqBb4wpFBSQxGTE
 Q5mHnWbxgceUK8GmkECFLvSina6Ex2wlzEmFL7d+izZIyaESUehOgqT4+e87ZB9LHShv
 tUDwxQslHIsx2bRLTfPTVUzTdXF8asO45oDPo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=RfJS+a/d
Subject: [Buildroot] [PATCH 15/30] package/scons: bump version to 4.5.2
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Scons is a setuptools package now.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/scons/scons.hash | 4 ++--
 package/scons/scons.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/scons/scons.hash b/package/scons/scons.hash
index a72fbaee5a..48b5077b2e 100644
--- a/package/scons/scons.hash
+++ b/package/scons/scons.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7801f3f62f654528e272df780be10c0e9337e897650b62ddcee9f39fde13f8fb  scons-3.1.2.tar.gz
-sha256  72ed889165fb28378cadac14552be4a959f1ebab6b148abb5dd2b49712c3c6f6  LICENSE.txt
+sha256  ce26aac95d350a79a4192196b0beac3cb24f4ccabce0123eb28d3370f576f072  SCons-4.5.2.tar.gz
+sha256  2f6ac9a1fc98394d18b80dba9bedb9d5626006d44db3fecf7cf3e21cff7e8b1c  LICENSE
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 6b75d3ddca..767cf64b26 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-SCONS_VERSION = 3.1.2
+SCONS_VERSION = 4.5.2
+SCONS_SOURCE = SCons-$(SCONS_VERSION).tar.gz
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
 SCONS_LICENSE = MIT
-SCONS_LICENSE_FILES = LICENSE.txt
-SCONS_SETUP_TYPE = distutils
+SCONS_LICENSE_FILES = LICENSE
+SCONS_SETUP_TYPE = setuptools
 
 HOST_SCONS_INSTALL_OPTS = \
 	--install-lib=$(HOST_DIR)/lib/scons-$(SCONS_VERSION)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
