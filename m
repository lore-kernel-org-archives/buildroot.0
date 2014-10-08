From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  8 Oct 2014 23:20:35 +0200
Subject: [Buildroot] [PATCH] gcc/gcc-initial: fix build of the AVR32
	toolchain
Message-ID: <1412803235-23147-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we switched to a two stage gcc build process, the AVR32
toolchain stopped building. This is because with such an old gcc
version, we cannot use the all-target-libgcc and install-target-libgcc
targets.

Before the two stage gcc, libgcc was only built in gcc-intermediate,
which carried a similar logic. This commit basically restores in
gcc-initial the logic that used to be in gcc-intermediate, which
consists in using the all-target-libcc and install-target-libgcc
targets only for gcc versions others than the AVR32 one.

Using the BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE option has a way of
distinguishing the old AVR32 compiler from the other gcc versions is a
bit ugly, but it's what was done in gcc-intermediate before. And since
the AVR32 support is due to go away at some point in the hopefully
near future, we don't care that much.

This will fix the build of the two AVR32 defconfig that have been
constantly failing since switching to the two stage gcc process.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-initial/gcc-initial.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 74e2d32..0fa2353 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -53,7 +53,12 @@ HOST_GCC_INITIAL_CONF_ENV = \
 # We need to tell gcc that the C library will be providing the ssp
 # support, as it can't guess it since the C library hasn't been built
 # yet (we're gcc-initial).
-HOST_GCC_INITIAL_MAKE_OPTS = $(if $(BR2_TOOLCHAIN_HAS_SSP),gcc_cv_libc_provides_ssp=yes) all-gcc all-target-libgcc
-HOST_GCC_INITIAL_INSTALL_OPTS = install-gcc install-target-libgcc
+HOST_GCC_INITIAL_MAKE_OPTS = $(if $(BR2_TOOLCHAIN_HAS_SSP),gcc_cv_libc_provides_ssp=yes) all-gcc
+HOST_GCC_INITIAL_INSTALL_OPTS = install-gcc
+
+ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
+HOST_GCC_INITIAL_MAKE_OPTS += all-target-libgcc
+HOST_GCC_INITIAL_INSTALL_OPTS += install-target-libgcc
+endif
 
 $(eval $(host-autotools-package))
-- 
2.0.0
