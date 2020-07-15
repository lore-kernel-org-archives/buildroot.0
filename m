From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 21:48:24 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/systemd: fixup
 RPATH for more systemd host binaries
Message-ID: <20200715195254.745F786D40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd5edc9650755d2347a0d41a17e7719786977b30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

All systemd binaries depend on libsystemd-shared and need their RPATH
fixed. Use a glob to catch them all.

We can't use $(wildcard ...) because this is expanded before any file
may exist (it's in the same rule that install those file, and the
expansion in Makefile is done once at the beginning of the recipe).

We need to test each file:
 1. to ignore files that were not build (e.g. because the host is
    missing some dependencies (in which case we don't care; we're only
    interested in systemctl, and that one is already built)
 2. to ensure the glob was expanded (in case no file would match
    systemd-*)

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[yann.morin.1998 at free.fr:
  - don't use 'set -e', use the more traditional '|| exit 1'
  - don't cd into HOST_DIR/bin, but use $(addprefix ...)
  - use positive logic in the test
  - expand commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9f1a9ee9328797f46a65cd7ad55b0df92252b566)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 16ef131ba6..d9ebd5db7f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -568,6 +568,8 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	host-libcap \
 	host-gperf
 
+HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
+
 # Fix RPATH After installation
 # * systemd provides a install_rpath instruction to meson because the binaries
 #   need to link with libsystemd which is not in a standard path
@@ -576,20 +578,14 @@ HOST_SYSTEMD_DEPENDENCIES = \
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
+HOST_SYSTEMD_HOST_TOOLS = busctl journalctl systemctl systemd-* udevadm
 
 define HOST_SYSTEMD_FIX_RPATH
-	$(foreach f,$(HOST_SYSTEMD_HOST_TOOLS), \
-		$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $(HOST_DIR)/bin/$(f)
-	)
+	for f in $(addprefix $(HOST_DIR)/bin/,$(HOST_SYSTEMD_HOST_TOOLS)); do \
+		[ -e $$f ] || continue; \
+		$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $${f} \
+		|| exit 1; \
+	done
 endef
 HOST_SYSTEMD_POST_INSTALL_HOOKS += HOST_SYSTEMD_FIX_RPATH
 
