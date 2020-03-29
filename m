From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 15:49:18 +0200
Subject: [Buildroot] [git commit] package/rocksdb: fix build on m68k_cf
Message-ID: <20200329133645.32FC488DA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0ae390d43a70fd45a9956ab21622007d49eb068
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/04c5afff034d8d71d11b95c998e3156292852de6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
