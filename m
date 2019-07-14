From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 16:29:43 +0200
Subject: [Buildroot] [PATCH 2/2 v2] arch/arc: always needs -matomic with
 atomix extensions
In-Reply-To: <cover.1563114574.git.yann.morin.1998@free.fr>
References: <cover.1563114574.git.yann.morin.1998@free.fr>
Message-ID: <8d0887d8b7c56dd2b92314886f35bdaa7d57894d.1563114574.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by Alexey:
    https://patchwork.ozlabs.org/patch/1087480/
    https://patchwork.ozlabs.org/patch/1087471/

Reported-by: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - move the condition out of package/Makefile.in  (Alexey)
---
 arch/arch.mk.arc    | 4 ++++
 package/Makefile.in | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)
 create mode 100644 arch/arch.mk.arc

diff --git a/arch/arch.mk.arc b/arch/arch.mk.arc
new file mode 100644
index 0000000000..559216a733
--- /dev/null
+++ b/arch/arch.mk.arc
@@ -0,0 +1,4 @@
+# -matomic is always required when the ARC core has the atomic extensions
+ifeq ($(BR2_arc)$(BR2_ARC_ATOMIC_EXT),y)
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
 
-- 
2.20.1
