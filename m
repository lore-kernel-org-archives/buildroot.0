From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 23:07:56 +0200
Subject: [Buildroot] [git commit] package/libgpg-error: Fix compilation with
	gcc5
Message-ID: <20150614210804.2BE997F8D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64607dd8ffbd2ca7a3a79b6ea638610d9ec8bc7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-avoid-breakage-with-gcc-5.patch           |   56 ++++++++++++++++++++
 package/libgpg-error/libgpg-error.mk               |    3 +
 2 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/package/libgpg-error/0001-avoid-breakage-with-gcc-5.patch b/package/libgpg-error/0001-avoid-breakage-with-gcc-5.patch
new file mode 100644
index 0000000..96dc569
--- /dev/null
+++ b/package/libgpg-error/0001-avoid-breakage-with-gcc-5.patch
@@ -0,0 +1,56 @@
+Patch ported from Debian
+http://anonscm.debian.org/cgit/pkg-gnupg/libgpg-error.git/diff/?id=c3d7571
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From 91da4f5dbbc9d93975ef9753652a4e71719f9f27 Mon Sep 17 00:00:00 2001
+From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
+Date: Mon, 16 Mar 2015 13:26:00 -0400
+Subject: [LIBGPG-ERROR PATCH] avoid breakage with gcc 5
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+ * src/Makefile.am: add -P to the C preprocessor when building
+   mkerrcodes.h, to avoid a noisy intermediate pipeline.
+
+--
+
+With gcc 5 without this patch, we see many errors like the following:
+
+gcc -I. -I. -o mkerrcodes ./mkerrcodes.c
+In file included from ./mkerrcodes.c:26:0:
+./mkerrcodes.h:9:5: error: expected expression before ???,??? token
+   { , "GPG_ERR_E2BIG" },
+     ^
+./mkerrcodes.h:10:5: error: expected expression before ???,??? token
+   { , "GPG_ERR_EACCES" },
+     ^
+
+This patch cleans up the generated mkerrcodes.h by making the
+intermediate stage clean for all the versions of gcc i tested (4.x and
+5).
+
+Debian-Bug-Id: 777374
+Signed-Off-By: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
+---
+ src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 99c2c53..f847a80 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -213,7 +213,7 @@ code-to-errno.h: Makefile mkerrnos.awk errnos.in
+ # It is correct to use $(CPP).  We want the host's idea of the error codes.
+ mkerrcodes.h: Makefile mkerrcodes.awk $(gpg_extra_headers)
+ 	$(AWK) -f $(srcdir)/mkerrcodes1.awk $(srcdir)/errnos.in >_$@
+-	$(CPP) $(CPPFLAGS) $(extra_cppflags) _$@ | grep GPG_ERR_ | \
++	$(CPP) $(CPPFLAGS) $(extra_cppflags) -P _$@ | grep GPG_ERR_ | \
+                $(AWK) -f $(srcdir)/mkerrcodes.awk >$@
+ 	-rm _$@
+ 
+-- 
+2.1.4
+
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 9f5f6c2..52b7058 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -10,5 +10,8 @@ LIBGPG_ERROR_LICENSE = LGPLv2.1+
 LIBGPG_ERROR_LICENSE_FILES = COPYING.LIB
 LIBGPG_ERROR_INSTALL_STAGING = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
+# we patch src/Makefile.am
+LIBGPG_ERROR_AUTORECONF = YES
+LIBGPG_ERROR_GETTEXTIZE = YES
 
 $(eval $(autotools-package))
