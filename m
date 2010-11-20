From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 19 Nov 2010 23:36:37 -0500
Subject: [Buildroot] [PATCH v2] m4: version bump to 1.4.15
In-Reply-To: <1289916774-27881-1-git-send-email-vapier@gentoo.org>
References: <1289916774-27881-1-git-send-email-vapier@gentoo.org>
Message-ID: <1290227797-9887-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- include patch from OE for building with uClibc targets

 package/m4/m4-1.4.15-uclibc-sched_param-def.patch |   19 +++++++++++++++++++
 package/m4/m4.mk                                  |    2 +-
 2 files changed, 20 insertions(+), 1 deletions(-)
 create mode 100644 package/m4/m4-1.4.15-uclibc-sched_param-def.patch

diff --git a/package/m4/m4-1.4.15-uclibc-sched_param-def.patch b/package/m4/m4-1.4.15-uclibc-sched_param-def.patch
new file mode 100644
index 0000000..47bdd3d
--- /dev/null
+++ b/package/m4/m4-1.4.15-uclibc-sched_param-def.patch
@@ -0,0 +1,19 @@
+uclibc defines __GLIBC__ but it does not expose struct shed_param as much as glibc
+and is not needed too per standard. gnulib attempts to use it but we have to account
+for it because in this case uclibc does not behave like glibc.
+
+-Khem
+
+Index: m4-1.4.14/lib/spawn.in.h
+===================================================================
+--- m4-1.4.14.orig/lib/spawn.in.h	2010-06-01 14:27:59.394242980 -0700
++++ m4-1.4.14/lib/spawn.in.h	2010-06-01 14:28:28.202332200 -0700
+@@ -31,7 +31,7 @@
+ 
+ /* Get definitions of 'struct sched_param' and 'sigset_t'.
+    But avoid namespace pollution on glibc systems.  */
+-#ifndef __GLIBC__
++#if !defined __GLIBC__ || defined __UCLIBC__
+ # include <sched.h>
+ # include <signal.h>
+ #endif
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 7f2e333..d713b6d 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -3,7 +3,7 @@
 # m4
 #
 #############################################################
-M4_VERSION = 1.4.9
+M4_VERSION = 1.4.15
 M4_SOURCE = m4-$(M4_VERSION).tar.bz2
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 
-- 
1.7.3.2
