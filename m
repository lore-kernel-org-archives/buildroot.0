From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 12 Nov 2020 21:22:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/suricata: link with libatomic if
 needed
Message-ID: <20201112202202.661849-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build of suricata 6.0.0 with mips32r6

app-layer-ftp.o: In function `FTPCheckMemcap':
app-layer-ftp.c:(.text+0x284): undefined reference to `__atomic_load_8'
app-layer-ftp.c:(.text+0x2d8): undefined reference to `__atomic_fetch_add_8'

Fixes:
 - http://autobuild.buildroot.org/results/f574005204905250702df32b61c85d427ab4feda

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/suricata/suricata.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index f131fad1be..94c4784dd4 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -43,6 +43,10 @@ SURICATA_CONF_OPTS = \
 #               download through wget/curl)
 SURICATA_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install install-conf
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+SURICATA_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_FILE),y)
 SURICATA_DEPENDENCIES += file
 SURICATA_CONF_OPTS += --enable-libmagic
-- 
2.28.0
