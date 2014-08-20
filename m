From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 20 Aug 2014 21:39:52 +0200
Subject: [Buildroot] [PATCH 1 of 3 for 2014.08] manual/user guide: rework
 'Configuration of other components' chapter
In-Reply-To: <patchbomb.1408563591@localhost>
References: <patchbomb.1408563591@localhost>
Message-ID: <d153753f7878b594d288.1408563592@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch reworks the chapter 'Configuration of other components' as
follows:
- remove separate customize-xxx-config.txt files in favor of one shared file
  configure-other-componenents.txt
- use labeled list instead of separate sections, as the information in each
  section is limited.
- simplify instructions for busybox/uclibc thanks to the kconfig-package
  infrastructure
- rewrite instructions for Linux
- add instructions for Barebox

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/configure-other-components.txt |  52 ++++++++++++++++++++++
 docs/manual/configure.txt                  |   9 ---
 docs/manual/customize-busybox-config.txt   |  26 -----------
 docs/manual/customize-kernel-config.txt    |  15 ------
 docs/manual/customize-uclibc-config.txt    |  33 -------------
 docs/manual/working-with.txt               |   2 +
 6 files changed, 54 insertions(+), 83 deletions(-)

diff --git a/docs/manual/configure-other-components.txt b/docs/manual/configure-other-components.txt
new file mode 100644
--- /dev/null
+++ b/docs/manual/configure-other-components.txt
@@ -0,0 +1,52 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+== Configuration of other components
+
+Before attempting to modify any of the components below, make sure you
+have already configured Buildroot itself, and have enabled the
+corresponding package.
+
+BusyBox::
++
+If you already have a BusyBox configuration file, you can directly
+specify this file in the Buildroot configuration, using
++BR2_PACKAGE_BUSYBOX_CONFIG+. Otherwise, Buildroot will start from a
+default BusyBox configuration file.
++
+To make subsequent changes to the configuration, use +make
+busybox-menuconfig+ to open the BusyBox configuration editor.
++
+It is also possible to specify a BusyBox configuration file through an
+environment variable, although this is not recommended. Refer to
+xref:env-vars[] for more details.
+
+uClibc::
++
+Configuration of uClibc is done in the same way as for BusyBox.  The
+configuration variable to specify an existing configuration file is
++BR2_UCLIBC_CONFIG+. The command to make subsequent changes is +make
+uclibc-menuconfig+.
+
+Linux kernel::
++
+If you already have a kernel configuration file, you can directly
+specify this file in the Buildroot configuration, using
++BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG+.
++
+If you do not yet have a kernel configuration file, you can either start
+by specifying a defconfig in the Buildroot configuration, using
++BR2_LINUX_KERNEL_USE_DEFCONFIG+, or start by creating an empty file and
+specifying it as custom configuration file, using
++BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG+.
++
+To make subsequent changes to the configuration, use +make
+linux-menuconfig+ to open the Linux configuration editor.
+
+Barebox::
++
+Configuration of Barebox is done in the same way as for the Linux
+kernel. The corresponding configuration variables are
++BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG+ and
++BR2_TARGET_BAREBOX_USE_DEFCONFIG+. To open the configuration editor,
+use +make barebox-menuconfig+.
diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -384,12 +384,3 @@
 The solution recommended by Buildroot developers is to use the
 *BusyBox init* as it is sufficient for most embedded
 systems. *systemd* can be used for more complex situations.
-
-== Configuration of other components
-
-include::customize-busybox-config.txt[]
-
-include::customize-uclibc-config.txt[]
-
-include::customize-kernel-config.txt[]
-
diff --git a/docs/manual/customize-busybox-config.txt b/docs/manual/customize-busybox-config.txt
deleted file mode 100644
--- a/docs/manual/customize-busybox-config.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-// -*- mode:doc; -*-
-// vim: set syntax=asciidoc:
-
-[[busybox-custom]]
-=== Customizing the BusyBox configuration
-
-http://www.busybox.net/[BusyBox] is very configurable, and you may
-want to customize it. You can follow these simple steps to do so. This
-method isn't optimal, but it's simple, and it works:
-
-* Do an initial compilation of Buildroot, with busybox, without
-  trying to customize it.
-
-* Invoke +make busybox-menuconfig+.
-  The nice configuration tool appears, and you can
-  customize everything.
-
-* Run the compilation of Buildroot again.
-
-Otherwise, you can simply change the
-+package/busybox/busybox-<version>.config+ file, if you know the
-options you want to change, without using the configuration tool.
-
-If you want to use an existing config file for busybox, then see
-xref:env-vars[].
-
diff --git a/docs/manual/customize-kernel-config.txt b/docs/manual/customize-kernel-config.txt
deleted file mode 100644
--- a/docs/manual/customize-kernel-config.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-// -*- mode:doc; -*-
-// vim: set syntax=asciidoc:
-
-[[kernel-custom]]
-=== Customizing the Linux kernel configuration
-
-The Linux kernel configuration can be customized just like
-xref:busybox-custom[BusyBox] and xref:uclibc-custom[uClibc] using
-+make linux-menuconfig+. Make sure you have enabled the kernel build
-in +make menuconfig+ first. Once done, run +make+ to (re)build
-everything.
-
-If you want to use an existing config file for Linux, then see
-xref:env-vars[].
-
diff --git a/docs/manual/customize-uclibc-config.txt b/docs/manual/customize-uclibc-config.txt
deleted file mode 100644
--- a/docs/manual/customize-uclibc-config.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-// -*- mode:doc; -*-
-// vim: set syntax=asciidoc:
-
-[[uclibc-custom]]
-=== Customizing the uClibc configuration
-
-Just like xref:busybox-custom[BusyBox], http://www.uclibc.org/[uClibc]
-offers a lot of configuration options. They allow you to select
-various functionalities depending on your needs and limitations.
-
-The easiest way to modify the configuration of uClibc is to
-follow these steps:
-
-* Do an initial compilation of Buildroot without trying to customize
-  uClibc.
-
-* Invoke +make uclibc-menuconfig+. The nice configuration assistant,
-  similar to the one used in the Linux kernel or Buildroot,
-  appears. Make your configuration changes as appropriate.
-
-* Copy the +$(O)/build/uClibc-VERSION/.config+ file to a different
-  place (e.g. +board/MANUFACTURER/BOARDNAME/uClibc.config+) and adjust
-  the uClibc configuration file option +BR2_UCLIBC_CONFIG+ to refer to this
-  configuration instead of the default one.
-
-* Run the compilation of Buildroot again.
-
-Otherwise, you can simply change +package/uclibc/uClibc-VERSION.config+,
-without running the configuration assistant.
-
-If you want to use an existing config file for uClibc, then see
-xref:env-vars[].
-
diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
--- a/docs/manual/working-with.txt
+++ b/docs/manual/working-with.txt
@@ -6,6 +6,8 @@
 
 include::configure.txt[]
 
+include::configure-other-components.txt[]
+
 include::common-usage.txt[]
 
 include::customize.txt[]
