From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Dec 2015 12:13:58 +0100
Subject: [Buildroot] [PATCH 1/2 v2] package/gawk: clean the mpfr dependency
In-Reply-To: <cover.1449400403.git.yann.morin.1998@free.fr>
References: <cover.1449400403.git.yann.morin.1998@free.fr>
Message-ID: <fc7d5f5fe9de55ce657385d66158fb9f87887cdc.1449400403.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When available, mpfr provides support for BIGNUM, which allows gawk to
work on arbitrarily-large numbers (hence the name).

Forcibly disable mpfr if the mpfr package is not enabled. Let
./configure find it automatically when it is enabled.

To be noted, the host-gawk need not have BIGNUM to build the target
variant with support for BIGNUM.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v1 -> v2:
  - better comment on why no --with-mpfr  (Arnout)
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
 
-- 
1.9.1
