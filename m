From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 20 Jul 2020 18:47:21 +0200
Subject: [Buildroot] [PATCH 2/4] package/localedef: use upstream glibc
 version
In-Reply-To: <20200720164723.359198-1-romain.naour@gmail.com>
References: <20200720164723.359198-1-romain.naour@gmail.com>
Message-ID: <20200720164723.359198-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Since the upstream version and site are always defined in Kconfig now,
they are always available, so we can use them to define the localedef
version and site. We also change the localedef hash file to be a
symlink to the glibc one.

Now, there is no manual action to do to keep localedef and glibc in
sync for the internal toolchain.

External toolchains will use the upstream glibc version (as is currently
the case already); with some luck, it is good enough if the external
toolchain is not too old (2.26 or older may have issues, but there's
nothing we can do as we can't know what version is used).

Additionally, for some architectures, the internall toolchain uses a
forked glibc tree. In theory, we would also want to use the localedef
from those trees, but that would mean we would have to carry a patch for
each, to be able to build only localedef. This is highly inpractical.

However, those architectures are close enought to upstream that upstream
localedef is compatible. Besides, the current behaviour is already to
use an upstream localedef for those architectures anyway, so we keep
doing that.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/glibc/Config.in                                   | 3 +--
 .../localedef.hash                                        | 8 +-------
 package/localedef/localedef.mk                            | 6 ++----
 3 files changed, 4 insertions(+), 13 deletions(-)
 mode change 100644 => 120000 package/localedef/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/localedef.hash

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 1c5b33a0dd..9901ad8537 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -19,11 +19,10 @@ config BR2_PACKAGE_GLIBC_UTILS
 endif # BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
 # Keep version string outside of the conditional and keep the upstream
-# version last and unconditional.
+# version last and unconditional, because it is shared with localedef.
 
 # Generate upstream version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-# When updating the version, please also update localedef
 config BR2_GLIBC_VERSION_UPSTREAM
 	string
 	default "2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427"
diff --git a/package/localedef/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/localedef.hash b/package/localedef/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/localedef.hash
deleted file mode 100644
index 6677d32db9..0000000000
--- a/package/localedef/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/localedef.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Locally calculated (fetched from Github)
-sha256  4462f56696332efbc5b0c2f86d7aa75a2a02c3d44bc4345fa42b5bab1225de5c  glibc-2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427.tar.gz
-
-# Hashes for license files
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  35bdb41dc0bcb10702ddacbd51ec4c0fe6fb3129f734e8c85fc02e4d3eb0ce3f  LICENSES
diff --git a/package/localedef/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/localedef.hash b/package/localedef/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/localedef.hash
new file mode 120000
index 0000000000..7e125009ee
--- /dev/null
+++ b/package/localedef/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/localedef.hash
@@ -0,0 +1 @@
+../../glibc/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/glibc.hash
\ No newline at end of file
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index f6e26b5666..4c7b442d72 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-# Use the same VERSION and SITE as target glibc
-# As in glibc.mk, generate version string using:
-#   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427
+# Use the same VERSION and SITE as upstream glibc
+LOCALEDEF_VERSION = $(call qstrip,$(BR2_GLIBC_VERSION_UPSTREAM))
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.25.4
