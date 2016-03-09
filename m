From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Mar 2016 06:35:42 -0300
Subject: [Buildroot] [PATCH 2/2] zeromq: add norm support
In-Reply-To: <1457516142-7421-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457516142-7421-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1457516142-7421-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/zeromq/Config.in | 11 +++++++++++
 package/zeromq/zeromq.mk |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index b75ed3a..c623064 100644
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
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX # openpgm
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index b80f8e4..20ff2bc 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -28,6 +28,11 @@ ifeq ($(BR2_STATIC_LIBS),y)
 ZEROMQ_CONF_OPTS += LIBS=-lstdc++
 endif
 
+ifeq ($(BR2_PACKAGE_ZEROMQ_NORM),y)
+ZEROMQ_CONF_OPTS += --with-norm
+ZEROMQ_DEPENDENCIES += norm
+endif
+
 ifeq ($(BR2_PACKAGE_ZEROMQ_PGM),y)
 ZEROMQ_DEPENDENCIES += host-pkgconf openpgm
 ZEROMQ_CONF_OPTS += --with-pgm
-- 
2.4.10
