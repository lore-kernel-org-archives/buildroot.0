From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 19:20:58 +0200
Subject: [Buildroot] [git commit] manual: add virtual package tutorial
Message-ID: <20140405172338.D5BEC9C5BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7862abad78934ed2a75cea6305163b4ae092b966
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The manual now features a new section with instructions about how to add a
virtual package.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
[yann.morin.1998 at free.fr: move down statement about provider's .mk]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-virtual.txt |   99 +++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt         |    2 +
 2 files changed, 101 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-virtual.txt b/docs/manual/adding-packages-virtual.txt
new file mode 100644
index 0000000..76f5794
--- /dev/null
+++ b/docs/manual/adding-packages-virtual.txt
@@ -0,0 +1,99 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[virtual-package-tutorial]]
+
+Virtual package tutorial
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+In Buildroot, a virtual package is a package whose functionalities are
+provided by one or more packages, referred to as 'providers'. The virtual
+package management is an extensible mechanism allowing the user to choose
+the provider used in the rootfs.
+
+For example, 'OpenGL ES' is an API for 2D and 3D graphics on embedded systems.
+The implementation of this API is different for the 'Allwinner Tech Sunxi' and
+the 'Texas Instruments OMAP35xx' plaftorms. So +libgles+ will be a virtual
+package and +sunxi-mali+ and +ti-gfx+ will be the providers.
+
+In the following example, we will explain how to add a new virtual package
+('something-virtual') and a provider for it ('some-provider').
+
+First, let's create the virtual package.
+
+Virtual package's +Config.in+ file
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The +Config.in+ file of virtual package 'something-virtual' should contain:
+
+---------------------------
+01: config BR2_PACKAGE_HAS_SOMETHING_VIRTUAL
+02:	bool
+03:
+04: config BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL
+05:	depends on BR2_PACKAGE_HAS_SOMETHING_VIRTUAL
+06:	string
+---------------------------
+
+In this file, we declare two options, +BR2_PACKAGE_HAS_SOMETHING_VIRTUAL+ and
++BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL+, whose values will be used by the
+providers.
+
+Virtual package's +*.mk+ file
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The Makefile +package/something-virtual/something-virtual.mk+ should contain:
+
+---------------------------
+01: ################################################################################
+02: #
+03: # something-virtual
+04: #
+05: ################################################################################
+06:
+07: SOMETHING_VIRTUAL_SOURCE =
+08: SOMETHING_VIRTUAL_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL))
+09:
+10: ifeq ($(BR2_PACKAGE_HAS_SOMETHING_VIRTUAL),y)
+11: ifeq ($(SOMETHING_VIRTUAL_DEPENDENCIES),)
+12: $(error No something-virtual implementation selected. Configuration error.)
+13: endif
+14: endif
+15:
+16: $(eval $(generic-package))
+---------------------------
+
+The Makefile is quite small as it will only check if a provider for the
+virtual package has been selected.
+
+Provider's +Config.in+ file
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+When adding a package as a provider, only the +Config.in+ file requires some
+modifications. The +*.mk+ file should follow the Buildroot infrastructure with
+no change at all.
+
+The +Config.in+ file of the package 'some-provider', which provides the
+functionalities of 'something-virtual', should contain:
+
+---------------------------
+01: config BR2_PACKAGE_SOME_PROVIDER
+02:	bool "some-provider"
+03:	select BR2_PACKAGE_HAS_SOMETHING_VIRTUAL
+04:	help
+05:	  This is a comment that explains what some-provider is.
+06:
+07:	  http://foosoftware.org/some-provider/
+08:
+09: if BR2_PACKAGE_SOME_PROVIDER
+10: config BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL
+11:	default "some-provider"
+12: endif
+---------------------------
+
+On line 3, we select +BR2_PACKAGE_HAS_SOMETHING_VIRTUAL+, and on line 11, we
+set the value of +BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL+ to the name of the
+provider, but only if it is selected.
+
+Of course, do not forget to add the proper build and runtime dependencies for
+this package!
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index 745e33a..dbba930 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -24,6 +24,8 @@ include::adding-packages-luarocks.txt[]
 
 include::adding-packages-perl.txt[]
 
+include::adding-packages-virtual.txt[]
+
 include::adding-packages-hooks.txt[]
 
 include::adding-packages-gettext.txt[]
