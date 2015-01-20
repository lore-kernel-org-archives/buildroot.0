From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 20 Jan 2015 12:24:39 +0100
Subject: [Buildroot] [PATCH 3/3] qt: Force arm mode instead of Thumb1 mode
In-Reply-To: <1421753079-27665-1-git-send-email-richard.genoud@gmail.com>
References: <1421753079-27665-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <1421753079-27665-3-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt has some assembly that doesn't exist in thumb1 mode.
So, force arm mode for Qt

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/qt/qt.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 255d6d2ab0e4..80605ca514d5 100644
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
-- 
2.0.0
