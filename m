From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 10:57:53 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/clamav: link with
 libatomic when needed
Message-ID: <20190328095757.98A9E8152B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26dbbbc8348ef6ca3a507a5a31d65e7400f28326
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Configure check for OpenSSL fails:

/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-3/output/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(threads_pthread.o): In function `CRYPTO_atomic_add':
threads_pthread.c:(.text+0x1dc): undefined reference to `__atomic_is_lock_free'
threads_pthread.c:(.text+0x1f4): undefined reference to `__atomic_fetch_add_4'

Fixes
http://autobuild.buildroot.net/results/cae8da81adff3ba493154e0ba8b21d90367f82eb/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 50610dccfaa7badd4a995693107280de07bfe742)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/clamav.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 7afa008483..77760a3be7 100644
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
