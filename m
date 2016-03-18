From: Joshua Henderson <digitalpeer@digitalpeer.com>
Date: Thu, 17 Mar 2016 21:15:09 -0700
Subject: [Buildroot] [PATCH] package/lirc-tools: Bump to version 0.9.3a
Message-ID: <1458274509-28240-1-git-send-email-digitalpeer@digitalpeer.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As part of bumping to version 0.9.3a, two patches are dropped because they
are already upstream.

Signed-off-by: Joshua Henderson <digitalpeer@digitalpeer.com>
---
 ...ools-Make-make_rel_symlink.py-use-python3.patch |   46 ------------------
 ...vel-redefinition-in-static-library-builds.patch |   49 --------------------
 package/lirc-tools/lirc-tools.hash                 |    4 +-
 package/lirc-tools/lirc-tools.mk                   |    2 +-
 4 files changed, 3 insertions(+), 98 deletions(-)
 delete mode 100644 package/lirc-tools/0001-tools-Make-make_rel_symlink.py-use-python3.patch
 delete mode 100644 package/lirc-tools/0003-Fix-loglevel-redefinition-in-static-library-builds.patch

diff --git a/package/lirc-tools/0001-tools-Make-make_rel_symlink.py-use-python3.patch b/package/lirc-tools/0001-tools-Make-make_rel_symlink.py-use-python3.patch
deleted file mode 100644
index 3b5db2d..0000000
--- a/package/lirc-tools/0001-tools-Make-make_rel_symlink.py-use-python3.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From ae2e8cc85b6b4d2202e42d704dde8757ffd31da6 Mon Sep 17 00:00:00 2001
-From: Alec Leamas <leamas.alec@gmail.com>
-Date: Thu, 11 Dec 2014 04:44:49 +0100
-Subject: [PATCH] tools: Make make_rel_symlink.py use python3.
-
-Upstream patch:
-http://sourceforge.net/p/lirc/git/ci/ae2e8cc85b6b4d2202e42d704dde8757ffd31da6/
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- tools/make_rel_symlink.py | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/tools/make_rel_symlink.py b/tools/make_rel_symlink.py
-index 5c893056f379..896637ff93e0 100755
---- a/tools/make_rel_symlink.py
-+++ b/tools/make_rel_symlink.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- 
- import os
- import os.path
-@@ -32,16 +32,16 @@ if sys.argv[1] == "-p":
-     sys.argv = sys.argv[ 1:]
- 
- if len( sys.argv ) != 3:
--    print USAGE
-+    print(USAGE)
-     sys.exit( 1 )
- 
- if  os.path.isdir(  sys.argv[2] ):
--    print "Removing link target dir:" +  sys.argv[2]
-+    print("Removing link target dir:" +  sys.argv[2])
-     shutil.rmtree( sys.argv[2])
- 
- link_path = relative_ln_s( sys.argv[1], sys.argv[2] )
- if just_print:
--    print link_path
-+    print(link_path)
- else:
-     os.chdir( os.path.dirname( sys.argv[2]))
-     target = os.path.basename( sys.argv[2])
--- 
-2.1.4
-
diff --git a/package/lirc-tools/0003-Fix-loglevel-redefinition-in-static-library-builds.patch b/package/lirc-tools/0003-Fix-loglevel-redefinition-in-static-library-builds.patch
deleted file mode 100644
index 1e8717c..0000000
--- a/package/lirc-tools/0003-Fix-loglevel-redefinition-in-static-library-builds.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 2a789161ef17ac1cedd9a4eb11423f6c1020d8d9 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 17 May 2015 16:08:15 +0200
-Subject: [PATCH] Fix loglevel redefinition in static library builds
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- daemons/lircmd.c | 1 -
- tools/irrecord.c | 5 ++---
- 2 files changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/daemons/lircmd.c b/daemons/lircmd.c
-index 023777c..e69078c 100644
---- a/daemons/lircmd.c
-+++ b/daemons/lircmd.c
-@@ -67,7 +67,6 @@ typedef uint64_t __u64;
- 
- static int uinputfd = -1;
- static int useuinput = 0;
--loglevel_t loglevel = 0;
- 
- 
- static const struct option lircmd_options[] = {
-diff --git a/tools/irrecord.c b/tools/irrecord.c
-index f52328c..772b090 100644
---- a/tools/irrecord.c
-+++ b/tools/irrecord.c
-@@ -113,9 +113,6 @@ lirc_t aeps = 100;
- 
- #define SAMPLES 80
- 
--// Actual loglevel as per -D option, see lirc_log.h.
--loglevel_t loglevel = LIRC_WARNING;
--
- int daemonized = 0;
- 
- struct ir_remote *emulation_data;
-@@ -407,6 +404,8 @@ int main(int argc, char **argv)
- 	char commandline[128];
- 	char path[128];
- 	int get_pre = 0, get_post = 0, test = 0, invert = 0, trail = 0;
-+	// Actual loglevel as per -D option, see lirc_log.h.
-+	loglevel_t loglevel = LIRC_WARNING;
- 
- 	get_commandline(argc, argv, commandline, sizeof(commandline));
- 	force = 0;
--- 
-2.1.0
-
diff --git a/package/lirc-tools/lirc-tools.hash b/package/lirc-tools/lirc-tools.hash
index 3986767..1acd93d 100644
--- a/package/lirc-tools/lirc-tools.hash
+++ b/package/lirc-tools/lirc-tools.hash
@@ -1,2 +1,2 @@
-#hash from http://sourceforge.net/projects/lirc/files/LIRC/0.9.2/
-sha1 585daed1eaa169b9683a507e26b1331a947a4dcd lirc-0.9.2.tar.bz2
+#hash from http://sourceforge.net/projects/lirc/files/LIRC/0.9.3a/
+sha1 a6cadb916e09de068c967055b48c96d79d38f736 lirc-0.9.3a.tar.bz2
diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index d366a83..ccdc8d3 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIRC_TOOLS_VERSION = 0.9.2
+LIRC_TOOLS_VERSION = 0.9.3a
 LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
 LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)
 LIRC_TOOLS_LICENSE = GPLv2+
-- 
1.7.9.5
