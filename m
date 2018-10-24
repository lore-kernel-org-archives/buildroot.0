From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 12:27:48 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] nmap: use system liblinear
Message-ID: <20181024102604.6578288837@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06dd8b36956441bcaec5f87ce2a9a2cfeec5477a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Use system liblinear instead of using included liblinear.
liblinear in buildroot is at version 2.20 released on December 2017
whereas liblinear in nmap has not been updated since 7 years (except for
liblinear.vcxproj which has been updated 2 years ago)

Do not use --with-liblinear option as otherwise nmap will forget to add
-llinear to LIBS due to the following line in configure.ac:

if test $have_liblinear != yes; then
  AC_CHECK_HEADERS([linear.h],
    AC_CHECK_LIB(linear, predict, [have_liblinear=yes; LIBLINEAR_LIBS="-llinear"; break],, [-lm])
)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c0d9ba562c5522096d4ed70827c599c9a0e9aa7c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nmap/Config.in | 1 +
 package/nmap/nmap.mk   | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/nmap/Config.in b/package/nmap/Config.in
index c1aafeceb9..51dd3423ea 100644
--- a/package/nmap/Config.in
+++ b/package/nmap/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_NMAP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBLINEAR
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_NMAP_NMAP \
 	       if !BR2_PACKAGE_NMAP_NCAT && !BR2_PACKAGE_NMAP_NPING && !BR2_PACKAGE_NMAP_NDIFF
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 8809d4c037..761df3ffa8 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -7,9 +7,9 @@
 NMAP_VERSION = 7.70
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
-NMAP_DEPENDENCIES = libpcap
+NMAP_DEPENDENCIES = liblinear libpcap
 NMAP_CONF_OPTS = --without-liblua --without-zenmap \
-	--with-libdnet=included --with-liblinear=included
+	--with-libdnet=included
 NMAP_LICENSE = nmap license
 NMAP_LICENSE_FILES = COPYING
 
