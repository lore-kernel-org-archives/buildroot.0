From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Mar 2020 16:58:28 +0100
Subject: [Buildroot] [PATCH 1/2] package/rocksdb: fix build on m68k_cf
Message-ID: <20200328155829.1133494-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/04c5afff034d8d71d11b95c998e3156292852de6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rocksdb/rocksdb.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/rocksdb/rocksdb.mk b/package/rocksdb/rocksdb.mk
index 5f9fd9f1cb..86732ad46c 100644
--- a/package/rocksdb/rocksdb.mk
+++ b/package/rocksdb/rocksdb.mk
@@ -12,6 +12,12 @@ ROCKSDB_INSTALL_STAGING = YES
 
 ROCKSDB_MAKE_OPTS = PORTABLE=1
 
+# Internal error, aborting at dwarf2cfi.c:2802 in connect_traces
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58864
+ifeq ($(BR2_m68k_cf),y)
+ROCKSDB_EXTRA_CXXFLAGS += -fno-defer-pop
+endif
+
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 ROCKSDB_DEPENDENCIES += bzip2
 ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_BZ2=0
@@ -72,6 +78,8 @@ ROCKSDB_BUILD_TARGETS += shared_lib static_lib
 ROCKSDB_INSTALL_TARGETS += install-shared install-static
 endif
 
+ROCKSDB_MAKE_OPTS += EXTRA_CXXFLAGS="$(ROCKSDB_EXTRA_CXXFLAGS)"
+
 define ROCKSDB_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(ROCKSDB_MAKE_OPTS) -C $(@D) \
 		$(ROCKSDB_BUILD_TARGETS)
-- 
2.25.1
