Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FC7C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 19:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C0A882849;
	Tue, 20 Sep 2022 19:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C0A882849
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OdiEO86Fz-dQ; Tue, 20 Sep 2022 19:04:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B28B827D2;
	Tue, 20 Sep 2022 19:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B28B827D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9961A1BF2C6
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 19:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75180817AD
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 19:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75180817AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 13M5a7wmSxcx for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 19:04:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F072817AC
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F072817AC
 for <buildroot@busybox.net>; Tue, 20 Sep 2022 19:04:00 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id q21so5232407edc.9
 for <buildroot@busybox.net>; Tue, 20 Sep 2022 12:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=zRbKY7qMPQy7PHzEtJSjPdlNoPAyv0mIHd31LaI79gM=;
 b=zKZYjRemjtqrTRV49KWQZqZK5Ir9yosO1YCduRJ8p8MC9mjj6jV3V3c9y905yngTIM
 16rNgboSBNCwFSHKrhClR7/bm8azc11WKI9yTRESqBbWl3LD24spELgAo8HjUn3OgmSY
 cwdz5C9ioGpZhVmzcIHVzVvOFFveMviHbj38NCGvoMZ5PRcqASSzcfb6j3VfYqjQV4TI
 C7y/cuZIFcx4/P4q3tMAsLqMlOdi0naD0Urh92TwO4jsyxyRtqJl1TyouqvuXGFUsWS1
 0jhfAjzaaxjRDoseBuaVF/z883jGD1gCBgXvNCvtpnY5QJoawxbhW4ZZ+u406EZMI33A
 lAPA==
X-Gm-Message-State: ACrzQf09rq2gQ6XvUEa7mi18EBcwbsiRfkQkrXez2UFw89a8Wl/7xdz3
 OBSy0FIM88b0FkwG+EgOhiJGonDP0n4=
X-Google-Smtp-Source: AMsMyM5Hz/0DJC8lPBTZk5dTjUWFsReoFzZcxl7enLNnyl7GfNuQ5BUD93MwbWZRvM0DBbEwu29jCQ==
X-Received: by 2002:aa7:c0c5:0:b0:453:9a23:a0cd with SMTP id
 j5-20020aa7c0c5000000b004539a23a0cdmr15510717edp.286.1663700638772; 
 Tue, 20 Sep 2022 12:03:58 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 t17-20020aa7db11000000b00453a49ea65bsm292228eds.86.2022.09.20.12.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:03:58 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 20 Sep 2022 21:03:54 +0200
Message-Id: <20220920190354.3688773-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=zRbKY7qMPQy7PHzEtJSjPdlNoPAyv0mIHd31LaI79gM=;
 b=cm4ISaHp7WcJe7+/N+RHXG4JpB6iWZXe68YJ5bHJrP2VorlxSO37IJgL5Xjcoid01d
 MBNBCuK0ve1D139sooDsuBI/3C/itxe6rN+rFY4+IDY90VRnzY2Mnl/t/quqmpJhkwTM
 npEqxUl8zYXCFNK10cioivWV58eXwv8c31Lag4/JBoo4x0cRDc4XKljkDN68YRaPwgcB
 io2mhXEW4v7Hnmfwc0H4rPGfvH1AV7yngyUW5ays+dTGmiG4yr50uWS9At544rbelLJl
 IhKeiPDg5jzauIMpeVgMXbvemmYsV9vZW7n3xBkLFUTFvvC5Swqzozf76SamTspFqpp9
 dD6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cm4ISaHp
Subject: [Buildroot] [PATCH] package/squashfs: security bump to version 4.5.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fix CVE-2021-41072

remove upstream patch
add a new patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...e-of-INSTALL_DIR-for-symlink-targets.patch | 37 -------------------
 package/squashfs/0001-remove-manpages.patch   | 22 +++++++++++
 package/squashfs/squashfs.hash                |  2 +-
 package/squashfs/squashfs.mk                  |  2 +-
 4 files changed, 24 insertions(+), 39 deletions(-)
 delete mode 100644 package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch
 create mode 100644 package/squashfs/0001-remove-manpages.patch

diff --git a/package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch b/package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch
deleted file mode 100644
index 997719e63..000000000
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
diff --git a/package/squashfs/0001-remove-manpages.patch b/package/squashfs/0001-remove-manpages.patch
new file mode 100644
index 000000000..5bb1a12d0
--- /dev/null
+++ b/package/squashfs/0001-remove-manpages.patch
@@ -0,0 +1,22 @@
+From 9ae79c2202e462401715671c6d19bb1e83dad741 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Tue, 20 Sep 2022 20:16:21 +0200
+Subject: [PATCH] remove manpages
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ squashfs-tools/Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/squashfs-tools/Makefile b/squashfs-tools/Makefile
+index 8b80b8a..3d14773 100755
+--- a/squashfs-tools/Makefile
++++ b/squashfs-tools/Makefile
+@@ -422,4 +422,3 @@ install: mksquashfs unsquashfs
+ 	cp unsquashfs $(INSTALL_DIR)
+ 	ln -fs unsquashfs $(INSTALL_DIR)/sqfscat
+ 	ln -fs mksquashfs $(INSTALL_DIR)/sqfstar
+-	../generate-manpages/install-manpages.sh $(shell pwd)/.. "$(INSTALL_MANPAGES_DIR)"
+-- 
+2.34.1
+
diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index 09a2bae36..13d5aed71 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  b9e16188e6dc1857fe312633920f7d71cc36b0162eb50f3ecb1f0040f02edddd  squashfs-4.5.tar.gz
+sha256  277b6e7f75a4a57f72191295ae62766a10d627a4f5e5f19eadfbc861378deea7  squashfs-4.5.1.tar.gz
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index f64d441c9..99ba1380a 100644
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
