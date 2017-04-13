From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 23:04:15 +0200
Subject: [Buildroot] [git commit] mpir: new package
Message-ID: <20170413210447.D1335827BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d996cb9d8abbc2393b4b0fb429df12a03ac0cd19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
[Thomas:
 - rewrap Config.in help text
 - add missing host-yasm dependency
 - remove custom MPIR_MAKE_OPTS, apparently not needed]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/mpir/Config.in |  8 ++++++++
 package/mpir/mpir.hash |  2 ++
 package/mpir/mpir.mk   | 15 +++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 83cf630..aa1bc56 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1422,6 +1422,7 @@ F:	package/yaml-cpp/
 N:	Semyon Kolganov <semenak94@mail.ru>
 F:	package/fmt/
 F:	package/libbson/
+F:	package/mpir/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/libgdiplus/
diff --git a/package/Config.in b/package/Config.in
index 9a81589..a5e48ac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1407,6 +1407,7 @@ endif
 	source "package/mpc/Config.in"
 	source "package/mpdecimal/Config.in"
 	source "package/mpfr/Config.in"
+	source "package/mpir/Config.in"
 	source "package/msgpack/Config.in"
 	source "package/mtdev2tuio/Config.in"
 	source "package/musl-compat-headers/Config.in"
diff --git a/package/mpir/Config.in b/package/mpir/Config.in
new file mode 100644
index 0000000..da4cc9f
--- /dev/null
+++ b/package/mpir/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MPIR
+	bool "mpir"
+	select BR2_PACKAGE_GMP
+	help
+	  MPIR is a highly optimised library for bignum arithmetic
+	  forked from the GMP bignum library.
+
+	  http://www.mpir.org/
diff --git a/package/mpir/mpir.hash b/package/mpir/mpir.hash
new file mode 100644
index 0000000..8320337
--- /dev/null
+++ b/package/mpir/mpir.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	52f63459cf3f9478859de29e00357f004050ead70b45913f2c2269d9708675bb	mpir-3.0.0.tar.bz2
diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
new file mode 100644
index 0000000..430d587
--- /dev/null
+++ b/package/mpir/mpir.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# mpir
+#
+################################################################################
+
+MPIR_VERSION = 3.0.0
+MPIR_SITE = http://www.mpir.org
+MPIR_SOURCE = mpir-$(MPIR_VERSION).tar.bz2
+MPIR_LICENSE = LGPL-3.0+
+MPIR_LICENSE_FILES = COPYING.LIB
+MPIR_INSTALL_STAGING = YES
+MPIR_DEPENDENCIES = gmp host-yasm
+
+$(eval $(autotools-package))
