Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28348C4829C
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 21:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D767560625;
	Sat, 10 Feb 2024 21:49:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q4Wuf1KNftKq; Sat, 10 Feb 2024 21:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EF0560617
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EF0560617;
	Sat, 10 Feb 2024 21:49:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A15021BF295
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 21:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B488542A99
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 21:25:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bOUzqbLp40wz for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 21:25:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B125641A92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B125641A92
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B125641A92
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 21:25:02 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33b748a1eefso209619f8f.3
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 13:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707600300; x=1708205100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MffC1nSLpwfN8vnjRb3kM4TRXkoFI9hpi0sAxIYhlQw=;
 b=vSJaztVoEWR+WuTH2+l3zcpuLCItWuryxgcoaxWjxHAmLlvabdsqy5Nbqb76wKpbr5
 hiMYF4JVTn9HBGV6VT2Ap/wwz+V5IoHQyDp5ILsr3qeZ9bsZrstxiWG8MlwGstyQ9tEK
 Li2rQngeBQakQX7CS5cMa2SJyAp4HoGCh6lv3yOfjEM3hiBbDvi4xrg6GhaD0YBSazxx
 AwSTqAuYTqXc7Um/GGWnWZVqR4jL0RRP4g/cBPkY9eV+bU0FkK7UcihmZ8ApBEGqIzER
 hO+vQyxdi6LPubMxw83OWB3KSuLrMGzhmV+B8D93kjF8lBwXV8q9kaEGNbbGTwSAR1Eu
 Og/g==
X-Gm-Message-State: AOJu0YwxP8Kq7UvQkEWlFifvQZEkPNJy4aKUfRjQVLZrXLAHYJnFarmH
 W6QvA6u4E1Z8Uu3W4BqgQnyjWGqBIZ70bzQDfADVKy1CpU9p0saLNxlbOoIV
X-Google-Smtp-Source: AGHT+IFU7tVE/XXXTrc5LZRX/IiQlZOmDwPEE8/6MW+S0QW/xUdBPc4USVgUMK4dRABT72i5GqWK8w==
X-Received: by 2002:a5d:518e:0:b0:33b:697b:bcdc with SMTP id
 k14-20020a5d518e000000b0033b697bbcdcmr1684393wrv.23.1707600300455; 
 Sat, 10 Feb 2024 13:25:00 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ba23-20020a0560001c1700b0033946c0f9e7sm2728962wrb.17.2024.02.10.13.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Feb 2024 13:25:00 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Feb 2024 22:24:55 +0100
Message-ID: <62cf7f8a3ab7e42c2354cfa3881477d35ae5890d.1707600292.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707600292.git.yann.morin.1998@free.fr>
References: <cover.1707600292.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707600300; x=1708205100; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MffC1nSLpwfN8vnjRb3kM4TRXkoFI9hpi0sAxIYhlQw=;
 b=S1lTBJSuiZZOgtKFmolF2x9NTxOw8oLSelQ2JEXCwD+lrUgp++QXGDk28l2rvAqmCo
 nTVX+e90OadYnaWBb/zpUf3VD82gndnM73613u3deXyQucEhseJA5bRIE52pxWFNBNtI
 jBtMI/IKb+BYeJ9FKi8qlX/OwUdjRDzURpot39Rjzy09yea1y7vm9bKh5kPswVE+gHkv
 ncZDns6g2p1HGuptou27IBFcG/sOZTUfN5tkex/IF7KBdoh/9+HWDdCrSVJXe3wwCFbm
 +VyHJUzNWahKR7PkqPRrZyE+UBfgRYnXWQaywhnsTgbF8PSCTiw1rFPFo7mnbs+Co2sP
 DdOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S1lTBJSu
Subject: [Buildroot] [PATCH 2/6 v2] doc/manual: fixup ordered lists
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With recent asiidoc versions (at least 10.2.0 is known to report that),
rendering the manual yields a few warnings related to ordered lists:

    asciidoc: WARNING: customize-quick-guide.adoc: line 13: list item index: expected 2 got 1
    asciidoc: WARNING: customize-quick-guide.adoc: line 15: list item index: expected 3 got 1
    [...]
    asciidoc: WARNING: customize-quick-guide.adoc: line 65: list item index: expected 13 got 1
    asciidoc: WARNING: customize-quick-guide.adoc: line 66: list item index: expected 14 got 1
    asciidoc: WARNING: adding-packages-gettext.adoc: line 30: list item index: expected 2 got 1
    asciidoc: WARNING: adding-packages-gettext.adoc: line 41: list item index: expected 3 got 1

The reason is that we use the same index to tell asciidoc to
automatically number items.

However, the official way to provide an automatic index is to write no
index:

    https://docs.asciidoctor.org/asciidoc/latest/lists/ordered/

    [...] since the numbering is obvious, the AsciiDoc processor will
    insert the numbers for you if you omit them:
    [...]
    If you number the ordered list explicitly, you have to manually keep
    the list numerals sequential. Otherwise, you will get a warning.

So, abide by the documentation, and drop the repeating indices to
ordered lists where we want automatic numbering.

Note that there is another ordered list, in adding-packages-directory.adoc,
but it does use explicit, sequential numbering. For consistency within
the whole document, we also convert it.

To avoid extra useless churn, the indentation of the items is not
changed to match the elided indices.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-directory.adoc | 14 +++++------
 docs/manual/adding-packages-gettext.adoc   |  6 ++---
 docs/manual/customize-quick-guide.adoc     | 28 +++++++++++-----------
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index 03249ca06f..0b7221aae0 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -44,13 +44,13 @@ project after an empty line.
 As a convention specific to Buildroot, the ordering of the attributes
 is as follows:
 
-1. The type of option: +bool+, +string+... with the prompt
-2. If needed, the +default+ value(s)
-3. Any dependencies on the target in +depends on+ form
-4. Any dependencies on the toolchain in +depends on+ form
-5. Any dependencies on other packages in +depends on+ form
-6. Any dependency of the +select+ form
-7. The help keyword and help text.
+. The type of option: +bool+, +string+... with the prompt
+. If needed, the +default+ value(s)
+. Any dependencies on the target in +depends on+ form
+. Any dependencies on the toolchain in +depends on+ form
+. Any dependencies on other packages in +depends on+ form
+. Any dependency of the +select+ form
+. The help keyword and help text.
 
 You can add other sub-options into a +if BR2_PACKAGE_LIBFOO...endif+
 statement to configure particular things in your software. You can look at
diff --git a/docs/manual/adding-packages-gettext.adoc b/docs/manual/adding-packages-gettext.adoc
index e9c6968e79..739bed25d5 100644
--- a/docs/manual/adding-packages-gettext.adoc
+++ b/docs/manual/adding-packages-gettext.adoc
@@ -23,11 +23,11 @@ Due to this, and in order to make sure that Native Language Support is
 properly handled, packages in Buildroot that can use NLS support
 should:
 
-1. Ensure NLS support is enabled when +BR2_SYSTEM_ENABLE_NLS=y+. This
+. Ensure NLS support is enabled when +BR2_SYSTEM_ENABLE_NLS=y+. This
    is done automatically for 'autotools' packages and therefore should
    only be done for packages using other package infrastructures.
 
-1. Add +$(TARGET_NLS_DEPENDENCIES)+ to the package
+. Add +$(TARGET_NLS_DEPENDENCIES)+ to the package
    +<pkg>_DEPENDENCIES+ variable. This addition should be done
    unconditionally: the value of this variable is automatically
    adjusted by the core infrastructure to contain the relevant list of
@@ -38,7 +38,7 @@ should:
    also contains +gettext+ in order to get the full-blown 'gettext'
    implementation.
 
-1. If needed, add +$(TARGET_NLS_LIBS)+ to the linker flags, so that
+. If needed, add +$(TARGET_NLS_LIBS)+ to the linker flags, so that
    the package gets linked with +libintl+. This is generally not
    needed with 'autotools' packages as they usually detect
    automatically that they should link with +libintl+. However,
diff --git a/docs/manual/customize-quick-guide.adoc b/docs/manual/customize-quick-guide.adoc
index 627ecbacb1..315027c590 100644
--- a/docs/manual/customize-quick-guide.adoc
+++ b/docs/manual/customize-quick-guide.adoc
@@ -9,11 +9,11 @@ now summarize all this by providing step-by-step instructions to storing your
 project-specific customizations. Clearly, the steps that are not relevant to
 your project can be skipped.
 
-1. +make menuconfig+ to configure toolchain, packages and kernel.
-1. +make linux-menuconfig+ to update the kernel config, similar for
+. +make menuconfig+ to configure toolchain, packages and kernel.
+. +make linux-menuconfig+ to update the kernel config, similar for
    other configuration like busybox, uclibc, ...
-1. +mkdir -p board/<manufacturer>/<boardname>+
-1. Set the following options to +board/<manufacturer>/<boardname>/<package>.config+
+. +mkdir -p board/<manufacturer>/<boardname>+
+. Set the following options to +board/<manufacturer>/<boardname>/<package>.config+
    (as far as they are relevant):
    * +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+
    * +BR2_PACKAGE_BUSYBOX_CONFIG+
@@ -21,7 +21,7 @@ your project can be skipped.
    * +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+
    * +BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE+
    * +BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE+
-1. Write the configuration files:
+. Write the configuration files:
    * +make linux-update-defconfig+
    * +make busybox-update-config+
    * +make uclibc-update-config+
@@ -29,38 +29,38 @@ your project can be skipped.
      board/<manufacturer>/<boardname>/at91bootstrap3.config+
    * +make barebox-update-defconfig+
    * +make uboot-update-defconfig+
-1. Create +board/<manufacturer>/<boardname>/rootfs-overlay/+ and fill it
+. Create +board/<manufacturer>/<boardname>/rootfs-overlay/+ and fill it
    with additional files you need on your rootfs, e.g.
    +board/<manufacturer>/<boardname>/rootfs-overlay/etc/inittab+.
    Set +BR2_ROOTFS_OVERLAY+
    to +board/<manufacturer>/<boardname>/rootfs-overlay+.
-1. Create a post-build script
+. Create a post-build script
    +board/<manufacturer>/<boardname>/post_build.sh+. Set
    +BR2_ROOTFS_POST_BUILD_SCRIPT+ to
    +board/<manufacturer>/<boardname>/post_build.sh+
-1. If additional setuid permissions have to be set or device nodes have
+. If additional setuid permissions have to be set or device nodes have
    to be created, create +board/<manufacturer>/<boardname>/device_table.txt+
    and add that path to +BR2_ROOTFS_DEVICE_TABLE+.
-1. If additional user accounts have to be created, create
+. If additional user accounts have to be created, create
    +board/<manufacturer>/<boardname>/users_table.txt+ and add that path
    to +BR2_ROOTFS_USERS_TABLES+.
-1. To add custom patches to certain packages, set +BR2_GLOBAL_PATCH_DIR+
+. To add custom patches to certain packages, set +BR2_GLOBAL_PATCH_DIR+
    to +board/<manufacturer>/<boardname>/patches/+ and add your patches
    for each package in a subdirectory named after the package. Each
    patch should be called +<packagename>-<num>-<description>.patch+.
-1. Specifically for the Linux kernel, there also exists the option
+. Specifically for the Linux kernel, there also exists the option
    +BR2_LINUX_KERNEL_PATCH+ with as main advantage that it can also
    download patches from a URL. If you do not need this,
    +BR2_GLOBAL_PATCH_DIR+ is preferred. U-Boot, Barebox, at91bootstrap
    and at91bootstrap3 also have separate options, but these do not
    provide any advantage over +BR2_GLOBAL_PATCH_DIR+ and will likely be
    removed in the future.
-1. If you need to add project-specific packages, create
+. If you need to add project-specific packages, create
    +package/<manufacturer>/+ and place your packages in that
    directory. Create an overall +<manufacturer>.mk+ file that
    includes the +.mk+ files of all your packages. Create an overall
    +Config.in+ file that sources the +Config.in+ files of all your
    packages. Include this +Config.in+ file from Buildroot's
    +package/Config.in+ file.
-1. +make savedefconfig+ to save the buildroot configuration.
-1. +cp defconfig configs/<boardname>_defconfig+
+. +make savedefconfig+ to save the buildroot configuration.
+. +cp defconfig configs/<boardname>_defconfig+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
