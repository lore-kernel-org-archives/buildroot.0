From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2016 21:45:33 +0200
Subject: [Buildroot] [git commit branch/next] valgrind: let the valgrind
	configure script detect TLS availability
Message-ID: <20160831194551.20DC98226D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=511a161b87424fbe06747b233242d1f3ff915bf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Back in 2005, in commit
a2c326396a43ecbc8d02c3d815d4010a7ba2e004 ("update valgrind to the latest
and greatest"), an explicit --disable-tls option was added. More
recently, in commit 31a3f4bd54e12b8d6de286ab8fb6d9651990e2f5 ("valgrind:
enable tls support") changed this to be conditional on
BR2_GCC_ENABLE_TLS.

However, the configure script of valgrind is perfectly capable of
detecting TLS support, even in a cross-compilation case: it tries to
compile a program that uses __thread and sees if it works.

Since we're about to modify how BR2_GCC_ENABLE_TLS is handled, we'd
better remove its usage from packages, and valgrind is the only package
using this config option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/valgrind/valgrind.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 46ba13e..b97d446 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -15,12 +15,6 @@ VALGRIND_INSTALL_STAGING = YES
 # patch 0004-Fixes-for-musl-libc.patch touching configure.ac
 VALGRIND_AUTORECONF = YES
 
-ifeq ($(BR2_GCC_ENABLE_TLS),y)
-VALGRIND_CONF_OPTS += --enable-tls
-else
-VALGRIND_CONF_OPTS += --disable-tls
-endif
-
 # When Valgrind detects a 32-bit MIPS architecture, it forcibly adds
 # -march=mips32 to CFLAGS; when it detects a 64-bit MIPS architecture,
 # it forcibly adds -march=mips64. This causes Valgrind to be built
