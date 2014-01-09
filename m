From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Jan 2014 22:04:26 +0100
Subject: [Buildroot] [git commit] package/ola: fix build against
	google.protobuf
Message-ID: <20140109210614.80DD09C413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db255491868440a0f45b75cea3304d7f8a486bb2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To test for the google.protobuf presence, ola's ./conifgure runs the
host Python. This is doomed to fail, as google.protobuf is installed
in target/ and not in host/

Since our dependencies ensures that google.protobuf is indeed installed
before we attempt to configure and build ola, we can just ditch the
test altogether.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../ola-0002-fix-check-for-google.protobuf.patch   |   30 ++++++++++++++++++++
 package/ola/ola.mk                                 |    3 ++
 2 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/ola/ola-0002-fix-check-for-google.protobuf.patch b/package/ola/ola-0002-fix-check-for-google.protobuf.patch
new file mode 100644
index 0000000..f0bc465
--- /dev/null
+++ b/package/ola/ola-0002-fix-check-for-google.protobuf.patch
@@ -0,0 +1,30 @@
+configure: do not check for google.protobuf
+
+The check for google.protobuf is inherently flawed for cross-compilation,
+as it uses the host Python to check for target modules.
+
+In Buildroot, our dependencies ensures that google.protobuf is present
+by the time we configure and build ola, so we can just skip the test
+altogether.
+
+We don't need to fake the result of the test: it is used nowhere; the
+test is only here to fail or succeed.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN ola-0.8.32.orig/configure.ac ola-0.8.32/configure.ac
+--- ola-0.8.32.orig/configure.ac	2013-09-29 19:46:48.000000000 +0200
++++ ola-0.8.32/configure.ac	2014-01-09 19:43:55.342044336 +0100
+@@ -530,7 +530,11 @@
+ 
+ if test "${enable_python_libs}" = "yes"; then
+  AM_PATH_PYTHON(2.6)
+- AX_PYTHON_MODULE("google.protobuf", "fatal")
++# AX_PYTHON_MODULE is inherently broken for cross-compilation
++# since it executes the host Python to check for target modules.
++# In Buildroot, we do not need to check for google.protobuf,
++# since our dependencies ensure it is available.
++# AX_PYTHON_MODULE("google.protobuf", "fatal")
+ fi
+ 
+ # Maybe build the logic sniffer tools
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index bc7de24..542aa77 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -11,6 +11,9 @@ OLA_LICENSE = LGPLv2.1+ (libola, libolacommon, Python bindings), GPLv2+ (libolas
 OLA_LICENSE_FILES = LICENCE GPL LGPL
 OLA_INSTALL_STAGING = YES
 
+# We modify configure.ac, so we need to autoreconf
+OLA_AUTORECONF = YES
+
 # util-linux provides uuid lib
 OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex
 
