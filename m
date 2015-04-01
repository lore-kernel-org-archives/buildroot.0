From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 22:48:23 +0200
Subject: [Buildroot] [git commit] docs/manual: remove references to largefile
Message-ID: <20150401205856.42B8E81918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d188366ea5c13731425384b2beafef9c2e2f740
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch from the ACL package example to RRDTOOL since ACL has no dual
(depends + select) dependencies any more and doesn't fit the example
scenario.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt |   37 +++++++++++++---------------
 docs/manual/configure.txt                 |   31 +++++++++++------------
 2 files changed, 32 insertions(+), 36 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 1ce9a3b..1b34b41 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -124,20 +124,21 @@ is not met.
 An example illustrates both the usage of +select+ and +depends on+.
 
 --------------------------
-config BR2_PACKAGE_ACL
-        bool "acl"
-        select BR2_PACKAGE_ATTR
-        depends on BR2_LARGEFILE
+config BR2_PACKAGE_RRDTOOL
+	bool "rrdtool"
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LIBART
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_ZLIB
         help
-          POSIX Access Control Lists, which are used to define more
-          fine-grained discretionary access rights for files and
-          directories.
-          This package also provides libacl.
+	  RRDtool is the OpenSource industry standard, high performance
+	  data logging and graphing system for time series data.
 
-          http://savannah.nongnu.org/projects/acl
+	  http://oss.oetiker.ch/rrdtool/
 
-comment "acl needs a toolchain w/ largefile"
-        depends on !BR2_LARGEFILE
+comment "rrdtool needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
 --------------------------
 
 
@@ -206,10 +207,10 @@ coding style].
 ==== Dependencies on target and toolchain options
 
 Many packages depend on certain options of the toolchain: the choice of
-C library, C++ support, largefile support, thread support, RPC support,
-IPv6 support, wchar support, or dynamic library support. Some packages
-can only be built on certain target architectures, or if an MMU is
-available in the processor.
+C library, C++ support, thread support, RPC support, IPv6 support,
+wchar support, or dynamic library support. Some packages can only be
+built on certain target architectures, or if an MMU is available in the
+processor.
 
 These dependencies have to be expressed with the appropriate 'depends
 on' statements in the Config.in file. Additionally, for dependencies on
@@ -241,7 +242,7 @@ foo needs a toolchain w/ featA, featB, featC
 for example:
 
 --------------------------
-aircrack-ng needs a toolchain w/ largefile, threads
+mpd needs a toolchain w/ C++, threads, wchar
 --------------------------
 
 or
@@ -287,10 +288,6 @@ use in the comment.
 ** Dependency symbol: +BR2_INSTALL_LIBSTDCPP+
 ** Comment string: `C++`
 
-* largefile support
-** Dependency symbol: +BR2_LARGEFILE+
-** Comment string: +largefile+
-
 * thread support
 ** Dependency symbol: +BR2_TOOLCHAIN_HAS_THREADS+
 ** Comment string: +threads+ (unless +BR2_TOOLCHAIN_HAS_THREADS_NPTL+
diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index bd235f0..c06182b 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -109,20 +109,19 @@ most important ones allow to:
  * Change the version of the GCC compiler, binutils and the C library.
 
  * Select a number of toolchain options (uClibc only): whether the
-   toolchain should have largefile support (i.e. support for files
-   larger than 2 GB on 32 bits systems), IPv6 support, RPC support
-   (used mainly for NFS), wide-char support, locale support (for
-   internationalization), C++ support or thread support. Depending on
-   which options you choose, the number of userspace applications and
-   libraries visible in Buildroot menus will change: many applications
-   and libraries require certain toolchain options to be enabled. Most
-   packages show a comment when a certain toolchain option is required
-   to be able to enable those packages. If needed, you can further
-   refine the uClibc configuration by running +make
-   uclibc-menuconfig+. Note however that all packages in Buildroot are
-   tested against the default uClibc configuration bundled in
-   Buildroot: if you deviate from this configuration by removing
-   features from uClibc, some packages may no longer build.
+   toolchain should have IPv6 support, RPC support (used mainly for
+   NFS), wide-char support, locale support (for internationalization),
+   C++ support or thread support. Depending on which options you choose,
+   the number of userspace applications and libraries visible in
+   Buildroot menus will change: many applications and libraries require
+   certain toolchain options to be enabled. Most packages show a comment
+   when a certain toolchain option is required to be able to enable
+   those packages. If needed, you can further refine the uClibc
+   configuration by running +make uclibc-menuconfig+. Note however that
+   all packages in Buildroot are tested against the default uClibc
+   configuration bundled in Buildroot: if you deviate from this
+   configuration by removing features from uClibc, some packages may no
+   longer build.
 
 It is worth noting that whenever one of those options is modified,
 then the entire toolchain and system must be rebuilt. See
@@ -178,8 +177,8 @@ Then, you have three solutions to use an external toolchain:
   external toolchain uses the 'glibc' library, you only have to tell
   whether your toolchain supports C\++ or not and whether it has
   built-in RPC support. If your external toolchain uses the 'uClibc'
-  library, then you have to tell Buildroot if it supports largefile,
-  IPv6, RPC, wide-char, locale, program invocation, threads and
+  library, then you have to tell Buildroot if it supports IPv6,
+  RPC, wide-char, locale, program invocation, threads and
   C++. At the beginning of the execution, Buildroot will tell you if
   the selected options do not match the toolchain configuration.
 
