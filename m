From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Apr 2021 14:55:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-cffi: needs threads
Message-ID: <20210403125536.2219244-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libffi needs threads since commit
77cf5b5a71aa54039f4dbc509a1c7cb40aa04934 (more than 6 years ago)

Strangely enough this is the first time there is a build failure on the
autobuilders

Fixes:
 - http://autobuild.buildroot.org/results/acdbf7c58ec8ae648f8048bc75650dcdcdca6285

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-cffi/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-cffi/Config.in b/package/python-cffi/Config.in
index bc9f6a296d..3f332c0504 100644
--- a/package/python-cffi/Config.in
+++ b/package/python-cffi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CFFI
 	bool "python-cffi"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_PYTHON_PYCPARSER # runtime
 	help
@@ -8,3 +9,6 @@ config BR2_PACKAGE_PYTHON_CFFI
 	  and reliable way of calling C code from Python.
 
 	  https://pypi.python.org/pypi/cffi
+
+comment "python-cffi needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.30.2
