From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Mar 2015 23:06:27 +0100
Subject: [Buildroot] [PATCH v2] postgresql: uses fork(), needs mmu
Message-ID: <1426629987-26889-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Additional revert 'postgresql: enable bfin compile' ([2]) which
is now useless (Blackfin is a noMMU architecture).

Fixes ([1]):
  postmaster/fork_process.o: In function `_fork_process':
  fork_process.c:(.text+0x22): undefined reference to `_fork'

[1] http://autobuild.buildroot.org/results/c9c/c9c93156fe64e89f35627aa592c47d8c5181ed7d
[2] http://git.buildroot.net/buildroot/commit/?id=6f177dac73a289db28772fb3e20347aba5cd5e67

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 --> v2:
  - additional revert 'postgresql: enable bfin compile'
    (suggested by Thomas Petazzoni)
---
 package/postgresql/Config.in     | 1 +
 package/postgresql/postgresql.mk | 7 +------
 2 files changed, 2 insertions(+), 6 deletions(-)

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
 
-- 
2.1.4
