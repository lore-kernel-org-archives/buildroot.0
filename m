From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 17 Oct 2019 16:29:01 +0100
Subject: [Buildroot] [RFC PATCH v2 02/30] pkgconf: Add pkgconf system lib
 and include path
In-Reply-To: <20191017152929.49153-1-michael.drake@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
Message-ID: <20191017152929.49153-3-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Preston <thomas.preston@codethink.co.uk>

Buildroot does not reconfigure pkgconf system library and system include
dirs to STAGING_DIR. This means that pkgconf prints the sysroot system
library and system include dirs instead of letting the compiler handle
the logical sysroot. This breaks the -isystem compiler flag, as it
increases the priority of the system library and system include
directories. For example:

	$ output/host/bin/pkg-config --cflags glib-2.0
	-Ioutput/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0
	-Ioutput/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/lib/glib-2.0/include
	-Ioutput/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/include

A header in `.../sysroot/usr/include` will be included before a header
in any directory specified with -isystem flags. Specifically, this
breaks the Chromium build system, which expects a C++ math.h in a
bundled LLVM C++ library, and gets a GNU C math.h instead.

Fix this by telling pkgconf about the sysroot's system library and
system include directories, so that it doesn't accidentally print them.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/pkgconf/pkg-config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
index 8795f64b68..894069c492 100644
--- a/package/pkgconf/pkg-config.in
+++ b/package/pkgconf/pkg-config.in
@@ -1,8 +1,12 @@
 #!/bin/sh
 PKGCONFDIR=$(dirname $0)
+DEFAULT_PKG_CONFIG_SYSTEM_LIBRARY_PATH=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/lib
+DEFAULT_PKG_CONFIG_SYSTEM_INCLUDE_PATH=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/include
 DEFAULT_PKG_CONFIG_LIBDIR=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/lib/pkgconfig:${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/share/pkgconfig
 DEFAULT_PKG_CONFIG_SYSROOT_DIR=${PKGCONFDIR}/../@STAGING_SUBDIR@
 
-PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${DEFAULT_PKG_CONFIG_LIBDIR}} \
+PKG_CONFIG_SYSTEM_LIBRARY_PATH=${PKG_CONFIG_SYSTEM_LIBRARY_PATH:-${DEFAULT_PKG_CONFIG_SYSTEM_LIBRARY_PATH}} \
+	PKG_CONFIG_SYSTEM_INCLUDE_PATH=${PKG_CONFIG_SYSTEM_INCLUDE_PATH:-${DEFAULT_PKG_CONFIG_SYSTEM_INCLUDE_PATH}} \
+	PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${DEFAULT_PKG_CONFIG_LIBDIR}} \
 	PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${DEFAULT_PKG_CONFIG_SYSROOT_DIR}} \
 	exec ${PKGCONFDIR}/pkgconf @STATIC@ "$@"
-- 
2.20.1
