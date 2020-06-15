From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 16 Jun 2020 00:28:55 +0200
Subject: [Buildroot] [PATCH v3] package/systemd: fixup RPATH for more
 systemd host binaries
Message-ID: <20200615222856.147762-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All systemd binaries depend on libsystemd-shared and need their
RPATH fixed. Use a glob to catch them all

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1->v2:
-   dont ignore failure from patchelf
v2->v3:
-   change back to shell loop, the wildcard gets expanded before
    the install step and is empty the first time
-   add busctl
---
 package/systemd/systemd.mk | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 2cc71ee667..b04391da9e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -659,6 +659,8 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	host-libcap \
 	host-gperf
 
+HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
+
 # Fix RPATH After installation
 # * systemd provides a install_rpath instruction to meson because the binaries
 #   need to link with libsystemd which is not in a standard path
@@ -667,20 +669,13 @@ HOST_SYSTEMD_DEPENDENCIES = \
 # * the original path had been tweaked by buildroot via LDFLAGS to add
 #   $(HOST_DIR)/lib
 # * thus re-tweak rpath after the installation for all binaries that need it
-HOST_SYSTEMD_HOST_TOOLS = \
-	systemd-analyze \
-	systemd-machine-id-setup \
-	systemd-mount \
-	systemd-nspawn \
-	systemctl \
-	udevadm
-
-HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
+HOST_SYSTEMD_HOST_TOOLS = busctl journalctl systemctl udevadm systemd-*
 
 define HOST_SYSTEMD_FIX_RPATH
-	$(foreach f,$(HOST_SYSTEMD_HOST_TOOLS), \
-		$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $(HOST_DIR)/bin/$(f)
-	)
+	cd $(HOST_DIR)/bin && for f in $(HOST_SYSTEMD_HOST_TOOLS); do \
+		set -e; \
+		[ ! -x $$f ] || $(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $$f; \
+	done
 endef
 HOST_SYSTEMD_POST_INSTALL_HOOKS += HOST_SYSTEMD_FIX_RPATH
 
-- 
2.27.0
