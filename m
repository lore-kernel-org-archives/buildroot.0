From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 09:52:32 +0200
Subject: [Buildroot] [git commit] package/libconfuse: switch to the new
	upstream
Message-ID: <20140717075335.5460F9D26A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=351680c1a094beae47d27437fabca1eb1cf12929
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libconfuse is being migrated to github (see
http://www.nongnu.org/confuse/) So, just follow suit.

Needs a bit of a hack so gettextize + autoreconf does not step on each
other's toes. See comment in the patch.

[Yann: fix gettextizing, write commit log]
Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libconfuse-0000-fix-configure-ac.patch         |   27 ++++++++++++++++++++
 package/libconfuse/libconfuse.mk                   |    9 ++++--
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/package/libconfuse/libconfuse-0000-fix-configure-ac.patch b/package/libconfuse/libconfuse-0000-fix-configure-ac.patch
new file mode 100644
index 0000000..6d61b48
--- /dev/null
+++ b/package/libconfuse/libconfuse-0000-fix-configure-ac.patch
@@ -0,0 +1,27 @@
+configure: remove po/Makefile.in from AC_CONFIG_FILES
+
+Since we are gettextizing the package, gettextize updates configure.ac
+to add po/Makefile.in to AC_CONFIG_FILES>
+
+Unfortunately, it's already present, and gettextize does not detect it,
+and insists on adding its own. Later on, autoreconf barfs on the double
+occurences.
+
+As suggested by Arnout, just patch configure.ac to remove the
+po/Makefile.in occurence, so gettextize can safely add its own
+
+Reported-by: Arnout Vandecappelle <arnout@mind.be>
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Alvaro Gamez <alvaro.gamez@hazent.com>
+
+diff -durN libconfuse-V2_7.orig/configure.ac libconfuse-V2_7/configure.ac
+--- libconfuse-V2_7.orig/configure.ac	2010-02-20 10:14:10.000000000 +0100
++++ libconfuse-V2_7/configure.ac	2014-07-17 00:19:18.816785340 +0200
+@@ -49,7 +49,6 @@
+ AC_CONFIG_FILES([Makefile \
+ 		 src/Makefile \
+ 		 examples/Makefile \
+-                 po/Makefile.in \
+ 		 m4/Makefile \
+ 		 tests/Makefile \
+ 		 doc/Makefile \
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 8a0d80f..e9a1114 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -4,13 +4,16 @@
 #
 ################################################################################
 
-LIBCONFUSE_VERSION = 2.7
-LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.gz
-LIBCONFUSE_SITE = http://savannah.nongnu.org/download/confuse/
+LIBCONFUSE_VERSION = V2_7
+LIBCONFUSE_SITE = $(call github,martinh,libconfuse,$(LIBCONFUSE_VERSION))
 LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPT = --disable-rpath
 LIBCONFUSE_LICENSE = ISC
 LIBCONFUSE_LICENSE_FILES = src/confuse.c
 
+# Fresh from the repository, no configure et al.
+LIBCONFUSE_AUTORECONF = YES
+LIBCONFUSE_GETTEXTIZE = YES
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
