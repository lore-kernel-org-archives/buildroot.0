Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ADAC47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 11:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 571ED4136C;
	Sun,  7 Jan 2024 11:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 571ED4136C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dpbqp8d6I3Ia; Sun,  7 Jan 2024 11:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 432F9410A4;
	Sun,  7 Jan 2024 11:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 432F9410A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E52C1BF292
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 11:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 788F160ABF
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 11:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 788F160ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3_E0THHs6lMf for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 11:55:22 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3799B60881
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 11:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3799B60881
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e461c1f44so1657025e9.3
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 03:55:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704628519; x=1705233319;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tFXP4A8ht01GHfOuqko3khGRI3c5NjRJxx8WAXmhK5g=;
 b=iEhU7nrg+RHcLRaIaSRq8iY5a5RHXmQUCXt27r95RldLNkLnm6hrI+N60lEQCyyP05
 96oH921nzHxsJUuPHP8j/eh0cH+pl1bTVuuWwuteQ40aT+Yt2DwKA/OVbzQv1M9mwHpt
 0frMOCUG/weCF2JQEWK/i2fhpiCL0wBISxWtytKX0GI+QMv2g3nCSdx0ZWFWA24x/L5m
 oPCLEomXLTgbrUBRCd2ZbBw4qE4ThM0T36MUWpkvD374RG/7yQxTMJ8UAs2SftFjxjx/
 SEGg6dAZ05kWIeBwGLwaFQy2C5EaLTnr+4ip2gO78BSY9e3VliOcOioh544Tcts5vLiE
 8gTQ==
X-Gm-Message-State: AOJu0YyJg96qdWLc3o7hy0z2zyqVklKocf7sRbFoBOPPv99nx07026xr
 T5I6WaPg0DjcsOpFvtR0oMAg2FYWCNs=
X-Google-Smtp-Source: AGHT+IGYO9e9L6y0skbjRN8HVWZrClp+ZT/OO+jhl/ou4hq4ppDZl+51GUvHiIEVOgY+b2CIJOe7og==
X-Received: by 2002:a05:600c:1f0d:b0:40e:4300:dbcc with SMTP id
 bd13-20020a05600c1f0d00b0040e4300dbccmr573393wmb.0.1704628519144; 
 Sun, 07 Jan 2024 03:55:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n34-20020a05600c3ba200b0040d5b984668sm7442651wms.9.2024.01.07.03.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 03:55:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 12:55:16 +0100
Message-ID: <20240107115516.2823271-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704628519; x=1705233319; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tFXP4A8ht01GHfOuqko3khGRI3c5NjRJxx8WAXmhK5g=;
 b=jbpUXpYKIjOQdE1L90gJvGi3CMseCowE3uYT+lUmp78LxN4TNsM7qqaBfXMsSHyc9V
 vFso6i3NO8bCJTfKu5jKgM6gjq8vyn4YIUKh8livq7j8hKvRHCWoRKzRfYhgiMe4F+Tu
 f0d1H2bOaJL+p+7EP3IDUlHNsPjoobecqIK11R7qaRfdJFohtqQWIuF1H6dQQ+ZivP66
 da3EbGMsjHURxlHfiGoOiDr6+bA3bkoZIktNKqQJxieeHYEmHWRUB44WolPkNSMToEcm
 nBvqytHdLS+I/xO9eUuKJp7ZMz5Gc55PT2P3DrS5vpPSOKwFCYJLsBQhZcterIkePKRi
 Bj/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jbpUXpYK
Subject: [Buildroot] [PATCH 1/1] package/faad2: security bump to version
 2.11.1
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
Cc: Gilles Talis <gilles.talis@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch to cmake-package
- Fix CVE-2023-38857 and CVE-2023-38858

https://github.com/knik0/faad2/blob/2.11.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/faad2/faad2.hash | 2 +-
 package/faad2/faad2.mk   | 8 ++------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/faad2/faad2.hash b/package/faad2/faad2.hash
index 3a9c36df00..b7813130fd 100644
--- a/package/faad2/faad2.hash
+++ b/package/faad2/faad2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4c16c71295ca0cbf7c3dfe98eb11d8fa8d0ac3042e41604cfd6cc11a408cf264  faad2-2.10.1.tar.gz
+sha256  72dbc0494de9ee38d240f670eccf2b10ef715fd0508c305532ca3def3225bb06  faad2-2.11.1.tar.gz
 sha256  d3baf3a54943cf12a994c85867a18dec84f810901b2f2878ddfd77efcc3c150f  COPYING
diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index eecab35af8..686e5045c0 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -4,16 +4,12 @@
 #
 ################################################################################
 
-FAAD2_VERSION = 2.10.1
+FAAD2_VERSION = 2.11.1
 FAAD2_SITE = $(call github,knik0,faad2,$(FAAD2_VERSION))
 FAAD2_LICENSE = GPL-2.0
 FAAD2_LICENSE_FILES = COPYING
 FAAD2_CPE_ID_VENDOR = audiocoding
 FAAD2_CPE_ID_PRODUCT = freeware_advanced_audio_decoder_2
-# frontend/faad calls frexp()
-FAAD2_CONF_ENV = LIBS=-lm
 FAAD2_INSTALL_STAGING = YES
-# From git
-FAAD2_AUTORECONF = YES
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
