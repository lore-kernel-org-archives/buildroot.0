From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:19:18 +0100
Subject: [Buildroot] [git commit] bctoolbox: fix mbedtls/polarssl dependency
Message-ID: <20170220212445.040558006A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c3be02dfb16a39f9cd494f8215a4b1c4d4d8a70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently we force selection on mbedtls for bctoolbox. If, for whatever
reason, mbedTLS is not found, bctoolbox searches for PolarSSL and, if
not present, fails with:

```
  Could NOT find PolarSSL (missing: POLARSSL_INCLUDE_DIRS
  HAVE_POLARSSL_SSL_H)
```

This happens because bctoolbox enables support for mbedTLS and PolarSSL
by default, whereas, if both are enabled, mbedTLS is preferred over
PolarSSL.

However, crypto support is not mandatory and support for both libraries
can be turned off. Therefore, optionally depend on mbedTLS or PolarSSL
and enable/disable the library support explicitly.

This fixes the issue of searching for PolarSSL altough the dependency is
not declared in the bctoolbox package.

Note, that this does not fix the issue why mbedtls is not found although
it is enabled. This issue is address in this thread [1].

Fixes:
http://autobuild.buildroot.net/results/cfe/cfeb2f542598e5d450b332fb51a6d79bae24158c/
.. and more.

[1] http://lists.busybox.net/pipermail/buildroot/2017-February/183055.html

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bctoolbox/Config.in    |  4 +++-
 package/bctoolbox/bctoolbox.mk | 16 ++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/bctoolbox/Config.in b/package/bctoolbox/Config.in
index 834f6e2..e9e6920 100644
--- a/package/bctoolbox/Config.in
+++ b/package/bctoolbox/Config.in
@@ -2,11 +2,13 @@ config BR2_PACKAGE_BCTOOLBOX
 	bool "bctoolbox"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_MBEDTLS # mbedtls is preferred over polarssl
 	help
 	  Utilities library used by Belledonne Communications
 	  softwares like belle-sip, mediastreamer2 and linphone.
 
+	  Select BR2_PACKAGE_MBEDTLS (preferred) or
+	  BR2_PACKAGE_POLARSSL for crypto support.
+
 	  https://github.com/BelledonneCommunications/bctoolbox
 
 comment "bctoolbox needs a toolchain w/ C++, threads"
diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
index 64c6779..5eea057 100644
--- a/package/bctoolbox/bctoolbox.mk
+++ b/package/bctoolbox/bctoolbox.mk
@@ -17,6 +17,22 @@ BCTOOLBOX_CONF_OPTS = \
 	-DENABLE_TESTS=OFF \
 	-DGIT_EXECUTABLE=OFF
 
+# bctoolbox can be build with mbedTLS or PolarSSL support. If both
+# libraries are present, mbedTLS is preferred over PolarSSL.
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+BCTOOLBOX_DEPENDENCIES += mbedtls
+BCTOOLBOX_CONF_OPTS += -DENABLE_MBEDTLS=ON
+else
+BCTOOLBOX_CONF_OPTS += -DENABLE_MBEDTLS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_POLARSSL),y)
+BCTOOLBOX_DEPENDENCIES += polarssl
+BCTOOLBOX_CONF_OPTS += -DENABLE_POLARSSL=ON
+else
+BCTOOLBOX_CONF_OPTS += -DENABLE_POLARSSL=OFF
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 BCTOOLBOX_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
 else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
