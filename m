From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:34 -0000
Subject: [Buildroot] [git commit] libaio: add host variant
Message-ID: <20180907111543.151E97F981@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2cbaa1babcdbde90527f38f41ee8ee42bdefd45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of lvm2 to 2.02.180 in commit
8e666bf29e762f3c7681a48d0ee350f8396d798f, lvm2 needs libaio. This was
properly taken into account for the target lvm2 variant, but not the
host lvm2 variant. In order to build the host lvm2, we now need
host-libaio, so this patch adds support for building libaio for the
host.

Part of fixing:

  http://autobuild.buildroot.net/results/f95dd353c17bdfd00fde6762e58aa32e6830b52b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libaio/libaio.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 03029d84d8..76e6937cc2 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -35,4 +35,13 @@ define LIBAIO_INSTALL_TARGET_CMDS
 	$(LIBAIO_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
+define HOST_LIBAIO_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_LIBAIO_INSTALL_CMDS
+	$(HOST_CONFIGURE_OPTS) $(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
