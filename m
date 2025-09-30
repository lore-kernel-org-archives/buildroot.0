Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CE8CAC5B8
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 17:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C77F81EA8;
	Tue, 30 Sep 2025 17:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id McA0hKMRoZhe; Tue, 30 Sep 2025 17:15:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9911281EA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9911281EA9;
	Tue, 30 Sep 2025 17:15:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD338111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 17:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B6EE40BD5
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 17:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7RfYGPzCzTMx for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 17:15:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C757B4054E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C757B4054E
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C757B4054E
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 17:15:54 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-364bd7cce53so4201791fac.3
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 10:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759252553; x=1759857353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MWblEmD4CB/Uuho0e+gJcISeQ39cAd77tuONd6mJVbo=;
 b=skruCcSDxh3Dy0nCtzDHq0PxGN6zDDypSvdWfVa9POCxVEJGBht8GKgdvgNwOsdBuZ
 Bzb3U5EtpdeLdXJEvlYyHJFWNfSg5Hq0l8d9IWl1v0sGc4nykbD+fc54rzIbwNCX4dVU
 1DJCCs6Sd1gA0jj0epsa9DfNc/3TY1m2J9ywDNJuKVAp/Dlydq/ysBqtv4GCKoxtK7g4
 c1I58ic5yv+cU0U+45CMnkG/oueU9llte3wQ015qNwcVsMY7fin3o9xca0DRv6r+g802
 7xrsApdsygPvrf3uYu3cTUpXujhZnhDDmb2pZ+9CRQFQf3TEGvmU4LJPqKKKke/81XeD
 rl7g==
X-Gm-Message-State: AOJu0YwW4t4ZDx4OvXfs9IqM/LXFxWlioiabePfledMh8GMnhH7P3CPD
 2z/11vA/sRMvaWmZr2cIZdbvGx+EA9+ApjTLyt+7AYZ9i306H+kNbpOuhE6ViQ==
X-Gm-Gg: ASbGncub4ObzoWf1JcwTOqnXTKDLdW3ORIZ+swM3Vge5IRZtuEv0j/NM23JleieamNB
 cR+iY77s3za0hgMJcqSesUWtYFT7LVsTn0U1Nsy8QL9v1IamGMza8g2G8JtDCWjt9R6qohGfVXs
 ckwr9/K6j32Zz4NDnkMn5N9twLD+jaQWa+tYgHEhj9IGLuyXJNDxJKXw6l1i6stTbYjXodgBGm9
 EQUL4ffVN2iCe0qeO9kwSX6vCw2OEIrO1AVVRlLIFK9JP7k/Mx6LjsrUqq+lvF633kRP9gcEzFx
 OOrYP9s83wN49RZqHpfRT8IgwgPH0teJhZ3kpdX+y/nWq8TRT+wJUzsmutDu/AnJGWYp4wke4PF
 YVjOPti8xa+uGcSUG8+c0V9POVJWkB6Yo3xB5uDqK/SIDnOGC+cazT8h5MfCJlZ2gevGkwkkiso
 umxUkfOLUpzkshq4eFpBQQmue67yl0MHMUCd4WXUpWQA==
X-Google-Smtp-Source: AGHT+IGWrCKuSvKMpkB6OvyMZMopRIDNfmmCkNK5RBhAZFdE7LuVBRXsGawNw2p2HRVFlR4NUAKu7Q==
X-Received: by 2002:a05:6870:d6a1:b0:314:b6a6:6864 with SMTP id
 586e51a60fabf-39bd7b171c6mr127220fac.50.1759252553271; 
 Tue, 30 Sep 2025 10:15:53 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-56a647dccaesm5809712173.1.2025.09.30.10.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 10:15:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 30 Sep 2025 11:15:49 -0600
Message-ID: <20250930171549.3035274-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759252553; x=1759857353; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MWblEmD4CB/Uuho0e+gJcISeQ39cAd77tuONd6mJVbo=;
 b=FoLW13tlpMVGb+9YfyIj4FCPcPDKhR0R07e9DsI0p1kH6r+XFgafPiXO+wlw/vZZjv
 HnMJrMwCPxA+kleHqiWG0VfIjU+pcCHkRpyXAh5oudxaoe6A+AW4UjYuFBsrsMQfwxaw
 gKJ0ILwnKKQJy3WVMslGvbFvOHsnnRNOLy5s3upzRaDvELMnRKetzlsGBs4NK5bsUC7q
 vNDwGeA5Ue/ioxHL7KoDOP8GTGK7DlA72jWsnORGq0nu8UOkJhSK5uXEI/+1Ltja1H04
 qAUBdW87jRrjQICbj0+KHnvgh2lqcxpeQG3gBcfEuZ8lUAAZ4lvr8FWzRokqqHiLF2AU
 HGfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FoLW13tl
Subject: [Buildroot] [PATCH 1/1] package/uefisettings: bump to version
 149bc92970949d44be641ae1e3e942220d7390e7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/uefisettings/uefisettings.hash | 2 +-
 package/uefisettings/uefisettings.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uefisettings/uefisettings.hash b/package/uefisettings/uefisettings.hash
index eb1a4f5edc..b9b5222d4b 100644
--- a/package/uefisettings/uefisettings.hash
+++ b/package/uefisettings/uefisettings.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  846eb9b3efe09f6584a2c08f70a291b3733066f832008b935f010336cbe5e0b9  uefisettings-f90aed759b9c2217bea336e37ab5282616ece390-cargo4.tar.gz
+sha256  3c199e92e9dde29d5a1be33994cef27eb9450f1dbc006eb5e09856e2be7f172b  uefisettings-149bc92970949d44be641ae1e3e942220d7390e7-cargo4.tar.gz
 sha256  acc0b83e151985bb943d35ac37e7522fef28d707af9a4829678e92baa409aaf1  LICENSE
diff --git a/package/uefisettings/uefisettings.mk b/package/uefisettings/uefisettings.mk
index 0559b1c504..2a11baa74d 100644
--- a/package/uefisettings/uefisettings.mk
+++ b/package/uefisettings/uefisettings.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UEFISETTINGS_VERSION = f90aed759b9c2217bea336e37ab5282616ece390
+UEFISETTINGS_VERSION = 149bc92970949d44be641ae1e3e942220d7390e7
 UEFISETTINGS_SITE = $(call github,linuxboot,uefisettings,$(UEFISETTINGS_VERSION))
 UEFISETTINGS_LICENSE = BSD-3-Clause
 UEFISETTINGS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
