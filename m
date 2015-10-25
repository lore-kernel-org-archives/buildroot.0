From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 21:01:36 +0100
Subject: [Buildroot] [git commit] qt5base: add optional gstreamer1 support
Message-ID: <20151025200324.F154581E0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da9f034d5d1df10ad6c3e249a9a488dc7ef1c42a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Indirectly fixes:
http://autobuild.buildroot.net/results/773/773d9996bd3da283eed6b75083b8bab6469d0423/
http://autobuild.buildroot.net/results/069/069f564fde821b55e710fbe93fe30a5cf11a6da5/
http://autobuild.buildroot.net/results/456/456d380f8b4478245e89f711c33fe0c2d23aaa3a/
http://autobuild.buildroot.net/results/7c8/7c8ebfc93a5b11e40251495715d742520b3b8291/

And many more, as qt5multimedia needs qt5base to be built with gstreamer1
support as well.

While qt5 has some gstreamer 0.10 support, it doesn't seem to be used much
any more and E.G. the 0.10 fallback code in qt5multimedia is broken so only
enable it for the 1.x series.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 3d1ada4..827a85e 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -147,6 +147,14 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) examples
 
+# gstreamer 0.10 support is broken in qt5multimedia
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
+QT5BASE_CONFIGURE_OPTS += -gstreamer 1.0
+QT5BASE_DEPENDENCIES   += gst1-plugins-base
+else
+QT5BASE_CONFIGURE_OPTS += -no-gstreamer
+endif
+
 # Build the list of libraries to be installed on the target
 QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XCB)        += Qt5XcbQpa
