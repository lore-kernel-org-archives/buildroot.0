From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Mar 2017 20:49:33 +0200
Subject: [Buildroot] [PATCH 2/2] python-psutil: enable musl build
In-Reply-To: <e713d348e9a896e71f8b203d84a81bc0fd7a8a8b.1489344573.git.baruch@tkos.co.il>
References: <e713d348e9a896e71f8b203d84a81bc0fd7a8a8b.1489344573.git.baruch@tkos.co.il>
Message-ID: <757a21713908e3e110267d00af8da15013095c39.1489344573.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sysinfo.h header conflict issue is now fixed since upstream commit
c414ecd9b9151 ("Fix build with musl libc"). Enable build with musl. Enable
reverse dependencies as well.

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/circus/Config.in          | 4 +---
 package/python-crossbar/Config.in | 5 ++---
 package/python-psutil/Config.in   | 5 -----
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/package/circus/Config.in b/package/circus/Config.in
index 5276513076ca..f1cd93c73396 100644
--- a/package/circus/Config.in
+++ b/package/circus/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_CIRCUS
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_INSTALL_LIBSTDCPP # pyzmq -> zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pyzmq -> zeromq
-	depends on !BR2_TOOLCHAIN_USES_MUSL # python-psutil
 	select BR2_PACKAGE_PYTHON_IOWAIT # runtime
 	select BR2_PACKAGE_PYTHON_PSUTIL # runtime
 	select BR2_PACKAGE_PYTHON_PYZMQ # runtime
@@ -15,7 +14,6 @@ config BR2_PACKAGE_CIRCUS
 
 	  https://circus.readthedocs.org/en/latest/
 
-comment "circus needs Python and a uClibc or glibc toolchain w/ C++, threads"
+comment "circus needs Python and a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_TOOLCHAIN_USES_MUSL || \
 		!(BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 7ef1aadbc9d8..be8332515ec2 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_CROSSBAR
 	bool "python-crossbar"
-	depends on !BR2_TOOLCHAIN_USES_MUSL # python-psutil
 	# All the following dependencies are runtime dependencies
 	select BR2_PACKAGE_PYTHON_AUTOBAHN
 	select BR2_PACKAGE_PYTHON_CBOR
@@ -40,5 +39,5 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 
 	  https://pypi.python.org/pypi/crossbar
 
-comment "python-crossbar needs a uClibc or glibc toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_TOOLCHAIN_USES_MUSL
+comment "python-crossbar needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-psutil/Config.in b/package/python-psutil/Config.in
index 1aec35d27411..c64eeeed6472 100644
--- a/package/python-psutil/Config.in
+++ b/package/python-psutil/Config.in
@@ -1,13 +1,8 @@
 config BR2_PACKAGE_PYTHON_PSUTIL
 	bool "python-psutil"
-	# sys/sysinfo.h conflict with kernel headers
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  psutil is a cross-platform library for retrieving
 	  information on running processes and system utilization
 	  (CPU, memory, disks, network) in Python.
 
 	  https://pypi.python.org/pypi/psutil
-
-comment "python-psutil needs a uClibc or glibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_MUSL
-- 
2.11.0
