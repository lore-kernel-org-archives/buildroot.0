From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:35:46 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/swupdate: do not
 store local build details in swupdate config file
Message-ID: <20200315102339.7164C85F10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d92ade605104fef8eb5ca9a9e38ab754cf6e545
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

The SWUPDATE_SET_BUILD_OPTIONS macro sets a number of swupdate
configuration options with local build details, especially the
cross-compiler path and sysroot path.

This means that if one stores an swupdate defconfig file as part of
Buildroot, generated with "make swupdate-update-defconfig", it will
contain things like:

CONFIG_CROSS_COMPILE="/home/thomas/projets/buildroot/output/host/bin/arm-linux-"
CONFIG_SYSROOT="/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot"

which obviously are not good, as they are specific to where the build
was done.

So instead this commit:

 - Uses the CROSS_COMPILE environment variable to pass the
   cross-compiler path.

 - Drops entirely the use of CONFIG_SYSROOT, since all it does is pass
   a --sysroot option to the compiler, which is not needed in the
   context of Buildroot.

 - Pass EXTRA_CFLAGS/EXTRA_LDFLAGS also through the environment.

Thanks to that the swupdate defconfig file no longer contains any
local build details, and can be re-used by different users of a given
Buildroot configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 716f43153efefe681f149241649850e7673098dc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.mk | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 39d7d38579..4f07dff968 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -113,25 +113,18 @@ define SWUPDATE_PREFER_STATIC
 endef
 endif
 
-define SWUPDATE_SET_BUILD_OPTIONS
-	$(call KCONFIG_SET_OPT,CONFIG_CROSS_COMPILE,"$(TARGET_CROSS)", \
-		$(SWUPDATE_BUILD_CONFIG))
-	$(call KCONFIG_SET_OPT,CONFIG_SYSROOT,"$(STAGING_DIR)", \
-		$(SWUPDATE_BUILD_CONFIG))
-	$(call KCONFIG_SET_OPT,CONFIG_EXTRA_CFLAGS,"$(TARGET_CFLAGS)", \
-		$(SWUPDATE_BUILD_CONFIG))
-	$(call KCONFIG_SET_OPT,CONFIG_EXTRA_LDFLAGS,"$(TARGET_LDFLAGS)", \
-		$(SWUPDATE_BUILD_CONFIG))
-endef
+SWUPDATE_MAKE_OPTS = \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	CONFIG_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+	CONFIG_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)"
 
 define SWUPDATE_KCONFIG_FIXUP_CMDS
 	$(SWUPDATE_PREFER_STATIC)
-	$(SWUPDATE_SET_BUILD_OPTIONS)
 	$(SWUPDATE_SET_LUA_VERSION)
 endef
 
 define SWUPDATE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) $(SWUPDATE_MAKE_OPTS) -C $(@D)
 endef
 
 define SWUPDATE_INSTALL_TARGET_CMDS
