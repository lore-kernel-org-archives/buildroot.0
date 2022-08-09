Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430D7C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 09:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D824F81882;
	Tue,  9 Aug 2022 09:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D824F81882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g6NAC1IkeVeh; Tue,  9 Aug 2022 09:41:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E080D81769;
	Tue,  9 Aug 2022 09:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E080D81769
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5C41BF5EA
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 09:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12E0640999
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 09:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12E0640999
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-p7smURnVpN for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 09:41:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09DDB40996
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09DDB40996
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 09:41:26 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id l188so13207717oia.4
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 02:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Fb09blZkcAQZj7FDCAXGDUiLvKH6b2nnyzx2H2/bdos=;
 b=nZ3SRqWBiv2psSWd4aFBgftuFiMpOKnk7Wt8CycATQgy6PWg7O+CCrGq6d+3ZGuCHl
 bWcumXt5IGm+OkcSPSmHzrLkEWQ6vgJAzx3/wh5+jOZDD7UcHKYpoPjG1xZSBp3XoG44
 BzZsTXPDTTaxfBRV8/xEJfbb/+KIBK/yRa4Tah2MLlPvhFS7BDCTCadYkDH5VOxpKORj
 Ya5iWfTIhugsVupdm6MMNh0gYzgck4ROsreZIFIeivhCrQxlCqqp/2Dpr6V7kBKVJ3tz
 ccKIULSSQIjqD7bVVSygVVTSxQQ11fY7HVTv7wGLba5oG/IFmxSzTO4WCFnNww9nkSmB
 /AZg==
X-Gm-Message-State: ACgBeo30I6k0+BcSqK144p36r1aTP1sKNvH29qlm1gt0/8RVdhjbmfsE
 4vPIsspdnvkpXXpb2/6ArAR5H1P1WLU=
X-Google-Smtp-Source: AA6agR67svIWQtQ4GuUVXMwNzNQu2cFpH7z/AaNVuxgomemk7IYLJzzXHZV9CbtDrei7oIeeu4KcSw==
X-Received: by 2002:a05:6808:2385:b0:342:ee52:ccf5 with SMTP id
 bp5-20020a056808238500b00342ee52ccf5mr3841851oib.239.1660038085502; 
 Tue, 09 Aug 2022 02:41:25 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 t2-20020a0568301e2200b00636ff7d2cc7sm826508otr.79.2022.08.09.02.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 02:41:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 03:41:09 -0600
Message-Id: <20220809094109.2279598-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809094109.2279598-1-james.hilliard1@gmail.com>
References: <20220809094109.2279598-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Fb09blZkcAQZj7FDCAXGDUiLvKH6b2nnyzx2H2/bdos=;
 b=lVVKjkqaVNebax4IcAEvNfMwcGnWEraWhnWKgGSv5cAu/rm3bfcMLJzNd6h+ELshxE
 jIp55OQ3w2RZobZ749iXkxP8BBMjNa7RkdxOD17naNZSn/etZVbMUQDHaoUnzuo8TTK9
 nG9myI2VVl+TBDAB4hrvCjbnwa/iVFrKhew3A/pbafoesgBUKlAhIRyI9dQzXgdjkcAB
 S2s4pmwkimtGNpu/QD5uS+kOCi+kTtxpvhwpnGuxHiqt5QpHiFVEbOvlp7x0GUPZ3nTH
 +274UY9VVExOdqPhEXwlBz0dLXFEAzCTtN30qfsYuV/MxIyvlWAlwd/nwAGG1/Di6YAG
 pScw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lVVKjkqa
Subject: [Buildroot] [PATCH 2/2] package/binutils: add BPF support
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
Cc: "Jose E . Marchesi" <jose.marchesi@oracle.com>,
 David Faust <david.faust@oracle.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order for our BPF target builds to work correctly we also need to
build BPF targeted binutils.

To build BPF binutils at the same time as our normal binutils use an
isolated build directory similar to the one created by
HOST_GCC_CONFIGURE_SYMLINK and execute the build stages for both
targets.

Cc: Jose E. Marchesi <jose.marchesi@oracle.com>
Cc: David Faust <david.faust@oracle.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/binutils/Config.in.host |   5 ++
 package/binutils/binutils.mk    | 100 ++++++++++++++++++++++++++++++--
 2 files changed, 101 insertions(+), 4 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 9fa0cc4e8d..be46a12ae0 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -1,5 +1,10 @@
 comment "Binutils Options"
 
+config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_BPF
+	bool
+	default y if BR2_BINUTILS_VERSION_2_37_X
+	default y if BR2_BINUTILS_VERSION_2_38_X
+
 config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 	bool
 	default y
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 6362cb1641..78fd26b612 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -77,24 +77,116 @@ endif
 
 # "host" binutils should actually be "cross"
 # We just keep the convention of "host utility" for now
-HOST_BINUTILS_CONF_OPTS = \
+HOST_BINUTILS_COMMON_CONF_OPTS = \
+	--prefix="$(HOST_DIR)" \
+	--sysconfdir="$(HOST_DIR)/etc" \
+	--localstatedir="$(HOST_DIR)/var" \
 	--disable-multilib \
 	--disable-werror \
-	--target=$(GNU_TARGET_NAME) \
 	--disable-shared \
 	--enable-static \
-	--with-sysroot=$(STAGING_DIR) \
-	--enable-poison-system-directories \
+	--disable-gtk-doc \
+	--disable-gtk-doc-html \
+	--disable-doc \
+	--disable-docs \
+	--disable-documentation \
+	--disable-debug \
+	--with-xmlto=no \
+	--with-fop=no \
+	--disable-nls \
 	--without-debuginfod \
 	--enable-plugins \
 	--enable-lto \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
+HOST_BINUTILS_CONF_OPTS = \
+	$(HOST_BINUTILS_COMMON_CONF_OPTS) \
+	--target=$(GNU_TARGET_NAME) \
+	--with-sysroot=$(STAGING_DIR)
+
+HOST_BINUTILS_BPF_CONF_OPTS = \
+	$(HOST_BINUTILS_COMMON_CONF_OPTS) \
+	--target=$(BPF_TARGET_NAME)
+
 # binutils run configure script of subdirs at make time, so ensure
 # our TARGET_CONFIGURE_ARGS are taken into consideration for those
 BINUTILS_MAKE_ENV = $(TARGET_CONFIGURE_ARGS)
 
+HOST_BINUTILS_TARGET_BUILDDIR = build
+HOST_BINUTILS_BPF_BUILDDIR = build-bpf
+
+define HOST_BINUTILS_TARGET_CONFIGURE_SYMLINK
+	mkdir -p $(@D)/$(HOST_BINUTILS_TARGET_BUILDDIR)
+	ln -sf ../configure $(@D)/$(HOST_BINUTILS_TARGET_BUILDDIR)/configure
+endef
+HOST_BINUTILS_PRE_CONFIGURE_HOOKS += HOST_BINUTILS_TARGET_CONFIGURE_SYMLINK
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_BPF),y)
+define HOST_BINUTILS_BPF_CONFIGURE_SYMLINK
+	mkdir -p $(@D)/$(HOST_BINUTILS_BPF_BUILDDIR)
+	ln -sf ../configure $(@D)/$(HOST_BINUTILS_BPF_BUILDDIR)/configure
+endef
+HOST_BINUTILS_PRE_CONFIGURE_HOOKS += HOST_BINUTILS_BPF_CONFIGURE_SYMLINK
+endif
+
+define HOST_BINUTILS_TARGET_CONFIGURE_CMDS
+	(cd $(@D)/$(HOST_BINUTILS_TARGET_BUILDDIR) && rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		$(HOST_BINUTILS_CONF_ENV) \
+		./configure \
+		$(QUIET) $(HOST_BINUTILS_CONF_OPTS) \
+	)
+endef
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_BPF),y)
+define HOST_BINUTILS_BPF_CONFIGURE_CMDS
+	(cd $(@D)/$(HOST_BINUTILS_BPF_BUILDDIR) && rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		$(HOST_BINUTILS_CONF_ENV) \
+		./configure \
+		$(QUIET) $(HOST_BINUTILS_BPF_CONF_OPTS) \
+	)
+endef
+endif
+
+define HOST_BINUTILS_CONFIGURE_CMDS
+	$(HOST_BINUTILS_TARGET_CONFIGURE_CMDS)
+	$(HOST_BINUTILS_BPF_CONFIGURE_CMDS)
+endef
+
+define HOST_BINUTILS_TARGET_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_BINUTILS_MAKE_OPTS) -C $(@D)/$(HOST_BINUTILS_TARGET_BUILDDIR)
+endef
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_BPF),y)
+define HOST_BINUTILS_BPF_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_BINUTILS_MAKE_OPTS) -C $(@D)/$(HOST_BINUTILS_BPF_BUILDDIR)
+endef
+endif
+
+define HOST_BINUTILS_BUILD_CMDS
+	$(HOST_BINUTILS_TARGET_BUILD_CMDS)
+	$(HOST_BINUTILS_BPF_BUILD_CMDS)
+endef
+
+define HOST_BINUTILS_TARGET_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_BINUTILS_INSTALL_OPTS) -C $(@D)/$(HOST_BINUTILS_TARGET_BUILDDIR)
+endef
+
+define HOST_BINUTILS_BPF_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_BINUTILS_INSTALL_OPTS) -C $(@D)/$(HOST_BINUTILS_BPF_BUILDDIR)
+endef
+
+define HOST_BINUTILS_INSTALL_CMDS
+	$(HOST_BINUTILS_TARGET_INSTALL_CMDS)
+	$(HOST_BINUTILS_BPF_INSTALL_CMDS)
+endef
+
 # We just want libbfd, libiberty and libopcodes,
 # not the full-blown binutils in staging
 define BINUTILS_INSTALL_STAGING_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
