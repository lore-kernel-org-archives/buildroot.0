From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Feb 2021 17:56:08 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] Revert
 "package/stress-ng: disable libbsd on static build"
Message-ID: <20210204164022.C7B538199C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f4a11e2f84a96fca23d9f2f25597e959110491e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

This reverts commit f2d6c5ff9092aa7735c7a739d15180910ae734df.

Now that libbsd can't be enabled for static builds, we can drop the
workaround specific to stress-ng.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 53213e762daa6e3e5ae11a27950d0c4cab2eff47)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stress-ng/stress-ng.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 4afdb0a329..57464e9bbf 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -10,11 +10,8 @@ STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng
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
