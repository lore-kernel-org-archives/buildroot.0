From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:22:15 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 pciutils
Message-ID: <20180708110810.6D715863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e0b29022f11d869c59173f3713e31ddba0df7b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk   | 1 +
 package/pciutils/pciutils.mk | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index df51f288c4..c87bcec0e4 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_PCIUTILS),pciutils) \
 	$(if $(BR2_PACKAGE_PROCPS_NG),procps-ng) \
 	$(if $(BR2_PACKAGE_PSMISC),psmisc) \
 	$(if $(BR2_PACKAGE_RSYSLOGD),rsyslog) \
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 2dd5771f21..30d429e75a 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -46,11 +46,6 @@ else
 PCIUTILS_MAKE_OPTS += SHARED=yes
 endif
 
-# Build after busybox since it's got a lightweight lspci
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-PCIUTILS_DEPENDENCIES += busybox
-endif
-
 define PCIUTILS_CONFIGURE_CMDS
 	$(SED) 's/wget --no-timestamping/wget/' $(PCIUTILS_DIR)/update-pciids.sh
 	$(SED) 's/uname -s/echo Linux/' \
