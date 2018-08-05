From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Aug 2018 10:46:19 +0200
Subject: [Buildroot] [PATCH] package/polkit: needs glibc
Message-ID: <20180805084619.13182-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recent bump of polkit introduced a version that now unconditionally
uses glibc-specific functions from the getnetgrent() familly, which are
not available on musl or uClibc-ng.

Hide away polkit when the C library is not glibc.

Propagate the dependency to packages that select polkit: udisks and
systemd. For systemd, add a comment.

Fixes:
    http://autobuild.buildroot.org/results/d78/d783e6db60b187aa591f4b0150c590ab3aa5252f/ (musl)
    http://autobuild.buildroot.org/results/ba5/ba5da960c70c765bee753a79b9ad2c10967d05d6/ (uclibc)
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Artem Panfilov <apanfilov@spectracom.com>
---
 package/polkit/Config.in  | 5 +++--
 package/systemd/Config.in | 4 ++++
 package/udisks/Config.in  | 6 +++---
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/polkit/Config.in b/package/polkit/Config.in
index debd1d9daf..ac17cb4dc3 100644
--- a/package/polkit/Config.in
+++ b/package/polkit/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_POLKIT
 	bool "polkit"
-	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
 	help
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index c5a109675c..1cc0021b87 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -216,6 +216,7 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 
 config BR2_PACKAGE_SYSTEMD_POLKIT
 	bool "enable polkit support"
+	depends on BR2_TOOLCHAIN_USES_GLIBC # polkit
 	select BR2_PACKAGE_POLKIT
 	help
 	  If enabled, systemd is built with polkit support and policy
@@ -225,6 +226,9 @@ config BR2_PACKAGE_SYSTEMD_POLKIT
 
 	  http://wiki.freedesktop.org/www/Software/polkit/
 
+comment "polkit support needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 config BR2_PACKAGE_SYSTEMD_QUOTACHECK
 	bool "enable quotacheck tools"
 	help
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 6573cda221..c1e5538fb5 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_UDISKS
 	bool "udisks"
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2
+	depends on BR2_TOOLCHAIN_USES_GLIBC # polkit, lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
-	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
@@ -40,7 +40,7 @@ comment "udisks needs udev /dev management"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV
 
-comment "udisks needs a glibc or uClibc toolchain w/ wchar, threads, dynamic library"
+comment "udisks needs a glibc toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_USES_GLIBC
-- 
2.14.1
