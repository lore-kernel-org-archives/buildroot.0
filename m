From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Jul 2017 18:53:28 +0200
Subject: [Buildroot] [PATCH 06/20] mediastreamer: don't download patch from
	Github
In-Reply-To: <20170702165342.29522-1-thomas.petazzoni@free-electrons.com>
References: <20170702165342.29522-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170702165342.29522-7-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ix-compilation-issue-with-latest-bctoobox.patch | 38 ++++++++++++++++++++++
 package/mediastreamer/mediastreamer.hash           |  1 -
 package/mediastreamer/mediastreamer.mk             |  4 ---
 3 files changed, 38 insertions(+), 5 deletions(-)
 create mode 100644 package/mediastreamer/0001-fix-compilation-issue-with-latest-bctoobox.patch

diff --git a/package/mediastreamer/0001-fix-compilation-issue-with-latest-bctoobox.patch b/package/mediastreamer/0001-fix-compilation-issue-with-latest-bctoobox.patch
new file mode 100644
index 0000000..7bc9733
--- /dev/null
+++ b/package/mediastreamer/0001-fix-compilation-issue-with-latest-bctoobox.patch
@@ -0,0 +1,38 @@
+From 26f884bf977977041fe6f98a0af186be1580bf22 Mon Sep 17 00:00:00 2001
+From: Simon Morlat <simon.morlat@linphone.org>
+Date: Thu, 29 Sep 2016 15:26:18 +0200
+Subject: [PATCH] fix compilation issue with latest bctoobox
+
+[Upstream commit https://github.com/BelledonneCommunications/mediastreamer2/commit/26f884bf977977041fe6f98a0af186be1580bf22]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac           | 2 +-
+ src/crypto/dtls_srtp.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7ab20a08f..244d87275 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1116,7 +1116,7 @@ fi
+ 
+ 
+ dnl check bctoolbox library
+-PKG_CHECK_MODULES(BCTOOLBOX, bctoolbox >= 0.0.0, found_bctoolbox=true, found_bctoolbox=false)
++PKG_CHECK_MODULES(BCTOOLBOX, bctoolbox >= 0.4.0, found_bctoolbox=true, found_bctoolbox=false)
+ if test "$found_bctoolbox" = "true" ; then
+ 	LIBS="$LIBS $BCTOOLBOX_LIBS"
+ 	CFLAGS="$CFLAGS $BCTOOLBOX_CFLAGS"
+diff --git a/src/crypto/dtls_srtp.c b/src/crypto/dtls_srtp.c
+index e2c8e1c44..fd37eb5cb 100644
+--- a/src/crypto/dtls_srtp.c
++++ b/src/crypto/dtls_srtp.c
+@@ -705,7 +705,7 @@ static int ms_dtls_srtp_initialise_bctbx_dtls_context(DtlsBcToolBoxContext *dtls
+ 	bctbx_ssl_config_set_authmode(dtlsContext->ssl_config, BCTBX_SSL_VERIFY_OPTIONAL);
+ 	bctbx_ssl_config_set_own_cert( dtlsContext->ssl_config, dtlsContext->crt, dtlsContext->pkey );
+ 	/* This is useless as peer would certainly be a self signed certificate and we won't verify it but avoid runtime warnings */
+-	bctbx_ssl_config_set_ca_chain(dtlsContext->ssl_config, dtlsContext->crt, NULL);
++	bctbx_ssl_config_set_ca_chain(dtlsContext->ssl_config, dtlsContext->crt);
+ 
+ 	/* we are not ready yet to actually start the ssl context, this will be done by calling bctbx_ssl_setup when stream starts */
+ 	return 0;
diff --git a/package/mediastreamer/mediastreamer.hash b/package/mediastreamer/mediastreamer.hash
index 0f1ac77..5f26b54 100644
--- a/package/mediastreamer/mediastreamer.hash
+++ b/package/mediastreamer/mediastreamer.hash
@@ -1,3 +1,2 @@
 # Locally calculated
 sha256  1144849c0c96abafb1153adf56109f0f195a9e4a53cf28cb611bbca7a9012c1a  mediastreamer-2.14.0.tar.gz
-sha256  90091ab0aa7a77381ab1ca5d88cdfa4e7f62505fb452a2bea0f70054d9d1aece  26f884bf977977041fe6f98a0af186be1580bf22.patch
diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index a9e0bf7..44d9e97 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -13,10 +13,6 @@ MEDIASTREAMER_CONF_OPTS = --disable-tests --disable-glx --disable-strict
 MEDIASTREAMER_LICENSE = GPL-2.0+
 MEDIASTREAMER_LICENSE_FILES = COPYING
 
-# fix compilation issue with latest bctoolbox (touches configure.ac)
-MEDIASTREAMER_PATCH = \
-	https://github.com/BelledonneCommunications/mediastreamer2/commit/26f884bf977977041fe6f98a0af186be1580bf22.patch
-
 # patching configure.ac
 MEDIASTREAMER_AUTORECONF = YES
 
-- 
2.9.4
