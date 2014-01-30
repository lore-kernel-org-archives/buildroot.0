From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Jan 2014 22:07:18 +0100
Subject: [Buildroot] [PATCH 2/3] package/wayland: build a host variant
In-Reply-To: <cover.1391115898.git.yann.morin.1998@free.fr>
References: <cover.1391115898.git.yann.morin.1998@free.fr>
Message-ID: <4223a7f2ec2191d6e4a5d9d0eaf10da486dd43a9.1391115898.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Starting with 1.4.0, weston requires wayland-scanner to build its DT
So far, we got away with just hand-building wayland-scanner, and made
that available in HOST_DIR/usr/bin

But now, weston also requires wayland's DTD, which we did not care of
in our dirty little hack.

So, the best solution is to just build a host-variant of wayland, so
we get both wayland-scanner, and the DTD.

But then, we do not build the target wayland-scanner (he, wayland tries
to run it at build time...). So it is a matter of just tweaking a little
bit the host .pc file (which weston uses to find wayland-scanner, sigh...)
and fake it as a target .pc file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Chnages v2->v3:
  - remove host depednencies (inherited from target's)  (Arnout)
  - fix wayland-scanner.pc  (Arnout)
  - cleanup comments  (Arnout)

Changes v1->V2
  - remove DTD on target  (Thomas)
---
 package/wayland/wayland.mk | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index a823d2b..3ab94ca 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -11,22 +11,27 @@ WAYLAND_LICENSE = MIT
 WAYLAND_LICENSE_FILES = COPYING
 
 WAYLAND_INSTALL_STAGING = YES
-WAYLAND_DEPENDENCIES = libffi host-pkgconf expat host-expat
+WAYLAND_DEPENDENCIES = libffi host-pkgconf host-wayland expat
 
-# wayland needs a wayland-scanner program to generate some of its
-# source code. By default, it builds it with CC, so it doesn't work with
-# cross-compilation. Therefore, we build it manually, and tell wayland
-# that the tool is already available.
+# wayland-scanner is only needed for building, not on the target
 WAYLAND_CONF_OPT = --disable-scanner
 
-define WAYLAND_BUILD_SCANNER
-	(cd $(@D)/src/; \
-		$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
-			-o wayland-scanner scanner.c wayland-util.c -lexpat; \
-	 	$(INSTALL) -m 0755 -D wayland-scanner \
-			$(HOST_DIR)/usr/bin/wayland-scanner)
+# We must provide a specialy-crafted wayland-scanner .pc file
+# which we vampirise and adapt from the host-wayland copy
+define WAYLAND_SCANNER_PC
+	$(INSTALL) -m 0644 -D $(HOST_DIR)/usr/share/pkgconfig/wayland-scanner.pc \
+	              $(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
+	$(SED) 's:^prefix=.*:prefix=/usr:' \
+	    -e 's:^wayland_scanner=.*:wayland_scanner=$(HOST_DIR)/usr/bin/wayland-scanner:' \
+	    $(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
 endef
+WAYLAND_POST_INSTALL_STAGING_HOOKS += WAYLAND_SCANNER_PC
 
-WAYLAND_POST_CONFIGURE_HOOKS += WAYLAND_BUILD_SCANNER
+# Remove the DTD from the target, it's not needed at runtime
+define WAYLAND_TARGET_CLEANUP
+	rm -rf $(TARGET_DIR)/usr/share/wayland
+endef
+WAYLAND_POST_INSTALL_TARGET_HOOKS += WAYLAND_TARGET_CLEANUP
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.8.1.2
