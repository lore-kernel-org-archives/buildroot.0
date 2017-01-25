From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 22:37:22 +0100
Subject: [Buildroot] [git commit] python-jinja2: bump to version 2.9.4
Message-ID: <20170125213857.8D99B81F17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f2e55021dedad34e13608be43423ecae4e8b661
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While bumping fix async feature related issue:

Both asyncsupport.py and asyncfilters.py use async feature, that is
not available in Python 2 and some features available in Python 3.6.
So in both cases *.py compilation would produce compiler errors.
Hence remove both files after package extraction.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Tested-by: Lionel Flandrin <lionel@svkt.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-jinja2/python-jinja2.hash |  6 +++---
 package/python-jinja2/python-jinja2.mk   | 14 ++++++++++++--
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index 04fcbc8..46ea75f 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=edb51693fe22c53cee5403775c71a99e, sha256 locally computed.
-md5	edb51693fe22c53cee5403775c71a99e  Jinja2-2.8.tar.gz
-sha256	bc1ff2ff88dbfacefde4ddde471d1417d3b304e8df103a7a9437d47269201bf4  Jinja2-2.8.tar.gz
+# md5 from https://pypi.python.org/pypi/jinja2/json, sha256 locally computed
+md5	b151bfab6fb728fb7a06da4299161c74  Jinja2-2.9.4.tar.gz
+sha256	aab8d8ca9f45624f1e77f2844bf3c144d180e97da8824c2a6d7552ad039b5442  Jinja2-2.9.4.tar.gz
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index ce6e2b9..16b7b20 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,14 +4,24 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 2.8
+PYTHON_JINJA2_VERSION = 2.9.4
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = http://pypi.python.org/packages/source/J/Jinja2
+PYTHON_JINJA2_SITE = https://pypi.python.org/packages/f4/3f/28387a5bbc6883082c16784c6135440b94f9d5938fb156ff579798e18eda
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3c
 PYTHON_JINJA2_LICENSE_FILES = LICENSE
 # In host build, setup.py tries to download markupsafe if it is not installed
 HOST_PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
 
+# Both asyncsupport.py and asyncfilters.py use async feature, that is
+# not available in Python 2 and some features available in Python 3.6.
+# So in both cases *.py compilation would produce compiler errors.
+# Hence remove both files after package extraction.
+define PYTHON_JINJA2_REMOVE_ASYNC_SUPPORT
+	rm $(@D)/jinja2/asyncsupport.py $(@D)/jinja2/asyncfilters.py
+endef
+
+PYTHON_JINJA2_POST_EXTRACT_HOOKS = PYTHON_JINJA2_REMOVE_ASYNC_SUPPORT
+
 $(eval $(python-package))
 $(eval $(host-python-package))
