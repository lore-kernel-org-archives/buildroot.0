From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 01:18:57 +0100
Subject: [Buildroot] [git commit] host-libxml2: enable debug for mesa3d
Message-ID: <20121216001959.634A39A221@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71a4513e73ec8a3c3d1a18c328c867a8ba2eb471
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The API generation script in mesa3d requires libxml2 to be built with
debug, because it uses the lsCountNode function which is only available
in debug mode.

Note that this is the second "temporary" hack to make mesa3d work.
See http://lists.busybox.net/pipermail/buildroot/2012-November/061936.html
for possible more fundamental solutions.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libxml2/libxml2.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index fde3735..0c84652 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -26,7 +26,12 @@ LIBXML2_POST_INSTALL_STAGING_HOOKS += LIBXML2_STAGING_LIBXML2_CONFIG_FIXUP
 
 HOST_LIBXML2_DEPENDENCIES = host-pkgconf
 
+# mesa3d uses functions that are only available with debug
+ifeq ($(BR2_PACKAGE_MESA3D),y)
+HOST_LIBXML2_CONF_OPT = --with-debug
+else
 HOST_LIBXML2_CONF_OPT = --without-debug
+endif
 
 ifeq ($(BR2_PACKAGE_HOST_LIBXML2_PYTHON),y)
 HOST_LIBXML2_DEPENDENCIES += host-python
