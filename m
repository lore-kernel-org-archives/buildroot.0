From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 19:21:02 +0200
Subject: [Buildroot] [git commit] manual: add notes about depending on a
	virtual package
Message-ID: <20140405172338.F39639C5BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b245d469c61cb853b83cbf3b538ee8a20c194cf0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-virtual.txt |   49 +++++++++++++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)

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
