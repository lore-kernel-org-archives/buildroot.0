From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 14:38:15 +0200
Subject: [Buildroot] [git commit] gnuradio: needs host-python2
Message-ID: <20180805123230.1E75D8B486@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8955bbe7c84bb2324a7a7aba64e876610b1eca5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnuradio needs host-python2 however there is no way to enforce this so
add a dependency on !BR2_PACKAGE_PYTHON3.
Indeed, if BR2_PACKAGE_PYTHON3 is selected, then buildroot will only
build host-python3.
This issue was not raised in the previous version of gnuradio as
host-python-cheetah was the only dependency and host-python-cheetah
enforces python2 through HOST_PYTHON_CHEETAH_NEEDS_HOST_PYTHON however
we now have host-python-six and host-python-mako dependencies and it
does not seem right to enforces python2 on those packages

Fixes:
 - http://autobuild.buildroot.net/results/a502fef3e2a40f38ca63332440b0b6bd2ed11d5a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuradio/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index d2892faff2..56957d59e4 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -1,5 +1,6 @@
 comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_PYTHON3
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
@@ -10,6 +11,7 @@ config BR2_PACKAGE_GNURADIO
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
+	depends on !BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
