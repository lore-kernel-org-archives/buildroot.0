From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Jan 2014 23:14:19 +0100
Subject: [Buildroot] [PATCH 2/3] package/wayland: build a host variant
In-Reply-To: <cover.1390947201.git.yann.morin.1998@free.fr>
References: <cover.1390947201.git.yann.morin.1998@free.fr>
Message-ID: <2d6630993abf29ff641b711c302eea85fd100559.1390947201.git.yann.morin.1998@free.fr>
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
---
 package/wayland/wayland.mk | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index a823d2b..08df982 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -11,7 +11,8 @@ WAYLAND_LICENSE = MIT
 WAYLAND_LICENSE_FILES = COPYING
 
 WAYLAND_INSTALL_STAGING = YES
-WAYLAND_DEPENDENCIES = libffi host-pkgconf expat host-expat
+WAYLAND_DEPENDENCIES = libffi host-pkgconf host-wayland expat host-expat
+HOST_WAYLAND_DEPENDENCIES = host-libffi host-pkgconf host-expat
 
 # wayland needs a wayland-scanner program to generate some of its
 # source code. By default, it builds it with CC, so it doesn't work with
@@ -19,14 +20,16 @@ WAYLAND_DEPENDENCIES = libffi host-pkgconf expat host-expat
 # that the tool is already available.
 WAYLAND_CONF_OPT = --disable-scanner
 
-define WAYLAND_BUILD_SCANNER
-	(cd $(@D)/src/; \
-		$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
-			-o wayland-scanner scanner.c wayland-util.c -lexpat; \
-	 	$(INSTALL) -m 0755 -D wayland-scanner \
-			$(HOST_DIR)/usr/bin/wayland-scanner)
+# And we must provide a specialy-crafted wayland-scanner .pc file
+# which we vampirise and adapt from the host-wayland copy
+define WAYLAND_SCANNER_PC
+	$(INSTALL) -m 0644 -D $(HOST_DIR)/usr/share/pkgconfig/wayland-scanner.pc \
+	              $(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
+	$(SED) 's:^prefix=.*:prefix=/usr:' \
+	    -e 's:^wayland_scanner=.*:wayland_sanner=$(HOST_DIR)/usr/bin/wayland-scanner:' \
+	    $(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
 endef
-
-WAYLAND_POST_CONFIGURE_HOOKS += WAYLAND_BUILD_SCANNER
+WAYLAND_POST_INSTALL_STAGING_HOOKS += WAYLAND_SCANNER_PC
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.8.1.2
