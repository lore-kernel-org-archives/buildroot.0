From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Aug 2020 22:57:31 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libcap: bump to version 2.42
Message-ID: <20200829205731.2899225-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop first patch (already in version:
  https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=22f2e207f7824d231aab4de973e547f006e3ea3c)
- Drop second patch (already in version:
  https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=786b64b72b5ba3d4b6195f40c0096932d2c72b57)
- Drop third patch (not needed since
  https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit?id=f1c3ac995d02d4f17b9d15656ab6d58f4c87435a)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...d-system-fixes-for-cross-compilation.patch | 53 -------------------
 ...tall-into-install-shared-install-sta.patch | 48 -----------------
 ....c-fix-build-with-old-kernel-headers.patch | 51 ------------------
 package/libcap/libcap.hash                    |  4 +-
 package/libcap/libcap.mk                      |  2 +-
 5 files changed, 3 insertions(+), 155 deletions(-)
 delete mode 100644 package/libcap/0001-build-system-fixes-for-cross-compilation.patch
 delete mode 100644 package/libcap/0002-libcap-split-install-into-install-shared-install-sta.patch
 delete mode 100644 package/libcap/0003-libcap-cap_file.c-fix-build-with-old-kernel-headers.patch

diff --git a/package/libcap/0001-build-system-fixes-for-cross-compilation.patch b/package/libcap/0001-build-system-fixes-for-cross-compilation.patch
deleted file mode 100644
index de2409085e..0000000000
--- a/package/libcap/0001-build-system-fixes-for-cross-compilation.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From d8d70559a279706c206761dfaf665d2197934123 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sun, 6 Mar 2016 22:52:02 +0100
-Subject: [PATCH] build-system: fixes for cross-compilation
-
-Avoid the libcap buildsys forcing CC/CFLAGS/LDFLAGS/AR/RANLIB
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[yann.morin.1998 at free.fr: dont chmod +x the shared lib]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/Make.Rules b/Make.Rules
-index 8347b26..8a07a3f 100644
---- a/Make.Rules
-+++ b/Make.Rules
-@@ -48,26 +48,26 @@ MINOR=25
- KERNEL_HEADERS := $(topdir)/libcap/include/uapi
- IPATH += -fPIC -I$(KERNEL_HEADERS) -I$(topdir)/libcap/include
- 
--CC := gcc
--CFLAGS := -O2 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
--BUILD_CC := $(CC)
--BUILD_CFLAGS := $(CFLAGS) $(IPATH)
--AR := ar
--RANLIB := ranlib
-+CC ?= gcc
-+CFLAGS ?= -O2 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-+BUILD_CC ?= $(CC)
-+BUILD_CFLAGS ?= $(CFLAGS) $(IPATH)
-+AR ?= ar
-+RANLIB ?= ranlib
- DEBUG = -g #-DDEBUG
- WARNINGS=-Wall -Wwrite-strings \
-         -Wpointer-arith -Wcast-qual -Wcast-align \
-         -Wstrict-prototypes -Wmissing-prototypes \
-         -Wnested-externs -Winline -Wshadow
- LD=$(CC) -Wl,-x -shared
--LDFLAGS := #-g
-+LDFLAGS ?= #-g
- BUILD_GPERF := $(shell which gperf >/dev/null 2>/dev/null && echo yes)
- 
- SYSTEM_HEADERS = /usr/include
- INCS=$(topdir)/libcap/include/sys/capability.h
- LDFLAGS += -L$(topdir)/libcap
- CFLAGS += -Dlinux $(WARNINGS) $(DEBUG)
--PAM_CAP := $(shell if [ -f /usr/include/security/pam_modules.h ]; then echo yes ; else echo no ; fi)
-+PAM_CAP = no
- INDENT := $(shell if [ -n "$$(which indent 2>/dev/null)" ]; then echo "| indent -kr" ; fi)
- DYNAMIC := $(shell if [ ! -d "$(topdir)/.git" ]; then echo yes; fi)
- 
--- 
-1.9.1
-
diff --git a/package/libcap/0002-libcap-split-install-into-install-shared-install-sta.patch b/package/libcap/0002-libcap-split-install-into-install-shared-install-sta.patch
deleted file mode 100644
index a8579b7660..0000000000
--- a/package/libcap/0002-libcap-split-install-into-install-shared-install-sta.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From af21635665ab568f3333ff9fe8b474f4950e5acb Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 6 Mar 2016 22:53:24 +0100
-Subject: [PATCH] libcap: split install into install-shared/install-static
-
-In order to support static only builds, split the install target into
-install-shared and install-static targets.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[yann.morin.1998 at free.fr: install the .pc file in the common rule]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/libcap/Makefile b/libcap/Makefile
-index d189777..44ddb27 100644
---- a/libcap/Makefile
-+++ b/libcap/Makefile
-@@ -62,19 +62,25 @@ $(MINLIBNAME): $(OBJS)
- cap_text.o: cap_text.c $(USE_GPERF_OUTPUT) $(INCLS)
- 	$(CC) $(CFLAGS) $(IPATH) $(INCLUDE_GPERF_OUTPUT) -c $< -o $@
- 
--install: all
-+install: install-shared install-static
-+
-+install-common:
- 	mkdir -p -m 0755 $(FAKEROOT)$(INCDIR)/sys
- 	install -m 0644 include/sys/capability.h $(FAKEROOT)$(INCDIR)/sys
-+	mkdir -p -m 0755 $(FAKEROOT)$(PKGCONFIGDIR)
-+	install -m 0644 libcap.pc $(FAKEROOT)$(PKGCONFIGDIR)/libcap.pc
-+
-+install-static: $(STALIBNAME) install-common
- 	mkdir -p -m 0755 $(FAKEROOT)$(LIBDIR)
- 	install -m 0644 $(STALIBNAME) $(FAKEROOT)$(LIBDIR)/$(STALIBNAME)
-+
-+install-shared: $(MINLIBNAME) install-common
- 	install -m 0644 $(MINLIBNAME) $(FAKEROOT)$(LIBDIR)/$(MINLIBNAME)
- 	ln -sf $(MINLIBNAME) $(FAKEROOT)$(LIBDIR)/$(MAJLIBNAME)
- 	ln -sf $(MAJLIBNAME) $(FAKEROOT)$(LIBDIR)/$(LIBNAME)
- ifeq ($(FAKEROOT),)
- 	-/sbin/ldconfig
- endif
--	mkdir -p -m 0755 $(FAKEROOT)$(PKGCONFIGDIR)
--	install -m 0644 libcap.pc $(FAKEROOT)$(PKGCONFIGDIR)/libcap.pc
- 
- clean:
- 	$(LOCALCLEAN)
--- 
-1.9.1
-
diff --git a/package/libcap/0003-libcap-cap_file.c-fix-build-with-old-kernel-headers.patch b/package/libcap/0003-libcap-cap_file.c-fix-build-with-old-kernel-headers.patch
deleted file mode 100644
index 02cc228b1d..0000000000
--- a/package/libcap/0003-libcap-cap_file.c-fix-build-with-old-kernel-headers.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From ace694e9574eb38e07cfe0db235434eb40003f47 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 14 Mar 2016 22:39:15 +0100
-Subject: [PATCH] libcap/cap_file.c: fix build with old kernel headers
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libcap/cap_file.c | 27 +++++++++++++++++++++++++++
- 1 file changed, 27 insertions(+)
-
-diff --git a/libcap/cap_file.c b/libcap/cap_file.c
-index 40756ea..e3d54dd 100644
---- a/libcap/cap_file.c
-+++ b/libcap/cap_file.c
-@@ -23,6 +23,33 @@ extern int fsetxattr(int, const char *, const void *, size_t, int);
- extern int removexattr(const char *, const char *);
- extern int fremovexattr(int, const char *);
- 
-+
-+/*
-+ * Old kernels (before 2.6.36) were defining XATTR_NAME_CAPS in
-+ * <linux/capability.h>, but using XATTR_SECURITY_PREFIX and
-+ * XATTR_CAPS_SUFFIX which were defined in the kernel-only part of
-+ * <linux/xattr.h>.
-+ *
-+ * In kernel 2.6.36 (commit af4f136056c984b0aa67feed7d3170b958370b2f),
-+ * the XATTR_NAME_CAPS definition was moved to the kernel-only part of
-+ * <linux/xattr.h>. It's only in kernel 3.0 (commit
-+ * 1dbe39424a43e56a6c9aed12661192af51dcdb9f) that <linux/xattr.h> was
-+ * fixed to expose XATTR_NAME_CAPS and the related definitions to
-+ * userspace.
-+ *
-+ * In order to cope with kernels < 3.0, we define here the appropriate
-+ * values, which we assume haven't changed over history.
-+ */
-+#ifndef XATTR_CAPS_SUFFIX
-+#define XATTR_CAPS_SUFFIX "capability"
-+#endif
-+#ifndef XATTR_SECURITY_PREFIX
-+#define XATTR_SECURITY_PREFIX "security."
-+#endif
-+#ifndef XATTR_NAME_CAPS
-+#define XATTR_NAME_CAPS XATTR_SECURITY_PREFIX XATTR_CAPS_SUFFIX
-+#endif
-+
- #include "libcap.h"
- 
- #ifdef VFS_CAP_U32
--- 
-2.6.4
-
diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index cbef0dc86d..19044cab01 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256	dac1792d0118bee6aae6ba7fb93ff1602c6a9bda812fd63916eee1435b9c486a  libcap-2.27.tar.xz
+sha256  3605a9cb60076547ea9f64989e0ba576da9508e4653e8dc40ae54c0d6f443dfd  libcap-2.42.tar.xz
 
 # Hash for license file:
-sha256	088cabde4662b4121258d298b0b2967bc1abffa134457ed9bc4a359685ab92bc  License
+sha256  088cabde4662b4121258d298b0b2967bc1abffa134457ed9bc4a359685ab92bc  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 4919a4adca..08c1bc9deb 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.27
+LIBCAP_VERSION = 2.42
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
-- 
2.28.0
