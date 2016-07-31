From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 31 Jul 2016 20:48:00 +0200
Subject: [Buildroot] [PATCH v2] openssl: fix m68k uclinux compile
Message-ID: <20160731184800.GA6199@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The GCC manual suggest when getting:
relocation truncated to fit: R_68K_GOT16O foobar
to use -mxgot.

Fixes:
http://autobuild.buildroot.net/results/455fd0f274bfa4bbd786bcd6740ecf960e47c1bd/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/openssl/openssl.mk |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index e34868e..b926fe3 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -19,6 +19,11 @@ OPENSSL_PATCH = \
 	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
 	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-symlinking.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
 
+# relocation truncated to fit: R_68K_GOT16O
+ifeq ($(BR2_m68k_cf),y)
+OPENSSL_CFLAGS += -mxgot
+endif
+
 ifeq ($(BR2_USE_MMU),)
 OPENSSL_CFLAGS += -DHAVE_FORK=0
 endif
-- 
1.7.10.4
