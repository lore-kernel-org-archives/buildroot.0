From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:50:24 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/ghostscript:
 security bump to version 9.52
Message-ID: <20200828164650.97BD6865E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93a9d8d127e210683237cec7ec9c3bda93cd42a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fix a bunch of CVEs: CVE-2020-16287, CVE-2020-16288, CVE-2020-16289,
CVE-2020-16290, CVE-2020-16291, CVE-2020-16292, CVE-2020-16293,
CVE-2020-16294, CVE-2020-16295, CVE-2020-16296, CVE-2020-16297,
CVE-2020-16298, CVE-2020-16299, CVE-2020-16300, CVE-2020-16301,
CVE-2020-16302, CVE-2020-16303, CVE-2020-16304, CVE-2020-16305
CVE-2020-16308, CVE-2020-16309, CVE-2020-17538

PKGCONFIG must be passed since version 9.51 and
https://github.com/ArtifexSoftware/ghostpdl/commit/2d84ecc57837785b566ebd9d5909ba9edc9d697f

Also drop patch (already in version) and update indentation in hash file
(two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e90c68e77534752f0b60d3fdfd710c9ceb7f40d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...900-Memory-Corruption-in-Ghostscript-9-52.patch | 54 ----------------------
 package/ghostscript/ghostscript.hash               |  6 +--
 package/ghostscript/ghostscript.mk                 |  8 ++--
 3 files changed, 6 insertions(+), 62 deletions(-)

diff --git a/package/ghostscript/0002-Bug-702582-CVE-2020-15900-Memory-Corruption-in-Ghostscript-9-52.patch b/package/ghostscript/0002-Bug-702582-CVE-2020-15900-Memory-Corruption-in-Ghostscript-9-52.patch
deleted file mode 100644
index 893b96c5be..0000000000
--- a/package/ghostscript/0002-Bug-702582-CVE-2020-15900-Memory-Corruption-in-Ghostscript-9-52.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 5d499272b95a6b890a1397e11d20937de000d31b Mon Sep 17 00:00:00 2001
-From: Ray Johnston <ray.johnston@artifex.com>
-Date: Wed, 22 Jul 2020 09:57:54 -0700
-Subject: [PATCH] Bug 702582, CVE 2020-15900 Memory Corruption in Ghostscript
- 9.52
-
-Fix the 'rsearch' calculation for the 'post' size to give the correct
-size.  Previous calculation would result in a size that was too large,
-and could underflow to max uint32_t. Also fix 'rsearch' to return the
-correct 'pre' string with empty string match.
-
-A future change may 'undefine' this undocumented, non-standard operator
-during initialization as we do with the many other non-standard internal
-PostScript operators and procedures.
-
-[Retrieved from:
-https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=5d499272b95a6b890a1397e11d20937de000d31b]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- psi/zstring.c | 17 +++++++++++------
- 1 file changed, 11 insertions(+), 6 deletions(-)
-
-diff --git a/psi/zstring.c b/psi/zstring.c
-index 33662dafa..58e1af2b3 100644
---- a/psi/zstring.c
-+++ b/psi/zstring.c
-@@ -142,13 +142,18 @@ search_impl(i_ctx_t *i_ctx_p, bool forward)
-     return 0;
- found:
-     op->tas.type_attrs = op1->tas.type_attrs;
--    op->value.bytes = ptr;
--    r_set_size(op, size);
-+    op->value.bytes = ptr;				/* match */
-+    op->tas.rsize = size;				/* match */
-     push(2);
--    op[-1] = *op1;
--    r_set_size(op - 1, ptr - op[-1].value.bytes);
--    op1->value.bytes = ptr + size;
--    r_set_size(op1, count + (!forward ? (size - 1) : 0));
-+    op[-1] = *op1;					/* pre */
-+    op[-3].value.bytes = ptr + size;			/* post */
-+    if (forward) {
-+        op[-1].tas.rsize = ptr - op[-1].value.bytes;	/* pre */
-+        op[-3].tas.rsize = count;			/* post */
-+    } else {
-+        op[-1].tas.rsize = count;			/* pre */
-+        op[-3].tas.rsize -= count + size;		/* post */
-+    }
-     make_true(op);
-     return 0;
- }
--- 
-2.17.1
-
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 51b3a2a094..d0b2e610df 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs950/SHA512SUMS
-sha512 3c1e5db519a427f4b6bfb8d93f3c3dfb67d5ec9ccd19c7afa7670deb768515f3fc617c5588e54934bbfbedfdf8609ce2ffa36dd7da3cb618937fe034f64f43ee  ghostscript-9.50.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs952/SHA512SUMS
+sha512  4c4a33884e1138bad553eee61fac1a72158297ad5c2ce46a4b36150848dea8158affaf2b902f4ff03e4f72ebc8154c198b618112624f409230a610b7648faa67  ghostscript-9.52.tar.xz
 
 # Hash for license file:
-sha256 6f852249f975287b3efd43a5883875e47fa9f3125e2f1b18b5c09517ac30ecf2  LICENSE
+sha256  6f852249f975287b3efd43a5883875e47fa9f3125e2f1b18b5c09517ac30ecf2  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index b334616853..4364eb944c 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 9.50
+GHOSTSCRIPT_VERSION = 9.52
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_LICENSE = AGPL-3.0
@@ -23,9 +23,6 @@ GHOSTSCRIPT_DEPENDENCIES = \
 	libpng \
 	tiff
 
-# 0002-Bug-702582-CVE-2020-15900-Memory-Corruption-in-Ghostscript-9-52.patch
-GHOSTSCRIPT_IGNORE_CVES += CVE-2020-15900
-
 # Ghostscript includes (old) copies of several libraries, delete them.
 # Inspired by linuxfromscratch:
 # http://www.linuxfromscratch.org/blfs/view/svn/pst/gs.html
@@ -37,7 +34,8 @@ GHOSTSCRIPT_POST_PATCH_HOOKS += GHOSTSCRIPT_REMOVE_LIBS
 
 GHOSTSCRIPT_CONF_ENV = \
 	CCAUX="$(HOSTCC)" \
-	CFLAGSAUX="$(HOST_CFLAGS) $(HOST_LDFLAGS)"
+	CFLAGSAUX="$(HOST_CFLAGS) $(HOST_LDFLAGS)" \
+	PKGCONFIG="$(PKG_CONFIG_HOST_BINARY)"
 
 GHOSTSCRIPT_CONF_OPTS = \
 	--disable-compile-inits \
