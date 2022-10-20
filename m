Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360F3C4332F
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 17:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C05A784347;
	Thu, 20 Oct 2022 17:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C05A784347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6p81JKrczp_C; Thu, 20 Oct 2022 17:02:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF7498433C;
	Thu, 20 Oct 2022 17:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF7498433C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1F8D1BF3EA
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 17:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A44660BE6
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 17:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A44660BE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hWW9ibiqNOzT for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 17:02:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7139560BDF
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7139560BDF
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 17:02:40 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i9so2546874wrv.5
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 10:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a8n18XWTANZwFDLCYMwaHdtzt+lukxUb8X8QNIskxQg=;
 b=LKiTjOTQZRRR18ujXDynNrGaokxnkkrOtfVnc5i8oZSNuR2ZEeefyYfKMeXQ7lqloz
 RnGjtERa6tc0Vv5L4gMKqZSWCzaTyqe0d1K/yQdn9OT9u0ksrsHqysr+9cn092YGKKWJ
 lofnu8z+xIjpbd3PivIwhhTsy1lC2ukemhv0auMbuYZoCibQu3xc+KidpDQf2H9TEzd8
 qjWYOcS6QYaobfca/uKIGZyghy3tHLUqKdeRijPrvF1q5COatsVsCsuttuC3sj5ieAKZ
 OPecxN/zBUD0JfeaUgjeArzUnlAW/LqKwyFjU1u821i+K7k96NPV9h24Mx6RcJiToxiv
 2RyA==
X-Gm-Message-State: ACrzQf3W0O/kiNBy0G1wxseYZ8iUcKuRm0jFNhiGd8Vbl8c236Dcbugo
 NzKByLiS42nSt4cF352rkH085L4q9B8=
X-Google-Smtp-Source: AMsMyM7BwzwvGrJCo14f/j90hCcIdQMAJ3sB+K0WlJbRgbkF6JRKv/N4A5ky5Jmc1sDc/M7LscdYyQ==
X-Received: by 2002:a5d:6f16:0:b0:234:f157:5ac8 with SMTP id
 ay22-20020a5d6f16000000b00234f1575ac8mr4239278wrb.575.1666285358294; 
 Thu, 20 Oct 2022 10:02:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c19c900b003a3442f1229sm343690wmq.29.2022.10.20.10.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 10:02:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 19:02:33 +0200
Message-Id: <20221020170233.230696-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a8n18XWTANZwFDLCYMwaHdtzt+lukxUb8X8QNIskxQg=;
 b=db5m3fUiVIDiLkgeQYek3iTIKyHUnq8i0Oo8pCAwKkAbTXS/QVk90N67SlqtAXPKY/
 c4YXiMYYHjsMWGhJVK/ds+dBgwBqTA5fkL62PwtyzGL6EU7DHztiMXmLfyjTYKUEzDFm
 5Ddri6Uv5OPf29YQpBpBQ6M2i1kXa585/ne+1mrtKtZFtskGqZjfCs/iEKshxNp44CRg
 i27V7GLlP6mt+UqG+zL4gIyMTLewpqx6T3f+redQOQDPE+KfhMJ26JCXSgDVT6K/hPqN
 xtVpqVGC6V+cVaM4UVlNoXbGL1NNmk7T/KJeTJkA+QDKSQwOwb1awSLYRPQSGNYo4B5J
 cEgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=db5m3fUi
Subject: [Buildroot] [PATCH 1/1] package/squashfs: security bump to version
 4.5.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2021-40153
- CVE-2021-41072 which is a writing outside of destination exploit, has
  been fixed.
- Drop patch (already in version)
- Set INSTALL_MANPAGES_DIR to an empty value to disable build and
  install of man pages which were added with
  https://github.com/plougher/squashfs-tools/commit/25bce9a64cc3f88f0afed9ce2f3d27beabc44d7b

https://github.com/plougher/squashfs-tools/releases/tag/4.5.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e-of-INSTALL_DIR-for-symlink-targets.patch | 37 -------------------
 package/squashfs/squashfs.hash                |  2 +-
 package/squashfs/squashfs.mk                  |  8 ++--
 3 files changed, 6 insertions(+), 41 deletions(-)
 delete mode 100644 package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch

diff --git a/package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch b/package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch
deleted file mode 100644
index 997719e63a..0000000000
--- a/package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f5c908e92d4c055859be2fddbda266d9e3bfd415 Mon Sep 17 00:00:00 2001
-From: Patrick McCarty <patrick.mccarty@intel.com>
-Date: Mon, 26 Jul 2021 11:38:43 -0700
-Subject: [PATCH] Avoid use of INSTALL_DIR for symlink targets
-
-In case INSTALL_DIR is overridden with a staged install location, using
-INSTALL_DIR for the symlink target path prefix will yield an incorrect location
-for the final installation.
-
-Because the symlink itself is already installed to INSTALL_DIR, simply removing
-the INSTALL_DIR prefix suffices as a fix.
-
-Note that using $DESTDIR/$INSTALL_DIR where appropriate can avoid this type of
-issue, but that can be considered a future enhancement.
-
-Signed-off-by: Patrick McCarty <patrick.mccarty@intel.com>
-Upstream: f5c908e92d4c055859be2fddbda266d9e3bfd415
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- squashfs-tools/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/squashfs-tools/Makefile b/squashfs-tools/Makefile
-index f5a55f1..7262a2e 100755
---- a/squashfs-tools/Makefile
-+++ b/squashfs-tools/Makefile
-@@ -406,5 +406,5 @@ install: mksquashfs unsquashfs
- 	mkdir -p $(INSTALL_DIR)
- 	cp mksquashfs $(INSTALL_DIR)
- 	cp unsquashfs $(INSTALL_DIR)
--	ln -fs $(INSTALL_DIR)/unsquashfs $(INSTALL_DIR)/sqfscat
--	ln -fs $(INSTALL_DIR)/mksquashfs $(INSTALL_DIR)/sqfstar
-+	ln -fs unsquashfs $(INSTALL_DIR)/sqfscat
-+	ln -fs mksquashfs $(INSTALL_DIR)/sqfstar
--- 
-2.31.1
-
diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index 09a2bae364..13d5aed71f 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  b9e16188e6dc1857fe312633920f7d71cc36b0162eb50f3ecb1f0040f02edddd  squashfs-4.5.tar.gz
+sha256  277b6e7f75a4a57f72191295ae62766a10d627a4f5e5f19eadfbc861378deea7  squashfs-4.5.1.tar.gz
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index f64d441c9b..323908d94e 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUASHFS_VERSION = 4.5
+SQUASHFS_VERSION = 4.5.1
 SQUASHFS_SITE = $(call github,plougher,squashfs-tools,$(SQUASHFS_VERSION))
 SQUASHFS_LICENSE = GPL-2.0+
 SQUASHFS_LICENSE_FILES = COPYING
@@ -75,7 +75,8 @@ endef
 
 define SQUASHFS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(SQUASHFS_MAKE_ARGS) \
-		-C $(@D)/squashfs-tools/ INSTALL_DIR=$(TARGET_DIR)/usr/bin install
+		-C $(@D)/squashfs-tools/ INSTALL_DIR=$(TARGET_DIR)/usr/bin \
+		INSTALL_MANPAGES_DIR="" install
 endef
 
 define HOST_SQUASHFS_BUILD_CMDS
@@ -89,7 +90,8 @@ endef
 
 define HOST_SQUASHFS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) $(HOST_SQUASHFS_MAKE_ARGS) \
-		-C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/bin install
+		-C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/bin \
+		INSTALL_MANPAGES_DIR="" install
 endef
 
 $(eval $(generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
