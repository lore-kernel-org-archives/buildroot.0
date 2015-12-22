From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 21:39:17 +0100
Subject: [Buildroot] [git commit] lockdev: fix build with the musl C library
Message-ID: <20151222204021.61AFD81734@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c61e97a4d9779e72004e563d00e7985104cba462
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the musl C library is used, the __GNU_LIBRARY__ symbol is not
defined, so the lockdev code doesn't know what to do. To work around
this, we explicitly pass __GNU_LIBRARY__ when building with musl, this
musl provides what's needed for lockdev to build, as if we were
building against glibc.

Fixes:

  http://autobuild.buildroot.org/results/9db/9db4ab40955d3af0027e141245d73ee6c614fb1f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lockdev/lockdev.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
index e40a407..a45e22e 100644
--- a/package/lockdev/lockdev.mk
+++ b/package/lockdev/lockdev.mk
@@ -24,6 +24,12 @@ LOCKDEV_BUILD_ARGS = shared
 LOCKDEV_INSTALL_ARGS = install_run
 endif
 
+# Make the code believe we are using a C library compatible with
+# glibc, which for the purpose of lockdev is actually true.
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+LOCKDEV_BUILD_ARGS += CFLAGS="$(TARGET_CFLAGS) -D__GNU_LIBRARY__"
+endif
+
 ifeq ($(BR2_SHARED_STATIC_LIBS)$(BR2_SHARED_LIBS),y)
 define LOCKDEV_CREATE_LINKS_STAGING
 	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so
