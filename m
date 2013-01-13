From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jan 2013 22:52:20 +0100
Subject: [Buildroot] [PATCH 1/4] Makefile: export a few variables to help
	support scripts
In-Reply-To: <cover.1358113846.git.yann.morin.1998@free.fr>
References: <cover.1358113846.git.yann.morin.1998@free.fr>
Message-ID: <d9e98990b22abeb96d52d72687ccf52883521e69.1358113846.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support scripts (in support/) may need to parse the .config file, so give
them an easy access to it, by exporting BUILDROOT_CONFIG with the fully-
qualified path to .config.

Also, post-build scripts may need to reference a few locations, so export
those, too.

Note: we export both O and BASE_DIR. Although they are the same, BASE_DIR
is used internally, while O is used on the command line, which makes it a
bit ambiguous to know which to use. As users use O= on the command line,
they will probably tend to use that in their post-build scripts.

Update doc accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
cc: Peter Korsgaard <jacmet@uclibc.org>
---
 Makefile                         |   11 +++++++++++
 docs/manual/customize-rootfs.txt |    7 +++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 074674a..5a83251 100644
--- a/Makefile
+++ b/Makefile
@@ -91,6 +91,8 @@ EXTRAMAKEARGS = O=$(O)
 NEED_WRAPPER=y
 endif
 
+BUILDROOT_CONFIG=$(CONFIG_DIR)/.config
+
 # Pull in the user's configuration file
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(CONFIG_DIR)/.config
@@ -282,6 +284,15 @@ HOSTCC  := $(CCACHE) $(HOSTCC)
 HOSTCXX := $(CCACHE) $(HOSTCXX)
 endif
 
+# Scripts in support/ or post-build scripts may need to reference
+# these locations, so export them so it is easier to use
+export BUILDROOT_CONFIG
+export TARGET_DIR
+export STAGING_DIR
+export HOST_DIR
+export BINARIES_DIR
+export BASE_DIR O   # O and BASE_DIR are the same
+
 #############################################################
 #
 # You should probably leave this stuff alone unless you know
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index a1a556b..fe3ea7e 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -37,6 +37,13 @@ there are a few ways to customize the resulting target filesystem.
   certain package generates wrong or unneeded files, you should fix
   that package rather than work around it with a post-build cleanup
   script. _Among these first 3 methods, this one should be preferred_.
+  You may also use these variables in your post-build script:
+    - +BUILDROOT_CONFIG+: the path to the Buildroot .config file
+    - +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+: see
+      xref:generic-package-reference[]
+    - +BINARIES_DIR+: the place were all binary files (aka images) are
+      stored
+    - +BASE_DIR+ (or +O+): the base output directory
 
 * A special package, 'customize', stored in +package/customize+ can be
   used. You can put all the files that you want to see in the final
-- 
1.7.2.5
