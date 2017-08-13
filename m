From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 13 Aug 2017 10:59:26 +0200
Subject: [Buildroot] [PATCH] gpsd: fix compile for microblaze arch
Message-ID: <20170813085926.GA13312@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable O2 and add O0. The suggested flags in the gcc report
are not enough for gcc >= 6.

Fixes:
  http://autobuild.buildroot.net/results/368/3686cd3f3e7b6aee84f4377bd2dded1115321fb3/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gpsd/0002-do-not-append-O2.patch | 18 ++++++++++++++++++
 package/gpsd/gpsd.mk                     |  2 +-
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 package/gpsd/0002-do-not-append-O2.patch

diff --git a/package/gpsd/0002-do-not-append-O2.patch b/package/gpsd/0002-do-not-append-O2.patch
new file mode 100644
index 000000000..585c82835
--- /dev/null
+++ b/package/gpsd/0002-do-not-append-O2.patch
@@ -0,0 +1,18 @@
+Disable default O2 passing
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gpsd-3.16.orig/SConstruct gpsd-3.16/SConstruct
+--- gpsd-3.16.orig/SConstruct	2016-01-08 20:25:48.000000000 +0100
++++ gpsd-3.16/SConstruct	2017-08-13 10:42:14.082794656 +0200
+@@ -330,9 +330,7 @@
+     # Should we build with optimisation?
+     if env['debug'] or env['coveraging']:
+         env.Append(CCFLAGS=['-O0'])
+-    else:
+-        env.Append(CCFLAGS=['-O2'])
+-
++#
+ # Get a slight speedup by not doing automatic RCS and SCCS fetches.
+ env.SourceCode('.', None)
+ 
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 552d6d936..2b9c38a42 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -44,7 +44,7 @@ endif
 # A bug was reported to the gcc bug tracker:
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485
 ifeq ($(BR2_microblaze),y)
-GPSD_CFLAGS += -fno-expensive-optimizations -fno-schedule-insns
+GPSD_CFLAGS += -O0
 endif
 
 # Enable or disable Qt binding
-- 
2.11.0
