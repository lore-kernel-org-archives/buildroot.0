From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 24 Oct 2018 00:22:13 +0100
Subject: [Buildroot] [git commit] scancpan: add PERL_FOO_DISTNAME in
 perl-foo.mk
Message-ID: <20181023234600.739ED887DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe12a66bdef51aa61503ff251eb0ff892cbde09a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This variable is needed for upgrading packages with scancpan.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/adding-packages-perl.txt | 10 +++++++---
 utils/scancpan                       |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
index eb14d9de18..6ce693fd6e 100644
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
index 6b810fdb68..7c1e4236f9 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -745,6 +745,7 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{HOST_${brname}_DEPENDENCIES = ${host_dependencies}} if $need_host{$distname} && $host_dependencies;
         say {$fh} qq{${brname}_LICENSE = ${license}} if $license;
         say {$fh} qq{${brname}_LICENSE_FILES = ${license_files}} if $license_files;
+        say {$fh} qq{${brname}_DISTNAME = ${distname}};
         say {$fh} qq{};
         say {$fh} qq{\$(eval \$(perl-package))} if $need_target{$distname};
         say {$fh} qq{\$(eval \$(host-perl-package))} if $need_host{$distname};
