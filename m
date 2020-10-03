From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2020 08:08:45 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/gcc: help
 libbacktrace detection of sync builtins
Message-ID: <20201003061937.B874E8E1B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=577f258ceb55d16c28f98142e189f866fd0d848c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0bec4c8a4a90cde57ccd46dcad4b9a860c71ffde)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index e34801390b..b58f17575a 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -138,6 +138,14 @@ ifeq ($(BR2_sparc)$(BR2_sparc64),y)
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
