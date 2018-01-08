From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 22:01:04 +0100
Subject: [Buildroot] [git commit] libjpeg: add pkg-config file for libjpeg
Message-ID: <20180108210853.73AD57FD4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c93f56d46593155a244bf83fd36c78c7968ce6b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
[Thomas: change to automatically set the version in the generated .pc file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libjpeg/libjpeg.mk    |  9 +++++++++
 package/libjpeg/libjpeg.pc.in | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index e5bd454..95663a9 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -18,5 +18,14 @@ endef
 
 LIBJPEG_POST_INSTALL_TARGET_HOOKS += LIBJPEG_REMOVE_USELESS_TOOLS
 
+define LIBJPEG_INSTALL_STAGING_PC
+	$(INSTALL) -D -m 0644 package/libjpeg/libjpeg.pc.in \
+		$(STAGING_DIR)/usr/lib/pkgconfig/libjpeg.pc
+	version=`sed -e '/^PACKAGE_VERSION/!d;s/PACKAGE_VERSION = \(.*\)/\1/' $(@D)/Makefile` ; \
+		$(SED) "s/@PACKAGE_VERSION@/$${version}/" $(STAGING_DIR)/usr/lib/pkgconfig/libjpeg.pc
+endef
+
+LIBJPEG_POST_INSTALL_STAGING_HOOKS += LIBJPEG_INSTALL_STAGING_PC
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libjpeg/libjpeg.pc.in b/package/libjpeg/libjpeg.pc.in
new file mode 100644
index 0000000..59220ca
--- /dev/null
+++ b/package/libjpeg/libjpeg.pc.in
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=/usr
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: libjpeg
+Description: A JPEG codec that provides the libjpeg API
+Version: @PACKAGE_VERSION@
+Libs: -L${libdir} -ljpeg
+Cflags: -I${includedir}
