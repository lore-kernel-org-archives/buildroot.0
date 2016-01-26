From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Tue, 26 Jan 2016 17:40:23 -0300
Subject: [Buildroot] [PATCH] dt: new package
Message-ID: <1453840823-24345-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gsutavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/Config.in                       |  1 +
 package/dt/0001-adjust-os-symlink.patch | 19 +++++++++++++++++++
 package/dt/Config.in                    | 21 +++++++++++++++++++++
 package/dt/dt.hash                      |  5 +++++
 package/dt/dt.mk                        | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 package/dt/0001-adjust-os-symlink.patch
 create mode 100644 package/dt/Config.in
 create mode 100644 package/dt/dt.hash
 create mode 100644 package/dt/dt.mk

diff --git a/package/Config.in b/package/Config.in
index 56435b9..aebd4c8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -72,6 +72,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/dmalloc/Config.in"
 	source "package/dropwatch/Config.in"
 	source "package/dstat/Config.in"
+	source "package/dt/Config.in"
 	source "package/duma/Config.in"
 	source "package/fio/Config.in"
 	source "package/gdb/Config.in"
diff --git a/package/dt/0001-adjust-os-symlink.patch b/package/dt/0001-adjust-os-symlink.patch
new file mode 100644
index 0000000..ad03e3e
--- /dev/null
+++ b/package/dt/0001-adjust-os-symlink.patch
@@ -0,0 +1,19 @@
+Don't force build-dir-in-build-dir logic, symlink the os-specific SCSI
+support file in place.
+
+Status: not suitable for upstream.
+
+Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
+
+diff -Nura dt.v18.32.orig/Makefile.linux dt.v18.32/Makefile.linux
+--- a/dt.v18.32.orig/Makefile.linux	2016-01-26 09:10:03.939963780 -0300
++++ b/dt.v18.32/Makefile.linux	2016-01-26 09:10:27.140763863 -0300
+@@ -129,7 +129,7 @@
+ 	    echo "Please specify OS={aix,linux,hpux,solaris,windows}"; \
+ 	    exit 1; \
+ 	fi; \
+-	ln -sf ../scsilib-$(OS).c scsilib.c
++	ln -sf scsilib-$(OS).c scsilib.c
+ 
+ print:;
+ 		@$(PRINTER) $(PRINTFLAGS) $(ALL_CFILES)
diff --git a/package/dt/Config.in b/package/dt/Config.in
new file mode 100644
index 0000000..848e251
--- /dev/null
+++ b/package/dt/Config.in
@@ -0,0 +1,21 @@
+comment "dt needs a (e)glibc or uclibc toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
+
+config BR2_PACKAGE_DT
+	bool "dt"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# Build fails because of several BSDisms
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	help
+	  dt is a generic data test program used to verify proper
+	  operation of peripherals, file systems, device drivers,
+	  or any data stream supported by the operating system.
+	  In its' simplest mode of operation, dt writes and then
+	  verifys its' default data pattern, then displays
+	  performance statisics and other test parameters
+	  before exiting. Since verification of data is performed,
+	  dt can be thought of as a generic diagnostic tool.
+
+	  http://www.scsifaq.org/RMiller_Tools/dt.html
diff --git a/package/dt/dt.hash b/package/dt/dt.hash
new file mode 100644
index 0000000..7cd8c64
--- /dev/null
+++ b/package/dt/dt.hash
@@ -0,0 +1,5 @@
+# From http://pkgs.fedoraproject.org/repo/pkgs/dt/dt-source-v18.32.tar.gz
+# (directory name is md5 hash)
+md5	3054aeaaba047a1dbe90c2132a382ee2	dt-source-v18.32.tar.gz
+# Calculated based on the hash above
+sha256	10d164676e918a4d07f233bcd11e4cb6bfd1052c996182cd1827ccd0c063fcc6	dt-source-v18.32.tar.gz
diff --git a/package/dt/dt.mk b/package/dt/dt.mk
new file mode 100644
index 0000000..f2b1ef8
--- /dev/null
+++ b/package/dt/dt.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# dt
+#
+################################################################################
+
+DT_VERSION = v18.32
+DT_SITE = http://pkgs.fedoraproject.org/repo/pkgs/dt/$(DT_SOURCE)/3054aeaaba047a1dbe90c2132a382ee2
+DT_SOURCE = dt-source-$(DT_VERSION).tar.gz
+DT_SUBDIR = dt.$(DT_VERSION)
+DT_LICENSE = ISC-like
+DT_LICENSE_FILES = $(DT_SUBDIR)/LICENSE
+
+# uClibc doesn't provide POSIX AIO
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),)
+DT_AIO_FLAG = -DAIO
+endif
+
+define DT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(DT_SUBDIR) -f Makefile.linux \
+	CC="$(TARGET_CC)" \
+	CFLAGS="$(TARGET_CFLAGS) -std=c99 $(DT_AIO_FLAG) -DMMAP -D__linux__ -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -DTHREADS -DSCSI" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	OS=linux
+endef
+
+define DT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/$(DT_SUBDIR)/dt \
+		$(TARGET_DIR)/usr/bin/dt
+endef
+
+$(eval $(generic-package))
-- 
2.4.10
