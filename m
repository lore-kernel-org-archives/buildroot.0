From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jul 2014 15:03:22 +0200
Subject: [Buildroot] [PATCH 2/4 v3] package/perl-net-ssleay: fix buildsystem
	for cross-compilation
In-Reply-To: <cover.1405256442.git.yann.morin.1998@free.fr>
References: <cover.1405256442.git.yann.morin.1998@free.fr>
Message-ID: <d208e259b09bd382d98d491275e77d2af5bd952a.1405256442.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Francois Perrad <fperrad@gmail.com>

The buildsystem for perl-net-ssleay is totally brain-damaged: it tries
to execute the openssl program. It uses that to check the openssl
version, detect the prefix to openssl, and set the include and library
search paths.

Of course, it does not handle the destdir idiom, so it ends up finding
the host system's openssl (not even ours!), so it sets search paths to
/usr/inlcude and /usr/lib and /lib.

Well, guess what? It does not work.

Fix that by:
  - passing the prefix to openssl in the environment, so it does not go
    hunting for the host-system openssl;
  - not checking the version string, since we can't run, and Buildroot
    has the correct version anyway;
  - not setting any -I or -L paths since our compiler/linker already
    know where to look for for includes and libs.

Fixes:
    http://autobuild.buildroot.net/results/135/135867ef85535863e3647cc5fb82accb6f77612c/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[me: enhance commit log, add patch to avoid running openssl and setting
 wrong include and library search paths]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../perl-net-ssleay-0000-fix-build-system.patch    | 36 ++++++++++++++++++++++
 package/perl-net-ssleay/perl-net-ssleay.mk         |  4 +++
 2 files changed, 40 insertions(+)
 create mode 100644 package/perl-net-ssleay/perl-net-ssleay-0000-fix-build-system.patch

diff --git a/package/perl-net-ssleay/perl-net-ssleay-0000-fix-build-system.patch b/package/perl-net-ssleay/perl-net-ssleay-0000-fix-build-system.patch
new file mode 100644
index 0000000..a6cd0f9
--- /dev/null
+++ b/package/perl-net-ssleay/perl-net-ssleay-0000-fix-build-system.patch
@@ -0,0 +1,36 @@
+buildsystem: fix for cross-compilation
+
+Avoid running the openssl binary, since it would break for
+cross-compilation. Buildroot has a supported version, anyway.
+
+Also, avoid adding hard-coded includes and libraries search
+paths, since they are missing the destdir; Buildroot compilers
+and linkers already know where to search, anyway.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN perl-net-ssleay-1.64.orig/inc/Module/Install/PRIVATE/Net/SSLeay.pm perl-net-ssleay-1.64/inc/Module/Install/PRIVATE/Net/SSLeay.pm
+--- perl-net-ssleay-1.64.orig/inc/Module/Install/PRIVATE/Net/SSLeay.pm	2014-04-01 08:08:37.000000000 +0200
++++ perl-net-ssleay-1.64/inc/Module/Install/PRIVATE/Net/SSLeay.pm	2014-07-13 00:38:46.281380282 +0200
+@@ -37,14 +37,18 @@
+         exit 0; # according http://wiki.cpantesters.org/wiki/CPANAuthorNotes this is best-practice when "missing library"
+     }
+ 
+-    $self->check_openssl_version($prefix, $exec);
++# Does not work for cross-compilation.
++# In Buildroot, we do have a supported version.
++#    $self->check_openssl_version($prefix, $exec);
+     my $opts = $self->ssleay_get_build_opts($prefix, $exec);
+ 
+     $self->makemaker_args(
+         CCCDLFLAGS => $opts->{cccdlflags},
+         OPTIMIZE => $opts->{optimize},
+-        INC => join(' ', map {"-I$_"} @{$opts->{inc_paths}}),
+-        LIBS => join(' ', (map {"-L$_"} @{$opts->{lib_paths}}), (map {"-l$_"} @{$opts->{lib_links}})),
++# Buildroot already has the correct include and library search paths.
++#        INC => join(' ', map {"-I$_"} @{$opts->{inc_paths}}),
++#        LIBS => join(' ', (map {"-L$_"} @{$opts->{lib_paths}}), (map {"-l$_"} @{$opts->{lib_links}})),
++        LIBS => join(' ', (map {"-l$_"} @{$opts->{lib_links}})),
+     );
+ 
+     if ( $self->prompt(
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 413fdf0..4a362fb 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -11,4 +11,8 @@ PERL_NET_SSLEAY_DEPENDENCIES = perl openssl
 PERL_NET_SSLEAY_LICENSE = OpenSSL
 PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
 
+# Try as hard as possible to remedy to the brain-damage their build-system
+# suffers from: don't search for openssl, they pick the host-system one.
+PERL_NET_SSLEAY_CONF_ENV = OPENSSL_PREFIX=$(STAGING_DIR)/usr
+
 $(eval $(perl-package))
-- 
1.9.1
