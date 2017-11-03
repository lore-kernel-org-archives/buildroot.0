From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  3 Nov 2017 17:06:24 +0100
Subject: [Buildroot] [RFCv1 1/4] pkgconf: use relative path to STAGING_DIR
 instead of absolute path
In-Reply-To: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171103160627.6468-2-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pkg-config wrapper script is currently generated with absolute
paths to $(STAGING_DIR). However, this will not work properly with
per-package SDK, and each package will be built with a different
STAGING_DIR value.

In order to fix this, we adjust how the pkg-config wrapper script is
generated, so that it uses a relative path to itself: the sysroot (i.e
STAGING_DIR) is always located in $(path of
pkg-config)/../$(STAGING_SUBDIR).

This change is independent from the per-package SDK work, and could be
applied independently from it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkgconf/pkgconf.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index cc190d26da..d11ce485f7 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -19,8 +19,8 @@ endef
 define HOST_PKGCONF_INSTALL_WRAPPER
 	$(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
 		$(HOST_DIR)/bin/pkg-config
-	$(SED) 's, at PKG_CONFIG_LIBDIR@,$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig,' \
-		-e 's, at STAGING_DIR@,$(STAGING_DIR),' \
+	$(SED) 's, at PKG_CONFIG_LIBDIR@,$$(dirname $$0)/../$(STAGING_SUBDIR)/usr/lib/pkgconfig:$$(dirname $$0)/../$(STAGING_SUBDIR)/usr/share/pkgconfig,' \
+		-e 's, at STAGING_DIR@,$$(dirname $$0)/../$(STAGING_SUBDIR),' \
 		$(HOST_DIR)/bin/pkg-config
 endef
 
-- 
2.13.6
