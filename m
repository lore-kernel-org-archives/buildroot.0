Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5622C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 21:01:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1216761073
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 21:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1216761073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5340400EE;
	Mon, 25 Oct 2021 21:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dnef-2Sw-1xh; Mon, 25 Oct 2021 21:01:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52E97403E0;
	Mon, 25 Oct 2021 21:01:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0FB51BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 21:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8F8580F7D
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 21:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLxM_XQtTbXY for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 21:01:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A14280F54
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 21:01:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4B6D388C7B; Mon, 25 Oct 2021 20:58:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 23:01:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5951883cf9b1fd899d6b6a42efcafccb592042ea
X-Git-Newrev: 255acdc143658aa637ce75f657b3bebee1d58c95
X-Patchwork-Hint: ignore
Message-Id: <20211025205824.4B6D388C7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: needs gcc >= 8
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

commit: https://git.buildroot.net/buildroot/commit/?id=255acdc143658aa637ce75f657b3bebee1d58c95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qemu now requires gcc >= 7.5, which was the last release in the 7.x
series. We do not have symbols for a gcc dot-version dependency, nor do
we want to add one.

So, add a dependency on gcc >= 8, for both the host and target variants.

In addition:
  - Add a missing comment in package/qemu/Config.in.host explaining the
    host gcc requirements if host gcc < 8.

Fixes:
    http://autobuild.buildroot.org/results/32b7fee1f8cda2290fd4bd8ac9fe78bacb25b652

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[yann.morin.1998@free.fr:
  - target qemu also impacted
  - propagate to libvirt, gst1-python
  - reword commit log that 7.5 is the last 7.x release
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gobject-introspection/Config.in  | 6 +++---
 package/gstreamer1/gst1-python/Config.in | 5 +++--
 package/libvirt/Config.in                | 6 ++++++
 package/nodejs/Config.in                 | 6 +++---
 package/python-bluezero/Config.in        | 6 +++---
 package/python-gobject/Config.in         | 6 +++---
 package/qemu/Config.in                   | 6 +++---
 package/qemu/Config.in.host              | 7 ++++++-
 8 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index c631c84755..42250eb776 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	# compile errors with locale.c. As such, require 4.9 until this
 	# can be verified.
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	depends on BR2_HOST_GCC_AT_LEAST_7 # host-qemu
+	depends on BR2_HOST_GCC_AT_LEAST_8 # host-qemu
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	# gobject-introspection does not require python3 to run on the
 	# target; however, because the tools run in a qemu wrapper, a
@@ -42,9 +42,9 @@ comment "gobject-introspection needs python3"
 	depends on !BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 
-comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
+comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_7
+		!BR2_HOST_GCC_AT_LEAST_8
diff --git a/package/gstreamer1/gst1-python/Config.in b/package/gstreamer1/gst1-python/Config.in
index 2f34984020..d2671266a0 100644
--- a/package/gstreamer1/gst1-python/Config.in
+++ b/package/gstreamer1/gst1-python/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GST1_PYTHON
 	bool "gst1-python"
 	depends on BR2_USE_MMU # libglib2, gobject-introspection
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
+	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
 	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
 	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
@@ -18,8 +19,8 @@ config BR2_PACKAGE_GST1_PYTHON
 comment "gst1-python needs python3"
 	depends on !BR2_PACKAGE_PYTHON3
 
-comment "gst1-python needs a glibc toolchain, gcc >= 4.9"
+comment "gst1-python needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_HOST_GCC_AT_LEAST_8
diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 8c3021242a..5693ecb4cc 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -65,6 +65,7 @@ config BR2_PACKAGE_LIBVIRT_QEMU
 	bool "qemu"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
 	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # qemu
 	select BR2_PACKAGE_HWDATA         # libpciaccess
 	select BR2_PACKAGE_HWDATA_PCI_IDS # libpciaccess
 	select BR2_PACKAGE_LIBSECCOMP
@@ -74,6 +75,11 @@ config BR2_PACKAGE_LIBVIRT_QEMU
 	help
 	  QEMU/KVM support
 
+comment "qemu needs a toolchain with gcc >= 8"
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
 config BR2_PACKAGE_LIBVIRT_LXC
 	bool "lxc"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # lxc
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 771f735e97..99c76bc3de 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -8,18 +8,18 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 
-comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 7, wchar"
+comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 7, wchar, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_HOST_GCC_AT_LEAST_7 || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR
+		!BR2_HOST_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_NODEJS
 	bool "nodejs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_7
+	depends on BR2_HOST_GCC_AT_LEAST_8 # qemu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_USE_WCHAR
 	# uses fork()
diff --git a/package/python-bluezero/Config.in b/package/python-bluezero/Config.in
index 3d40b1e275..d617b96d67 100644
--- a/package/python-bluezero/Config.in
+++ b/package/python-bluezero/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PYTHON_BLUEZERO
 	bool "python-bluezero"
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # python-gobject -> gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject -> gobject-introspection
-	depends on BR2_HOST_GCC_AT_LEAST_7 # python-gobject -> gobject-introspection -> host-qemu
+	depends on BR2_HOST_GCC_AT_LEAST_8 # python-gobject -> gobject-introspection -> host-qemu
 	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject -> gobject-introspection
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_DBUS # runtime
@@ -13,9 +13,9 @@ config BR2_PACKAGE_PYTHON_BLUEZERO
 
 	  https://github.com/ukBaz/python-bluezero
 
-comment "python-bluezero needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
+comment "python-bluezero needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_7
+		!BR2_HOST_GCC_AT_LEAST_8
diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
index 910f990026..efc781a1ff 100644
--- a/package/python-gobject/Config.in
+++ b/package/python-gobject/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 	depends on BR2_USE_MMU # libglib2, gobject-introspection
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
-	depends on BR2_HOST_GCC_AT_LEAST_7 # gobject-introspection -> host-qemu
+	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
 	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
 	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
 	select BR2_PACKAGE_GOBJECT_INTROSPECTION
@@ -13,9 +13,9 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 
 	  https://wiki.gnome.org/action/show/Projects/PyGObject
 
-comment "python-gobject needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
+comment "python-gobject needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_7
+		!BR2_HOST_GCC_AT_LEAST_8
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 763550dbd6..7bb203a177 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -5,16 +5,16 @@ config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 		|| BR2_x86_64 || BR2_arm \
 		|| BR2_powerpc64 || BR2_powerpc64le
 
-comment "QEMU requires a toolchain with wchar, threads, gcc >= 7"
+comment "QEMU requires a toolchain with wchar, threads, gcc >= 8"
 	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	depends on BR2_USE_MMU
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR) || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_QEMU
 	bool "QEMU"
 	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_USE_MMU # fork()
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index a5b38c081b..df5d921125 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -37,7 +37,7 @@ config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 config BR2_PACKAGE_HOST_QEMU
 	bool "host qemu"
 	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_7
+	depends on BR2_HOST_GCC_AT_LEAST_8
 	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE \
 		if !BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE && BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	select BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE \
@@ -50,6 +50,11 @@ config BR2_PACKAGE_HOST_QEMU
 
 	  http://www.qemu.org
 
+comment "host-qemu needs a host gcc >= 8"
+	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || \
+		BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORT
+	depends on !BR2_HOST_GCC_AT_LEAST_8
+
 if BR2_PACKAGE_HOST_QEMU
 
 comment "Emulators selection"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
