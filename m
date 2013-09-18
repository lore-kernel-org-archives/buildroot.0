From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Sep 2013 11:01:36 +0200
Subject: [Buildroot] [PATCH 3 of 4 RFC] manual: add section about depending
 on toolchain options
In-Reply-To: <patchbomb.1379494893@argentina>
References: <patchbomb.1379494893@argentina>
Message-ID: <89b40887c8268e316399.1379494896@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the comments in Config.in files when depending on toolchain options
are not at all lined up. This patch adds a section to the documentation that
explains which format is to be used.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Notes:
- How we will specify the C library is currently marked as 'to be decided'.
This patch series does not yet unify that, but I plan to do that in a new
patch (or update this series if we can reach a decision shortly).  The problem
is that not all packages that have a dependency on e.g. glibc add a comment to
show this to the user. A proposal would be to have a comment like:
    foo needs a (e)glibc toolchain w/ featA, featB, featC
where the '(e)glibc' string would be left out if there is no constraint on the
C library.

- For the 'dynamic library' option: there are packages that depend on it but do
not have a comment indicating that. If there is an agreement on the format as
shown in this patch, then I will do that.


 docs/manual/adding-packages-directory.txt |  75 ++++++++++++++++++++++++++++---
 1 files changed, 67 insertions(+), 8 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -70,13 +70,9 @@ rules:
 
 * Use a +depends on+ type of dependency when the user really needs to
   be aware of the dependency. Typically, Buildroot uses this type of
-  dependency for dependencies on toolchain options (target
-  architecture, MMU support, C library, C++ support, large file
-  support, thread support, RPC support, IPV6 support, WCHAR support),
-  or for dependencies on "big" things, such as the X.org system. For
-  dependencies on toolchain options, there should be a +comment+ that
-  is displayed when the option is not
-  enabled, so that the user knows why the package is not available.
+  dependency for dependencies on target architecture, MMU support,
+  toolchain options (see xref:dependencies-toolchain-options[]) or for
+  dependencies on "big" things, such as the X.org system.
   The +depends on+ keyword expresses the dependency with a forward
   semantic.
 
@@ -101,7 +97,7 @@ config BR2_PACKAGE_ACL
 
           http://savannah.nongnu.org/projects/acl
 
-comment "acl requires a toolchain with LARGEFILE support"
+comment "acl needs a toolchain w/ largefile"
         depends on !BR2_LARGEFILE
 --------------------------
 
@@ -167,6 +163,69 @@ package.
 Further formatting details: see xref:writing-rules-config-in[the
 coding style].
 
+[[dependencies-toolchain-options]]
+Dependencies on toolchain options
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+Many packages depend on certain options of the toolchain, like the
+C library, C++ support, largefile support, thread support, RPC
+support, IPv6 support, wchar support, or dynamic libraries. These
+dependencies have to expressed with the appropriate 'depends on'
+statements in the Config.in file. Additionally, a +comment+ should be
+displayed when the option is not enabled, so that the user knows why
+the package is not available.
+
+The general format of such a +comment+ for package foo is:
+--------------------------
+foo needs a toolchain w/ featA, featB, featC
+--------------------------
+
+for example:
+--------------------------
+aircrack-ng needs a toolchain w/ largefile, threads
+--------------------------
+
+Note that this text is kept brief on purpose, so that it will fit on a
+80-character terminal without scrolling.
+
+The rest of this section enumerates the different toolchain options,
+the corresponding config symbols to depend on, and the string literals
+to use in the comment.
+
+* C library
+** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
++BR2_TOOLCHAIN_USES_UCLIBC+
+** Comment string: (to be decided)
+
+* C++ support
+** Dependency symbol: +BR2_INSTALL_LIBSTDCPP+
+** Comment string: `C++`
+
+* largefile support
+** Dependency symbol: +BR2_LARGEFILE+
+** Comment string: +largefile+
+
+* thread support
+** Dependency symbol: +BR2_TOOLCHAIN_HAS_THREADS+
+** Comment string: +threads+
+
+* RPC support
+** Dependency symbol: +BR2_TOOLCHAIN_HAS_NATIVE_RPC+
+** Comment string: +RPC+
+
+* IPv6 support
+** Dependency symbol: +BR2_INET_IPV6+
+** Comment string: +IPv6+ (lowercase v)
+
+* wchar support
+** Dependency symbol: +BR2_USE_WCHAR+
+** Comment string: +wchar+
+
+* dynamic library: the user can indicate that he wants static
+libraries where possible, but not all packages support that.
+** Dependency symbol: +BR2_PREFER_STATIC_LIB+
+** Comment string: +dynamic library+
+
+
 The +.mk+ file
 ~~~~~~~~~~~~~~
 [[adding-packages-mk]]
