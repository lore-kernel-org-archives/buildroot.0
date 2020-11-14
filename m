From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 10:59:00 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/xen: add slirp
 dependency for tools
Message-ID: <20201114101641.58E5D817D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f55d265a9791520fe62bf129d365838ed9dac9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Build of xen tools fails if slirp is built before xen because xen is not
compatible with spice slirp which does not provide libslirp.h:

/home/buildroot/autobuild/instance-2/output-1/build/xen-4.13.0/tools/qemu-xen/net/slirp.c:40:10: fatal error: libslirp.h: No such file or directory
 #include <libslirp.h>
          ^~~~~~~~~~~~

Indeed, xen prefers a system-provided slirp over its internal one

So add slirp as a mandatory dependency (now that we switched to the up
to date https://gitlab.freedesktop.org/slirp/libslirp)

This build failure is raised since, at least, version 4.13.0

Fixes:
 - http://autobuild.buildroot.org/results/b80b33ed558518f7bbb0a3c8586bf2d0b8acc36f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a0a5c184efe4fec3bf7edb0a7a8e40bb4ddbea13)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/Config.in | 1 +
 package/xen/xen.mk    | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index 57ab40eba8..af6acd3530 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -28,6 +28,7 @@ config BR2_PACKAGE_XEN_TOOLS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_SLIRP
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_YAJL
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index ee5e9847fe..337aa21ca4 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -42,7 +42,8 @@ XEN_CONF_OPTS += --disable-xen
 endif
 
 ifeq ($(BR2_PACKAGE_XEN_TOOLS),y)
-XEN_DEPENDENCIES += dtc libaio libglib2 ncurses openssl pixman util-linux yajl
+XEN_DEPENDENCIES += \
+	dtc libaio libglib2 ncurses openssl pixman slirp util-linux yajl
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 XEN_DEPENDENCIES += argp-standalone
 endif
