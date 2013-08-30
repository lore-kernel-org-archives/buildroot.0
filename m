From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Aug 2013 14:09:45 +0200
Subject: [Buildroot] [git commit] ltrace: Add missing mips->mipsel symlink
Message-ID: <20130830121222.80F7F9B636@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=014dd9b15304923de9bd3a7aa0e4778b0fa11393
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Restore missing mips->mipsel symlink. It appears ltrace was
packaged incorrectly and the symlink got lost. See
http://lists.alioth.debian.org/pipermail/ltrace-devel/2013-August/000938.html

[Peter: add a comment explaining why]
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ltrace/ltrace.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 55930b8..0ea8ff3 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -13,6 +13,13 @@ LTRACE_CONF_OPT = --disable-werror
 LTRACE_LICENSE = GPLv2
 LTRACE_LICENSE_FILES = COPYING
 
+# symlink missing from tarball
+define LTRACE_MIPS_SYMLINK
+	cd $(@D)/sysdeps/linux-gnu; ln -sf mipsel mips
+endef
+
+LTRACE_POST_EXTRACT_HOOKS += LTRACE_MIPS_SYMLINK
+
 # ltrace can use libunwind only if libc has backtrace() support
 # We don't normally do so for uClibc and we can't know if it's external
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
