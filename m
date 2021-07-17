From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:10:06 +0200
Subject: [Buildroot] [git commit] package/duktape: add and install a
 duktape.pc file
Message-ID: <20210717073853.356E491224@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=2170033bf68f1a34dc5d183d50e3f38d9779b6de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most distributions include a duktape.pc file bundled with the duktape
development package. As the duktape source does not include a .pc file,
add one to the package/duktape directory and install it to the staging
directory. This is used by the polkit duktape patch later in the series.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/duktape/duktape.mk    |  4 ++++
 package/duktape/duktape.pc.in | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/duktape/duktape.mk b/package/duktape/duktape.mk
index aadd609248..89a6e451f5 100644
--- a/package/duktape/duktape.mk
+++ b/package/duktape/duktape.mk
@@ -19,6 +19,10 @@ endef
 define DUKTAPE_INSTALL_STAGING_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f Makefile.sharedlibrary \
 		INSTALL_PREFIX=$(STAGING_DIR)/usr install
+	$(INSTALL) -D -m 0644 $(DUKTAPE_PKGDIR)/duktape.pc.in \
+		$(STAGING_DIR)/usr/lib/pkgconfig/duktape.pc
+	$(SED) 's/@VERSION@/$(DUKTAPE_VERSION)/g;' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/duktape.pc
 endef
 
 define DUKTAPE_INSTALL_TARGET_CMDS
diff --git a/package/duktape/duktape.pc.in b/package/duktape/duktape.pc.in
new file mode 100644
index 0000000000..eaef5f6994
--- /dev/null
+++ b/package/duktape/duktape.pc.in
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: duktape
+Description: Embeddable Javascript engine
+Version: @VERSION@
+Libs: -L${libdir} -lduktape
+Cflags: -I${includedir}/
