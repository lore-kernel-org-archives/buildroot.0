From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 17:08:41 +0200
Subject: [Buildroot] [git commit] tinyxml2: fix build in static libs
	configuration
Message-ID: <20170504150846.67AC98288F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a598a7109c3b518898f38b433f865801d1c1163f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tinyxml2 can build both static and shared libraries. By default, only
shared library is built. Shared/static builds are controlled using
separate cmake flags BUILD_SHARED_LIBS and BUILD_STATIC_LIBS.

In static libs configuration, we internally pass -DBUILD_SHARED_LIBS=OFF
cmake flag to build system which disables both shared and static builds
of library, resulting in failures while linking executable with library.

So pass -DBUILD_STATIC_LIBS=ON cmake flag in case of static libs
configuration.

fixes:
  http://autobuild.buildroot.net/results/d30/d301bcbe5db26068b35eaa94bd816ae8cf8ef2e1

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tinyxml2/tinyxml2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
index bb1e167..e289ca9 100644
--- a/package/tinyxml2/tinyxml2.mk
+++ b/package/tinyxml2/tinyxml2.mk
@@ -10,4 +10,8 @@ TINYXML2_LICENSE = Zlib
 TINYXML2_LICENSE_FILES = readme.md
 TINYXML2_INSTALL_STAGING = YES
 
+ifeq ($(BR2_STATIC_LIBS),y)
+TINYXML2_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
+endif
+
 $(eval $(cmake-package))
