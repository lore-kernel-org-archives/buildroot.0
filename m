From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 18 Sep 2014 21:39:24 +0200
Subject: [Buildroot] [PATCH 01 of 13] manual: move 'Creating your own board
 support' from User to Developer guide
In-Reply-To: <patchbomb.1411069163@localhost>
References: <patchbomb.1411069163@localhost>
Message-ID: <2bb6dc67d3355451ba41.1411069164@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Section 'Creating your own board support' is seemingly written in the
mindset of adding support for public boards. Therefore, it is more suited in
the Developer guide, rather than in the User guide.
Adding support for custom non-public boards falls under the
'Project-specific customizations' category and will be described in that
section.

This patch moves the unchanged text into a separate file, included from the
Developer guide. The next patch will make some minor changes to the text
itself.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-board-support.txt |  37 ++++++++++++++++++++++++++++
 docs/manual/customize-store.txt      |  36 ---------------------------
 docs/manual/manual.txt               |   2 +
 3 files changed, 39 insertions(+), 36 deletions(-)

diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
new file mode 100644
--- /dev/null
+++ b/docs/manual/adding-board-support.txt
@@ -0,0 +1,37 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[customize-store-board-support]]
+== Creating your own board support
+
+Creating your own board support in Buildroot allows users of a
+particular hardware platform to easily build a system that is known to
+work.
+
+To do so, you need to create a normal Buildroot configuration that
+builds a basic system for the hardware: toolchain, kernel, bootloader,
+filesystem and a simple BusyBox-only userspace. No specific package
+should be selected: the configuration should be as minimal as
+possible, and should only build a working basic BusyBox system for the
+target platform. You can of course use more complicated configurations
+for your internal projects, but the Buildroot project will only
+integrate basic board configurations. This is because package
+selections are highly application-specific.
+
+Once you have a known working configuration, run +make
+savedefconfig+. This will generate a minimal +defconfig+ file at the
+root of the Buildroot source tree. Move this file into the +configs/+
+directory, and rename it +<boardname>_defconfig+.
+
+It is recommended to use as much as possible upstream versions of the
+Linux kernel and bootloaders, and to use as much as possible default
+kernel and bootloader configurations. If they are incorrect for your
+board, or no default exists, we encourage you to send fixes to the
+corresponding upstream projects.
+
+However, in the mean time, you may want to store kernel or bootloader
+configuration or patches specific to your target platform. To do so,
+create a directory +board/<manufacturer>+ and a subdirectory
++board/<manufacturer>/<boardname>+. You can then store your patches
+and configurations in these directories, and reference them from the main
+Buildroot configuration.
diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -66,42 +66,6 @@
   file manually to +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+.
 
 
-[[customize-store-board-support]]
-=== Creating your own board support
-
-Creating your own board support in Buildroot allows users of a
-particular hardware platform to easily build a system that is known to
-work.
-
-To do so, you need to create a normal Buildroot configuration that
-builds a basic system for the hardware: toolchain, kernel, bootloader,
-filesystem and a simple BusyBox-only userspace. No specific package
-should be selected: the configuration should be as minimal as
-possible, and should only build a working basic BusyBox system for the
-target platform. You can of course use more complicated configurations
-for your internal projects, but the Buildroot project will only
-integrate basic board configurations. This is because package
-selections are highly application-specific.
-
-Once you have a known working configuration, run +make
-savedefconfig+. This will generate a minimal +defconfig+ file at the
-root of the Buildroot source tree. Move this file into the +configs/+
-directory, and rename it +<boardname>_defconfig+.
-
-It is recommended to use as much as possible upstream versions of the
-Linux kernel and bootloaders, and to use as much as possible default
-kernel and bootloader configurations. If they are incorrect for your
-board, or no default exists, we encourage you to send fixes to the
-corresponding upstream projects.
-
-However, in the mean time, you may want to store kernel or bootloader
-configuration or patches specific to your target platform. To do so,
-create a directory +board/<manufacturer>+ and a subdirectory
-+board/<manufacturer>/<boardname>+. You can then store your patches
-and configurations in these directories, and reference them from the main
-Buildroot configuration.
-
-
 === Step-by-step instructions for storing configuration
 
 To store the configuration for a specific product, device or
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -52,6 +52,8 @@
 
 include::writing-rules.txt[]
 
+include::adding-board-support.txt[]
+
 include::adding-packages.txt[]
 
 include::patch-policy.txt[]
