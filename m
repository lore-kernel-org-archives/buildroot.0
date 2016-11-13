From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 14:26:08 +0100
Subject: [Buildroot] [git commit] package/strace: disable libmpers with musl
	toolchains
Message-ID: <20161113132649.7041180F69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7892a778b8bed72202db9641c2649825852148b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

strace bundle some kernel headers to build libmpers, this mixes userspace
headers and kernel headers which break the build with musl.
The stddef.h from gcc is used instead of the one from musl.

Disable libmpers for musl toolchains.

Fixes:
http://autobuild.buildroot.net/results/6f6/6f63fa2537ff316ba259a20966faadcf5ab9deff

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/strace/strace.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 385c002..59418af 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -10,6 +10,14 @@ STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VE
 STRACE_LICENSE = BSD-3c
 STRACE_LICENSE_FILES = COPYING
 
+# strace bundle some kernel headers to build libmpers, this mixes userspace
+# headers and kernel headers which break the build with musl.
+# The stddef.h from gcc is used instead of the one from musl.
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+STRACE_CONF_OPTS += st_cv_m32_mpers=no \
+	st_cv_mx32_mpers=no
+endif
+
 define STRACE_REMOVE_STRACE_GRAPH
 	rm -f $(TARGET_DIR)/usr/bin/strace-graph
 endef
