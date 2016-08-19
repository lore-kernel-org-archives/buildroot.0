From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Fri, 19 Aug 2016 19:18:43 +0300
Subject: [Buildroot] [PATCH] qt: build using old C++ standart
Message-ID: <1471623523-23829-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

'std::auto_ptr' is deprecated with gcc-6 but is used in qt4 code.
So we have to build using old C++ standart to prevent build failures.

qt4 is not being developed no more, so unfortunately we can't update
obsolete C++ code and have to add this workaround.

Fixes:
http://autobuild.buildroot.net/results/541/54172d55f39b2fcfa5b7fb4d4ee01566678babbc//
and also Qt build for ARC.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 package/qt/qt.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 09b8dc2..41cdd1a 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -41,6 +41,11 @@ QT_CFLAGS = $(TARGET_CFLAGS)
 QT_CXXFLAGS = $(TARGET_CXXFLAGS)
 QT_LDFLAGS = $(TARGET_LDFLAGS)
 
+# Qt WebKit build fails when gcc-6 is used for build.
+# 'std::auto_ptr' is deprecated with gcc-6 
+# So, we have to use old c++ standart to prevent build failure
+QT_CXXFLAGS += -std=gnu++98
+
 # Qt has some assembly function that are not present in thumb1 mode:
 # Error: selected processor does not support Thumb mode `swp r3,r7,[r4]'
 # so, we desactivate thumb mode
-- 
2.6.3
