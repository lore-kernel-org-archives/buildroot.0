From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:05:16 +0100
Subject: [Buildroot] [git commit] zeromq: add norm support
Message-ID: <20160320220805.D99CE80822@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01992b3877a6f7ebf45d87e2b9556aa38742cdf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
[Thomas: add explicit --without-norm.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zeromq/Config.in | 11 +++++++++++
 package/zeromq/zeromq.mk |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index aefdf48..d5c9dea 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -27,6 +27,17 @@ config BR2_PACKAGE_ZEROMQ
 
 if BR2_PACKAGE_ZEROMQ
 
+comment "norm support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+config BR2_PACKAGE_ZEROMQ_NORM
+	bool "NORM support"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_NORM
+	help
+	  Add support for NACK-Oriented Reliable Multicast (RFC 5740)
+	  protocol.
+
 config BR2_PACKAGE_ZEROMQ_PGM
 	bool "PGM/EPGM support"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_2
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index b80f8e4..fbc63a7 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -28,6 +28,13 @@ ifeq ($(BR2_STATIC_LIBS),y)
 ZEROMQ_CONF_OPTS += LIBS=-lstdc++
 endif
 
+ifeq ($(BR2_PACKAGE_ZEROMQ_NORM),y)
+ZEROMQ_CONF_OPTS += --with-norm
+ZEROMQ_DEPENDENCIES += norm
+else
+ZEROMQ_CONF_OPTS += --without-norm
+endif
+
 ifeq ($(BR2_PACKAGE_ZEROMQ_PGM),y)
 ZEROMQ_DEPENDENCIES += host-pkgconf openpgm
 ZEROMQ_CONF_OPTS += --with-pgm
