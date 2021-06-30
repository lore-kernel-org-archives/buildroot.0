From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu,  1 Jul 2021 01:47:14 +0200
Subject: [Buildroot] [PATCH 2/4] package/gumbo-parser: new package
In-Reply-To: <20210630234717.21742-1-raphael.melotte@mind.be>
References: <20210630234717.21742-1-raphael.melotte@mind.be>
Message-ID: <20210630234717.21742-2-raphael.melotte@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gumbo is an implementation of the HTML5 parsing algorithm implemented
as a pure C99 library with no outside dependencies.

Signed-off-by: Rapha?l M?lotte <raphael.melotte@mind.be>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/gumbo-parser/Config.in         | 10 ++++++++++
 package/gumbo-parser/gumbo-parser.hash |  5 +++++
 package/gumbo-parser/gumbo-parser.mk   | 18 ++++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/gumbo-parser/Config.in
 create mode 100644 package/gumbo-parser/gumbo-parser.hash
 create mode 100644 package/gumbo-parser/gumbo-parser.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c1c32466be..89049bdbad 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2262,6 +2262,7 @@ N:	Ramon Fried <rfried.dev@gmail.com>
 F:	package/bitwise/
 
 N:	Rapha?l M?lotte <raphael.melotte@mind.be>
+F:	package/gumbo-parser/
 F:	package/jbig2dec/
 F:	package/mupdf/
 F:	package/python-boto3/
diff --git a/package/Config.in b/package/Config.in
index 22947edf2c..ab299bc2ae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1901,6 +1901,7 @@ menu "Other"
 	source "package/gobject-introspection/Config.in"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
+	source "package/gumbo-parser/Config.in"
 	source "package/jemalloc/Config.in"
 	source "package/lapack/Config.in"
 	source "package/libabseil-cpp/Config.in"
diff --git a/package/gumbo-parser/Config.in b/package/gumbo-parser/Config.in
new file mode 100644
index 0000000000..04bb2294bb
--- /dev/null
+++ b/package/gumbo-parser/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GUMBO_PARSER
+	bool "gumbo-parser"
+	help
+	  Gumbo is an implementation of the HTML5 parsing algorithm
+	  implemented as a pure C99 library with no outside
+	  dependencies. It's designed to serve as a building block for
+	  other tools and libraries such as linters, validators,
+	  templating languages, and refactoring and analysis tools.
+
+	  https://github.com/google/gumbo-parser
diff --git a/package/gumbo-parser/gumbo-parser.hash b/package/gumbo-parser/gumbo-parser.hash
new file mode 100644
index 0000000000..c4af33072c
--- /dev/null
+++ b/package/gumbo-parser/gumbo-parser.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256  28463053d44a5dfbc4b77bcf49c8cee119338ffa636cc17fc3378421d714efad  gumbo-parser-0.10.1.tar.gz
+
+# Hash for license files:
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  COPYING
diff --git a/package/gumbo-parser/gumbo-parser.mk b/package/gumbo-parser/gumbo-parser.mk
new file mode 100644
index 0000000000..25d12033c6
--- /dev/null
+++ b/package/gumbo-parser/gumbo-parser.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# gumbo-parser
+#
+################################################################################
+
+GUMBO_PARSER_VERSION = 0.10.1
+GUMBO_PARSER_SITE = $(call github,google,gumbo-parser,v$(GUMBO_PARSER_VERSION))
+GUMBO_PARSER_LICENSE = Apache-2.0
+GUMBO_PARSER_LICENSE_FILES = COPYING
+GUMBO_PARSER_INSTALL_STAGING = YES
+
+define GUMBO_PARSER_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+GUMBO_PARSER_PRE_CONFIGURE_HOOKS += GUMBO_PARSER_RUN_AUTOGEN
+
+$(eval $(autotools-package))
-- 
2.31.1
