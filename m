From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 11:20:46 +0200
Subject: [Buildroot] [git commit] package/sunxi-mali: use git submodules
Message-ID: <20160703092145.EB35481DEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddc296f79bf145564354c78363f317939528473c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sunxi-mali git tree is set up with a submodule that contains the
actual libraries. Since there was no support for git submodules so far,
we used a dirty trick to have that submodule cloned by its own package,
with sunxi-mali just vampirising it into its own build dir.

Now that we have support for git submodules, we can simplify stuff a
bit, and have sunxi-mali directly download the proprietary libs itself.

Remove the .hash file since we're not checking hashes for git clones.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sunxi-mali/Config.in       |  3 ---
 package/sunxi-mali/sunxi-mali.hash |  2 --
 package/sunxi-mali/sunxi-mali.mk   | 15 ++++++---------
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
index b151135..5e3ae4c 100644
--- a/package/sunxi-mali/Config.in
+++ b/package/sunxi-mali/Config.in
@@ -3,9 +3,6 @@ config BR2_PACKAGE_SUNXI_MALI
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_LIBUMP
-	# The egl/gles mali libraries are provided as a git submodule of the
-	# sunxi-mali repo and are downloaded by the sunxi-mali-prop package.
-	select BR2_PACKAGE_SUNXI_MALI_PROP
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_arm
 	help
diff --git a/package/sunxi-mali/sunxi-mali.hash b/package/sunxi-mali/sunxi-mali.hash
deleted file mode 100644
index 7953e9e..0000000
--- a/package/sunxi-mali/sunxi-mali.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256 5ae27be532928667aa820a0aa9813dde545c224294b9402b27b6ca68f4d69ee4  sunxi-mali-d343311efc8db166d8371b28494f0f27b6a58724.tar.gz
diff --git a/package/sunxi-mali/sunxi-mali.mk b/package/sunxi-mali/sunxi-mali.mk
index 3e5443b..d621da1 100644
--- a/package/sunxi-mali/sunxi-mali.mk
+++ b/package/sunxi-mali/sunxi-mali.mk
@@ -5,10 +5,14 @@
 ################################################################################
 
 SUNXI_MALI_VERSION = d343311efc8db166d8371b28494f0f27b6a58724
-SUNXI_MALI_SITE = $(call github,linux-sunxi,sunxi-mali,$(SUNXI_MALI_VERSION))
+SUNXI_MALI_SITE = https://github.com/linux-sunxi/sunxi-mali
+SUNXI_MALI_SITE_METHOD = git
+
+# Get the sunxi-mali-proprietary libraries
+SUNXI_MALI_GIT_SUBMODULES = YES
 
 SUNXI_MALI_INSTALL_STAGING = YES
-SUNXI_MALI_DEPENDENCIES = libump sunxi-mali-prop
+SUNXI_MALI_DEPENDENCIES = libump
 SUNXI_MALI_PROVIDES = libegl libgles
 
 # The options below must be provided in the environment.  Providing these
@@ -41,13 +45,6 @@ ifeq ($(BR2_PACKAGE_SUNXI_MALI_R3P1),y)
 SUNXI_MALI_MAKE_OPTS += VERSION=r3p1
 endif
 
-define SUNXI_MALI_GIT_SUBMODULE_FIXUP
-	rm -rf $(@D)/lib/mali
-	cp -rf $(SUNXI_MALI_PROP_SRCDIR) $(@D)/lib/mali
-endef
-
-SUNXI_MALI_PRE_CONFIGURE_HOOKS += SUNXI_MALI_GIT_SUBMODULE_FIXUP
-
 define SUNXI_MALI_BUILD_CMDS
 	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) $(SUNXI_MALI_MAKE_OPTS) all
 	$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/version/version \
