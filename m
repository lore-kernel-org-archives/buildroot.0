From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 23:45:45 +0200
Subject: [Buildroot] [git commit] gnuradio: depends on shared libs
Message-ID: <20150401214614.45D4381903@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ed9815830bbd6551fd502ddfa5073892883bbeb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

volk must be compiled with toolchain built with shared lib to avoid :
attempted static link of dynamic object `../lib/libvolk.so.0.0.0'

[Thomas:
 - rebase after the non-largefile removal.
 - comment must be "dynamic library" not "shared library".]

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnuradio/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 856bf8d..a33deeb 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -1,12 +1,14 @@
-comment "gnuradio needs a toolchain w/ C++, IPV6, NPTL, wchar"
+comment "gnuradio needs a toolchain w/ C++, IPV6, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_INET_IPV6
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_INET_IPV6 || \
+		BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GNURADIO
 	bool "gnuradio"
 	depends on BR2_INET_IPV6 # boost
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
