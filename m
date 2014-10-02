From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Oct 2014 21:03:31 +0200
Subject: [Buildroot] [git commit] perl: bump to version 5.20.1
Message-ID: <20141002190411.8A59D9D724@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7ef4c2ed4f923fba8429ee6c1255d32d33fb75f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: squash 'add hash' patch into it]
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl-uClibc-IPv6.patch |   10 +++++-----
 package/perl/perl.hash              |    4 ++++
 package/perl/perl.mk                |   11 +++++++----
 support/scripts/scancpan            |    2 +-
 4 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/package/perl/perl-uClibc-IPv6.patch b/package/perl/perl-uClibc-IPv6.patch
index 8ace75e..b29d373 100644
--- a/package/perl/perl-uClibc-IPv6.patch
+++ b/package/perl/perl-uClibc-IPv6.patch
@@ -6,7 +6,7 @@ Index: b/cpan/Socket/Socket.xs
 ===================================================================
 --- a/cpan/Socket/Socket.xs
 +++ b/cpan/Socket/Socket.xs
-@@ -896,7 +896,7 @@
+@@ -920,7 +920,7 @@
  	CODE:
  #ifdef HAS_INETNTOP
  	STRLEN addrlen;
@@ -15,7 +15,7 @@ Index: b/cpan/Socket/Socket.xs
  	struct in6_addr addr;
  	char str[INET6_ADDRSTRLEN];
  #else
-@@ -916,7 +916,7 @@
+@@ -940,7 +940,7 @@
  		croak("Bad address length for Socket::inet_ntop on AF_INET;"
  		      " got %"UVuf", should be 4", (UV)addrlen);
  	    break;
@@ -24,7 +24,7 @@ Index: b/cpan/Socket/Socket.xs
  	  case AF_INET6:
  	    if(addrlen != 16)
  		croak("Bad address length for Socket::inet_ntop on AF_INET6;"
-@@ -925,7 +925,7 @@
+@@ -949,7 +949,7 @@
  #endif
  	  default:
  		croak("Bad address family for %s, got %d, should be"
@@ -33,7 +33,7 @@ Index: b/cpan/Socket/Socket.xs
  		      " either AF_INET or AF_INET6",
  #else
  		      " AF_INET",
-@@ -955,7 +955,7 @@
+@@ -979,7 +979,7 @@
  #ifdef HAS_INETPTON
  	int ok;
  	int addrlen = 0;
@@ -42,7 +42,7 @@ Index: b/cpan/Socket/Socket.xs
  	struct in6_addr ip_address;
  #else
  	struct in_addr ip_address;
-@@ -965,14 +965,14 @@
+@@ -989,14 +989,14 @@
  	  case AF_INET:
  	    addrlen = 4;
  	    break;
diff --git a/package/perl/perl.hash b/package/perl/perl.hash
new file mode 100644
index 0000000..57fefd7
--- /dev/null
+++ b/package/perl/perl.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.20.1.tar.bz2.{md5,sha1,sha256}.txt
+md5    ede5166f949d9a07163bc5b086be9759                                 perl-5.20.1.tar.bz2
+sha1   cd424d1520ba2686fe5d4422565aaf880e9467f6                         perl-5.20.1.tar.bz2
+sha256 ede5ded37e7fb6139b04728cfca826f17076f9888dbfd100a56834dbeb04657c perl-5.20.1.tar.bz2
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 65c0a7d..c355dc0 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -4,16 +4,16 @@
 #
 ################################################################################
 
-PERL_VERSION_MAJOR = 18
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_VERSION_MAJOR = 20
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
 PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 0.8.5
-PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_CROSS_VERSION = 0.9.2
+PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).0
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE    = http://raw.github.com/arsv/perl-cross/releases
 PERL_CROSS_SOURCE  = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
@@ -116,7 +116,10 @@ endef
 #
 define PERL_ADD_CORE_H
 	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/patchlevel-debian.h
+	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/patchlevel-gentoo.h
 	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/cc_runtime.h
+	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/fakethr.h
+	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/perlsfio.h
 	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/vutil.h
 endef
 
diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index e738a83..f5612e3 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -471,7 +471,7 @@ unshift @INC, sub {
 } # END OF FATPACK CODE
 
 
-use 5.018;      # same major version as target perl
+use 5.020;      # same major version as target perl
 use strict;
 use warnings;
 use Fatal qw(open close);
