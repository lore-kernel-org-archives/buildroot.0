Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AE3C32773
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 19:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8549F419D3;
	Thu, 18 Aug 2022 19:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8549F419D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m6qR1V7kuMhP; Thu, 18 Aug 2022 19:12:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1126641987;
	Thu, 18 Aug 2022 19:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1126641987
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 012D11BF2A9
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 19:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD7D14016C
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 19:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD7D14016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fh5TyQmzpV8r for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 19:12:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4D5840154
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4D5840154
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 19:12:50 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id y187so1829542iof.0
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 12:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=4vKEUUWFmEThKdZ7jDJ9NlBUMbnhK0bpCwQRvZ5wnSE=;
 b=4Th8jTFpoOPHMQVE4GrHsNk+dz8W55kOJogsPMVB1oAJy3elMon60KODmxLWyWO1TU
 /KmC9z1EhQjtPMnrlCN0rgXPIY8jDrQlepEa4A7K+w5VZMNC38Y2JMwYKSlr25bBTKJX
 Qcibb0TQCWrpTViGkNzCjaU6RFmbrT8VPpSncdwecN7vMBTGiSrxjuHsS5Lf0Tbckauc
 Gmh53yYg+31Iy+whNZ6WK5s6CcN3OrdWYoUbWifIyotAYlipYEbcBWiqPQQEaCi/24mj
 RUsyWL+fIGqyXJtCskliylJXtMztGmDStxV01poOSx8s0butRGA5CtWzCsARsSGPsnvV
 jBWA==
X-Gm-Message-State: ACgBeo3LsCFvytaKETCOLmXwr97TRsEUVrvWp+LGMXSRW/I2cW9m46NS
 9klrwW4Ls/rggs+dD9fxDHDP6rAETySDGYQ=
X-Google-Smtp-Source: AA6agR4B0+4SfZkADR2MikuDd9oRG+9gnMzW0FmAU11PCKTkvMoAeRstBknspBlNkvScbtGHC1JBeQ==
X-Received: by 2002:a05:6602:15c6:b0:67a:33d1:6c73 with SMTP id
 f6-20020a05660215c600b0067a33d16c73mr2028659iow.156.1660849969431; 
 Thu, 18 Aug 2022 12:12:49 -0700 (PDT)
Received: from bixby.lan ([76.130.90.80]) by smtp.gmail.com with ESMTPSA id
 x13-20020a92d64d000000b002e8e1a7d90esm927587ilp.65.2022.08.18.12.12.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 12:12:48 -0700 (PDT)
Message-ID: <6c71c767d7904097e3e27f7cd3f483d66eadb44d.camel@egauge.net>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 13:12:48 -0600
In-Reply-To: <a616e2b3d0edf64b98a2114dad8086fcdd1088f4.camel@egauge.net>
References: <a616e2b3d0edf64b98a2114dad8086fcdd1088f4.camel@egauge.net>
Organization: eGauge Systems LLC
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=egauge.net; s=google;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc;
 bh=4vKEUUWFmEThKdZ7jDJ9NlBUMbnhK0bpCwQRvZ5wnSE=;
 b=Ku9/oG7nCvSHZFwYKvMm+A0IPW2l/8/a+HntLM11Yn+FbIr2Qns7nBaFUluVmNX94O
 Xq9Ay8RomK8m1ExyPljZJz3BklOXHzAiRxzM+u5iICYz7wfihjBKsbHkDI2PPwgTJW5E
 Ah4aRwPqqlu9ojZf4OL+MmiTLyMtmDNDGNPM1ZiLPtnN5Ov6lhXmq5ZCu2PoxNgthbAl
 zC4PbW151qt27bW+Nn53n4BYPw7Rl03qeeVey37ZGE7pKzFKAHzibFqwixl5jxBgQIB1
 Ow5T2q+2oK33P/0n7BmwpI2tFGlOOa7MhCj23CqYt5e1iirhTNVrya2HTZE4zDdww7Cv
 RHdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=egauge.net header.i=@egauge.net
 header.a=rsa-sha256 header.s=google header.b=Ku9/oG7n
Subject: Re: [Buildroot] add support for generating multiple UBI images
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
From: David Mosberger-Tang via buildroot <buildroot@buildroot.org>
Reply-To: David Mosberger-Tang <davidm@egauge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sorry, the attachement got scrubbed.  Here is the patch.

  --david

commit 03d07d07e9e686fe388da362d8e14db369474ac4
Author: David Mosberger-Tang <davidm@egauge.net>
Date:   Thu Aug 18 10:51:50 2022 -0600

    fs: ubifs: support generating multiple UBI images
    
    This is needed in order to be able to handle NAND flash chips with
    different parameters.

diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
index ff604c5c38..23a3f61977 100644
--- a/fs/ubifs/Config.in
+++ b/fs/ubifs/Config.in
@@ -5,19 +5,16 @@ config BR2_TARGET_ROOTFS_UBIFS
 
 if BR2_TARGET_ROOTFS_UBIFS
 
-config BR2_TARGET_ROOTFS_UBIFS_LEBSIZE
-	hex "logical eraseblock size"
-	default 0x1f800
-	help
-	  Logical eraseblock (LEB) size. The value provided here is
-	  passed to the -e/--leb-size option of mkfs.ubifs.
-
-config BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE
-	hex "minimum I/O unit size"
-	default 0x800
-	help
-	  Minimum I/O unit size. The value provided here is passed
-	  to the -m/--min-io-size option of mkfs.ubifs/ubinize.
+config BR2_TARGET_ROOTFS_UBIFS_PARAMS
+       string "List of UBIFS parameters for which images should be generated."
+       default "0x1f000-0x800-0x20000"
+       help
+	  This list contains one or more UBIFS parameter sets for which to
+	  generate images for.  Each parameter set consists of three
+	  hex strings separated by dashes.  The first hex string specifies
+	  the logical eraseblock (LEB) size in bytes.  The second the
+	  minimum I/O size in bytes (also known as page size or write size).
+	  The third the physical eraseblock (PEB) size in bytes.
 
 config BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT
 	int "maximum logical eraseblock count"
@@ -102,14 +99,6 @@ config BR2_TARGET_ROOTFS_UBI
 
 if BR2_TARGET_ROOTFS_UBI
 
-config BR2_TARGET_ROOTFS_UBI_PEBSIZE
-	hex "physical eraseblock size"
-	default 0x20000
-	help
-	  Tells ubinize the physical eraseblock (PEB) size of the
-	  flash chip the ubi image is created for. The value provided
-	  here is passed to the -p/--peb-size option of ubinize.
-
 config BR2_TARGET_ROOTFS_UBI_SUBSIZE
 	int "sub-page size"
 	default 512
diff --git a/fs/ubifs/ubi-common.mk b/fs/ubifs/ubi-common.mk
new file mode 100644
index 0000000000..824232b040
--- /dev/null
+++ b/fs/ubifs/ubi-common.mk
@@ -0,0 +1,21 @@
+#
+# Invoke this macro with $(call ROOTFS_DO_UBI_PARAMS CMD PARAMS) to
+# split the UBIFS parameters PARAMS and pass them to macro CMD.
+# PARAMS must be of the form "LEB-MINIO-PEB" where LEB is the logical
+# erase-block size in bytes, MINIO is the page size in bytes, and PEB
+# is the physical erase-block size in bytes (all three must be
+# specified as hex strings).
+#
+# CMD is called with parameters LEB, MINIO, PEB, and TAG.  The first
+# three are identical to the respective parameters passed in PARAMS.
+# TAG is a filename tag of the form "eb${leb}k-pg${minio}k" where
+# ${leb} is LEB and ${minio} is MINIO expressed in KiB (as a decimal
+# number).
+#
+export ROOTFS_DO_UBI_PARAMS =						  \
+	params="$(subst -, ,$2)";					  \
+	leb=$$(echo $$params | cut -f1 -d' ');				  \
+	minio=$$(echo $$params | cut -f2 -d' ');			  \
+	peb=$$(echo $$params | cut -f3 -d' ');				  \
+	tag=$$(printf "eb%dk-pg%dk" $$(($$peb/1024)) $$(($$minio/1024))); \
+	$(call $1,$$leb,$$minio,$$peb,$$tag)
diff --git a/fs/ubifs/ubi.mk b/fs/ubifs/ubi.mk
index e488cb5f8a..be2107c2a6 100644
--- a/fs/ubifs/ubi.mk
+++ b/fs/ubifs/ubi.mk
@@ -4,8 +4,7 @@
 #
################################################################################
 
-UBI_UBINIZE_OPTS := -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
-UBI_UBINIZE_OPTS += -p $(BR2_TARGET_ROOTFS_UBI_PEBSIZE)
+UBI_UBINIZE_OPTS :=
 ifneq ($(BR2_TARGET_ROOTFS_UBI_SUBSIZE),0)
 UBI_UBINIZE_OPTS += -s $(BR2_TARGET_ROOTFS_UBI_SUBSIZE)
 endif
@@ -20,13 +19,20 @@ else
 UBINIZE_CONFIG_FILE_PATH = fs/ubifs/ubinize.cfg
 endif
 
+include $(dir $(lastword $(MAKEFILE_LIST)))/ubi-common.mk
+
 # don't use sed -i as it misbehaves on systems with SELinux enabled when this
is
 # executed through fakeroot (see #9386)
+mkubi
=									\
+	sed "s;BR2_ROOTFS_UBIFS_PATH;$@fs-$4;"				\
+		$(UBINIZE_CONFIG_FILE_PATH) >
$(BUILD_DIR)/ubinize.cfg;	\
+	$(HOST_DIR)/usr/sbin/ubinize -o $@-$4 $(UBI_UBINIZE_OPTS)	\
+		-m $2 -p $3 $(BUILD_DIR)/ubinize.cfg;			\
+	rm $(BUILD_DIR)/ubinize.cfg;
+
 define ROOTFS_UBI_CMD
-	sed 's;BR2_ROOTFS_UBIFS_PATH;$@fs;' \
-		$(UBINIZE_CONFIG_FILE_PATH) > $(BUILD_DIR)/ubinize.cfg
-	$(HOST_DIR)/usr/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS)
$(BUILD_DIR)/ubinize.cfg
-	rm $(BUILD_DIR)/ubinize.cfg
+	$(foreach p,$(call qstrip,$(BR2_TARGET_ROOTFS_UBIFS_PARAMS)),\
+		$(call ROOTFS_DO_UBI_PARAMS,mkubi,$p))
 endef
 
 $(eval $(call ROOTFS_TARGET,ubi))
diff --git a/fs/ubifs/ubifs.mk b/fs/ubifs/ubifs.mk
index f1e4126e86..a6779f49e8 100644
--- a/fs/ubifs/ubifs.mk
+++ b/fs/ubifs/ubifs.mk
@@ -4,7 +4,7 @@
 #
################################################################################
 
-UBIFS_OPTS := -e $(BR2_TARGET_ROOTFS_UBIFS_LEBSIZE) -c
$(BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT) -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
+UBIFS_OPTS := -c $(BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT)
 
 ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_ZLIB),y)
 UBIFS_OPTS += -x zlib
@@ -20,8 +20,14 @@ UBIFS_OPTS += $(call qstrip,$(BR2_TARGET_ROOTFS_UBIFS_OPTS))
 
 ROOTFS_UBIFS_DEPENDENCIES = host-mtd
 
+include $(dir $(lastword $(MAKEFILE_LIST)))/ubi-common.mk
+
+mkubifs = $(HOST_DIR)/usr/sbin/mkfs.ubifs -d $(TARGET_DIR)	\
+		-e $1 -m $2 $(UBIFS_OPTS) -o $@-$4;
+
 define ROOTFS_UBIFS_CMD
-	$(HOST_DIR)/usr/sbin/mkfs.ubifs -d $(TARGET_DIR) $(UBIFS_OPTS) -o $@
+	$(foreach p,$(call qstrip,$(BR2_TARGET_ROOTFS_UBIFS_PARAMS)),\
+		$(call ROOTFS_DO_UBI_PARAMS,mkubifs,$p))
 endef
 
 $(eval $(call ROOTFS_TARGET,ubifs))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
