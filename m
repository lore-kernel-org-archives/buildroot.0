From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 20:04:19 +0200
Subject: [Buildroot] [git commit] sam-ba: create $(HOST_DIR)/bin before
 using it
Message-ID: <20180402180453.EE1D8818C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf4fc26f1ae8b516c4d1c4701625c3598af574e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If one runs "make host-sam-ba" from a clean build, sam-ba.mk cannot
create its symbolic link because $(HOST_DIR)/bin doesn't exist. So
let's create this directory.

>>> host-sam-ba 2.16 Installing to host directory
mkdir -p /buildroot/output/host/opt/sam-ba/
cp -a /buildroot/output/build/host-sam-ba-2.16/* /buildroot/output/host/opt/sam-ba/
ln -sf ../opt/sam-ba/sam-ba_64 /buildroot/output/host/bin/sam-ba
ln: failed to create symbolic link '/buildroot/output/host/bin/sam-ba': No such file or directory
make[1]: *** [package/pkg-generic.mk:234: /buildroot/output/build/host-sam-ba-2.16/.stamp_host_installed] Error 1
make: *** [Makefile:79: _all] Error 2

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sam-ba/sam-ba.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 11dbb7eef0..0d36b0dc59 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -32,6 +32,7 @@ endif
 define HOST_SAM_BA_INSTALL_CMDS
 	mkdir -p $(HOST_DIR)/opt/sam-ba/
 	cp -a $(@D)/* $(HOST_DIR)/opt/sam-ba/
+	mkdir -p $(HOST_DIR)/bin/
 	ln -sf ../opt/sam-ba/$(SAM_BA_BIN_NAME) $(HOST_DIR)/bin/sam-ba
 endef
 
