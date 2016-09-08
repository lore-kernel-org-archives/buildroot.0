From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 22:13:18 +0200
Subject: [Buildroot] [git commit] package/qemu: fix build of host variant
Message-ID: <20160908201329.0C7B782167@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=524b6b85595274ca13bd7d01adb61ce2dddd786c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Qemu buildsystem expects that the cpp it is passed can be called
like it were cc: it passes it the '-c' option, which is not allowed by
cpp, but is allowed for cc.

Fix that by overriding CPP when calling configure.

Note: the target variant of Qemu does not build the affected parts (the
PC-BIOS images). This is another problem that should be fixed separately.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qemu/qemu.mk | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 42dd9c2..9815f76 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -110,16 +110,19 @@ HOST_QEMU_OPTS += --enable-vde
 HOST_QEMU_DEPENDENCIES += host-vde2
 endif
 
+# Override CPP, as it expects to be able to call it like it'd
+# call the compiler.
 define HOST_QEMU_CONFIGURE_CMDS
-	cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure    \
-		--target-list="$(HOST_QEMU_TARGETS)"    \
-		--prefix="$(HOST_DIR)/usr"              \
-		--interp-prefix=$(STAGING_DIR)          \
-		--cc="$(HOSTCC)"                        \
-		--host-cc="$(HOSTCC)"                   \
-		--python=$(HOST_DIR)/usr/bin/python2    \
-		--extra-cflags="$(HOST_CFLAGS)"         \
-		--extra-ldflags="$(HOST_LDFLAGS)"       \
+	cd $(@D); $(HOST_CONFIGURE_OPTS) CPP="$(HOSTCC) -E" \
+		./configure \
+		--target-list="$(HOST_QEMU_TARGETS)" \
+		--prefix="$(HOST_DIR)/usr" \
+		--interp-prefix=$(STAGING_DIR) \
+		--cc="$(HOSTCC)" \
+		--host-cc="$(HOSTCC)" \
+		--python=$(HOST_DIR)/usr/bin/python2 \
+		--extra-cflags="$(HOST_CFLAGS)" \
+		--extra-ldflags="$(HOST_LDFLAGS)" \
 		$(HOST_QEMU_OPTS)
 endef
 
