From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 20 Nov 2013 18:01:55 +0100
Subject: [Buildroot] [pkg-perl infra 07/12] host-libmodule-build-perl: new
	package
In-Reply-To: <1384966920-9454-1-git-send-email-francois.perrad@gadz.org>
References: <1384966920-9454-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1384966920-9454-8-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the version coming with host-perl is too old

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cpan/Config.in                             |    1 +
 package/cpan/libmodule-build-perl/Config.in        |    6 ++++++
 .../libmodule-build-perl/libmodule-build-perl.mk   |   16 ++++++++++++++++
 scancpan                                           |    3 +++
 4 files changed, 26 insertions(+)
 create mode 100644 package/cpan/libmodule-build-perl/Config.in
 create mode 100644 package/cpan/libmodule-build-perl/libmodule-build-perl.mk

diff --git a/package/cpan/Config.in b/package/cpan/Config.in
index bb98dc3..c821064 100644
--- a/package/cpan/Config.in
+++ b/package/cpan/Config.in
@@ -1 +1,2 @@
+source "package/cpan/libmodule-build-perl/Config.in"
 source "package/cpan/libxml-parser-perl/Config.in"
diff --git a/package/cpan/libmodule-build-perl/Config.in b/package/cpan/libmodule-build-perl/Config.in
new file mode 100644
index 0000000..dc63312
--- /dev/null
+++ b/package/cpan/libmodule-build-perl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBMODULE_BUILD_PERL
+	bool "libmodule-build-perl"
+	depends on BR2_HOST_ONLY
+	help
+	  Build and install Perl modules
+
diff --git a/package/cpan/libmodule-build-perl/libmodule-build-perl.mk b/package/cpan/libmodule-build-perl/libmodule-build-perl.mk
new file mode 100644
index 0000000..a08385b
--- /dev/null
+++ b/package/cpan/libmodule-build-perl/libmodule-build-perl.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libmodule-build-perl
+#
+################################################################################
+
+LIBMODULE_BUILD_PERL_VERSION = 0.4200
+LIBMODULE_BUILD_PERL_AUTHOR = LEONT
+LIBMODULE_BUILD_PERL_SOURCE = Module-Build-$(LIBMODULE_BUILD_PERL_VERSION).tar.gz
+LIBMODULE_BUILD_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT/
+#LIBMODULE_BUILD_PERL_DEPENDENCIES = perl
+HOST_LIBMODULE_BUILD_PERL_DEPENDENCIES =
+LIBMODULE_BUILD_PERL_LICENSE = perl_5
+
+#$(eval $(perl-package))
+$(eval $(host-perl-package))
diff --git a/scancpan b/scancpan
index d8a68d6..e0ae7ba 100755
--- a/scancpan
+++ b/scancpan
@@ -509,8 +509,10 @@ sub fetch {
         $dist{$name} = $result;
         my @deps_build = ();
         my @deps_runtime = ();
+        my $mb;
         foreach my $dep (@{$result->{dependency}}) {
             my $modname = ${$dep}{module};
+            $mb = 1 if $modname eq q{Module::Build};
             next if $modname eq q{perl};
             next if $modname =~ m|^Alien|;
             next if $modname =~ m|^Win32|;
@@ -527,6 +529,7 @@ sub fetch {
             }
             fetch( $distname );
         }
+        unshift @deps_build, q{Module-Build} if $mb;
         $deps_build{$name} = \@deps_build;
         $deps_runtime{$name} = \@deps_runtime;
     }
-- 
1.7.9.5
