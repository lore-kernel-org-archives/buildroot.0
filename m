From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 30 Mar 2015 20:10:26 +0200
Subject: [Buildroot] [PATCH v2 1/1] gnuradio: depends on shared libs
Message-ID: <1427739026-13418-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

volk must be compiled with toolchain built with shared lib to avoid :
attempted static link of dynamic object `../lib/libvolk.so.0.0.0'

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
 * Fix comment depend (Baruch)
---
 package/gnuradio/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 274afaa..fe89c01 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -1,14 +1,15 @@
-comment "gnuradio needs a toolchain w/ C++, IPV6, NPTL, largefile, wchar"
+comment "gnuradio needs a toolchain w/ C++, IPV6, NPTL, largefile, wchar and shared libs"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_LARGEFILE || \
-		!BR2_INET_IPV6
+		!BR2_INET_IPV6 || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GNURADIO
 	bool "gnuradio"
 	depends on BR2_INET_IPV6 # boost
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE # boost
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
-- 
2.0.5
