Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BE8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 13:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77DDF40577;
	Sun, 23 Jan 2022 13:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jxaiCu0gET2; Sun, 23 Jan 2022 13:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 611AF40545;
	Sun, 23 Jan 2022 13:49:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 642011BF422
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 13:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 533204028B
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 13:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JLbhrfyBR2oR for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 13:49:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1713440287
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 13:49:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso32473526wmj.0
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 05:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ofwmxgVicwQ8u/sLvvLCOr2g5GOBxhki5mRTNek+kUg=;
 b=ow8uT/cMbAZUvDu+rTNuVDNxxK41usn150wOpyUy+GyWTtvAcWKWP3W3dVL+flFdwu
 pz+Ye0m7B4ki6N+uUzXD3EY7XWiX/jiXaLNNYJXBz60dFznhAByp8NKEWJ0Dc2UPFEvm
 CgXynbXfczrAcQbjTelAtQw5qeE66ap1Lsiu2GfVc4TzyyGaHpF/OTvTWHhmBMGHODWt
 yYfOIXlk+UZRZIZXvmFkaY+B8AIBE7+xXNLvNrOOiC+rtgWkJxj3vGwVFMMtQn4ytkPe
 Vv27+mKXbsc/fWCqMkkg1+U/H6upGHLqy6PzxcRz7bKS5zAXPT33y2XWNVRRdXw39eA6
 EtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ofwmxgVicwQ8u/sLvvLCOr2g5GOBxhki5mRTNek+kUg=;
 b=GDNdxlvb9vFIvQP0FjnLa/olwOKzW538a1WJOE0BBmW7nEBnVcZf+jFFJ0hHS32EEx
 7/GVXglypRXWpf/v+Ig9nhPBMPIJ+mIM2sX74vXy8uIQGVSMEF/Wz6OpOPKIxbBEIu8v
 JeVAsXVb0g/8cYfOp4W0Su4m/FgLZqyZgKwkrhgbrycP6d+Rd6pV7cZxUVfOlC4vf8L0
 nMntSdzUvzsXFfngx1UBWqTYNCbn0WDAhA0agHa7blW4E153k5r4iOvT8EEzzu2/n5rm
 nzFIpP7DRXfiww8LTxFfDOmaNi3rDFWkVGMAyRjpusNkGrX5cz7qrp5SJP8ShqKiuFTc
 +Www==
X-Gm-Message-State: AOAM533+Z9j9jeAnCZNIw1jkjUPUA5cBz7NByQDjjAEjxcjrH95rl8SL
 6AptF39gccq9qW6+ISSXT57zT4GjXa8=
X-Google-Smtp-Source: ABdhPJyNSlYLi37X9Se4S/gTEvH3BcakEWs3ZTdPVybyvRBvemwTFTqJJQdIw98eZFKZUXHrEA3NTA==
X-Received: by 2002:a1c:a507:: with SMTP id o7mr8006009wme.32.1642945774207;
 Sun, 23 Jan 2022 05:49:34 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id n8sm1671232wmk.18.2022.01.23.05.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 05:49:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 14:47:51 +0100
Message-Id: <20220123134751.703269-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123134751.703269-1-fontaine.fabrice@gmail.com>
References: <20220123134751.703269-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libpjsip: security bump to version
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Security update. This version is recommended for all users to improve
the security of applications using PJSIP.

Fix CVE-2020-15260, CVE-2021-21375 and CVE-2021-32686

Update indentation in hash file (two spaces)

https://github.com/pjsip/pjproject/security/advisories/GHSA-8hcp-hm38-mfph
https://github.com/pjsip/pjproject/security/advisories/GHSA-hvq6-f89p-frvp
https://github.com/pjsip/pjproject/security/advisories/GHSA-cv8x-p47p-99wr
https://github.com/pjsip/pjproject/releases/tag/2.11
https://github.com/pjsip/pjproject/releases/tag/2.11.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpjsip/libpjsip.hash | 4 ++--
 package/libpjsip/libpjsip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index 68c2208885..f39ebf4060 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	936a4c5b98601b52325463a397ddf11ab4106c6a7b04f8dc7cdd377efbb597de	pjproject-2.10.tar.gz
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256  45f6604372df3f49293749cd7c0b42cb21c4fb666c66f8ed9765de004d1eae38  pjproject-2.11.1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 771db0ac72..b05cc31a83 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.10
+LIBPJSIP_VERSION = 2.11.1
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
 LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
-# https://github.com/pjsip/pjproject/archive/2.10.tar.gz
+# https://github.com/pjsip/pjproject/archive/2.11.1.tar.gz
 
 LIBPJSIP_DEPENDENCIES = libsrtp
 LIBPJSIP_LICENSE = GPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
