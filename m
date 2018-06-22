From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 22 Jun 2018 07:48:32 +0300
Subject: [Buildroot] [PATCH] iproute2: bump to version 4.17.0
Message-ID: <bd2bf11ca041e4d3828e7e7932e527d52bfd96f4.1529642912.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-arpd-remove-pthread-dependency.patch | 37 -------------------
 package/iproute2/iproute2.hash                |  2 +-
 package/iproute2/iproute2.mk                  |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 package/iproute2/0001-arpd-remove-pthread-dependency.patch

diff --git a/package/iproute2/0001-arpd-remove-pthread-dependency.patch b/package/iproute2/0001-arpd-remove-pthread-dependency.patch
deleted file mode 100644
index bfc9649d357d..000000000000
--- a/package/iproute2/0001-arpd-remove-pthread-dependency.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 4a4f4d491f89bdd580fdd7a901a3300cb5e9789e Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 1 May 2018 15:33:47 +0300
-Subject: [PATCH] arpd: remove pthread dependency
-
-Explicit link with pthread is not needed when linking dynamically. Even
-static link with recent libdb does not pull in the code that uses
-pthread. Finally, the configure check introduced in commit a25df4887d7
-(configure: Check for Berkeley DB for arpd compilation) does not add
--lpthread to its link command.
-
-This change allows arpd build with toolchains that do not provide
-threads support.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: http://patchwork.ozlabs.org/patch/907031/
-
- misc/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/misc/Makefile b/misc/Makefile
-index 34ef6b21b4ed..b2dd6b26e2dc 100644
---- a/misc/Makefile
-+++ b/misc/Makefile
-@@ -25,7 +25,7 @@ rtacct: rtacct.c
- 	$(QUIET_CC)$(CC) $(CFLAGS) $(LDFLAGS) -o rtacct rtacct.c $(LDLIBS) -lm
- 
- arpd: arpd.c
--	$(QUIET_CC)$(CC) $(CFLAGS) -I$(DBM_INCLUDE) $(LDFLAGS) -o arpd arpd.c $(LDLIBS) -ldb -lpthread
-+	$(QUIET_CC)$(CC) $(CFLAGS) -I$(DBM_INCLUDE) $(LDFLAGS) -o arpd arpd.c $(LDLIBS) -ldb
- 
- ssfilter.c: ssfilter.y
- 	$(QUIET_YACC)bison ssfilter.y -o ssfilter.c
--- 
-2.17.0
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 9f808b742af0..48867f0a9952 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	0c5c24020fd7349fe25728c5edee9fb6a1bc8a38f08e23be5c57a6301e55ee0a	iproute2-4.16.0.tar.xz
+sha256	6fa991b092315887775b9e47dc6a89af7ae09dd3ad4ccff754d055c566b4be6e	iproute2-4.17.0.tar.xz
 sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 319e69b93f99..1f276ac7ed12 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 4.16.0
+IPROUTE2_VERSION = 4.17.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.17.1
