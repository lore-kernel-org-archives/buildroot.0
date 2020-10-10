From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 21:55:28 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] boot/barebox: fix target
 bareboxenv command compile
Message-ID: <20201010200006.36EF08E1E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e384e3c44bea75a77fe72c2c37cdc8694612a03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The buildroot custom bareboxenv compile command misses the additional
include path 'scripts/include' to gain access to the local copy of the
kernel header files (which leads to compile error when using an older
toolchain).

This could be fixed by enhancing the custom bareboxenv compile command
(see [1]) or by using the barebox build system by simply enabling the
CONFIG_BAREBOXENV_TARGET option (available since April 2012, see [2])
instead (as suggested by Yann E. MORIN).

Fixes (with BR2_TARGET_BAREBOX_BAREBOXENV enabled):

  build/barebox-2019.12.0/scripts/bareboxenv.c:100:10: fatal error: linux/list.h: No such file or directory

[1] http://lists.busybox.net/pipermail/buildroot/2020-January/270942.html
[2] https://git.pengutronix.de/cgit/barebox/commit/?id=afb03d7a554a2911a3742e316f011319fcb416f1

Note: a user who would previously provide a barebox config file which
had CONFIG_BAREBOXENV_TARGET=y, but a Buildroot config file which did
not have BR2_TARGET_BAREBOX_BAREBOXENV=y, would have bareboxenv-target
built, but it would not be installed in the target. Now, and unset
BR2_TARGET_BAREBOX_BAREBOXENV will not even build it, but his is not a
regression: it was anyway previously not installed.

Reported-by: Frederick Gotham <cauldwell.thomas@gmail.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998 at free.fr:
  - also explicitly disable it when not selected
  - rewrap commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3cc2534b577eb453c50a4b3386d88a006007a9d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/barebox.mk | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 422f27312d..9d62037e7a 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -88,13 +88,6 @@ $(1)_KCONFIG_DEPENDENCIES = \
 	$(BR2_BISON_HOST_DEPENDENCY) \
 	$(BR2_FLEX_HOST_DEPENDENCY)
 
-ifeq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
-define $(1)_BUILD_BAREBOXENV_CMDS
-	$$(TARGET_CC) $$(TARGET_CFLAGS) $$(TARGET_LDFLAGS) -o $$(@D)/bareboxenv \
-		$$(@D)/scripts/bareboxenv.c
-endef
-endif
-
 ifeq ($$(BR2_TARGET_$(1)_CUSTOM_ENV),y)
 $(1)_ENV_NAME = $$(notdir $$(call qstrip,\
 	$$(BR2_TARGET_$(1)_CUSTOM_ENV_PATH)))
@@ -109,12 +102,23 @@ endef
 endif
 
 ifneq ($$($(1)_CUSTOM_EMBEDDED_ENV_PATH),)
-define $(1)_KCONFIG_FIXUP_CMDS
+define $(1)_KCONFIG_FIXUP_CUSTOM_EMBEDDED_ENV_PATH
 	$$(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_ENVIRONMENT)
 	$$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENVIRONMENT_PATH,"$$($(1)_CUSTOM_EMBEDDED_ENV_PATH)")
 endef
 endif
 
+define $(1)_KCONFIG_FIXUP_BAREBOXENV
+	$$(if $$(BR2_TARGET_$(1)_BAREBOXENV),\
+		$$(call KCONFIG_ENABLE_OPT,CONFIG_BAREBOXENV_TARGET),\
+		$$(call KCONFIG_DISABLE_OPT,CONFIG_BAREBOXENV_TARGET))
+endef
+
+define $(1)_KCONFIG_FIXUP_CMDS
+	$$($(1)_KCONFIG_FIXUP_CUSTOM_EMBEDDED_ENV_PATH)
+	$$($(1)_KCONFIG_FIXUP_BAREBOXENV)
+endef
+
 define $(1)_BUILD_CMDS
 	$$($(1)_BUILD_BAREBOXENV_CMDS)
 	$$(TARGET_MAKE_ENV) $$(MAKE) $$($(1)_MAKE_FLAGS) -C $$(@D)
@@ -136,7 +140,7 @@ endef
 
 ifeq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
 define $(1)_INSTALL_TARGET_CMDS
-	cp $$(@D)/bareboxenv $$(TARGET_DIR)/usr/bin
+	cp $$(@D)/scripts/bareboxenv-target $$(TARGET_DIR)/usr/bin/bareboxenv
 endef
 endif
 
