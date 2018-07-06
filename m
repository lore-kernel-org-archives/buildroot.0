From: Celso Varella <celso.neto.cwi@datacom.com.br>
Date: Fri,  6 Jul 2018 11:36:14 -0300
Subject: [Buildroot] [PATCH 3/3] sbsigntools: new package
In-Reply-To: <1530887774-19479-1-git-send-email-celso.neto.cwi@datacom.com.br>
References: <1530887774-19479-1-git-send-email-celso.neto.cwi@datacom.com.br>
Message-ID: <1530887774-19479-4-git-send-email-celso.neto.cwi@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linux user-space utility for signing and verifying files for UEFI Secure
Boot.

The recipe is a bit complicated because sbsigntools requires a specific
version of CCAN (see https://github.com/rustyrussell/ccan/) and uses a
script to download, configure and build it. We must patch configure.ac,
Makefile.am and the ccan Makefile to remove hard-coded paths and git
invocations.

We must also apply two patches already sent to the maintainer by email

- Fix an automake warning that source file 'ccan/time/time.c' is in a
  subdirectory but option 'subdir-objects' is disabled.
- Improve error handling and prevent a memory leak in an internal
  function.

The project does not seem to have a bug tracking system neither a
mailing list, just a page at kernel.org.

https://git.kernel.org/pub/scm/linux/kernel/git/jejb/sbsigntools.git/about/

Signed-off-by: Celso Varella <celso.neto.cwi@datacom.com.br>
Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/Config.in                                  |  1 +
 package/Config.in.host                             |  1 +
 .../0001-configure-fix-AM_INIT_AUTOMAKE-call.patch | 32 +++++++++
 ...rove-error-handling-in-__fileio_read_file.patch | 68 ++++++++++++++++++
 package/sbsigntools/Config.in                      | 20 ++++++
 package/sbsigntools/Config.in.host                 |  7 ++
 package/sbsigntools/sbsigntools.hash               | 10 +++
 package/sbsigntools/sbsigntools.mk                 | 83 ++++++++++++++++++++++
 8 files changed, 222 insertions(+)
 create mode 100644 package/sbsigntools/0001-configure-fix-AM_INIT_AUTOMAKE-call.patch
 create mode 100644 package/sbsigntools/0002-fileio-improve-error-handling-in-__fileio_read_file.patch
 create mode 100644 package/sbsigntools/Config.in
 create mode 100644 package/sbsigntools/Config.in.host
 create mode 100644 package/sbsigntools/sbsigntools.hash
 create mode 100644 package/sbsigntools/sbsigntools.mk

diff --git a/package/Config.in b/package/Config.in
index a61ace3..676555c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2048,6 +2048,7 @@ menu "System tools"
 	source "package/s6-linux-utils/Config.in"
 	source "package/s6-portable-utils/Config.in"
 	source "package/s6-rc/Config.in"
+	source "package/sbsigntools/Config.in"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
 	source "package/smack/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 7838ffc..8103c00 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -52,6 +52,7 @@ menu "Host utilities"
 	source "package/rauc/Config.in.host"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
+	source "package/sbsigntools/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
diff --git a/package/sbsigntools/0001-configure-fix-AM_INIT_AUTOMAKE-call.patch b/package/sbsigntools/0001-configure-fix-AM_INIT_AUTOMAKE-call.patch
new file mode 100644
index 0000000..a8fb3ac
--- /dev/null
+++ b/package/sbsigntools/0001-configure-fix-AM_INIT_AUTOMAKE-call.patch
@@ -0,0 +1,32 @@
+From 0af33976848d515703b07c45a2fbfd08b867d4b0 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.com.br>
+Date: Tue, 3 Jul 2018 15:45:04 -0300
+Subject: [PATCH] configure: fix AM_INIT_AUTOMAKE call
+
+Requires subdir-objects to prevent warning messages:
+
+    lib/ccan/Makefile.am:2: warning: source file 'ccan/time/time.c' is in a subdirectory,
+    lib/ccan/Makefile.am:2: but option 'subdir-objects' is disabled
+    automake: warning: possible forward-incompatibility.
+    automake: At least a source file is in a subdirectory, but the 'subdir-objects'
+
+Signed-off-by: Carlos Santos <casantos@datacom.com.br>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f39400a..e9fc906 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,6 +1,6 @@
+ AC_INIT([sbsigntool], [0.9.1], [James.Bottomley at HansenPartnership.com])
+ 
+-AM_INIT_AUTOMAKE()
++AM_INIT_AUTOMAKE([subdir-objects])
+ 
+ AC_PREREQ(2.60)
+ 
+-- 
+2.14.4
+
diff --git a/package/sbsigntools/0002-fileio-improve-error-handling-in-__fileio_read_file.patch b/package/sbsigntools/0002-fileio-improve-error-handling-in-__fileio_read_file.patch
new file mode 100644
index 0000000..557b123
--- /dev/null
+++ b/package/sbsigntools/0002-fileio-improve-error-handling-in-__fileio_read_file.patch
@@ -0,0 +1,68 @@
+From fb10558edc146bdba4383171144c35d152208041 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.com.br>
+Date: Wed, 4 Jul 2018 11:07:31 -0300
+Subject: [PATCH] fileio: improve error handling in __fileio_read_file
+
+Prevent compiler warnings:
+    fileio.c:178:12: warning: 'buf' may be used uninitialized in this function [-Wmaybe-uninitialized]
+    fileio.c:179:12: warning: 'len' may be used uninitialized in this function [-Wmaybe-uninitialized]
+
+Call talloc_free before returning on read errors to prevent memory leak.
+
+Signed-off-by: Carlos Santos <casantos@datacom.com.br>
+---
+ src/fileio.c | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/src/fileio.c b/src/fileio.c
+index 032eb1e..5a109a7 100644
+--- a/src/fileio.c
++++ b/src/fileio.c
+@@ -154,30 +154,30 @@ static int __fileio_read_file(void *ctx, const char *filename,
+ 
+ 	rc = fstat(fd, &statbuf);
+ 	if (rc)
+-		goto out;
++		goto close_fd;
+ 
+ 	len = statbuf.st_size;
+ 
+ 	buf = talloc_array(ctx, uint8_t, len);
+ 	if (!buf)
+-		goto out;
++		goto close_fd;
+ 
+ 	if (!read_all(fd, buf, len))
+-		goto out;
++		goto read_error;
+ 
++	*out_buf = buf;
++	*out_len = len;
+ 	rc = 0;
+-
++	goto close_fd;
++
++read_error:
++	if (!(flags & FLAG_NOERROR))
++		fprintf(stderr, "Error reading file %s: %s\n", filename,
++				strerror(errno));
++	talloc_free(ctx);
++close_fd:
++	close(fd);
+ out:
+-	if (fd >= 0)
+-		close(fd);
+-	if (rc) {
+-		if (!(flags & FLAG_NOERROR))
+-			fprintf(stderr, "Error reading file %s: %s\n",
+-					filename, strerror(errno));
+-	} else {
+-		*out_buf = buf;
+-		*out_len = len;
+-	}
+ 	return rc;
+ 
+ }
+-- 
+2.14.4
+
diff --git a/package/sbsigntools/Config.in b/package/sbsigntools/Config.in
new file mode 100644
index 0000000..a536315
--- /dev/null
+++ b/package/sbsigntools/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_SBSIGNTOOLS
+	bool "sbsigntools"
+	depends on BR2_ARM_CPU_HAS_ARM || BR2_aarch64 || \
+		BR2_aarch64_be || BR2_i386 || BR2_x86_64 # gnu-efi
+	depends on !BR2_nios2    # binutils
+	depends on BR2_USE_WCHAR # binutils
+	select BR2_PACKAGE_BINUTILS
+	select BR2_PACKAGE_GNU_EFI
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  A Linux user-space application to sign and verify application
+	  for UEFI Secure Boot
+
+	  https://git.kernel.org/pub/scm/linux/kernel/git/jejb/sbsigntools.git/about/
+
+comment "sbsigntools needs a toolchain w/ wchar"
+	depends on !BR2_nios2
+	depends on !BR2_USE_WCHAR
diff --git a/package/sbsigntools/Config.in.host b/package/sbsigntools/Config.in.host
new file mode 100644
index 0000000..7fdf297
--- /dev/null
+++ b/package/sbsigntools/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_SBSIGNTOOLS
+	bool "host sbsigntools"
+	help
+	  A Linux user-space application to sign and verify application
+	  for UEFI Secure Boot
+
+	  https://git.kernel.org/pub/scm/linux/kernel/git/jejb/sbsigntools.git/about/
diff --git a/package/sbsigntools/sbsigntools.hash b/package/sbsigntools/sbsigntools.hash
new file mode 100644
index 0000000..2778a40
--- /dev/null
+++ b/package/sbsigntools/sbsigntools.hash
@@ -0,0 +1,10 @@
+# locally computed
+sha256	981b3576fc16392e2a764aa4089ce7e51843e3c787143ba7dec8cca88cf5ec07  sbsigntools-0.9.1.tar.gz
+sha256	d479cffd70764aa6078d7b198472a9ec0b517b2123479fb578b3e5c8ddaa01b0  ccan-b1f28e17227f2320d07fe052a8a48942fe17caa5.tar.gz
+sha256	7f424707cdb69df658b7b66ea1f9c9ab3ea0a0988999ecba3dad10a811db654f  COPYING
+sha256	02a66d6af5a4ef501849a33e6d8a0624e2b4284c8bed19ba0b0c24e8ac1add4e  lib/ccan.git/licenses/BSD-3CLAUSE
+sha256	89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  lib/ccan.git/licenses/BSD-MIT
+sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  lib/ccan.git/licenses/GPL-2
+sha256	fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  lib/ccan.git/licenses/GPL-3
+sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  lib/ccan.git/licenses/LGPL-2.1
+sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  lib/ccan.git/licenses/LGPL-3
diff --git a/package/sbsigntools/sbsigntools.mk b/package/sbsigntools/sbsigntools.mk
new file mode 100644
index 0000000..235229b
--- /dev/null
+++ b/package/sbsigntools/sbsigntools.mk
@@ -0,0 +1,83 @@
+################################################################################
+#
+# sbsigntools
+#
+################################################################################
+
+SBSIGNTOOLS_VERSION = 0.9.1
+SBSIGNTOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jejb/sbsigntools.git/snapshot
+SBSIGNTOOLS_LICENSE = GPL-3.0+
+SBSIGNTOOLS_LICENSE_FILES = COPYING \
+	lib/ccan.git/licenses/BSD-3CLAUSE \
+	lib/ccan.git/licenses/BSD-MIT \
+	lib/ccan.git/licenses/GPL-2 \
+	lib/ccan.git/licenses/GPL-3 \
+	lib/ccan.git/licenses/LGPL-2.1 \
+	lib/ccan.git/licenses/LGPL-3
+SBSIGNTOOLS_AUTORECONF = YES
+
+SBSIGNTOOLS_DEPENDENCIES = host-pkgconf binutils gnu-efi openssl util-linux
+SBSIGNTOOLS_CFLAGS = \
+	-I$(BINUTILS_DIR)/bfd \
+	-I$(BINUTILS_DIR)/include \
+	 $(TARGET_CFLAGS)
+SBSIGNTOOLS_EFI_CPPFLAGS = -I$(HOST_DIR)/include/efi \
+	-I$(HOST_DIR)/include/efi/$(HOST_GNU_EFI_PLATFORM)
+SBSIGNTOOLS_CONF_ENV = \
+	CFLAGS="$(SBSIGNTOOLS_CFLAGS)" \
+	CRTPATH="$(STAGING_DIR)/lib/crt0-efi-$(GNU_EFI_PLATFORM).o" \
+	ac_cv_header_bfd_h=yes
+
+HOST_SBSIGNTOOLS_DEPENDENCIES = host-pkgconf host-binutils host-gnu-efi \
+	host-openssl host-util-linux
+HOST_SBSIGNTOOLS_CFLAGS = \
+	-I$(HOST_BINUTILS_DIR)/bfd \
+	-I$(HOST_BINUTILS_DIR)/include \
+	$(HOST_CFLAGS)
+HOST_SBSIGNTOOLS_CONF_ENV = \
+	CFLAGS="$(HOST_SBSIGNTOOLS_CFLAGS)" \
+	CRTPATH="$(HOST_DIR)/lib/crt0-efi-$(HOST_GNU_EFI_PLATFORM).o" \
+	ac_cv_header_bfd_h=yes
+
+SBSIGNTOOLS_CCAN_VERSION = b1f28e17227f2320d07fe052a8a48942fe17caa5
+SBSIGNTOOLS_CCAN_SITE = $(call github,rustyrussell,ccan,$(SBSIGNTOOLS_CCAN_VERSION))
+SBSIGNTOOLS_CCAN_SOURCE = ccan-$(SBSIGNTOOLS_CCAN_VERSION).tar.gz
+SBSIGNTOOLS_CCAN_MODULES = talloc read_write_all build_assert array_size endian
+SBSIGNTOOLS_EXTRA_DOWNLOADS = $(SBSIGNTOOLS_CCAN_SITE)/$(SBSIGNTOOLS_CCAN_SOURCE)
+
+define SBSIGNTOOLS_POST_EXTRACT
+	set -e; \
+	$(ZCAT) $(SBSIGNTOOLS_DL_DIR)/$(SBSIGNTOOLS_CCAN_SOURCE) |\
+		$(TAR) --strip-components=1 -C $(@D)/lib/ccan.git -x -f -; \
+	rm $(@D)/lib/ccan.git/Makefile-web; \
+	$(SED) 's|\[docs/Makefile tests/Makefile\]||;s|AM_MISSING_PROG(HELP2MAN.*|HELP2MAN=:|' \
+		$(@D)/configure.ac; \
+	echo 'SUBDIRS = lib/ccan src' > $(@D)/Makefile.am; \
+	$(SED) 's|\(SCOREDIR=scores\)/.*|\1|;/git describe/d' $(@D)/lib/ccan.git/Makefile
+endef
+define SBSIGNTOOLS_FIX_EFI_CPPFLAGS
+	$(SED) 's|^EFI_ARCH=.*|EFI_ARCH=$(GNU_EFI_PLATFORM)|;\
+		s|/usr/include/efi|$(STAGING_DIR)/usr/include/efi|g' \
+		$(@D)/configure.ac
+endef
+define HOST_SBSIGNTOOLS_FIX_EFI_CPPFLAGS
+	$(SED) 's|^EFI_ARCH=.*|EFI_ARCH=$(HOST_GNU_EFI_PLATFORM)|;\
+		s|/usr/include/efi|$(HOST_DIR)/include/efi|g' \
+		$(@D)/configure.ac
+endef
+SBSIGNTOOLS_POST_EXTRACT_HOOKS += SBSIGNTOOLS_POST_EXTRACT SBSIGNTOOLS_FIX_EFI_CPPFLAGS
+HOST_SBSIGNTOOLS_POST_EXTRACT_HOOKS += SBSIGNTOOLS_POST_EXTRACT HOST_SBSIGNTOOLS_FIX_EFI_CPPFLAGS
+
+define SBSIGNTOOLS_PRE_CONFIGURE_AUTOGEN
+	set -e; \
+	cd $(@D); \
+	rm -rf lib/ccan; \
+	lib/ccan.git/tools/create-ccan-tree --build-type=automake \
+		lib/ccan $(SBSIGNTOOLS_CCAN_MODULES); \
+	touch AUTHORS ChangeLog
+endef
+SBSIGNTOOLS_PRE_CONFIGURE_HOOKS += SBSIGNTOOLS_PRE_CONFIGURE_AUTOGEN
+HOST_SBSIGNTOOLS_PRE_CONFIGURE_HOOKS += SBSIGNTOOLS_PRE_CONFIGURE_AUTOGEN
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.7.4
