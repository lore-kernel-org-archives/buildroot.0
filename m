From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 16 Feb 2021 21:36:05 +0100
Subject: [Buildroot] [git commit] package/perl-gd: needs
 perl-extutils-pkgconfig
Message-ID: <20210216202627.EFA3A810CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d17264427432117f68d9721d98fdbf866e682be7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 3a291be2e89bc64388c10dae50233c751a86733d forgot to add
perl-extutils-pkgconfig dependency

Fixes:
 - http://autobuild.buildroot.org/results/e590f1990180eae21512b23b884755e105a4c588

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...le.PL-fix-cross-compilation-with-gdlib.pc.patch | 34 ++++++++++++++++++++++
 package/perl-gd/perl-gd.mk                         |  6 +++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/package/perl-gd/0001-Makefile.PL-fix-cross-compilation-with-gdlib.pc.patch b/package/perl-gd/0001-Makefile.PL-fix-cross-compilation-with-gdlib.pc.patch
new file mode 100644
index 0000000000..af053c5605
--- /dev/null
+++ b/package/perl-gd/0001-Makefile.PL-fix-cross-compilation-with-gdlib.pc.patch
@@ -0,0 +1,34 @@
+From 11dc017e902397c452331425eb6101b3315572fa Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 24 Jan 2021 10:59:31 +0100
+Subject: [PATCH] Makefile.PL: fix cross-compilation with gdlib.pc
+
+Cross-compilation will fail if gdlib.pc does not contain any cflags.
+Indeed, if cflags is empty, Makefile.PL will use the default value for
+INC (i.e. -I/usr/include -I/usr/include/gd)
+
+It should be noted that gdlib-config has been dropped from gd since
+version 2.3.0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: probably not upstreamable]
+---
+ Makefile.PL | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.PL b/Makefile.PL
+index 25f2f93..7da3651 100644
+--- a/Makefile.PL
++++ b/Makefile.PL
+@@ -47,7 +47,7 @@ If you want to try to compile anyway, please rerun this script with the option -
+ END
+ }
+ 
+- at INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
++#@INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
+ @LIBPATH = qw(-L/usr/lib/X11 -L/usr/X11R6/lib -L/usr/X11/lib -L/usr/lib) unless @LIBPATH;
+ @LIBS    = qw(-lgd) unless @LIBS;
+ 
+-- 
+2.29.2
+
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index b058672a23..2932b686bb 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -7,11 +7,15 @@
 PERL_GD_VERSION = 2.73
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
-PERL_GD_DEPENDENCIES = host-pkgconf zlib libpng freetype gd
+PERL_GD_DEPENDENCIES = host-perl-extutils-pkgconfig zlib libpng freetype gd
 PERL_GD_LICENSE = Artistic or GPL-1.0+
 PERL_GD_LICENSE_FILES = LICENSE
 PERL_GD_DISTNAME = GD
 
+PERL_GD_CONF_ENV = \
+	PATH=$(BR_PATH) \
+	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
+
 PERL_GD_CONF_OPTS = \
 	-lib_gd_path=$(STAGING_DIR)/usr \
 	-lib_ft_path=$(STAGING_DIR)/usr \
