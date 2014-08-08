From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Fri,  8 Aug 2014 19:09:32 +0400
Subject: [Buildroot] [PATCH v4 4/4] msgpack: Add dependency on atomic
	intrinsics
In-Reply-To: <1407510572-20603-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <In-Reply-To: <CAAXf6LURyGxEfQR+3g6xriwqUeE1E91Oav2X=r_C3YD66JzpEA@mail.gmail.com>
 <1407510572-20603-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1407510572-20603-4-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Msgpack requires GCC built-in atomic functions which are architecture specific
and may not be implemented.

This fixes:
http://autobuild.buildroot.net/results/44849a386cefb8899f4560296bfbbd8ea19ee910/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/msgpack/Config.in        | 7 +++----
 package/python-msgpack/Config.in | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/msgpack/Config.in b/package/msgpack/Config.in
index b380c58..7d6277f 100644
--- a/package/msgpack/Config.in
+++ b/package/msgpack/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MSGPACK
 	bool "msgpack"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_arc # atomic builtins
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
 	help
 	  MessagePack is an efficient binary serialization format.
 
@@ -10,6 +10,5 @@ config BR2_PACKAGE_MSGPACK
 
 	  http://msgpack.org/
 
-comment "msgpack needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_arc
+comment "msgpack needs a toolchain w/ C++, atomic intrinsics"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
diff --git a/package/python-msgpack/Config.in b/package/python-msgpack/Config.in
index c4b68a3..3b825a1 100644
--- a/package/python-msgpack/Config.in
+++ b/package/python-msgpack/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_MSGPACK
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_MSGPACK
 	depends on BR2_INSTALL_LIBSTDCPP # msgpack
-	depends on !BR2_arc # msgpack - atomic builtins
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # msgpack
 	help
 	  MessagePack (http://msgpack.org/) is a fast, compact binary
 	  serialization format, suitable for similar data to JSON.
@@ -12,7 +12,6 @@ config BR2_PACKAGE_PYTHON_MSGPACK
 
 	  https://pypi.python.org/pypi/msgpack-python/
 
-comment "python-msgpack needs a toolchain w/ C++"
+comment "python-msgpack needs a toolchain w/ C++, atomic intrinsics"
 	depends on BR2_PACKAGE_PYTHON
-	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_arc
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
-- 
1.8.4.1
