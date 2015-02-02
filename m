From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Feb 2015 21:42:48 +0100
Subject: [Buildroot] [git commit] qt: Force arm mode instead of Thumb1 mode
Message-ID: <20150202204306.B14258011C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffc55c714c1733f9fe57e8377b4ca3d7544273d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt has some assembly that doesn't exist in thumb1 mode.
So, force arm mode for Qt

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/qt.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 36afaad..9ea676c 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -52,6 +52,14 @@ endif
 
 endif
 
+# Qt has some assembly function that are not present in thumb1 mode:
+# Error: selected processor does not support Thumb mode `swp r3,r7,[r4]'
+# so, we desactivate thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+QT_CFLAGS += -marm
+QT_CXXFLAGS += -marm
+endif
+
 ifeq ($(BR2_PACKAGE_QT_QT3SUPPORT),y)
 QT_CONFIGURE_OPTS += -qt3support
 else
