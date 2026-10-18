Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70325CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 17:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DAD8406EC;
	Sun, 18 Oct 2026 17:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymcwMik4xSmm; Sun, 18 Oct 2026 17:48:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0129C406ED
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792345709;
	b=fGm3OOt2yIDSZ+kq5jNwPyhcpTJR/bhlePxUpJKFot+u07u6k02XCcB0+OkDiOvO0RQe
	 bZiVAU8SJYW2HA32eVjhr80QUlFCtauTcH9vxc1jdG8T4On1X5Zu2Dfqk4+0EJSvjd69+
	 OdTCWv7p5zujjMh/H2wJp2Vuavx739/gjdIP/QkmQ4ZMW6/GODnIGIOsNui5kBVZbTm2l
	 C75vlU2/SEosOIy3fs/Q3U9s9HGvTHuMUX0HFugEnM5rB1+7AulOnSE4shTt9FMBh/RsE
	 iCt8BdHP98H/m3dyEkOvd9CT7XUDUvkoQvyOWRhJSxqKjAmZ2uCMEHn/74WHtzGnW5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792345709;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=26GY7z76GqxPbkC5vfJMcUl45VjqAHiiWn8lMbXIyrI=;
	b=AfYUSVDnKgDVz2/FjeA2rO8TXbcA9dLlBd0eF2Mh7g9IsSDVA/9sjssyloWb64FKdf6e
	 AzUezIPgxa84D3SMvzOC1bIesJcCuYT8jG5tyTaE39qS+It7lzdMUiLWI/CZ3KZmncRx7
	 mILM4tFFSCfZ0f7uPO6TS/6Rnqg5XTKZU1s19Y1UFo2LOcIM5cOGbwlPWqn0GdRS4zSAy
	 MO5IWpU94+4A963MSmnWdYGBIzS/u1JMt/uVmMfte7AXMfY2gif63jUUnG7KFfuEtu3SH
	 V+e8QoW1pCV79z7X73e3iwwWEKEXTsito9shc7+DIKD2WWvIU8FKbFrsq46ufrm/j6Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792345709;
	bh=26GY7z76GqxPbkC5vfJMcUl45VjqAHiiWn8lMbXIyrI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pu6DequJ5408+VCL8njpFM9tU8ix/thcVOXq+avn6L0vn907W4kOv8uq3uE406YD3
	 s24Rfwo/rNOzSdBgv7Gf7ZpCgAHm/3lRn84fxcak87qfMME/7zGut+5V8OmlER6PZm
	 eYe3BvFmMX1pxqP7CW0ko3sYqcKi8XDw3PtXomes1aTGQ5zewGJ1rBach+2xFoRYO8
	 oBnk87zFPZO/dWSDaP3F52ICIfnI1ZeCIAUXohqvhJiQUx8+Oybw96AaEbSaREZ6ue
	 RaLgYsphH/jqOgiMoldJumCPqMMvTLHE8Puz2mUHwWrl+RPKLbjIrX8i4+bOnlxz6W
	 rL2puKlRCnpJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0129C406ED;
	Sun, 18 Oct 2026 17:48:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 976E7769
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 17:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9560580F8B
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 17:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdwAZtGBBKE5 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 17:48:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6358180F8C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792345706;
 b=l932P0y3ooNjJbKciT6O/XkVX52AMu4O6O+J3pC8EMi2MSqC0rz5FRlK/zUipDMOrSkW
 yWx9l0kN66ngac7b81f91MXo0wfy4KslohBFUvOUlzin8Y60bZA/GU87V3KVTNneDsCXO
 4iT2Szz7V+uuxCWh1ms1L9Oi+lRiRVmr7+viR28qVY/PT1pcR3WLtup7HplXfPkb/vv+u
 X15frXiagp+kssSgQZ0b1iRGZBkJpcthLOvDo2FoGAmNxn8eqd65mgC5EzgCJVb0CaDGY
 RwKh3mQb8yX6a8l06kRckOsjfcd9R36fyJvPdxkdpgEGDlC5xcJoJZcNU0pkdARcBgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792345706;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pR6cVbOXMKqrp6LWuH1Vl1AO0NoiQUwLZ44jJqrylaw=;
 b=c7ztjx2GEzZh4LJOsMiKdT3ozHSlUOsvN5FuLrjp3YUKTtrZgdnKs+xM5wqhQbu2LlyL
 SW5EI2SoUWXI0mCKyhvmHgPJJkfnhO7Pxf49U8mLNwYzT7JWNZDGHem0G1PgzCbTYflq3
 LD5KPdmTpdea3r/f0kI/zDjowwqoE4oZc/M50oLkIemPuPq03CiQRP/NQfdSSnJNR59cg
 wdPy6o4mHc3UKoy+AUF/ujnEvTb56OUuTnzY+by/VRCXF+jrxnWXvQ/IBMXjqchRAoP9I
 5SxmbU5lGyZcZ7p8C8J2ku5aX8v4q3wfZ4JgMPtZb8KIEq4NSTW0G+XtI3glRg9zGGw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6358180F8C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 17:48:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 349DF98391; Sun, 18 Oct 2026 17:47:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 17:53:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c238cc25dcd1cd77c36bfaf09e89b7c1b24a08c6
X-Git-Newrev: 0b0a04bdca525e91e694b74fcbb72b662f085ad1
X-Patchwork-Hint: ignore
Message-Id: <20261018174704.349DF98391@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beagleplay: bump tfa,
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
Content-Type: multipart/mixed; boundary="===============0669987838276774455=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0669987838276774455==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0b0a04bdca525e91e694b74fcbb72b662f085ad1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump the beagleplay to use the latest stable tfa, uboot and linux kernel
releases to pull in the latest bug fixes and features.

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
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +
 .../beagleplay/patches/linux/linux.hash            |  4 +-
 ...place-removed-SWIG-Python-2-compatibility.patch | 67 ++++++++++++++++++++++
 ...place-removed-SWIG-Python-2-compatibility.patch | 67 ++++++++++++++++++++++
 .../beagleplay/patches/uboot/uboot.hash            |  2 +-
 configs/beagleplay_defconfig                       |  9 +--
 6 files changed, 144 insertions(+), 7 deletions(-)

diff --git a/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..2e24bcd0de
--- /dev/null
+++ b/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b807d8bf190b7c46b4260729b4bbe2f7df83cd1086edcb181d66595ae6598d23  arm-trusted-firmware-v2.15.0-git4.tar.gz
diff --git a/board/beagleboard/beagleplay/patches/linux/linux.hash b/board/beagleboard/beagleplay/patches/linux/linux.hash
index eb4dcee958..49bf75b924 100644
--- a/board/beagleboard/beagleplay/patches/linux/linux.hash
+++ b/board/beagleboard/beagleplay/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4f21c01f4d04c1d1b3ed794153f8900802c92497be620b07c4869530f2d28ee3  linux-6.18.16.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  2feaa70453e91f541be6a5c9078d8168e081af45a3d9718054850538cff2ebf3  linux-7.2.10.tar.xz
diff --git a/board/beagleboard/beagleplay/patches/ti-k3-r5-loader/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch b/board/beagleboard/beagleplay/patches/ti-k3-r5-loader/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
new file mode 100644
index 0000000000..10968ce876
--- /dev/null
+++ b/board/beagleboard/beagleplay/patches/ti-k3-r5-loader/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
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
diff --git a/board/beagleboard/beagleplay/patches/uboot/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch b/board/beagleboard/beagleplay/patches/uboot/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
new file mode 100644
index 0000000000..10968ce876
--- /dev/null
+++ b/board/beagleboard/beagleplay/patches/uboot/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
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
diff --git a/board/beagleboard/beagleplay/patches/uboot/uboot.hash b/board/beagleboard/beagleplay/patches/uboot/uboot.hash
index b6a925ea4e..ff6e4ed2e2 100644
--- a/board/beagleboard/beagleplay/patches/uboot/uboot.hash
+++ b/board/beagleboard/beagleplay/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/configs/beagleplay_defconfig b/configs/beagleplay_defconfig
index 90212bda44..9e45680c31 100644
--- a/configs/beagleplay_defconfig
+++ b/configs/beagleplay_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/beagleboard/beagleplay/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="7.2.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-beagleplay"
@@ -24,7 +24,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.15.0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
@@ -32,13 +33,13 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_beagleplay_r5"
 BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am62x-gp-evm.bin"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_beagleplay_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

--===============0669987838276774455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0669987838276774455==--
