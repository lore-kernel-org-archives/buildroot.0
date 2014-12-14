From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Dec 2014 12:51:31 +0100
Subject: [Buildroot] [PATCH] package/nmap: fix shared-only build
Message-ID: <1418557891-24865-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changeset f1d3e09 (Build shared libraries only as the default) broke the
nmap package.

nmap builds an internal version of libdnet, and tries to statically link
against it. Of course, this breaks for shared-only builds, since in that
case there is no static lib ever built.

Using an external libdnet is not really an option:

  - libdnet comes from dnprogs, from the linux-decnet project;
    unfortunately, their build-system is not ammenable to
    cross-compilation, and is a real pain to deal with;

  - nmap's bundled libdnet is anyway heavily modified, which precludes
    using an external libdnet.

Fix that by considering libdnet to be a purely internal library, and by
configuring it with --enable-static, always.

nmap's ./configure uses AC_CONFIG_SUBDIRS() to configure the libdnet
sub-directory; AC_CONFIG_SUBDIRS() calls ./configure in all the
sub-directories it is passed as arguments. Unfortunately, it is not
possible to specify extra ./configure arguments whith AC_CONFIG_SUBDIRS.

We are using an autoconf trick, which is, when configuring
sub-directories with AC_CONFIG_SUBDIRS(), it will first try to execute
configure.gnu if it exists, before it fallbacks to running plain
configure. See:
    https://www.gnu.org/software/autoconf/manual/autoconf.html#Subdirectories

So, we provide a configure.gnu that is just a wrapper around the real
configure, which sole purpose is to append --enable-static when calling
the real configure.

Note1: since this libdnet is considered a purely internal library, we
also always pass --disable-shared, since it is not needed at all.

Note2: since this libdnet is considered a purely internal library, it
should not be exposed to other packages, and thus nmap does not install
it, neither in target nor in staging, neither static nor shared, which
is what we want.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
---
 package/nmap/0001-libdnet-wrapper-configure.patch | 11 +++++++++++
 package/nmap/nmap.mk                              |  5 +++++
 2 files changed, 16 insertions(+)
 create mode 100644 package/nmap/0001-libdnet-wrapper-configure.patch

diff --git a/package/nmap/0001-libdnet-wrapper-configure.patch b/package/nmap/0001-libdnet-wrapper-configure.patch
new file mode 100644
index 0000000..a85242a
--- /dev/null
+++ b/package/nmap/0001-libdnet-wrapper-configure.patch
@@ -0,0 +1,11 @@
+libdnet: always build a static library
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/libdnet-stripped/configure.gnu b/libdnet-stripped/configure.gnu
+--- /dev/null
++++ b/libdnet-stripped/configure.gnu
+@@ -0,0 +1,3 @@
++#!/bin/sh
++
++exec "${0%.gnu}" "${@}" --enable-static --disable-shared
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 938de25..58370b5 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -14,6 +14,11 @@ NMAP_CONF_OPTS = --without-liblua --without-zenmap \
 NMAP_LICENSE = GPLv2
 NMAP_LICENSE_FILES = COPYING
 
+define NMAP_WRAPPER_EXEC
+	chmod +x $(@D)/libdnet-stripped/configure.gnu
+endef
+NMAP_POST_PATCH_HOOKS += NMAP_WRAPPER_EXEC
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NMAP_CONF_OPTS += --with-openssl="$(STAGING_DIR)/usr"
 NMAP_DEPENDENCIES += openssl
-- 
1.9.1
