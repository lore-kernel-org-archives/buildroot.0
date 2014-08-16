From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Aug 2014 16:39:51 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: add mechanism to install the
	getent program
In-Reply-To: <1408199992-26942-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408199992-26942-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1408199992-26942-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ecryptfs-utils scripts require the 'getent' program to be
installed to find the home directory of users. However, Buildroot
currently never installs this program, and therefore bug #7142 was
reported, explaining that ecryptfs-utils is not working properly.

In normal Linux systems, the getent program is provided by glibc, and
allows to query not only /etc/passwd, but also other NSS databases
such as LDAP and others.

In the context of Buildroot, this gives us several cases:

 1/ Internal toolchain

    a/ glibc/eglibc. In this case, the getent program is already built
       and installed by Buildroot in the staging directory, so the
       only thing missing is installing it in the target directory.

    b/ uclibc. uClibc provides a simple shell script that emulates the
       behavior of getent. It is located in extra/scripts/getent in
       the uClibc sources, but is currently never installed.

    c/ musl. There seems to be no getent implementation, and musl does
       not support NSS.

 2/ External toolchain

    a/ glibc/eglibc. In several external toolchains that we tested,
       there is a pre-built getent binary available in the sysroot,
       but Buildroot is not installing it to the target.

    b/ uclibc. The getent wrapper script is typically not part of any
       external uClibc toolchain.

    c/ musl. There is no getent implementation.

This patch proposes to solve this problem by introducing a hidden
BR2_TOOLCHAIN_INSTALL_GETENT Config.in option, which packages needing
'getent' should select, and that toolchain packages should use to know
whether getent should be installed or not.

On the toolchain side of things, the behavior is as follows:

 - For 1/ a/ above, the glibc package is modified to install the
   getent program that was built.

 - For 1/ b/ above, the uclibc package is modified to install the
   getent wrapper script available as part of the uClibc sources.

 - For 1/ c/ above, the musl package is modified to depend on the new
   'getent' package, which simply bundles the 'getent' wrapper script
   of uClibc 0.9.33.

 - For 2/ a/ above, the toolchain-external package installs the
   'getent' program that is available as part of the external
   toolchain sysroot.

 - For 2/ b/ and 2/ c/ above, the toolchain-external package depends
   on the new 'getent' package.

This solution allows to install a NSS-capable getent when glibc/eglibc
is used, and otherwise to rely on uClibc's wrapper script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/getent/getent                              | 45 ++++++++++++++++++++++
 package/getent/getent.mk                           | 22 +++++++++++
 package/glibc/glibc.mk                             |  7 ++++
 package/musl/musl.mk                               |  5 +++
 package/uclibc/uclibc.mk                           |  7 ++++
 toolchain/toolchain-common.in                      |  6 +++
 toolchain/toolchain-external/toolchain-external.mk | 14 +++++++
 7 files changed, 106 insertions(+)
 create mode 100644 package/getent/getent
 create mode 100644 package/getent/getent.mk

diff --git a/package/getent/getent b/package/getent/getent
new file mode 100644
index 0000000..fdda793
--- /dev/null
+++ b/package/getent/getent
@@ -0,0 +1,45 @@
+#!/bin/sh
+# $Header: /var/cvs/uClibc/extra/scripts/getent,v 1.2 2005/02/02 14:18:01 solar Exp $
+#
+# Closely (not perfectly) emulate the behavior of glibc's getent utility
+#
+#passwd|shadow|group|aliases|hosts|networks|ethers|netgroup|protocols|services|rpc
+# only returns the first match (by design)
+# dns based search is not supported (hosts,networks)
+# case-insensitive matches not supported (ethers; others?)
+# may return false-positives (hosts,protocols,rpc,services,ethers)
+#
+# Taken from uClibc 0.9.33.
+
+export PATH="${PATH}:/bin:/usr/bin"
+
+file="/etc/$1"
+case $1 in
+	passwd|group)
+		match="^$2:\|^[^:]*:[^:]*:$2:" ;;
+	shadow)
+		match="^$2:" ;;
+	networks|netgroup)
+		match="^[[:space:]]*$2\>" ;;
+	hosts|protocols|rpc|services|ethers)
+		match="\<$2\>" ;;
+	aliases)
+		match="^[[:space:]]*$2[[:space:]]*:" ;;
+	""|-h|--help)
+		echo "USAGE: $0 database [key]"
+		exit 0 ;;
+	*)
+		echo "$0: Unknown database: $1" 1>&2
+		exit 1 ;;
+esac
+
+if [ ! -f "$file" ] ; then
+	echo "$0: Could not find database file for $1" 1>&2
+	exit 1
+fi
+
+if [ $# -eq 1 ] ; then
+	exec cat "$file"
+else
+	sed "s/#.*//; /$match/q; d" "$file" | grep . || exit 2
+fi
diff --git a/package/getent/getent.mk b/package/getent/getent.mk
new file mode 100644
index 0000000..5449977
--- /dev/null
+++ b/package/getent/getent.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# getent
+#
+################################################################################
+
+# source included in Buildroot
+GETENT_SOURCE =
+
+GETENT_VERSION = buildroot-$(BR2_VERSION)
+GETENT_LICENSE = LGPLv2.1+
+
+# getent is installed by the C library packages (internal toolchain
+# backend) or the toolchain-external package, so it should not depend
+# on the toolchain, otherwise we would have a circular dependency.
+GETENT_ADD_TOOLCHAIN_DEPENDENCY = NO
+
+define GETENT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 package/getent/getent $(TARGET_DIR)/usr/bin/getent
+endef
+
+$(eval $(generic-package))
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 4cbca88..f0db677 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -120,10 +120,17 @@ ifeq ($(BR2_PACKAGE_GDB),y)
 GLIBC_LIBS_LIB += libthread_db.so.*
 endif
 
+ifeq ($(BR2_TOOLCHAIN_INSTALL_GETENT),y)
+define GLIBC_INSTALL_GETENT
+	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/bin/gettent $(TARGET_DIR)/usr/bin/getent
+endef
+endif
+
 define GLIBC_INSTALL_TARGET_CMDS
 	for libs in $(GLIBC_LIBS_LIB); do \
 		$(call copy_toolchain_lib_root,$(STAGING_DIR)/,,lib,$$libs,/lib) ; \
 	done
+	$(GLIBC_INSTALL_GETENT)
 endef
 
 $(eval $(autotools-package))
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 63607f9..92395de 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -13,6 +13,11 @@ MUSL_LICENSE_FILES = COPYRIGHT
 # cross-compiler and the kernel headers
 MUSL_DEPENDENCIES = host-gcc-initial linux-headers
 
+# Musl doesn't provide its getent implementation
+ifeq ($(BR2_TOOLCHAIN_INSTALL_GETENT),y)
+MUSL_DEPENDENCIES += getent
+endif
+
 # musl is part of the toolchain so disable the toolchain dependency
 MUSL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index c68dc56..f139b06 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -501,6 +501,12 @@ define UCLIBC_INSTALL_UTILS_TARGET
 endef
 endif
 
+ifeq ($(BR2_TOOLCHAIN_INSTALL_GETENT),y)
+define UCLIBC_INSTALL_GETENT
+	$(INSTALL) -D -m 0755 $(@D)/extra/scripts/getent $(TARGET_DIR)/usr/bin/getent
+endef
+endif
+
 define UCLIBC_INSTALL_TARGET_CMDS
 	$(MAKE1) -C $(@D) \
 		$(UCLIBC_MAKE_FLAGS) \
@@ -509,6 +515,7 @@ define UCLIBC_INSTALL_TARGET_CMDS
 		RUNTIME_PREFIX=/ \
 		install_runtime
 	$(UCLIBC_INSTALL_UTILS_TARGET)
+	$(UCLIBC_INSTALL_GETENT)
 	$(UCLIBC_BUILD_TEST_SUITE)
 	$(UCLIBC_INSTALL_TEST_SUITE)
 endef
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 6d43700..b243e44 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -48,6 +48,12 @@ config BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
 	bool
 	default y if !BR2_arc
 
+# Should be selected by packages that need the 'getent' utility
+# installed on the target. Then, toolchain packages should act
+# accordingly.
+config BR2_TOOLCHAIN_INSTALL_GETENT
+	bool
+
 config BR2_ENABLE_LOCALE_PURGE
 	bool "Purge unwanted locales"
 	help
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 0955686..dc723a5 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -90,6 +90,19 @@ endif
 
 LIB_EXTERNAL_LIBS+=$(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 
+# getent handling
+ifeq ($(BR2_TOOLCHAIN_INSTALL_GETENT),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
+define TOOLCHAIN_EXTERNAL_INSTALL_GETENT
+	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/bin/getent $(TARGET_DIR)/usr/bin/getent
+endef
+else # BR2_TOOLCHAIN_EXTERNAL_GLIBC
+# uclibc and musl toolchains typically don't come with a getent
+# implementation.
+TOOLCHAIN_EXTERNAL_DEPENDENCIES += getent
+endif # BR2_TOOLCHAIN_EXTERNAL_GLIBC
+endif # BR2_TOOLCHAIN_INSTALL_GETENT
+
 # Details about sysroot directory selection.
 #
 # To find the sysroot directory, we use the trick of looking for the
@@ -680,6 +693,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
+	$(TOOLCHAIN_EXTERNAL_INSTALL_GETENT)
 endef
 
 $(eval $(generic-package))
-- 
2.0.0
