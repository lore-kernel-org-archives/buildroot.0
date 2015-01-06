From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 6 Jan 2015 15:52:54 +0000
Subject: [Buildroot] [PATCH v3] libmemcached: fix build failure with
	automake 1.15+
Message-ID: <1420559574-31618-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding a patch to move AC_CONFIG_AUX_DIR up a few lines so the autotools
can find it.

This patch is based on the same solution adopted by Debian:

  https://lists.debian.org/debian-release/2014/11/msg01231.html

This will prevent a build failure like this one caused by a version bump
of the automake package:

configure: error: cannot find install-sh, install.sh, or shtool in "."
"./.." "./../.."

Related:
  http://lists.busybox.net/pipermail/buildroot/2015-January/116604.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v2 -> v3: subject amended as per Gustavo Zacarias suggestion
Changes v1 -> v2: patch name amended

 .../libmemcached/0003-move-ac_config_aux_dir.patch |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/libmemcached/0003-move-ac_config_aux_dir.patch

diff --git a/package/libmemcached/0003-move-ac_config_aux_dir.patch b/package/libmemcached/0003-move-ac_config_aux_dir.patch
new file mode 100644
index 0000000..790aa93
--- /dev/null
+++ b/package/libmemcached/0003-move-ac_config_aux_dir.patch
@@ -0,0 +1,25 @@
+Move AC_CONFIG_AUX_DIR up a few lines so the autotools can find it
+
+This patch is based on the same solution adopted by Debian:
+
+  https://lists.debian.org/debian-release/2014/11/msg01231.html
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -rup a/configure.ac b/configure.ac
+--- a/configure.ac	2014-02-09 11:52:42.000000000 +0000
++++ b/configure.ac	2015-01-06 15:07:10.003074775 +0000
+@@ -13,11 +13,12 @@ m4_include([version.m4])
+ AC_PREREQ([2.61])
+ AC_INIT([libmemcached],VERSION_NUMBER,[http://libmemcached.org/])
+ 
++AC_CONFIG_AUX_DIR([build-aux])
++
+ # Setup the compilers early on
+ AC_PROG_CC([cc gcc clang])
+ AC_PROG_CXX([c++ g++ clang++])
+ 
+-AC_CONFIG_AUX_DIR([build-aux])
+ AC_CONFIG_MACRO_DIR([m4])
+ 
+ AC_CANONICAL_HOST
-- 
1.7.1
