From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 21:10:50 +0200
Subject: [Buildroot] [git commit] poco: add new options for Json, CppParser,
 MongoDB, PDF and Redis
Message-ID: <20180401200823.A9AA0836BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce1104f6a10d0ebfdc48e1d7eea9eaf096e739fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New options allow to build following components:

* Json
* Redis
* MongoDB
* CppParser
* PDF

This allows to significantly reduce the size of the POCO
libraries. Even though it breaks backward compatibility because those
features were enabled and are now disable by default, Buildroot's
policy is to build the minimal feature-set by default. And users will
get a very clear build failure, which should be easy to fix.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: add an explanation about backward compatibility.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/poco/Config.in | 17 +++++++++++++++++
 package/poco/poco.mk   |  5 +++++
 2 files changed, 22 insertions(+)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 9199b54f0c..b908ea220c 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -18,6 +18,9 @@ if BR2_PACKAGE_POCO
 
 comment "poco components"
 
+config BR2_PACKAGE_POCO_JSON
+	bool "json"
+
 config BR2_PACKAGE_POCO_XML
 	bool "xml"
 	select BR2_PACKAGE_EXPAT
@@ -46,6 +49,20 @@ config BR2_PACKAGE_POCO_ZIP
 	select BR2_PACKAGE_POCO_NET
 	select BR2_PACKAGE_POCO_UTIL
 
+config BR2_PACKAGE_POCO_CPP_PARSER
+	bool "cpp_parser"
+
+config BR2_PACKAGE_POCO_PDF
+	bool "pdf"
+
+config BR2_PACKAGE_POCO_REDIS
+	bool "redis"
+	select BR2_PACKAGE_POCO_NET
+
+config BR2_PACKAGE_POCO_MONGODB
+	bool "mongodb"
+	select BR2_PACKAGE_POCO_NET
+
 config BR2_PACKAGE_POCO_DATA
 	bool
 
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 3dddb435e9..018344d5c7 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -18,12 +18,17 @@ POCO_DEPENDENCIES = zlib pcre \
 	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql)
 
 POCO_OMIT = Data/ODBC PageCompiler \
+	$(if $(BR2_PACKAGE_POCO_JSON),,JSON) \
 	$(if $(BR2_PACKAGE_POCO_XML),,XML) \
 	$(if $(BR2_PACKAGE_POCO_UTIL),,Util) \
 	$(if $(BR2_PACKAGE_POCO_NET),,Net) \
 	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),,NetSSL_OpenSSL) \
 	$(if $(BR2_PACKAGE_POCO_CRYPTO),,Crypto) \
 	$(if $(BR2_PACKAGE_POCO_ZIP),,Zip) \
+	$(if $(BR2_PACKAGE_POCO_CPP_PARSER),,CppParser) \
+	$(if $(BR2_PACKAGE_POCO_PDF),,PDF) \
+	$(if $(BR2_PACKAGE_POCO_REDIS),,Redis) \
+	$(if $(BR2_PACKAGE_POCO_MONGODB),,MongoDB) \
 	$(if $(BR2_PACKAGE_POCO_DATA),,Data) \
 	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL) \
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite)
