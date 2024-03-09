Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C353BC54E41
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 13:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 195B58200D;
	Sat,  9 Mar 2024 13:38:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A-ztj86CB7r4; Sat,  9 Mar 2024 13:38:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5A9382043
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5A9382043;
	Sat,  9 Mar 2024 13:38:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B26B1BF300
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 13:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57D186065C
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 13:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-FLofZYy26Z for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 13:38:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57E5960744
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57E5960744
 for <buildroot@buildroot.org>; Sat,  9 Mar 2024 13:38:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0323988138; Sat,  9 Mar 2024 13:38:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Mar 2024 14:36:53 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: fdd561b1c21b5b0e0c02395a44ec14985cbe3382
X-Git-Newrev: 0a4d96a5a67a65675b530de156d8c01515360487
X-Patchwork-Hint: ignore
Message-Id: <20240309133828.0323988138@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] doc/manual: fixup ordered
 lists
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0a4d96a5a67a65675b530de156d8c01515360487
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1c24d83cc80c25f60fe7974495a43b5cc34b72f5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.txt | 14 +++++++-------
 docs/manual/adding-packages-gettext.txt   |  6 +++---
 docs/manual/customize-quick-guide.txt     | 28 ++++++++++++++--------------
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 5a0f298eb1..b7519cc01a 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
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
diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.txt
index e9c6968e79..739bed25d5 100644
--- a/docs/manual/adding-packages-gettext.txt
+++ b/docs/manual/adding-packages-gettext.txt
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
diff --git a/docs/manual/customize-quick-guide.txt b/docs/manual/customize-quick-guide.txt
index 627ecbacb1..315027c590 100644
--- a/docs/manual/customize-quick-guide.txt
+++ b/docs/manual/customize-quick-guide.txt
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
