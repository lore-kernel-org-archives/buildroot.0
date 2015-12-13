From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 16:01:18 +0100
Subject: [Buildroot] [git commit] package/gawk: clean the mpfr dependency
Message-ID: <20151213150127.B3A0581810@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3fd70c0431a8905ff7840071373265d8fe28229
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When available, mpfr provides support for BIGNUM, which allows gawk to
work on arbitrarily-large numbers (hence the name).

Forcibly disable mpfr if the mpfr package is not enabled. Let
./configure find it automatically when it is enabled.

To be noted, the host-gawk need not have BIGNUM to build the target
variant with support for BIGNUM.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gawk/gawk.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 6702c48..0fd131d 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -7,7 +7,7 @@
 GAWK_VERSION = 4.1.3
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
-GAWK_DEPENDENCIES = host-gawk $(if $(BR2_PACKAGE_MPFR),mpfr)
+GAWK_DEPENDENCIES = host-gawk
 GAWK_LICENSE = GPLv3+
 GAWK_LICENSE_FILES = COPYING
 
@@ -16,6 +16,14 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 GAWK_DEPENDENCIES += busybox
 endif
 
+# --with-mpfr requires an argument so just let
+# configure find it automatically
+ifeq ($(BR2_PACKAGE_MPFR),y)
+GAWK_DEPENDENCIES += mpfr
+else
+GAWK_CONF_OPTS += --without-mpfr
+endif
+
 # We don't have a host-busybox, and we don't want to use readline or mpfr
 HOST_GAWK_DEPENDENCIES =
 
