From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 15 Apr 2016 08:30:46 -0300
Subject: [Buildroot] [PATCH] glmark2: narrow down libgl requirements
Message-ID: <1460719846-1046-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mesa3d DRI drivers can be enabled without support for libgl (for
example without x11). So make glmark2 gl (x11) support depend on
BR2_PACKAGE_HAS_LIBGL being present as well.
It doesn't exactly mean mesa3d providing libgl, but since we can't have
more than one libgl provider at the same time it's equivalent.
This is fallout from f1894ec95728806e09405d26663e0ea371afaeab which
enabled DRI drivers for non-xorg builds. Fixes:
http://autobuild.buildroot.net/results/174/1743ee5a340e5f4b1f8519e0b11eb196caa4f30e/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glmark2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index 052e820..433da0a 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_GLMARK2_EGL_GLES
 config BR2_PACKAGE_GLMARK2_GL
 	bool
 	default y
+	depends on BR2_PACKAGE_HAS_LIBGL
 	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
 
 comment "glmark2 needs an OpenGL or an openGL ES and EGL backend provided by mesa3d"
-- 
2.7.3
