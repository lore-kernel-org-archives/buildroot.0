From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Sep 2014 22:17:46 +0200
Subject: [Buildroot] [git commit] openssh: Add patch to fix compilation with
	musl libc
Message-ID: <20140913202314.4152C9D687@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2fea21799223d41605556858a95b55e69e9960ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script finds the "howmany" macro, but some of the sources
using it do not include the required <sys/param.h> header.

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../openssh/openssh-02-fix-howmany-include.patch   |   66 ++++++++++++++++++++
 1 files changed, 66 insertions(+), 0 deletions(-)

diff --git a/package/openssh/openssh-02-fix-howmany-include.patch b/package/openssh/openssh-02-fix-howmany-include.patch
new file mode 100644
index 0000000..21675bf
--- /dev/null
+++ b/package/openssh/openssh-02-fix-howmany-include.patch
@@ -0,0 +1,66 @@
+diff -ru openssh-6.6p1.org/channels.c openssh-6.6p1/channels.c
+--- openssh-6.6p1.org/channels.c	2014-02-27 00:18:33.000000000 +0100
++++ openssh-6.6p1/channels.c	2014-09-12 05:33:43.791424676 +0200
+@@ -41,6 +41,7 @@
+ 
+ #include "includes.h"
+ 
++#include <sys/param.h>
+ #include <sys/types.h>
+ #include <sys/ioctl.h>
+ #include <sys/un.h>
+diff -ru openssh-6.6p1.org/openbsd-compat/bsd-poll.c openssh-6.6p1/openbsd-compat/bsd-poll.c
+--- openssh-6.6p1.org/openbsd-compat/bsd-poll.c	2014-02-06 00:44:13.000000000 +0100
++++ openssh-6.6p1/openbsd-compat/bsd-poll.c	2014-09-12 05:39:35.580947451 +0200
+@@ -19,6 +19,7 @@
+ #include "includes.h"
+ #if !defined(HAVE_POLL)
+ 
++#include <sys/param.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #ifdef HAVE_SYS_SELECT_H
+diff -ru openssh-6.6p1.org/sshconnect.c openssh-6.6p1/sshconnect.c
+--- openssh-6.6p1.org/sshconnect.c	2014-02-06 23:24:34.000000000 +0100
++++ openssh-6.6p1/sshconnect.c	2014-09-12 05:39:57.372236592 +0200
+@@ -15,6 +15,7 @@
+ 
+ #include "includes.h"
+ 
++#include <sys/param.h>
+ #include <sys/types.h>
+ #include <sys/wait.h>
+ #include <sys/stat.h>
+diff -ru openssh-6.6p1.org/sshd.c openssh-6.6p1/sshd.c
+--- openssh-6.6p1.org/sshd.c	2014-02-27 00:20:08.000000000 +0100
++++ openssh-6.6p1/sshd.c	2014-09-12 05:42:20.233576519 +0200
+@@ -44,6 +44,7 @@
+ 
+ #include "includes.h"
+ 
++#include <sys/param.h>
+ #include <sys/types.h>
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
+diff -ru openssh-6.6p1.org/ssh-keyscan.c openssh-6.6p1/ssh-keyscan.c
+--- openssh-6.6p1.org/ssh-keyscan.c	2013-12-07 01:24:02.000000000 +0100
++++ openssh-6.6p1/ssh-keyscan.c	2014-09-12 05:41:03.102092462 +0200
+@@ -10,6 +10,7 @@
+ #include "includes.h"
+  
+ #include "openbsd-compat/sys-queue.h"
++#include <sys/param.h>
+ #include <sys/resource.h>
+ #ifdef HAVE_SYS_TIME_H
+ # include <sys/time.h>
+diff -ru openssh-6.6p1.org/ssh-pkcs11-helper.c openssh-6.6p1/ssh-pkcs11-helper.c
+--- openssh-6.6p1.org/ssh-pkcs11-helper.c	2013-12-05 00:23:21.000000000 +0100
++++ openssh-6.6p1/ssh-pkcs11-helper.c	2014-09-12 05:40:20.488482522 +0200
+@@ -17,6 +17,7 @@
+ 
+ #include "includes.h"
+ 
++#include <sys/param.h>
+ #include <sys/types.h>
+ #ifdef HAVE_SYS_TIME_H
+ # include <sys/time.h>
