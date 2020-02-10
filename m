From: David Owens <david.owens@rockwellcollins.com>
Date: Mon, 10 Feb 2020 14:56:37 -0600
Subject: [Buildroot] [PATCH v2] package/faketime: add target variant
Message-ID: <20200210205637.125367-1-david.owens@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add faketime support for target builds.  Fake stat support is disabled
on targets using glibc to prevent symbol collisions for the stat64
family of functions.

The included patch file was accepted by the faketime author but has yet
to be integrated into a tagged release.

Signed-off-by: David Owens <david.owens@rockwellcollins.com>

---
Changes v1 -> v2:
  - Updated 0001 patch file to include upstream pull-request link
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 ...ck_inc_set_backup-declaration-in-ifd.patch | 40 +++++++++++++++++++
 package/faketime/Config.in                    |  9 +++++
 package/faketime/faketime.mk                  | 14 +++++++
 5 files changed, 67 insertions(+)
 create mode 100644 package/faketime/0001-Wrap-user_per_tick_inc_set_backup-declaration-in-ifd.patch
 create mode 100644 package/faketime/Config.in

diff --git a/DEVELOPERS b/DEVELOPERS
index cb13035bc4..7436539f3f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -676,6 +676,9 @@ F:	linux/linux-ext-ev3dev-linux-drivers.mk
 F:	package/brickd/
 F:	package/ev3dev-linux-drivers/
 
+N:	David Owens <david.owens@rockwellcollins.com>
+F:	package/faketime/
+
 N:	Davide Viti <zinosat@tiscali.it>
 F:	package/flann/
 F:	package/python-paho-mqtt/
diff --git a/package/Config.in b/package/Config.in
index dfa3f34b9d..6a5f738631 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1762,6 +1762,7 @@ menu "Other"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
 	source "package/ell/Config.in"
+	source "package/faketime/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
 	source "package/flatbuffers/Config.in"
diff --git a/package/faketime/0001-Wrap-user_per_tick_inc_set_backup-declaration-in-ifd.patch b/package/faketime/0001-Wrap-user_per_tick_inc_set_backup-declaration-in-ifd.patch
new file mode 100644
index 0000000000..e3c793b1dc
--- /dev/null
+++ b/package/faketime/0001-Wrap-user_per_tick_inc_set_backup-declaration-in-ifd.patch
@@ -0,0 +1,40 @@
+From 10b9818c2c578f57ad596e86c5700948b9f36935 Mon Sep 17 00:00:00 2001
+From: David Owens <david.owens@rockwellcollins.com>
+Date: Thu, 14 Nov 2019 09:27:27 -0600
+Subject: [PATCH] Wrap user_per_tick_inc_set_backup declaration in ifdef
+
+Building without FAKE_STAT defined causes compilation errors due to
+unused variable user_per_tick_inc_set_backup.  Move declaration inside
+FAKE_STAT section along with the code making use of it.
+
+[Upstream: https://github.com/wolfcw/libfaketime/pull/214]
+Signed-off-by: David Owens <david.owens@rockwellcollins.com>
+
+---
+ src/libfaketime.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/libfaketime.c b/src/libfaketime.c
+index 5e7ebdf..db0b0c4 100644
+--- a/src/libfaketime.c
++++ b/src/libfaketime.c
+@@ -285,8 +285,6 @@ static double user_rate = 1.0;
+ static bool user_rate_set = false;
+ static struct timespec user_per_tick_inc = {0, -1};
+ static bool user_per_tick_inc_set = false;
+-static bool user_per_tick_inc_set_backup = false;
+-
+ enum ft_mode_t {FT_FREEZE, FT_START_AT, FT_NOOP} ft_mode = FT_FREEZE;
+ 
+ /* Time to fake is not provided through FAKETIME env. var. */
+@@ -680,6 +678,7 @@ static bool load_time(struct timespec *tp)
+ #include <sys/stat.h>
+ 
+ static int fake_stat_disabled = 0;
++static bool user_per_tick_inc_set_backup = false;
+ 
+ void lock_for_stat()
+ {
+-- 
+2.23.0
+
diff --git a/package/faketime/Config.in b/package/faketime/Config.in
new file mode 100644
index 0000000000..6da29fd90f
--- /dev/null
+++ b/package/faketime/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_FAKETIME
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	bool "faketime"
+	help
+	  Faketime reports faked system time to programs without
+	  having to change the system-wide time.
+
+	  https://github.com/wolfcw/libfaketime
diff --git a/package/faketime/faketime.mk b/package/faketime/faketime.mk
index 85ce9a90d8..76e6e77fd3 100644
--- a/package/faketime/faketime.mk
+++ b/package/faketime/faketime.mk
@@ -9,6 +9,19 @@ FAKETIME_SITE = $(call github,wolfcw,libfaketime,v$(FAKETIME_VERSION))
 FAKETIME_LICENSE = GPL-2.0
 FAKETIME_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+FAKETIME_CFLAGS="-UFAKE_STAT"
+endif
+
+define FAKETIME_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) \
+		FAKETIME_COMPILE_CFLAGS=$(FAKETIME_CFLAGS)
+endef
+
+define FAKETIME_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install
+endef
+
 define HOST_FAKETIME_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)
 endef
@@ -17,4 +30,5 @@ define HOST_FAKETIME_INSTALL_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
 endef
 
+$(eval $(generic-package))
 $(eval $(host-generic-package))
-- 
2.23.0
