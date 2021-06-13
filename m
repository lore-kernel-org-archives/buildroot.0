From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 21:58:05 +0200
Subject: [Buildroot] [git commit] package/bitcoin: unset the NDEBUG flag
Message-ID: <20210613192725.B01ED8D491@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f098aff4792a0e792bda4d7d1ec22a5af1381d83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since https://git.buildroot.net/buildroot/commit/?id=5a8c50fe05afacc3cbe8e7347e238da9f242fab0
all packages are now built with NDEBUG, which broke Bitcoin builds.

Bitcoin is using assert(...) extensively with the assumption of it
never being a noop at runtime. So we cannot build with NDEBUG.
See: https://github.com/bitcoin/bitcoin/blob/0.21/src/compat/assumptions.h

Fixes:
    http://autobuild.buildroot.org/results/83b/83b6dc0b97b19888fb1187bbbca485961e58ce90/
    and so many more...

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bitcoin/bitcoin.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 142521835c..f485e4ee5c 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -13,6 +13,12 @@ BITCOIN_CPE_ID_VENDOR = bitcoin
 BITCOIN_CPE_ID_PRODUCT = bitcoin_core
 BITCOIN_DEPENDENCIES = host-pkgconf boost libevent
 BITCOIN_MAKE_ENV = BITCOIN_GENBUILD_NO_GIT=1
+# Bitcoin is using assert(...) extensively with the assumption of it
+# never being a noop at runtime. So we cannot build with NDEBUG.
+BITCOIN_CONF_ENV = \
+	CPPFLAGS="$(TARGET_CPPFLAGS) -UNDEBUG" \
+	CFLAGS="$(TARGET_CFLAGS) -UNDEBUG" \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -UNDEBUG"
 BITCOIN_CONF_OPTS = \
 	--disable-bench \
 	--disable-wallet \
