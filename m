From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 10 Dec 2013 20:07:19 +0100
Subject: [Buildroot] [PATCH] package/libgles: postpone the check for a
	missing GLES provider
In-Reply-To: <1386702439-10093-1-git-send-email-yann.morin.1998@free.fr>
References: <52A730B0.3020104@orange.com>
 <1386702439-10093-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1386702439-10093-2-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Because some GLES providers may be in BR2_EXTERNAL, $(LIBGLES_DEPENDENCIES)
might be empty hwen we test it.

So, we can't rely on it to define LIBGLES_CONFIGURE_CMDS, and we must
postpone the check until later, ie. at runtime.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/opengl/libgles/libgles.mk | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/libgles/libgles.mk
index ec157ac..c2e1acf 100644
--- a/package/opengl/libgles/libgles.mk
+++ b/package/opengl/libgles/libgles.mk
@@ -22,11 +22,16 @@ ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
 LIBGLES_DEPENDENCIES += gpu-viv-bin-mx6q
 endif
 
-ifeq ($(LIBGLES_DEPENDENCIES),)
+# Because some GLES providers may be in BR2_EXTERNAL,
+# $(LIBGLES_DEPENDENCIES) might be empty right here.
+# So, we can't rely on it to define LIBGLES_CONFIGURE_CMDS
+# right now, and we must postpone the check until later,
+# ie. at runtime.
 define LIBGLES_CONFIGURE_CMDS
-	echo "No libGLES implementation selected. Configuration error."
-	exit 1
+	if [ -z "$${LIBGLES_DEPENDENCIES}" ]; then \
+		echo "No libGLES implementation selected. Configuration error."; \
+		exit 1; \
+	fi
 endef
-endif
 
 $(eval $(generic-package))
-- 
1.8.1.2
