From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 22:05:31 +0200
Subject: [Buildroot] [git commit] cairo: remove Blackfin related patch
Message-ID: <20180415200629.84E27886C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60d62753d64208ef40f8fec1f3b892da032438b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And renumber the remaining patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cairo/0001-blackfin-build-fix.patch        | 55 ----------------------
 ...ork-build.patch => 0001-fix-nofork-build.patch} |  0
 ...-49-build.patch => 0002-fix-gcc-49-build.patch} |  0
 3 files changed, 55 deletions(-)

diff --git a/package/cairo/0001-blackfin-build-fix.patch b/package/cairo/0001-blackfin-build-fix.patch
deleted file mode 100644
index 0e8dd3ad65..0000000000
--- a/package/cairo/0001-blackfin-build-fix.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Fix build on platforms where __USER_LABEL_PREFIX__ is not empty
-
-On most platforms, a C language symbol and its assembly equivalent are
-identical. However, on the Blackfin architecture, this isn't the case,
-the corresponding C language symbol in assembly is prepended with a
-"_". Blackfin therefore has __USER_LABEL_PREFIX__ defined to "_".
-
-Cairo already has some code to cope with __USER_LABEL_PREFIX__, but
-this code isn't completely correct: it prepends both assembly symbols
-and C symbols with __USER_LABEL_PREFIX__, which cannot work.
-
-This patch fixes that by using the existing slim_hidden_asmname() to
-define assembly symbols, and introduce a new slim_hidden_realname()
-for C symbols.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/cairo-compiler-private.h
-===================================================================
---- a/src/cairo-compiler-private.h
-+++ b/src/cairo-compiler-private.h
-@@ -93,12 +93,13 @@
- 	__asm__ (slim_hidden_asmname (internal))
- # define slim_hidden_def1(name, internal)				\
-   extern __typeof (name) EXT_##name __asm__(slim_hidden_asmname(name))	\
--	__attribute__((__alias__(slim_hidden_asmname(internal))))
-+	__attribute__((__alias__(slim_hidden_realname(internal))))
- # define slim_hidden_ulp		slim_hidden_ulp1(__USER_LABEL_PREFIX__)
- # define slim_hidden_ulp1(x)		slim_hidden_ulp2(x)
- # define slim_hidden_ulp2(x)		#x
- # define slim_hidden_asmname(name)	slim_hidden_asmname1(name)
- # define slim_hidden_asmname1(name)	slim_hidden_ulp #name
-+# define slim_hidden_realname(name)     #name
- #else
- # define slim_hidden_proto(name)		int _cairo_dummy_prototype(void)
- # define slim_hidden_proto_no_warn(name)	int _cairo_dummy_prototype(void)
-Index: b/util/cairo-script/cairo-script-private.h
-===================================================================
---- a/util/cairo-script/cairo-script-private.h
-+++ b/util/cairo-script/cairo-script-private.h
-@@ -109,12 +109,13 @@
- 	__asm__ (slim_hidden_asmname (internal))
- # define slim_hidden_def1(name, internal)				\
-   extern __typeof (name) EXT_##name __asm__(slim_hidden_asmname(name))	\
--	__attribute__((__alias__(slim_hidden_asmname(internal))))
-+	__attribute__((__alias__(slim_hidden_realname(internal))))
- # define slim_hidden_ulp		slim_hidden_ulp1(__USER_LABEL_PREFIX__)
- # define slim_hidden_ulp1(x)		slim_hidden_ulp2(x)
- # define slim_hidden_ulp2(x)		#x
- # define slim_hidden_asmname(name)	slim_hidden_asmname1(name)
- # define slim_hidden_asmname1(name)	slim_hidden_ulp #name
-+# define slim_hidden_realname(name)     #name
- #else
- # define slim_hidden_proto(name)		int _csi_dummy_prototype(void)
- # define slim_hidden_proto_no_warn(name)	int _csi_dummy_prototype(void)
diff --git a/package/cairo/0003-fix-nofork-build.patch b/package/cairo/0001-fix-nofork-build.patch
similarity index 100%
rename from package/cairo/0003-fix-nofork-build.patch
rename to package/cairo/0001-fix-nofork-build.patch
diff --git a/package/cairo/0005-fix-gcc-49-build.patch b/package/cairo/0002-fix-gcc-49-build.patch
similarity index 100%
rename from package/cairo/0005-fix-gcc-49-build.patch
rename to package/cairo/0002-fix-gcc-49-build.patch
