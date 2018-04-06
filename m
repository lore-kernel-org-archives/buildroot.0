From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 19:53:23 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] sam-ba: fix sam-ba
 symbolic link
Message-ID: <20180407175148.21F808106F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eab772d3aad74df3178cffd84818ef132b230f1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Following the removal of $(HOST_DIR)/usr, the symbolic link from
$(HOST_DIR)/bin/sam-ba/ to $(HOST_DIR)/opt/sam-ba/sam-ba was broken,
so we fix this.

In addition, sam-ba being prebuilt, it comes in two separates
binaries, one for x86 and the other for x86_64, so we take this into
account as well.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
[Thomas:
 - add spaces around = signs
 - rework commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit b3b5608b47525799b0601d45939d3bae545fd124)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sam-ba/sam-ba.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 244ede3ef1..a7941459c7 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -23,10 +23,16 @@ endef
 # then create a symbolic link from $(HOST_DIR)/bin to the
 # application binary, for easier usage.
 
+ifeq ($(HOSTARCH),x86_64)
+SAM_BA_BIN_NAME = sam-ba_64
+else
+SAM_BA_BIN_NAME = sam-ba
+endif
+
 define HOST_SAM_BA_INSTALL_CMDS
 	mkdir -p $(HOST_DIR)/opt/sam-ba/
 	cp -a $(@D)/* $(HOST_DIR)/opt/sam-ba/
-	ln -sf ../../opt/sam-ba/sam-ba $(HOST_DIR)/bin/sam-ba
+	ln -sf ../opt/sam-ba/$(SAM_BA_BIN_NAME) $(HOST_DIR)/bin/sam-ba
 endef
 
 $(eval $(host-generic-package))
