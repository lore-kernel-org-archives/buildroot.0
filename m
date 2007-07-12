From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 12 Jul 2007 07:43:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070712144345.D4FC5A6827@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-12 07:43:44 -0700 (Thu, 12 Jul 2007)
New Revision: 19071

Log:
Update Documentation for BSP patch

Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-07-12 13:11:03 UTC (rev 19070)
+++ trunk/buildroot/docs/buildroot.html	2007-07-12 14:43:44 UTC (rev 19071)
@@ -145,10 +145,15 @@
     <p>For each entry of the configuration tool, you can find associated help
     that describes the purpose of the entry.</p>
 
+    <p>One of the key configuration items is the <code>PROJECT</code> which
+    determines where some board specific packages are built and where the
+    results are stored.</p>
+
     <p>Once everything is configured, the configuration tool has generated a
     <code>.config</code> file that contains the description of your
     configuration. It will be used by the Makefiles to do what's needed.</p>
 
+
     <p>Let's go:</p>
 
 <pre>
@@ -160,7 +165,7 @@
     be named <code>root_fs_ARCH.EXT</code> where <code>ARCH</code> is your
     architecture and <code>EXT</code> depends on the type of target filesystem
     selected in the <code>Target options</code> section of the configuration
-    tool.</p>
+    tool.The file is stored in the "binaries/<code>$(PROJECT)</code>/" directory</p>
 
     <p>If you intend to do an offline-build and just want to download all
     sources that you previously selected in &quot;make menuconfig&quot; then
@@ -198,11 +203,11 @@
     <h2><a name="custom_targetfs" id="custom_targetfs"></a>Customizing the
     target filesystem</h2>
 
-    <p>There are two ways to customize the resulting target filesystem:</p>
+    <p>There are a few ways to customize the resulting target filesystem:</p>
 
     <ul>
       <li>Customize the target filesystem directly, and rebuild the image. The
-      target filesystem is available under <code>build_ARCH/root/</code> where
+      target filesystem is available under <code>project_build_ARCH/root/</code> where
       <code>ARCH</code> is the chosen target architecture. You can simply make
       your changes here, and run make afterwards, which will rebuild the target
       filesystem image. This method allows to do everything on the target
@@ -224,9 +229,13 @@
       it should be changed. These main directories are in an tarball inside of
       inside the skeleton because it contains symlinks that would be broken
       otherwise.<br />
-      These customizations are deployed into <code>build_ARCH/root/</code> just
+      These customizations are deployed into <code>project_build_ARCH/root/</code> just
       before the actual image is made. So simply rebuilding the image by running
       make should propogate any new changes to the image.</li>
+
+      <li>When configuring the build system, using <code>make menuconfig</code>, you
+      can specify the contents of the /etc/hostname and /etc/issue
+      (the welcome banner) in the <code>PROJECT</code> section</li>
     </ul>
 
     <h2><a name="custom_busybox" id="custom_busybox"></a>Customizing the
@@ -349,10 +358,30 @@
       tarballs are in this directory because it may be useful to save them
       somewhere to avoid further downloads.</li>
 
-      <li>Create the build directory (<code>build_ARCH/</code> by default,
+      <li>Create the shared build directory (<code>build_ARCH/</code> by default,
       where <code>ARCH</code> is your architecture). This is where all
-      user-space tools while be compiled.</li>
+      non configurable user-space tools will be compiled.When building two or more
+      targets using the same architecture, the first build will go through the full 
+      download, configure, make process, but the second and later builds will only 
+      copy the result from the first build to its project specific target directory
+      significantly speeding up the build process</li>
 
+      <li>Create the project specific build directory 
+      (<code>project_build_ARCH/$(PROJECT)</code> by default, where <code>ARCH</code> 
+      is your architecture). This is where all configurable user-space tools will be 
+      compiled. The project specific build directory is neccessary, if two different
+      targets needs to use a specific package, but the packages have different 
+      configuration for both targets. Some examples of packages built in this directory
+      are busybox and linux.
+      </li>
+
+      <li>Create the project specific result directory 
+      (<code>binaries/$(PROJECT)</code> by default, where <code>ARCH</code> 
+      is your architecture). This is where the root file system images are stored,
+      It is also used to store the linux kernel image and any utilities, boot-loaders
+      etc. needed for a target.
+      </li>
+
       <li>Create the toolchain build directory
       (<code>toolchain_build_ARCH/</code> by default, where <code>ARCH</code>
       is your architecture). This is where the cross compilation toolchain will
@@ -367,7 +396,7 @@
       setup this staging directory, it first removes it, and then it creates
       various subdirectories and symlinks inside it.</li>
 
-      <li>Create the target directory (<code>build_ARCH/root/</code> by
+      <li>Create the target directory (<code>project_build_ARCH/root/</code> by
       default) and the target filesystem skeleton. This directory will contain
       the final root filesystem. To setup it up, it first deletes it, then it
       uncompress the <code>target/generic/skel.tar.gz</code> file to create the
