From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 23:16:29 +0100
Subject: [Buildroot] [git commit] postgresql: uses fork(), needs mmu
Message-ID: <20150317221703.BC8358182C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98689e11f5b64c18f92510cff922eeee0bf262d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Additional revert 'postgresql: enable bfin compile' ([2]) which
is now useless (Blackfin is a noMMU architecture).

Fixes ([1]):
  postmaster/fork_process.o: In function `_fork_process':
  fork_process.c:(.text+0x22): undefined reference to `_fork'

[1] http://autobuild.buildroot.org/results/c9c/c9c93156fe64e89f35627aa592c47d8c5181ed7d
[2] http://git.buildroot.net/buildroot/commit/?id=6f177dac73a289db28772fb3e20347aba5cd5e67

[Thomas: propagate to the appropriate reverse dependencies.]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/Config.ext           |    1 +
 package/postgresql/Config.in     |    1 +
 package/postgresql/postgresql.mk |    7 +------
 package/qt5/qt5base/Config.in    |    1 +
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 935f966..1d9c2fe 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -149,6 +149,7 @@ comment "MySQL drivers need a toolchain w/ C++, threads"
 config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
 	bool "PostgreSQL"
 	select BR2_PACKAGE_POSTGRESQL
+	depends on BR2_USE_MMU # postgresql
 	help
 	  PDO driver for PostgreSQL
 
diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 519b2a1..4c53703 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_POSTGRESQL
 	bool "postgresql"
+	depends on BR2_USE_MMU # fork()
 	help
 	  PostgreSQL is a powerful, open source object-relational
 	  database system.
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index d426093..7dc3f0b 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -13,11 +13,6 @@ POSTGRESQL_LICENSE_FILES = COPYRIGHT
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 
-# In most cases, postgresql configure script is able to guess the
-# platform, except for noMMU platforms that use the 'uclinux' host
-# qualifier, as is the case on Blackfin
-POSTGRESQL_CONF_OPTS = --with-template=linux
-
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # overwrite IPV6 detection
 ifeq ($(BR2_INET_IPV6),y)
@@ -36,7 +31,7 @@ ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	POSTGRESQL_CONF_OPTS += --disable-thread-safety
 endif
 
-ifeq ($(BR2_bfin)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2)$(BR2_xtensa),y)
+ifeq ($(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2)$(BR2_xtensa),y)
 	POSTGRESQL_CONF_OPTS += --disable-spinlocks
 endif
 
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 17ed5db..20fd905 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -60,6 +60,7 @@ config BR2_PACKAGE_QT5BASE_MYSQL
 config BR2_PACKAGE_QT5BASE_PSQL
 	bool "PostgreSQL Plugin"
 	select BR2_PACKAGE_POSTGRESQL
+	depends on BR2_USE_MMU # postgresql
 	help
 	  Build PostgreSQL plugin
 	  If unsure, say n.
