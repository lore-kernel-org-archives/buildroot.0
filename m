From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Oct 2019 00:21:36 +0200
Subject: [Buildroot] [git commit] pkgconf: Add pkgconf system lib and
 include path
Message-ID: <20191019221958.1B5FB82B80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cc8680fe54c0b8f5008158e36e2157127f03a7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[Arnout: change order of variables]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkgconf/pkg-config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
index 8795f64b68..f411eb0926 100644
--- a/package/pkgconf/pkg-config.in
+++ b/package/pkgconf/pkg-config.in
@@ -2,7 +2,11 @@
 PKGCONFDIR=$(dirname $0)
 DEFAULT_PKG_CONFIG_LIBDIR=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/lib/pkgconfig:${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/share/pkgconfig
 DEFAULT_PKG_CONFIG_SYSROOT_DIR=${PKGCONFDIR}/../@STAGING_SUBDIR@
+DEFAULT_PKG_CONFIG_SYSTEM_INCLUDE_PATH=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/include
+DEFAULT_PKG_CONFIG_SYSTEM_LIBRARY_PATH=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/lib
 
 PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${DEFAULT_PKG_CONFIG_LIBDIR}} \
 	PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${DEFAULT_PKG_CONFIG_SYSROOT_DIR}} \
+	PKG_CONFIG_SYSTEM_INCLUDE_PATH=${PKG_CONFIG_SYSTEM_INCLUDE_PATH:-${DEFAULT_PKG_CONFIG_SYSTEM_INCLUDE_PATH}} \
+	PKG_CONFIG_SYSTEM_LIBRARY_PATH=${PKG_CONFIG_SYSTEM_LIBRARY_PATH:-${DEFAULT_PKG_CONFIG_SYSTEM_LIBRARY_PATH}} \
 	exec ${PKGCONFDIR}/pkgconf @STATIC@ "$@"
