From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Sep 2012 09:25:20 +0200
Subject: [Buildroot] [PATCH 02/14] perl: add an option for miniperl
In-Reply-To: <1346484332-31433-1-git-send-email-francois.perrad@gadz.org>
References: <1346484332-31433-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1346484332-31433-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/perl/Config.in                   |    6 ++
 package/perl/perl-install-miniperl.patch |  129 ++++++++++++++++++++++++++++++
 package/perl/perl.mk                     |    6 +-
 3 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 package/perl/perl-install-miniperl.patch

diff --git a/package/perl/Config.in b/package/perl/Config.in
index 286b09e..1f044eb 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -14,4 +14,10 @@ config BR2_PACKAGE_PERL_CUSTOM_CONFIGURE
 	help
 	  Allows to add some flags to Configure.
 
+config BR2_PACKAGE_PERL_ONLY_MINIPERL
+	bool "only miniperl"
+	help
+	  Install only miniperl (without dynamic module loader)
+	  Usually used to bootstrap a full Perl (@INC contains only .).
+
 endif
diff --git a/package/perl/perl-install-miniperl.patch b/package/perl/perl-install-miniperl.patch
new file mode 100644
index 0000000..7e6f8e6
--- /dev/null
+++ b/package/perl/perl-install-miniperl.patch
@@ -0,0 +1,129 @@
+Add an option -miniperl
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/installperl
+===================================================================
+--- a/installperl
++++ b/installperl
+@@ -14,7 +14,7 @@
+ use vars qw($Is_VMS $Is_W32 $Is_OS2 $Is_Cygwin $Is_Darwin $Is_NetWare
+ 	    %opts $packlist);
+ my ($dostrip, $versiononly, $force,
+-    $otherperls, $archname, $nwinstall, $nopods);
++    $otherperls, $archname, $nwinstall, $nopods, $miniperl);
+ 
+ BEGIN {
+     if ($Is_VMS) { eval 'use VMS::Filespec;' }
+@@ -83,6 +83,7 @@
+     $force = 1 if $ARGV[0] eq '-f';
+     $opts{verbose} = 1 if $ARGV[0] eq '-V' || $ARGV [0] eq '-n';
+     $archname = 1 if $ARGV[0] eq '-A';
++    $miniperl = 1 if $ARGV[0] eq '-miniperl';
+     $nwinstall = 1 if $ARGV[0] eq '-netware';
+     $nopods = 1 if $ARGV[0] eq '-p';
+     $opts{destdir} = $1 if $ARGV[0] =~ /^-?-destdir=(.*)$/;
+@@ -102,6 +103,7 @@
+   -A        Also install perl with the architecture's name in the perl binary's
+             name.
+   -p        Don't install the pod files. [This will break use diagnostics;]
++  -miniperl Install only miniperl.
+   -netware  Install correctly on a Netware server.
+   -destdir  Prefix installation directories by this string.
+ EOT
+@@ -114,6 +116,7 @@
+ my (@scripts, @tolink);
+ open SCRIPTS, "utils.lst" or die "Can't open utils.lst: $!";
+ while (<SCRIPTS>) {
++    next if $miniperl;
+     next if /^#/;
+     next if /a2p/; # a2p is binary, to be installed separately
+     chomp;
+@@ -310,7 +313,7 @@
+     link($Config{perlpath}, "$installbin/perl$ver$exe_ext");
+ }
+ elsif ($^O ne 'dos') {
+-    if (!$Is_NetWare) {
++    if (!$Is_NetWare && !$miniperl) {
+ 	safe_unlink("$installbin/$perl_verbase$ver$exe_ext");
+ 	copy("perl$exe_ext", "$installbin/$perl_verbase$ver$exe_ext");
+ 	strip("$installbin/$perl_verbase$ver$exe_ext");
+@@ -384,8 +387,9 @@
+       push(@corefiles, $coredll)
+     )
+ } else {
++    @corefiles = <*.h>;
+     # [als] hard-coded 'libperl' name... not good!
+-    @corefiles = <*.h libperl*.* perl*$Config{lib_ext}>;
++    push @corefiles, <libperl*.* perl*$Config{lib_ext}> unless $miniperl;
+ 
+     # AIX needs perl.exp installed as well.
+     push(@corefiles,'perl.exp') if $^O eq 'aix';
+@@ -411,7 +415,7 @@
+ # Install main perl executables
+ # Make links to ordinary names if installbin directory isn't current directory.
+ 
+-if (! $versiononly && ! samepath($installbin, '.') && ($^O ne 'dos') && ! $Is_VMS && ! $Is_NetWare) {
++if (! $versiononly && ! samepath($installbin, '.') && ($^O ne 'dos') && ! $Is_VMS && ! $Is_NetWare && ! $miniperl) {
+     safe_unlink("$installbin/$perl$exe_ext", "$installbin/suid$perl$exe_ext");
+     if ($^O eq 'mpeix') {
+ 	# MPE doesn't support hard links, so use a symlink.
+@@ -429,7 +433,7 @@
+ 
+ # For development purposes it can be very useful to have multiple perls
+ # build for different "architectures" (eg threading or not) simultaneously.
+-if ($archname && ! samepath($installbin, '.') && ($^O ne 'dos') && ! $Is_VMS) {
++if ($archname && ! samepath($installbin, '.') && ($^O ne 'dos') && ! $Is_VMS && ! $miniperl) {
+     my $archperl = "$perl_verbase$ver-$Config{archname}$exe_ext";
+     safe_unlink("$installbin/$archperl");
+     if ($^O eq 'mpeix') {
+@@ -451,7 +455,7 @@
+ 
+ if ($Config{installusrbinperl} && $Config{installusrbinperl} eq 'define' &&
+     !$versiononly && !$opts{notify} && !$Is_W32 && !$Is_NetWare && !$Is_VMS && -t STDIN && -t STDERR
+-	&& -w $mainperldir && ! samepath($mainperldir, $installbin)) {
++	&& -w $mainperldir && ! samepath($mainperldir, $installbin) && ! $miniperl) {
+     my($usrbinperl)	= "$mainperldir/$perl$exe_ext";
+     my($instperl)	= "$installbin/$perl$exe_ext";
+     my($expinstperl)	= "$binexp/$perl$exe_ext";
+@@ -480,7 +484,7 @@
+ }
+ 
+ # Make links to ordinary names if installbin directory isn't current directory.
+-if (!$Is_NetWare && $dbg eq '') {
++if (!$Is_NetWare && $dbg eq '' && !$miniperl) {
+     if (! samepath($installbin, 'x2p')) {
+ 	my $base = 'a2p';
+ 	$base .= $ver if $versiononly;
+@@ -495,12 +499,18 @@
+ # it can't safely be shared.  Place it in $installbin.
+ # Note that Configure doesn't build cppstin if it isn't needed, so
+ # we skip this if cppstdin doesn't exist.
+-if (! $versiononly && (-f 'cppstdin') && (! samepath($installbin, '.'))) {
++if (! $versiononly && (-f 'cppstdin') && (! samepath($installbin, '.')) && !$miniperl) {
+     safe_unlink("$installbin/cppstdin");
+     copy("cppstdin", "$installbin/cppstdin");
+     chmod(0755, "$installbin/cppstdin");
+ }
+ 
++if ($miniperl && (-f 'miniperl')) {
++    safe_unlink("$installbin/miniperl$exe_ext");
++    copy("miniperl$exe_ext", "$installbin/miniperl$exe_ext");
++    chmod(0755, "$installbin/miniperl$exe_ext");
++}
++
+ sub script_alias {
+     my ($installscript, $orig, $alias, $scr_ext) = @_;
+ 
+@@ -761,6 +771,11 @@
+ 
+     return if $name eq 'ExtUtils/XSSymSet.pm' and !$Is_VMS;
+ 
++    if ($miniperl && $dir =~ /^auto\//) {
++        # Don't copy
++        return;
++    }
++
+     my $installlib = $installprivlib;
+     if ($dir =~ /^auto\// ||
+ 	  ($name =~ /^(.*)\.(?:pm|pod)$/ && $archpms{$1}) ||
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 813d8bf..5161654 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -16,6 +16,10 @@ ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
 PERL_USE_DEVEL=-Dusedevel
 endif
 
+ifdef BR2_PACKAGE_PERL_ONLY_MINIPERL
+    PERL_INSTALL_ONLY_MINIPERL = -miniperl
+endif
+
 PERL_ARCH=$(call qstrip,$(BR2_ARCH))
 ifeq ($(PERL_ARCH),i686)
     PERL_ARCH=i386
@@ -79,7 +83,7 @@ endef
 
 define PERL_INSTALL_TARGET_CMDS
 	$(MAKE) INSTALL_DEPENDENCE= \
-		INSTALLFLAGS=-p \
+		INSTALLFLAGS="-p $(PERL_INSTALL_ONLY_MINIPERL)"\
 		DESTDIR="$(TARGET_DIR)" \
 		-C $(@D) install.perl
 endef
-- 
1.7.9.5
