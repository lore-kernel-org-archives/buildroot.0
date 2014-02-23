From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 15:35:18 +0100
Subject: [Buildroot] [PATCH] package/linux-headers: add comment to safely
	ignore missing cross-compiler
Message-ID: <1393166118-26660-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

For some architectures (eg. Arc, Cris, Hexagon, ia64, Parisc, Score and
Xtensa), the Linux buildsystem tries to call the cross-compiler when
installing the headers.

This is a spurious call, since a cross-compiler is not needed at all to
install the headers.

As some users have reported the issue, just add a comment in linux-headers.mk
directing the user to ignore those errors.

Reported-by: Noam Camus <noamc@ezchip.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/linux-headers.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 30d3076..086e5d5 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -17,6 +17,12 @@ LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
 
 LINUX_HEADERS_INSTALL_STAGING = YES
 
+# For some architectures (eg. Arc, Cris, Hexagon, ia64, parisc,
+# score and xtensa), the Linux buildsystem tries to call the
+# cross-compiler, although it is not needed at all.
+# This results in seemingly errors like:
+#   [...]/scripts/gcc-version.sh: line 26: arc-linux-uclibc-gcc: command not found
+# Those can be safely ignored.
 define LINUX_HEADERS_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(MAKE) \
-- 
1.8.3.2
