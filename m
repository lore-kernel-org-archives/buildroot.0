From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 17:23:02 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/mongodb: needs
 host-python2
Message-ID: <20190325162536.A493F81E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5271f2f65c5adc01989cb2e6e2e710c7991806bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

mongodb (like gnuradio) needs host-python2 however there is no way to
enforce this so add a dependency on !BR2_PACKAGE_PYTHON3.
Indeed, if BR2_PACKAGE_PYTHON3 is selected, then buildroot will only
build and install host-python-typing for host-python3.

This issue was not raised in the previous version of mongodb as
host-scons was the only dependency however we now have
host-python-typing and host-python-pyyaml dependencies and it
does not seem right to enforce python2 on those packages

Fixes:
 - http://autobuild.buildroot.org/results/693bdba2c01a1b69f56d6ee75094a6a0fc3f40b4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: propagate dependency to Config.in comment]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit bf57446a0b7fbaa75f92d8c05357225846eebafe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongodb/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
index 969b8e062f..4696eb7660 100644
--- a/package/mongodb/Config.in
+++ b/package/mongodb/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
 config BR2_PACKAGE_MONGODB
 	bool "mongodb"
 	depends on BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_PYTHON3
 	depends on BR2_TOOLCHAIN_USES_GLIBC # needs glibc malloc_usable_size
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -38,3 +39,4 @@ comment "mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 6"
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	depends on BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_PYTHON3
