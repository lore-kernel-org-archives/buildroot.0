From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 22:04:35 +0100
Subject: [Buildroot] [git commit] python-django: new package
Message-ID: <20150104210557.06EED8042D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71d6705ef6a3516325891bc117b3253b49ca0f5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Bump to Django 1.7.2, the latest available version;
 - Support Python 3 in addition to Python 2.
 - Use a download location from pypi.python.org since the download
   location from djangoproject.com didn't work as is and is
   impractical to use with Buildroot: the full URL of the tarball is
   https://www.djangoproject.com/download/1.7.2/tarball/. I.e, it does
   not end with the tarball file name.]

Signed-off-by: oli vogt <oli.vogt.pub01@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    1 +
 package/python-django/Config.in          |   16 ++++++++++++++++
 package/python-django/python-django.hash |    2 ++
 package/python-django/python-django.mk   |   15 +++++++++++++++
 4 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 424ef12..8d91b04 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -496,6 +496,7 @@ menu "external python modules"
 	source "package/python-crc16/Config.in"
 	source "package/python-daemon/Config.in"
 	source "package/python-dialog/Config.in"
+	source "package/python-django/Config.in"
 	source "package/python-docopt/Config.in"
 	source "package/python-dpkt/Config.in"
 	source "package/python-enum/Config.in"
diff --git a/package/python-django/Config.in b/package/python-django/Config.in
new file mode 100644
index 0000000..ff84227
--- /dev/null
+++ b/package/python-django/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_PYTHON_DJANGO
+	bool "python-django"
+	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
+	help
+	  Django is a high-level Python Web framework that encourages
+	  rapid development and clean, pragmatic design. It takes your
+	  Web applications from concept to launch in a matter of hours.
+	  Django takes care of user authentication, content administration,
+	  site maps, RSS feeds, user comments and many more tasks.
+	  Django takes security seriously and helps developers avoid
+	  many common security mistakes
+
+	  https://www.djangoproject.com/
diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
new file mode 100644
index 0000000..0195a13
--- /dev/null
+++ b/package/python-django/python-django.hash
@@ -0,0 +1,2 @@
+# sha256 from https://www.djangoproject.com/m/pgp/Django-1.7.2.checksum.txt
+sha256 31c6c3c229f8c04b3be87e6afc3492903b57ec8f1188a47b6ae160d90cf653c8 Django-1.7.2.tar.gz
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
new file mode 100644
index 0000000..5837088
--- /dev/null
+++ b/package/python-django/python-django.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-django
+#
+################################################################################
+
+PYTHON_DJANGO_VERSION = 1.7.2
+PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
+# The official Django site has an unpractical URL
+PYTHON_DJANGO_SITE = https://pypi.python.org/packages/source/D/Django/
+PYTHON_DJANGO_LICENSE = BSD
+PYTHON_DJANGO_LICENSE_FILES = LICENSE
+PYTHON_DJANGO_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
