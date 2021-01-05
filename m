From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2021 23:09:14 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/systemd: don't
 fail if getty service directory already exists
Message-ID: <20210105220834.7B1C486258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1db3ed8c4d846d13a44ce44a0bd4b8765d95afd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Add -p argument that ignore that specified directory already exists.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
[yann.morin.1998 at free.fr:
  - split to its own patch
  - rewrite commit title
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9c5ef6018e7d0bd9e56006fe192880395a8aa871)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index cb12f667d6..ddd3f4380e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -576,7 +576,7 @@ ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # * enable serial-getty at xxx for other $BR2_TARGET_GENERIC_TTY_PATH
 # * rewrite baudrates if a baudrate is provided
 define SYSTEMD_INSTALL_SERVICE_TTY
-	mkdir $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d; \
+	mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d; \
 	printf '[Install]\nDefaultInstance=\n' \
 		>$(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf; \
 	if [ $(BR2_TARGET_GENERIC_GETTY_PORT) = "console" ]; \
@@ -588,7 +588,7 @@ define SYSTEMD_INSTALL_SERVICE_TTY
 			$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) \
 			>$(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf; \
 	else \
-		mkdir $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d;\
+		mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d;\
 		printf '[Install]\nDefaultInstance=%s\n' \
 			$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) \
 			>$(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d/buildroot-console.conf;\
