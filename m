From: Dick Olsson <hi@senzilla.io>
Date: Sun, 13 Jun 2021 18:04:18 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/bitcoin: unset the NDEBUG flag
In-Reply-To: <20210612095128.GP168928@scaer>
References: <eIIz4qpp1iCjP9F8wSbhB85GxfrjYh4LnxsTUDodko@cp4-web-032.plabs.ch>
 <20210612095128.GP168928@scaer>
Message-ID: <7BrB5BpT0ZaF06BaFbfImRciKqjCUY2Q31FS4bWjc@cp4-web-036.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since https://git.buildroot.net/buildroot/commit/?id=5a8c50fe05afacc3cbe8e7347e238da9f242fab0
all packages are now built with NDEBUG, which broke Bitcoin builds.

Bitcoin is using assert(...) extensively with the assumption of it
never being a noop at runtime. So we cannot build with NDEBUG.
See: https://github.com/bitcoin/bitcoin/blob/0.21/src/compat/assumptions.h

Signed-off-by: Dick Olsson <hi@senzilla.io>

---

Revision 2:

- Fixed review item by Yann
- Properly include all target flags
---
 package/bitcoin/bitcoin.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 5f1684879c..5b2613e2f9 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -13,6 +13,12 @@ BITCOIN_CPE_ID_VENDOR = bitcoin
 BITCOIN_CPE_ID_PRODUCT = bitcoin_core
 BITCOIN_DEPENDENCIES = host-pkgconf boost libevent
 BITCOIN_MAKE_ENV = BITCOIN_GENBUILD_NO_GIT=1
+# Bitcoin is using assert(...) extensively with the assumption of it
+# never being a noop at runtime. So we cannot build with NDEBUG.
+BITCOIN_CONF_ENV = \
+        CPPFLAGS="$(TARGET_CPPFLAGS) -UNDEBUG" \
+        CFLAGS="$(TARGET_CFLAGS) -UNDEBUG" \
+        CXXFLAGS="$(TARGET_CXXFLAGS) -UNDEBUG"
 BITCOIN_CONF_OPTS = \
 	--disable-bench \
 	--disable-wallet \
-- 
2.30.2
