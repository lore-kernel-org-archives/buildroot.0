From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:44:27 +0200
Subject: [Buildroot] [git commit] swupdate: switch to local config librt
	dependency
Message-ID: <20170608194436.D1DF98186F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54dd63c569af3c4b713f0dde046bc9d1928c0838
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream rejected[1] the patch added in commit 6a1aa4e2daf0 (swupdate: fix
build with older glibc). Instead of carrying this patch going forward, make
librt an extra library dependency in the Buildroot local swupdate .config.

This solution is somewhat less optimal than the patch, because it always adds
librt regardless of whether SURICATTA_HAWKBIT is enabled. In theory we could
add a test for (BR2_PACKAGE_JSON_C && BR2_PACKAGE_LIBCURL), which are the
SURICATTA_HAWKBIT dependencies, and edit .config at build time. But this adds
much complexity for little gain.

[1] https://groups.google.com/forum/?hl=en#!topic/swupdate/77QWIka27es

Cc: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ags-SURICATTA_HAWKBIT-needs-librt-under-o.patch | 34 ----------------------
 package/swupdate/swupdate.config                   |  2 +-
 2 files changed, 1 insertion(+), 35 deletions(-)

diff --git a/package/swupdate/0002-Makefile.flags-SURICATTA_HAWKBIT-needs-librt-under-o.patch b/package/swupdate/0002-Makefile.flags-SURICATTA_HAWKBIT-needs-librt-under-o.patch
deleted file mode 100644
index 1f8d8e7..0000000
--- a/package/swupdate/0002-Makefile.flags-SURICATTA_HAWKBIT-needs-librt-under-o.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 66ccd99c6299ebe70a5549da78063fd7b1e02ea2 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Wed, 7 Jun 2017 22:28:03 +0300
-Subject: [PATCH] Makefile.flags: SURICATTA_HAWKBIT needs librt under older
- glibc
-
-glibc before 2.17 requires linking against librt for clock_gettime(). Fixes
-the following build failure:
-
-ld: suricatta/lib.a(server_hawkbit.o): undefined reference to symbol 'clock_gettime@@GLIBC_2.2'
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status:
-https://groups.google.com/forum/?hl=en#!topic/swupdate/77QWIka27es
-
- Makefile.flags | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.flags b/Makefile.flags
-index 391fc7f82682..8db5dfeacc2f 100644
---- a/Makefile.flags
-+++ b/Makefile.flags
-@@ -173,6 +173,7 @@ LDLIBS += crypto ssl
- endif
- endif
- ifneq ($(CONFIG_SURICATTA_HAWKBIT),)
-+LDLIBS += rt
- ifeq ($(strip $(findstring json-c,$(LDLIBS))),)
- LDLIBS += json-c
- endif
--- 
-2.11.0
-
diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
index 51869bb..6433470 100644
--- a/package/swupdate/swupdate.config
+++ b/package/swupdate/swupdate.config
@@ -26,7 +26,7 @@ CONFIG_CROSS_COMPILE=""
 CONFIG_SYSROOT=""
 CONFIG_EXTRA_CFLAGS=""
 CONFIG_EXTRA_LDFLAGS=""
-CONFIG_EXTRA_LDLIBS=""
+CONFIG_EXTRA_LDLIBS="rt"
 
 #
 # Debugging Options
