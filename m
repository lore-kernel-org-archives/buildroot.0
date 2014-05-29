From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 May 2014 22:38:22 +0200
Subject: [Buildroot] [PATCH 08/11 RFC] package/jpeg: make it behave more
	like other virtual packages
In-Reply-To: <cover.1401395407.git.yann.morin.1998@free.fr>
References: <cover.1401395407.git.yann.morin.1998@free.fr>
Message-ID: <483d7e10cb4532b15cf64f149e6f837a9f44178d.1401395407.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

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
---
 package/jpeg/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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
-- 
1.8.3.2
