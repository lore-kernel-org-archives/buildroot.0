From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:44:55 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/proftpd: add
 mod_cap option
Message-ID: <20200315103208.71AB4864AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faacc5f3cc2ddc9ba8294bc932b4797fdc86cde0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Add an option to enable or disable mod_cap and select libcap accordingly
instead of using bundled libcap which raise a build failure with headers
< 4.3 due to PR_CAP_AMBIENT and will be removed in version 1.3.7:
https://github.com/proftpd/proftpd/commit/8c845703fcf2c7978614784126bd074ffc4477f9

Fixes:
 - http://autobuild.buildroot.org/results/4d680d8204bdf1f3deec2c3eeb9a2d9e6eabe4d5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit eed76c5178735cf403caa8bb0a090543c484ee20)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proftpd/Config.in  |  6 ++++++
 package/proftpd/proftpd.mk | 13 +++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index edec37c8dd..4a544f0c50 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -8,6 +8,12 @@ config BR2_PACKAGE_PROFTPD
 
 if BR2_PACKAGE_PROFTPD
 
+config BR2_PACKAGE_PROFTPD_MOD_CAP
+	bool "mod_cap support"
+	select BR2_PACKAGE_LIBCAP
+	help
+	  Compile ProFTPD with mod_cap support
+
 config BR2_PACKAGE_PROFTPD_MOD_REWRITE
 	bool "mod_rewrite support"
 	help
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index c663ad1efa..0b0f567dec 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -25,6 +25,13 @@ PROFTPD_CONF_OPTS = \
 	--with-gnu-ld \
 	--without-openssl-cmdline
 
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_CAP),y)
+PROFTPD_CONF_OPTS += --enable-cap
+PROFTPD_DEPENDENCIES += libcap
+else
+PROFTPD_CONF_OPTS += --disable-cap
+endif
+
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REWRITE),y)
 PROFTPD_MODULES += mod_rewrite
 endif
@@ -85,12 +92,6 @@ define PROFTPD_USE_LLU
 endef
 PROFTPD_PRE_CONFIGURE_HOOKS += PROFTPD_USE_LLU
 
-define PROFTPD_MAKENAMES
-	$(MAKE1) CC="$(HOSTCC)" CFLAGS="" LDFLAGS="" -C $(@D)/lib/libcap _makenames
-endef
-
-PROFTPD_POST_CONFIGURE_HOOKS = PROFTPD_MAKENAMES
-
 PROFTPD_MAKE = $(MAKE1)
 
 # install Perl based scripts in target
