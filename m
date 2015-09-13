From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 13 Sep 2015 12:26:22 +0200
Subject: [Buildroot] [PATCH] perl: fix static build
Message-ID: <1442139982-29309-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see http://autobuild.buildroot.net/results/502/502e6a6280451acc48e5f500e774b2bd04c7229e/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/0001-hack-EUMM.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/perl/0001-hack-EUMM.patch

diff --git a/package/perl/0001-hack-EUMM.patch b/package/perl/0001-hack-EUMM.patch
new file mode 100644
index 0000000..3d54f47
--- /dev/null
+++ b/package/perl/0001-hack-EUMM.patch
@@ -0,0 +1,20 @@
+hack EUMM 7.04_01 which comes with Perl 5.22.0
+
+with static lib build, we cannot call _find_magic_vstring(),
+which does a `require B;` and B is not a pure Perl module.
+
+--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/version/vpp.pm
++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/version/vpp.pm
+@@ -933,11 +933,7 @@ sub _un_vstring {
+     if ( length($value) >= 3 && $value !~ /[._]/
+ 	&& _is_non_alphanumeric($value)) {
+ 	my $tvalue;
+-	if ( $] ge 5.008_001 ) {
+-	    $tvalue = _find_magic_vstring($value);
+-	    $value = $tvalue if length $tvalue;
+-	}
+-	elsif ( $] ge 5.006_000 ) {
++	if ( $] ge 5.006_000 ) {
+ 	    $tvalue = sprintf("v%vd",$value);
+ 	    if ( $tvalue =~ /^v\d+(\.\d+){2,}$/ ) {
+ 		# must be a v-string
-- 
2.1.4
