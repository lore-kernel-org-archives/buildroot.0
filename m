From: guoren at kernel.org <guoren@kernel.org>
Date: Wed,  8 May 2019 16:58:32 +0800
Subject: [Buildroot] [PATCH V2 6/9] package/gdb: Add C-SKY support
In-Reply-To: <1557305915-11247-1-git-send-email-guoren@kernel.org>
References: <1557305915-11247-1-git-send-email-guoren@kernel.org>
Message-ID: <1557305915-11247-6-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

Add gdb build for C-SKY Architecture.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 package/gdb/Config.in.host | 1 +
 package/gdb/gdb.hash       | 2 ++
 package/gdb/gdb.mk         | 7 +++++++
 3 files changed, 10 insertions(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 969168f..0aa7d0a 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -48,6 +48,7 @@ choice
 	prompt "GDB debugger Version"
 	default BR2_GDB_VERSION_8_1
 	depends on !BR2_arc
+	depends on !BR2_csky
 	help
 	  Select the version of gdb you wish to use.
 
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 1104da5..90a60b0 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -6,3 +6,5 @@ sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5
 
 # Locally calculated (fetched from Github)
 sha512  8303e399e396f5c15dc976e48503fc7d45a720dd1a470443f755c5f2458d092b4392e7ae582abc251bc4b43a778ad784f764286a2a05abfc1649cbeeeb6e7d15 	gdb-arc-2018.09-release-gdb.tar.gz
+# Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
+sha512  c421e1f3c0d6cfb3c04544573c0c4b0075c8d8e3d563c6c234fcc1e4c2167ab203d1e57aec3b58abd348dc46f8cf9b47b753d3a43dba3ea970c9c9a6bd78c07b	gdb-4ecb98fbc2f94dbe01b69384afbc515107de73df.tar.gz
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index a926961..460d21f 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -14,6 +14,13 @@ GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
 endif
 
+ifeq ($(BR2_csky),y)
+GDB_VERSION = 4ecb98fbc2f94dbe01b69384afbc515107de73df
+GDB_SITE = $(call github,c-sky,binutils-gdb,$(GDB_VERSION))
+GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
+GDB_FROM_GIT = y
+endif
+
 GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 
-- 
2.7.4
