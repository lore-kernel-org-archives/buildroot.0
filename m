From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 14:50:39 +0200
Subject: [Buildroot] [PATCH 3/3 v3] aufs-util: new package
In-Reply-To: <cover.1468759218.git.yann.morin.1998@free.fr>
References: <cover.1468759218.git.yann.morin.1998@free.fr>
Message-ID: <e5d42509736f56a587767b61bf0f9ceb8efd41e4.1468759218.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christian Stewart <christian@paral.in>

Signed-off-by: Christian Stewart <christian@paral.in>
[Atul:
 - Updated the default to empty.
 - Updated the license to GPLv2.
 - Used patches instead of SED commands.
 - CC and LD are replaced by TARGET_CC and TARGET_LD.
]
Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
[yann.morin.1998 at free.fr:
  - drop the headers_install command
  - instead, instruct the kernel to install them
  - add patches 0002..0004
  - properly build the host tools
  - don't depend on the aufs extension, for kernel already patched
  - fix comment
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                                  |  1 +
 package/aufs-util/0001-remove-user-settings.patch  | 16 +++++++++
 package/aufs-util/0002-no-check-ver.patch          | 24 +++++++++++++
 package/aufs-util/0003-no-strip-lib.patch          | 18 ++++++++++
 package/aufs-util/0004-no-override-readdir64.patch | 27 ++++++++++++++
 package/aufs-util/Config.in                        | 36 +++++++++++++++++++
 package/aufs-util/aufs-util.mk                     | 41 ++++++++++++++++++++++
 7 files changed, 163 insertions(+)
 create mode 100644 package/aufs-util/0001-remove-user-settings.patch
 create mode 100644 package/aufs-util/0002-no-check-ver.patch
 create mode 100644 package/aufs-util/0003-no-strip-lib.patch
 create mode 100644 package/aufs-util/0004-no-override-readdir64.patch
 create mode 100644 package/aufs-util/Config.in
 create mode 100644 package/aufs-util/aufs-util.mk

diff --git a/package/Config.in b/package/Config.in
index a9b004b..8a81c93 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -148,6 +148,7 @@ endmenu
 
 menu "Filesystem and flash utilities"
 	source "package/aufs/Config.in"
+	source "package/aufs-util/Config.in"
 	source "package/autofs/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
diff --git a/package/aufs-util/0001-remove-user-settings.patch b/package/aufs-util/0001-remove-user-settings.patch
new file mode 100644
index 0000000..7eebc95
--- /dev/null
+++ b/package/aufs-util/0001-remove-user-settings.patch
@@ -0,0 +1,16 @@
+install: drop setting ownership
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/Makefile b/Makefile
+--- a/Makefile
++++ b/Makefile
+@@ -21,7 +21,7 @@
+ override CPPFLAGS += -DAUFHSM_CMD=\"/usr/bin/aufhsm\"
+ override CFLAGS += -O -Wall
+ INSTALL ?= install
+-Install = ${INSTALL} -o root -g root -p
++Install = ${INSTALL} -p
+ ManDir = /usr/share/man
+ 
+ #
diff --git a/package/aufs-util/0002-no-check-ver.patch b/package/aufs-util/0002-no-check-ver.patch
new file mode 100644
index 0000000..5fe6920
--- /dev/null
+++ b/package/aufs-util/0002-no-check-ver.patch
@@ -0,0 +1,24 @@
+Makefile: do not check version
+
+The aufs-util package tries to ensure that its version is compatible
+with the one in the running kernel. However, this test is flawed: the
+version string in the aufs4x branch for aufs-util is aufs3.x, so it does
+not match the version in the kernel when it is aufs4.x.
+
+Disengage this check, ion the assumption the user knows what he is
+doing.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/Makefile b/Makefile
+--- a/Makefile
++++ b/Makefile
+@@ -62,7 +62,7 @@
+ $(foreach v, CPPFLAGS CFLAGS INSTALL Install ManDir LibUtilHdr, \
+ 	$(eval MAKE += ${v}="$${${v}}"))
+ 
+-all: ver_test ${Man} ${Bin} ${Etc}
++all: ${Man} ${Bin} ${Etc}
+ 	${MAKE} -C libau $@
+ 	ln -sf ./libau/libau*.so .
+ 	$(call MakeFHSM, $@)
diff --git a/package/aufs-util/0003-no-strip-lib.patch b/package/aufs-util/0003-no-strip-lib.patch
new file mode 100644
index 0000000..1583050
--- /dev/null
+++ b/package/aufs-util/0003-no-strip-lib.patch
@@ -0,0 +1,18 @@
+install: do not strip libs when installing
+
+We want unstripped binaries in staging; stripping is done by Buildroot
+as a whole in target-finalize if needed, anyway.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/libau/Makefile b/libau/Makefile
+--- a/libau/Makefile
++++ b/libau/Makefile
+@@ -37,7 +37,6 @@
+ 	ln -sf $< $@
+ ${LibSo}.${LibSoMajor}: ${LibSo}.${LibSoMajor}.${LibSoMinor}
+ 	ln -sf $< $@
+-${LibSo}.${LibSoMajor}.${LibSoMinor}: override LDFLAGS += -s
+ ${LibSo}.${LibSoMajor}.${LibSoMinor}: override LDLIBS += -ldl -lpthread
+ ${LibSo}.${LibSoMajor}.${LibSoMinor}: ${LibSoObj}
+ 	${CC} --shared -Wl,-soname,${LibSo}.${LibSoMajor} ${LDFLAGS} \
diff --git a/package/aufs-util/0004-no-override-readdir64.patch b/package/aufs-util/0004-no-override-readdir64.patch
new file mode 100644
index 0000000..da0693b
--- /dev/null
+++ b/package/aufs-util/0004-no-override-readdir64.patch
@@ -0,0 +1,27 @@
+libaufs: do not include rdu64
+
+rdu64 is supposed to provide the LFS variant of readdir(), readdir64().
+
+However, because Buildroot is always LFS0-enabled, readdir() is always
+the LFS variant.
+
+Besides, the comment about rdu64 is utterly wrong: it refers to 64-bit
+systems, when in fact it really is about support for LFS.
+
+Drop it from the build, as it causes build failures due to multiple
+implementations of readdir64().
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/libau/Makefile b/libau/Makefile
+--- a/libau/Makefile
++++ b/libau/Makefile
+@@ -18,7 +18,7 @@
+ LibSoMinor = 7
+ LibSo = libau.so
+ LibSoObj = libau.o \
+-	rdu_lib.o rdu.o rdu64.o \
++	rdu_lib.o rdu.o \
+ 	pathconf.o
+ LibSoHdr = libau.h rdu.h
+ 
diff --git a/package/aufs-util/Config.in b/package/aufs-util/Config.in
new file mode 100644
index 0000000..6896c0c
--- /dev/null
+++ b/package/aufs-util/Config.in
@@ -0,0 +1,36 @@
+comment "aufs-util needs a linux kernel and a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_LINUX_KERNEL || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_AUFS_UTIL
+	bool "aufs-util"
+	depends on BR2_USE_MMU
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_LINUX_NEEDS_RUNTIME_HEADERS
+	help
+	  Aufs command line utilities.
+
+	  Needs a kernel with aufs support. A kernel
+	  extension package is available.
+
+	  http://sourceforge.net/p/aufs/aufs-util/
+
+if BR2_PACKAGE_AUFS_UTIL
+
+config BR2_PACKAGE_AUFS_UTIL_VERSION
+	string "aufs-util version"
+	default ""
+	help
+	  The version you choose must match that of the uafs support
+	  in your kernel. Usually, this is aufs3.x for kerenls 3.x and
+	  aufs4.x for kernels 4.x.
+
+	  Usually, the sha1 of the cset you want to use; avoid using a
+	  branch name as this yields non-reproducible builds.
+
+	  See the following resources to see what versions are available:
+
+	  https://sourceforge.net/p/aufs/aufs-util/ci/master/tree/
+
+endif
diff --git a/package/aufs-util/aufs-util.mk b/package/aufs-util/aufs-util.mk
new file mode 100644
index 0000000..91be9ab
--- /dev/null
+++ b/package/aufs-util/aufs-util.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# aufs-util
+#
+################################################################################
+
+# linux-headers
+AUFS_UTIL_VERSION = $(call qstrip,$(BR2_PACKAGE_AUFS_UTIL_VERSION))
+AUFS_UTIL_SITE = http://git.code.sf.net/p/aufs/aufs-util
+AUFS_UTIL_SITE_METHOD = git
+AUFS_UTIL_LICENSE = GPLv2
+AUFS_UTIL_LICENSE_FILES = COPYING
+
+AUFS_UTIL_DEPENDENCIES = linux
+
+AUFS_UTIL_HOST_CPPFLAGS = \
+	$(HOST_CPPFLAGS) \
+	-I$(LINUX_RUNTIME_HEADERS_DIR)/include
+
+AUFS_UTIL_CPPFLAGS = \
+	$(TARGET_CPPFLAGS) \
+	-I$(LINUX_RUNTIME_HEADERS_DIR)/include
+
+# First, we build the host tools, needed to build the target tools.
+define AUFS_UTIL_BUILD_CMDS
+	$(MAKE) -C $(@D) \
+		$(HOST_CONFIGURE_OPTS) \
+		CPPFLAGS="$(AUFS_UTIL_HOST_CPPFLAGS)" \
+		HOSTCC="$(HOSTCC)" HOSTLD="$(HOSTLD)" \
+		INSTALL="$(INSTALL)" c2sh c2tmac
+	$(MAKE1) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS) \
+		CPPFLAGS="$(AUFS_UTIL_CPPFLAGS)" \
+		INSTALL="$(INSTALL)" all
+endef
+
+define AUFS_UTIL_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) INSTALL="$(INSTALL)" DESTDIR="$(TARGET_DIR)" install
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
