From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Oct 2015 22:19:29 +0100
Subject: [Buildroot] [git commit] perl: fetch lastest upstream patches from
	perl-cross
Message-ID: <20151027215120.6380581F12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1faa164f2fa268025771e2d0f80b68a1946d9261
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

my previous patch about static build (0001-fix-EUMM.patch) was not the good fix.

see discussion: http://github.com/arsv/perl-cross/issues/18

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/0001-fix-EUMM.patch                   |   18 -----------
 package/perl/0002-dynaloader-hints.patch           |    2 +
 .../0003-add-version.pm-to-miniperl_top-path.patch |   16 ++++++++++
 ...ilt-in-functions-to-avoid-false-positives.patch |   32 ++++++++++++++++++++
 4 files changed, 50 insertions(+), 18 deletions(-)

diff --git a/package/perl/0001-fix-EUMM.patch b/package/perl/0001-fix-EUMM.patch
deleted file mode 100644
index e2b24ff..0000000
--- a/package/perl/0001-fix-EUMM.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-fix EUMM 7.04_01 which comes with Perl 5.22.0
-
-with static lib build, we cannot call _find_magic_vstring(),
-which does a `require B;` and B is not a pure Perl module.
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
---- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/version/vpp.pm
-+++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/version/vpp.pm
-@@ -933,7 +933,7 @@ sub _un_vstring {
-     if ( length($value) >= 3 && $value !~ /[._]/
- 	&& _is_non_alphanumeric($value)) {
- 	my $tvalue;
--	if ( $] ge 5.008_001 ) {
-+	if ( $Config{usedl} && ( $] ge 5.008_001 ) ) {
- 	    $tvalue = _find_magic_vstring($value);
- 	    $value = $tvalue if length $tvalue;
- 	}
diff --git a/package/perl/0002-dynaloader-hints.patch b/package/perl/0002-dynaloader-hints.patch
index 2653b78..408fa90 100644
--- a/package/perl/0002-dynaloader-hints.patch
+++ b/package/perl/0002-dynaloader-hints.patch
@@ -3,6 +3,8 @@ which is in the default include path.
 
 Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
 
+Fetch from: http://github.com/arsv/perl-cross/blob/master/cnf/diffs/dynaloader.patch
+
 --- a/ext/DynaLoader/hints/linux.pl
 +++ b/ext/DynaLoader/hints/linux.pl
 @@ -1,5 +1 @@
diff --git a/package/perl/0003-add-version.pm-to-miniperl_top-path.patch b/package/perl/0003-add-version.pm-to-miniperl_top-path.patch
new file mode 100644
index 0000000..91c959f
--- /dev/null
+++ b/package/perl/0003-add-version.pm-to-miniperl_top-path.patch
@@ -0,0 +1,16 @@
+add version.pm to miniperl_top path
+
+Fetch from: http://github.com/arsv/perl-cross/commit/f53a9f1b613b84396d174855f6c37bf04f76bae3
+See discussion: https://github.com/arsv/perl-cross/issues/18
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+--- a/miniperl_top
++++ b/miniperl_top
+@@ -39,4 +39,5 @@ exec $top/miniperl\
+ 	-I$top/dist/Carp/lib\
+ 	-I$top/cpan/podlators/lib\
+ 	-I$top/cpan/parent/lib\
++	-I$top/cpan/version/lib\
+ 	"$@"
+
diff --git a/package/perl/0004-suppress-built-in-functions-to-avoid-false-positives.patch b/package/perl/0004-suppress-built-in-functions-to-avoid-false-positives.patch
new file mode 100644
index 0000000..73635fe
--- /dev/null
+++ b/package/perl/0004-suppress-built-in-functions-to-avoid-false-positives.patch
@@ -0,0 +1,32 @@
+suppress built-in functions to avoid false positives
+
+gcc knows j0 etc. are pure and excludes them from try.c, subverting
+linkage test against libm.a and leading to link errors later.
+
+Fetch from: http://github.com/arsv/perl-cross/commit/ce7fa56d3a40767135039e03517a4d9ef2f3aaa1
+See discussion: https://github.com/arsv/perl-cross/issues/18
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+--- a/cnf/configure__f.sh
++++ b/cnf/configure__f.sh
+@@ -222,7 +222,7 @@ function try_link_libs {
+ }
+
+ function try_link {
+-	try_link_libs $libs
++	try_link_libs $libs $*
+ }
+
+ function try_readelf {
+--- a/cnf/configure_func.sh
++++ b/cnf/configure_func.sh
+@@ -22,7 +22,7 @@ function hasfunc {
+ 		esac ;;
+ 	esac
+ 	try_add "int main(void) { $1($2); return 0; }"
+-	try_link
++	try_link -O0 -fno-builtin
+ 	resdef 'found' 'not found' "$_s"
+ }
+
