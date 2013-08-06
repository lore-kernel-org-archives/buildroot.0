From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  6 Aug 2013 10:47:24 +0200
Subject: [Buildroot] [PATCH] cairo: add patch to fix Blackfin build failure
Message-ID: <1375778844-28325-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/1b1/1b1e4ad2f00de1e0d1cc9045822751c3882c7493/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cairo/cairo-001-blackfin-build-fix.patch | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/cairo/cairo-001-blackfin-build-fix.patch

diff --git a/package/cairo/cairo-001-blackfin-build-fix.patch b/package/cairo/cairo-001-blackfin-build-fix.patch
new file mode 100644
index 0000000..94dff6b
--- /dev/null
+++ b/package/cairo/cairo-001-blackfin-build-fix.patch
@@ -0,0 +1,36 @@
+Fix build on platforms where __USER_LABEL_PREFIX__ is not empty
+
+On most platforms, a C language symbol and its assembly equivalent are
+identical. However, on the Blackfin architecture, this isn't the case,
+the corresponding C language symbol in assembly is prepended with a
+"_". Blackfin therefore has __USER_LABEL_PREFIX__ defined to "_".
+
+Cairo already has some code to cope with __USER_LABEL_PREFIX__, but
+this code isn't completely correct: it prepends both assembly symbols
+and C symbols with __USER_LABEL_PREFIX__, which cannot work.
+
+This patch fixes that by using the existing slim_hidden_asmname() to
+define assembly symbols, and introduce a new slim_hidden_realname()
+for C symbols.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/cairo-compiler-private.h
+===================================================================
+--- a/src/cairo-compiler-private.h
++++ b/src/cairo-compiler-private.h
+@@ -93,12 +93,13 @@
+ 	__asm__ (slim_hidden_asmname (internal))
+ # define slim_hidden_def1(name, internal)				\
+   extern __typeof (name) EXT_##name __asm__(slim_hidden_asmname(name))	\
+-	__attribute__((__alias__(slim_hidden_asmname(internal))))
++	__attribute__((__alias__(slim_hidden_realname(internal))))
+ # define slim_hidden_ulp		slim_hidden_ulp1(__USER_LABEL_PREFIX__)
+ # define slim_hidden_ulp1(x)		slim_hidden_ulp2(x)
+ # define slim_hidden_ulp2(x)		#x
+ # define slim_hidden_asmname(name)	slim_hidden_asmname1(name)
+ # define slim_hidden_asmname1(name)	slim_hidden_ulp #name
++# define slim_hidden_realname(name)     #name
+ #else
+ # define slim_hidden_proto(name)		int _cairo_dummy_prototype(void)
+ # define slim_hidden_proto_no_warn(name)	int _cairo_dummy_prototype(void)
-- 
1.8.1.2
