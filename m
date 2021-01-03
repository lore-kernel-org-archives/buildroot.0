From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jan 2021 21:39:14 +0100
Subject: [Buildroot] [git commit] package/libmdbx: fix build with glibc <
 2.12
Message-ID: <20210103202615.5BAC986282@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8f6d99f3f312becc2ef0cf625c4b259cff53ead
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set CMAKE_BUILD_TYPE to Release to avoid the following build failure
with glibc < 2.12:

/home/buildroot/autobuild/run/instance-1/output-1/build/libmdbx-0.9.2/mdbx.c:487:5: error: #warning "libmdbx was only tested with GLIBC >= 2.12." [-Werror=cpp]
 #   warning "libmdbx was only tested with GLIBC >= 2.12."
     ^~~~~~~
cc1: all warnings being treated as errors

Fixes:
 - http://autobuild.buildroot.org/results/1a60b2c3d2f276f99a22da48e8e16fcf5744eba0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Leonid Yuriev <leo@yuriev.ru>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libmdbx/libmdbx.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 878ea87c07..370df2eaa3 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -14,7 +14,10 @@ LIBMDBX_REDISTRIBUTE = YES
 LIBMDBX_STRIP_COMPONENTS = 0
 LIBMDBX_INSTALL_STAGING = YES
 
+# Set CMAKE_BUILD_TYPE to Release to remove -Werror and avoid a build failure
+# with glibc < 2.12
 LIBMDBX_CONF_OPTS = \
+	-DCMAKE_BUILD_TYPE=Release \
 	-DMDBX_INSTALL_MANPAGES=OFF \
 	-DBUILD_FOR_NATIVE_CPU=OFF \
 	-DMDBX_BUILD_CXX=$(if $(BR2_PACKAGE_LIBMDBX_CXX),ON,OFF) \
