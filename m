From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 21:29:26 +0200
Subject: [Buildroot] [git commit] package/edid-decode: use
 TARGET_CONFIGURE_OPTS
Message-ID: <20200606193054.41DB980764@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18684d51f446ebde877e28ea3a242150b0f71fe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not use CXX to set the "$(TARGET_CXX) $(TARGET_CXXFLAGS)
$(TARGET_LDFLAGS)" variables and instead use TARGET_CONFIGURE_OPTS to
pass variables using the "standard" variables.

LDFLAGS is supported since
https://git.linuxtv.org/edid-decode.git/commit/?id=0a454bcbba5e172c64236811ed98c161689372f1

CFLAGS is supported since
https://git.linuxtv.org/edid-decode.git/commit/?id=b202b675e38578b33494fc45c2869917e66ba22d

edid-decode did not switch CFLAGS to CXXFLAGS in
https://git.linuxtv.org/edid-decode.git/commit/Makefile?id=e00579c128ced87a69df29a01caaaf0cd4a4c8cc
so use CFLAGS to pass TARGET_CXXFLAGS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/edid-decode/edid-decode.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
index 8fe1e2712a..c41a9f2a76 100644
--- a/package/edid-decode/edid-decode.mk
+++ b/package/edid-decode/edid-decode.mk
@@ -10,12 +10,13 @@ EDID_DECODE_LICENSE = MIT
 EDID_DECODE_LICENSE_FILES = LICENSE
 
 define EDID_DECODE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		CXX="$(TARGET_CXX) $(TARGET_CXXFLAGS) $(TARGET_LDFLAGS)"
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		CFLAGS="$(TARGET_CXXFLAGS)"
 endef
 
 define EDID_DECODE_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		DESTDIR="$(TARGET_DIR)" install
 endef
 
 $(eval $(generic-package))
