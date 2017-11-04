From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat,  4 Nov 2017 17:11:54 -0200
Subject: [Buildroot] [PATCH] schedtop: new package
Message-ID: <1509822714-17178-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...ix-build-with-Boost-Filesystem-library-V3.patch | 54 ++++++++++++++++++++++
 package/schedtop/Config.in                         | 25 ++++++++++
 package/schedtop/schedtop.mk                       | 30 ++++++++++++
 5 files changed, 111 insertions(+)
 create mode 100644 package/schedtop/0001-Fix-build-with-Boost-Filesystem-library-V3.patch
 create mode 100644 package/schedtop/Config.in
 create mode 100644 package/schedtop/schedtop.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f0f83b0f4291..8516a6c81e55 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1412,6 +1412,7 @@ F:	package/xr819-xradio/
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/libgdiplus/
 F:	package/mongodb/
+F:	package/schedtop/
 F:	package/stella/
 F:	package/tunctl/
 F:	package/ubus/
diff --git a/package/Config.in b/package/Config.in
index 55fe80139eaa..bda63c0804fb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1936,6 +1936,7 @@ menu "System tools"
 	source "package/s6-linux-utils/Config.in"
 	source "package/s6-portable-utils/Config.in"
 	source "package/s6-rc/Config.in"
+	source "package/schedtop/Config.in"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
 	source "package/smack/Config.in"
diff --git a/package/schedtop/0001-Fix-build-with-Boost-Filesystem-library-V3.patch b/package/schedtop/0001-Fix-build-with-Boost-Filesystem-library-V3.patch
new file mode 100644
index 000000000000..d0dc278dfb70
--- /dev/null
+++ b/package/schedtop/0001-Fix-build-with-Boost-Filesystem-library-V3.patch
@@ -0,0 +1,54 @@
+From 845e74ffc0d280163b66d81df963b4c3738f9666 Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Sun, 29 Oct 2017 13:20:10 -0200
+Subject: [PATCH] Fix build with Boost Filesystem library V3
+
+In version 3 of the boost filesystem library, string() is a member of
+path(), not directory_entry.
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ schedtop.cc | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/schedtop.cc b/schedtop.cc
+index 08aebae7170c..887b5e8b2f8f 100644
+--- a/schedtop.cc
++++ b/schedtop.cc
+@@ -267,21 +267,21 @@ void ProcSnapshot(StatMap &smap)
+     fs::directory_iterator end;
+     for (fs::directory_iterator iter("/proc"); iter != end; ++iter) {
+ 	
+-	std::string path(iter->string() + "/schedstat");
++	std::string path(iter->path().string() + "/schedstat");
+ 	if (fs::exists(path)) {
+ 	    std::ifstream is(path.c_str());
+ 	    
+ 	    if (!is.is_open())
+ 		throw std::runtime_error("could not open " + path);
+ 	    
+-	    Importer importer(smap, is, iter->string() + "/");
++	    Importer importer(smap, is, iter->path().string() + "/");
+ 	    
+ 	    importer += "sched_info.cpu_time";
+ 	    importer += "sched_info.run_delay";
+ 	    importer += "sched_info.pcount";
+ 	}
+ 
+-	path = iter->string() + "/sched";
++	path = iter->path().string() + "/sched";
+ 	if (fs::exists(path)) {
+ 	    std::ifstream is(path.c_str());
+ 	    
+@@ -312,7 +312,7 @@ void ProcSnapshot(StatMap &smap)
+ 		    lis >> tmp;
+ 
+ 		    Importer importer(smap, lis,
+-				      iter->string() + "/");
++				      iter->path().string() + "/");
+ 
+ 		    importer += type;
+ 		}
+-- 
+1.9.1
+
diff --git a/package/schedtop/Config.in b/package/schedtop/Config.in
new file mode 100644
index 000000000000..2c13e50bb8e2
--- /dev/null
+++ b/package/schedtop/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_SCHEDTOP
+	bool "schedtop"
+	depends on BR2_INSTALL_LIBSTDCPP # boost
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	depends on BR2_USE_WCHAR # boost
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_NCURSES
+	help
+	  This utility will process statistics from /proc/schedstat
+	  such that the busiest stats will bubble up to the top. It
+	  can alternately be sorted by the largest stat, or by name.
+	  Stats can be included or excluded based on reg-ex pattern
+	  matching.
+
+	  You should enable CONFIG_SCHEDSTATS in your Linux kernel
+	  configuration to use this utility.
+
+	  https://github.com/ghaskins/schedtop
+
+comment "schedtop needs a toolchain w/ C++, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/schedtop/schedtop.mk b/package/schedtop/schedtop.mk
new file mode 100644
index 000000000000..656e3716f26b
--- /dev/null
+++ b/package/schedtop/schedtop.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# schedtop
+#
+################################################################################
+
+SCHEDTOP_VERSION = 68dee649f96b3bf6db883de67f68ccc0b45cbc6e
+SCHEDTOP_SITE = $(call github,ghaskins,schedtop,$(SCHEDTOP_VERSION))
+SCHEDTOP_LICENSE = GPL-2.0
+SCHEDTOP_LICENSE_FILES = COPYING
+
+SCHEDTOP_DEPENDENCIES = boost ncurses
+
+SCHEDTOP_MAKE_ENV = $(TARGET_MAKE_ENV) OBJDIR="$(@D)/obj" LIBRARIES="-lboost_system"
+
+# uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+SCHEDTOP_MAKE_ENV += LIBRARIES+=" -latomic"
+endif
+
+define SCHEDTOP_BUILD_CMDS
+	$(SCHEDTOP_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define SCHEDTOP_INSTALL_TARGET_CMDS
+	$(SCHEDTOP_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		PREFIX=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
