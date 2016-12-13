From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Dec 2016 00:00:25 +0100
Subject: [Buildroot] [git commit] package/elfutils: add host variant
Message-ID: <20161213230031.8D4128016B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=edcbc2d032d84e5549b90854dc022672ef876a8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

elfutils (libelf and libdw) can be used by host-lttng-babeltrace.
Enable all library dependencies, but don't build the programs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Philippe Proulx <eeppeliteloop@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elfutils/elfutils.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 9485d3b..566e0bf 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -11,9 +11,11 @@ ELFUTILS_INSTALL_STAGING = YES
 ELFUTILS_LICENSE = GPLv2+ or LGPLv3+ (library)
 ELFUTILS_LICENSE_FILES = COPYING-GPLV2 COPYING-LGPLV3
 ELFUTILS_DEPENDENCIES = zlib
+HOST_ELFUTILS_DEPENDENCIES = host-zlib host-bzip2 host-xz
 
 # We patch configure.ac
 ELFUTILS_AUTORECONF = YES
+HOST_ELFUTILS_AUTORECONF = YES
 
 # Pass a custom program prefix to avoid a naming conflict between
 # elfutils binaries and binutils binaries.
@@ -21,6 +23,12 @@ ELFUTILS_CONF_OPTS += \
 	--disable-werror \
 	--program-prefix="eu-"
 
+HOST_ELFUTILS_CONF_OPTS = \
+	--disable-werror \
+	--with-bzlib \
+	--with-lzma \
+	--disable-progs
+
 # elfutils gets confused when lfs mode is forced, so don't
 ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
 ELFUTILS_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
@@ -73,3 +81,4 @@ ELFUTILS_CONF_OPTS += --disable-progs
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
