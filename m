From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 13 Dec 2017 10:04:22 +0100
Subject: [Buildroot] [PATCH 2/4] python-cffi: always install target
 python-pycparser
In-Reply-To: <20171213090424.11172-1-yegorslists@googlemail.com>
References: <20171213090424.11172-1-yegorslists@googlemail.com>
Message-ID: <20171213090424.11172-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Some packages like python-crossbar, python-keyring use scripts,
that check dependencies of all involved packages at runtime. And
though cffi needs pycparser only in host variant during the bindings
compilation, it still has pycparser in its setup.py as dependency.

So always installing pycparser along with cffi would create rather
little overhead, but we won't have to check whether particular
package has such a runtime script, that checks for dependencies.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-cffi/Config.in     | 1 +
 package/python-crossbar/Config.in | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-cffi/Config.in b/package/python-cffi/Config.in
index 3805d3d10a..bc9f6a296d 100644
--- a/package/python-cffi/Config.in
+++ b/package/python-cffi/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_CFFI
 	bool "python-cffi"
 	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_PYTHON_PYCPARSER # runtime
 	help
 	  This is the Foreign Function Interface for Python calling C
 	  code. The aim of this project is to provide a convenient
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index faec922e50..2a98467bd4 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_AUTOBAHN
 	select BR2_PACKAGE_PYTHON_CBOR
 	select BR2_PACKAGE_PYTHON_CLICK
-	select BR2_PACKAGE_PYTHON_PYCPARSER
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
 	select BR2_PACKAGE_PYTHON_JINJA2
 	select BR2_PACKAGE_PYTHON_LMDB
-- 
2.11.0
