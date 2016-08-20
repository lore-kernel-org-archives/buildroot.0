From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 20 Aug 2016 11:42:11 -0300
Subject: [Buildroot] [PATCH] mpv: bump to version 0.19.0
Message-ID: <1471704131-5919-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And drop upstreamed patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../mpv/0002-wscript-improve-stdatomic-check.patch | 47 ----------------------
 package/mpv/mpv.hash                               |  2 +-
 package/mpv/mpv.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 package/mpv/0002-wscript-improve-stdatomic-check.patch

diff --git a/package/mpv/0002-wscript-improve-stdatomic-check.patch b/package/mpv/0002-wscript-improve-stdatomic-check.patch
deleted file mode 100644
index c2a307e..0000000
--- a/package/mpv/0002-wscript-improve-stdatomic-check.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 5a635a0066b10d2ba25e0ce78cc57b2be619371c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 8 Aug 2016 23:34:32 +0200
-Subject: [PATCH] wscript: improve stdatomic check
-
-The current stdatomic check verifies the availability of the function by
-calling atomic_load(). It also uses this test to check if linking
-against libatomic is needed or not.
-
-Unfortunately, on specific architectures (namely SPARC), using
-atomic_load() does *not* require linking against libatomic, while other
-atomic operations do. Due to this, mpv's wscript concludes that
-stdatomic is available, and that linking against libatomic is not
-needed, causing the following link failure:
-
-[190/190] Linking build/mpv
-audio/out/ao.c.13.o: In function `ao_query_and_reset_events':
-/home/peko/autobuild/instance-0/output/build/mpv-0.18.1/build/../audio/out/ao.c:399: undefined reference to `__atomic_fetch_and_4'
-
-In order to fix this, the stdatomic check is adjusted to call
-atomic_fetch_add() instead, which does require libatomic. Thanks to
-this, the wscript realizes that linking against libatomic is needed, and
-the build works fine.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
-Submitted upstream: https://github.com/mpv-player/mpv/pull/3403
-
- wscript | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wscript b/wscript
-index a18df6f..4c49caf 100644
---- a/wscript
-+++ b/wscript
-@@ -154,7 +154,7 @@ main_dependencies = [
-         'func': check_libs(['atomic'],
-             check_statement('stdatomic.h',
-                 'atomic_int_least64_t test = ATOMIC_VAR_INIT(123);'
--                'int test2 = atomic_load(&test)'))
-+                'atomic_fetch_add(&test, 1)'))
-     }, {
-         'name': 'atomic-builtins',
-         'desc': 'compiler support for __atomic built-ins',
--- 
-2.7.4
-
diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index 8a2f44b..1594cb9 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	e413d57fec4ad43b9f9b848f38d13fb921313fc9a4a64bf1e906c8d0f7a46329	v0.18.1.tar.gz
+sha256	3df5811942cd1d71f48eb4720092fdafec11885bf6dd6d1d3e6413f32e5d67e2	v0.19.0.tar.gz
 sha256	01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b	waf-1.8.12
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index d2ed3f2..123dff4 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPV_VERSION = 0.18.1
+MPV_VERSION = 0.19.0
 MPV_WAF_VERSION = 1.8.12
 MPV_SITE = https://github.com/mpv-player/mpv/archive
 MPV_SOURCE = v$(MPV_VERSION).tar.gz
-- 
2.7.3
