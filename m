From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 12:16:52 -0800
Subject: [Buildroot] [git commit] perl: remove redundant patches
Message-ID: <20121203145715.8D41699808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74b9fa00efa16ec74f1d3df6137b9961fd60d3fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now we are using perlcross, the patches to make perl work with qemu are
redundant, so remove them.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/perl/perl-configure-qemu.patch |   53 --------------------------------
 package/perl/perl-make-ext.patch       |   24 --------------
 package/perl/perl-mkppport.patch       |   37 ----------------------
 3 files changed, 0 insertions(+), 114 deletions(-)

diff --git a/package/perl/perl-configure-qemu.patch b/package/perl/perl-configure-qemu.patch
deleted file mode 100644
index c2d6b92..0000000
--- a/package/perl/perl-configure-qemu.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Add qemu support
-
-see https://rt.perl.org/rt3//Public/Bug/Display.html?id=114798
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-Index: b/Configure
-===================================================================
---- a/Configure
-+++ b/Configure
-@@ -2837,6 +2837,9 @@
-             ;;
-         *)  echo "Using usrinc $usrinc." >&4 ;;
- 	esac
-+	case "$targetrun" in
-+	*qemu*) targethost=dummy ;;
-+	esac
- 	case "$targethost" in
- 	'') echo "Targethost not defined." >&4; croak=y ;;
-         *)  echo "Using targethost $targethost." >&4
-@@ -2868,7 +2871,7 @@
- 	case "$targetfrom" in
- 	'') targetfrom=scp ;;
- 	esac
--    	run=$run-$targetrun
-+    	run=$run-`basename $targetrun`
-     	to=$to-$targetto
-     	from=$from-$targetfrom
- 	case "$targetdir" in
-@@ -2908,6 +2911,14 @@
- $targetrun -l $targetuser $targethost "cd \$cwd && ./\$exe \$@"
- EOF
- 	    ;;
-+	*qemu*)
-+	    to=:
-+	    from=:
-+	    cat >$run <<EOF
-+#!/bin/sh
-+$targetrun -L $qemulib "\$@"
-+EOF
-+	    ;;
- 	*)  echo "Unknown targetrun '$targetrun'" >&4
- 	    exit 1
- 	    ;;
-@@ -5048,7 +5059,7 @@
- echo " ";
- echo "Checking if your compiler accepts $flag" 2>&1;
- echo "int main(void) { return 0; }" > gcctest.c;
--if $cc -O2 $flag -o gcctest gcctest.c 2>gcctest.out && ./gcctest; then
-+if $cc -O2 $flag -o gcctest gcctest.c 2>gcctest.out && $run ./gcctest; then
-     echo "Yes, it does." 2>&1;
-     if $test -s gcctest.out ; then
-         echo "But your platform does not like it:";
diff --git a/package/perl/perl-make-ext.patch b/package/perl/perl-make-ext.patch
deleted file mode 100644
index e0195e7..0000000
--- a/package/perl/perl-make-ext.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Don't use RUN with make (only for perl)
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-Index: b/make_ext.pl
-===================================================================
---- a/make_ext.pl
-+++ b/make_ext.pl
-@@ -458,11 +458,13 @@
- 	# Give makefile an opportunity to rewrite itself.
- 	# reassure users that life goes on...
- 	my @args = ('config', @$pass_through);
--	system(@run, @make, @args) and print "@run @make @args failed, continuing anyway...\n";
-+#	system(@run, @make, @args) and print "@run @make @args failed, continuing anyway...\n";
-+	system(@make, @args) and print "@make @args failed, continuing anyway...\n";
-     }
-     my @targ = ($target, @$pass_through);
-     print "Making $target in $ext_dir\n at run @make @targ\n";
--    my $code = system(@run, @make, @targ);
-+#    my $code = system(@run, @make, @targ);
-+    my $code = system(@make, @targ);
-     die "Unsuccessful make($ext_dir): code=$code" if $code != 0;
- 
-     chdir $return_dir || die "Cannot cd to $return_dir: $!";
diff --git a/package/perl/perl-mkppport.patch b/package/perl/perl-mkppport.patch
deleted file mode 100644
index 97f27a2..0000000
--- a/package/perl/perl-mkppport.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Add RUN
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-Index: b/mkppport
-===================================================================
---- a/mkppport
-+++ b/mkppport
-@@ -1,6 +1,7 @@
- use strict;
- use warnings;
- 
-+use Config;
- use Getopt::Long;
- use File::Spec;
- use File::Compare qw( compare );
-@@ -136,14 +137,18 @@
- #----------------------------------------------
- sub run
- {
-+  my @run = $Config{run};
-+  @run = () if not defined $run[0] or $run[0] eq '';
-   my @args = ("-I" . File::Spec->catdir((File::Spec->updir) x 2, 'lib'), @_);
-   my $run = $perl =~ m/\s/ ? qq("$perl") : $perl;
-   for (@args) {
-     $_ = qq("$_") if $^O eq 'VMS' && /^[^"]/;
-     $run .= " $_";
-   }
--  print "running $run\n";
--  system $run and die "$run failed: $?\n";
-+#  print "running $run\n";
-+#  system $run and die "$run failed: $?\n";
-+  print "running ", join(' ', @run, $run), "\n";
-+  system join(' ', @run, $run) and die "@run $run failed: $?\n";
- }
- 
- __END__
