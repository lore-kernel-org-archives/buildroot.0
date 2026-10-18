Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D165CCCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 17:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8C0340702;
	Sun, 18 Oct 2026 17:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxAHWcPaBdoA; Sun, 18 Oct 2026 17:48:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8431F406EE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792345711;
	b=NItnmC3Omz17tu6cMr/bNOIxEmzN+H71oXiPBtirpa+NE86qScITVFSQt4805y0Xu0VH
	 tvPgPAJ5UWF2aBBIFX7S8p90zIk/6+9SATZPyKlEKXZd+YHIhRROUHIIwx0NmseesrL8m
	 rw0hrdR3t+vs8WQ9NSSBzCxke6PzopVBYEQ5pya1VQFqIhTGFXNYG0UvOXXPLmEOiVzTr
	 idJrFeszetQtgmEzZqMaFYKGLyRYIWLdhrarbfK9hrUhQw+CvtKe1btOi8rIWetcA/vX4
	 b4onJF1KCGLD4CQHQFX7PUsPrMlsbrkZG+qVY1CAYogyJRq6vbvYx9G6Kg0kJ9i9hnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792345711;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=iKdZlgQ1PqssrNCLwwWLE0FDSbNZgbi34UgO+xUoiEE=;
	b=GQqXx4K+ugjYSXPnor6ovovTwlANTJ4nVVsMRTEvgj51QJidnl8UnV6YMhApZV1VcJf/
	 wcUsSslJIo1cV4Z9RH9Y5uok2QbIh22UMQt4blTy0SAYxQCkG83wqxoOW5vXcqnfB8c84
	 RIRBXo7VbSEm1wCWsjG6Ik5g3o4+XUDaHkCBOvyYlslN+jmTae/Uj6J3IRPYTkuQUefuQ
	 oXq0L8+OOBFxh6hHaDQ/FjfaWg6IqO/3SZq9sS7Ka7gU95UJyCV63WSa+7sYjriNsTZ4M
	 VTI4VSe9pnZrquyybnTBtwGk8LB1PgZaN1d/b0+G1JPuWSPJVvSHtuYELI35ueZde5w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792345711;
	bh=iKdZlgQ1PqssrNCLwwWLE0FDSbNZgbi34UgO+xUoiEE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g1hZpAmhQmyGmUgAI3eCyfY+vaKyuh51z2WMC8Ecj+LS48JwdOczs6/vdy/i3/Xk6
	 1lwxdlOsCmm1bDYggzPX79QM66lVzmNeZCkHIa9a+nQZ+IS94pk8zXh8rpO9p2LFSi
	 ghgvBbdlHR9VjU25D3Q4qey06BfjhO6nspjWnTeQf9SSULNtZLpMAso8Wz/caS5nCM
	 TXpgogm7ebYnwxoYxfSiUS52kY1bvb0zTmlFyRy9RnFDqzbY9hhOsyC31BcO0H17KA
	 Qs5rwryK7P9Bwu87F7wU5Y+i2eq7/m6zjYBazIzhUxsBALLrMeUfi5LBC4zLrf+P9G
	 VYQO5YvMtMSzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8431F406EE;
	Sun, 18 Oct 2026 17:48:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9FB7D7E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 17:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F746406ED
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 17:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lAxThf-awnBi for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 17:48:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4B0F9406EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792345706;
 b=BDnJ2UdcDBBnVdRPceVdNozxqAVR7SZwnE+Mno/gAbhHCFFlk2hNxnTFjFfML2VD7dfY
 QsBXnGXz2Isp3FABko7x9g1pLmIo1AgFade/JSWsabYBEnYzRLn9yEwzKtLwFjR84pj2l
 i4kKpbySoD7aSgwtIbfxufBRA+6LOK4QreueLBP20ExgZxxuCp8+YcAaHn389cZ5GuWDD
 /ir4rZ6FqwAQxZ0hfyLTHwOXV2m+/8Z7tRAP5Prrsh1r3GW+RgFtjxct2wszqvyzRONap
 4V2h55JOrYNkZQF9rXc1LpXfFgASCCB7/QLWyqx+6TqEyIhuciR67efu3WQIsJZ0oRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792345706;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=i0DE6yKCoSyK336W4PHVHXaHpkRC5rHjUubod3WVXkU=;
 b=Ex2bNMD7RWbm9jdxaedXWlf/rxZMkxtTs6l1H56RM/+YS+sXkz4KNi3k0CXubH3CbBds
 mFzBzWMgsnymlkuQbbLHsYli3zs1hahvePG3NcXobl5E/+ZV6bcLc9cCSO/Z7OLUd1LFo
 60kA72tyt07WmdIr7TtATg+YME75yHUk2/HlUQoqg9m+9DtTD213MWbX/X41WpsfnuEpr
 8Zt8IRxwnTJLVOw4WfTBxf0xw64UlIgacEgKApFv0Xmf3zxmfgkc/Yt+HhB3T2wqtliiV
 k+/55dAXjnpXipjuHQSHJ/C7DjJJguphAq7BcKI8hmuYLbWqxipp0rzDhr8ygKMRu+A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B0F9406EC
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 17:48:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27DA798390; Sun, 18 Oct 2026 17:47:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 17:53:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 723957cf53798b4a98b9fd28ca3e2e27e5d52579
X-Git-Newrev: c238cc25dcd1cd77c36bfaf09e89b7c1b24a08c6
X-Patchwork-Hint: ignore
Message-Id: <20261018174704.27DA798390@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_am64x_sk: bump tfa,
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
Content-Type: multipart/mixed; boundary="===============0414654623796015991=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0414654623796015991==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c238cc25dcd1cd77c36bfaf09e89b7c1b24a08c6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump the am64x-sk reference board to use the latest stable tfa, uboot
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
 board/ti/am64x-sk/patches/linux/linux.hash         |  4 +-
 ...place-removed-SWIG-Python-2-compatibility.patch | 67 ++++++++++++++++++++++
 ...place-removed-SWIG-Python-2-compatibility.patch | 67 ++++++++++++++++++++++
 board/ti/am64x-sk/patches/uboot/uboot.hash         |  2 +-
 configs/ti_am64x_sk_defconfig                      | 10 ++--
 6 files changed, 143 insertions(+), 9 deletions(-)

diff --git a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 8b77e1f165..2e24bcd0de 100644
--- a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
+sha256  b807d8bf190b7c46b4260729b4bbe2f7df83cd1086edcb181d66595ae6598d23  arm-trusted-firmware-v2.15.0-git4.tar.gz
diff --git a/board/ti/am64x-sk/patches/linux/linux.hash b/board/ti/am64x-sk/patches/linux/linux.hash
index 53eb143894..49bf75b924 100644
--- a/board/ti/am64x-sk/patches/linux/linux.hash
+++ b/board/ti/am64x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  774698422ee54c5f1e704456f37c65c06b51b4e9a8b0866f34580d86fef8e226  linux-6.10.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  2feaa70453e91f541be6a5c9078d8168e081af45a3d9718054850538cff2ebf3  linux-7.2.10.tar.xz
diff --git a/board/ti/am64x-sk/patches/ti-k3-r5-loader/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch b/board/ti/am64x-sk/patches/ti-k3-r5-loader/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
new file mode 100644
index 0000000000..10968ce876
--- /dev/null
+++ b/board/ti/am64x-sk/patches/ti-k3-r5-loader/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
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
diff --git a/board/ti/am64x-sk/patches/uboot/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch b/board/ti/am64x-sk/patches/uboot/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
new file mode 100644
index 0000000000..10968ce876
--- /dev/null
+++ b/board/ti/am64x-sk/patches/uboot/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
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
diff --git a/board/ti/am64x-sk/patches/uboot/uboot.hash b/board/ti/am64x-sk/patches/uboot/uboot.hash
index fe9b4f53dc..ff6e4ed2e2 100644
--- a/board/ti/am64x-sk/patches/uboot/uboot.hash
+++ b/board/ti/am64x-sk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index f31989e1e7..f914436d2d 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am642-sk.dtb -l am64x
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am64x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="7.2.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
@@ -18,10 +18,10 @@ BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="180M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.15.0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
@@ -29,12 +29,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am64x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am64x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

--===============0414654623796015991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0414654623796015991==--
