From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 22:31:32 +0200
Subject: [Buildroot] [git commit] strace: disable (again) mpers for musl
Message-ID: <20180511203749.3D46B8CA55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc0d31caeedba084a5cd5ef3766a48c7a8193018
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It turns out that mpers support in strace still does not play nicely
with musl libc. As explained in commit 7892a778b (package/strace:
disable libmpers with musl toolchains) headers mixup causes gcc header
to be included, instead of the musl one, resulting in conflicting types.
Commit 1088372941 (strace: bump to version 4.21) incorrectly enabled
mpers for musl. Revert that.

Fixes:
http://autobuild.buildroot.net/results/345/3452419498c074ca66f36f0f87263fa10662ac86/

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strace/strace.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 0529d79af6..1cb0c88c4f 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -11,6 +11,14 @@ STRACE_LICENSE = BSD-3-Clause
 STRACE_LICENSE_FILES = COPYING
 STRACE_CONF_OPTS = --enable-mpers=check
 
+# strace bundle some kernel headers to build libmpers, this mixes userspace
+# headers and kernel headers which break the build with musl.
+# The stddef.h from gcc is used instead of the one from musl.
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+STRACE_CONF_OPTS += st_cv_m32_mpers=no \
+	st_cv_mx32_mpers=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 STRACE_DEPENDENCIES += libunwind
 STRACE_CONF_OPTS += --with-libunwind
