From: Geoffrey Ragot <geoffreyragot@gmail.com>
Date: Sun, 25 Oct 2015 12:12:53 +0100
Subject: [Buildroot] [PATCH 1/1] Update Apache2 package
Message-ID: <1445771573-14693-1-git-send-email-geoffrey.ragot@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, apache2 package does not allow
to use -DBIG_SECURITY_HOLE flag.
This flag allow httpd daemon to run as root.
It should be the responsability of the user
to take this decision.
This patch add an option to set this flag.
Previous behavior unchanged.

Signed-off-by: Geoffrey Ragot <geoffrey.ragot@gmail.com>
---
 package/apache/Config.in | 5 +++++
 package/apache/apache.mk | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/package/apache/Config.in b/package/apache/Config.in
index 0814a17..ff0e822 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -17,3 +17,8 @@ config BR2_PACKAGE_APACHE
 comment "apache needs a toolchain w/ dynamic library, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+
+if BR2_PACKAGE_APACHE
+config BR2_PACKAGE_APACHE_ALLOW_ROOT
+	bool "Allow apache running as root"
+endif
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index daf8fe2..2e935b5 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -35,6 +35,10 @@ APACHE_CONF_OPTS = \
 	--disable-lua \
 	--disable-luajit
 
+ifeq ($(BR2_PACKAGE_APACHE_ALLOW_ROOT),y)
+APACHE_CONF_OPTS += CFLAGS="$(TARGET_CFLAGS) -DBIG_SECURITY_HOLE"
+endif
+
 ifeq ($(BR2_ARCH_HAS_ATOMICS),y)
 APACHE_CONF_OPTS += --enable-nonportable-atomics=yes
 endif
-- 
2.6.1
