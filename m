From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 28 May 2018 20:19:53 +0200
Subject: [Buildroot] [PATCH v2] poppler: link with libatomic when needed
Message-ID: <20180528181953.GA23287@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following errors might occur on architectures required to use gcc libatomics:
sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

This is often the case for sparcv8 32 bit toolchains.

See 55a9d6d55888b04ec6c476399e5b98a2412995f5 and 03f6e005e6a9617767b24a9026da9477848020cc.

Fixes:
  http://autobuild.buildroot.net/results/64a96663a48ab644bc03c9a3ec2d6a644119dee6
  http://autobuild.buildroot.net/results/82e85e12478fc1972b70ad728ed7c1554920c9e3

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 v1 -> v2:
   - more verbose commit message
   - move code to generic section
   - use LDFLAGS instead of CXXFLAGS, LIBS are ignored.
---
 package/poppler/poppler.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 5946cbe..bad61a6 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -14,6 +14,10 @@ POPPLER_INSTALL_STAGING = YES
 POPPLER_CONF_OPTS = --with-font-configuration=fontconfig \
 	--enable-xpdf-headers
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+POPPLER_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
+endif
+
 ifeq ($(BR2_PACKAGE_CAIRO),y)
 POPPLER_CONF_OPTS += --enable-cairo-output
 POPPLER_DEPENDENCIES += cairo
-- 
2.1.4
