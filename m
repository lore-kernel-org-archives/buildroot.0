Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A230C3DA7D
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29C7960E92;
	Sun,  1 Jan 2023 23:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29C7960E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SiRP-fb2N8zQ; Sun,  1 Jan 2023 23:45:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2688360E91;
	Sun,  1 Jan 2023 23:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2688360E91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BDAD1BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BF7D81378
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BF7D81378
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9NsHaFT4VCKQ for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:40:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E40A8133F
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E40A8133F
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:40:16 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id r11so23786041oie.13
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:40:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iA38R7GSxdCoBU1jpemjFcicz+fY51mgyiPrMc3pQh8=;
 b=WWuYpAFlrUzHwVRwHEQxNrulsu+8vI+uNinQAQuBQBLCf48qXZt6MNEn0mN0uYa63W
 XxN0H0bUrf4gYFqSMB19ZjlFi32TPQrFB0flXSoSeyqGd+nWDLnlVsQ5lXuoeRkTmYZd
 z1suU9a5GmWADll2MUS2J5JmXfIxEJMoWL5VWDbXHxk69m2OE5kmCldsoGZxZ4Wi8oF7
 cxXi90xpFUbmyBj7r1qWxGI39wh74hiMnKp6sgeWH0AlpinFHMupSy5V0/nSV0hfJZac
 M46zDuPDxSPdbp5jl++aRhCRO5pNh0Ml69qzJQXlHKbpt5R97mA7ARTLfkSqx9th/Dj4
 r00Q==
X-Gm-Message-State: AFqh2kpki3u334DokkeTubSrf2xTOOjNzuuRRHf1tAAgb0hTeOBy4D8+
 Mhx/tnFwpZi+MhD2JPjfqMcy8Ma9y9s=
X-Google-Smtp-Source: AMrXdXufHPRqdmN0KqrSZugTGsYcLtJGka6eT6H1u9xADmeWnCdei9xWovAd9i3pCApAvDOcukVbXA==
X-Received: by 2002:a05:6808:2119:b0:35e:d67e:3dcd with SMTP id
 r25-20020a056808211900b0035ed67e3dcdmr32001117oiw.58.1672616414947; 
 Sun, 01 Jan 2023 15:40:14 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:40:13 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:51 -0300
Message-Id: <20230101233653.487175-28-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iA38R7GSxdCoBU1jpemjFcicz+fY51mgyiPrMc3pQh8=;
 b=kpE74q04vysubLw5n/ndYgadKatt4X3A5ukOxvBm+XRTh/Fw7wrqj3tq8Vva64vvFq
 W+WZ+LKusTdTRCSD6UQMkGG684kfWR+9O4yO06w8fA9iOP0LYClu672XJlseBA/rVuDK
 +8xQ1lG6OEwHpJRkD58u/RIpS78g3HZ+JgjNqVl3jqIqfKRsM5yG5o7B9ribcrUAhaup
 Bi5CFPVeWwvy18wlBv0mFnqcrmbkbEQfef/Zwoxpngvn0ETVIo/O9qUDvHvNkIdrCHMS
 1b+f5PQkDvsD5mGyLPpECDqy90SMnNgoMMsMgyWP9mIjRugYgI4YeygxrrGemXUIKdGm
 EkUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kpE74q04
Subject: [Buildroot] [PATCH 27/29] utils/check-package: warn about symbols
 not recognized by a package infra
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For each .mk file, create a list of all symbols defined and compare to
the list of symbols supported by the package infra(s) used in the file.
Also keep track of usage for internal variables, since any variable
suffix can be used as long the variable is use in the file.
Ignore some variables that are defined in one file and used in others,
for instance the variable that holds the path to host tools to be used
in the build of other packages.
Use a small list for the exceptions that don't use a package/rootfs
infra: linux extensions and initramfs.
Also support the special case of _SUBDIR, see below.

In the main script, add support for a check function to return more than
one warning at once.

Create a simple model for the package infras, listing the supported
suffixes for variables for each package infra type.
This file may need updates when new package infras are added or existent
ones are changed.

Add an exception to initramfs, because it changes TARGETS_ROOTFS.
Add an exception to xenomai because it changes LINUX_EXTRA_DOWNLOADS.
Add an exception to luarocks because it changes TARGET_FINALIZE_HOOKS.
Add an exception to toolchain/toolchain.mk because it does not call any
package infra.

The _SUBDIR variable is a tricky one. It *is* declared for the generic
infra package (and all package infras that inherit from the generic
one), but it is really used in certain conditions.
package/pkg-generic.mk uses <pkg>_SUBDIR only to define:
(2)_SRCDIR                     = $$($(2)_DIR)/$$($(2)_SUBDIR)
and it also uses <pkg>_SRCDIR only to define:
$(2)_BUILDDIR                   ?= $$($(2)_SRCDIR)
so the generic package infra does not really uses _SUBDIR by itself in
the common scenario.
So The manual entry for the generic infra seems correct in not
mentioning _SUBDIR.
Also any package infra that inherits from the generic one (by calling
inner-generic-package) needs to use one of the three variables in order
to support _SUBDIR: _BUILDDIR, _SRCDIR or _SUBDIR.
That is the case for: autotools (_SRCDIR), cargo (_SRCDIR, _SUBDIR),
cmake (_BUILDDIR, _SRCDIR), luarocks (_SRCDIR, _SUBDIR),
meson (_SRCDIR), perl (_SRCDIR), python (_BUILDDIR), qmake (_BUILDDIR)
and waf (_SRCDIR).
Of course the .mk file for a package using the generic infra can define
this symbol and use it, directly or indirectly, for example, in its
_INSTALL_TARGET_CMDS.
Also any package infra, even the ones that do not use directly any of
the three variables above, can use _SUBDIR when the package uses the
macros KCONFIG_ENABLE_OPT, KCONFIG_SET_OPT or KCONFIG_DISABLE_OPT
declared in package/pkg-utils.mk.

Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Running on current master:
boot/ti-k3-r5-loader/ti-k3-r5-loader.mk:29: possible typo on suffix: TI_K3_R5_LOADER_BOARD
package/falcosecurity-libs/falcosecurity-libs.mk:12: possible typo on suffix: FALCOSECURITY_LIBS_SUPPORTS_IN_SOURCE_BUILD
package/i2pd/i2pd.mk:39: possible typo on suffix: I2PD_INSTALL_CONFIGURATION_FILES
package/policycoreutils/policycoreutils.mk:19: possible typo on suffix: POLICYCOREUTILS_INSTALL_TARGET_LINUX_PAM_CONFS
package/checkpolicy/checkpolicy.mk:23: possible typo on suffix: CHECKPOLICY_STAGING_CMDS
package/qcom-db410c-firmware/qcom-db410c-firmware.mk:11: possible typo on suffix: QCOM_DB410C_FIRMWARE_LICENCE
package/lrzsz/lrzsz.mk:21: possible typo on suffix: LRZSZ_BUILD_HOOKS
package/gobject-introspection/gobject-introspection.mk:12: possible typo on suffix: GOBJECT_INTROSPECTION_AUTORECONF
package/gobject-introspection/gobject-introspection.mk:67: possible typo on suffix: GOBJECT_INTROSPECTION_FIX_TOOLS_PYTHON_PATH
package/pptp-linux/pptp-linux.mk:10: possible typo on suffix: PPTP_LINUX_MAKE
package/exfat/exfat.mk:14: possible typo on suffix: EXFAT_CFLAGS
package/rhash/rhash.mk:15: possible typo on suffix: RHASH_ADDLDFLAGS
package/wpa_supplicant/wpa_supplicant.mk:16: possible typo on suffix: WPA_SUPPLICANT_LDFLAGS
package/wpa_supplicant/wpa_supplicant.mk:160: possible typo on suffix: WPA_SUPPLICANT_MAKE_ENV
package/libtalloc/libtalloc.mk:34: possible typo on suffix: LIBTALLOC_CFLAGS
package/libtalloc/libtalloc.mk:35: possible typo on suffix: LIBTALLOC_LDFLAGS
package/tinyxml/tinyxml.mk:15: possible typo on suffix: TINYXML_CPE_ID_VENDOT
package/zip/zip.mk:44: possible typo on suffix: ZIP_INSTALLING_STAGING_CMDS
package/libmng/libmng.mk:17: possible typo on suffix: LIBMNG_DEPDENDENCIES
package/swupdate/swupdate.mk:211: possible typo on suffix: SWUPDATE_BUILD_CONFIG
package/glib-networking/glib-networking.mk:24: possible typo on suffix: GLIB_NETWORKING_INSTALL_TARGET_OPTS
package/tekui/tekui.mk:15: possible typo on suffix: TEKUI_MAKE
package/qoriq-rcw/qoriq-rcw.mk:63: possible typo on suffix: QORIQ_RCW_FILE_BIN
package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk:19: possible typo on suffix: QT5VIRTUALKEYBOARD_QMAKEFLAGS
---
 fs/initramfs/initramfs.mk            |   1 +
 linux/linux-ext-xenomai.mk           |   2 +-
 package/luarocks/luarocks.mk         |   2 +
 toolchain/toolchain.mk               |   2 +
 utils/check-package                  |  17 +-
 utils/checkpackagelib/lib_mk.py      | 109 +++++++
 utils/checkpackagelib/pkg_infra.py   | 309 +++++++++++++++++++
 utils/checkpackagelib/test_lib_mk.py | 426 +++++++++++++++++++++++++++
 8 files changed, 863 insertions(+), 5 deletions(-)
 create mode 100644 utils/checkpackagelib/pkg_infra.py

diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index 3b3d4ed8b9..69f0910368 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -27,6 +27,7 @@ rootfs-initramfs-show-depends:
 .PHONY: rootfs-initramfs rootfs-initramfs-show-depends
 
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
+# check-package TypoInVariableSuffix
 TARGETS_ROOTFS += rootfs-initramfs
 endif
 
diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
index 5ec6891bbf..247ff087cb 100644
--- a/linux/linux-ext-xenomai.mk
+++ b/linux/linux-ext-xenomai.mk
@@ -12,7 +12,7 @@ XENOMAI_ADEOS_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH))
 ifneq ($(filter ftp://% http://% https://%,$(XENOMAI_ADEOS_PATCH)),)
 XENOMAI_ADEOS_PATCH_NAME = $(notdir $(XENOMAI_ADEOS_PATCH))
 XENOMAI_ADEOS_PATCH_PATH = $(LINUX_DL_DIR)/$(XENOMAI_ADEOS_PATCH_NAME)
-# check-package TypoInPackageVariable
+# check-package TypoInPackageVariable, TypoInVariableSuffix
 LINUX_EXTRA_DOWNLOADS += $(XENOMAI_ADEOS_PATCH)
 BR_NO_CHECK_HASH_FOR += $(XENOMAI_ADEOS_PATCH_NAME)
 else
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 2bec2fca25..58295f7478 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -43,11 +43,13 @@ endef
 
 $(eval $(host-generic-package))
 
+# check-package TypoInVariableSuffix
 define LUAROCKS_FINALIZE_TARGET
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
 endef
 
 # Apply to global variable directly, as pkg-generic does not
 ifneq ($(BR2_PACKAGE_LUAJIT)$(BR2_PACKAGE_LUA),)
+# check-package TypoInVariableSuffix
 TARGET_FINALIZE_HOOKS += LUAROCKS_FINALIZE_TARGET
 endif
diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
index fe87a72ed4..36344c1b20 100644
--- a/toolchain/toolchain.mk
+++ b/toolchain/toolchain.mk
@@ -10,6 +10,7 @@
 # Install the gconv modules
 ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
 TOOLCHAIN_GLIBC_GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
+# check-package TypoInVariableSuffix
 define TOOLCHAIN_GLIBC_COPY_GCONV_LIBS
 	$(Q)found_gconv=no; \
 	for d in $(TOOLCHAIN_EXTERNAL_PREFIX) ''; do \
@@ -51,5 +52,6 @@ define TOOLCHAIN_GLIBC_COPY_GCONV_LIBS
 			>$(TARGET_DIR)/usr/lib/gconv/gconv-modules; \
 	fi
 endef
+# check-package TypoInVariableSuffix
 TOOLCHAIN_TARGET_FINALIZE_HOOKS += TOOLCHAIN_GLIBC_COPY_GCONV_LIBS
 endif
diff --git a/utils/check-package b/utils/check-package
index 6bd0c0b31f..0d9c4c1994 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -126,10 +126,19 @@ def print_warnings(warnings):
     if warnings is None:
         return 0  # No warning generated.
 
-    for level, message in enumerate(warnings):
-        if flags.verbose >= level:
-            print(message.replace("\t", "< tab  >").rstrip())
-    return 1  # One more warning to count.
+    # Allow each check function to return either one warning or a list of warnings
+    if len(warnings) == 0:
+        return 0  # No warning generated.
+    if type(warnings[0]) is list:
+        all_warnings = warnings
+    else:
+        all_warnings = [warnings]
+
+    for each_warning in all_warnings:
+        for level, message in enumerate(each_warning):
+            if flags.verbose >= level:
+                print(message.replace("\t", "< tab  >").rstrip())
+    return len(all_warnings)  # One or more warnings to count.
 
 
 def check_file_using_lib(fname):
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 931fa39dda..d9f254ca32 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -13,6 +13,7 @@ from checkpackagelib.lib import EmptyLastLine          # noqa: F401
 from checkpackagelib.lib import NewlineAtEof           # noqa: F401
 from checkpackagelib.lib import TrailingSpace          # noqa: F401
 from checkpackagelib.lib import Utf8Characters         # noqa: F401
+from checkpackagelib.pkg_infra import get_valid_suffixes
 from checkpackagelib.tool import NotExecutable         # noqa: F401
 
 # used in more than one check
@@ -292,6 +293,114 @@ class TypoInPackageVariable(_CheckFunction):
                     text]
 
 
+class TypoInVariableSuffix(_CheckFunction):
+    USED_OUTSIDE_THE_PACKAGE = [
+        "ALCHEMY_INSTALL_LIB_SDK_FILE",
+        "ALCHEMY_MAKE",
+        "ALCHEMY_TARGET_ENV",
+        "ARCH_TOOLCHAIN_WRAPPER_OPTS",
+        "BR_LIBC",
+        "BR_NO_CHECK_HASH_FOR",
+        "DIRECTFB_HOST_BINARY",
+        "ERLANG_EI_VSN",
+        "GCC_TARGET_ABI",
+        "GCC_TARGET_ARCH",
+        "GCC_TARGET_CPU",
+        "GCC_TARGET_FLOAT_ABI",
+        "GCC_TARGET_FP32_MODE",
+        "GCC_TARGET_FPU",
+        "GCC_TARGET_MODE",
+        "GCC_TARGET_NAN",
+        "GOB2_HOST_BINARY",
+        "HOST_GCC_APPLY_PATCHES",
+        "HOST_GCC_CONFIGURE_SYMLINK",
+        "HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS",
+        "HOST_GCC_XTENSA_OVERLAY_EXTRACT",
+        "HOST_GO_HOST_ENV",
+        "HOST_GO_TARGET_ENV",
+        "LIBGLIB2_HOST_BINARY",
+        "LIBXML2_HOST_BINARY",
+        "LUA_RUN",
+        "MKFS_JFFS2",
+        "PKG_CONFIG_HOST_BINARY",
+        "QEMU_USER",
+        "QT5_QMAKE",
+        "QT5_QT_CONF_FIXUP",
+        "QT6_SOURCE_TARBALL_PREFIX",
+        "TOOLCHAIN_WRAPPER_BUILD",
+        "TOOLCHAIN_WRAPPER_INSTALL",
+        ]
+    DEFINITION = re.compile(r"^(define\s+)?([A-Z0-9_]+_[A-Z0-9_]+)")
+    USAGE = re.compile(r"([A-Z0-9_]+_[A-Z0-9_]+)")
+    INDIRECTLY_USING_SUBDIR = re.compile(r"\$\(call\s+" + r",|\$\(call\s+".join([
+        "KCONFIG_DISABLE_OPT",
+        "KCONFIG_ENABLE_OPT",
+        "KCONFIG_SET_OPT",
+        ]) + r",|[A-Z0-9_]+" + r"\b|[A-Z0-9_]+".join([
+            "_BUILDDIR",
+            "_SRCDIR",
+            "_SUBDIR",
+        ]) + r"\b")
+
+    def before(self):
+        self.usage = []
+        self.definitions = {}
+        if self.filename.startswith("linux/linux-ext-"):
+            self.valid_suffixes = ["LINUX_EXTENSIONS", "_PREPARE_KERNEL"]
+        elif self.filename.startswith("package/linux-tools/linux-tool-"):
+            self.valid_suffixes = ["LINUX_TOOLS", "LINUX_TOOLS_POST_PATCH_HOOKS", "_DEPENDENCIES",
+                                   "_BUILD_CMDS", "_INSTALL_STAGING_CMDS", "_INSTALL_TARGET_CMDS",
+                                   "_LINUX_CONFIG_FIXUPS", "_INSTALL_INIT_SYSTEMD",
+                                   "_INSTALL_INIT_SYSV", "_INSTALL_INIT_OPENRC"]
+        elif self.filename.startswith("fs/initramfs/"):
+            self.valid_suffixes = ["_DEPENDENCIES", "_NAME", "_TYPE"]
+        else:
+            self.valid_suffixes = []
+        self.using_subdir = False
+
+    def check_line(self, lineno, text):
+        self.valid_suffixes += get_valid_suffixes(text)
+
+        m = self.DEFINITION.search(text)
+        if m:
+            variable = m.group(2)
+            if variable not in self.USED_OUTSIDE_THE_PACKAGE:
+                self.definitions[variable] = [lineno, text]
+
+        rest_of_line = self.DEFINITION.sub('', text)
+        variables = self.USAGE.findall(rest_of_line)
+        for variable in variables:
+            self.usage.append(variable)
+
+        if self.INDIRECTLY_USING_SUBDIR.search(rest_of_line):
+            self.using_subdir = True
+
+    def after(self):
+        if self.using_subdir:
+            _, package = get_package_prefix_from_filename(self.filename)
+            self.usage.append(package + "_SUBDIR")
+            self.usage.append("HOST_" + package + "_SUBDIR")
+
+        possible_typo = {}
+        for variable, where in self.definitions.items():
+            valid_suffix = False
+            for suffix in self.valid_suffixes:
+                if variable.endswith(suffix):
+                    valid_suffix = True
+                    break
+            if not valid_suffix:
+                possible_typo[variable] = where
+
+        warnings = []
+        for variable, where in possible_typo.items():
+            if variable not in self.usage:
+                lineno, text = where
+                warnings.append(["{}:{}: possible typo on suffix: {}"
+                                 .format(self.filename, lineno, variable),
+                                 text])
+        return warnings
+
+
 class UselessFlag(_CheckFunction):
     DEFAULT_AUTOTOOLS_FLAG = re.compile(r"^.*{}".format("|".join([
         r"_AUTORECONF\s*=\s*NO",
diff --git a/utils/checkpackagelib/pkg_infra.py b/utils/checkpackagelib/pkg_infra.py
new file mode 100644
index 0000000000..8e93670548
--- /dev/null
+++ b/utils/checkpackagelib/pkg_infra.py
@@ -0,0 +1,309 @@
+AUTOTOOLS_VALID_SUFFIXES = [
+    "_AUTORECONF",
+    "_AUTORECONF_OPTS",
+    "_CONF_ENV",
+    "_CONF_OPTS",
+    "_GETTEXTIZE",
+    "_GETTEXTIZE_OPTS",
+    "_INSTALL_OPTS",
+    "_INSTALL_STAGING_OPTS",
+    "_INSTALL_TARGET_OPTS",
+    "_LIBTOOL_PATCH",
+    "_MAKE",
+    "_MAKE_ENV",
+    "_MAKE_OPTS",
+    "_SUBDIR",
+    ]
+BAREBOX_VALID_SUFFIXES = [
+    ]
+CARGO_VALID_SUFFIXES = [
+    "_CARGO_BUILD_OPTS",
+    "_CARGO_ENV",
+    "_CARGO_INSTALL_OPTS",
+    "_SUBDIR",
+    ]
+CMAKE_VALID_SUFFIXES = [
+    "_CONF_ENV",
+    "_CONF_OPTS",
+    "_INSTALL_OPTS",
+    "_INSTALL_STAGING_OPTS",
+    "_INSTALL_TARGET_OPTS",
+    "_MAKE",
+    "_MAKE_ENV",
+    "_MAKE_OPTS",
+    "_SUBDIR",
+    "_SUPPORTS_IN_SOURCE_BUILD",
+    ]
+GENERIC_VALID_SUFFIXES = [
+    "_ACTUAL_SOURCE_SITE",
+    "_ACTUAL_SOURCE_TARBALL",
+    "_ADDITIONAL_DOWNLOADS",
+    "_ADD_SKELETON_DEPENDENCY",
+    "_ADD_TOOLCHAIN_DEPENDENCY",
+    "_BIN_ARCH_EXCLUDE",
+    "_BUILD_CMDS",
+    "_CONFIGURE_CMDS",
+    "_CONFIG_SCRIPTS",
+    "_CPE_ID",
+    "_CPE_ID_PREFIX",
+    "_CPE_ID_PRODUCT",
+    "_CPE_ID_UPDATE",
+    "_CPE_ID_VENDOR",
+    "_CPE_ID_VERSION",
+    "_DEPENDENCIES",
+    "_DEVICES",
+    "_DL_DIR",
+    "_DL_ENV",
+    "_DL_OPTS",
+    "_DL_SUBDIR",
+    "_DL_VERSION",
+    "_DOWNLOAD_DEPENDENCIES",
+    "_DOWNLOAD_POST_PROCESS",
+    "_DROP_FILES_OR_DIRS",
+    "_EXCLUDES",
+    "_EXTRACT_CMDS",
+    "_EXTRACT_DEPENDENCIES",
+    "_EXTRA_DOWNLOADS",
+    "_FLAT_STACKSIZE",
+    "_GIT_LFS",
+    "_GIT_SUBMODULES",
+    "_HELP_CMDS",
+    "_IGNORE_CVES",
+    "_INSTALL_CMDS",
+    "_INSTALL_IMAGES",
+    "_INSTALL_IMAGES_CMDS",
+    "_INSTALL_INIT_OPENRC",
+    "_INSTALL_INIT_SYSTEMD",
+    "_INSTALL_INIT_SYSV",
+    "_INSTALL_STAGING",
+    "_INSTALL_STAGING_CMDS",
+    "_INSTALL_TARGET",
+    "_INSTALL_TARGET_CMDS",
+    "_KEEP_PY_FILES",
+    "_LICENSE",
+    "_LICENSE_FILES",
+    "_LINUX_CONFIG_FIXUPS",
+    "_NAME",
+    "_OVERRIDE_SRCDIR",
+    "_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS",
+    "_PATCH",
+    "_PATCH_DEPENDENCIES",
+    "_PERMISSIONS",
+    "_POST_BUILD_HOOKS",
+    "_POST_CONFIGURE_HOOKS",
+    "_POST_DOWNLOAD_HOOKS",
+    "_POST_EXTRACT_HOOKS",
+    "_POST_INSTALL_HOOKS",
+    "_POST_INSTALL_IMAGES_HOOKS",
+    "_POST_INSTALL_STAGING_HOOKS",
+    "_POST_INSTALL_TARGET_HOOKS",
+    "_POST_LEGAL_INFO_HOOKS",
+    "_POST_PATCH_HOOKS",
+    "_POST_PREPARE_HOOKS",
+    "_POST_RSYNC_HOOKS",
+    "_PRE_BUILD_HOOKS",
+    "_PRE_CONFIGURE_HOOKS",
+    "_PRE_DOWNLOAD_HOOKS",
+    "_PRE_EXTRACT_HOOKS",
+    "_PRE_INSTALL_HOOKS",
+    "_PRE_INSTALL_IMAGES_HOOKS",
+    "_PRE_INSTALL_STAGING_HOOKS",
+    "_PRE_INSTALL_TARGET_HOOKS",
+    "_PRE_LEGAL_INFO_HOOKS",
+    "_PRE_PATCH_HOOKS",
+    "_PRE_RSYNC_HOOKS",
+    "_PROVIDES",
+    "_REDISTRIBUTE",
+    "_ROOTFS_PRE_CMD_HOOKS",
+    "_SELINUX_MODULES",
+    "_SITE",
+    "_SITE_METHOD",
+    "_SOURCE",
+    "_STRIP_COMPONENTS",
+    "_TARGET_FINALIZE_HOOKS",
+    "_TOOLCHAIN_WRAPPER_ARGS",
+    "_USERS",
+    "_VERSION",
+    ]
+GOLANG_VALID_SUFFIXES = [
+    "_BIN_NAME",
+    "_BUILD_OPTS",
+    "_BUILD_TARGETS",
+    "_GOMOD",
+    "_GO_ENV",
+    "_INSTALL_BINS",
+    "_LDFLAGS",
+    "_SRC_DOMAIN",
+    "_SRC_SOFTWARE",
+    "_SRC_VENDOR",
+    "_TAGS",
+    ]
+KCONFIG_VALID_SUFFIXES = [
+    "_KCONFIG_DEFCONFIG",
+    "_KCONFIG_DEPENDENCIES",
+    "_KCONFIG_DOTCONFIG",
+    "_KCONFIG_EDITORS",
+    "_KCONFIG_FILE",
+    "_KCONFIG_FIXUP_CMDS",
+    "_KCONFIG_FRAGMENT_FILES",
+    "_KCONFIG_MAKE",
+    "_KCONFIG_OPTS",
+    "_KCONFIG_RULES",
+    "_KCONFIG_SUPPORTS_DEFCONFIG",
+    "_MAKE",
+    "_MAKE_ENV",
+    ]
+KERNEL_MODULE_VALID_SUFFIXES = [
+    "_DEPENDENCIES",
+    "_MAKE",
+    "_MODULE_MAKE_OPTS",
+    "_MODULE_SUBDIRS",
+    ]
+LUAROCKS_VALID_SUFFIXES = [
+    "_BUILD_OPTS",
+    "_NAME_UPSTREAM",
+    "_ROCKSPEC",
+    "_SUBDIR",
+    ]
+MESON_VALID_SUFFIXES = [
+    "_CFLAGS",
+    "_CONF_ENV",
+    "_CONF_OPTS",
+    "_CXXFLAGS",
+    "_FCFLAGS",
+    "_LDFLAGS",
+    "_MESON_EXTRA_BINARIES",
+    "_MESON_EXTRA_PROPERTIES",
+    "_NINJA_ENV",
+    "_NINJA_OPTS",
+    "_SUBDIR",
+    ]
+PERL_VALID_SUFFIXES = [
+    "_BUILD_OPTS",
+    "_CONF_ENV",
+    "_CONF_OPTS",
+    "_DISTNAME",
+    "_INSTALL_TARGET_OPTS",
+    "_PREFER_INSTALLER",
+    "_SUBDIR",
+    ]
+PYTHON_VALID_SUFFIXES = [
+    "_BASE_INSTALL_CMD",
+    "_BUILD_OPTS",
+    "_ENV",
+    "_INSTALL_OPTS",
+    "_INSTALL_STAGING_OPTS",
+    "_INSTALL_TARGET_OPTS",
+    "_SETUP_TYPE",
+    "_SUBDIR",
+    ]
+QMAKE_VALID_SUFFIXES = [
+    "_CONF_ENV",
+    "_CONF_OPTS",
+    "_INSTALL_STAGING_OPTS",
+    "_INSTALL_TARGET_OPTS",
+    "_MAKE_ENV",
+    "_MAKE_OPTS",
+    "_SUBDIR",
+    "_SYNC_QT_HEADERS",
+    ]
+REBAR_VALID_SUFFIXES = [
+    "_CONF_ENV",
+    "_KEEP_DEPENDENCIES",
+    "_REBAR_ENV",
+    "_USE_AUTOCONF",
+    "_USE_BUNDLED_REBAR",
+    ]
+ROOTFS_VALID_SUFFIXES = [
+    "_CMD",
+    "_DEPENDENCIES",
+    "_IMAGE_NAME",
+    "_POST_GEN_HOOKS",
+    "_PRE_GEN_HOOKS",
+    ]
+TOOLCHAIN_EXTERNAL_VALID_SUFFIXES = [
+    ]
+VIRTUAL_VALID_SUFFIXES = [
+    "_IS_VIRTUAL",
+    ]
+WAF_VALID_SUFFIXES = [
+    "_BUILD_OPTS",
+    "_CONF_ENV",
+    "_CONF_OPTS",
+    "_INSTALL_STAGING_OPTS",
+    "_INSTALL_TARGET_OPTS",
+    "_MAKE_ENV",
+    "_NEEDS_EXTERNAL_WAF",
+    "_SUBDIR",
+    "_WAF",
+    "_WAF_OPTS",
+    ]
+
+
+ALL_VALID_SUFFIXES = \
+    AUTOTOOLS_VALID_SUFFIXES + \
+    BAREBOX_VALID_SUFFIXES + \
+    CARGO_VALID_SUFFIXES + \
+    CMAKE_VALID_SUFFIXES + \
+    GENERIC_VALID_SUFFIXES + \
+    GOLANG_VALID_SUFFIXES + \
+    KCONFIG_VALID_SUFFIXES + \
+    KERNEL_MODULE_VALID_SUFFIXES + \
+    LUAROCKS_VALID_SUFFIXES + \
+    MESON_VALID_SUFFIXES + \
+    PERL_VALID_SUFFIXES + \
+    PYTHON_VALID_SUFFIXES + \
+    QMAKE_VALID_SUFFIXES + \
+    REBAR_VALID_SUFFIXES + \
+    ROOTFS_VALID_SUFFIXES + \
+    TOOLCHAIN_EXTERNAL_VALID_SUFFIXES + \
+    VIRTUAL_VALID_SUFFIXES + \
+    WAF_VALID_SUFFIXES
+
+
+def get_valid_suffixes(text):
+    if text.startswith("include"):
+        # we cannot guess the package infra used looking only at this file, so
+        # default to a superset of all known package infra types
+        return ALL_VALID_SUFFIXES
+    if text.startswith("$(eval"):
+        if "autotools-package)" in text:
+            return GENERIC_VALID_SUFFIXES + AUTOTOOLS_VALID_SUFFIXES
+        if "barebox-package)" in text:
+            return GENERIC_VALID_SUFFIXES + KCONFIG_VALID_SUFFIXES + BAREBOX_VALID_SUFFIXES
+        if "cargo-package)" in text:
+            return GENERIC_VALID_SUFFIXES + CARGO_VALID_SUFFIXES
+        if "cmake-package)" in text:
+            return GENERIC_VALID_SUFFIXES + CMAKE_VALID_SUFFIXES
+        if "generic-package)" in text:
+            return GENERIC_VALID_SUFFIXES
+        if "golang-package)" in text:
+            return GENERIC_VALID_SUFFIXES + GOLANG_VALID_SUFFIXES
+        if "kconfig-package)" in text:
+            return GENERIC_VALID_SUFFIXES + KCONFIG_VALID_SUFFIXES
+        if "kernel-module)" in text:
+            return KERNEL_MODULE_VALID_SUFFIXES
+        if "luarocks-package)" in text:
+            return GENERIC_VALID_SUFFIXES + LUAROCKS_VALID_SUFFIXES
+        if "meson-package)" in text:
+            return GENERIC_VALID_SUFFIXES + MESON_VALID_SUFFIXES
+        if "perl-package)" in text:
+            return GENERIC_VALID_SUFFIXES + PERL_VALID_SUFFIXES
+        if "python-package)" in text:
+            return GENERIC_VALID_SUFFIXES + PYTHON_VALID_SUFFIXES
+        if "qmake-package)" in text:
+            return GENERIC_VALID_SUFFIXES + QMAKE_VALID_SUFFIXES
+        if "rebar-package)" in text:
+            return GENERIC_VALID_SUFFIXES + AUTOTOOLS_VALID_SUFFIXES + REBAR_VALID_SUFFIXES
+        if "(rootfs)" in text:
+            return ROOTFS_VALID_SUFFIXES
+        if "toolchain-external-package)" in text:
+            return GENERIC_VALID_SUFFIXES + TOOLCHAIN_EXTERNAL_VALID_SUFFIXES
+        if "virtual-package)" in text:
+            return GENERIC_VALID_SUFFIXES + VIRTUAL_VALID_SUFFIXES
+        if "waf-package)" in text:
+            return GENERIC_VALID_SUFFIXES + WAF_VALID_SUFFIXES
+        # any new package infra will need support here, otherwise default to a
+        # superset of all known package infra types
+        return ALL_VALID_SUFFIXES
+    return []
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index d817cdece0..56cd8bc391 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -545,6 +545,432 @@ def test_TypoInPackageVariable(testname, filename, string, expected):
     assert warnings == expected
 
 
+TypoInVariableSuffix = [
+    ('good',
+     'any.mk',
+     'ANY_CONF_OPTS = \n'
+     '$(eval $(foo-package))\n',
+     [[]]),
+    ('bad',
+     'any.mk',
+     'ANY_VAR = \n'
+     '$(eval $(foo-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_VAR', 'ANY_VAR = \n']]]),
+    ('internal variable',
+     'any.mk',
+     'ANY_VAR = \n'
+     'ANY_CONF_OPTS = ANY_VAR OTHER_VAR\n'
+     '$(eval $(foo-package))\n',
+     [[]]),
+    ('ignore missing space',
+     'any.mk',
+     'OTHER_VAR= \n',
+     [[['any.mk:1: possible typo on suffix: OTHER_VAR', 'OTHER_VAR= \n']]]),
+    ('libc exception',
+     './any.mk',
+     'BR_LIBC = \n',
+     [[]]),
+    ('arch/gcc/toolchain exception',
+     'any.mk',
+     'GCC_TARGET_FPU += \n',
+     [[]]),
+    ('host (bad)',
+     'any.mk',
+     'HOST_OTHER_VAR = \n',
+     [[['any.mk:1: possible typo on suffix: HOST_OTHER_VAR', 'HOST_OTHER_VAR = \n']]]),
+    ('provides',
+     'any.mk',
+     'ANY_PROVIDES = other thing\n'
+     'OTHER_VAR = \n'
+     '$(eval $(foo-package))\n',
+     [[['any.mk:2: possible typo on suffix: OTHER_VAR', 'OTHER_VAR = \n']]]),
+    ('ignore space',
+     'any.mk',
+     'ANY_PROVIDES  =  thing  other \n'
+     'OTHER_VAR = \n'
+     '$(eval $(foo-package))\n',
+     [[['any.mk:2: possible typo on suffix: OTHER_VAR', 'OTHER_VAR = \n']]]),
+    ('multiple warnings',
+     'file.mk',
+     'LUA_RUN = FILE_INTERNAL_VAR\n'
+     'FILE_DEPENDENCY = wrong\n'
+     'FILE_LICENCE = wrong\n'
+     'FILE_CONF_OPTS = ok\n'
+     'FILE_INTERNAL_VAR = used above\n'
+     'FILE_WRONG = # commment\n'
+     '$(eval $(foo-package))\n',
+     [[['file.mk:2: possible typo on suffix: FILE_DEPENDENCY', 'FILE_DEPENDENCY = wrong\n'],
+       ['file.mk:3: possible typo on suffix: FILE_LICENCE', 'FILE_LICENCE = wrong\n'],
+       ['file.mk:6: possible typo on suffix: FILE_WRONG', 'FILE_WRONG = # commment\n']]]),
+    ('linux extensions',
+     'linux/linux-ext-any.mk',
+     'ANY_CPE_ID = \n'
+     'define ANY_BUILD_CMDS\n'
+     'endef\n'
+     'ANY_PREPARE_KERNEL = \n',
+     [[['linux/linux-ext-any.mk:1: possible typo on suffix: ANY_CPE_ID', 'ANY_CPE_ID = \n'],
+       ['linux/linux-ext-any.mk:2: possible typo on suffix: ANY_BUILD_CMDS', 'define ANY_BUILD_CMDS\n']]]),
+    ('linux tools',
+     'package/linux-tools/linux-tool-any.mk',
+     'ANY_CPE_ID = \n'
+     'define ANY_BUILD_CMDS\n'
+     'endef\n'
+     'ANY_PREPARE_KERNEL = \n',
+     [[['package/linux-tools/linux-tool-any.mk:1: possible typo on suffix: ANY_CPE_ID', 'ANY_CPE_ID = \n'],
+       ['package/linux-tools/linux-tool-any.mk:4: possible typo on suffix: ANY_PREPARE_KERNEL', 'ANY_PREPARE_KERNEL = \n']]]),
+    ('initramfs do not use fs infra',
+     'fs/initramfs/any.mk',
+     'ANY_CPE_ID = \n'
+     'ANY_NAME = \n',
+     [[['fs/initramfs/any.mk:1: possible typo on suffix: ANY_CPE_ID', 'ANY_CPE_ID = \n']]]),
+    ('autotools',
+     'any.mk',
+     'ANY_CONF_OPTS = \n'
+     'ANY_CPE_ID = \n'
+     'ANY_GETTEXTIZE = \n'
+     'ANY_SUPPORTS_IN_SOURCE_BUILD = \n'
+     '$(eval $(autotools-package))\n',
+     [[['any.mk:4: possible typo on suffix: ANY_SUPPORTS_IN_SOURCE_BUILD', 'ANY_SUPPORTS_IN_SOURCE_BUILD = \n']]]),
+    ('barebox',
+     'any.mk',
+     'ANY_CONF_OPTS = \n'
+     'ANY_CPE_ID = \n'
+     '$(eval $(barebox-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_CONF_OPTS', 'ANY_CONF_OPTS = \n']]]),
+    ('cmake',
+     'any.mk',
+     'ANY_CONF_OPTS = \n'
+     'ANY_CPE_ID = \n'
+     'ANY_GETTEXTIZE = \n'
+     'ANY_SUPPORTS_IN_SOURCE_BUILD = \n'
+     '$(eval $(cmake-package))\n',
+     [[['any.mk:3: possible typo on suffix: ANY_GETTEXTIZE', 'ANY_GETTEXTIZE = \n']]]),
+    ('cargo',
+     'any.mk',
+     'ANY_CONF_OPTS = \n'
+     'ANY_CPE_ID = \n'
+     'ANY_CARGO_INSTALL_OPTS = \n'
+     '$(eval $(cargo-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_CONF_OPTS', 'ANY_CONF_OPTS = \n']]]),
+    ('generic',
+     'any.mk',
+     'ANY_CONF_OPTS = \n'
+     'ANY_CPE_ID = \n'
+     '$(eval $(generic-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_CONF_OPTS', 'ANY_CONF_OPTS = \n']]]),
+    ('golang',
+     'any.mk',
+     'ANY_GO_ENV = \n'
+     'ANY_CONF_OPTS = \n'
+     '$(eval $(golang-package))\n',
+     [[['any.mk:2: possible typo on suffix: ANY_CONF_OPTS', 'ANY_CONF_OPTS = \n']]]),
+    ('kconfig',
+     'any.mk',
+     'ANY_GO_ENV = \n'
+     'ANY_KCONFIG_FIXUP_CMDS = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     '$(eval $(kconfig-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_GO_ENV', 'ANY_GO_ENV = \n'],
+       # https://bugs.buildroot.org/show_bug.cgi?id=15161  	kernel can't support SUBDIR
+       ['any.mk:4: possible typo on suffix: ANY_SUBDIR', 'ANY_SUBDIR = \n']]]),
+    ('kernel module + autotools',
+     'any.mk',
+     'ANY_CPE_ID = \n'
+     'ANY_GETTEXTIZE = \n'
+     'ANY_GO_ENV = \n'
+     'ANY_KCONFIG_FIXUP_CMDS = \n'
+     'ANY_MODULE_SUBDIRS = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SUPPORTS_IN_SOURCE_BUILD = \n'
+     '$(eval $(kernel-module))\n'
+     '$(eval $(autotools-package))\n',
+     [[['any.mk:3: possible typo on suffix: ANY_GO_ENV', 'ANY_GO_ENV = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_KCONFIG_FIXUP_CMDS', 'ANY_KCONFIG_FIXUP_CMDS = \n'],
+       ['any.mk:8: possible typo on suffix: ANY_SUPPORTS_IN_SOURCE_BUILD', 'ANY_SUPPORTS_IN_SOURCE_BUILD = \n']]]),
+    ('kernel module + generic',
+     'any.mk',
+     'ANY_CPE_ID = \n'
+     'ANY_GETTEXTIZE = \n'
+     'ANY_GO_ENV = \n'
+     'ANY_KCONFIG_FIXUP_CMDS = \n'
+     'ANY_MODULE_SUBDIRS = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SUPPORTS_IN_SOURCE_BUILD = \n'
+     '$(eval $(kernel-module))\n'
+     '$(eval $(generic-package))\n',
+     [[['any.mk:2: possible typo on suffix: ANY_GETTEXTIZE', 'ANY_GETTEXTIZE = \n'],
+       ['any.mk:3: possible typo on suffix: ANY_GO_ENV', 'ANY_GO_ENV = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_KCONFIG_FIXUP_CMDS', 'ANY_KCONFIG_FIXUP_CMDS = \n'],
+       ['any.mk:7: possible typo on suffix: ANY_SUBDIR', 'ANY_SUBDIR = \n'],
+       ['any.mk:8: possible typo on suffix: ANY_SUPPORTS_IN_SOURCE_BUILD', 'ANY_SUPPORTS_IN_SOURCE_BUILD = \n']]]),
+    ('kernel module + cmake',
+     'any.mk',
+     'ANY_CPE_ID = \n'
+     'ANY_GETTEXTIZE = \n'
+     'ANY_GO_ENV = \n'
+     'ANY_KCONFIG_FIXUP_CMDS = \n'
+     'ANY_MODULE_SUBDIRS = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SUPPORTS_IN_SOURCE_BUILD = \n'
+     '$(eval $(kernel-module))\n'
+     '$(eval $(cmake-package))\n',
+     [[['any.mk:2: possible typo on suffix: ANY_GETTEXTIZE', 'ANY_GETTEXTIZE = \n'],
+       ['any.mk:3: possible typo on suffix: ANY_GO_ENV', 'ANY_GO_ENV = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_KCONFIG_FIXUP_CMDS', 'ANY_KCONFIG_FIXUP_CMDS = \n']]]),
+    ('luarocks',
+     'any.mk',
+     'ANY_BUILD_OPTS = \n'
+     'ANY_CFLAGS = \n'
+     'ANY_ROCKSPEC = \n'
+     'ANY_DISTNAME = \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_CONF_OPTS = \n'
+     'ANY_INSTALL_STAGING_OPTS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     '$(eval $(luarocks-package))\n',
+     [[['any.mk:2: possible typo on suffix: ANY_CFLAGS', 'ANY_CFLAGS = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_DISTNAME', 'ANY_DISTNAME = \n'],
+       ['any.mk:5: possible typo on suffix: ANY_SETUP_TYPE', 'ANY_SETUP_TYPE = \n'],
+       ['any.mk:6: possible typo on suffix: ANY_CONF_OPTS', 'ANY_CONF_OPTS = \n'],
+       ['any.mk:7: possible typo on suffix: ANY_INSTALL_STAGING_OPTS', 'ANY_INSTALL_STAGING_OPTS = \n'],
+       ['any.mk:8: possible typo on suffix: ANY_USE_AUTOCONF', 'ANY_USE_AUTOCONF = \n']]]),
+    ('meson',
+     'any.mk',
+     'ANY_BUILD_OPTS = \n'
+     'ANY_CFLAGS = \n'
+     'ANY_ROCKSPEC = \n'
+     'ANY_DISTNAME = \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_CONF_OPTS = \n'
+     'HOST_ANY_INSTALL_STAGING_OPTS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     '$(eval $(host-meson-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_BUILD_OPTS', 'ANY_BUILD_OPTS = \n'],
+       ['any.mk:3: possible typo on suffix: ANY_ROCKSPEC', 'ANY_ROCKSPEC = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_DISTNAME', 'ANY_DISTNAME = \n'],
+       ['any.mk:5: possible typo on suffix: ANY_SETUP_TYPE', 'ANY_SETUP_TYPE = \n'],
+       ['any.mk:7: possible typo on suffix: HOST_ANY_INSTALL_STAGING_OPTS', 'HOST_ANY_INSTALL_STAGING_OPTS = \n'],
+       ['any.mk:8: possible typo on suffix: ANY_USE_AUTOCONF', 'ANY_USE_AUTOCONF = \n']]]),
+    ('perl',
+     'any.mk',
+     'ANY_BUILD_OPTS = \n'
+     'ANY_CFLAGS = \n'
+     'ANY_ROCKSPEC = \n'
+     'ANY_DISTNAME = \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_CONF_OPTS = \n'
+     'ANY_INSTALL_STAGING_OPTS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     '$(eval $(perl-package))\n',
+     [[['any.mk:2: possible typo on suffix: ANY_CFLAGS', 'ANY_CFLAGS = \n'],
+       ['any.mk:3: possible typo on suffix: ANY_ROCKSPEC', 'ANY_ROCKSPEC = \n'],
+       ['any.mk:5: possible typo on suffix: ANY_SETUP_TYPE', 'ANY_SETUP_TYPE = \n'],
+       ['any.mk:7: possible typo on suffix: ANY_INSTALL_STAGING_OPTS', 'ANY_INSTALL_STAGING_OPTS = \n'],
+       ['any.mk:8: possible typo on suffix: ANY_USE_AUTOCONF', 'ANY_USE_AUTOCONF = \n']]]),
+    ('python',
+     'any.mk',
+     'ANY_BUILD_OPTS = \n'
+     'ANY_CFLAGS = \n'
+     'ANY_ROCKSPEC = \n'
+     'ANY_DISTNAME = \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_CONF_OPTS = \n'
+     'ANY_INSTALL_STAGING_OPTS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SYNC_QT_HEADERS = \n'
+     '$(eval $(host-python-package))\n',
+     [[['any.mk:2: possible typo on suffix: ANY_CFLAGS', 'ANY_CFLAGS = \n'],
+       ['any.mk:3: possible typo on suffix: ANY_ROCKSPEC', 'ANY_ROCKSPEC = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_DISTNAME', 'ANY_DISTNAME = \n'],
+       ['any.mk:6: possible typo on suffix: ANY_CONF_OPTS', 'ANY_CONF_OPTS = \n'],
+       ['any.mk:8: possible typo on suffix: ANY_USE_AUTOCONF', 'ANY_USE_AUTOCONF = \n'],
+       ['any.mk:11: possible typo on suffix: ANY_SYNC_QT_HEADERS', 'ANY_SYNC_QT_HEADERS = \n']]]),
+    ('qmake + host generic',
+     'any.mk',
+     'ANY_BUILD_OPTS = \n'
+     'ANY_CFLAGS = \n'
+     'ANY_ROCKSPEC = \n'
+     'ANY_DISTNAME = \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_CONF_OPTS = \n'
+     'ANY_INSTALL_TARGET_OPTS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SYNC_QT_HEADERS = \n'
+     '$(eval $(qmake-package))\n'
+     '$(eval $(host-generic-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_BUILD_OPTS', 'ANY_BUILD_OPTS = \n'],
+       ['any.mk:2: possible typo on suffix: ANY_CFLAGS', 'ANY_CFLAGS = \n'],
+       ['any.mk:3: possible typo on suffix: ANY_ROCKSPEC', 'ANY_ROCKSPEC = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_DISTNAME', 'ANY_DISTNAME = \n'],
+       ['any.mk:5: possible typo on suffix: ANY_SETUP_TYPE', 'ANY_SETUP_TYPE = \n'],
+       ['any.mk:8: possible typo on suffix: ANY_USE_AUTOCONF', 'ANY_USE_AUTOCONF = \n']]]),
+    ('rebar',
+     'any.mk',
+     'ANY_BUILD_OPTS = \n'
+     'ANY_CFLAGS = \n'
+     'ANY_ROCKSPEC = \n'
+     'ANY_DISTNAME = \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_CONF_OPTS = \n'
+     'ANY_INSTALL_STAGING_OPTS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SYNC_QT_HEADERS = \n'
+     '$(eval $(rebar-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_BUILD_OPTS', 'ANY_BUILD_OPTS = \n'],
+       ['any.mk:2: possible typo on suffix: ANY_CFLAGS', 'ANY_CFLAGS = \n'],
+       ['any.mk:3: possible typo on suffix: ANY_ROCKSPEC', 'ANY_ROCKSPEC = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_DISTNAME', 'ANY_DISTNAME = \n'],
+       ['any.mk:5: possible typo on suffix: ANY_SETUP_TYPE', 'ANY_SETUP_TYPE = \n'],
+       ['any.mk:11: possible typo on suffix: ANY_SYNC_QT_HEADERS', 'ANY_SYNC_QT_HEADERS = \n']]]),
+    ('toolchain-external',
+     'any.mk',
+     'ANY_BUILD_OPTS = \n'
+     'ANY_CFLAGS = \n'
+     'ANY_CONF_OPTS = \n'
+     'ANY_INSTALL_STAGING_OPTS = \n'
+     'ANY_INSTALL_STAGING = \n'
+     'ANY_INSTALL_STAGING_CMDS = \n'
+     'ANY_IS_VIRTUAL= \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SYNC_QT_HEADERS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_WAF = \n'
+     '$(eval $(toolchain-external-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_BUILD_OPTS', 'ANY_BUILD_OPTS = \n'],
+       ['any.mk:2: possible typo on suffix: ANY_CFLAGS', 'ANY_CFLAGS = \n'],
+       ['any.mk:3: possible typo on suffix: ANY_CONF_OPTS', 'ANY_CONF_OPTS = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_INSTALL_STAGING_OPTS', 'ANY_INSTALL_STAGING_OPTS = \n'],
+       ['any.mk:7: possible typo on suffix: ANY_IS_VIRTUAL', 'ANY_IS_VIRTUAL= \n'],
+       ['any.mk:9: possible typo on suffix: ANY_SETUP_TYPE', 'ANY_SETUP_TYPE = \n'],
+       ['any.mk:10: possible typo on suffix: ANY_SUBDIR', 'ANY_SUBDIR = \n'],
+       ['any.mk:11: possible typo on suffix: ANY_SYNC_QT_HEADERS', 'ANY_SYNC_QT_HEADERS = \n'],
+       ['any.mk:12: possible typo on suffix: ANY_USE_AUTOCONF', 'ANY_USE_AUTOCONF = \n'],
+       ['any.mk:13: possible typo on suffix: ANY_WAF', 'ANY_WAF = \n']]]),
+    ('virtual',
+     'any.mk',
+     'ANY_BUILD_OPTS ?= \n'
+     'ANY_CFLAGS := \n'
+     'ANY_CONF_OPTS = \n'
+     'ANY_INSTALL_STAGING_OPTS = \n'
+     'ANY_IS_VIRTUAL= \n'
+     'ANY_PRE_PATCH_HOOKS += \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SYNC_QT_HEADERS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_WAF = \n'
+     '$(eval $(virtual-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_BUILD_OPTS', 'ANY_BUILD_OPTS ?= \n'],
+       ['any.mk:2: possible typo on suffix: ANY_CFLAGS', 'ANY_CFLAGS := \n'],
+       ['any.mk:3: possible typo on suffix: ANY_CONF_OPTS', 'ANY_CONF_OPTS = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_INSTALL_STAGING_OPTS', 'ANY_INSTALL_STAGING_OPTS = \n'],
+       ['any.mk:7: possible typo on suffix: ANY_SETUP_TYPE', 'ANY_SETUP_TYPE = \n'],
+       ['any.mk:8: possible typo on suffix: ANY_SUBDIR', 'ANY_SUBDIR = \n'],
+       ['any.mk:9: possible typo on suffix: ANY_SYNC_QT_HEADERS', 'ANY_SYNC_QT_HEADERS = \n'],
+       ['any.mk:10: possible typo on suffix: ANY_USE_AUTOCONF', 'ANY_USE_AUTOCONF = \n'],
+       ['any.mk:11: possible typo on suffix: ANY_WAF', 'ANY_WAF = \n']]]),
+    ('waf',
+     'any.mk',
+     'ANY_BUILD_OPTS = \n'
+     'ANY_CFLAGS = \n'
+     'ANY_CONF_OPTS = \n'
+     'ANY_INSTALL_STAGING_OPTS = \n'
+     'ANY_IS_VIRTUAL= \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SYNC_QT_HEADERS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_WAF = \n'
+     '$(eval $(waf-package))\n',
+     [[['any.mk:2: possible typo on suffix: ANY_CFLAGS', 'ANY_CFLAGS = \n'],
+       ['any.mk:5: possible typo on suffix: ANY_IS_VIRTUAL', 'ANY_IS_VIRTUAL= \n'],
+       ['any.mk:7: possible typo on suffix: ANY_SETUP_TYPE', 'ANY_SETUP_TYPE = \n'],
+       ['any.mk:9: possible typo on suffix: ANY_SYNC_QT_HEADERS', 'ANY_SYNC_QT_HEADERS = \n'],
+       ['any.mk:10: possible typo on suffix: ANY_USE_AUTOCONF', 'ANY_USE_AUTOCONF = \n']]]),
+    ('SUBDIR no use',
+     'any.mk',
+     'ANY_SUBDIR = \n'
+     'define ANY_INSTALL_TARGET_CMDS\n'
+     '\tmake\n'
+     'endef\n'
+     '$(eval $(generic-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_SUBDIR', 'ANY_SUBDIR = \n']]]),
+    ('SUBDIR explicit use',
+     'any.mk',
+     'ANY_SUBDIR = \n'
+     'define ANY_INSTALL_TARGET_CMDS\n'
+     '\tmake $(ANY_SUBDIR)\n'
+     'endef\n'
+     '$(eval $(generic-package))\n',
+     [[]]),
+    ('SUBDIR indirect use 1',
+     'any.mk',
+     'ANY_SUBDIR = \n'
+     'define ANY_INSTALL_TARGET_CMDS\n'
+     '\tmake $(ANY_SRCDIR)\n'
+     'endef\n'
+     '$(eval $(generic-package))\n',
+     [[]]),
+    ('SUBDIR indirect use 2',
+     'any.mk',
+     'ANY_SUBDIR = \n'
+     'define ANY_INSTALL_TARGET_CMDS\n'
+     '\tmake $(ANY_BUILDDIR)\n'
+     'endef\n'
+     '$(eval $(generic-package))\n',
+     [[]]),
+    ('SUBDIR indirect use 3',
+     'any.mk',
+     'ANY_SUBDIR = \n'
+     'define ANY_LINUX_CONFIG_FIXUPS\n'
+     '\t$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)\n'
+     'endef\n'
+     '$(eval $(generic-package))\n',
+     [[]]),
+    ('SUBDIR indirect use 4',
+     'any.mk',
+     'ANY_SUBDIR = \n'
+     'define ANY_LINUX_CONFIG_FIXUPS\n'
+     '\t$(call KCONFIG_SET_OPT,CONFIG_BPF_SYSCALL)\n'
+     'endef\n'
+     '$(eval $(generic-package))\n',
+     [[]]),
+    ('SUBDIR indirect use 5',
+     'any.mk',
+     'ANY_SUBDIR = \n'
+     'define ANY_LINUX_CONFIG_FIXUPS\n'
+     '\t$(call KCONFIG_DISABLE_OPT,CONFIG_BPF_SYSCALL)\n'
+     'endef\n'
+     '$(eval $(kconfig-package))\n',
+     [[]]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', TypoInVariableSuffix)
+def test_TypoInVariableSuffix(testname, filename, string, expected):
+    warnings = util.check_file(m.TypoInVariableSuffix, filename, string)
+    assert warnings == expected
+
+
 UselessFlag = [
     ('autoreconf no',
      'any.mk',
-- 
2.34.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

