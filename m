From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2020 22:44:36 +0100
Subject: [Buildroot] [git commit] package/kmsxx: fix fmt dependency (needs
 wchar)
Message-ID: <20201213212911.4AC458283B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eda104076275b187df9efb1c98ed2db2265f246f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Propagate the fmt dependency on wchar.

Fixes:

 - http://autobuild.buildroot.net/results/814b0f9c3df0076791ca73579b844ef4d56f13c3

  [ 66%] Building CXX object CMakeFiles/fmt.dir/src/os.cc.o
  In file included from .../build/fmt-7.1.3/include/fmt/os.h:26,
                   from .../build/fmt-7.1.3/src/os.cc:13:
  .../build/fmt-7.1.3/include/fmt/format.h:1139:8: error: 'wstring' in namespace 'std' does not name a type
     std::wstring str() const { return {&buffer_[0], size()}; }
          ^~~~~~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kmsxx/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/kmsxx/Config.in b/package/kmsxx/Config.in
index 6e4d1e61a1..fa327ba18d 100644
--- a/package/kmsxx/Config.in
+++ b/package/kmsxx/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_KMSXX
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 # linux/dma-buf.h
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	depends on BR2_USE_WCHAR # fmt
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_LIBDRM
 	help
@@ -22,6 +23,7 @@ config BR2_PACKAGE_KMSXX_INSTALL_TESTS
 
 endif
 
-comment "kms++ needs a toolchain w/ threads, C++, gcc >= 4.8, headers >= 4.11"
+comment "kms++ needs a toolchain w/ threads, C++, gcc >= 4.8, headers >= 4.11, wchar"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 \
+		|| !BR2_USE_WCHAR
