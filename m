From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 May 2015 16:15:40 +0200
Subject: [Buildroot] [PATCH 3/3] lirc-tools: fix static library build caused
	by 'loglevel' redefinition
In-Reply-To: <1431872140-765-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1431872140-765-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1431872140-765-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch to lirc-tools to fix static library builds
caused by the redefinition of the loglevel variable.

Fixes:

  http://autobuild.buildroot.org/results/2ac/2ac6a4f946d48cacff85d44d662e1c103f7443f8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...vel-redefinition-in-static-library-builds.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/lirc-tools/0003-Fix-loglevel-redefinition-in-static-library-builds.patch

diff --git a/package/lirc-tools/0003-Fix-loglevel-redefinition-in-static-library-builds.patch b/package/lirc-tools/0003-Fix-loglevel-redefinition-in-static-library-builds.patch
new file mode 100644
index 0000000..1e8717c
--- /dev/null
+++ b/package/lirc-tools/0003-Fix-loglevel-redefinition-in-static-library-builds.patch
@@ -0,0 +1,49 @@
+From 2a789161ef17ac1cedd9a4eb11423f6c1020d8d9 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 17 May 2015 16:08:15 +0200
+Subject: [PATCH] Fix loglevel redefinition in static library builds
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ daemons/lircmd.c | 1 -
+ tools/irrecord.c | 5 ++---
+ 2 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/daemons/lircmd.c b/daemons/lircmd.c
+index 023777c..e69078c 100644
+--- a/daemons/lircmd.c
++++ b/daemons/lircmd.c
+@@ -67,7 +67,6 @@ typedef uint64_t __u64;
+ 
+ static int uinputfd = -1;
+ static int useuinput = 0;
+-loglevel_t loglevel = 0;
+ 
+ 
+ static const struct option lircmd_options[] = {
+diff --git a/tools/irrecord.c b/tools/irrecord.c
+index f52328c..772b090 100644
+--- a/tools/irrecord.c
++++ b/tools/irrecord.c
+@@ -113,9 +113,6 @@ lirc_t aeps = 100;
+ 
+ #define SAMPLES 80
+ 
+-// Actual loglevel as per -D option, see lirc_log.h.
+-loglevel_t loglevel = LIRC_WARNING;
+-
+ int daemonized = 0;
+ 
+ struct ir_remote *emulation_data;
+@@ -407,6 +404,8 @@ int main(int argc, char **argv)
+ 	char commandline[128];
+ 	char path[128];
+ 	int get_pre = 0, get_post = 0, test = 0, invert = 0, trail = 0;
++	// Actual loglevel as per -D option, see lirc_log.h.
++	loglevel_t loglevel = LIRC_WARNING;
+ 
+ 	get_commandline(argc, argv, commandline, sizeof(commandline));
+ 	force = 0;
+-- 
+2.1.0
+
-- 
2.1.0
