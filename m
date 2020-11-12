From: Stefan Agner <stefan@agner.ch>
Date: Thu, 12 Nov 2020 21:21:34 +0100
Subject: [Buildroot] [PATCH] package/apparmor: fix permission bits for
 apparmor.service
Message-ID: <46b899ee9f607f3d03a2881b83d355751cc07f64.1605212315.git.stefan@agner.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avoid setting executable bits for apparmor.service. This gets rid of a
corresponding warning during installation:
  Configuration file ../target/usr/lib/systemd/system/apparmor.service
  is marked executable. Please remove executable permission bits.
  Proceeding anyway.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/apparmor/apparmor.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 4d08b0433b..7ea0fabd91 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -88,7 +88,7 @@ endef
 define APPARMOR_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0755 $(@D)/parser/apparmor.systemd \
 		$(TARGET_DIR)/lib/apparmor/apparmor.systemd
-	$(INSTALL) -D -m 0755 $(@D)/parser/apparmor.service \
+	$(INSTALL) -D -m 0644 $(@D)/parser/apparmor.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/apparmor.service
 endef
 
-- 
2.29.2
