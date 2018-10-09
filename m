From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Tue,  9 Oct 2018 22:33:40 +0300
Subject: [Buildroot] [PATCH] systemd: Build with LTO
Message-ID: <20181009193340.26242-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Usage of LTO allows to shave off some size of the binaries.
For example libsystemd for Aarch64:
  libsystemd.so.0.23.0-LTO	- 467K
  libsystemd.so.0.23.0-no-LTO	- 523K

Build-tetsed for ARC and ARM, run-tested on ARC.

Prerequisite is fix for Meson:
https://patchwork.ozlabs.org/patch/981496/

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Jeremy Rosen <jeremy.rosen@smile.fr>

---
 package/systemd/systemd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 4813496670..ebd29c89b0 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -38,7 +38,8 @@ SYSTEMD_CONF_OPTS += \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dmount-path=/usr/bin/mount \
 	-Dumount-path=/usr/bin/umount \
-	-Dnobody-group=nogroup
+	-Dnobody-group=nogroup \
+	-Db_lto=true
 
 # disable unsupported features for non-glibc toolchains
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
-- 
2.16.2
