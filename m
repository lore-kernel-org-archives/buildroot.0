From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 17 Sep 2015 15:37:58 +0100
Subject: [Buildroot] [PATCH RFC v1 1/1] gcc: fix problem with detecting SSP
	under uclibc-ng
Message-ID: <1442500678-4457-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/123/123a5b3f72ba8c1a4aa1cea5b7b846a04fd4e923/
http://autobuild.buildroot.net/results/38c/38cfa4e7249a8770b06dbd392acba79303d3f9bc/

.. and others.

GCC's configure stage assumes that if the glibc version, as denoted by
__GLIBC__ and __GLIBC_MINOR__, is greater or equal to 2.4 then stack
protection must be available in the C library. This results in the compiler
not attempting to link SSP helpers during the final link.

The problem is seen with uclibc-ng 1.0.6 (and likely greater) where they
updated the __GLIBC_MINOR__ value to 10. It will be seen in any libc
that permits stack protection to be disabled while exporting a glibc
version >= 2.4.

This patch overrides GCC to expect/not expect SSP support in libc based on
the toolchain's capability as understood by buildroot.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
Patch V1 :
This fix definitely solves the problem, however I doubt it's acceptable to
export environment variables in this way.

I had initially tried adding it to HOST_GCC_COMMON_CONF_ENV, and I
confirmed that this is passed into GCC's top level configure, however it
does not seem to propagate to the gcc/configure script. Another way would
be to patch GCC, however this would involve maintaining patches for all
the supported GCC versions.

Improvement suggestions welcome!
---
 package/gcc/gcc.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 501fcea..43835af 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -123,6 +123,14 @@ endif
 HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
 
+# Work around issue with detecting SSP support in the C library
+
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
+export gcc_cv_libc_provides_ssp=yes
+else
+export gcc_cv_libc_provides_ssp=no
+endif
+
 # libitm needs sparc V9+
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libitm
-- 
2.4.3
