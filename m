Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEE1C46CCD
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 16:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31DAA41759;
	Sat, 16 Dec 2023 16:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31DAA41759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tFmYAlHXiFnX; Sat, 16 Dec 2023 16:10:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4214B41774;
	Sat, 16 Dec 2023 16:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4214B41774
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 345761BF28A
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BE4F40156
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BE4F40156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OGqpWGvVTIMe for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 16:10:05 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E60E400B8
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 16:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E60E400B8
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c3ceded81so15797385e9.1
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 08:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702743003; x=1703347803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5abAecsMtmH6leQkrJ9rlv3NPsAJ2jMe0Jel79m9Uiw=;
 b=pj8bWuRM+CbJeBcnL6vj6HSl3y9HAecyHfR3vlWnLmIPv4XZTmyvDrOGkic8zUzLPR
 isOONy+5C9dLFe0iTe35bIog1tf32h6xilllRNn8nL9x0Ix/DYD4/xzq/5+3EQq2tTpl
 7IgwWo1SosNyJDfNnFR7dYxOu1ShVFfm4gXqpiRMu7oxm7HeA9OvnlKCJw23k73QEREC
 BwpuT9S6NIUN39MLxkhZQAy7NzA35KRaCbbim4O2T9uANniCS+HK0SZvCJMPLRW/stwb
 Bh0ncZERHovQ61dbZieAvx3EM5fLiU0guhCqd4VF6D0NldTfxgicBqfq2NGRfb0yUWrX
 xsAg==
X-Gm-Message-State: AOJu0Yxmow6/p7vGaGLJ6eT1tNhRXFyvbP6Z6sUhcgz0H4UJ7goD8uz7
 6SwzkMSWpkA9rXulBazGDeAlQSFCnH4=
X-Google-Smtp-Source: AGHT+IGEo24YVF87IAik2phkwUH6EluS1nkjY5fI0ezxrD65hMoB3cPRA38noECs01g2hQd4SB3Z/A==
X-Received: by 2002:a05:600c:5022:b0:40c:3e95:f658 with SMTP id
 n34-20020a05600c502200b0040c3e95f658mr6322770wmr.69.1702743002897; 
 Sat, 16 Dec 2023 08:10:02 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:4f89:5708:1633:580e])
 by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b0040b45356b72sm36319926wms.33.2023.12.16.08.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 08:10:02 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Dec 2023 17:09:54 +0100
Message-ID: <eb0226a2aa30a44696ed763382f0d65b0345eb9a.1702742998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1702742998.git.yann.morin.1998@free.fr>
References: <cover.1702742998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702743003; x=1703347803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5abAecsMtmH6leQkrJ9rlv3NPsAJ2jMe0Jel79m9Uiw=;
 b=jGiT349ybaIjkRDHDKVhcwXMAVpZvntbXIwI2l900L3QmPFz2/Lc8Xjn41XsUO6Rbe
 S83EJjudbSUjjc3J1ZhnIQcIw9l/Ruk/pcG0lex+9y4NVsGg4b1sJcvpjHu0lnKSou8J
 nDgKqfnEZJFAhyPnEuA298gdPLwWLBSnaqqb4FZCY5PPJxM5oOMQMkWh8tLA4ieXi/t5
 mNqbWa3Q/iKsBRr4CoqzlmrlQ1rG50/FVH4TAtTfUSvb2jBgQspkoyHsaHymY0Ow9h10
 GEC9GWvpvSD6b5dxps8lKlAk0ZEVpgATXIKba8F5EzLztXqfhySQhSTL0Tu5jWGwhOhJ
 njLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jGiT349y
Subject: [Buildroot] [PATCH 1/9] doc/manual: fixup ordered lists
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent asiidoc versions (at least 10.2.0 is known to report that),
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

To avoid extra useless churn, the idnentation of the items is not
changed to match the elided indices.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-directory.adoc | 14 +++++------
 docs/manual/adding-packages-gettext.adoc   |  6 ++---
 docs/manual/customize-quick-guide.adoc     | 28 +++++++++++-----------
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index 5a0f298eb1..b7519cc01a 100644
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
