From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Jun 2012 11:11:07 +0200
Subject: [Buildroot] [git commit] automatically set PARALLEL_JOBS when
	BR2_JLEVEL is 0
Message-ID: <20120624095658.69F3F88F3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5016aa02fb51dbd73461f65ed8c7d9b52539a988
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_JLEVEL is 0, set PARALLEL_JOBS to double the number of CPUs
detected.  This allows one to more or less fully utilize the host
system without manually tuning the configuration.

Also make 0 the default value for BR2_JLEVEL.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in           |    8 +++++---
 package/Makefile.in |    8 ++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index 83f64bb..925c247 100644
--- a/Config.in
+++ b/Config.in
@@ -178,10 +178,12 @@ config BR2_DEBIAN_MIRROR
 endmenu
 
 config BR2_JLEVEL
-	int "Number of jobs to run simultaneously"
-	default "2"
+	int "Number of jobs to run simultaneously (0 for auto)"
+	default "0"
 	help
-	  Number of jobs to run simultaneously
+	  Number of jobs to run simultaneously.  If 0, determine
+	  automatically according to number of CPUs on the host
+	  system.
 
 config BR2_CCACHE
 	bool "Enable compiler cache"
diff --git a/package/Makefile.in b/package/Makefile.in
index be83ada..1d43aef 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -6,7 +6,15 @@ HOSTMAKE=$(MAKE)
 endif
 HOSTMAKE :=$(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
 
+# If BR2_LEVEL is 0, scale the maximum concurrency with the number of
+# CPUs.  A coefficient of 2 is used in order to keep processors busy
+# while waiting on I/O.
+ifeq ($(BR2_JLEVEL),0)
+PARALLEL_JOBS:=$(shell echo \
+	$$((2 * `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))
+else
 PARALLEL_JOBS:=$(BR2_JLEVEL)
+endif
 
 MAKE1:=$(HOSTMAKE) -j1
 MAKE:=$(HOSTMAKE) -j$(PARALLEL_JOBS)
