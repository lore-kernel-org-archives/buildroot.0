From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 23:02:15 +0100
Subject: [Buildroot] [git commit] python-psutil: enable musl build
Message-ID: <20170312220223.8E592802AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79c01e73adf1a529ae4c17ce6f8e52a7dbf9d02b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sysinfo.h header conflict issue is now fixed since upstream commit
c414ecd9b9151 ("Fix build with musl libc"). Enable build with musl. Enable
reverse dependencies as well.

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/circus/Config.in          | 4 +---
 package/python-crossbar/Config.in | 5 ++---
 package/python-psutil/Config.in   | 5 -----
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/package/circus/Config.in b/package/circus/Config.in
index 5276513..f1cd93c 100644
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
index 7ef1aad..be83325 100644
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
index 1aec35d..c64eeee 100644
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
