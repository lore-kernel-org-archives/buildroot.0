From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Mar 2015 11:33:31 -0300
Subject: [Buildroot] [PATCH 1/2] squid: bump to version 3.5.3
Message-ID: <1427639612-25592-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/squid.hash |  6 +++---
 package/squid/squid.mk   | 10 +++++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 7d3e3f6..85f467a 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.2.tar.xz.asc
-md5	0330ec9f69e333c2a81fa4502ba96a22	squid-3.5.2.tar.xz
-sha1	9c546d72df741c9ddaa6da87baa2112503bcbb45	squid-3.5.2.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.3.tar.xz.asc
+md5	6cd553300a2253c0913f498beb79ee51	squid-3.5.3.tar.xz
+sha1	6919305e16f59387197cf543f525e41f510b4727	squid-3.5.3.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 874332f..fc82392 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).2
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).3
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
@@ -42,6 +42,14 @@ SQUID_CONF_OPTS = \
 	--enable-icap-client \
 	--with-default-user=squid
 
+# Atomics support requires __sync_add_and_fetch_8 (64-bits)
+# That's only handled in gcc's libatomic for 32-bit arches
+ifeq ($(BR2_ARCH_HAS_ATOMICS)$(BR2_ARCH_IS_64),yy)
+	SQUID_CONF_ENV += squid_cv_gnu_atomics=yes
+else
+	SQUID_CONF_ENV += squid_cv_gnu_atomics=no
+endif
+
 # On uClibc librt needs libpthread
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
 	SQUID_CONF_ENV += ac_cv_search_shm_open="-lrt -lpthread"
-- 
2.0.5
