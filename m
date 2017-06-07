From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Wed, 7 Jun 2017 09:01:00 +0200
Subject: [Buildroot] [PATCH v2] package/tslib: enable statically linked
	building
In-Reply-To: <20170606213343.198d1375@free-electrons.com>
References: <20170606213343.198d1375@free-electrons.com>
Message-ID: <20170607070100.10344-1-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Martin Kepplinger <martink@posteo.de>

tslib can be configured to be built statically linked. So let's add this option.

tslib is quite configurable and each module can be selected to be built into
the static build. This configuration includes the hardware independent filter
modules (obviously), and the Linux evdev input module.

This results in a configuration that fully supports multitouch in any
combination.

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---

Thanks for reviewing!


 package/tslib/Config.in |  4 ----
 package/tslib/tslib.mk  | 12 ++++++++++++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/tslib/Config.in b/package/tslib/Config.in
index f1de56c12..a2e1e7ff7 100644
--- a/package/tslib/Config.in
+++ b/package/tslib/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_TSLIB
 	bool "tslib"
-	depends on !BR2_STATIC_LIBS # dlopen
 	help
 	  Tslib is a filtering layer for touchscreen panel events.
 
 	  http://tslib.org
-
-comment "tslib needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 87eb5b734..91ba9db39 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -17,4 +17,16 @@ ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6),)
 TSLIB_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+TSLIB_CONF_OPTS += \
+	--enable-input=static \
+	--enable-linear=static \
+	--enable-median=static \
+	--enable-pthres=static \
+	--enable-iir=static \
+	--enable-dejitter=static \
+	--enable-debounce=static \
+	--enable-skip=static
+endif
+
 $(eval $(autotools-package))
-- 
2.11.0
