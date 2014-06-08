From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 17:07:31 +0200
Subject: [Buildroot] [git commit] package/jpeg: make it behave more like
	other virtual packages
Message-ID: <20140608151243.AA0629CAB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=958495578f698385c5def81081ab5d84fad92893
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the virtual package jpeg is a special virtual package,
as it offers a choice for its implementation, rather than letting the
user enable them manually.

In so doing, it defines its _HAS option as a 'def_bool y' rather than
letting each implementation 'select' it.

Since we are going to generate a list of virtual packages and their
providers, this defeats the heuristic used to find providers.

Coming with an alternate heuristic that also matches the jpeg
package is quite complex, so better and easier to make it look more
like any other virtual package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jpeg/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index 3042d24..f337aeb 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -13,6 +13,7 @@ choice
 
 config BR2_PACKAGE_LIBJPEG
 	bool "jpeg"
+	select BR2_PACKAGE_HAS_JPEG
 	help
 	  The ubiquitous C library for manipulating JPEG images.
 
@@ -20,6 +21,7 @@ config BR2_PACKAGE_LIBJPEG
 
 config BR2_PACKAGE_JPEG_TURBO
 	bool "jpeg-turbo"
+	select BR2_PACKAGE_HAS_JPEG
 	help
 	  Libjpeg-turbo is a derivative of libjpeg that uses SIMD
 	  instructions (MMX, SSE2, NEON) to accelerate baseline JPEG
@@ -31,7 +33,7 @@ config BR2_PACKAGE_JPEG_TURBO
 endchoice
 
 config BR2_PACKAGE_HAS_JPEG
-	def_bool y
+	bool
 
 config BR2_PACKAGE_PROVIDES_JPEG
 	string
