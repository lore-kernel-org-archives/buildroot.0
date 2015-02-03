From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:23:33 +0100
Subject: [Buildroot] [git commit] erlang-p1-iconv: new package.
Message-ID: <20150203092418.063917FCCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=271326d45fc3336a3ce12a943d163227d0d4e240
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    1 +
 package/erlang-p1-iconv/Config.in          |    7 +++++++
 package/erlang-p1-iconv/erlang-p1-iconv.mk |   18 ++++++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bfe6aa7..e9cabfa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -401,6 +401,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-iconv/Config.in"
 	source "package/erlang-p1-sip/Config.in"
 	source "package/erlang-p1-stringprep/Config.in"
 	source "package/erlang-p1-stun/Config.in"
diff --git a/package/erlang-p1-iconv/Config.in b/package/erlang-p1-iconv/Config.in
new file mode 100644
index 0000000..98efb21
--- /dev/null
+++ b/package/erlang-p1-iconv/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ERLANG_P1_ICONV
+	bool "erlang-p1-iconv"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  Erlang interface to libiconv
+
+	  https://github.com/processone/eiconv
diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.mk b/package/erlang-p1-iconv/erlang-p1-iconv.mk
new file mode 100644
index 0000000..2189f01
--- /dev/null
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.mk
@@ -0,0 +1,18 @@
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
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+ERLANG_P1_ICONV_DEPENDENCIES += libiconv
+endif
+
+ERLANG_P1_ICONV_USE_AUTOCONF = YES
+
+$(eval $(rebar-package))
