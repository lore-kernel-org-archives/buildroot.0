From: David GOUARIN <dgouarin@gmail.com>
Date: Tue, 13 Oct 2020 21:50:44 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/libtalloc: new package
In-Reply-To: <20201013143707.11678-1-dgouarin@gmail.com>
References: <20201013143707.11678-1-dgouarin@gmail.com>
Message-ID: <20201013195044.6343-1-dgouarin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

talloc is a hierarchical, reference counted memory pool system with destructors.
It is the core memory allocator used in Samba.

Change v1 -> v2:
  - merge with work from jared.bents at rockwellcollins.com, as sujested by Matthew Weber
    http://patchwork.ozlabs.org/project/buildroot/patch/20200327150225.15277-1-jared.bents at rockwellcollins.com

Signed-off-by: David GOUARIN <dgouarin@gmail.com>
---
 DEVELOPERS                            |  1 +
 package/Config.in                     |  1 +
 package/libtalloc/Config.in           | 10 ++++++
 package/libtalloc/libtalloc-cache.txt | 42 +++++++++++++++++++++++
 package/libtalloc/libtalloc.hash      |  3 ++
 package/libtalloc/libtalloc.mk        | 48 +++++++++++++++++++++++++++
 6 files changed, 105 insertions(+)
 create mode 100644 package/libtalloc/Config.in
 create mode 100644 package/libtalloc/libtalloc-cache.txt
 create mode 100644 package/libtalloc/libtalloc.hash
 create mode 100644 package/libtalloc/libtalloc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 79a9eaa563..c856d7ad45 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -712,6 +712,7 @@ F:	package/x264/
 
 N:	David GOUARIN <dgouarin@gmail.com>
 F:	package/librelp/
+F:	package/libtalloc/
 
 N:	David Lechner <david@lechnology.com>
 F:	board/lego/ev3/
diff --git a/package/Config.in b/package/Config.in
index 09a332e3b9..a4d6fe02ae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1894,6 +1894,7 @@ menu "Other"
 	source "package/libsigc/Config.in"
 	source "package/libsigsegv/Config.in"
 	source "package/libspatialindex/Config.in"
+	source "package/libtalloc/Config.in"
 	source "package/libtasn1/Config.in"
 	source "package/libtommath/Config.in"
 	source "package/libtpl/Config.in"
diff --git a/package/libtalloc/Config.in b/package/libtalloc/Config.in
new file mode 100644
index 0000000000..3e6a97bb6e
--- /dev/null
+++ b/package/libtalloc/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBTALLOC
+	bool "libtalloc"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_GLIBC && !BR2_COMPILER_PARANOID_UNSAFE_PATH || !BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  talloc is a hierarchical, reference counted memory pool system with
+	  destructors. It is the core memory allocator used in Samba.
+
+	  https://talloc.samba.org/talloc/doc/html/index.html
+
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
index 0000000000..20211210d2
--- /dev/null
+++ b/package/libtalloc/libtalloc.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  ef4822d2fdafd2be8e0cabc3ec3c806ae29b8268e932c5e9a4cd5585f37f9f77  talloc-2.3.1.tar.gz
+
diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
new file mode 100644
index 0000000000..7a42da8145
--- /dev/null
+++ b/package/libtalloc/libtalloc.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# libtalloc
+#
+################################################################################
+
+LIBTALLOC_VERSION = 2.3.1
+LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
+LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
+LIBTALLOC_LICENSE = LGPL-3.0, GPL-3.0+
+LIBTALLOC_LICENSE_FILES = talloc.h pytalloc.h
+LIBTALLOC_INSTALL_STAGING = YES
+
+LIBTALLOC_CONF_OPTS += --prefix=/usr \
+		--libdir=/usr/lib \
+		--cross-compile \
+		--cross-answers=$(@D)/cache.txt \
+		--hostcc=gcc
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
+define LIBTALLOC_POPULATE_WAF_CACHE
+	$(INSTALL) -m 0644 package/samba4/samba4-cache.txt $(@D)/cache.txt
+	echo 'Checking uname machine type: $(BR2_ARCH)' >>$(@D)/cache.txt
+endef
+
+LIBTALLOC_PRE_CONFIGURE_HOOKS += LIBTALLOC_POPULATE_WAF_CACHE
+
+$(eval $(waf-package))
+
-- 
2.17.1
