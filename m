From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Mar 2015 20:59:39 +0100
Subject: [Buildroot] [PATCH v3 3/8] postgresql: enable bfin compile
In-Reply-To: <1426017584-6096-1-git-send-email-ps.report@gmx.net>
References: <1426017584-6096-1-git-send-email-ps.report@gmx.net>
Message-ID: <1426017584-6096-3-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- overwrite platform support with linux template
- disable spinlock support

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 --> v3:
  - no changes
---
 package/postgresql/postgresql.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 7ebf795..76b19d5 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -13,6 +13,11 @@ POSTGRESQL_LICENSE_FILES = COPYRIGHT
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 
+# unsupported platform, overwrite manually
+ifeq ($(BR2_bfin),y)
+POSTGRESQL_CONF_OPTS += --with-template=linux
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # overwrite IPV6 detection
 ifeq ($(BR2_INET_IPV6),y)
@@ -31,7 +36,7 @@ ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	POSTGRESQL_CONF_OPTS += --disable-thread-safety
 endif
 
-ifeq ($(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2),y)
+ifeq ($(BR2_bfin)$(BR2_microblazebe)$(BR2_microblazeel)$(BR2_nios2),y)
 	POSTGRESQL_CONF_OPTS += --disable-spinlocks
 endif
 
-- 
2.1.4
