From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 22:36:03 +0200
Subject: [Buildroot] [git commit] squid: bump to version 3.5.3
Message-ID: <20150330203707.CAD1F81813@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9035aba2c10702bc73932720f7b5d2e97d719380
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: slightly expand the comment about atomic operations, after
the discussion with Baruch.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.hash |    6 +++---
 package/squid/squid.mk   |   13 ++++++++++++-
 2 files changed, 15 insertions(+), 4 deletions(-)

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
index 874332f..fdf540e 100644
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
@@ -42,6 +42,17 @@ SQUID_CONF_OPTS = \
 	--enable-icap-client \
 	--with-default-user=squid
 
+# Atomics in Squid use __sync_add_and_fetch_8, i.e a 64 bits atomic
+# operation. This atomic intrinsic is only available natively on
+# 64-bit architectures that have atomic operations. On 32-bit
+# architectures, it would be provided by libatomic, but Buildroot
+# typically doesn't provide it.
+ifeq ($(BR2_ARCH_HAS_ATOMICS)$(BR2_ARCH_IS_64),yy)
+	SQUID_CONF_ENV += squid_cv_gnu_atomics=yes
+else
+	SQUID_CONF_ENV += squid_cv_gnu_atomics=no
+endif
+
 # On uClibc librt needs libpthread
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
 	SQUID_CONF_ENV += ac_cv_search_shm_open="-lrt -lpthread"
