From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 14:52:19 +0200
Subject: [Buildroot] [git commit] grub2: pass target NM, OBJCOPY and STRIP
Message-ID: <20150920125550.1BC6C817A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=890c9e761b70f28c2f2d6c4cf389e418c6d2b32c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://bugs.busybox.net/show_bug.cgi?id=8256

grub2's build system interprets CC, CFLAGS and CPPFLAGS as for the host
and uses TARGET_CC etc. for the target. However, NM, OBJCOPY and STRIP
are used for the target. We currently pass the host-versions of these
tools as part of $(HOST_CONFIGURE_OPTS).

While we're at it, also pass TARGET_LDFLAGS.

This problem had not been noticed up to now because usually we build on
an x86 machine for the x86 architecture, so the binutils are compatible.
However, this is not true on an i386 when building for x86_64.

Cc: Christophe Bricout <christophebricout@yahoo.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub2/grub2.mk |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 1fc910e..88a46f4 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -40,15 +40,22 @@ endif
 
 # Grub2 is kind of special: it considers CC, LD and so on to be the
 # tools to build the native tools (i.e to be executed on the build
-# machine), and uses TARGET_CC, TARGET_CFLAGS, TARGET_CPPFLAGS to
-# build the bootloader itself.
+# machine), and uses TARGET_CC, TARGET_CFLAGS, TARGET_CPPFLAGS,
+# TARGET_LDFLAGS to build the bootloader itself. However, to add to
+# the confusion, it also uses NM, OBJCOPY and STRIP to build the
+# bootloader itself; none of these are used to build the native
+# tools.
 
 GRUB2_CONF_ENV = \
 	$(HOST_CONFIGURE_OPTS) \
 	CPP="$(HOSTCC) -E" \
 	TARGET_CC="$(TARGET_CC)" \
 	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
-	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)"
+	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
+	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
+	NM="$(TARGET_NM)" \
+	OBJCOPY="$(TARGET_OBJCOPY)" \
+	STRIP="$(TARGET_STRIP)"
 
 GRUB2_CONF_OPTS = \
 	--target=$(GRUB2_TARGET) \
