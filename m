From: Adam Duskett <aduskett@gmail.com>
Date: Sun,  4 Jul 2021 22:40:56 -0700
Subject: [Buildroot] [PATCH 1/5] package/duktape/duktape.pc.in: New file
In-Reply-To: <20210705054100.2857251-1-aduskett@gmail.com>
References: <20210705054100.2857251-1-aduskett@gmail.com>
Message-ID: <20210705054100.2857251-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Most distributions include a duktape.pc file bundled with the duktape
development package. As the duktape source does not include a .pc file,
add one to the package/duktape directory and install it to the staging
directory. This is used by the polkit duktape patch later in the series.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/duktape/duktape.mk    |  4 ++++
 package/duktape/duktape.pc.in | 10 ++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 package/duktape/duktape.pc.in

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
-- 
2.31.1
