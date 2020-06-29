From: Julien Olivain <juju@cotds.org>
Date: Mon, 29 Jun 2020 23:07:35 +0200
Subject: [Buildroot] [PATCH 4/4] package/poco: add new option for the Poco
 JWT component
In-Reply-To: <20200629210735.179913-1-juju@cotds.org>
References: <20200629210735.179913-1-juju@cotds.org>
Message-ID: <20200629210735.179913-4-juju@cotds.org>
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
 package/poco/Config.in | 6 ++++++
 package/poco/poco.mk   | 5 +++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index a3d19d5640..1a3b0ceeed 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -82,6 +82,12 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
 	select BR2_PACKAGE_POCO_DATA
 	select BR2_PACKAGE_MYSQL
 
+config BR2_PACKAGE_POCO_JWT
+	bool "jwt"
+	select BR2_PACKAGE_POCO_JSON
+	select BR2_PACKAGE_POCO_CRYPTO
+	select BR2_PACKAGE_OPENSSL
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
