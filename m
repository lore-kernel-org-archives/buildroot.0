From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jul 2019 22:54:36 +0200
Subject: [Buildroot] [git commit] arch/arc: always needs -matomic with
 atomic extensions
Message-ID: <20190718205327.5F1E084459@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c568b4f37fa6d7f51e6d14d33d7eb75dfe26d7bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Alexey in:
    https://patchwork.ozlabs.org/patch/1087480/
    https://patchwork.ozlabs.org/patch/1087471/

when BR2_ARC_ATOMIC_EXT is enabled, -matomic needs to always be passed
to the compiler to allow atomic instructions to be used. So instead of
passing them through the command-line CFLAGS, we enforce them in the
toolchain wrapper directly.

Reported-by: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/arch.mk.arc    | 4 ++++
 package/Makefile.in | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arch.mk.arc b/arch/arch.mk.arc
new file mode 100644
index 0000000000..5fcffb7f4b
--- /dev/null
+++ b/arch/arch.mk.arc
@@ -0,0 +1,4 @@
+# -matomic is always required when the ARC core has the atomic extensions
+ifeq ($(BR2_arc)$(BR2_ARC_ATOMIC_EXT),yy)
+ARCH_TOOLCHAIN_WRAPPER_OPTS = -matomic
+endif
diff --git a/package/Makefile.in b/package/Makefile.in
index f05b9cc3aa..0a7899c852 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -112,10 +112,6 @@ ifeq ($(BR2_xtensa),y)
 TARGET_ABI += -mlongcalls -mauto-litpools
 endif
 
-ifeq ($(BR2_arc)$(BR2_ARC_ATOMIC_EXT),yy)
-TARGET_ABI += -matomic
-endif
-
 STAGING_SUBDIR = $(GNU_TARGET_NAME)/sysroot
 STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
 
