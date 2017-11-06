From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Nov 2017 13:10:58 +0100
Subject: [Buildroot] [git commit] lxc: fix legacy PR_{G,
 S}ET_NO_NEW_PRIVS handling
Message-ID: <20171106120413.97FD9802E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35bf58d3101a04d518d90d237ea9bc11baa1398a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/841/841e9601a6afc023d2a303ffb4b7ea63edd816af/

The configure checks for these use AC_CHECK_DECLS, which define the symbol
to 0 if not available - So adjust the code to match. From the autoconf
manual:

https://www.gnu.org/software/autoconf/manual/autoconf-2.65/html_node/Generic-Declarations.html)

For each of the symbols (comma-separated list), define HAVE_DECL_symbol (in
all capitals) to ???1??? if symbol is declared, otherwise to ???0???.

Patch submitted upstream: https://github.com/lxc/lxc/pull/1901

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Fix-legacy-PR_-G-S-ET_NO_NEW_PRIVS-handl.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/lxc/0002-lxc-start.c-Fix-legacy-PR_-G-S-ET_NO_NEW_PRIVS-handl.patch b/package/lxc/0002-lxc-start.c-Fix-legacy-PR_-G-S-ET_NO_NEW_PRIVS-handl.patch
new file mode 100644
index 0000000..a11f785
--- /dev/null
+++ b/package/lxc/0002-lxc-start.c-Fix-legacy-PR_-G-S-ET_NO_NEW_PRIVS-handl.patch
@@ -0,0 +1,49 @@
+From 995accccbb07d59381aa60939cd44b41dc092dda Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Mon, 6 Nov 2017 09:35:48 +0100
+Subject: [PATCH] lxc/start.c: Fix legacy PR_{G,S}ET_NO_NEW_PRIVS handling
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The configure checks for these use AC_CHECK_DECLS, which define the symbol
+to 0 if not available - So adjust the code to match.  From the autoconf
+manual:
+
+https://www.gnu.org/software/autoconf/manual/autoconf-2.65/html_node/Generic-Declarations.html)
+
+For each of the symbols (comma-separated list), define HAVE_DECL_symbol (in
+all capitals) to ???1??? if symbol is declared, otherwise to ???0???.
+
+[Submitted upstream: https://github.com/lxc/lxc/pull/1901]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/lxc/start.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/lxc/start.c b/src/lxc/start.c
+index 2632a9b1..fe76b235 100644
+--- a/src/lxc/start.c
++++ b/src/lxc/start.c
+@@ -52,15 +52,15 @@
+ #include <sys/capability.h>
+ #endif
+ 
+-#ifndef HAVE_DECL_PR_CAPBSET_DROP
++#if !HAVE_DECL_PR_CAPBSET_DROP
+ #define PR_CAPBSET_DROP 24
+ #endif
+ 
+-#ifndef HAVE_DECL_PR_SET_NO_NEW_PRIVS
++#if !HAVE_DECL_PR_SET_NO_NEW_PRIVS
+ #define PR_SET_NO_NEW_PRIVS 38
+ #endif
+ 
+-#ifndef HAVE_DECL_PR_GET_NO_NEW_PRIVS
++#if !HAVE_DECL_PR_GET_NO_NEW_PRIVS
+ #define PR_GET_NO_NEW_PRIVS 39
+ #endif
+ 
+-- 
+2.11.0
+
