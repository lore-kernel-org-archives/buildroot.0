From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 23:00:26 +0200
Subject: [Buildroot] [git commit branch/next] package/gdb: add C-SKY
 specific version
Message-ID: <20190531210133.DE6718D48D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=540354532c8263c4a953fce383a8413cc53c50eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add gdb build for C-SKY Architecture:

 - Support host-gdb
 - Support gdbserver for target

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in      | 1 +
 package/gdb/Config.in.host | 2 ++
 package/gdb/gdb.hash       | 3 +++
 package/gdb/gdb.mk         | 6 ++++++
 4 files changed, 12 insertions(+)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 0c3465d145..ab3d2157b6 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -57,6 +57,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	bool "full debugger"
 	depends on BR2_USE_WCHAR
 	depends on !BR2_sh
+	depends on !BR2_csky
 	select BR2_PACKAGE_NCURSES
 
 comment "full gdb on target needs a toolchain w/ wchar"
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 9fdb0548b6..7ce26c1628 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -48,6 +48,7 @@ choice
 	prompt "GDB debugger Version"
 	default BR2_GDB_VERSION_8_1
 	depends on !BR2_arc
+	depends on !BR2_csky
 	help
 	  Select the version of gdb you wish to use.
 
@@ -95,6 +96,7 @@ config BR2_PACKAGE_GDB_NEEDS_CXX11
 config BR2_GDB_VERSION
 	string
 	default "arc-2019.03-rc1-gdb" if BR2_arc
+	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
 	default "8.0.1"    if BR2_GDB_VERSION_8_0
 	default "8.1.1"    if BR2_GDB_VERSION_8_1 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 9b7517eabf..f508b6bffc 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -6,3 +6,6 @@ sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5
 
 # Locally calculated (fetched from Github)
 sha512  bc6dcd92991222418795c49b8fc13df7354b34ba7a7f1e4214b108776da0dad730259aa4611086694bc9291126f5182b449bbc22409aeadc44b89e7a42fb4e00 	gdb-arc-2019.03-rc1-gdb.tar.gz
+
+# Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
+sha512  c421e1f3c0d6cfb3c04544573c0c4b0075c8d8e3d563c6c234fcc1e4c2167ab203d1e57aec3b58abd348dc46f8cf9b47b753d3a43dba3ea970c9c9a6bd78c07b	gdb-4ecb98fbc2f94dbe01b69384afbc515107de73df.tar.gz
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index a926961372..46d745a897 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -14,6 +14,12 @@ GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
 endif
 
+ifeq ($(BR2_csky),y)
+GDB_SITE = $(call github,c-sky,binutils-gdb,$(GDB_VERSION))
+GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
+GDB_FROM_GIT = y
+endif
+
 GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 
