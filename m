From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu,  6 Jun 2019 15:03:03 +0200
Subject: [Buildroot] [PATCH 1/2] package/prboom: avoid using hardcoded
 optimization flags
Message-ID: <20190606130304.129551-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package prboom builds using -O2 flag ignoring Buildroot settings, this
is due to the fact that -O2 is appended at the end of CFLAGS.

Remove -O2 from 'configure' file, this way CFLAGS will contain Buildroot
CFLAGS.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/prboom/prboom.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index d370ae3fa5..6d9b55e9f6 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -11,6 +11,13 @@ PRBOOM_DEPENDENCIES = sdl sdl_net sdl_mixer
 PRBOOM_LICENSE = GPL-2.0+
 PRBOOM_LICENSE_FILES = COPYING
 
+# Remove imposed -O2 CFLAG to use TARGET_CFLAGS
+define PRBOOM_FIXUP_CONFIGURE
+	sed -i 's:-O2::g' $(@D)/configure
+endef
+
+PRBOOM_PRE_CONFIGURE_HOOKS += PRBOOM_FIXUP_CONFIGURE
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 PRBOOM_DEPENDENCIES += libpng
 endif
-- 
2.17.1
