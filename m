From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 28 Oct 2014 14:33:50 +0100
Subject: [Buildroot] [PATCH 13/15] erlang-p1-iconv: new package.
In-Reply-To: <1414503232-28314-1-git-send-email-johan.oudinet@gmail.com>
References: <1414503232-28314-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1414503232-28314-14-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                          |  1 +
 package/erlang-p1-iconv/Config.in          |  6 ++++++
 package/erlang-p1-iconv/erlang-p1-iconv.mk | 17 +++++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/erlang-p1-iconv/Config.in
 create mode 100644 package/erlang-p1-iconv/erlang-p1-iconv.mk

diff --git a/package/Config.in b/package/Config.in
index 6db319d..d1d95b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -396,6 +396,7 @@ if BR2_PACKAGE_ERLANG
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
index 0000000..9bcddca
--- /dev/null
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# erlang-p1-iconv
+#
+################################################################################
+
+ERLANG_P1_ICONV_VERSION = 7afc233
+ERLANG_P1_ICONV_SITE = $(call github,processone,eiconv,$(ERLANG_P1_ICONV_VERSION))
+ERLANG_P1_ICONV_LICENSE = GPLv2+
+ERLANG_P1_ICONV_LICENSE_FILES = COPYING
+ERLANG_P1_ICONV_DEPENDENCIES = erlang
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+EJABBERD_DEPENDENCIES += libiconv
+endif
+
+$(eval $(rebar-package))
-- 
2.1.0
