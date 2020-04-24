From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 24 Apr 2020 18:48:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/gcc: disable libsanitizer with gcc
 7.5 and glibc toolchain
Message-ID: <20200424164851.19897-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable libsanitizer due to a build issue with gcc 7.5 and glibc 2.31.
It would require to backport the following upstream commit
https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=4abc46b51af5751d657764d0c44b8a4aeed06302
but it conflict with gcc 7.5 libsanitizer code.
Disable libsanitizer since the gcc 7.5 branch is now closed
(unmaintained) and it's not a trivial merge.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Otherwise we have to disable gcc 7.5 entirely for glibc toolchain.
---
 package/gcc/gcc.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 50f2a3fcb7..2fb1d29199 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -126,6 +126,16 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --disable-libquadmath
 endif
 
+# Disable libsanitizer due to a build issue with gcc 7.5 and glibc 2.31.
+# It would require to backport the following upstream commit
+# https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=4abc46b51af5751d657764d0c44b8a4aeed06302
+# but it conflict with gcc 7.5 libsanitizer code.
+# Disable libsanitizer since the gcc 7.5 branch is now closed
+# (unmaintained) and it's not a trivial merge.
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC)$(BR2_GCC_VERSION_7_X),yy)
+HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
+endif
+
 # libsanitizer requires wordexp, not in default uClibc config. Also
 # doesn't build properly with musl.
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC)$(BR2_TOOLCHAIN_BUILDROOT_MUSL),y)
-- 
2.21.1
