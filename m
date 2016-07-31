From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 31 Jul 2016 15:27:48 +0200
Subject: [Buildroot] [PATCH] openssl: fix compile for coldfire
Message-ID: <20160731132748.GA19712@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For very big functions sep-data must be disabled.
See http://mailman.uclinux.org/pipermail/uclinux-dev/2006-January/036346.html

Fixes:
http://autobuild.buildroot.net/results/455fd0f274bfa4bbd786bcd6740ecf960e47c1bd/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/openssl/openssl.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index e34868e..a15fa3c 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -12,13 +12,19 @@ OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
 HOST_OPENSSL_DEPENDENCIES = host-zlib
 OPENSSL_TARGET_ARCH = generic32
-OPENSSL_CFLAGS = $(TARGET_CFLAGS)
 OPENSSL_PATCH = \
 	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
 	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
 	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
 	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-symlinking.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
 
+# disable sep-data because of very big functions
+ifeq ($(BR2_m68k),y)
+OPENSSL_CFLAGS = $(filter-out -msep-data,$(TARGET_CFLAGS))
+else
+OPENSSL_CFLAGS = $(TARGET_CFLAGS)
+endif
+
 ifeq ($(BR2_USE_MMU),)
 OPENSSL_CFLAGS += -DHAVE_FORK=0
 endif
-- 
2.1.4
