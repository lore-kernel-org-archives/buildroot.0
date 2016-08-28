From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 28 Aug 2016 23:57:11 +0200
Subject: [Buildroot] [PATCH 1/1] tinydtls: fix issue on u_intXX_t being
	undefined
Message-ID: <1472421431-1103-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/928be69f90476e6b04be3a1afd3b74112bcac0a0

As define in sha2/README, by default, tinydtls uses u_intXX_t data types
for 8 bit, 32 bit, and 64 bit unsigned integer type definitions.
To use uintXX_t data types as defined by recent ANSI C standards and as
included in the inttypes.h header file, SHA2_USE_INTTYPES_H has to be
define at compile time.

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/tinydtls/tinydtls.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/tinydtls/tinydtls.mk b/package/tinydtls/tinydtls.mk
index 90796b1..39f79d4 100644
--- a/package/tinydtls/tinydtls.mk
+++ b/package/tinydtls/tinydtls.mk
@@ -11,5 +11,11 @@ TINYDTLS_LICENSE = MIT
 TINYDTLS_LICENSE_FILES = tinydtls.h
 TINYDTLS_INSTALL_STAGING = YES
 TINYDTLS_STRIP_COMPONENTS = 2
+# As define in sha2/README, by default, tinydtls uses u_intXX_t data types for
+# 8 bit, 32 bit, and 64 bit unsigned integer type definitions.
+# To use uintXX_t data types as defined by recent ANSI C standards and as
+# included in the inttypes.h header file, SHA2_USE_INTTYPES_H has to be define
+# at compile time.
+TINYDTLS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DSHA2_USE_INTTYPES_H"
 
 $(eval $(autotools-package))
-- 
2.5.0
