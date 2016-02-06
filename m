From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 11:16:00 +0100
Subject: [Buildroot] [git commit] msgpack: rework BR2_ARCH_HAS_ATOMICS
	dependency
Message-ID: <20160206101652.51CC780771@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b53a2ac54b8158fcea7c1e7377d24ea1b7769615
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The msgpack source code indeed checks for the 4 bytes __sync built-in,
so this commit switches the package from a BR2_ARCH_HAS_ATOMICS
dependency to a BR2_TOOLCHAIN_HAS_SYNC_4 dependency.

python-msgpack, a reverse dependency of msgpack, is changed in the
same way.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/msgpack/Config.in        | 4 ++--
 package/python-msgpack/Config.in | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/msgpack/Config.in b/package/msgpack/Config.in
index a57a378..b8e8213 100644
--- a/package/msgpack/Config.in
+++ b/package/msgpack/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MSGPACK
 	bool "msgpack"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	help
 	  MessagePack is an efficient binary serialization format.
 
@@ -11,5 +11,5 @@ config BR2_PACKAGE_MSGPACK
 	  http://msgpack.org/
 
 comment "msgpack needs a toolchain w/ C++"
-	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/python-msgpack/Config.in b/package/python-msgpack/Config.in
index e740835..7206c22 100644
--- a/package/python-msgpack/Config.in
+++ b/package/python-msgpack/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PYTHON_MSGPACK
 	bool "python-msgpack"
 	select BR2_PACKAGE_MSGPACK
 	depends on BR2_INSTALL_LIBSTDCPP # msgpack
-	depends on BR2_ARCH_HAS_ATOMICS # msgpack
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # msgpack
 	help
 	  MessagePack (http://msgpack.org/) is a fast, compact binary
 	  serialization format, suitable for similar data to JSON.
@@ -12,6 +12,6 @@ config BR2_PACKAGE_PYTHON_MSGPACK
 	  https://pypi.python.org/pypi/msgpack-python/
 
 comment "python-msgpack needs a toolchain w/ C++"
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_INSTALL_LIBSTDCPP
