From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 11:13:22 +0200
Subject: [Buildroot] [git commit] package/libv4l: disable for musl toolchains
Message-ID: <20150808095147.016E67F963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b47541e5ed62a9ec1f95ef4f03bedbd417b33e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

musl toolchains are not supported yet in libv4l but
it's a work in progress.

see:
http://git.linuxtv.org/cgit.cgi/v4l-utils.git/commit/?id=70570c6095fa5859cecd0f9522fe7fd749f1d554
http://git.linuxtv.org/cgit.cgi/v4l-utils.git/commit/?id=403a4e2697a1ff96fe2fa16589039595f21cadf0

But it's not enough.

Disable musl toolchains for libv4l 1.6.3 and wait for a new release.

[Thomas: update Config.in comment to take into account the uclibc or
glibc dependency.]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libv4l/Config.in |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 0ae12d1..da9bd83 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_LIBV4L
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # media headers
+	# wait for libv4l 1.7+ for musl compatibility
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -29,7 +31,8 @@ config BR2_PACKAGE_LIBV4L_UTILS
 
 endif
 
-comment "libv4l needs a toolchain w/ threads, dynamic library, C++ and headers >= 3.0"
+comment "libv4l needs an uClibc or (e)glibc toolchain w/ threads, dynamic library, C++ and headers >= 3.0"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
