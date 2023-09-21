Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E67E7D0A2
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 18:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FA478176C;
	Thu, 21 Sep 2023 18:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FA478176C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kraDxcF7bNQk; Thu, 21 Sep 2023 18:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38F2A80EB2;
	Thu, 21 Sep 2023 18:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38F2A80EB2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D01801BF3CA
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B68D440930
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B68D440930
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWl0MoB7Tb8G for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 18:19:22 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD28140364
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 18:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD28140364
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1c5bf7871dcso10736665ad.1
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 11:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695320362; x=1695925162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Za61/mDLpk0HbaVY0vEgEK6jRhJRHYP85MQjJH1YUd4=;
 b=gO+APVy2A3ogRjtm+ivPMwal2AFgG5T5oNr56R0gny7BAcqH9WWm7ATy8EHqmaIQRW
 nNJg6EnOoPlW1elgONwyLJl6wmbAdI08n22mWYRpwV7J2Adsz8y98OVIJYH/nybfUP4D
 GqJ/5NkEifmNGfx6uTJG57VWdmDsfTEJ4Hj/1LmTXyZam5fCQALH8uapGfkgVufcF/mJ
 F5YeVIcs0vLv4MTFuyiznma4gVqIpfSoDpu3Jy00+HdA3EjFUuItRTheVGdYOxAIw6AS
 zMW8pGgGX/GG7EMVaMGBvSjViWE63pa5ZSrTH/YZu9TLBx/Z0qyiHth8YlpQjvaEFE9s
 jfMA==
X-Gm-Message-State: AOJu0YwEqP7STwbIjwqFTyoIgaDarZUWNP+nqFsSrbjMZy71w19UT7Ad
 Niv39of700Mev/bEErybcg21AeItI44=
X-Google-Smtp-Source: AGHT+IGVllYV2IxEIXmEco0jDIlbg9MqMfiyeEtRs4mAbUwf74zrUrUz60Pw5XjcdYgvjYfICGOPmw==
X-Received: by 2002:a17:902:c94b:b0:1c3:c127:540 with SMTP id
 i11-20020a170902c94b00b001c3c1270540mr6640441pla.29.1695320361963; 
 Thu, 21 Sep 2023 11:19:21 -0700 (PDT)
Received: from Adam-laptop.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709029a8800b001b9f032bb3dsm1826745plp.3.2023.09.21.11.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 11:19:21 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 12:19:15 -0600
Message-Id: <20230921181916.546643-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230921181916.546643-1-aduskett@gmail.com>
References: <20230921181916.546643-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695320362; x=1695925162; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Za61/mDLpk0HbaVY0vEgEK6jRhJRHYP85MQjJH1YUd4=;
 b=BqbGD4igIfVcLE/kuyyKkTAH6ejgo8/Ul2VZMYQyedP61C8mHVBIwmSGPFs+t2sCmi
 SngpQlA7po/JhTPPwFLnMRX9vyibOQ5eLm4iShxIKILbYtClvufy6+XifN+deVJosrgi
 /NE7VjqPlYRKsKEPHMGErLqkwALrx7I62n+JnAff4F+oBBj3YekUfAtuXB5H1bvl2mph
 KnnheZSxs5LxqDgLBSn5YAA3ImpqMFbbGpU+b9EqgWYUhI3W/eHkFL0omspjaODZdnxN
 9cfejcnZa7MUNYpY20MrJTjd6Bdqpeyt20jy1+tGSQXo9dmT2fq4Io/50ASVTrIjab3q
 PLpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BqbGD4ig
Subject: [Buildroot] [PATCH 2/3] package/glibmm: bump version to 2.78.0
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
Cc: Adam Duskett <aduskett@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/glibmm/glibmm.hash | 4 ++--
 package/glibmm/glibmm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index ee50ccdb01..8536b20a93 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/glibmm/2.76/glibmm-2.76.0.sha256sum
-sha256  8637d80ceabd94fddd6e48970a082a264558d4ab82684e15ffc87e7ef3462ab2  glibmm-2.76.0.tar.xz
+# From https://download.gnome.org/sources/glibmm/2.78/glibmm-2.78.0.sha256sum
+sha256  5d2e872564996f02a06d8bbac3677e7c394af8b00dd1526aebd47af842a3ef50  glibmm-2.78.0.tar.xz
 # License files, locally calculated
 sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index da95329a3d..c2238e2f30 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLIBMM_VERSION_MAJOR = 2.76
+GLIBMM_VERSION_MAJOR = 2.78
 GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
 GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
