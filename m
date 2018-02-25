From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 25 Feb 2018 19:34:13 +0100
Subject: [Buildroot] [PATCH 1/3] package/strace: bump to 4.21
Message-ID: <20180225183415.8362-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to the new upstream url [1].

Use new --disable-mpers option instead of
st_cv_m32_mpers=no and st_cv_mx32_mpers=no

Restore previous mpers check behaviour (strace < 4.21) by specifying
--enable-mpers=check. Otherwire strace enforces mpers support by
default which require a specific compiler. See [2].

[1] https://github.com/strace/strace/commit/51d40516df28d03e693fd782a4167d7bcf4c6ad3
[2] https://lists.strace.io/pipermail/strace-devel/2018-February/007924.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Even if there are 4.21 archive file hashes provided by sourceforge, don't
use them since we just switched to github.
---
 package/strace/strace.hash |  7 ++-----
 package/strace/strace.mk   | 12 ++++++++----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 404be39788..f05df2bb5e 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,7 +1,4 @@
-# From https://sourceforge.net/projects/strace/files/strace/4.20/
-md5	f2271ab0fac49ebee9cbd7f3469227cb	strace-4.20.tar.xz
-sha1	9cebc754af3434e4027a07745770892f685c0316	strace-4.20.tar.xz
 # Locally calculated after checking signature
-# https://sourceforge.net/projects/strace/files/strace/4.20/strace-4.20.tar.xz.asc
-sha256	5bf3148dd17306a42566f7da17368fdd781afa147db05ea63a4ca2b50f58c523	strace-4.20.tar.xz
+# https://github.com/strace/strace/releases/download/v4.21/strace-4.21.tar.xz.asc
+sha256	5c7688db44073e94c59a5627744e5699454419824cc8166e8bcfd7ec58375c37	strace-4.21.tar.xz
 sha256	ea7ff222f36c9df0aa2924a8f7c7d2aec3ea11e752feba4b15ec79b695b6236a	COPYING
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index ba57774e5d..e292c60f2a 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,18 +4,22 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.20
+STRACE_VERSION = 4.21
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
-STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
+STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3-Clause
 STRACE_LICENSE_FILES = COPYING
 
 # strace bundle some kernel headers to build libmpers, this mixes userspace
 # headers and kernel headers which break the build with musl.
 # The stddef.h from gcc is used instead of the one from musl.
+# Restore previous mpers check behaviour (strace < 4.21) by specifying
+# --enable-mpers=check. Otherwire strace enforces mpers support by default
+# which require a specific compiler.
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-STRACE_CONF_OPTS += st_cv_m32_mpers=no \
-	st_cv_mx32_mpers=no
+STRACE_CONF_OPTS += --disable-mpers
+else
+STRACE_CONF_OPTS += --enable-mpers=check
 endif
 
 define STRACE_REMOVE_STRACE_GRAPH
-- 
2.14.3
