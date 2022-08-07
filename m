Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA35FC25B08
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 22:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ACF681699;
	Sun,  7 Aug 2022 22:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ACF681699
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yx02aabb-2wo; Sun,  7 Aug 2022 22:05:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 966658143D;
	Sun,  7 Aug 2022 22:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 966658143D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEFF51BF2B6
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 22:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9632B4053D
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 22:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9632B4053D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mDr9_PF1YXyC for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 22:05:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A300402F3
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A300402F3
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 22:05:39 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id n185so3925046wmn.4
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 15:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=LVI2JqIVJH/WNDWfOKWNqmPSMvk5QF/251xvvA5B1UA=;
 b=DWA04exaKgfONFGDtsd2Nz0kNaW02K/7vyT4mqPIfcTbKf+UrkVYm6xDS4h1eTLSQ9
 ZRtNNL2/f/tk5GK9ZorpLY1ByxeoX+yHx1I2gBuRTFd+2N79GS/7MPnu5zqQG1xke9Dr
 B++5Yk6RAsrVzHnqR1gQkEw+4yV6LfPAIfmYLdha6rG1s9cruBLmswfz8B6GI0CQ3jXL
 SVES/PoMYuTIQW2qnzCLQtQauM+mUp+/SGvWIMoVuHqIF5a6+w1NTnBnTnDw1Tb5GTfu
 UeZlao17HuJa/qNu0zr5HODQS32Qi2VWqvMT+dAvNtCYHv98VJaEpfSyHoZUuGWS2cSv
 uw2w==
X-Gm-Message-State: ACgBeo3W7cf9rSBojynZPCgKAsp4O8CgQHm5dpg9X37pw1YMcDpMtxBQ
 ECrfYf+wJ75s+dBymT06k/WeO81Rt1I=
X-Google-Smtp-Source: AA6agR64UXlMcEEiPtChh+dYLrV8VsYV1F6mQg9bGXnnJz1DENT8H424l6+vRXOBoP4tlm0zf7NSAA==
X-Received: by 2002:a05:600c:384c:b0:3a3:744d:8dd2 with SMTP id
 s12-20020a05600c384c00b003a3744d8dd2mr15782356wmr.117.1659909937189; 
 Sun, 07 Aug 2022 15:05:37 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a5d4b92000000b0021d6924b777sm9699119wrt.115.2022.08.07.15.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 15:05:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 00:05:28 +0200
Message-Id: <20220807220528.251581-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=LVI2JqIVJH/WNDWfOKWNqmPSMvk5QF/251xvvA5B1UA=;
 b=Ol1rUFnAyhNTjAkjdVVrc/5IhXtPRhvmChEqTrC7b5MiyrDg5lqKQQdcb0r5L+/R/C
 jAVSzxZljJj61+EYgowJs97dmoVWDdVvHyEQTJ05OoGK6AY8k5Ad9NwZ2cClEd0iYuQp
 UlbyFDQP3W1f9HG8fbW7NdEJ6BIG6LUxVBP7AaiT1s/+Sp9lWOI9/IC6mZqxq01CwSNe
 vLUcn7+CE1jmWHsQyp/rWo8JVGMU0SkbiNlQos5LJJOY3Qxs+sUdhqaUuI7kwM00lHvZ
 aVXZ2qEieZmxD8MuJ3vdLfl6SM5yn8DDhAI0RTGx5MF8zGqVB0oZcmD/y+6gHdUlONfr
 rleQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ol1rUFnA
Subject: [Buildroot] [PATCH 1/1] package/crda: bump to version 4.15
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/crda/0002-drop-ldconfig-call.patch | 4 +++-
 package/crda/crda.hash                     | 2 +-
 package/crda/crda.mk                       | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/crda/0002-drop-ldconfig-call.patch b/package/crda/0002-drop-ldconfig-call.patch
index f09e258adb..567840c07e 100644
--- a/package/crda/0002-drop-ldconfig-call.patch
+++ b/package/crda/0002-drop-ldconfig-call.patch
@@ -1,6 +1,8 @@
 Drop ldconfig call, it's useless for cross-compiling.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Fabrice: update for 4.15]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
 diff -Nura crda-3.18.orig/Makefile crda-3.18/Makefile
 --- crda-3.18.orig/Makefile	2015-02-18 10:34:23.841259401 -0300
@@ -8,7 +10,7 @@ diff -Nura crda-3.18.orig/Makefile crda-3.18/Makefile
 @@ -127,7 +127,6 @@
  	$(NQ) '  INSTALL  libreg'
  	$(Q)mkdir -p $(DESTDIR)/$(LIBDIR)
- 	$(Q)cp $(LIBREG) $(DESTDIR)/$(LIBDIR)/
+	$(Q)$(INSTALL) -m 644 $(LIBREG) $(DESTDIR)/$(LIBDIR)/
 -	$(Q)ldconfig
  
  %.o: %.c regdb.h $(LIBREG)
diff --git a/package/crda/crda.hash b/package/crda/crda.hash
index 2a263d172a..3b0610994e 100644
--- a/package/crda/crda.hash
+++ b/package/crda/crda.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5a8f35bb8b27474f466b0e75d451ba917433d8aab1889678a64d9c4e72a8b8c2  crda-4.14.tar.gz
+sha256  99eb58f774f6016c380def0d80fffd573d2be0ad5f117b678c1968ed5657af82  crda-4.15.tar.gz
 sha256  c16224b376128b589eea69a8fdd1f09818b8cb995e10d1e37f72dff22233d7b0  LICENSE
diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index 31a64d004b..a73c9aa26d 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRDA_VERSION = 4.14
+CRDA_VERSION = 4.15
 CRDA_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git/snapshot
 CRDA_DEPENDENCIES = host-pkgconf host-python-pycryptodomex libnl libgcrypt
 CRDA_LICENSE = ISC
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
