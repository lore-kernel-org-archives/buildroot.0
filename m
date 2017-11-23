From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 22:53:54 +0100
Subject: [Buildroot] [git commit] package/python-mwclient: bump version to
 0.8.6
Message-ID: <20171201205335.552567FC1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d55b9351d68f7dc47c52b725b7ab9a1d5f0ec0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 0.8.2 added OAuth support so we need python-requests-oauthlib
as runtime dependency from now on. This package also has a runtime
dependency on python-requests so all we need is to update the select
command in Config.in.

Removed patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-use-exec-in-py3-compatible-manner.patch   | 36 ----------------------
 package/python-mwclient/Config.in                  |  2 +-
 package/python-mwclient/python-mwclient.hash       |  4 +--
 package/python-mwclient/python-mwclient.mk         |  4 +--
 4 files changed, 5 insertions(+), 41 deletions(-)

diff --git a/package/python-mwclient/0001-use-exec-in-py3-compatible-manner.patch b/package/python-mwclient/0001-use-exec-in-py3-compatible-manner.patch
deleted file mode 100644
index ac7838a..0000000
--- a/package/python-mwclient/0001-use-exec-in-py3-compatible-manner.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 5de1bb82465d39962e26175c62f644a3e423d030 Mon Sep 17 00:00:00 2001
-From: Adam Williamson <awilliam@redhat.com>
-Date: Thu, 21 Jan 2016 17:21:52 -0800
-Subject: [PATCH] use 'exec' in py3-compatible manner
-
-per https://docs.python.org/2/reference/simple_stmts.html ,
-as exec is a function not a statement in py3, the py2 version
-has been set to allow the subsequent statement to be a tuple,
-so we can invoke it like this to make it both py2 and py3
-compatible. Without this, byte-compiling the file fails under
-py3.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
-downloaded from upstream commit:
-https://github.com/mwclient/mwclient/commit/5de1bb82465d39962e26175c62f644a3e423d030
-
- mwclient/ex.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mwclient/ex.py b/mwclient/ex.py
-index db4006c..c0b1eae 100644
---- a/mwclient/ex.py
-+++ b/mwclient/ex.py
-@@ -12,7 +12,7 @@ def read_config(config_files, **predata):
- 
- def _read_config_file(_config_file, predata):
-     _file = open(_config_file)
--    exec _file in globals(), predata
-+    exec(_file, globals(), predata)
-     _file.close()
- 
-     for _k, _v in predata.iteritems():
--- 
-2.9.3
-
diff --git a/package/python-mwclient/Config.in b/package/python-mwclient/Config.in
index be88978..76bf794 100644
--- a/package/python-mwclient/Config.in
+++ b/package/python-mwclient/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_MWCLIENT
 	bool "python-mwclient"
-	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
+	select BR2_PACKAGE_PYTHON_REQUESTS_OAUTHLIB # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  MediaWiki API client.
diff --git a/package/python-mwclient/python-mwclient.hash b/package/python-mwclient/python-mwclient.hash
index 1098971..1e9744c 100644
--- a/package/python-mwclient/python-mwclient.hash
+++ b/package/python-mwclient/python-mwclient.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/mwclient/json, sha256 locally computed
-md5	c1334facf2d6ca54fe6dba4ab75ecf34  mwclient-0.8.1.tar.gz
-sha256	5f892711cc0b23ff2a6d8b7986ee63cd43fd1ec92b0783604ffa7613cd1662e4  mwclient-0.8.1.tar.gz
+md5	a73687e8caa4248e9f48caece76592ff  mwclient-0.8.6.tar.gz
+sha256	08f917b995b331b937ed8c7e297406e3c8d33b80234679ee7fbfeeafd7570a8e  mwclient-0.8.6.tar.gz
diff --git a/package/python-mwclient/python-mwclient.mk b/package/python-mwclient/python-mwclient.mk
index 1f1e209..7c2a0b0 100644
--- a/package/python-mwclient/python-mwclient.mk
+++ b/package/python-mwclient/python-mwclient.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MWCLIENT_VERSION = 0.8.1
+PYTHON_MWCLIENT_VERSION = 0.8.6
 PYTHON_MWCLIENT_SOURCE = mwclient-$(PYTHON_MWCLIENT_VERSION).tar.gz
-PYTHON_MWCLIENT_SITE = https://pypi.python.org/packages/19/79/481b288a497f625ee8f76141ff3472d81428b1f14b7155a28a63a3247197
+PYTHON_MWCLIENT_SITE = https://pypi.python.org/packages/cd/38/beaf985032b42a0b0c8f9028b469c4dcb0bd7bfab62707ec27af7e890e84
 PYTHON_MWCLIENT_LICENSE = MIT
 PYTHON_MWCLIENT_LICENSE_FILES = mwclient/__init__.py
 PYTHON_MWCLIENT_SETUP_TYPE = setuptools
