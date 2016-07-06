From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 23:11:16 +0200
Subject: [Buildroot] [git commit] 4th: create /usr/lib and /usr/bin before
	installation
Message-ID: <20160706211246.C8B4080AE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9dad02c017706740b02fb7e0858dad218749a353
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 4th build system doesn't create the installation directories by
itself, causing $(HOST_DIR)/usr/lib to be a file containing the 4th
library if $(HOST_DIR)/usr/lib doesn't already exist as a
directory. Since 4th is the first package in the build order due to
alphabetic ordering, it is very likely that it will install a file as
$(HOST_DIR)/usr/lib, breaking the build of follow-up packages.

Fixes:

  http://autobuild.buildroot.net/results/6291046ca0552e11b79a84df4a7844324d78ab97/
  http://autobuild.buildroot.net/results/252642b7d6ec3f77142dcbd158f56ed8e2426c25/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/4th/4th.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index bdf0672..d920eb0 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -35,6 +35,8 @@ define 4TH_INSTALL_STAGING_CMDS
 endef
 
 define 4TH_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/bin
+	mkdir -p $(TARGET_DIR)/usr/lib
 	$(4TH_MAKE_ENV) $(MAKE) -C $(@D)/sources mostlyinstall \
 		BINARIES=$(TARGET_DIR)/usr/bin \
 		LIBRARIES=$(TARGET_DIR)/usr/lib
@@ -54,6 +56,8 @@ define HOST_4TH_BUILD_CMDS
 endef
 
 define HOST_4TH_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/usr/bin
+	mkdir -p $(HOST_DIR)/usr/lib
 	$(MAKE) -C $(@D)/sources mostlyinstall \
 		BINARIES=$(HOST_DIR)/usr/bin \
 		LIBRARIES=$(HOST_DIR)/usr/lib
