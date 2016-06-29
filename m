From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 29 Jun 2016 10:01:24 +0200
Subject: [Buildroot] [PATCH 1/2] python-tornado: fix runtime dependencies
Message-ID: <1467187285-13848-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

According to setup.py tornado requires backports.ssl_match_hostname
for Python < 3.2 and certifi for Python < 3.4.

Actually both requirements are optional and tornado alone can work
without them, but Python packages like python-circus check requirements
at runtime and though they don't use this funtionality, they insist on
having these packages installed.

An upstream patch fixes backports.ssl_match_hostname dependency and
selecting python-certifi for Python 2 fixes certifi dependency till
this is fixed upstream.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...re-backports.ssl_match_hostname-on-Python.patch | 37 ++++++++++++++++++++++
 package/python-tornado/Config.in                   |  5 +--
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 package/python-tornado/0001-Don-t-require-backports.ssl_match_hostname-on-Python.patch

diff --git a/package/python-tornado/0001-Don-t-require-backports.ssl_match_hostname-on-Python.patch b/package/python-tornado/0001-Don-t-require-backports.ssl_match_hostname-on-Python.patch
new file mode 100644
index 0000000..d5702e8
--- /dev/null
+++ b/package/python-tornado/0001-Don-t-require-backports.ssl_match_hostname-on-Python.patch
@@ -0,0 +1,37 @@
+From 785fe675d5602e51a559b06861d543c7d37a380c Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Wed, 4 May 2016 09:26:22 +0200
+Subject: [PATCH] Don't require backports.ssl_match_hostname on Python 2.7.9
+ and newer
+
+As Python 3.2 support was dropped one can check 2.7.x dependency only.
+
+Tornado running on Python 2.7.9+ doesn't need this backported package,
+but some Python packages like circus check package dependencies at
+runtime and insist on having backports.ssl_match_hostname installed,
+though they don't even use this particular feature.
+
+So checking for exact version makes life of package maintainer easier
+especially on embedded Linux distributions like Buildroot.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index c13eeed..0c24e70 100644
+--- a/setup.py
++++ b/setup.py
+@@ -129,7 +129,7 @@ if setuptools is not None:
+     if sys.version_info < (2, 7):
+         # Only needed indirectly, for singledispatch.
+         install_requires.append('ordereddict')
+-    if sys.version_info < (3, 2):
++    if sys.version_info < (2, 7, 9):
+         install_requires.append('backports.ssl_match_hostname')
+     if sys.version_info < (3, 4):
+         install_requires.append('singledispatch')
+-- 
+2.8.1
+
diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
index 3ead2af..a0ee78f 100644
--- a/package/python-tornado/Config.in
+++ b/package/python-tornado/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_PYTHON_TORNADO
 	bool "python-tornado"
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SINGLEDISPATCH if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_BACKPORTS_ABC	if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_CERTIFI if BR2_PACKAGE_PYTHON # runtime
 	help
 	  Tornado is a Python web framework and asynchronous networking
 	  library, originally developed@FriendFeed.
-- 
2.8.1
