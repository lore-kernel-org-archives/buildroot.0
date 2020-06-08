From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  8 Jun 2020 21:56:43 +0200
Subject: [Buildroot] [PATCHv2 3/3] package/gcc: disable libsanitizer with
 gcc 7.5 and glibc 2.31 toolchain
In-Reply-To: <20200608195643.2330204-1-romain.naour@gmail.com>
References: <20200608195643.2330204-1-romain.naour@gmail.com>
Message-ID: <20200608195643.2330204-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@smile.fr>

Disable libsanitizer due to a build issue with gcc 7.5 and glibc 2.31.
It would require to backport the following upstream commit
https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=4abc46b51af5751d657764d0c44b8a4aeed06302
but it conflict with gcc 7.5 libsanitizer code.
Disable libsanitizer since the gcc 7.5 branch is now closed
(unmaintained) and it's not a trivial merge.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gcc/gcc.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index af25d268a7..bca7a13805 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -118,6 +118,16 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --disable-libquadmath
 endif
 
+# Disable libsanitizer due to a build issue with gcc 7.5 and glibc 2.31.
+# It would require to backport the following upstream commit
+# https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=4abc46b51af5751d657764d0c44b8a4aeed06302
+# but it conflict with gcc 7.5 libsanitizer code.
+# Disable libsanitizer since the gcc 7.5 branch is now closed
+# (unmaintained) and it's not a trivial merge.
+ifeq ($(BR2_GLIBC_VERSION_2_31_X)$(BR2_GCC_VERSION_7_X),yy)
+HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
+endif
+
 # libsanitizer requires wordexp, not in default uClibc config. Also
 # doesn't build properly with musl.
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC)$(BR2_TOOLCHAIN_BUILDROOT_MUSL),y)
-- 
2.25.4
