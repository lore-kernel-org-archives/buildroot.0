From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Apr 2019 20:18:19 +0200
Subject: [Buildroot] [git commit] package/netsniff-ng: Fix build caused by
 extra 'install' target
Message-ID: <20190402181515.82B877FEBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=836e8ae11e4b892761a5e0bfd1fdff07ba501d13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After commit:

	b0f98d5 package/netsniff-ng: allow to build with uclibc but w/o mausezahn

the different build and install targets are specified depending if
masuezahn tool is able to be selected or not. It works for the build
case but for the install the old 'install' target was not removed from
the make invocation and it still forces to install the mausezahn, so fix
it by remove this target.

Fixes:
	http://autobuild.buildroot.net/results/cc44ed737799c9ac73628c82b86bd526b1c43310/
	http://autobuild.buildroot.net/results/72d0753532720604d51c05663af7fbfe37434339/

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsniff-ng/netsniff-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 8dd06b6fb7..415e86def1 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -54,7 +54,7 @@ endef
 
 define NETSNIFF_NG_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc install \
+		PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc \
 			-C $(@D) $(NETSNIFF_NG_INSTALL_MAKE_TARGET)
 endef
 
