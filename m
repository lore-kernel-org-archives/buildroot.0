From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Nov 2020 11:35:25 +0100
Subject: [Buildroot] [git commit] package/libglib2: fix util-linux dependency
Message-ID: <20201101102612.D093E83A34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2acaa86ce630f616b12aa92493e0269421c5bc97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace util-linux dependency by util-linux-libs to break the following
circular dependency:

 util-linux -> udev -> systemd -> polkit -> libglib2 -> util-linux

which will result in the following build failure:

../output-1/build/libglib2-2.64.4/meson.build:1931:2: ERROR: Dependency "mount" not found, tried pkgconfig

This will also raise the following build failure with util-linux:

checking for udev_new in -ludev... no
configure: error: udev selected but libudev not found

Fixes:
 - http://autobuild.buildroot.org/results/d2da9bda4e38b301d11d3baa66ea171e9e087171
 - http://autobuild.buildroot.org/results/520e9f18015fe26f93eb26387524766440e63f23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libglib2/libglib2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index fda04334f5..43fcb27fae 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -86,7 +86,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
 LIBGLIB2_CONF_OPTS += -Dlibmount=enabled
-LIBGLIB2_DEPENDENCIES += util-linux
+LIBGLIB2_DEPENDENCIES += util-linux-libs
 else
 LIBGLIB2_CONF_OPTS += -Dlibmount=disabled
 endif
