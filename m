From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 26 Jan 2009 20:26:16 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20090126202616.C64E277458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-26 20:26:16 +0000 (Mon, 26 Jan 2009)
New Revision: 25066

Log:
Update documentation with BUILDROOT_USE_XWINDOWS, & linux cleanup

Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2009-01-26 20:17:06 UTC (rev 25065)
+++ trunk/buildroot/docs/buildroot.html	2009-01-26 20:26:16 UTC (rev 25066)
@@ -247,6 +247,9 @@
     <li>HOSTCC</li>
     <li>UCLIBC_CONFIG_FILE=&lt;path/to/.config&gt;</li>
     <li>BUSYBOX_CONFIG_FILE=&lt;path/to/.config&gt;</li>
+    <li>BUILDROOT_DL_DIR</li>
+    <li>BUILDROOT_LOCAL</li>
+    <li>BUILDROOT_USE_XWINDOWS</li>
     </ul>
 
     <p>An example that uses config files located in the toplevel directory and
@@ -635,52 +638,22 @@
     conflicts, but will use unique build directories, where the user
     can configure the build. </p>
 
-    <p><b>THINGS TO DO</b></p>
-
+    <h2><a name="Linux" id="Linux"></a>Linux</h2>
     <ol>
 
-    <li>Linux</li>
 
-    <p>The current Linux implementation is flawed. It only works
-    if the user chooses to use one of the few kernels selected
-    as base for the kernel-headers. While the Makefile seems to have
-    hooks, allowing the developer to specify whatever version he/she
-    wants in the target/device/*/* Makefiles, the build will fail
-    if another kernel version is choosen.</p>
+     <p>The user can select from three different Linux strategies:
 
-    <p>The reason for this is that the kernel patches are not
-    applied by the <code>&quot;target/linux/linux.mk&quot;</code>
-    build script fragment. They are only applied by the
-    <code>&quot;toolchain/kernel-headers/*.makefile&quot;</code>
-    build script fragments</p>
-
-    <p>If the kernel-header version and the linux version differs,
-    there will be two <code>&quot;linux-2.6.X.Y&quot;</code>
-    directories in
-    <code>&quot;build_&lt;ARCH&gt;/&lt;&gt;&quot;</code>,
-    each with its own set of patches. </p>
-
-    <p>The solution in the works, is to move the build of Linux to
-    <code>&quot;project_build_&lt;ARCH&gt;/&lt;project name&gt;/linux-2.6.X.Y&quot;</code> combined with method to configure
-     which patches can be applied. Possibly, the linux source tree
-     used to generate the kernel headers will be moved to the
-     <code>&quot;toolchain_build_&lt;ARCH&gt;&quot;</code>
-     directory
-      </p>
-
-     <p>The user will be able to select from three different
-     Linux strategies:
-
      <ul>
-     <li>Conservative Strategy: Only use version ssupported by the kernel headers</li>
-     <li>Stable Linux Strategy: Allow any 2.6.X.Y combination.
+     <li>Legacy: Only use version supported by the kernel headers</li>
+     <li>Advanced: Allow any 2.6.X.Y combination.
 	(Minimum 2.6.19)</li>
      <li>Power-User Strategy: Allow
      <code>&quot;-git&quot;</code>, or
      <code>&quot;-mm&quot;</code>, or user downloadable kernels</li>
      </ul>
 
-     <p>The current kernel patches can be configured to be applied to the
+     <p>The current kernel patches can be applied to the
      linux source tree even if the version differs from the
      kernel header version. </p>
 
@@ -690,7 +663,7 @@
      proprietary kernel-patch or decide to not apply the kernel
      patches</p>
 
-     <p>Other optional patches will be <u>board specific</u> or
+     <p>There is also support for <u>board specific</u> and
      <u>architecture specific</u> patches. </p>
 
      <p>There will also be a way for the user to supply absolute
@@ -701,9 +674,27 @@
 
      <p>Maybe, there will also be a possibility to supply an
      <code>&quot;URL&quot;</code> to a patch available on Internet. </p>
+<pre>
+export BUILDROOT_USE_XWINDOWS &lt;&gt;
+</pre>
 
-     <li>Configurable packages</li>
+     <p>
+	If there is no linux config file available,
+	buildroot starts the linux configuration system, which
+	defaults to "make menuconfig". There is a menuoption
+	allowing you to use the less archaic "make  xconfig"
+	You can override any .config setting by defining
+	the BUILDROOT_USE_XWINDOWS environment variable.
+     </p>
 
+
+
+    </ol>
+
+    <h2><a name="Todo" id="Todo"></a>Todo</h2>
+    <ol>
+
+     <li>Configurable packages</li>
      <p>Many packages can, on top of the simple
      &quot;enable/disable build&quot;,
      be further configured using Kconfig.
