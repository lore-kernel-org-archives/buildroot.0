From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 20:49:43 +0100
Subject: [Buildroot] [git commit] perl-cross: bump to version 1.0.1
Message-ID: <20151103194947.6734181E78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0708c41ec134f12312de42b88488db2b8612ac19
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

all patches merged

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/0002-dynaloader-hints.patch           |   15 ---------
 .../0003-add-version.pm-to-miniperl_top-path.patch |   16 ----------
 ...ilt-in-functions-to-avoid-false-positives.patch |   32 --------------------
 package/perl/perl.hash                             |    2 +-
 package/perl/perl.mk                               |    3 +-
 5 files changed, 2 insertions(+), 66 deletions(-)

diff --git a/package/perl/0002-dynaloader-hints.patch b/package/perl/0002-dynaloader-hints.patch
deleted file mode 100644
index 408fa90..0000000
--- a/package/perl/0002-dynaloader-hints.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Buildroot puts nlist.h into sysroot/usr/include,
-which is in the default include path.
-
-Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
-
-Fetch from: http://github.com/arsv/perl-cross/blob/master/cnf/diffs/dynaloader.patch
-
---- a/ext/DynaLoader/hints/linux.pl
-+++ b/ext/DynaLoader/hints/linux.pl
-@@ -1,5 +1 @@
--# XXX Configure test needed.
--# Some Linux releases like to hide their <nlist.h>
--$self->{CCFLAGS} = $Config{ccflags} . ' -I/usr/include/libelf'
--	if -f "/usr/include/libelf/nlist.h";
- 1;
diff --git a/package/perl/0003-add-version.pm-to-miniperl_top-path.patch b/package/perl/0003-add-version.pm-to-miniperl_top-path.patch
deleted file mode 100644
index 91c959f..0000000
--- a/package/perl/0003-add-version.pm-to-miniperl_top-path.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-add version.pm to miniperl_top path
-
-Fetch from: http://github.com/arsv/perl-cross/commit/f53a9f1b613b84396d174855f6c37bf04f76bae3
-See discussion: https://github.com/arsv/perl-cross/issues/18
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
---- a/miniperl_top
-+++ b/miniperl_top
-@@ -39,4 +39,5 @@ exec $top/miniperl\
- 	-I$top/dist/Carp/lib\
- 	-I$top/cpan/podlators/lib\
- 	-I$top/cpan/parent/lib\
-+	-I$top/cpan/version/lib\
- 	"$@"
-
diff --git a/package/perl/0004-suppress-built-in-functions-to-avoid-false-positives.patch b/package/perl/0004-suppress-built-in-functions-to-avoid-false-positives.patch
deleted file mode 100644
index 73635fe..0000000
--- a/package/perl/0004-suppress-built-in-functions-to-avoid-false-positives.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-suppress built-in functions to avoid false positives
-
-gcc knows j0 etc. are pure and excludes them from try.c, subverting
-linkage test against libm.a and leading to link errors later.
-
-Fetch from: http://github.com/arsv/perl-cross/commit/ce7fa56d3a40767135039e03517a4d9ef2f3aaa1
-See discussion: https://github.com/arsv/perl-cross/issues/18
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
---- a/cnf/configure__f.sh
-+++ b/cnf/configure__f.sh
-@@ -222,7 +222,7 @@ function try_link_libs {
- }
-
- function try_link {
--	try_link_libs $libs
-+	try_link_libs $libs $*
- }
-
- function try_readelf {
---- a/cnf/configure_func.sh
-+++ b/cnf/configure_func.sh
-@@ -22,7 +22,7 @@ function hasfunc {
- 		esac ;;
- 	esac
- 	try_add "int main(void) { $1($2); return 0; }"
--	try_link
-+	try_link -O0 -fno-builtin
- 	resdef 'found' 'not found' "$_s"
- }
-
diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 2e3af95..76e959c 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -4,4 +4,4 @@ sha1   400338c91c56420d98142cbfcb84d418cae2c98c                         perl-5.2
 sha256 3689fdb519133d039f49e12834764ff4c1de8f8d925dea44a952ca110d0ac9f7 perl-5.22.0.tar.bz2
 
 # No upstream hashes for the following
-sha256 92ac19149eacfeb5dbddae229fecabdc1bef7ad130da2ea6c05a166167ac696a perl-5.22.0-cross-1.0.0.tar.gz
+sha256 2f972534820b028da92400e25dfcaab155232e3b118e2f91a5b63c624b49f5e8 perl-5.22.0-cross-1.0.1.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index d35e05c..f3b7b2b 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -12,7 +12,7 @@ PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.0.0
+PERL_CROSS_VERSION = 1.0.1
 PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).0
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = http://raw.github.com/arsv/perl-cross/releases
@@ -31,7 +31,6 @@ define PERL_CROSS_EXTRACT
 	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
-HOST_PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
 define PERL_CROSS_SET_POD
 	$(SED) s/$(PERL_CROSS_OLD_POD)/$(PERL_CROSS_NEW_POD)/g $(@D)/Makefile
