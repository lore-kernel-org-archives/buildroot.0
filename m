From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Nov 2014 01:26:08 +0100
Subject: [Buildroot] [PATCH 22/24 v3] erlang-p1-iconv: new package.
In-Reply-To: <cover.1415751395.git.yann.morin.1998@free.fr>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
Message-ID: <2ca29fcca0b1276f76de875aa3f7bc9591ad7f32.1415751395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Johan Oudinet <johan.oudinet@gmail.com>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                          |  1 +
 package/erlang-p1-iconv/Config.in          |  6 ++++++
 package/erlang-p1-iconv/erlang-p1-iconv.mk | 17 +++++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/erlang-p1-iconv/Config.in
 create mode 100644 package/erlang-p1-iconv/erlang-p1-iconv.mk

diff --git a/package/Config.in b/package/Config.in
index 8abd6a6..bda3674 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -395,6 +395,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-iconv/Config.in"
 	source "package/erlang-p1-sip/Config.in"
 	source "package/erlang-p1-stringprep/Config.in"
 	source "package/erlang-p1-stun/Config.in"
diff --git a/package/erlang-p1-iconv/Config.in b/package/erlang-p1-iconv/Config.in
new file mode 100644
index 0000000..53876bf
--- /dev/null
+++ b/package/erlang-p1-iconv/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ERLANG_P1_ICONV
+	bool "erlang-p1-iconv"
+	depends on BR2_PACKAGE_ERLANG
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  Erlang interface to libiconv
diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.mk b/package/erlang-p1-iconv/erlang-p1-iconv.mk
new file mode 100644
index 0000000..e810a9d
--- /dev/null
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# erlang-p1-iconv
+#
+################################################################################
+
+ERLANG_P1_ICONV_VERSION = dff5ee5
+ERLANG_P1_ICONV_SITE = $(call github,processone,eiconv,$(ERLANG_P1_ICONV_VERSION))
+ERLANG_P1_ICONV_LICENSE = GPLv2+
+ERLANG_P1_ICONV_LICENSE_FILES = COPYING
+ERLANG_P1_ICONV_DEPENDENCIES = erlang
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+ERLANG_P1_ICONV_DEPENDENCIES += libiconv
+endif
+
+$(eval $(rebar-package))
-- 
1.9.1
