From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 23:07:42 +0200
Subject: [Buildroot] [git commit] qt: build using old C++ standard
Message-ID: <20160819210752.3B56D82292@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=561622e4ef52cc2697abd6e0a21f56f150caef8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

'std::auto_ptr' is deprecated with gcc-6 but is used in qt4 code.
So we have to build using old C++ standard to prevent build failures.

qt4 is not being developed no more, so unfortunately we can't update
obsolete C++ code and have to add this workaround.

Fixes:
http://autobuild.buildroot.net/results/54172d55f39b2fcfa5b7fb4d4ee01566678babbc/
and also Qt build for ARC.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/qt.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 09b8dc2..8c0ff7b 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -41,6 +41,11 @@ QT_CFLAGS = $(TARGET_CFLAGS)
 QT_CXXFLAGS = $(TARGET_CXXFLAGS)
 QT_LDFLAGS = $(TARGET_LDFLAGS)
 
+# Qt WebKit build fails when gcc-6 is used for build, because
+# 'std::auto_ptr' is deprecated starting from gcc 6.x. So, we have to
+# use an older c++ standard to prevent build failure
+QT_CXXFLAGS += -std=gnu++98
+
 # Qt has some assembly function that are not present in thumb1 mode:
 # Error: selected processor does not support Thumb mode `swp r3,r7,[r4]'
 # so, we desactivate thumb mode
