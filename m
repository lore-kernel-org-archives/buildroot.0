From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jan 2021 10:02:12 +0100
Subject: [Buildroot] [git commit] package/systemd: don't fail if getty
 service directory already exists
Message-ID: <20210103084614.C068A84C4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c5ef6018e7d0bd9e56006fe192880395a8aa871
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add -p argument that ignore that specified directory already exists.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
[yann.morin.1998 at free.fr:
  - split to its own patch
  - rewrite commit title
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5aed87f452..51d0a7b558 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -581,7 +581,7 @@ ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # * enable serial-getty at xxx for other $BR2_TARGET_GENERIC_TTY_PATH
 # * rewrite baudrates if a baudrate is provided
 define SYSTEMD_INSTALL_SERVICE_TTY
-	mkdir $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d; \
+	mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d; \
 	printf '[Install]\nDefaultInstance=\n' \
 		>$(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf; \
 	if [ $(BR2_TARGET_GENERIC_GETTY_PORT) = "console" ]; \
@@ -593,7 +593,7 @@ define SYSTEMD_INSTALL_SERVICE_TTY
 			$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) \
 			>$(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf; \
 	else \
-		mkdir $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d;\
+		mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d;\
 		printf '[Install]\nDefaultInstance=%s\n' \
 			$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) \
 			>$(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d/buildroot-console.conf;\
