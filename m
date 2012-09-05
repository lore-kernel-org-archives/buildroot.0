From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Wed,  5 Sep 2012 17:29:00 +0300
Subject: [Buildroot] [PATCH 5/9] firefox: installing default extensions
	needs host-unzip dependency
In-Reply-To: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1346855344-15081-6-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in                       |    1 +
 package/unzip/Config.in                 |    8 ++++
 package/unzip/unzip-respect-flags.patch |   23 +++++++++++
 package/unzip/unzip.mk                  |   66 +++++++++++++++++++++++++++++++
 4 files changed, 98 insertions(+), 0 deletions(-)
 create mode 100644 package/unzip/Config.in
 create mode 100644 package/unzip/unzip-respect-flags.patch
 create mode 100644 package/unzip/unzip.mk

diff --git a/package/Config.in b/package/Config.in
index e129522..636caf8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -13,6 +13,7 @@ source "package/gzip/Config.in"
 endif
 source "package/lzop/Config.in"
 source "package/lzma/Config.in"
+source "package/unzip/Config.in"
 source "package/xz/Config.in"
 endmenu
 
diff --git a/package/unzip/Config.in b/package/unzip/Config.in
new file mode 100644
index 0000000..f4fc111
--- /dev/null
+++ b/package/unzip/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_UNZIP
+	bool "unzip"
+	help
+	  The UnZip package contains ZIP extraction utilities. These are useful for extracting files from
+	  ZIP archives. ZIP archives are created with PKZIP or Info-ZIP utilities, primarily in a DOS
+	  environment.
+
+	  http://downloads.sourceforge.net/infozip/
diff --git a/package/unzip/unzip-respect-flags.patch b/package/unzip/unzip-respect-flags.patch
new file mode 100644
index 0000000..35c8314
--- /dev/null
+++ b/package/unzip/unzip-respect-flags.patch
@@ -0,0 +1,23 @@
+diff -Naur unzip60.org/unix/Makefile unzip60/unix/Makefile
+--- unzip60.org/unix/Makefile	2012-09-02 21:29:55.944176704 +0300
++++ unzip60/unix/Makefile	2012-09-02 21:31:20.276176583 +0300
+@@ -808,8 +808,8 @@
+ # systems.)
+ linux:		unix_make
+ 	@echo 'NOTE:  use linux_noasm target for non-Intel Linux compiles.'
+-	$(MAKE) unzips CC=gcc LD=gcc AS=gcc\
+-	 CFLAGS="-O3 -Wall -DASM_CRC"\
++	$(MAKE) unzips CC=$(CC) LD=$(CC) AS=$(CC)\
++	 CFLAGS="$(CFLAGS) -DASM_CRC"\
+ 	 AF="-Di386 $(AF)" CRCA_O=crc_gcc$O
+ # GRR:  this echo is pointless; if user gets this far, no difference to install
+ #	@echo 'Be sure to use the install_asm target rather than the install target'
+@@ -819,7 +819,7 @@
+ # Linux (Posix, approximately SysV):  virtually any version since before 0.96,
+ # for any platform.  Change "-O" to "-O3" or whatever, as desired...
+ linux_noasm:	unix_make
+-	$(MAKE) unzips CC=gcc LD=gcc CFLAGS="-O -Wall"
++	$(MAKE) unzips CC=$(CC) LD=$(CC) CFLAGS="$(CFLAGS)"
+ 
+ # Linux with lcc compiler:  __inline__ (stat.h) not recognized, and must edit
+ # /usr/include/gnu/types.h to get rid of "long long" if __LCC__ defined.  -O3
diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
new file mode 100644
index 0000000..fdfbe9f
--- /dev/null
+++ b/package/unzip/unzip.mk
@@ -0,0 +1,66 @@
+###################################################################
+#
+# unzip
+# 
+# quickly hacked from: 
+# http://www.linuxfromscratch.org/blfs/view/svn/general/unzip.html
+###################################################################
+
+UNZIP_MAJOR_VERSION = 6
+UNZIP_MINOR_VERSION = 0
+UNZIP_VERSION = $(UNZIP_MAJOR_VERSION).$(UNZIP_MINOR_VERSION)
+UNZIP_SOURCE = unzip$(UNZIP_MAJOR_VERSION)$(UNZIP_MINOR_VERSION).tar.gz
+UNZIP_SITE = http://downloads.sourceforge.net/infozip
+UNZIP_LICENSE = Info-ZIP
+UNZIP_LICENSE_FILES = LICENSE
+
+# No point of doing optimized build for host version,
+# so we build host version without any x86 specific asm stuff
+define HOST_UNZIP_BUILD_CMDS
+	(cd $(@D); \
+	sed -i -e 's/CFLAGS="-O -Wall/& -DNO_LCHMOD/' unix/Makefile ; \
+	$(MAKE) -f unix/Makefile linux_noasm )
+endef
+
+define HOST_UNZIP_INSTALL_CMDS
+	(cd $(@D); \
+	$(MAKE) prefix=$(HOST_DIR)/usr install )
+endef
+
+# If you do have busybox installed in your target (like most do)
+# and if you have by accident also enabled unzip support in
+# your busybox configuration file, then guess what happens
+# after insallation of the real unzip application ?
+#
+# Yep, UNZIP_INSTALL_TARGET_CMDS will happily
+# write to your unzip -> /bin/busybox symlink
+# and overwrite your busybox ... :-(
+#
+# That's why I included this as an primitive safety mechanism.
+# Improvement are wellcome
+
+ifneq ($(BR2_PACKAGE_BUSYBOX),y)
+ifeq ($(BR2_i386),y) || ($(BR2_x86_64),y)
+# Intel x86 asm optimized version
+define UNZIP_BUILD_CMDS
+	(cd $(@D);\
+	sed -i -e 's/DASM"/DASM -DNO_LCHMOD"/' unix/Makefile;\
+	$(MAKE) -f unix/Makefile $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -DNO_LCHMOD" CC=$(TARGET_CC) LD=$(TARGET_LD) AS=$(TARGET_AS) linux )
+endef
+else
+# non-Intel asm optimized (aka generic) version
+define UNZIP_BUILD_CMDS
+	(cd $(@D); \
+	sed -i -e 's/CFLAGS="-O -Wall/& -DNO_LCHMOD/' unix/Makefile ; \
+	$(MAKE) -f unix/Makefile $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -DNO_LCHMOD" CC=$(TARGET_CC) LD=$(TARGET_LD) AS=$(TARGET_AS) linux_noasm )
+endef
+endif
+
+define UNZIP_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+	$(MAKE) prefix=$(TARGET_DIR)/usr install )
+endef
+endif
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.7.6
