From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Nov 2018 22:08:25 +0100
Subject: [Buildroot] [git commit] libkrb5: fix build on riscv
Message-ID: <20181111210613.40C68825E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e86af4c3961e1f30f2d48a8946a35edd95ab3ec4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Define _REENTRANT otherwise pthread detection will fail

Fixes:
 - http://autobuild.buildroot.org/results/39a51d0c3feab74edd8a17c9174d031ccc7ffe1d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libkrb5/libkrb5.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index d9d7160ae8..6534c069ee 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -52,7 +52,14 @@ else
 LIBKRB5_CONF_OPTS += --without-readline
 endif
 
-ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+# gcc on riscv doesn't define _REENTRANT when -pthread is passed while
+# it should. Compensate this deficiency here otherwise libkrb5 configure
+# script doesn't find that thread support is enabled.
+ifeq ($(BR2_riscv),y)
+LIBKRB5_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_REENTRANT"
+endif
+else
 LIBKRB5_CONF_OPTS += --disable-thread-support
 endif
 
