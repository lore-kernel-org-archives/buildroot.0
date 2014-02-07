From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 07 Feb 2014 11:16:05 +0100
Subject: [Buildroot] [PATCH] host python/python3: conditionally disable
	unicodedata
Message-ID: <e06b104c5f166c541741.1391768165@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host python always had --disable-unicodedata, regardless of the
corresponding configuration option BR2_PACKAGE_PYTHON_UNICODEDATA.
Since the host python is used to byte-compile python modules, this meant
that such modules could not contain unicode strings. For example, following
statement in a python module:
    print u"\N{SOLIDUS}"

would cause the byte-compilation to fail with message:
    SyntaxError: ("(unicode error) \\N escapes not supported (can't load
    unicodedata module)",

Instead, conditionally disable unicodedata based on
BR2_PACKAGE_PYTHON_UNICODEDATA, also for the host python.

This fixes bug #6542 (https://bugs.busybox.net/show_bug.cgi?id=6542)

Reported-by: Gernot Vormayr <gvormayr@gmail.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/python/python.mk   |  2 +-
 package/python3/python3.mk |  2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -26,7 +26,6 @@ HOST_PYTHON_CONF_OPT += 	\
 	--disable-curses	\
 	--disable-codecs-cjk	\
 	--disable-nis		\
-	--disable-unicodedata	\
 	--disable-dbm		\
 	--disable-gdbm		\
 	--disable-bsddb		\
@@ -100,6 +99,7 @@ endif
 
 ifneq ($(BR2_PACKAGE_PYTHON_UNICODEDATA),y)
 PYTHON_CONF_OPT += --disable-unicodedata
+HOST_PYTHON_CONF_OPT += --disable-unicodedata
 endif
 
 # Default is UCS2 w/o a conf opt
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -23,7 +23,6 @@ HOST_PYTHON3_CONF_OPT += 	\
 	--disable-curses	\
 	--disable-codecs-cjk	\
 	--disable-nis		\
-	--disable-unicodedata	\
 	--disable-test-modules	\
 	--disable-idle3
 
@@ -88,6 +87,7 @@ endif
 
 ifneq ($(BR2_PACKAGE_PYTHON3_UNICODEDATA),y)
 PYTHON3_CONF_OPT += --disable-unicodedata
+HOST_PYTHON3_CONF_OPT += --disable-unicodedata
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
