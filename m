From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 31 Oct 2013 12:48:44 -0700
Subject: [Buildroot] [PATCH v2 1/1] cryptsetup: Add libintl for UCLIBC
	toolchain
Message-ID: <1383248924-426-1-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes autobuild error
http://autobuild.buildroot.net/results/cc1a65b9554bc2ece1b3ea8b51cd805b9bda7e86/

Adding libintl to the libraries list for cryptsetup when using a
uclibc toolchain.

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Realized an error in original commit.  Here is the fix.

Changes v1 -> v2:
  - Adding TARGET_LDFLAGS to make sure they are not dropped

 package/cryptsetup/cryptsetup.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 48d37f6..46e75ad 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -12,4 +12,8 @@ CRYPTSETUP_DEPENDENCIES = lvm2 popt e2fsprogs libgcrypt host-pkgconf
 CRYPTSETUP_LICENSE = GPLv2+ (programs), LGPLv2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
 
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
+endif
+
 $(eval $(autotools-package))
-- 
1.7.9.5
