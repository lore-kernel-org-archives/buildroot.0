From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] documentation: Update to
	explain how board support works
Message-ID: <20101217160158.3B9D28E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9460079914db580c5435a74c50c8b01d46312fc1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |  117 ++++++++++++++++-----------------------------------
 1 files changed, 36 insertions(+), 81 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 8293c8f..9d6e835 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -578,87 +578,42 @@ $(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
 
     <h2 id="board_support"> Creating your own board support</h2>
 
-    <p>Creating your own board support in Buildroot allows you to have
-    a convenient place to store your project's target filesystem skeleton
-    and configuration files for Buildroot, Busybox, uClibc, and the kernel.
-
-    <p>Follow these steps to integrate your board in Buildroot:</p>
-
-    <ol>
-      <li>Create a new directory in <code>target/device/</code> named
-      after your company or organization</li>
-
-      <li>Add a line <code>source
-      "target/device/yourcompany/Config.in"</code> in
-      <code>target/device/Config.in</code> so that your board appears
-      in the configuration system</li>
-
-      <li>In <code>target/device/yourcompany/</code>, create a
-      directory for your project. This way, you'll be able to store
-      several of your company's projects inside Buildroot.</li>
-
-      <li>Create a <code>target/device/yourcompany/Config.in</code>
-      file that looks like the following:
-
-<pre>
-menuconfig BR2_TARGET_COMPANY
-	bool "Company projects"
-
-if BR2_TARGET_COMPANY
-
-config BR2_TARGET_COMPANY_PROJECT_FOOBAR
-	bool "Support for Company project Foobar"
-	help
-	  This option enables support for Company project Foobar
-
-endif
-</pre>
-
-      Of course, you should customize the different values to match your
-      company/organization and your project. This file will create a
-      menu entry that contains the different projects of your
-      company/organization.</li>
-
-      <li>Create a <code>target/device/yourcompany/Makefile.in</code>
-      file that looks like the following:
-
-<pre>
-ifeq ($(BR2_TARGET_COMPANY_PROJECT_FOOBAR),y)
-include target/device/yourcompany/project-foobar/Makefile.in
-endif
-</pre>
-
-      </li>
-
-      <li>Create the
-      <code>target/device/yourcompany/project-foobar/Makefile.in</code>
-      file. It is recommended that you define a
-      <code>BOARD_PATH</code> variable set to
-      <code>target/device/yourcompany/project-foobar</code> as it
-      will simplify further definitions. Then, the file might define
-      one or more of the following variables:
-        <ul>
-          <li><code>TARGET_SKELETON</code> to a directory that contains
-          the target skeleton for your project. If this variable is
-          defined, this target skeleton will be used instead of the
-          default one. If defined, the convention is to define it to
-          <code>$(BOARD_PATH)/target_skeleton</code> so that the target
-          skeleton is stored in the board specific directory.</li>
-        </ul>
-      </li>
-
-      <li>In the
-      <code>target/device/yourcompany/project-foobar/</code>
-      directory you can store configuration files for the kernel,
-      Busybox or uClibc.
-
-      You can furthermore create one or more preconfigured configuration
-      files, referencing those files. These config files are named
-      <code>something_defconfig</code> and are stored in the toplevel
-      <code>configs/</code> directory. Your users will then be able
-      to run <code>make something_defconfig</code> and get the right
-      configuration for your project</li>
-    </ol>
+    <p>Creating your own board support in Buildroot allows users of a
+    particular hardware platform to easily build a system that is
+    known to work.</p>
+
+    <p>To do so, you need to create a normal Buildroot configuration
+    that builds a basic system for the hardware: toolchain, kernel,
+    bootloader, filesystem and a simple Busybox-only userspace. No
+    specific package should be selected: the configuration should be
+    as minimal as possible, and should only build a working basic
+    Busybox system for the target platform. You can of course use more
+    complicated configurations for your internal projects, but the
+    Buildroot project will only integrate basic board
+    configurations. This is because package selections are highly
+    application-specific.</p>
+
+    <p>Once you have a known working configuration, run <code>make
+    savedefconfig</code>. This will generate a
+    minimal <code>defconfig</code> file at the root of the Buildroot
+    source tree. Move this file into the <code>configs/</code>
+    directory, and rename it <code>MYBOARD_defconfig</code>.</p>
+
+    <p>It is recommended to use as much as possible upstream versions
+    of the Linux kernel and bootloaders, and to use as much as
+    possible default kernel and bootloader configurations. If they are
+    incorrect for your platform, we encourage you to send fixes to the
+    corresponding upstream projects.</p>
+
+    <p>However, in the mean time, you may want to store kernel or
+    bootloader configuration or patches specific to your target
+    platform. To do so, create a
+    directory <code>board/MANUFACTURER</code> and a
+    subdirectory <code>board/MANUFACTURER/BOARDNAME</code> (after
+    replacing, of course, MANUFACTURER and BOARDNAME with the
+    appropriate values, in lower case letters). You can then store
+    your patches and configurations in these directories, and
+    reference them from the main Buildroot configuration.</p>
 
     <h2 id="using_toolchain">Using the generated toolchain outside Buildroot</h2>
 
-- 
1.7.2.2
