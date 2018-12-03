From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 22:51:24 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] package/libid3tag: needs
 autoreconf
Message-ID: <20181203215204.3966681E8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5816a63db83d2d30b6f0145538eb6a7e0108de5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

libid3tag uses a very old configure script.

When the toolchain lacks C++ and the build machine lacks /lib/cpp, this
old configure script fails because it can't find a C++ preprocessor that
is valid:

    checking for arm-buildroot-linux-uclibcgnueabi-g++... no
    checking whether we are using the GNU C++ compiler... no
    checking whether no accepts -g... no
    checking dependency style of no... none
    checking how to run the C++ preprocessor... /lib/cpp
    configure: error: C++ preprocessor "/lib/cpp" fails sanity check
    See `config.log' for more details.

This is yet another case that was tentatively fixed by bd39d11d2e
(core/infra: fix build on toolchain without C++), further amended by
4cd1ab15886 (core: alternate solution to disable C++).

However, this only works on libtool scripts that are recent enough, and
thus we need to autoreconf to get it.

We also need to patch configure.ac so that it does not fail on the
missing, GNU-specific files: NEWS, AUTHORS, and Changelog.

Fixes:
    http://autobuild.buildroot.org/results/ac3/ac3870208aab6001db6b790b6c5dde64d08f7669/
    http://autobuild.buildroot.org/results/cc1/cc18397f38dfd4f1e6605f7a6f58edab49b396ac/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 43274dd3e0daa3de09d32828e63e6608e8db1e5b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libid3tag/0001-configure-automake-foreign.patch | 16 ++++++++++++++++
 package/libid3tag/libid3tag.mk                          |  5 ++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/package/libid3tag/0001-configure-automake-foreign.patch b/package/libid3tag/0001-configure-automake-foreign.patch
new file mode 100644
index 0000000000..8521d559f2
--- /dev/null
+++ b/package/libid3tag/0001-configure-automake-foreign.patch
@@ -0,0 +1,16 @@
+configure: don't require GNU-specific files when running automake
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN libid3tag-0.15.1b.orig/configure.ac libid3tag-0.15.1b/configure.ac
+--- libid3tag-0.15.1b.orig/configure.ac	2004-01-24 00:22:46.000000000 +0100
++++ libid3tag-0.15.1b/configure.ac	2018-11-25 15:31:04.184342212 +0100
+@@ -26,7 +26,7 @@
+ 
+ AC_CONFIG_SRCDIR([id3tag.h])
+ 
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ 
+ AM_CONFIG_HEADER([config.h])
+ 
diff --git a/package/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
index 951ae09c77..402e154ae1 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -10,6 +10,9 @@ LIBID3TAG_LICENSE = GPL-2.0+
 LIBID3TAG_LICENSE_FILES = COPYING COPYRIGHT
 LIBID3TAG_INSTALL_STAGING = YES
 LIBID3TAG_DEPENDENCIES = zlib
-LIBID3TAG_LIBTOOL_PATCH = NO
+
+# Force autoreconf to be able to use a more recent libtool script, that
+# is able to properly behave in the face of a missing C++ compiler.
+LIBID3TAG_AUTORECONF = YES
 
 $(eval $(autotools-package))
