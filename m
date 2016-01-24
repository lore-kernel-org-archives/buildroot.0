From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 00:08:00 +0100
Subject: [Buildroot] [PATCH 14/21] squid: rework atomic handling
In-Reply-To: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1453676887-31236-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

squid can use the __sync built-ins when available, but uses an
AC_TRY_RUN autoconf tests to check their availability, which isn't
compatible with cross-compilation. Due to this, squid.mk is already
hinting the configure script about this by passing
squid_cv_gnu_atomics=yes/no depending on the availability of atomic
operations.

So far, squid.mk was assuming that BR2_ARCH_HAS_ATOMICS &&
BR2_ARCH_IS_64 was needed, since 8 bytes __sync built-ins are
used. However, this was a bit too restrictive, since certain 32 bits
architectures (ARM, x86) do provide 8 bytes __sync built-ins.

So, instead of using BR2_ARCH_HAS_ATOMICS, we now rely on
BR2_TOOLCHAIN_HAS_SYNC_4 and BR2_TOOLCHAIN_HAS_SYNC_8, since both 4
bytes and 8 bytes __sync built-ins are tested by the autoconf test.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 3110573..f205da2 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -41,12 +41,10 @@ SQUID_CONF_OPTS = \
 	--with-swapdir=/var/cache/squid/ \
 	--with-default-user=squid
 
-# Atomics in Squid use __sync_add_and_fetch_8, i.e a 64 bits atomic
-# operation. This atomic intrinsic is only available natively on
-# 64-bit architectures that have atomic operations. On 32-bit
-# architectures, it would be provided by libatomic, but Buildroot
-# typically doesn't provide it.
-ifeq ($(BR2_ARCH_HAS_ATOMICS)$(BR2_ARCH_IS_64),yy)
+# Atomics in Squid use __sync built-ins on 4 and 8 bytes. However, the
+# configure script tests them using AC_TRY_RUN, so we have to give
+# some hints.
+ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4)$(BR2_TOOLCHAIN_HAS_SYNC_8),yy)
 SQUID_CONF_ENV += squid_cv_gnu_atomics=yes
 else
 SQUID_CONF_ENV += squid_cv_gnu_atomics=no
-- 
2.6.4
