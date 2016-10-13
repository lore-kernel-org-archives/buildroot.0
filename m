From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Oct 2016 22:13:57 -0300
Subject: [Buildroot] [PATCH 6/8] python-libxml2: new host package
In-Reply-To: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
References: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1476321239-13894-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new python-libxml2 package to build the libxml2 python bindings.

This is required for host-itstool which in turn is required to build
evince.

Unfortunately since we can't detect host-python/host-python3 presence to
enable it in the libxml2 package itself and leaving it to automatic
would be problematic just make a separate package for it like
mesa3d-headers to handle it deterministically.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0001-setup.py-tweak-includes_dir.patch         | 40 ++++++++++++++++++++++
 package/python-libxml2/python-libxml2.hash         |  1 +
 package/python-libxml2/python-libxml2.mk           | 21 ++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 package/python-libxml2/0001-setup.py-tweak-includes_dir.patch
 create mode 120000 package/python-libxml2/python-libxml2.hash
 create mode 100644 package/python-libxml2/python-libxml2.mk

diff --git a/package/python-libxml2/0001-setup.py-tweak-includes_dir.patch b/package/python-libxml2/0001-setup.py-tweak-includes_dir.patch
new file mode 100644
index 0000000..85ca829
--- /dev/null
+++ b/package/python-libxml2/0001-setup.py-tweak-includes_dir.patch
@@ -0,0 +1,40 @@
+From b29e99d93cf8103f64c62bd9a4394e39df549c29 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 10 Oct 2016 19:58:35 -0300
+Subject: [PATCH] setup.py: tweak includes_dir
+
+Add a preprocessor variable @@INCLUDEDIR@@ so that the package makefile
+can replace it with the host include directory. And keep the absolute
+/usr/include directory as well for the iconv headers.
+
+This is completely unsuitable for target-variant package, but then that
+can be handled in the libxml2 package proper if anyone wants target
+libxml2 python bindings.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ python/setup.py | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/python/setup.py b/python/setup.py
+index c44269a..fd08c5c 100755
+--- a/python/setup.py
++++ b/python/setup.py
+@@ -55,13 +55,7 @@ else:
+ # - libxml2/libxml/tree.h
+ # - iconv.h
+ # - libxslt/xsltconfig.h
+-includes_dir = [
+-"/usr/include",
+-"/usr/local/include",
+-"/opt/include",
+-os.path.join(ROOT,'include'),
+-HOME
+-];
++includes_dir = [ "@@INCLUDEDIR@@", "/usr/include" ];
+ 
+ xml_includes=""
+ for dir in includes_dir:
+-- 
+2.7.3
+
diff --git a/package/python-libxml2/python-libxml2.hash b/package/python-libxml2/python-libxml2.hash
new file mode 120000
index 0000000..d3ce9f8
--- /dev/null
+++ b/package/python-libxml2/python-libxml2.hash
@@ -0,0 +1 @@
+../libxml2/libxml2.hash
\ No newline at end of file
diff --git a/package/python-libxml2/python-libxml2.mk b/package/python-libxml2/python-libxml2.mk
new file mode 100644
index 0000000..631468b
--- /dev/null
+++ b/package/python-libxml2/python-libxml2.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# python-libxml2
+#
+################################################################################
+
+PYTHON_LIBXML2_VERSION = 2.9.4
+PYTHON_LIBXML2_SOURCE = libxml2-$(PYTHON_LIBXML2_VERSION).tar.gz
+PYTHON_LIBXML2_SITE = ftp://xmlsoft.org/libxml2
+PYTHON_LIBXML2_LICENSE = MIT
+PYTHON_LIBXML2_LICENSE_FILES = COPYING
+PYTHON_LIBXML2_SETUP_TYPE = setuptools
+PYTHON_LIBXML2_SUBDIR = python
+HOST_PYTHON_LIBXML2_DEPENDENCIES = host-libxml2
+
+define PYTHON_LIBXML2_SET_HOST_DIR
+	$(SED) "s,@@INCLUDEDIR@@,$(HOST_DIR)/usr/include," $(@D)/python/setup.py
+endef
+HOST_PYTHON_LIBXML2_PRE_CONFIGURE_HOOKS += PYTHON_LIBXML2_SET_HOST_DIR
+
+$(eval $(host-python-package))
-- 
2.7.3
