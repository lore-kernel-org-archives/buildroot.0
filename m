From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 17:23:41 +0200
Subject: [Buildroot] [git commit] tinydtls: fix issue on u_intXX_t being
	undefined when building with musl
Message-ID: <20160829152356.2B24880108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07552de23b95b48412be89ca5c162d8855872206
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/928be69f90476e6b04be3a1afd3b74112bcac0a0

As mentioned in sha2/README, by default, tinydtls uses u_intXX_t data types
for 8 bit, 32 bit, and 64 bit unsigned integer type definitions.  To use
uintXX_t data types as defined by recent ANSI C standards and as included in
the inttypes.h header file, SHA2_USE_INTTYPES_H has to be define at compile
time.

[Peter: reword/simplify]
Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinydtls/tinydtls.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tinydtls/tinydtls.mk b/package/tinydtls/tinydtls.mk
index 90796b1..fe25001 100644
--- a/package/tinydtls/tinydtls.mk
+++ b/package/tinydtls/tinydtls.mk
@@ -11,5 +11,7 @@ TINYDTLS_LICENSE = MIT
 TINYDTLS_LICENSE_FILES = tinydtls.h
 TINYDTLS_INSTALL_STAGING = YES
 TINYDTLS_STRIP_COMPONENTS = 2
+# use inttypes.h data types instead of u_intXX_t for musl compatibility
+TINYDTLS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DSHA2_USE_INTTYPES_H"
 
 $(eval $(autotools-package))
