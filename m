From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Nov 2011 21:28:50 +0100
Subject: [Buildroot] [git commit] doc: more details about expressing
	dependencies in Config.in
Message-ID: <20111113203424.A3FFD8F314@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0afbdad6b5a5b0fe7b0665cc0d9a337f0ace412
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Minor tweak]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-directory.txt |   45 +++++++++++++++++++++++++++++
 1 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 2e8786a..58f0262 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -46,6 +46,51 @@ supposed to contain anything but the 'bare' name of the package.
 source "package/libfoo/Config.in"
 --------------------------
 
+The +Config.in+ file of your package must also ensure that
+dependencies are enabled. Typically, Buildroot uses the following
+rules:
+
+* Use a +select+ type of dependency for dependencies on
+  libraries. These dependencies are generally not obvious and it
+  therefore make sense to have the kconfig system ensure that the
+  dependencies are selected. For example, the _libgtk2_ package uses
+  +select BR2_PACKAGE_LIBGLIB2+ to make sure this library is also
+  enabled.
+
+* Use a +depends on+ type of dependency when the user really needs to
+  be aware of the dependency. Typically, Buildroot uses this type of
+  dependency for dependencies on toolchain options (large file
+  support, RPC support, IPV6 support), or for dependencies on "big"
+  things, such as the X.org system. In some cases, especially
+  dependency on toolchain options, it is recommended to add a
+  +comment+ displayed when the option is not enabled, so that the user
+  knows why the package is not available.
+
+An example illustrates both the usage of +select+ and +depends on+.
+
+--------------------------
+config BR2_PACKAGE_ACL
+        bool "acl"
+        select BR2_PACKAGE_ATTR
+        depends on BR2_LARGEFILE
+        help
+          POSIX Access Control Lists, which are used to define more
+          fine-grained discretionary access rights for files and
+          directories.
+          This package also provides libacl.
+
+          http://savannah.nongnu.org/projects/acl
+
+comment "acl requires a toolchain with LARGEFILE support"
+        depends on !BR2_LARGEFILE
+--------------------------
+
+
+Note that such dependencies will make sure that the dependency option
+is also enabled, but not necessarily built before your package. To do
+so, the dependency also needs to be expressed in the +.mk+ file of the
+package.
+
 The +.mk+ file
 ~~~~~~~~~~~~~~
 
