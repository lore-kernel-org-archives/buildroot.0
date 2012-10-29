From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Oct 2012 21:35:10 +0100
Subject: [Buildroot] [git commit] strace: fix build with BR2_LARGEFILE
Message-ID: <20121029205444.4BB3C99959@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23f6455bff246195bf9e5106435fdece64a0dde2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://autobuild.buildroot.net/results/4ce0ce4dcb917889ef70208bd4bac63851c1fb92

Strace gets confused when built with -D_FILE_OFFSET_BITS=64 (which
transparently uses the lfs versions of functions/types), so strip this
from compiler/preprocessor flags.

Inspired by Gentoo who does the same:
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-util/strace/strace-4.7.ebuild

Tested using qemu_arm_versatile_defconfig and the following command line:
strace dd if=/dev/zero bs=1M skip=5000 count=1 of=/dev/null

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/strace/strace.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 5c2d33c..7876848 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -12,6 +12,13 @@ STRACE_CONF_ENV = ac_cv_header_linux_if_packet_h=yes \
 		  ac_cv_header_linux_netlink_h=yes \
 	          $(if $(BR2_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no)
 
+ifeq ($(BR2_LARGEFILE),y)
+# strace gets confused when lfs mode is forced, so don't
+STRACE_CONF_ENV += \
+	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
+	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
+endif
+
 define STRACE_REMOVE_STRACE_GRAPH
 	rm -f $(TARGET_DIR)/usr/bin/strace-graph
 endef
