From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Feb 2020 22:06:39 +0100
Subject: [Buildroot] [git commit branch/next] package/libiberty: new package
Message-ID: <20200220212007.60C408E650@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c2126c963582ce0100745ca84de4cd2e6e4e212
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Some packages, like prelink-cross, want to use libiberty but do not bundle
their own instance (which is good!).

However, libiberty is made for being bundled in packages: all GNU
packages that use libiberty (gcc, Binutils, gdb, et al...) all have their own
bundled variant. This common practice means that there is no official upstream
for libiberty, the closest being as part of the combined Binutils-gdb tree.

So we introduce a new host-only package, that installs just libiberty from a
Binutils released tarball.

Again, as packages usually bundle libiberty, it usually only installs a static
version. Furthermore, it does not obey the usual --enable-shared and
--disable-static flags; it only ever builds a static version.

Furthermore, -fPIC is not used with this library, but some packages may pick it
to build shared objects. This behavior is the case for host-gdb, for example,
which accidentally picks that library instead of its internal one.

So, rather than fix the various gdb versions and variants we can use, we ensure
that the libiberty we install is usable in shared objects, and we always build
before host-gdb.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[yann.morin.1998 at free.fr:
  - fix DL_SUBDIR for a host-only package
  - add licensing info
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                       |  1 +
 package/libiberty/libiberty.hash |  5 +++++
 package/libiberty/libiberty.mk   | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 69b460f12c..3cb0a78e73 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2555,6 +2555,7 @@ F:	package/keyutils/
 F:	package/libbsd/
 F:	package/libedit/
 F:	package/libgsm/
+F:	package/libiberty/
 F:	package/libinput/
 F:	package/libiscsi/
 F:	package/libpri/
diff --git a/package/libiberty/libiberty.hash b/package/libiberty/libiberty.hash
new file mode 100644
index 0000000000..0dafcea520
--- /dev/null
+++ b/package/libiberty/libiberty.hash
@@ -0,0 +1,5 @@
+# From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
+sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
+
+# Locally computed, same as binutils.hash
+sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
diff --git a/package/libiberty/libiberty.mk b/package/libiberty/libiberty.mk
new file mode 100644
index 0000000000..6235a8b956
--- /dev/null
+++ b/package/libiberty/libiberty.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# libiberty
+#
+################################################################################
+
+LIBIBERTY_VERSION = 2.32
+LIBIBERTY_SOURCE = binutils-$(LIBIBERTY_VERSION).tar.xz
+LIBIBERTY_SITE = $(BR2_GNU_MIRROR)/binutils
+HOST_LIBIBERTY_DL_SUBDIR = binutils
+
+# We're only building libiberty here, not the full binutils suite
+LIBIBERTY_LICENSE = LGPL-2.1+
+LIBIBERTY_LICENSE_FILES = COPYING.LIB
+
+LIBIBERTY_SUBDIR = libiberty
+
+# We explicitly disable multilib, as we do in binutils.
+# By default, libiberty installs nothing, so we must force it.
+HOST_LIBIBERTY_CONF_OPTS = \
+	--disable-multilib \
+	--enable-install-libiberty
+
+# Some packages (e.g. host-gdb) will pick this library and build shared
+# objects with it. But libiberty does not honour the --enable-shared and
+# --disable-static flags; it only ever builds a static library no matter
+# what. So we must force -fPIC in build flags.
+HOST_LIBIBERTY_CONF_ENV = \
+	CFLAGS="$(HOST_CFLAGS) -fPIC" \
+	LDFLAGS="$(HOST_LDFLAGS) -fPIC"
+
+$(eval $(host-autotools-package))
