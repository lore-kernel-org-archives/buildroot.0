From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:38 +0200
Subject: [Buildroot] [PATCH 27/83 v2] docs/manual: use 'menuconfig' when
	there are more than 5 sub-options
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <d75b46793f57c9275a179b6adb27b38ed895f72a.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a package has a lot of sub-options, the layout in menuconfig (the
mconf UI) is quickly getting messy.

Using 'menuconfig' (the kconfig keyword) will automatically create a
sub-menu, which provides a cleaner layout.

Document that, with 5 or more options, a 'menuconfig' should be used
instead of a simple 'config'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note: 5 is arbitrary. We could tweak it to a bit more, but on small
terminals (the smallest supported is 80x24), there are only 10 lines
for the menu entries, so 5 looks like a good compromise. YMMV.

---
Changes RFC -> v1:
  - wrap example at 72-chars  (Arnout)
---
 docs/manual/adding-packages-directory.txt | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 0ff9eda..25f9cfc 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -79,6 +79,34 @@ The sub-options will be cleanly indented below the main symbol when it
 is enabled, and will be properly hidden when the symbol is disabled.
 
 
+If your package has 5 or more options, then you should use +menuconfig+
+to define the main symbol; this will ensure that all the package's
+sub-options are automaticaly classified in a sub-menu:
+
+---------------------------
+menuconfig BR2_PACKAGE_LIBFOO
+	bool "libfoo"
+	help
+	  This is a comment that explains what libfoo is.
+
+	  http://foosoftware.org/libfoo/
+
+if BR2_PACKAGE_LIBFOO
+
+config BR2_PACKAGE_LIBFOO_BAR
+	bool "bar support"
+	help
+	  This is a comment that briefly explains what bar support is,
+	  if it's not obvious.
+
+endif # BR2_PACKAGE_LIBFOO
+---------------------------
+
+In any case, ensure that there is no +comment+ or other symbol in-between
+the main symbol (be it +config+ or +menuconfig+) and the +if+ clause,
+otherwise 'Kconfig' will not properly classify the sub-options.
+
+
 Finally you have to add your new +libfoo/Config.in+ to
 +package/Config.in+ (or in a category subdirectory if you decided to
 put your package in one of the existing categories). The files
-- 
2.7.4
