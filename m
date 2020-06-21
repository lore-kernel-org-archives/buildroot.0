From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 22:47:50 +0200
Subject: [Buildroot] [git commit] package/gpsd: drop patch
Message-ID: <20200621204641.ADFB181805@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=275dbb3addfcdaec69126be04f4dda9c768470be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is not needed since version 3.19 and
https://gitlab.com/gpsd/gpsd/-/commit/e3ec42e08a08af377499551d0528fc6ddf74cc12

So drop this patch and set CCFLAGS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: s/GPS_CFLAGS/GPSD_CFLAGS/ ]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...001-SConstruct-do-not-force-O2-by-default.patch | 29 ----------------------
 package/gpsd/gpsd.mk                               |  5 +++-
 2 files changed, 4 insertions(+), 30 deletions(-)

diff --git a/package/gpsd/0001-SConstruct-do-not-force-O2-by-default.patch b/package/gpsd/0001-SConstruct-do-not-force-O2-by-default.patch
deleted file mode 100644
index 641afa30af..0000000000
--- a/package/gpsd/0001-SConstruct-do-not-force-O2-by-default.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From eb7cce5dbb53a64cf55ac0d9a7fa4dcbebd4b173 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Mon, 14 Aug 2017 23:24:38 +0200
-Subject: [PATCH] SConstruct: do not force -O2 by default
-
--O2 can cause problems on some architectures, so do not force it by
- default.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- SConstruct | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/SConstruct b/SConstruct
-index fe444a2..93d91a4 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -330,8 +330,6 @@ if not 'CCFLAGS' in os.environ:
-     # Should we build with optimisation?
-     if env['debug'] or env['coveraging']:
-         env.Append(CCFLAGS=['-O0'])
--    else:
--        env.Append(CCFLAGS=['-O2'])
- 
- # Get a slight speedup by not doing automatic RCS and SCCS fetches.
- env.SourceCode('.', None)
--- 
-2.9.4
-
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 49de4b256c..96176fb187 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -200,7 +200,10 @@ ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
 GPSD_SCONS_OPTS += max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
 endif
 
-GPSD_SCONS_ENV += LDFLAGS="$(GPSD_LDFLAGS)" CFLAGS="$(GPSD_CFLAGS)"
+GPSD_SCONS_ENV += \
+	LDFLAGS="$(GPSD_LDFLAGS)" \
+	CFLAGS="$(GPSD_CFLAGS)" \
+	CCFLAGS="$(GPSD_CFLAGS)"
 
 define GPSD_BUILD_CMDS
 	(cd $(@D); \
