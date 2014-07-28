From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 28 Jul 2014 22:02:05 +0400
Subject: [Buildroot] [PATCH 6/9] msgpack: arc: Disable if ARC atomics are
	disabled
In-Reply-To: <1406570528-31516-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <1406570528-31516-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1406570528-31516-6-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Msgpack requires GCC built-in atomic functions which are optional in ARC
toolchain.

This fixes:
http://autobuild.buildroot.net/results/44849a386cefb8899f4560296bfbbd8ea19ee910/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/msgpack/Config.in        | 6 ++++--
 package/python-msgpack/Config.in | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/msgpack/Config.in b/package/msgpack/Config.in
index b380c58..66e525f 100644
--- a/package/msgpack/Config.in
+++ b/package/msgpack/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MSGPACK
 	bool "msgpack"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_arc # atomic builtins
+	depends on !BR2_arc || BR2_ARC_ATOMIC_EXT
 	help
 	  MessagePack is an efficient binary serialization format.
 
@@ -12,4 +12,6 @@ config BR2_PACKAGE_MSGPACK
 
 comment "msgpack needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_arc
+
+comment "msgpack needs an ARC CPU w/ atomic extension"
+	depends on BR2_arc && !BR2_ARC_ATOMIC_EXT
diff --git a/package/python-msgpack/Config.in b/package/python-msgpack/Config.in
index c4b68a3..365b60c 100644
--- a/package/python-msgpack/Config.in
+++ b/package/python-msgpack/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_MSGPACK
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_MSGPACK
 	depends on BR2_INSTALL_LIBSTDCPP # msgpack
-	depends on !BR2_arc # msgpack - atomic builtins
+	depends on !BR2_arc || BR2_ARC_ATOMIC_EXT
 	help
 	  MessagePack (http://msgpack.org/) is a fast, compact binary
 	  serialization format, suitable for similar data to JSON.
@@ -15,4 +15,6 @@ config BR2_PACKAGE_PYTHON_MSGPACK
 comment "python-msgpack needs a toolchain w/ C++"
 	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_arc
+
+comment "python-msgpack needs an ARC CPU w/ atomic extension"
+	depends on BR2_arc && !BR2_ARC_ATOMIC_EXT
-- 
1.8.4.1
