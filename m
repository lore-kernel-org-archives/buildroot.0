From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 00:47:38 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] gpsd: fix build for
	microblaze architecture
Message-ID: <20170906112606.6C52982145@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdce421a5fab2d1190a20087ba715dd5f12aad0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Disable O2 and add O0. The suggested flags in the gcc report
are not enough for gcc >= 6.

Fixes:

  http://autobuild.buildroot.net/results/3686cd3f3e7b6aee84f4377bd2dded1115321fb3/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas: use Git to format the patch, improve patch description.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

(cherry picked from commit e6d0177f5319457588080b7ed111da2c3b628cf8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...002-SConstruct-do-not-force-O2-by-default.patch | 29 ++++++++++++++++++++++
 package/gpsd/gpsd.mk                               |  2 +-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/package/gpsd/0002-SConstruct-do-not-force-O2-by-default.patch b/package/gpsd/0002-SConstruct-do-not-force-O2-by-default.patch
new file mode 100644
index 0000000..641afa3
--- /dev/null
+++ b/package/gpsd/0002-SConstruct-do-not-force-O2-by-default.patch
@@ -0,0 +1,29 @@
+From eb7cce5dbb53a64cf55ac0d9a7fa4dcbebd4b173 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 14 Aug 2017 23:24:38 +0200
+Subject: [PATCH] SConstruct: do not force -O2 by default
+
+-O2 can cause problems on some architectures, so do not force it by
+ default.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ SConstruct | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index fe444a2..93d91a4 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -330,8 +330,6 @@ if not 'CCFLAGS' in os.environ:
+     # Should we build with optimisation?
+     if env['debug'] or env['coveraging']:
+         env.Append(CCFLAGS=['-O0'])
+-    else:
+-        env.Append(CCFLAGS=['-O2'])
+ 
+ # Get a slight speedup by not doing automatic RCS and SCCS fetches.
+ env.SourceCode('.', None)
+-- 
+2.9.4
+
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 73067d3..7c2d37b 100644
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
