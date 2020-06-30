From: Julien Olivain <juju@cotds.org>
Date: Tue, 30 Jun 2020 19:34:35 +0200
Subject: [Buildroot] [PATCH v2 4/4] package/poco: add new option for the
 Poco JWT component
In-Reply-To: <20200630173435.7828-1-juju@cotds.org>
References: <20200629210735.179913-1-juju@cotds.org>
 <20200630173435.7828-1-juju@cotds.org>
Message-ID: <20200630173435.7828-4-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Poco 1.10.0 introduced a new JWT (JSON Web Tokens). See:
https://pocoproject.org/docs/Poco.JWT.Token.html

This patch add the option to build this component.

Signed-off-by: Julien Olivain <juju@cotds.org>
---
Changes v1 -> v2:
Suggested by Thomas:
  - Remove "select BR2_PACKAGE_OPENSSL" which is already selected
    by POCO_CRYPTO.
---
 package/poco/Config.in | 5 +++++
 package/poco/poco.mk   | 5 +++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index cfc4f6c0aa..b7dbe3629c 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -85,6 +85,11 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
 	select BR2_PACKAGE_POCO_DATA
 	select BR2_PACKAGE_MYSQL
 
+config BR2_PACKAGE_POCO_JWT
+	bool "jwt"
+	select BR2_PACKAGE_POCO_JSON
+	select BR2_PACKAGE_POCO_CRYPTO
+
 endif # BR2_PACKAGE_POCO
 
 comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library, gcc >= 5 w/ C++14"
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 915d0dc400..c605044ba3 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -17,7 +17,7 @@ POCO_DEPENDENCIES = zlib pcre \
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite) \
 	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql)
 
-POCO_OMIT = Data/ODBC JWT PageCompiler \
+POCO_OMIT = Data/ODBC PageCompiler \
 	$(if $(BR2_PACKAGE_POCO_JSON),,JSON) \
 	$(if $(BR2_PACKAGE_POCO_XML),,XML) \
 	$(if $(BR2_PACKAGE_POCO_UTIL),,Util) \
@@ -31,7 +31,8 @@ POCO_OMIT = Data/ODBC JWT PageCompiler \
 	$(if $(BR2_PACKAGE_POCO_MONGODB),,MongoDB) \
 	$(if $(BR2_PACKAGE_POCO_DATA),,Data) \
 	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL) \
-	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite)
+	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite) \
+	$(if $(BR2_PACKAGE_POCO_JWT),,JWT)
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 POCO_CONF_OPTS += --no-fpenvironment --no-wstring
-- 
2.26.2
