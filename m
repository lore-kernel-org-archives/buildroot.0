Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1FEC38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 17:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A39760B28;
	Sat, 29 Oct 2022 17:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A39760B28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f0IhxuqGBR6G; Sat, 29 Oct 2022 17:26:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62A1760A8A;
	Sat, 29 Oct 2022 17:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62A1760A8A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99DAC1BF255
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 17:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 821A2813DD
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 17:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 821A2813DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id obyfnBS4ho_g for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 17:26:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DB40813B5
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DB40813B5
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 17:26:17 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v1so10402678wrt.11
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 10:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0PGeycTUwwuP2MBHIXvRDT09e3NK0w97U4tTIfrL+3E=;
 b=sJRv+GxPyixql95MTO6jdxeiK7y0DL8DgjnJ0wj1ZbqGkkDM4oPqXPXrGBUzWkIvZ1
 k3DhP1BT+hVXka9Up2BgUBJfCLaL8fTyLewAFivKSn7NXPu1FGn0BfPt3SPvSKstiQKS
 NzZVULGtHqBYCuB1VHs+DA05PNx4QopoJ6u61eYiNKWr2fDnI0X+K1+i6iTYC4+d52rL
 6hXcr3MVsXgP6fMb6Jwo/exaq0AvNHUBIt+XXEenzwB/7ePyeglNly741aDZRgLKmUT2
 Gz8tPLyomQaxyQAFrRIMs9kO5VcWMm6X2f8kYHkKe/+K0lTPE8mbVVMbsXxdBbqdy30v
 lEmg==
X-Gm-Message-State: ACrzQf0pd/OMRbBQ4RvBfBqTFSfscHlBAZ9V5uD69sQMbLPGGS5nzpzF
 uJew8zN5ukNpscjk413tYPh0yW9LP4I=
X-Google-Smtp-Source: AMsMyM5BI56dUIGgHklyjQhfSHCrh9vy3/F29T8SY2upkFxn3Grq981JaxAzWpWjMiUt1+8mM4yIag==
X-Received: by 2002:adf:cd09:0:b0:236:659a:6902 with SMTP id
 w9-20020adfcd09000000b00236659a6902mr2925528wrm.574.1667064375069; 
 Sat, 29 Oct 2022 10:26:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c1c8600b003b4e009deb2sm2542011wms.41.2022.10.29.10.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 10:26:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 19:26:13 +0200
Message-Id: <20221029172613.255025-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0PGeycTUwwuP2MBHIXvRDT09e3NK0w97U4tTIfrL+3E=;
 b=UmSJL3pUJCFGSpjMLAiuiA/X60KPmKmHsyR0UCPh0hxq7l/7Ejlln9zd1HOCx6Gs2p
 RKBMMeM9Zq+CeCuQLhranF7AdUI1S1Tlt4Bmu9gwhaaGDdRv9wchMFXeaQdP2nmWIJnJ
 ZLKEr0myEQZoro2xUzVL/FmE9md+TEU1D4CwQij4rmGMIAcugl2V+dFZJfb6YjnI2KiC
 WnnTpqQQobUjrIEWOR5O8eiDNG1RlyYSUNkRbrafW/68iFtqV8R7MIp8+AZOGDYBWz+X
 gogtBtJ2q2W6sKs8AtN78BJWp6b+heCl8N5wH4fo6TJeR2BRtXH/AMLR251Srhk1ozRR
 qI2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UmSJL3pU
Subject: [Buildroot] [PATCH 1/1] package/sedutil: bump to version 1.20.0
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

https://github.com/Drive-Trust-Alliance/sedutil/compare/1.15.1...1.20.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sedutil/sedutil.hash | 2 +-
 package/sedutil/sedutil.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sedutil/sedutil.hash b/package/sedutil/sedutil.hash
index 26643ef684..2ceb5db659 100644
--- a/package/sedutil/sedutil.hash
+++ b/package/sedutil/sedutil.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9259466b4f73af276153c5245834a56f48f8721ea7263611b5d5e8326bc43d9e  sedutil-1.15.1.tar.gz
+sha256  88016b93cbbef98fa6f5c4e6f58e6c871662b6a7f1fc8dc788c8599fa37a44f3  sedutil-1.20.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  Common/LICENSE.txt
diff --git a/package/sedutil/sedutil.mk b/package/sedutil/sedutil.mk
index c80e43448d..566ed4fae8 100644
--- a/package/sedutil/sedutil.mk
+++ b/package/sedutil/sedutil.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEDUTIL_VERSION = 1.15.1
+SEDUTIL_VERSION = 1.20.0
 SEDUTIL_SITE = $(call github,Drive-Trust-Alliance,sedutil,$(SEDUTIL_VERSION))
 SEDUTIL_LICENSE = GPL-3.0+
 SEDUTIL_LICENSE_FILES = Common/LICENSE.txt
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
