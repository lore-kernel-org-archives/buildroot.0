From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jun 2020 22:11:11 +0200
Subject: [Buildroot] [git commit] package/poco: add new option for the Poco
 JWT component
Message-ID: <20200630200855.237BB862CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3294956d5d1edd3d98bfdd06bac0d04d998a016
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Poco 1.10.0 introduced a new JWT (JSON Web Tokens). See:
https://pocoproject.org/docs/Poco.JWT.Token.html

This patch add the option to build this component.

Signed-off-by: Julien Olivain <juju@cotds.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/poco/Config.in | 5 +++++
 package/poco/poco.mk   | 5 +++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 6f743f5768..24514a3714 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -90,6 +90,11 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
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
