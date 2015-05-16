From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 18:37:05 +0200
Subject: [Buildroot] [git commit] uboot-tools: fix dynamic linking against
	OpenSSL
Message-ID: <20150516163834.5DBBF8079D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66a3f7a240d8804306c1eafa354c2de319097b36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 95f9a5c3df8e4226b99438efccf0bf21eecb573d fixed the static
linking issue of uboot-tools mkimage against OpenSSL, but in the
process broke the dynamic linking case. This commit adjusts the
uboot-tools patch to make sure both static and dynamic linking work.

An updated version of the patch has been submitted upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...kg-config-when-available-to-get-SSL-flags.patch |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/uboot-tools/0004-tools-use-pkg-config-when-available-to-get-SSL-flags.patch b/package/uboot-tools/0004-tools-use-pkg-config-when-available-to-get-SSL-flags.patch
index db038ff..9eb7483 100644
--- a/package/uboot-tools/0004-tools-use-pkg-config-when-available-to-get-SSL-flags.patch
+++ b/package/uboot-tools/0004-tools-use-pkg-config-when-available-to-get-SSL-flags.patch
@@ -1,4 +1,4 @@
-From 7f47f7f8c1a0d634e9febad61504f095476fccc0 Mon Sep 17 00:00:00 2001
+From 99bc38ac6ebdd3b5d741cb9e50d842fa13d409f7 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 12 May 2015 22:54:29 +0200
 Subject: [PATCH] tools: use pkg-config when available to get SSL flags
@@ -13,7 +13,7 @@ We gracefully fallback on the previous behavior of hardcoding -lssl
 -lcrypto if pkg-config is not available or fails with an error.
 
 Patch submitted upstream at
-http://lists.denx.de/pipermail/u-boot/2015-May/214068.html.
+http://lists.denx.de/pipermail/u-boot/2015-May/214489.html
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
@@ -21,7 +21,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/tools/Makefile b/tools/Makefile
-index 4bbb153..e1bcd59 100644
+index 4bbb153..8ff9c2e 100644
 --- a/tools/Makefile
 +++ b/tools/Makefile
 @@ -122,7 +122,8 @@ endif
@@ -30,7 +30,7 @@ index 4bbb153..e1bcd59 100644
  ifneq ($(CONFIG_MX23)$(CONFIG_MX28)$(CONFIG_FIT_SIGNATURE),)
 -HOSTLOADLIBES_mkimage += -lssl -lcrypto
 +HOSTLOADLIBES_mkimage += \
-+	$(shell pkg-config --libs libssl 2> /dev/null || echo "-lssl -lcrypto")
++	$(shell pkg-config --libs libssl libcrypto 2> /dev/null || echo "-lssl -lcrypto")
  endif
  
  HOSTLOADLIBES_dumpimage := $(HOSTLOADLIBES_mkimage)
