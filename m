From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 22:55:59 +0200
Subject: [Buildroot] [git commit] package/python-mwclient: new package
Message-ID: <20161009205638.4B77F81EB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1519e5311097f9fd1779ab1f6e706a8cd7f9830b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by upcoming python-mwscrape package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 .../0001-use-exec-in-py3-compatible-manner.patch   | 36 ++++++++++++++++++++++
 package/python-mwclient/Config.in                  |  8 +++++
 package/python-mwclient/python-mwclient.hash       |  3 ++
 package/python-mwclient/python-mwclient.mk         | 14 +++++++++
 5 files changed, 62 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index db4f722..66dfb15 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -709,6 +709,7 @@ menu "External python modules"
 	source "package/python-meld3/Config.in"
 	source "package/python-mistune/Config.in"
 	source "package/python-msgpack/Config.in"
+	source "package/python-mwclient/Config.in"
 	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
 	source "package/python-networkmanager/Config.in"
diff --git a/package/python-mwclient/0001-use-exec-in-py3-compatible-manner.patch b/package/python-mwclient/0001-use-exec-in-py3-compatible-manner.patch
new file mode 100644
index 0000000..ac7838a
--- /dev/null
+++ b/package/python-mwclient/0001-use-exec-in-py3-compatible-manner.patch
@@ -0,0 +1,36 @@
+From 5de1bb82465d39962e26175c62f644a3e423d030 Mon Sep 17 00:00:00 2001
+From: Adam Williamson <awilliam@redhat.com>
+Date: Thu, 21 Jan 2016 17:21:52 -0800
+Subject: [PATCH] use 'exec' in py3-compatible manner
+
+per https://docs.python.org/2/reference/simple_stmts.html ,
+as exec is a function not a statement in py3, the py2 version
+has been set to allow the subsequent statement to be a tuple,
+so we can invoke it like this to make it both py2 and py3
+compatible. Without this, byte-compiling the file fails under
+py3.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+downloaded from upstream commit:
+https://github.com/mwclient/mwclient/commit/5de1bb82465d39962e26175c62f644a3e423d030
+
+ mwclient/ex.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mwclient/ex.py b/mwclient/ex.py
+index db4006c..c0b1eae 100644
+--- a/mwclient/ex.py
++++ b/mwclient/ex.py
+@@ -12,7 +12,7 @@ def read_config(config_files, **predata):
+ 
+ def _read_config_file(_config_file, predata):
+     _file = open(_config_file)
+-    exec _file in globals(), predata
++    exec(_file, globals(), predata)
+     _file.close()
+ 
+     for _k, _v in predata.iteritems():
+-- 
+2.9.3
+
diff --git a/package/python-mwclient/Config.in b/package/python-mwclient/Config.in
new file mode 100644
index 0000000..be88978
--- /dev/null
+++ b/package/python-mwclient/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_MWCLIENT
+	bool "python-mwclient"
+	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  MediaWiki API client.
+
+	  https://github.com/btongminh/mwclient
diff --git a/package/python-mwclient/python-mwclient.hash b/package/python-mwclient/python-mwclient.hash
new file mode 100644
index 0000000..1098971
--- /dev/null
+++ b/package/python-mwclient/python-mwclient.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/mwclient/json, sha256 locally computed
+md5	c1334facf2d6ca54fe6dba4ab75ecf34  mwclient-0.8.1.tar.gz
+sha256	5f892711cc0b23ff2a6d8b7986ee63cd43fd1ec92b0783604ffa7613cd1662e4  mwclient-0.8.1.tar.gz
diff --git a/package/python-mwclient/python-mwclient.mk b/package/python-mwclient/python-mwclient.mk
new file mode 100644
index 0000000..1f1e209
--- /dev/null
+++ b/package/python-mwclient/python-mwclient.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-mwclient
+#
+################################################################################
+
+PYTHON_MWCLIENT_VERSION = 0.8.1
+PYTHON_MWCLIENT_SOURCE = mwclient-$(PYTHON_MWCLIENT_VERSION).tar.gz
+PYTHON_MWCLIENT_SITE = https://pypi.python.org/packages/19/79/481b288a497f625ee8f76141ff3472d81428b1f14b7155a28a63a3247197
+PYTHON_MWCLIENT_LICENSE = MIT
+PYTHON_MWCLIENT_LICENSE_FILES = mwclient/__init__.py
+PYTHON_MWCLIENT_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
