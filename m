From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 22:02:37 +0100
Subject: [Buildroot] [git commit] postgresql: enable bfin compile
Message-ID: <20150316210303.1526E7FE69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f177dac73a289db28772fb3e20347aba5cd5e67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- overwrite platform support with linux template
- disable spinlock support

[Thomas: use the --with-template=linux option unconditionally.]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 7dc3f0b..d426093 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -13,6 +13,11 @@ POSTGRESQL_LICENSE_FILES = COPYRIGHT
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 
+# In most cases, postgresql configure script is able to guess the
+# platform, except for noMMU platforms that use the 'uclinux' host
+# qualifier, as is the case on Blackfin
+POSTGRESQL_CONF_OPTS = --with-template=linux
+
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # overwrite IPV6 detection
 ifeq ($(BR2_INET_IPV6),y)
@@ -31,7 +36,7 @@ ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	POSTGRESQL_CONF_OPTS += --disable-thread-safety
 endif
 
-ifeq ($(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2)$(BR2_xtensa),y)
+ifeq ($(BR2_bfin)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2)$(BR2_xtensa),y)
 	POSTGRESQL_CONF_OPTS += --disable-spinlocks
 endif
 
