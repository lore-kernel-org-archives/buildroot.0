From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 17:09:13 +0200
Subject: [Buildroot] [git commit] python-psutil: not available on musl
Message-ID: <20160921151053.A011C7FECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab930190d7754b7f5fdda115b2069d00f1320861
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/365/365c2f0b32ae3cb1d6d4d8f0145500dfadd05c59/
http://autobuild.buildroot.org/results/140/140d0ec9d94f75453c4c82e18803c8d7bffcf6be/

And many more.

The sysinfo structure definition in linux/sysinfo.h (which gets indirectly
included from linux/kernel.h) conflicts with the definition in sys/sysinfo.h
when building against the musl C library, leading to build failures:

arm-linux-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes \
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DPSUTIL_VERSION=430 \
  -c psutil/_psutil_linux.c -o build/temp.linux-x86_64-3.5/psutil/_psutil_linux.o
In file included from /home/buildroot/build/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/kernel.h:4:0,
                 from /home/buildroot/build/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/ethtool.h:16,
                 from psutil/_psutil_linux.c:35:
/home/buildroot/build/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/sysinfo.h:7:8: error: redefinition of 'struct sysinfo'
 struct sysinfo {
        ^
In file included from psutil/_psutil_linux.c:21:0:
/home/buildroot/build/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here

The suggested solution by the musl developers is to duplicate the needed
structures and defines inline instead of including the kernel headers, which
is unlikely to be acceptable upstream - So instead mark python-psutil (and
its reverse dependencies) as unavailable on musl.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/circus/Config.in          | 5 +++--
 package/python-crossbar/Config.in | 5 +++--
 package/python-psutil/Config.in   | 5 +++++
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/circus/Config.in b/package/circus/Config.in
index e696f25..3df41f5 100644
--- a/package/circus/Config.in
+++ b/package/circus/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CIRCUS
 	depends on BR2_USE_WCHAR # pyzmq -> zeromq
 	depends on BR2_INSTALL_LIBSTDCPP # pyzmq -> zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pyzmq -> zeromq
+	depends on !BR2_TOOLCHAIN_USES_MUSL # python-psutil
 	select BR2_PACKAGE_PYTHON_IOWAIT # runtime
 	select BR2_PACKAGE_PYTHON_PSUTIL # runtime
 	select BR2_PACKAGE_PYTHON_PYZMQ # runtime
@@ -15,7 +16,7 @@ config BR2_PACKAGE_CIRCUS
 
 	  https://circus.readthedocs.org/en/latest/
 
-comment "circus needs Python and a toolchain w/ C++, wchar, threads"
+comment "circus needs Python and a uClibc or glibc toolchain w/ C++, wchar, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL \
 		!(BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index be83325..7ef1aad 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CROSSBAR
 	bool "python-crossbar"
+	depends on !BR2_TOOLCHAIN_USES_MUSL # python-psutil
 	# All the following dependencies are runtime dependencies
 	select BR2_PACKAGE_PYTHON_AUTOBAHN
 	select BR2_PACKAGE_PYTHON_CBOR
@@ -39,5 +40,5 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 
 	  https://pypi.python.org/pypi/crossbar
 
-comment "python-crossbar needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "python-crossbar needs a uClibc or glibc toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/python-psutil/Config.in b/package/python-psutil/Config.in
index c64eeee..0b1333c 100644
--- a/package/python-psutil/Config.in
+++ b/package/python-psutil/Config.in
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_PYTHON_PSUTIL
 	bool "python-psutil"
+	# sys/sysinfo.h conflict with kernel headers
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  psutil is a cross-platform library for retrieving
 	  information on running processes and system utilization
 	  (CPU, memory, disks, network) in Python.
 
 	  https://pypi.python.org/pypi/psutil
+
+comment "python-psutil needs a uClibc or glibc toolchain"
+	depends BR2_TOOLCHAIN_USES_MUSL
