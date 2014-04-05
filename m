From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 17:21:47 +0200
Subject: [Buildroot] [PATCH 10/21] manual: add notes about depending on a
	virtual package
In-Reply-To: <cover.1396711074.git.yann.morin.1998@free.fr>
References: <cover.1396711074.git.yann.morin.1998@free.fr>
Message-ID: <78e160f333f72759c0c3c30a7957cfdc29856587.1396711074.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-virtual.txt | 49 +++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/docs/manual/adding-packages-virtual.txt b/docs/manual/adding-packages-virtual.txt
index e8820a0..c1b5a0a 100644
--- a/docs/manual/adding-packages-virtual.txt
+++ b/docs/manual/adding-packages-virtual.txt
@@ -91,3 +91,52 @@ provider, but only if it is selected.
 
 Of course, do not forget to add the proper build and runtime dependencies for
 this package!
+
+Notes on depending on a virtual package
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+When adding a package that requires a certain +FEATURE+ provided by a virtual
+package, you have to use +depends on BR2_PACKAGE_HAS_FEATURE+, like so:
+
+---------------------------
+config BR2_PACKAGE_HAS_FEATURE
+    bool
+
+config BR2_PACKAGE_FOO
+    bool "foo"
+    depends on BR2_PACKAGE_HAS_FEATURE
+---------------------------
+
+Notes on depending on a specific provider
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+If your package really requires a specific provider, then you'll have to
+make your package +depends on+ this provider; you can _not_ +select+ a
+provider.
+
+Let's take an example with two providers for a +FEATURE+:
+
+---------------------------
+config BR2_PACKAGE_HAS_FEATURE
+    bool
+
+config BR2_PACKAGE_FOO
+    bool "foo"
+    select BR2_PACKAGE_HAS_FEATURE
+
+config BR2_PACKAGE_BAR
+    bool "bar"
+    select BR2_PACKAGE_HAS_FEATURE
+---------------------------
+
+And you are adding a package that needs +FEATURE+ as provided by +foo+,
+but not as provided by +bar+.
+
+If you were to use +select BR2_PACKAGE_FOO+, then the user would still
+be able to select +BR2_PACKAGE_BAR+ in the menuconfig. This would create
+a configuration inconsistency, whereby two providers of the same +FEATURE+
+would be enabled at once, one explicitly set by the user, the other
+implicitly by your +select+.
+
+Instead, you have to use +depends on BR2_PACKAGE_FOO+, which avoids any
+implicit configuration inconsistency.
-- 
1.8.3.2
