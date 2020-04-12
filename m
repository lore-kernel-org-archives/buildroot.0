From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2020 15:30:58 +0200
Subject: [Buildroot] [git commit] package/jpeg-turbo: allow installing tools
Message-ID: <20200412131657.17CB68E6CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d71ffcf8d4c6d14a036a2684b6d1f1c696e3abc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the jpeg-turbo tools are forcibly removed, but they can be
usefull (e.g. to test performance on the target, or to script batch
conversions).

Add an option to allow keeping them.

Signed-off-by: Cl??ment P??ron <peron.clem@gmail.com>
[yann.morin.1998 at free.fr
  - move the option out of the choice
  - move the option to a Config.in.options
  - drop the default 'n', which is ... the default
  - use positive logic to define the hook
  - move definition of the hook in the conditional block
  - don't indent the hook assignment
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/jpeg-turbo/Config.in.options | 11 +++++++++++
 package/jpeg-turbo/jpeg-turbo.mk     |  7 ++++---
 package/jpeg/Config.in               |  2 ++
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/jpeg-turbo/Config.in.options b/package/jpeg-turbo/Config.in.options
new file mode 100644
index 0000000000..8654b30952
--- /dev/null
+++ b/package/jpeg-turbo/Config.in.options
@@ -0,0 +1,11 @@
+if BR2_PACKAGE_JPEG_TURBO
+
+config BR2_PACKAGE_JPEG_TURBO_TOOLS
+	bool "jpeg-turbo tools"
+	help
+	  Libjpeg-turbo can also provide some tools like cjpeg,
+	  djpeg, jpegtran, rdjpgcom, tjbench and wrjpgcom.
+
+	  If you want to keep them enable this option.
+
+endif
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 126b470630..65debb2510 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -41,10 +41,11 @@ ifeq ($(BR2_STATIC_LIBS),)
 JPEG_TURBO_CONF_OPTS += -DCMAKE_POSITION_INDEPENDENT_CODE=ON
 endif
 
-define JPEG_TURBO_REMOVE_USELESS_TOOLS
+ifeq ($(BR2_PACKAGE_JPEG_TURBO_TOOLS),)
+define JPEG_TURBO_REMOVE_TOOLS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtran rdjpgcom tjbench wrjpgcom)
 endef
-
-JPEG_TURBO_POST_INSTALL_TARGET_HOOKS += JPEG_TURBO_REMOVE_USELESS_TOOLS
+JPEG_TURBO_POST_INSTALL_TARGET_HOOKS += JPEG_TURBO_REMOVE_TOOLS
+endif
 
 $(eval $(cmake-package))
diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index 97139c7849..0a786060d7 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -43,6 +43,8 @@ source "$BR2_BASE_DIR/.br2-external.in.jpeg"
 
 endchoice
 
+source "package/jpeg-turbo/Config.in.options"
+
 config BR2_PACKAGE_HAS_JPEG
 	bool
 
