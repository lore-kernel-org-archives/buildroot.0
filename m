From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 May 2018 18:42:12 +0300
Subject: [Buildroot] [PATCH] strace: disable (again) mpers for musl
Message-ID: <60b22528a49993d727f4d3f45f761af03e7a8736.1525966932.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/strace/strace.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 0529d79af6fb..1cb0c88c4f3e 100644
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
-- 
2.17.0
