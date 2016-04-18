From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 18 Apr 2016 11:22:03 +0200
Subject: [Buildroot] [PATCH] cannelloni: make SCTP support optional
Message-ID: <1460971323-520-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Since version 20160414 SCTP support is optional. Introduce an option to
select this protocol.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/cannelloni/Config.in     | 11 ++++++++++-
 package/cannelloni/cannelloni.mk |  6 ++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/cannelloni/Config.in b/package/cannelloni/Config.in
index 8f3e888..5613e50 100644
--- a/package/cannelloni/Config.in
+++ b/package/cannelloni/Config.in
@@ -5,13 +5,22 @@ config BR2_PACKAGE_CANNELLONI
 	depends on BR2_USE_MMU # lksctp-tools
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lksctp-tools
 	depends on !BR2_STATIC_LIBS # lksctp-tools
-	select BR2_PACKAGE_LKSCTP_TOOLS
 	help
 	  A SocketCAN over Ethernet tunnel. The tunnel supports both
 	  UDP and SCTP protocols.
 
 	  https://github.com/mguentner/cannelloni
 
+if BR2_PACKAGE_CANNELLONI
+
+config BR2_PACKAGE_CANNELLONI_SCTP
+	bool "SCTP support"
+	select BR2_PACKAGE_LKSCTP_TOOLS
+	help
+	  This option enables support for Stream Control Transmission
+	  Protocol (SCTP)
+endif
+
 comment "cannelloni needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cannelloni/cannelloni.mk b/package/cannelloni/cannelloni.mk
index 680e09a..28dc41e 100644
--- a/package/cannelloni/cannelloni.mk
+++ b/package/cannelloni/cannelloni.mk
@@ -8,6 +8,12 @@ CANNELLONI_VERSION = 20160414
 CANNELLONI_SITE = $(call github,mguentner,cannelloni,$(CANNELLONI_VERSION))
 CANNELLONI_LICENSE = GPLv2
 CANNELLONI_LICENSE_FILES = gpl-2.0.txt
+
+ifeq ($(BR2_PACKAGE_CANNELLONI_SCTP),y)
+CANNELLONI_CONF_OPTS += -DSCTP_SUPPORT=ON
 CANNELLONI_DEPENDENCIES = lksctp-tools
+else
+CANNELLONI_CONF_OPTS += -DSCTP_SUPPORT=OFF
+endif
 
 $(eval $(cmake-package))
-- 
2.8.0.rc3
