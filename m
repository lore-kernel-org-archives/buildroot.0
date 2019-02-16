From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Feb 2019 09:19:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/clamav: link with libatomic when
 needed
Message-ID: <20190216081905.21631-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Configure check for OpenSSL fails:

/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-3/output/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(threads_pthread.o): In function `CRYPTO_atomic_add':
threads_pthread.c:(.text+0x1dc): undefined reference to `__atomic_is_lock_free'
threads_pthread.c:(.text+0x1f4): undefined reference to `__atomic_fetch_add_4'

Fixes
http://autobuild.buildroot.net/results/cae8da81adff3ba493154e0ba8b21d90367f82eb/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/clamav.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index b5a184a67c..8900b4819a 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -22,6 +22,10 @@ CLAMAV_CONF_ENV = \
 	ac_cv_c_mmap_private=yes \
 	have_cv_ipv6=yes
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+CLAMAV_CONF_ENV += LIBS=-latomic
+endif
+
 # UCLIBC_HAS_FTS is disabled, therefore disable fanotify (missing fts.h)
 CLAMAV_CONF_OPTS = \
 	--with-dbdir=/var/lib/clamav \
-- 
2.20.1
