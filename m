From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 25 Sep 2020 11:04:51 +0200
Subject: [Buildroot] [PATCH] package/gcc: help libbacktrace detection of
 sync builtins
Message-ID: <20200925090451.1407258-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

The logic in libbacktrace/configure.ac to detect if __sync builtins
are available assumes they are as soon as target_subdir is not
empty, i.e when cross-compiling. However, some platforms do not have
__sync builtins, so help the configure script a bit.

"libbacktrace_cv_sys_sync=no" is lost when it is added to
HOST_GCC_COMMON_CONF_ENV because the environment is not exported
when executing the libbacktrace configure script.

Use target_configargs to force "libbacktrace_cv_sys_sync=no" when
executiong the libbacktrace configure script.

Fixes:
https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359681

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Romain: use target_configargs="libbacktrace_cv_sys_sync=no"]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/gcc.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b834269adc..6e60ea9980 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -141,6 +141,14 @@ ifeq ($(BR2_sparc)$(BR2_sparc64),y)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
 endif
 
+# The logic in libbacktrace/configure.ac to detect if __sync builtins
+# are available assumes they are as soon as target_subdir is not
+# empty, i.e when cross-compiling. However, some platforms do not have
+# __sync builtins, so help the configure script a bit.
+ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4),)
+HOST_GCC_COMMON_CONF_ENV += target_configargs="libbacktrace_cv_sys_sync=no"
+endif
+
 # TLS support is not needed on uClibc/no-thread and
 # uClibc/linux-threads, otherwise, for all other situations (glibc,
 # musl and uClibc/NPTL), we need it.
-- 
2.25.4
