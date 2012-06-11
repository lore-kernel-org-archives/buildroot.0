From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 11 Jun 2012 22:43:59 +0200
Subject: [Buildroot] [git commit] dmidecode: new package
Message-ID: <20120611205424.63E4596D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d3547529b87ce3bddfcdc962e0c9d6d2b2ed9d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/dmidecode/Config.in                        |    9 +++++
 .../dmidecode/dmidecode-build-system-fixes.patch   |   35 ++++++++++++++++++++
 package/dmidecode/dmidecode.mk                     |   18 ++++++++++
 4 files changed, 63 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2b2c980..4915b67 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -174,6 +174,7 @@ source "package/dbus-python/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/devmem2/Config.in"
 endif
+source "package/dmidecode/Config.in"
 source "package/dmraid/Config.in"
 source "package/dosfstools/Config.in"
 source "package/e2fsprogs/Config.in"
diff --git a/package/dmidecode/Config.in b/package/dmidecode/Config.in
new file mode 100644
index 0000000..22272ed
--- /dev/null
+++ b/package/dmidecode/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_DMIDECODE
+	bool "dmidecode"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  Dmidecode reports information about your system's hardware
+	  as described in your system BIOS according to the SMBIOS/DMI
+	  standard.
+
+	  http://www.nongnu.org/dmidecode/
diff --git a/package/dmidecode/dmidecode-build-system-fixes.patch b/package/dmidecode/dmidecode-build-system-fixes.patch
new file mode 100644
index 0000000..275f9df
--- /dev/null
+++ b/package/dmidecode/dmidecode-build-system-fixes.patch
@@ -0,0 +1,35 @@
+Minor build system fixes
+
+Usual build system fixes to allow CC/CFLAGS/LDFLAGS to be overriden
+from the command line, and completed by additional flags from the
+Makefile.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -12,9 +12,10 @@
+ #   (at your option) any later version.
+ #
+ 
+-CC      = gcc
+-CFLAGS  = -W -Wall -Wshadow -Wstrict-prototypes -Wpointer-arith -Wcast-qual \
+-          -Wcast-align -Wwrite-strings -Wmissing-prototypes -Winline -Wundef
++CC      ?= gcc
++override CFLAGS  += \
++	-W -Wall -Wshadow -Wstrict-prototypes -Wpointer-arith -Wcast-qual \
++        -Wcast-align -Wwrite-strings -Wmissing-prototypes -Winline -Wundef
+ #CFLAGS += -DBIGENDIAN
+ #CFLAGS += -DALIGNMENT_WORKAROUND
+ 
+@@ -23,7 +24,7 @@
+ #CFLAGS += -g
+ 
+ # Pass linker flags here
+-LDFLAGS =
++override LDFLAGS +=
+ 
+ DESTDIR =
+ prefix  = /usr/local
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
new file mode 100644
index 0000000..a036a7a
--- /dev/null
+++ b/package/dmidecode/dmidecode.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# dmidecode
+#
+#############################################################
+
+DMIDECODE_VERSION = 2.11
+DMIDECODE_SITE    = http://download.savannah.gnu.org/releases/dmidecode/
+
+define DMIDECODE_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define DMIDECODE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) prefix=/usr DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(call GENTARGETS))
