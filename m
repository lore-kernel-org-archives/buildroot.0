From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 12:29:08 +0100
Subject: [Buildroot] [git commit] package/ninja: change package type to
 host-cmake
Message-ID: <20200203111812.B6ADF88713@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=332d96091bff45bca1ab1e2c25780a5bef2e57f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ninja 1.10.0 now supports cmake as a build system. This change makes the make
file much more straightforward.

The host-python2 dependency is no longer needed as it is no longer
used during the build. We however need to keep install commands as
there is no installation step planned in CMakeLists.txt.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ninja/ninja.mk | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index 0d9426d1f4..060893d85f 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -9,19 +9,8 @@ NINJA_SITE = $(call github,ninja-build,ninja,v$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
 
-# Although Ninja supports both Python2 and Python3, we enforce Python3
-# on the host for the following reason: Meson is the only package
-# using Ninja so far and Meson requires Python3. In this way, we
-# prevent both Python2 and Python3 from being created on the host,
-# which is time consuming and without benefit.
-HOST_NINJA_DEPENDENCIES = host-python3
-
-define HOST_NINJA_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/bin/python3 configure.py --bootstrap)
-endef
-
 define HOST_NINJA_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/ninja $(HOST_DIR)/bin/ninja
 endef
 
-$(eval $(host-generic-package))
+$(eval $(host-cmake-package))
