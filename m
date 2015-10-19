From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 19 Oct 2015 20:38:51 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/libdcadec: enable shared build
Message-ID: <1445279931-18041-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libdcadec package currently only builds a static library, which is
naturally built without -fPIC (since this is generally not needed for
static libraries).

However, when the generated static library gets used inside a larger
dynamic library, such as ffmpeg's one, the link fails, since we're
trying to include in a shared library non-PIC code.

To solve this, this commit changes the way the libdcadec library is
built to make sure a shared variant of the library gets built when
appropriate. This way, ffmpeg has a PIC-enabled libdcadec library to
link with.

Fixes
http://autobuild.buildroot.net/results/bd3/bd34d1d2f2d35455d1ddefa1ec247c78f341603f/
http://autobuild.buildroot.net/results/4f7/4f7c87e47e763ce656c50b5862408b18e6f185ab/
http://autobuild.buildroot.net/results/998/99836db091af610a99dbc815b7fdf09cc1d531d1/
http://autobuild.buildroot.net/results/a19/a19023e094cbed491444665d6839a9e65a8eee6c/
http://autobuild.buildroot.net/results/98d/98dde028d1d6199f05c904b498bc39bbaa112aa6/
http://autobuild.buildroot.net/results/4ff/4ffcae6cae419df35e8ca29d429ee178bcf31882/
http://autobuild.buildroot.net/results/8ce/8ced16874255ace4923f6b8888c3fca07f28b804/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: pasted patch description from Thomas,
    changed static libs detection (Thomas)
v2: removed -fPIC for static build (Thomas, Samuel)

 package/libdcadec/libdcadec.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/libdcadec/libdcadec.mk b/package/libdcadec/libdcadec.mk
index 76862a6..2b391fc 100644
--- a/package/libdcadec/libdcadec.mk
+++ b/package/libdcadec/libdcadec.mk
@@ -10,19 +10,24 @@ LIBDCADEC_LICENSE = LGPLv2.1+
 LIBDCADEC_LICENSE_FILES = COPYING.LGPLv2.1
 LIBDCADEC_INSTALL_STAGING = YES
 
+ifeq ($(BR2_STATIC_LIBS),)
+LIBDCADEC_SHARED = CONFIG_SHARED=1
+endif
+
 define LIBDCADEC_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -std=gnu99" -C $(@D)
+		CFLAGS="$(TARGET_CFLAGS) -std=gnu99" \
+		$(LIBDCADEC_SHARED) -C $(@D)
 endef
 
 define LIBDCADEC_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		DESTDIR=$(STAGING_DIR) PREFIX=/usr install
+		$(LIBDCADEC_SHARED) DESTDIR=$(STAGING_DIR) PREFIX=/usr install
 endef
 
 define LIBDCADEC_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) PREFIX=/usr install
+		$(LIBDCADEC_SHARED) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
 endef
 
 $(eval $(generic-package))
-- 
2.6.1
