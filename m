Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D360AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 23:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8375683EF9;
	Tue, 11 Jan 2022 23:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Bo2_VOjMTyb; Tue, 11 Jan 2022 23:35:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA9D883EED;
	Tue, 11 Jan 2022 23:35:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2BEF1BF489
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 23:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DB7640139
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 23:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v81UOEzUuN_l for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 23:34:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C91140132
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 23:34:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 60E3582650; Tue, 11 Jan 2022 23:28:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 23:39:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24d07fdc1404901fb1872ac55f875fe1d555cbb3
X-Git-Newrev: 7f1f3f87868fa333833dbba9f4f07adc338b34ed
X-Patchwork-Hint: ignore
Message-Id: <20220111232835.60E3582650@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alchemy: new host package
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
Content-Type: multipart/mixed; boundary="===============1066240639012959524=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1066240639012959524==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7f1f3f87868fa333833dbba9f4f07adc338b34ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Alchemy is a build system developed by Parrot.

It is a new build system based on the one used in Android.
A central makefile instance scans a workspace to find user
makefiles, includes them and register modules to be built.

https://github.com/Parrot-Developers/alchemy

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
[yann.morin.1998@free.fr: implicit package name with $($(PKG)_NAME)]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  1 +
 ...1-toolchains-remove-hash-style-management.patch | 36 +++++++++++
 package/alchemy/alchemy.hash                       |  4 ++
 package/alchemy/alchemy.mk                         | 70 ++++++++++++++++++++++
 package/alchemy/atom.mk.in                         |  8 +++
 5 files changed, 119 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bcc54bd11b..33b9c1cd73 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1190,6 +1190,7 @@ F:	package/netopeer2/
 F:	package/sysrepo/
 
 N:	Hervé Codina <herve.codina@bootlin.com>
+F:	package/alchemy/
 F:	package/dtbocfg/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
diff --git a/package/alchemy/0001-toolchains-remove-hash-style-management.patch b/package/alchemy/0001-toolchains-remove-hash-style-management.patch
new file mode 100644
index 0000000000..522766b977
--- /dev/null
+++ b/package/alchemy/0001-toolchains-remove-hash-style-management.patch
@@ -0,0 +1,36 @@
+From 4cb9681ab99db3d8e330ac789e17ec69583aecd4 Mon Sep 17 00:00:00 2001
+From: Herve Codina <herve.codina@bootlin.com>
+Date: Thu, 28 Oct 2021 18:39:18 +0200
+Subject: [PATCH] toolchains: remove --hash-style management
+
+Using an external toolchain, with an external configuration given
+using TARGET_GLOBAL_XXXX variables, having '--hash-style=both'
+in Alchemy toolchains can lead to compilation failure.
+
+This patch simply removes all --hash-style settings.
+
+Signed-off-by: Herve Codina <herve.codina@bootlin.com>
+---
+ toolchains/linux/eglibc/flags.mk | 9 +--------
+ 1 file changed, 1 insertion(+), 8 deletions(-)
+
+diff --git a/toolchains/linux/eglibc/flags.mk b/toolchains/linux/eglibc/flags.mk
+index 95c0a46..4474729 100644
+--- a/toolchains/linux/eglibc/flags.mk
++++ b/toolchains/linux/eglibc/flags.mk
+@@ -11,11 +11,4 @@ TARGET_GLOBAL_LDLIBS += -pthread -lrt
+ TARGET_GLOBAL_CFLAGS += -funwind-tables
+ 
+ # Enable link optimization for binutils's ld.
+-# gnu hash not supported by mips ABI
+-ifeq ("$(TARGET_ARCH)","mips")
+-  TARGET_GLOBAL_LDFLAGS += -Wl,-O1
+-else ifeq ("$(TARGET_ARCH)","mips64")
+-  TARGET_GLOBAL_LDFLAGS += -Wl,-O1
+-else
+-  TARGET_GLOBAL_LDFLAGS += -Wl,-O1,--hash-style=both
+-endif
++TARGET_GLOBAL_LDFLAGS += -Wl,-O1
+-- 
+2.31.1
+
diff --git a/package/alchemy/alchemy.hash b/package/alchemy/alchemy.hash
new file mode 100644
index 0000000000..33895263cc
--- /dev/null
+++ b/package/alchemy/alchemy.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256  346c06b9317691a9371d878b850e61f8bcec4f20132ac95340b9d2571be25ee8  alchemy-d95b3c38cd37814a1b98d0bbf813de7adaaecfbc.tar.gz
+sha256  542f44eecd9f8806ec1ae285201e442ab547c82d9f8c70e44c977d6332a2bea0  COPYING
+sha256  49872815ee3de163f07a83737c996e77a5bffa186d06b1e3bb969bfb68c251df  README
diff --git a/package/alchemy/alchemy.mk b/package/alchemy/alchemy.mk
new file mode 100644
index 0000000000..18cdd0a645
--- /dev/null
+++ b/package/alchemy/alchemy.mk
@@ -0,0 +1,70 @@
+################################################################################
+#
+# alchemy
+#
+################################################################################
+
+ALCHEMY_VERSION = d95b3c38cd37814a1b98d0bbf813de7adaaecfbc
+ALCHEMY_SITE = $(call github,Parrot-Developers,alchemy,$(ALCHEMY_VERSION))
+ALCHEMY_LICENSE = BSD-3-Clause (Alchemy), GPL-2.0 (kconfig)
+ALCHEMY_LICENSE_FILES = COPYING README
+HOST_ALCHEMY_DEPENDENCIES = host-python3
+
+ALCHEMY_HOME = $(HOST_DIR)/opt/alchemy
+ALCHEMY_SDK_BASEDIR = $(STAGING_DIR)/usr/lib/alchemy/sdk
+
+define HOST_ALCHEMY_INSTALL_CMDS
+	mkdir -p $(ALCHEMY_HOME)
+	cp -rf $(@D)/* $(ALCHEMY_HOME)
+	cp $(HOST_ALCHEMY_PKGDIR)/atom.mk.in $(ALCHEMY_HOME)/atom.mk.in
+endef
+
+$(eval $(host-generic-package))
+
+# Variables used by other packages
+
+ALCHEMY_MAKE = $(ALCHEMY_HOME)/scripts/alchemake
+
+# TARGET_ARCH is set to 'xxx' to avoid Alchemy managing the architecture.
+# When Alchemy manages the architecture, it can add some flags to CFGLAGS and
+# can lead to incorrect result with the toolchain provided in TARGET_CROSS.
+# 'xxx' is an unknown architecture for Alchemy. Using this value is a simple
+# way to disable the Alchemy architecture management.
+ALCHEMY_TARGET_ENV = \
+	$(TARGET_MAKE_ENV) \
+	ALCHEMY_HOME=$(ALCHEMY_HOME) \
+	ALCHEMY_WORKSPACE_DIR="$(@D)" \
+	ALCHEMY_TARGET_OUT=alchemy-out \
+	TARGET_OS=linux \
+	TARGET_OS_FLAVOUR=buildroot \
+	TARGET_CROSS="$(TARGET_CROSS)" \
+	TARGET_ARCH=xxx \
+	TARGET_GLOBAL_CXXFLAGS="$(TARGET_CXXFLAGS)" \
+	TARGET_GLOBAL_LDFLAGS="$(TARGET_LDFLAGS)" \
+	TARGET_GLOBAL_FFLAGS="$(TARGET_FCFLAGS)" \
+	TARGET_GLOBAL_FCFLAGS="$(TARGET_FCFLAGS)"
+
+ifeq ($(BR2_STATIC_LIBS),y)
+ALCHEMY_TARGET_ENV += \
+	TARGET_FORCE_STATIC=1 \
+	TARGET_GLOBAL_CFLAGS="$(TARGET_CFLAGS)"
+else
+ALCHEMY_TARGET_ENV += \
+	TARGET_GLOBAL_CFLAGS="$(TARGET_CFLAGS) -fPIC"
+endif
+
+# Install an Alchemy SDK file.
+# This macro can be used by Alchemy packages
+# $1: Alchemy module name
+# $2: Alchemy module file name
+# $3: Alchemy module libraries this module depends on
+define ALCHEMY_INSTALL_LIB_SDK_FILE
+	$(INSTALL) -m 0644 -D \
+		$(ALCHEMY_HOME)/atom.mk.in \
+		$(ALCHEMY_SDK_BASEDIR)/$($(PKG)_NAME)/atom.mk
+	$(SED) 's#@STAGING_DIR@#$(STAGING_DIR)#' \
+		-e 's#@MODULE@#$(strip $(1))#' \
+		-e 's#@MODULE_FILENAME@#$(strip $(2))#' \
+		-e 's#@LIBRARIES@#$(strip $(3))#' \
+		$(ALCHEMY_SDK_BASEDIR)/$($(PKG)_NAME)/atom.mk
+endef
diff --git a/package/alchemy/atom.mk.in b/package/alchemy/atom.mk.in
new file mode 100644
index 0000000000..084ae0e89f
--- /dev/null
+++ b/package/alchemy/atom.mk.in
@@ -0,0 +1,8 @@
+LOCAL_PATH := $(call my-dir)
+include $(CLEAR_VARS)
+LOCAL_MODULE := @MODULE@
+LOCAL_SDK := @STAGING_DIR@
+LOCAL_DESTDIR := usr/lib
+LOCAL_MODULE_FILENAME := @MODULE_FILENAME@
+LOCAL_LIBRARIES := @LIBRARIES@
+include $(BUILD_LIBRARY)

--===============1066240639012959524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1066240639012959524==--
