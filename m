From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Dec 2010 23:47:28 +0100
Subject: [Buildroot] [git commit master 1/1] bison: bump to version 2.4.3
Message-ID: <20101222232249.4C2528E20B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2a92cee21a24daa0ef6e49a08c8c298fcee91c63
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bison/Config.in                            |    4 ++++
 .../bison/bison-2.4.3-uclibc-sched_param-def.patch |   19 +++++++++++++++++++
 package/bison/bison.mk                             |    6 +++---
 3 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100644 package/bison/bison-2.4.3-uclibc-sched_param-def.patch

diff --git a/package/bison/Config.in b/package/bison/Config.in
index edea4f6..e8aa0b6 100644
--- a/package/bison/Config.in
+++ b/package/bison/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_BISON
 	bool "bison"
+	depends on BR2_USE_WCHAR
 	help
 	  General-purpose parser generator that converts a
 	  grammar description for an LALR context-free grammar into a C
 	  program to parse that grammar.
 
 	  http://www.gnu.org/software/bison/
+
+comment "bison requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/bison/bison-2.4.3-uclibc-sched_param-def.patch b/package/bison/bison-2.4.3-uclibc-sched_param-def.patch
new file mode 100644
index 0000000..50652d8
--- /dev/null
+++ b/package/bison/bison-2.4.3-uclibc-sched_param-def.patch
@@ -0,0 +1,19 @@
+uclibc defines __GLIBC__ but it does not expose struct shed_param as much as glibc
+and is not needed too per standard. gnulib attempts to use it but we have to account
+for it because in this case uclibc does not behave like glibc.
+
+-Khem
+
+http://bugs.gentoo.org/336484
+
+--- m4-1.4.14/lib/spawn.in.h
++++ m4-1.4.14/lib/spawn.in.h
+@@ -31,7 +31,7 @@
+ 
+ /* Get definitions of 'struct sched_param' and 'sigset_t'.
+    But avoid namespace pollution on glibc systems.  */
+-#ifndef __GLIBC__
++#if !defined __GLIBC__ || defined __UCLIBC__
+ # include <sched.h>
+ # include <signal.h>
+ #endif
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 9e28e85..8849030 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -3,9 +3,9 @@
 # bison
 #
 #############################################################
-BISON_VERSION:=2.3
-BISON_SOURCE:=bison-$(BISON_VERSION).tar.bz2
-BISON_SITE:=$(BR2_GNU_MIRROR)/bison
+
+BISON_VERSION = 2.4.3
+BISON_SITE = $(BR2_GNU_MIRROR)/bison
 
 define BISON_DISABLE_EXAMPLES
 	echo 'all install:' > $(@D)/examples/Makefile
-- 
1.7.2.2
