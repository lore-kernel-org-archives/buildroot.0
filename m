From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Aug 2013 00:23:49 +0200
Subject: [Buildroot] [git commit] neon: replace 'choice' for XML library
	with two options
Message-ID: <20130831213337.BFFDC9B591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9169810a9bd97c99d8b7a0e8aadabdcca3883e99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The NEON library can either be compiled without XML support, with XML
support provided by Expat, or with XML support provided by
libxml2. Until now, to represent this, a Kconfig 'choice..endchoice'
was used. Unfortunately, another package cannot 'select' one of the
possible choices. So for example, a package such as 'rpm', or the
to-be-added 'subversion' package could not select their dependencies,
they had to do a 'depends on !BR2_PACKAGE_NEON_NOXML', which is not
how Buildroot handles library dependencies in general.

So, this commit replaces the 'choice...endchoice' block with simply
two configuration options that are mutually exclusive. The option
names are not changed, so no Config.in.legacy addition is needed.

An hidden option BR2_PACKAGE_NEON_XML is provided, so that packages
that need XML support in NEON but don't care whether it's provided by
Expat or libxml2 can simply select BR2_PACKAGE_NEON_XML.

The rpm package is updated accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neon/Config.in |   28 ++++++++++------------------
 package/rpm/Config.in  |    7 ++-----
 2 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/package/neon/Config.in b/package/neon/Config.in
index 54b51c8..e76278c 100644
--- a/package/neon/Config.in
+++ b/package/neon/Config.in
@@ -19,31 +19,23 @@ config BR2_PACKAGE_NEON_SSL
 	help
 	  build with SSL support
 
-choice
-	prompt "XML Support"
-	help
-	  Select which XML library to use...
-	  none       do not build with XML support
-	  expat      use expat
-	  libxml2    use libxml2
-
-config BR2_PACKAGE_NEON_NOXML
-	bool "none"
-	help
-	  none       do not build with XML support
+# This is an hidden symbol other packages can select to ensure that
+# Neon has XML support, either provided by Expat or libxml2.
+config BR2_PACKAGE_NEON_XML
+	bool
+	select BR2_PACKAGE_NEON_EXPAT if !BR2_PACKAGE_NEON_LIBXML2
 
 config BR2_PACKAGE_NEON_EXPAT
-	bool "expat"
+	bool "XML support with expat"
 	select BR2_PACKAGE_EXPAT
+	depends on !BR2_PACKAGE_NEON_LIBXML2
 	help
-	  expat      use expat, a library for parsing XML.
+	  Enable XML support in neon, using the Expat XML library.
 
 config BR2_PACKAGE_NEON_LIBXML2
-	bool "libxml2"
+	bool "XML support with libxml2"
 	select BR2_PACKAGE_LIBXML2
 	help
-	  libxml2    use libxml2, a library to read, modify and
-	             write XML and HTML files.
-endchoice
+	  Enable XML support in neon, using the libxml2 XML library.
 
 endif
diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 14072c9..63e5367 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -1,17 +1,14 @@
 comment "rpm requires a toolchain with thread support"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-comment "rpm requires libneon with SSL, XML and ZLIB support"
-	depends on !BR2_PACKAGE_NEON || BR2_PACKAGE_NEON_NOXML && BR2_TOOLCHAIN_HAS_THREADS
-
 config BR2_PACKAGE_RPM
 	bool "rpm"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
 	select BR2_PACKAGE_BEECRYPT
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_OPENSSL
-	depends on BR2_PACKAGE_NEON
-	depends on !BR2_PACKAGE_NEON_NOXML
+	select BR2_PACKAGE_NEON
+	select BR2_PACKAGE_NEON_XML
 	select BR2_PACKAGE_NEON_ZLIB
 	select BR2_PACKAGE_NEON_SSL
 	help
