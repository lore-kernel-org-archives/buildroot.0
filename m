From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 12 Apr 2021 11:40:10 -0500
Subject: [Buildroot] [PATCH v7 1/2] package/libtalloc: new package
Message-ID: <20210412164011.16681-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: David GOUARIN <dgouarin@gmail.com>

talloc is a hierarchical, reference counted memory pool system with destructors.
It is the core memory allocator used in Samba.

Signed-off-by: David GOUARIN <dgouarin@gmail.com>
Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes
v6 -> v7
  - none

v5 -> v6
  - disable when building static libs (testpkg fix)
  - pointed to the libtalloc waf cache file (cut paste bug)
  - rebased on current master
  - Added Matt to DEVELOPERS
  - Checked if CPE exists for "libtalloc" (it does not)

v4 -> v5:
  - search for iconv in STAGING_DIR instead of HOST_DIR

v2 -> v4: (no v3, resubmitting the whole patch series)
  - fix build with BR2_PARANOID_UNSAFE_PATH (Thomas review)
  - add hashes of license files (Thomas)
  - license is GPL-3.0+ for both talloc and pytalloc (Thomas)
  - remove useless --prefix and --libdir (Thomas)

v1 -> v2:
  - merge with work from jared.bents at rockwellcollins.com, as sujested by Matthew Weber
    http://patchwork.ozlabs.org/project/buildroot/patch/20200327150225.15277-1-jared.bents at rockwellcollins.com
---
 DEVELOPERS                            |  2 +
 package/Config.in                     |  1 +
 package/libtalloc/Config.in           | 10 +++++
 package/libtalloc/libtalloc-cache.txt | 42 +++++++++++++++++++++
 package/libtalloc/libtalloc.hash      |  4 ++
 package/libtalloc/libtalloc.mk        | 54 +++++++++++++++++++++++++++
 6 files changed, 113 insertions(+)
 create mode 100644 package/libtalloc/Config.in
 create mode 100644 package/libtalloc/libtalloc-cache.txt
 create mode 100644 package/libtalloc/libtalloc.hash
 create mode 100644 package/libtalloc/libtalloc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index da48e6010b..78499f2998 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -651,6 +651,7 @@ F:	package/x264/
 
 N:	David GOUARIN <dgouarin@gmail.com>
 F:	package/librelp/
+F:	package/libtalloc/
 
 N:	David Lechner <david@lechnology.com>
 F:	board/lego/ev3/
@@ -1762,6 +1763,7 @@ F:	package/libselinux/
 F:	package/libsemanage/
 F:	package/libsepol/
 F:	package/libssh2/
+F:	package/libtalloc/
 F:	package/libqmi/
 F:	package/lighttpd/
 F:	package/logrotate/
diff --git a/package/Config.in b/package/Config.in
index bba62deefd..2bf15948b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1936,6 +1936,7 @@ menu "Other"
 	source "package/libsigc/Config.in"
 	source "package/libsigsegv/Config.in"
 	source "package/libspatialindex/Config.in"
+	source "package/libtalloc/Config.in"
 	source "package/libtasn1/Config.in"
 	source "package/libtommath/Config.in"
 	source "package/libtpl/Config.in"
diff --git a/package/libtalloc/Config.in b/package/libtalloc/Config.in
new file mode 100644
index 0000000000..bb671128fb
--- /dev/null
+++ b/package/libtalloc/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBTALLOC
+	bool "libtalloc"
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	help
+	  talloc is a hierarchical, reference counted memory pool
+	  system with destructors. It is the core memory allocator
+	  used in Samba.
+
+	  https://talloc.samba.org/talloc/doc/html/index.html
diff --git a/package/libtalloc/libtalloc-cache.txt b/package/libtalloc/libtalloc-cache.txt
new file mode 100644
index 0000000000..a2b44857da
--- /dev/null
+++ b/package/libtalloc/libtalloc-cache.txt
@@ -0,0 +1,42 @@
+Checking simple C program: OK
+rpath library support: OK
+-Wl,--version-script support: OK
+Checking getconf LFS_CFLAGS: NO
+Checking for large file support without additional flags: OK
+Checking for -D_LARGE_FILES: OK
+Checking correct behavior of strtoll: NO
+Checking for working strptime: OK
+Checking for C99 vsnprintf: OK
+Checking for HAVE_SHARED_MMAP: OK
+Checking for HAVE_MREMAP: OK
+Checking for HAVE_INCOHERENT_MMAP: NO
+Checking for HAVE_SECURE_MKSTEMP: OK
+Checking for HAVE_IFACE_GETIFADDRS: OK
+Checking for kernel change notify support: OK
+Checking for Linux kernel oplocks: OK
+Checking for kernel share modes: OK
+Checking if can we convert from CP850 to UCS-2LE: OK
+Checking if can we convert from UTF-8 to UCS-2LE: OK
+Checking whether we can use Linux thread-specific credentials with 32-bit system calls: OK
+Checking whether we can use Linux thread-specific credentials: OK
+Checking whether setreuid is available: OK
+Checking whether setresuid is available: OK
+Checking whether seteuid is available: OK
+Checking whether fcntl locking is available: OK
+Checking whether fcntl lock supports open file description locks: OK
+Checking for the maximum value of the 'time_t' type: OK
+Checking whether the realpath function allows a NULL argument: OK
+Checking whether POSIX capabilities are available: OK
+Checking for ftruncate extend: OK
+vfs_fileid checking for statfs() and struct statfs.f_fsid: OK
+getcwd takes a NULL argument: OK
+Checking uname sysname type: "Linux"
+Checking uname release type: "5.4.0"
+Checking uname version type: "#1 Tue Oct 1 00:00:00 UTC 2020"
+Checking value of NSIG: "65"
+Checking value of _NSIG: "65"
+Checking value of SIGRTMAX: "64"
+Checking value of SIGRTMIN: "34"
+Checking errno of iconv for illegal multibyte sequence: "0"
+checking for clnt_create(): OK
+Checking for a 64-bit host to support lmdb: NO
diff --git a/package/libtalloc/libtalloc.hash b/package/libtalloc/libtalloc.hash
new file mode 100644
index 0000000000..9d48a965d0
--- /dev/null
+++ b/package/libtalloc/libtalloc.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  ef4822d2fdafd2be8e0cabc3ec3c806ae29b8268e932c5e9a4cd5585f37f9f77  talloc-2.3.1.tar.gz
+sha256  15c2767545d1e43dc35832736253bde5be956f8ffec0474a6d0f70349b646ed3  talloc.h
+sha256  8742f2dad3aaf885c7b4b699c20bfa0e9edeab380689f91a88aa90af03e6947b  pytalloc.h
diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
new file mode 100644
index 0000000000..598a8d8114
--- /dev/null
+++ b/package/libtalloc/libtalloc.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# libtalloc
+#
+################################################################################
+
+LIBTALLOC_VERSION = 2.3.1
+LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
+LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
+LIBTALLOC_LICENSE = GPL-3.0+
+LIBTALLOC_LICENSE_FILES = talloc.h pytalloc.h
+LIBTALLOC_INSTALL_STAGING = YES
+
+LIBTALLOC_CONF_OPTS += --cross-compile \
+		--cross-answers=$(@D)/cache.txt \
+		--hostcc=gcc \
+		--with-libiconv=$(STAGING_DIR)/usr # (see below)
+
+# --with-libiconv=
+# waf will search for libiconv by default in /usr/local. Because of a bug in some waf
+# python script, /usr/local is then used in many subsequent and unrelated checks, which
+# ultimately causes a failure when BR2_COMPILER_PARANOID_UNSAFE_PATH is set.
+# However no need to set libiconv as a dependency of libtalloc since it's optional.
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+LIBTALLOC_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
+LIBTALLOC_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
+LIBTALLOC_DEPENDENCIES += libtirpc host-pkgconf
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBTALLOC_PYTHON = \
+	PYTHON="$(HOST_DIR)/bin/python3" \
+	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
+LIBTALLOC_DEPENDENCIES += host-python3 python3
+LIBTALLOC_CONF_ENV += \
+	$(LIBTALLOC_PYTHON)
+# There is not a --enable-python configuration option
+else
+LIBTALLOC_CONF_OPTS += --disable-python
+endif
+
+LIBTALLOC_WAF = ./buildtools/bin/waf
+
+# like samba4, libtalloc uses the waf build system which requires a proper answers file
+# to configure package before build
+define LIBTALLOC_POPULATE_WAF_CACHE
+	$(INSTALL) -m 0644 package/libtalloc/libtalloc-cache.txt $(@D)/cache.txt
+	echo 'Checking uname machine type: $(BR2_ARCH)' >> $(@D)/cache.txt
+endef
+
+LIBTALLOC_PRE_CONFIGURE_HOOKS += LIBTALLOC_POPULATE_WAF_CACHE
+
+$(eval $(waf-package))
-- 
2.17.1
