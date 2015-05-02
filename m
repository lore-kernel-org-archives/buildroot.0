From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  2 May 2015 16:32:33 +0200
Subject: [Buildroot] [PATCH 1/2] package/tiff: create a symlink to
	libtiff-4.pc
Message-ID: <1430577154-5790-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages like libevas still use pkg-config --libs libtiff
to find libtiff's LDFLAGS.
Since Buildroot only have tiff 4.0.3, create a symlink to
libtiff-4.pc for theses packages.

Fixes:
http://autobuild.buildroot.net/results/e5f/e5fb1e62cb634b20233751b4ea3b0630de70e9e0/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/tiff/tiff.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 6db2abd..7eb2cae 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -74,4 +74,10 @@ endif
 
 TIFF_MAKE = $(MAKE) SUBDIRS="$(TIFF_SUBDIRS)"
 
+define TIFF_PKG_CONFIG_FIXUP
+	ln -s libtiff-4.pc $(STAGING_DIR)/usr/lib/pkgconfig/libtiff.pc
+endef
+
+TIFF_POST_INSTALL_STAGING_HOOKS = TIFF_PKG_CONFIG_FIXUP
+
 $(eval $(autotools-package))
-- 
1.9.3
