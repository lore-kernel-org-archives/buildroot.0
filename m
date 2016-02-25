From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:57:50 +0100
Subject: [Buildroot] [git commit branch/next] dt: new package
Message-ID: <20160225215848.873DE8194E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=938946a4763846c00765a48973c685a0c04baad0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
[Thomas: use <pkg>_STRIP_COMPONENTS = 2, which allows to get rid of
the <pkg>_SUBDIR usage, and make things a bit simpler.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                       |  1 +
 package/dt/0001-adjust-os-symlink.patch | 19 ++++++++++++++++
 package/dt/Config.in                    | 21 ++++++++++++++++++
 package/dt/dt.hash                      |  5 +++++
 package/dt/dt.mk                        | 39 +++++++++++++++++++++++++++++++++
 5 files changed, 85 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2b18147..67a2514 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -73,6 +73,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/dmalloc/Config.in"
 	source "package/dropwatch/Config.in"
 	source "package/dstat/Config.in"
+	source "package/dt/Config.in"
 	source "package/duma/Config.in"
 	source "package/fio/Config.in"
 	source "package/gdb/Config.in"
diff --git a/package/dt/0001-adjust-os-symlink.patch b/package/dt/0001-adjust-os-symlink.patch
new file mode 100644
index 0000000..1af9d64
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
+diff -Nura Makefile.linux Makefile.linux
+--- a/Makefile.linux	2016-01-26 09:10:03.939963780 -0300
++++ b/Makefile.linux	2016-01-26 09:10:27.140763863 -0300
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
index 0000000..8ec7788
--- /dev/null
+++ b/package/dt/dt.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# dt
+#
+################################################################################
+
+DT_VERSION = v18.32
+DT_SITE = http://pkgs.fedoraproject.org/repo/pkgs/dt/$(DT_SOURCE)/3054aeaaba047a1dbe90c2132a382ee2
+DT_SOURCE = dt-source-$(DT_VERSION).tar.gz
+DT_STRIP_COMPONENTS = 2
+DT_LICENSE = ISC-like
+DT_LICENSE_FILES = LICENSE
+
+DT_CFLAGS = \
+	-std=c99 \
+	-DMMAP \
+	-D__linux__ \
+	-D_GNU_SOURCE \
+	-D_FILE_OFFSET_BITS=64 \
+	-DTHREADS \
+	-DSCSI
+
+# uClibc doesn't provide POSIX AIO
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),)
+DT_CFLAGS += -DAIO
+endif
+
+define DT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) -f Makefile.linux \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) $(DT_CFLAGS)" \
+		OS=linux
+endef
+
+define DT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/dt $(TARGET_DIR)/usr/bin/dt
+endef
+
+$(eval $(generic-package))
