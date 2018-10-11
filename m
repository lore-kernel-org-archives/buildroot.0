From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 11 Oct 2018 18:12:45 +0200
Subject: [Buildroot] [V2 1/4] scancpan: add PERL_FOO_DISTNAME in perl-foo.mk
In-Reply-To: <20181011161248.13457-1-francois.perrad@gadz.org>
References: <20181011161248.13457-1-francois.perrad@gadz.org>
Message-ID: <20181011161248.13457-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this variable is needed for upgrading package with scancpan

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 docs/manual/adding-packages-perl.txt | 10 +++++++---
 utils/scancpan                       |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
index eb14d9de1..6ce693fd6 100644
--- a/docs/manual/adding-packages-perl.txt
+++ b/docs/manual/adding-packages-perl.txt
@@ -23,8 +23,9 @@ with an example :
 10: PERL_FOO_BAR_DEPENDENCIES = perl-strictures
 11: PERL_FOO_BAR_LICENSE = Artistic or GPL-1.0+
 12: PERL_FOO_BAR_LICENSE_FILES = LICENSE
-13:
-14: $(eval $(perl-package))
+13: PERL_FOO_BAR_DISTNAME = Foo-Bar
+14:
+15: $(eval $(perl-package))
 ------------------------
 
 On line 7, we declare the version of the package.
@@ -40,7 +41,10 @@ On line 11 and 12, we give licensing details about the package (its
 license on line 11, and the file containing the license text on line
 12).
 
-Finally, on line 14, we invoke the +perl-package+ macro that
+On line 13, the name of the distribution as needed by the script
++utils/scancpan+ (in order to regenerate/upgrade these package files).
+
+Finally, on line 15, we invoke the +perl-package+ macro that
 generates all the Makefile rules that actually allow the package to be
 built.
 
diff --git a/utils/scancpan b/utils/scancpan
index 01f3abdc8..f2e06a3dc 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -747,6 +747,7 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{HOST_${brname}_DEPENDENCIES = ${host_dependencies}} if $need_host{$distname} && $host_dependencies;
         say {$fh} qq{${brname}_LICENSE = ${license}} if $license;
         say {$fh} qq{${brname}_LICENSE_FILES = ${license_files}} if $license_files;
+        say {$fh} qq{${brname}_DISTNAME = ${distname}};
         say {$fh} qq{};
         foreach (sort @{$deps_optional{$distname}}) {
             next if grep { $_ eq $distname; } @{$deps_runtime{$_}};     # avoid cyclic dependencies
-- 
2.17.1
