From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:52:57 +0200
Subject: [Buildroot] [git commit] package/openmpi: fix build failure due to
 Gcc Bug 68485
Message-ID: <20190531205323.42A8F8EA00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86752a62116488e90c8a4dd8c0d5595d48362ebb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package openmpi manifests Microblaze Gcc Bug 68485 resulting in a build
failure due to an Internal Compiler Error.

As done for other packages in Buildroot work around this Gcc Bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y.

Fixes:
http://autobuild.buildroot.net/results/8f3/8f334427e7475154d69469f8ee4efab6df80e403/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openmpi/openmpi.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index 8d9eafd631..b682e6e74e 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -38,4 +38,12 @@ else
 OPENMPI_CONF_OPTS += --enable-mpi-fortran=no
 endif
 
+OPENMPI_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+OPENMPI_CFLAGS += -O0
+endif
+
+OPENMPI_CONF_ENV = CFLAGS="$(OPENMPI_CFLAGS)"
+
 $(eval $(autotools-package))
