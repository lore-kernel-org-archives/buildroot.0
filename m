From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 31 May 2017 18:35:43 +0200
Subject: [Buildroot] [PATCH v2 2/4] erlang-p1-oauth2: New package
In-Reply-To: <20170531163545.23552-1-johan.oudinet@gmail.com>
References: <20170531163545.23552-1-johan.oudinet@gmail.com>
Message-ID: <20170531163545.23552-2-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OAuth2 library for Erlang
https://github.com/processone/p1_oauth2

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

---
Changes v1 -> v2:
 - Fix github URL and rename the package accordingly (suggested by Thomas)
 - Add en entry to the DEVELOPERS file
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/ejabberd/Config.in                     |  8 +++++++-
 package/erlang-p1-oauth2/Config.in             |  6 ++++++
 package/erlang-p1-oauth2/erlang-p1-oauth2.hash |  2 ++
 package/erlang-p1-oauth2/erlang-p1-oauth2.mk   | 13 +++++++++++++
 6 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 package/erlang-p1-oauth2/Config.in
 create mode 100644 package/erlang-p1-oauth2/erlang-p1-oauth2.hash
 create mode 100644 package/erlang-p1-oauth2/erlang-p1-oauth2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 231e73323b..269fd79a21 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -865,6 +865,7 @@ F:	package/erlang-jiffy/
 F:	package/erlang-lager/
 F:	package/erlang-p1-cache-tab/
 F:	package/erlang-p1-iconv/
+F:	package/erlang-p1-oauth2/
 F:	package/erlang-p1-sip/
 F:	package/erlang-p1-stringprep/
 F:	package/erlang-p1-stun/
diff --git a/package/Config.in b/package/Config.in
index 2b53add300..a82ed039b8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -514,6 +514,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-lager/Config.in"
 	source "package/erlang-p1-cache-tab/Config.in"
 	source "package/erlang-p1-iconv/Config.in"
+	source "package/erlang-p1-oauth2/Config.in"
 	source "package/erlang-p1-sip/Config.in"
 	source "package/erlang-p1-stringprep/Config.in"
 	source "package/erlang-p1-stun/Config.in"
diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
index 5d176c3af6..a7542cd12d 100644
--- a/package/ejabberd/Config.in
+++ b/package/ejabberd/Config.in
@@ -1,13 +1,19 @@
 config BR2_PACKAGE_EJABBERD
 	bool "ejabberd"
 	depends on BR2_PACKAGE_ERLANG
-	depends on BR2_INSTALL_LIBSTDCPP # stringprep
+	depends on BR2_INSTALL_LIBSTDCPP # jiffy, stringprep
+	select BR2_PACKAGE_ERLANG_JIFFY
 	select BR2_PACKAGE_ERLANG_LAGER
 	select BR2_PACKAGE_ERLANG_P1_CACHE_TAB
 	select BR2_PACKAGE_ERLANG_P1_ICONV
+	select BR2_PACKAGE_ERLANG_P1_OAUTH2
 	select BR2_PACKAGE_ERLANG_P1_SIP
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
+	select BR2_PACKAGE_ERLANG_P1_STUN
+	select BR2_PACKAGE_ERLANG_P1_TLS
+	select BR2_PACKAGE_ERLANG_P1_UTILS
 	select BR2_PACKAGE_ERLANG_P1_XML
+	select BR2_PACKAGE_ERLANG_P1_XMPP
 	select BR2_PACKAGE_ERLANG_P1_YAML
 	select BR2_PACKAGE_ERLANG_P1_ZLIB
 	select BR2_PACKAGE_GETENT
diff --git a/package/erlang-p1-oauth2/Config.in b/package/erlang-p1-oauth2/Config.in
new file mode 100644
index 0000000000..32e79ec99a
--- /dev/null
+++ b/package/erlang-p1-oauth2/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ERLANG_P1_OAUTH2
+	bool "erlang-p1-oauth2"
+	help
+	  OAuth2 library for Erlang
+
+	  https://github.com/processone/p1_oauth2
diff --git a/package/erlang-p1-oauth2/erlang-p1-oauth2.hash b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
new file mode 100644
index 0000000000..3666519f5f
--- /dev/null
+++ b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 86e4d93f0206135bc6017b6001d061305513917f79c53294e534d6e66fd54727 erlang-p1-oauth2-0.6.1.tar.gz
diff --git a/package/erlang-p1-oauth2/erlang-p1-oauth2.mk b/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
new file mode 100644
index 0000000000..c85706c8db
--- /dev/null
+++ b/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# erlang-p1-oauth2
+#
+################################################################################
+
+ERLANG_P1_OAUTH2_VERSION = 0.6.1
+ERLANG_P1_OAUTH2_SITE = $(call github,processone,p1_oauth2,$(ERLANG_P1_OAUTH2_VERSION))
+ERLANG_P1_OAUTH2_LICENSE = MIT
+ERLANG_P1_OAUTH2_LICENSE_FILES = LICENSE
+ERLANG_P1_OAUTH2_INSTALL_STAGING = YES
+
+$(eval $(rebar-package))
-- 
2.11.0
