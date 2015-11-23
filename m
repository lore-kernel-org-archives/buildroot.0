From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:33 +0100
Subject: [Buildroot] [PATCH 03/51] package/gcc: align gcc-final
	configure-cmds to the generic ones
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <ee14fc81d1c4feda75f8000638ccce5d24f17633.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 7d6c79 (Compile static versions of gcc libraries) was applied, the
generic configure commands have been updated, but those changes have not
been propagated to the gcc-final custom configure commands.

Update the gcc-final custom configure commands to better match the
generic ones.

We do not propagate --disable-dependency-tracking because it breaks the
build, and --enable-shared (because of 169141a).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index dbdb615..53199c3 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -36,16 +36,31 @@ HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
 #
 # So we must completely override the generic commands and provide our own.
 #
+# Except for --disable-dependency-tracking which breaks the build, and
+# --enable-shared (see 169141a, gcc-final: disable shared build for
+# static), we reproduce the exact same command as the autotools infra
+# uses.
+#
 define  HOST_GCC_FINAL_CONFIGURE_CMDS
 	(cd $(HOST_GCC_FINAL_SRCDIR) && rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		$(HOST_GCC_FINAL_CONF_ENV) \
-		./configure \
+	$(HOST_CONFIGURE_OPTS) \
+	CFLAGS="$(HOST_CFLAGS)" \
+	LDFLAGS="$(HOST_LDFLAGS)" \
+	$(HOST_GCC_FINAL_CONF_ENV) \
+	CONFIG_SITE=/dev/null \
+	./configure \
 		--prefix="$(HOST_DIR)/usr" \
 		--sysconfdir="$(HOST_DIR)/etc" \
+		--localstatedir="$(HOST_DIR)/var" \
 		--enable-static \
+		--disable-gtk-doc \
+		--disable-gtk-doc-html \
+		--disable-doc \
+		--disable-docs \
+		--disable-documentation \
+		--disable-debug \
+		--with-xmlto=no \
+		--with-fop=no \
 		$(QUIET) $(HOST_GCC_FINAL_CONF_OPTS) \
 	)
 endef
-- 
1.9.1
