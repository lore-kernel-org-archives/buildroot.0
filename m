From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 22:41:50 +0200
Subject: [Buildroot] [git commit] package/cegui: force libglew when libepoxy
 is also enabled
Message-ID: <20200429204115.B9D1690AE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ba295f84f1b2a115df6438b85d645651b744b03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cegui doesn't allow to have enabled both opengl libraries so disable
libepoxy when both are enabled.

Fixes:
  - http://autobuild.buildroot.net/results/2881bbcc2dcfcaa5ed663817ff39f7574430ba5a/build-end.log

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cegui/cegui.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 673340194a..9640a15116 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -19,7 +19,8 @@ CEGUI_DEPENDENCIES = glm \
 		$(if $(BR2_PACKAGE_LIBGLEW),libglew) \
 		$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
-ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
+# libepoxy support cannot be enabled together with libglew
+ifeq ($(BR2_PACKAGE_LIBEPOXY):$(BR2_PACKAGE_LIBGLEW),y:)
 CEGUI_DEPENDENCIES += libepoxy
 CEGUI_CONF_OPTS += -DCEGUI_USE_EPOXY=ON
 else
