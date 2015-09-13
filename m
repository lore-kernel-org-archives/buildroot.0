From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 13 Sep 2015 14:56:28 +0200
Subject: [Buildroot] [V2] perl: fix static build
Message-ID: <1442148988-8900-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see http://autobuild.buildroot.net/results/502/502e6a6280451acc48e5f500e774b2bd04c7229e/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/0001-fix-EUMM.patch | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/perl/0001-fix-EUMM.patch

diff --git a/package/perl/0001-fix-EUMM.patch b/package/perl/0001-fix-EUMM.patch
new file mode 100644
index 0000000..e2b24ff
--- /dev/null
+++ b/package/perl/0001-fix-EUMM.patch
@@ -0,0 +1,18 @@
+fix EUMM 7.04_01 which comes with Perl 5.22.0
+
+with static lib build, we cannot call _find_magic_vstring(),
+which does a `require B;` and B is not a pure Perl module.
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/version/vpp.pm
++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/version/vpp.pm
+@@ -933,7 +933,7 @@ sub _un_vstring {
+     if ( length($value) >= 3 && $value !~ /[._]/
+ 	&& _is_non_alphanumeric($value)) {
+ 	my $tvalue;
+-	if ( $] ge 5.008_001 ) {
++	if ( $Config{usedl} && ( $] ge 5.008_001 ) ) {
+ 	    $tvalue = _find_magic_vstring($value);
+ 	    $value = $tvalue if length $tvalue;
+ 	}
-- 
2.1.4
