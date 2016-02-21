From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:28:45 +0100
Subject: [Buildroot] [git commit] package/gawk: add optional support for
	libsigsegv
Message-ID: <20160221202911.E060D7F934@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82efed68dad1831056aeba502641124bdc7ed6c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libsigsegv was compiled before, gawk will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/gawk | grep NEEDED
  0x0000000000000001 (NEEDED)             Shared library: [libsigsegv.so.2]
[...]

The build system offers no option to en-/disable libsigsegv support:
http://git.savannah.gnu.org/cgit/gawk.git/tree/m4/libsigsegv.m4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gawk/gawk.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 507ea6d..da9be95 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -16,6 +16,10 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 GAWK_DEPENDENCIES += busybox
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSIGSEGV),y)
+GAWK_DEPENDENCIES += libsigsegv
+endif
+
 # --with-mpfr requires an argument so just let
 # configure find it automatically
 ifeq ($(BR2_PACKAGE_MPFR),y)
