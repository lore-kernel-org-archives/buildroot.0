From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Oct 2018 21:19:20 +0200
Subject: [Buildroot] [git commit] valgrind: bump version to 3.14.0
Message-ID: <20181026191743.8BF8289090@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1172a68ae88849834dcb1b6adddc06c836aa7109
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- new option: link-time optimisation

For details see [1].

[1] http://valgrind.org/docs/manual/dist.news.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/valgrind/valgrind.hash | 2 +-
 package/valgrind/valgrind.mk   | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index ea05dd677c..87fb496857 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,5 +1,5 @@
 # From http://valgrind.org/downloads/current.html
-md5 817dd08f1e8a66336b9ff206400a5369 valgrind-3.13.0.tar.bz2
+md5 74175426afa280184b62591b58c671b3 valgrind-3.14.0.tar.bz2
 
 # License files
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index b1ab7e72fc..f097c7be1f 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.13.0
+VALGRIND_VERSION = 3.14.0
 VALGRIND_SITE = ftp://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
@@ -46,6 +46,12 @@ VALGRIND_CONF_OPTS += \
 	--host=$(patsubst arm-%,armv7-%,$(GNU_TARGET_NAME))
 endif
 
+ifeq ($(BR2_GCC_ENABLE_LTO),y)
+VALGRIND_CONF_OPTS += --enable-lto
+else
+VALGRIND_CONF_OPTS += --disable-lto
+endif
+
 define VALGRIND_INSTALL_UCLIBC_SUPP
 	$(INSTALL) -D -m 0644 package/valgrind/uclibc.supp $(TARGET_DIR)/usr/lib/valgrind/uclibc.supp
 endef
