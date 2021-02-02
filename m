From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Feb 2021 22:26:16 +0100
Subject: [Buildroot] [git commit] Revert "package/stress-ng: disable libbsd
 on static build"
Message-ID: <20210202212822.265A88125A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53213e762daa6e3e5ae11a27950d0c4cab2eff47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit f2d6c5ff9092aa7735c7a739d15180910ae734df.

Now that libbsd can't be enabled for static builds, we can drop the
workaround specific to stress-ng.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/stress-ng/stress-ng.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index c26206cd2e..53d7b7e5b7 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -10,11 +10,8 @@ STRESS_NG_SITE = https://kernel.ubuntu.com/~cking/tarballs/stress-ng
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_LIBBSD):$(BR2_STATIC_LIBS),y:)
+ifeq ($(BR2_PACKAGE_LIBBSD),y)
 STRESS_NG_DEPENDENCIES += libbsd
-else
-STRESS_NG_MAKE_OPTS += HAVE_LIB_BSD=0 HAVE_WCSLCAT=0 \
-	HAVE_WCSLCPY=0 HAVE_SETPROCTITLE=0
 endif
 
 ifeq ($(BR2_PACKAGE_KEYUTILS),y)
@@ -22,7 +19,7 @@ STRESS_NG_DEPENDENCIES += keyutils
 endif
 
 define STRESS_NG_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(STRESS_NG_MAKE_OPTS) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
 # Don't use make install otherwise stress-ng will be rebuild without
