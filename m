From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Sep 2014 23:14:47 +0200
Subject: [Buildroot] [git commit] libqrencode: link with pthread to avoid
	build failure
Message-ID: <20140914211527.F12B89D664@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18c7d1468b9eb9cc517693e3fe14037499b03ad8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: http://autobuild.buildroot.net/results/1ca0719dd1fe0bbc528ec99b5bc2b42e985bfdca/

[Peter: only if toolchain has threads, pass --disable-thread-safety otherwise]
Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libqrencode/libqrencode.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libqrencode/libqrencode.mk b/package/libqrencode/libqrencode.mk
index d445763..b407195 100644
--- a/package/libqrencode/libqrencode.mk
+++ b/package/libqrencode/libqrencode.mk
@@ -11,6 +11,12 @@ LIBQRENCODE_INSTALL_STAGING = YES
 LIBQRENCODE_LICENSE = LGPLv2.1+
 LIBQRENCODE_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBQRENCODE_CONF_ENV += LIBS='-pthread'
+else
+LIBQRENCODE_CONF_OPT += --disable-thread-safety
+endif
+
 ifeq ($(BR2_PACKAGE_LIBQRENCODE_TOOLS),y)
 LIBQRENCODE_CONF_OPT += --with-tools=yes
 LIBQRENCODE_DEPENDENCIES += libpng
