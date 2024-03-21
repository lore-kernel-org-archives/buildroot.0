Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1A2C54E58
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC59480E38;
	Thu, 21 Mar 2024 21:16:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0NR2j9OBis69; Thu, 21 Mar 2024 21:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06C59815CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06C59815CE;
	Thu, 21 Mar 2024 21:16:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD2361BF39F
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A381401DF
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4bro0zNm6rX1 for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:16:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A502540141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A502540141
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A502540141
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 21:16:19 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41477452178so6853725e9.3
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 14:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711055777; x=1711660577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6+jsh2QuQkVd9NalVEmdDjGUDgbbSi6ZyDtZTLaDyzg=;
 b=LB9tQ+d2XLbUe1AHyTukLaU1k3GJEAK2udrJY6xWld+eMgwYvKkWcPO1snAv5mMfUA
 FEqPQHClzDue+vgRCZsV5Fk6CWNX9MXPmSbsV9yYYA3fPTwOpadZjxXeLGhGt47gPhy+
 KZg+rnyRskJ9NcqhpHGuV5r2SSxkZki/vw/cuXHPfbAsEZmGWbuZT9WI7N9fNzJzS+fT
 o0caAkymo2pWv7wwMouiblENKZRbRJ9DKgJEP0ANIn5G0wooL+B0ozckhUXEnLmQt5RM
 vd32NtKXIZ44RKdbSEPTUUKXO+DehdNzkAsD/z4F+1XHl4wcK8yhF8FpqYyRrDQwY1cQ
 VoDA==
X-Gm-Message-State: AOJu0Yw52QIJsUs6YPfXbDbW5pblOxFRAOIa0LbL+hxWhrjYN25e/dpi
 7i+uQ8HfGwiwd3/AdoUVfd+CXER2HgJlM7fNg+rSSkSNtDYWMNiA2qkyxX3a
X-Google-Smtp-Source: AGHT+IGdzjABBgLKBd3Jb6ONTt/WG6BWhqUhvtOj8M48etvVekUqJstu2vmZJTwwbFVDVc+tMrhd1w==
X-Received: by 2002:a05:600c:a06:b0:414:37f:2061 with SMTP id
 z6-20020a05600c0a0600b00414037f2061mr282533wmp.21.1711055776500; 
 Thu, 21 Mar 2024 14:16:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k37-20020a05600c1ca500b004140a3d34fasm887776wms.41.2024.03.21.14.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 14:16:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 22:16:12 +0100
Message-ID: <20240321211612.511240-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711055777; x=1711660577; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6+jsh2QuQkVd9NalVEmdDjGUDgbbSi6ZyDtZTLaDyzg=;
 b=EBh8iyc+iS0cjHir/zqo5+RxzRIY9NbopcP6tcN2IJEakYjshAc+fv4snUfpgistKp
 7fpSMIZcqf4pS411lyXU02QBlbJwXJjz+Sgnam5N2GATFfxWxmVpt6BXAAx0fZ0XBfAo
 tNZM/MrdAlyaq9jTssPfMs6/Ya4U9uMmB6aOYuu8lhaXHH+GCpv11uKXQlNKv11NooDJ
 5rD3DOwZzIckVig5kudLJxC8rqxJbB/oc2vS0xjS/yY9fASsDr80L+9O/k+3IOc0iZJI
 XRMod6zq59iBNPcBBDlDOVFz9VoTojF5Jf1Lc5Lm9Z2TCjTX84PNy+yPwqajLXQuxjVp
 DLvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EBh8iyc+
Subject: [Buildroot] [PATCH 1/1] package/cctz: bump to version 2.4
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/google/cctz/releases/tag/v2.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cctz/cctz.hash | 2 +-
 package/cctz/cctz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cctz/cctz.hash b/package/cctz/cctz.hash
index b3a8320790..ac78cd611b 100644
--- a/package/cctz/cctz.hash
+++ b/package/cctz/cctz.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  8615b20d4e33e02a271c3b93a3b208e3d7d5d66880f5f6208b03426e448f32db  cctz-2.3.tar.gz
+sha256  e1a00957d472044808a24a26f1ba020f36dc26949a69c214562d96b74093adb3  cctz-2.4.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE.txt
diff --git a/package/cctz/cctz.mk b/package/cctz/cctz.mk
index bcc80bad47..7f5d960a42 100644
--- a/package/cctz/cctz.mk
+++ b/package/cctz/cctz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCTZ_VERSION = 2.3
+CCTZ_VERSION = 2.4
 CCTZ_SITE = $(call github,google,cctz,v$(CCTZ_VERSION))
 CCTZ_LICENSE = Apache-2.0
 CCTZ_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
