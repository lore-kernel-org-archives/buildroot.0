From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Feb 2014 23:09:05 +0100
Subject: [Buildroot] [git commit] host python/python3: conditionally disable
	unicodedata
Message-ID: <20140218221048.BB9509C984@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3d539b53ff0533e91ae849dbdcdd589b0fec0cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python/python.mk   |    2 +-
 package/python3/python3.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 6187d66..163e6f5 100644
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
index b5e9689..b032d15 100644
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
