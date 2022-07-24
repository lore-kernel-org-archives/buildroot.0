Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBF6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 23:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 093F141706;
	Sun, 24 Jul 2022 23:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 093F141706
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TLa8sGQQgF8q; Sun, 24 Jul 2022 23:58:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95EED4161B;
	Sun, 24 Jul 2022 23:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95EED4161B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9273A1BF31C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 727A960BD0
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 727A960BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XoyYBzPJgPSr for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 23:58:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AB8860BD3
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AB8860BD3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 23:58:22 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id j70so11765600oih.10
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rngc3MHnMVqXqGAPGdSgDT3QojOZ3fP7FHuw1sBhWwA=;
 b=UbySJ8o4o21ZlakOBdnjg3rIJM8Q0LKIO2xToT+Ost0JoTqyYQ+djg1+HCeQNLE2dK
 n4xOH9Zclrtf7tVCcNSz4fIVgusAsZQrYWZrPeWsW7txyOzK0XtOW8iFM5x8vqnwZxiY
 pYWe3vSmO0e4syPzxmM7npPBsakZOdUv+XNx3Shv0UDiI/fPk28L223ZN3QXQY1/vQRU
 BL0EnUKgG3fzWcs+pLSY3QyllGUyMPcPm1QAiX8eFhPnU/Fy9k50BvtBp8YYIhFS5Skh
 g6Z9fG9cnFbyK7mOZr2ai1SeEmVwkjaqq7gGv1bAPIMYgqIVehMk7ruuTLhpeBErfCVP
 bz5g==
X-Gm-Message-State: AJIora+1Y2X2yiMH3XITtSEZ5uxD9V83j8DHmovP2Lm/AFdCnJ13Er7T
 Ng/jfrgFImGMGif1aiw3cYTeZbZ61ibDWA==
X-Google-Smtp-Source: AGRyM1vnuFivvQa1X7MG0c6llnhqbUuV3QG0ZII2YLqWKhiYD2XZ0X+ERquSzIvBx/BSlOqCjDEaGg==
X-Received: by 2002:a05:6808:1281:b0:33a:3e34:38c0 with SMTP id
 a1-20020a056808128100b0033a3e3438c0mr4425528oiw.154.1658707101221; 
 Sun, 24 Jul 2022 16:58:21 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 s41-20020a4a96ac000000b00435a59fba01sm4281376ooi.47.2022.07.24.16.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 16:58:20 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 16:58:18 -0700
Message-Id: <20220724235818.679881-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mkbootimg: new host package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Android bootimg utilities: mkbootimg and unpackbootimg.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in.host                        |  1 +
 ...akefile-remove-cc-and-ar-definitions.patch | 97 +++++++++++++++++++
 package/mkbootimg/Config.in.host              |  4 +
 package/mkbootimg/mkbootimg.hash              |  3 +
 package/mkbootimg/mkbootimg.mk                | 26 +++++
 5 files changed, 131 insertions(+)
 create mode 100644 package/mkbootimg/0001-makefile-remove-cc-and-ar-definitions.patch
 create mode 100644 package/mkbootimg/Config.in.host
 create mode 100644 package/mkbootimg/mkbootimg.hash
 create mode 100644 package/mkbootimg/mkbootimg.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 71f2a9311c..38ee0e9e32 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -54,6 +54,7 @@ menu "Host utilities"
 	source "package/mender-artifact/Config.in.host"
 	source "package/meson-tools/Config.in.host"
 	source "package/mfgtools/Config.in.host"
+	source "package/mkbootimg/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
diff --git a/package/mkbootimg/0001-makefile-remove-cc-and-ar-definitions.patch b/package/mkbootimg/0001-makefile-remove-cc-and-ar-definitions.patch
new file mode 100644
index 0000000000..d61b1e0b88
--- /dev/null
+++ b/package/mkbootimg/0001-makefile-remove-cc-and-ar-definitions.patch
@@ -0,0 +1,97 @@
+From 04a62922ce238f3106a916a30c0c2995ffa1526c Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Sat, 14 May 2022 20:58:14 -0700
+Subject: [PATCH] makefile: remove cc and ar definitions
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ Makefile             | 26 +-------------------------
+ libmincrypt/Makefile | 27 +++++----------------------
+ 2 files changed, 6 insertions(+), 47 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 6ee3a38c..39d0996b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,29 +1,4 @@
+ # Andrew Huang <bluedrum@163.com>
+-ifeq ($(CC),cc)
+-CC = gcc
+-endif
+-AR = ar rcv
+-ifeq ($(windir),)
+-EXE =
+-RM = rm -f
+-else
+-EXE = .exe
+-RM = del
+-endif
+-
+-CFLAGS = -ffunction-sections -O3
+-
+-ifneq (,$(findstring darwin,$(CROSS_COMPILE)))
+-    UNAME_S := Darwin
+-else
+-    UNAME_S := $(shell uname -s)
+-endif
+-ifeq ($(UNAME_S),Darwin)
+-    LDFLAGS += -Wl,-dead_strip
+-else
+-    LDFLAGS += -Wl,--gc-sections -s
+-endif
+-
+ all:mkbootimg$(EXE) unpackbootimg$(EXE)
+ 
+ static:
+@@ -31,6 +6,7 @@ static:
+ 
+ libmincrypt.a:
+ 	$(MAKE) -C libmincrypt
++	cp ./libmincrypt/libmincrypt.a ./libmincrypt.a
+ 
+ mkbootimg$(EXE):mkbootimg.o libmincrypt.a
+ 	$(CROSS_COMPILE)$(CC) -o $@ $^ -L. -lmincrypt $(LDFLAGS)
+diff --git a/libmincrypt/Makefile b/libmincrypt/Makefile
+index ad482de9..c7c478ff 100755
+--- a/libmincrypt/Makefile
++++ b/libmincrypt/Makefile
+@@ -1,31 +1,14 @@
+-ifeq ($(CC),cc)
+-CC = gcc
+-endif
+-AR = ar rc
+-ifeq ($(windir),)
+-RM = rm -f
+-CP = cp
+-else
+-RM = del
+-CP = copy /y
+-endif
+-
+-CFLAGS = -ffunction-sections -O3
+-EXT = a
+-LIB = libmincrypt.$(EXT)
++LIB = libmincrypt.a
+ LIB_OBJS = dsa_sig.o p256.o p256_ec.o p256_ecdsa.o rsa.o sha.o sha256.o
+ INC  = -I..
+ 
+-all:$(LIB)
++all: $(LIB)
+ 
+ clean:
+ 	$(RM) $(LIB_OBJS) $(LIB)
+ 
+-$(LIB):$(LIB_OBJS)
+-	$(CROSS_COMPILE)$(AR) $@ $^
+-	$(CP) $@ ..
+-
++$(LIB): $(LIB_OBJS)
++	$(CROSS_COMPILE)$(AR) rc $@ $^
+ 
+-%.o:%.c
++%.o: %.c
+ 	$(CROSS_COMPILE)$(CC) -o $@ $(CFLAGS) -c $< $(INC)
+-
+-- 
+2.35.1
+
diff --git a/package/mkbootimg/Config.in.host b/package/mkbootimg/Config.in.host
new file mode 100644
index 0000000000..2ca7bcae00
--- /dev/null
+++ b/package/mkbootimg/Config.in.host
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_HOST_MKBOOTIMG
+	bool "host mkbootimg"
+	help
+	  Android Bootimg mkbootimg and unpackbootimg utils.
diff --git a/package/mkbootimg/mkbootimg.hash b/package/mkbootimg/mkbootimg.hash
new file mode 100644
index 0000000000..8beaf8d56c
--- /dev/null
+++ b/package/mkbootimg/mkbootimg.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  28ddd4a2e472e4e044c9b461fb8e3ce04ea9af0bbbafc8010958df28d27707a7  mkbootimg-d4a2677828fe9b60117af8996dcf1dea85d6b431.tar.gz
+sha256  b220fd3c79e0906eda798b23699305ab05576e849f45810eca74afcb2c7f2311  NOTICE
diff --git a/package/mkbootimg/mkbootimg.mk b/package/mkbootimg/mkbootimg.mk
new file mode 100644
index 0000000000..460e50aa9e
--- /dev/null
+++ b/package/mkbootimg/mkbootimg.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# mkbootimg
+#
+################################################################################
+
+MKBOOTIMG_VERSION = d4a2677828fe9b60117af8996dcf1dea85d6b431
+MKBOOTIMG_SITE = $(call github,osm0sis,mkbootimg,$(MKBOOTIMG_VERSION))
+
+MKBOOTIMG_LICENSE = BSD-3-Clause
+MKBOOTIMG_LICENSE_FILES = NOTICE
+
+HOST_MKBOOTIMG_TARGETS = mkbootimg unpackbootimg
+
+define HOST_MKBOOTIMG_BUILD_CMDS
+	$(foreach t,$(HOST_MKBOOTIMG_TARGETS),\
+		$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) SRCDIR=$(@D) \
+			-C $(@D) $(t))
+endef
+
+define HOST_MKBOOTIMG_INSTALL_CMDS
+	$(foreach t,$(HOST_MKBOOTIMG_TARGETS),\
+		$(INSTALL) -D -m 0755 $(@D)/$(t) $(HOST_DIR)/bin/$(notdir $(t))$(sep))
+endef
+
+$(eval $(host-generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
