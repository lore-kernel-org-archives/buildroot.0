From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 22:24:07 +0200
Subject: [Buildroot] [git commit] lua: ensure pkgconfig directory exists
	before installing files
Message-ID: <20170814201818.3F51581EB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25a2650086ad9fe0e22e2a2c3d4e64cae396fcf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The lua staging and host installation commands generate a file in
usr/lib/pkgconfig, without first making sure that this directory
exists, which causes build failures if it doesn't. This commit adjusts
those installation commands to create this directory if needed.

Fixes:

  http://autobuild.buildroot.net/results/101c89e1d6aee942a0b1c4e4f3daf8ac2414a56c/

Based on investigation and initial (more complicated) fix provided by
Francois Perrad <francois.perrad@gadz.org>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua/lua.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 0692c53..ee39480 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -86,6 +86,7 @@ endef
 
 define LUA_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) INSTALL_TOP="$(STAGING_DIR)/usr" -C $(@D) install
+	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig/
 	sed -e "s/@MYLIBS@/$(LUA_MYLIBS)/g" $(@D)/etc/lua.pc \
 		> $(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
 endef
@@ -96,6 +97,7 @@ endef
 
 define HOST_LUA_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) INSTALL_TOP="$(HOST_DIR)" -C $(@D) install
+	mkdir -p $(HOST_DIR)/lib/pkgconfig/
 	sed -e "s/@MYLIBS@/$(HOST_LUA_MYLIBS)/g" $(@D)/etc/lua.pc \
 		> $(HOST_DIR)/lib/pkgconfig/lua.pc
 endef
