From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 12 Jan 2017 13:38:30 +0000
Subject: [Buildroot] [PATCH 1/2] vala: fix package suffix
Message-ID: <20170112133831.12223-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

vala executable has a suffix and we reffer to it in our vala wrapper,
but we assume that suffix is always the same as the major version. This
can be wrong, so better to obtain the suffix number from the config.h
file.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/vala/vala.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index dadfdfc..baa97ab 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -23,7 +23,7 @@ define HOST_VALA_INSTALL_WRAPPER
 		$(HOST_DIR)/usr/bin/vala
 	$(INSTALL) -D -m 0755 package/vala/vala-wrapper \
 		$(HOST_DIR)/usr/bin/valac
-	$(SED) 's, at VALA_VERSION@,$(VALA_VERSION_MAJOR),' \
+	$(SED) 's, at VALA_VERSION@,$(shell grep PACKAGE_SUFFIX $(@D)/config.h | grep -o -E "[0-9]+\.[0-9]+"),' \
 		$(HOST_DIR)/usr/bin/vala \
 		$(HOST_DIR)/usr/bin/valac
 endef
-- 
2.10.2
