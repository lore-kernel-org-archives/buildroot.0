From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 23:47:38 +0200
Subject: [Buildroot] [git commit] package/acpica: add host package
Message-ID: <20170529214947.113308285C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd6ec23ed350abdf4a9fa208398bc79c510104c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support to build the ACPICA package for the host. This is useful
for the iasl command which is required to build some packages,
including Xen tools.

This is a necessary requirement before changing the Xen package to
address:

  http://autobuild.buildroot.net/results/afa199864d6b546fe759bb582a9c10702ea7fa78/

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Acked-by: Erico Nunes <nunes.erico@gmail.com>
[Thomas: use PREFIX= and not DESTDIR= for host installation, tweak
commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/acpica/acpica.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index 37e4941..c80989a 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -17,10 +17,22 @@ define ACPICA_BUILD_CMDS
 		all
 endef
 
+define HOST_ACPICA_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		all
+endef
+
 define ACPICA_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		HARDWARE_NAME=$(BR2_ARCH) DESTDIR="$(TARGET_DIR)" \
 		INSTALLFLAGS=-m755 install
 endef
 
+define HOST_ACPICA_INSTALL_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		PREFIX="$(HOST_DIR)/usr" \
+		INSTALLFLAGS=-m755 install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
