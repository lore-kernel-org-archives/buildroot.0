Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E8BCCF2CC
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 17:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A22660656;
	Sun, 18 Oct 2026 17:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myJwd61m_TXD; Sun, 18 Oct 2026 17:48:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2C93D6062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792345710;
	b=mYhMzRLh3ExQ4eGaHv2VnfJK8hyl6jriUAolWYPhmVxjGSSy0mJysOhwHPZ05HWZaPqg
	 BL2XQxF26qYfGbRUp0175XDNfcsdKLHaV7kRH4CZWeGXRlsdHGQ+Y64B0EqyYx/HGQUhN
	 GXibTb2JD0kkkhmBLVyzGhiS5JDZEsbG9c+g1sJ4lYIAdiJ/NXxmlssXf9oggsC3ilRxv
	 gs9vI/DJqheDJkhD1NMIp4eW7D55GtrJXtyfeMPr3elZvDfK9vgxkpqvpV1xw988aJOIF
	 AOzjSQ1aE/JIsfkbwBQyQA1lep4e8lJIEvdnF+1DBbOHxgrozuH2MqwkwSq/xDbWCiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792345710;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ABtFaN8eXM6oyJ+M5+ypGK4R9Q14m3yAjv0fnZuDHyI=;
	b=JP9oZWYZBG9nuvD5041baR6E6p8nuMAJo1xOKkxebeVy5nnnXvpZ7OWItd/Yzkf3kMmf
	 oQnwwyQvn4dGkjjUAL6nAKHzYxDQumIZCyBn35S/Gfai0Ee/jtBuN3HM71AAsq604kFQO
	 cAzf8DN4Mr5RwXO60eevaXkxIBknHDfGDkW1e3HVx8lHCNAmU+n28MopFnFDSPCEnpndB
	 gCgJYNBUx+bA9veK4CTM+jf7QVtXqU7czNti8bppSuNddUJv8+9VkreJ1xhN1M89Wf/M7
	 h9s5OEOAeO3ugaNcbyPZr2fzfBuUpPaBVvxLZfVjmJQtl7FK6ovNyxyHBHgb2IUNOCQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792345710;
	bh=ABtFaN8eXM6oyJ+M5+ypGK4R9Q14m3yAjv0fnZuDHyI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iGE71eIWPeP/9ec43ei9fW4ibKpBY5JK/L3y2OU+7mI199IuZKc7Mdhnpp69kf/sK
	 rQWWvXZIakW8RyNLa/GiXWGxknPBTrLj3Vybd6sfOtEv47/u98fs4Pb8QfvUMU+2wX
	 Joj2+NI40IfVgdewoB0y2qkwjdiBA9u8oJrdsrvy3bM24i8HQHF2DCbRog25dyQdAD
	 xCNR07OQYdQNEBPrYLhIH5IFxS0WPoVIDtiFsFvtmcKBGAq2PdDFKHywTRxp8QMljb
	 vSsi9rE4iXfJPHOm0tjqCLnh5KIpZOtp/zxHArha89tQN+sjYfj3d2IfA4LC5aJjdh
	 cBZvjPcWo9WVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C93D6062C;
	Sun, 18 Oct 2026 17:48:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D64F79D
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 17:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F5E880F90
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 17:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKnkiy3zcndM for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 17:48:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 52EA280F8B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792345706;
 b=Ms1cOeFopc1acQGAPn+cLfx8D/MuOA+H+j/itnXM6oZQHbrhxSexZnAvNDLR5yOG1wPb
 d+p3JriY3OGq/naswBYw0lv6evn6Rt0oMH4f47fjZzxqQZpgpIchP7Gn1rMwtTovqfdzB
 /vAaHI9GreTVw4Vr9LUUsEeV2T23XTIvLj31MJKQxuVUYiQUB0c+s0UEYfD/SyA72SLKg
 9hJAQicqag3tM3OfuTjeE1ncECw7Qcf3E04NAvj/W8o3BYzNxh9nHXcBz3lVJHiQ25+od
 JrndvJ/O1aFvid8tu7LyAyxdRkVjbzStiLYHbP9nCFYjlMjZt9OxM1NDTVUsB94pE4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792345706;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Dl7ZocB7T9yDUXuWf95hqiPLHxJGaEZwtUKkfKVuN74=;
 b=als6LPTMV7XUbuPRPPPm74AgB7Hkdf+YWoiuDWnfKU/KcZp4qksSeL8yVZQmcBnB+BTH
 Tvxvg6/qUc+Q7OIMhvtzvMa/5PQzaaTc7ZD8Iv87zaBmrDQvEeNCjoR0iHojSajUfbRpR
 yCNom8sRwTMa/D0Y19BPLseX/nvR1R1wu6utKTzbEtOfBCbGGnAJkcPqMtcp47B9tJTmi
 1+4mOJYUSyqruN3PA2hS2GhPidntv39XGRg2d8JFir411Exm6Nb9zeB0SiGOn98DrjgoO
 uxdwLg2mkTWEquD9fm6rBFwo/dy47YRqzr1k6D1T+wSfuJE1uKyYH9RwTusktZg2bqQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52EA280F8B
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 17:48:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 114E99838E; Sun, 18 Oct 2026 17:47:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 17:53:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 279f4b62379b280782fb56cc88ef53f8ca384ae5
X-Git-Newrev: 5ff10177c49d18878e44a1d8ab33e24d1e72ba50
X-Patchwork-Hint: ignore
Message-Id: <20261018174704.114E99838E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_am62ax_sk: bump tfa,
 linux and uboot versions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4851183523928314921=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4851183523928314921==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5ff10177c49d18878e44a1d8ab33e24d1e72ba50
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump the am62ax-sk reference board to use the latest stable tfa, uboot
and linux kernel releases to pull in the latest bug fixes and features.

Because swig 4.5.0 removes support for Python 2 compatibility we need to
backport a patch for U-Boot to remove the Python 2 macros it uses to
generate the final fimrware images.

Signed-off-by: Bryan Brattlof <bb@ti.com>
[Julien:
 - add "Upstream:" and "Signed-off-by:" tags in patches
 - add link to upstream hash source in linux.hash
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +-
 board/ti/am62ax-sk/patches/linux/linux.hash        |  4 +-
 ...place-removed-SWIG-Python-2-compatibility.patch | 67 ++++++++++++++++++++++
 ...place-removed-SWIG-Python-2-compatibility.patch | 67 ++++++++++++++++++++++
 board/ti/am62ax-sk/patches/uboot/uboot.hash        |  2 +-
 configs/ti_am62ax_sk_defconfig                     |  8 +--
 6 files changed, 142 insertions(+), 8 deletions(-)

diff --git a/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 8b77e1f165..2e24bcd0de 100644
--- a/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
+sha256  b807d8bf190b7c46b4260729b4bbe2f7df83cd1086edcb181d66595ae6598d23  arm-trusted-firmware-v2.15.0-git4.tar.gz
diff --git a/board/ti/am62ax-sk/patches/linux/linux.hash b/board/ti/am62ax-sk/patches/linux/linux.hash
index 53eb143894..49bf75b924 100644
--- a/board/ti/am62ax-sk/patches/linux/linux.hash
+++ b/board/ti/am62ax-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  774698422ee54c5f1e704456f37c65c06b51b4e9a8b0866f34580d86fef8e226  linux-6.10.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  2feaa70453e91f541be6a5c9078d8168e081af45a3d9718054850538cff2ebf3  linux-7.2.10.tar.xz
diff --git a/board/ti/am62ax-sk/patches/ti-k3-r5-loader/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch b/board/ti/am62ax-sk/patches/ti-k3-r5-loader/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
new file mode 100644
index 0000000000..10968ce876
--- /dev/null
+++ b/board/ti/am62ax-sk/patches/ti-k3-r5-loader/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
@@ -0,0 +1,67 @@
+From 527115ef6783cec49e5610c523c124b399011361 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Tue, 11 Aug 2026 15:34:33 +0200
+Subject: [PATCH] pylibfdt: Replace removed SWIG Python 2 compatibility macros
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
+from its runtime header pyhead.swg (see commit 79f7a2b7cb7d). Replace
+them with their Python 3 C API equivalents:
+
+- PyString_FromString -> PyUnicode_FromString
+- PyString_AsString -> PyBytes_AsString
+- PyInt_AsLong -> PyLong_AsLong
+
+The replacements are safe since the macros were already aliased to
+these exact functions in SWIG's Python 3 code path.
+
+This is a backport of dtc commit 5008d1d6a356 ("pylibfdt: Replace
+removed SWIG Python 2 compatibility macros").
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Reviewed-by: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+Tested-by: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
+Reviewed-by: Peter Robinson <pbrobinson@gmail.com>
+Upstream: https://git.u-boot-project.org/u-boot/u-boot/-/commit/527115ef6783cec49e5610c523c124b399011361
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ scripts/dtc/pylibfdt/libfdt.i_shipped | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/scripts/dtc/pylibfdt/libfdt.i_shipped b/scripts/dtc/pylibfdt/libfdt.i_shipped
+index e4659489a96ab..326a15c7941e3 100644
+--- a/scripts/dtc/pylibfdt/libfdt.i_shipped
++++ b/scripts/dtc/pylibfdt/libfdt.i_shipped
+@@ -1033,7 +1033,7 @@ typedef uint32_t fdt32_t;
+ 	PyObject *buff;
+ 
+ 	if ($1) {
+-		resultobj = PyString_FromString(
++		resultobj = PyUnicode_FromString(
+ 			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
+ 		buff = PyByteArray_FromStringAndSize(
+ 			(const char *)($1 + 1), fdt32_to_cpu($1->len));
+@@ -1064,13 +1064,13 @@ typedef uint32_t fdt32_t;
+         }
+         $1 = PyBytes_AsString($input);
+     %#else
+-        $1 = PyString_AsString($input);   /* char *str */
++        $1 = PyBytes_AsString($input);   /* char *str */
+     %#endif
+ }
+ 
+ /* typemaps used for fdt_next_node() */
+ %typemap(in, numinputs=1) int *depth (int depth) {
+-   depth = (int) PyInt_AsLong($input);
++   depth = (int) PyLong_AsLong($input);
+    $1 = &depth;
+ }
+ 
+
+base-commit: 1262e50a34a0e01f974e8d909c5b255f8fa7199e
+-- 
+2.55.0
+
diff --git a/board/ti/am62ax-sk/patches/uboot/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch b/board/ti/am62ax-sk/patches/uboot/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
new file mode 100644
index 0000000000..10968ce876
--- /dev/null
+++ b/board/ti/am62ax-sk/patches/uboot/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
@@ -0,0 +1,67 @@
+From 527115ef6783cec49e5610c523c124b399011361 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Tue, 11 Aug 2026 15:34:33 +0200
+Subject: [PATCH] pylibfdt: Replace removed SWIG Python 2 compatibility macros
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
+from its runtime header pyhead.swg (see commit 79f7a2b7cb7d). Replace
+them with their Python 3 C API equivalents:
+
+- PyString_FromString -> PyUnicode_FromString
+- PyString_AsString -> PyBytes_AsString
+- PyInt_AsLong -> PyLong_AsLong
+
+The replacements are safe since the macros were already aliased to
+these exact functions in SWIG's Python 3 code path.
+
+This is a backport of dtc commit 5008d1d6a356 ("pylibfdt: Replace
+removed SWIG Python 2 compatibility macros").
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Reviewed-by: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+Tested-by: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
+Reviewed-by: Peter Robinson <pbrobinson@gmail.com>
+Upstream: https://git.u-boot-project.org/u-boot/u-boot/-/commit/527115ef6783cec49e5610c523c124b399011361
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ scripts/dtc/pylibfdt/libfdt.i_shipped | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/scripts/dtc/pylibfdt/libfdt.i_shipped b/scripts/dtc/pylibfdt/libfdt.i_shipped
+index e4659489a96ab..326a15c7941e3 100644
+--- a/scripts/dtc/pylibfdt/libfdt.i_shipped
++++ b/scripts/dtc/pylibfdt/libfdt.i_shipped
+@@ -1033,7 +1033,7 @@ typedef uint32_t fdt32_t;
+ 	PyObject *buff;
+ 
+ 	if ($1) {
+-		resultobj = PyString_FromString(
++		resultobj = PyUnicode_FromString(
+ 			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
+ 		buff = PyByteArray_FromStringAndSize(
+ 			(const char *)($1 + 1), fdt32_to_cpu($1->len));
+@@ -1064,13 +1064,13 @@ typedef uint32_t fdt32_t;
+         }
+         $1 = PyBytes_AsString($input);
+     %#else
+-        $1 = PyString_AsString($input);   /* char *str */
++        $1 = PyBytes_AsString($input);   /* char *str */
+     %#endif
+ }
+ 
+ /* typemaps used for fdt_next_node() */
+ %typemap(in, numinputs=1) int *depth (int depth) {
+-   depth = (int) PyInt_AsLong($input);
++   depth = (int) PyLong_AsLong($input);
+    $1 = &depth;
+ }
+ 
+
+base-commit: 1262e50a34a0e01f974e8d909c5b255f8fa7199e
+-- 
+2.55.0
+
diff --git a/board/ti/am62ax-sk/patches/uboot/uboot.hash b/board/ti/am62ax-sk/patches/uboot/uboot.hash
index fe9b4f53dc..ff6e4ed2e2 100644
--- a/board/ti/am62ax-sk/patches/uboot/uboot.hash
+++ b/board/ti/am62ax-sk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/configs/ti_am62ax_sk_defconfig b/configs/ti_am62ax_sk_defconfig
index da60d93435..a4c35a106e 100644
--- a/configs/ti_am62ax_sk_defconfig
+++ b/configs/ti_am62ax_sk_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am62a7-sk.dtb -l am62
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62ax-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="7.2.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/ti/am62ax-sk/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.15.0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
@@ -28,12 +28,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62ax_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62ax_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

--===============4851183523928314921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4851183523928314921==--
