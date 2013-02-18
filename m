From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 18 Feb 2013 20:39:32 +0100
Subject: [Buildroot] [PATCH] qt: disable precompiled headers to workaround
	compilation failure
In-Reply-To: <512282EB.7070702@lucaceresoli.net>
References: <512282EB.7070702@lucaceresoli.net>
Message-ID: <1361216372-13946-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Precompiled header implementation is buggy in current Qt as described at
http://comments.gmane.org/gmane.comp.lib.qt.devel/5933.

The only known workaround is currently to add -no-pch to configure.

Fixes build failure terminating with error
  compiling ../3rdparty/pixman/pixman-arm-neon-asm.S
  cc1: fatal error: .pch/release-shared-emb-arm/QtGui: No such file or directory
  compilation terminated.
such as:
http://autobuild.buildroot.net/results/648265012591280fa592a239f86ee39aec2d5fa6/build-end.log

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/qt/qt.mk |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index ee1a88b..9f50f91 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -416,10 +416,10 @@ else
 QT_CONFIGURE_OPTS += -no-declarative
 endif
 
-# ccache and precompiled headers don't play well together
-ifeq ($(BR2_CCACHE),y)
+# -no-pch is needed to workaround the issue described at
+# http://comments.gmane.org/gmane.comp.lib.qt.devel/5933.
+# In addition, ccache and precompiled headers don't play well together
 QT_CONFIGURE_OPTS += -no-pch
-endif
 
 # x86x86fix
 # Workaround Qt Embedded bug when crosscompiling for x86 under x86 with linux
-- 
1.7.10.4
