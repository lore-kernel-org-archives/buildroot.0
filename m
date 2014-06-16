From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Jun 2014 17:03:32 -0300
Subject: [Buildroot] [PATCH] msgpack: disable for ARC
Message-ID: <1402949012-19434-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

msgpack uses the __sync_fetch_and_add() atomic primitive that is not
available for ARC. Fixes:
http://autobuild.buildroot.net/results/829/8292e67354602738cae12d8ebea83b513ba35482/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/msgpack/Config.in        | 2 ++
 package/python-msgpack/Config.in | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/msgpack/Config.in b/package/msgpack/Config.in
index daa4fdd..b380c58 100644
--- a/package/msgpack/Config.in
+++ b/package/msgpack/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MSGPACK
 	bool "msgpack"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_arc # atomic builtins
 	help
 	  MessagePack is an efficient binary serialization format.
 
@@ -11,3 +12,4 @@ config BR2_PACKAGE_MSGPACK
 
 comment "msgpack needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_arc
diff --git a/package/python-msgpack/Config.in b/package/python-msgpack/Config.in
index 2075ee6..c4b68a3 100644
--- a/package/python-msgpack/Config.in
+++ b/package/python-msgpack/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_MSGPACK
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_MSGPACK
 	depends on BR2_INSTALL_LIBSTDCPP # msgpack
+	depends on !BR2_arc # msgpack - atomic builtins
 	help
 	  MessagePack (http://msgpack.org/) is a fast, compact binary
 	  serialization format, suitable for similar data to JSON.
@@ -14,3 +15,4 @@ config BR2_PACKAGE_PYTHON_MSGPACK
 comment "python-msgpack needs a toolchain w/ C++"
 	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_arc
-- 
1.8.5.5
