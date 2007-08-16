From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 16 Aug 2007 14:54:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070816215450.0C5C1A4680@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-16 14:54:48 -0700 (Thu, 16 Aug 2007)
New Revision: 19534

Log:
Add further documentation for BSP patch

Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-08-16 18:27:47 UTC (rev 19533)
+++ trunk/buildroot/docs/buildroot.html	2007-08-16 21:54:48 UTC (rev 19534)
@@ -345,14 +345,13 @@
     uClibc). </p>
 
     <p>There is basically one Makefile per software, and they are named with
-    the <code>.mk</code> extension. Makefiles are split into three
+    the <code>.mk</code> extension. Makefiles are split into four
     sections:</p>
 
     <ul>
-      <li><b>package</b> (in the <code>package/</code> directory) contains the
-      Makefiles and associated files for all user-space tools that Buildroot
-      can compile and add to the target root filesystem. There is one
-      sub-directory per tool. </li>
+      <li><b>project</b> (in the <code>project/</code> directory) contains
+      the Makefiles and associated files for all software related to the
+      building several root file systems in the same buildroot tree. </li>
 
       <li><b>toolchain</b> (in the <code>toolchain/</code> directory) contains
       the Makefiles and associated files for all software related to the
@@ -360,6 +359,11 @@
       <code>gcc</code>, <code>gdb</code>, <code>kernel-headers</code> and
       <code>uClibc</code>. </li>
 
+      <li><b>package</b> (in the <code>package/</code> directory) contains the
+      Makefiles and associated files for all user-space tools that Buildroot
+      can compile and add to the target root filesystem. There is one
+      sub-directory per tool. </li>
+
       <li><b>target</b> (in the <code>target</code> directory) contains the
       Makefiles and associated files for software related to the generation of
       the target root filesystem image. Four types of filesystems are supported
@@ -442,6 +446,271 @@
       TARGETS global variable. </li>
     </ol>
 
+    <h2><a name="multi_project" id="multi_project"></a>Building several
+      projects in the same buildroot source tree</h2>
+
+    <p><b>BACKGROUND</b></p>
+
+    <p>Buildroot has always supported building several projects in the same
+    tree if each project was for a different architecture. </p>
+
+    <p>The root file system has been created in the 
+    <code>&quot;build_&lt;ARCH&gt;/root&quot;</code>
+    directory which is unique for each architecture. 
+    Toolchains have been built in
+    <code>&quot;toolchain_build_&lt;ARCH&gt;&quot;</code>. </p>
+
+    <p> It the user wanted to build several root file systems for the same
+    architecture, a prefix or suffix could be added in the configuration file
+    so the root file system would be built in
+    <code>&quot;&lt;PREFIX&gt;_build_&lt;ARCH&gt;_&lt;SUFFIX&gt;/root&quot;</code>
+    By supplying <u>unique</u> combinations of 
+    <code>&quot;&lt;PREFIX&gt;&quot;</code> and
+    <code>&quot;&lt;SUFFIX&gt;&quot;</code>
+    each project would get a <u>unique</u> root file system tree. </p>
+
+    <p>The disadvantage of this approach is that a new toolchain was
+    built for each project,  adding considerable time to the build
+    process, even if it was two projects for the same chip. </p>
+
+    <p>This drawback has been somewhat lessened with 
+    <code>gcc-4.x.y</code> which allows buildroot to use an external 
+    toolchain. Certain packages requires special
+    features in the toolchain, and if an external toolchain is selected,
+    this may lack the neccessary features to complete the build of the root
+     file system.</p>
+
+    <p>A bigger problem was that the 
+    <code>&quot;build_&lt;ARCH&gt;&quot;</code> tree
+    was also duplicated, so each </code>package</code> would also
+    be rebuilt once per project, resulting in even longer build times.</p>
+
+
+    <p><b>PROJECT TO SHARE TOOLCHAIN AND PACKAGE BUILDS</b></p>
+
+    <p>Work has started on a project which will allow the user to build 
+    multiple root file systems for the same architecture in the same tree. 
+    The toolchain and the package build directory will be shared, but each
+    project will have a dedicated directory tree for project specific
+    builds. </p>
+
+    <p>With this approach, most, if not all packages will be compiled 
+    when the first project is built.
+    The process is almost identical to the original process.
+    Packages are downloaded and extracted to the shared 
+    <code>&quot;build_&lt;ARCH&gt;/&lt;package&gt;&quot;</code>
+    directory. They are configured and compiled. </p> 
+
+    <p>Package libraries and headers are installed in the shared $(STAGING_DIR),
+    and then the project specific root file system &quot;$(TARGET_DIR)&quot;
+    is populated. </p> 
+
+    <p>At the end of the build, the root file system will be used
+    to generate the resulting root file system binaries. </p>
+
+    <p>Once the first project has been built, building other projects will 
+    typically involve populating the new project's root file system directory
+    from the existing binaries generated in the shared 
+    <code>&quot;build_&lt;ARCH&gt;/&lt;&gt;&quot;</code> directory. </p>
+
+    <p>Only packages, not used by the first project, will have to go
+    through the normal extract-configure-compile flow. </p>
+
+    <p><b>IMPLEMENTATION</b></p>
+
+    <p>The core of the solution is the introduction
+    of two new directories: </p>
+
+    <ul>
+    <li><code>project_build_&lt;ARCH&gt;</code></li>
+
+    <li><code>binaries;</code></li>
+    </ul>
+
+    <p>Each of the directories contain one subdirectory per project. 
+    The name of the subdirectory is configured by the user in the 
+    normal buildroot configuration, using the value of: </p>
+
+    <p><code>Project Options ---> Project name</code></p>
+
+    <p>The configuration defines the $(PROJECT) variable.</p>
+
+    <p>The default project name is <code>&quot;uclibc&quot;</code>.</p>
+
+    <p><code>&quot;package/Makefile.in&quot;</code> defines:
+    <pre>
+    <code>PROJECT_BUILD_DIR:=project_build_$(ARCH)/$(PROJECT)</code>
+    <code>BINARIES_DIR:=binaries/$(PROJECT)</code>
+    </pre>
+    </p>
+
+    <p>It also defines the location for the target root file system:
+    <pre>
+    <code>TARGET_DIR:=$(PROJECT_BUILD_DIR)/$(PROJECT)/root</code>
+    </pre>
+    </p>
+
+    <p>I.E: If the user has choosen
+    <code>&quot;myproject&quot;</code>
+    as the $(PROJECT) name:
+
+    <ul>
+    <li><code>&quot;project_build_&lt;ARCH&gt;/myproject&quot;</code></li>
+    <li><code>&quot;binaries/myproject&quot;</code></li>
+    </ul>
+
+    <p>will be created. </p>
+
+    <p>Currently, the <u>root file system</u>, <u>busybox</u> and an Atmel
+    customized version of  
+    <u><code>U-Boot</code></u>, as well as some Atmel specific
+    bootloaders like <u>at91-bootstrap</u> and <u>dataflashboot.bin</u>
+    are built in 
+    <code>&quot;$(PROJECT_BUILD_DIR)&quot;</code>
+
+    <p>The resulting binaries for all architectures are stored in the 
+    <code>&quot;$(BINARIES_DIR)&quot;</code> directory. <p>
+
+    <p><b>SUMMARY</b></p>
+
+    <p>The project will share directories which can be share without
+    conflicts, but will use unique build directories, where the user
+    can configure the build. </p>
+
+    <p><b>THINGS TO DO</b></p>
+    
+    <ol>
+
+    <li>Linux</li>
+
+    <p>The current Linux implementation is flawed. It only works
+    if the user chooses to use one of the few kernels selected 
+    as base for the kernel-headers. While the Makefile seems to have
+    hooks, allowing the developer to specify whatever version he/she
+    wants in the target/device/*/* Makefiles, the build will fail
+    if another kernel version is choosen.</p>
+
+    <p>The reason for this is that the kernel patches are not
+    applied by the <code>&quot;target/linux/linux.mk&quot;</code>
+    build script fragment. They are only applied by the 
+    <code>&quot;toolchain/kernel-headers/*.makefile&quot;</code>
+    build script fragments</p>
+
+    <p>If the kernel-header version and the linux version differs,
+    there will be two <code>&quot;linux-2.6.X.Y&quot;</code>
+    directories in 
+    <code>&quot;build_&lt;ARCH&gt;/&lt;&gt;&quot;</code>,
+    each with its own set of patches. </p>
+
+    <p>The solution in the works, is to move the build of Linux to     
+    <code>&quot;project_build_&lt;ARCH&gt;/&lt;project name&gt;/linux-2.6.X.Y&quot;</code> combined with method to configure
+     which patches can be applied. Possibly, the linux source tree
+     used to generate the kernel headers will be moved to the
+     <code>&quot;toolchain_build_&lt;ARCH&gt;&quot;</code>
+     directory
+      </p>
+
+     <p>The user will be able to select from three different
+     Linux strategies:
+
+     <ul>
+     <li>Conservative Strategy: Only use version ssupported by the kernel headers</li>
+     <li>Stable Linux Strategy: Allow any 2.6.X.Y combination.
+	(Minimum 2.6.19)</li>
+     <li>Power-User Strategy: Allow 
+     <code>&quot;-git&quot;</code>, or
+     <code>&quot;-mm&quot;</code>, or user downloadable kernels</li>
+     </ul>
+
+     <p>The current kernel patches can be configured to be applied to the
+     linux source tree even if the version differs from the 
+     kernel header version. </p>
+
+     <p>Since the user can select any kernel-patch
+     he/she will be able to select a non-working combination.
+     If the patch fails, the user will have to generate a new 
+     proprietary kernel-patch or decide to not apply the kernel
+     patches</p>
+
+     <p>Other optional patches will be <u>board specific</u> or
+     <u>architecture specific</u> patches. </p>
+
+     <p>There will also be a way for the user to supply absolute
+     or relative paths to patches, possibly outside the main tree.
+     This can be used to apply custom kernel-header-patches, if
+     the versions available in buildroot cannot be applied to the 
+     specific linux version used</p>
+
+     <p>Maybe, there will also be a possibility to supply an 
+     <code>&quot;URL&quot;</code> to a patch available on Internet. </p>
+
+     <li>Configurable packages</li>
+
+     <p>Many packages can, on top of the simple
+     &quot;enable/disable build&quot;,
+     be further configured using Kconfig.
+     Currently these packages will be compiled using the 
+     configuration specified in the
+     <code>&quot;.config&quot;</code> file of the <u>first</u>
+     project demanding the build of the package.</p>
+
+     <p>If <u>another</u> project uses the same packages, but with 
+     a different configuration,these packages will <u>not</u> be rebuilt,
+     and the root file system for the new project will be populated
+     with files from the build of the <u>first</u> project</p>
+
+     <p>If multiple project are built, and a specific package
+     needs two different configuration, then the user must
+     delete the package from the
+     <code>&quot;build_&lt;ARCH&gt;&quot;</code> directory
+     before rebuilding the new project.<p>
+
+     <p>A long term solution is to edit the package makefile and move 
+     the build of the configurable packages from 
+     <code>&quot;build_&lt;ARCH&gt;&quot;</code> to
+     <code>&quot;project_build_&lt;ARCH&gt;/&lt;project name&gt;&quot;</code>
+     and send a patch to the buildroot mailing list.
+
+     <li>Naming conventions</li>
+
+     <p>Names of resulting binaries should reflect the
+     &quot;project name&quot;
+
+     <li>Generating File System binaries</li>
+     <p>
+     Packages which needs to be installed with the &quot;root&quot;
+     as owner, will generate a 
+     <code>&quot;.fakeroot.&lt;package&gt;&quot;</code> file
+     which will be used for the final build of the root file system binary. </p>
+
+     <p>This was previously located in the 
+     <code>&quot;$(STAGING_DIR)&quot;</code> directory, but was
+     recently moved to the 
+     <code>&quot;$(PROJECT_BUILD_DIR)&quot;</code> directory. </p>
+
+     <p>Currently only three packages: 
+     <code>&quot;at&quot;</code>,
+     <code>&quot;ltp-testsuite&quot;</code> and
+     <code>&quot;nfs-utils&quot;</code>
+     requests fakeroot. <p>
+
+     <p>The makefile fragments for each file system type like
+     <code>&quot;ext2&quot;</code>,
+     <code>&quot;jffs2&quot;</code> or
+     <code>&quot;squashfs&quot;</code>
+     will, when the file system binary is generated,
+     collect all present
+     <code>&quot;.fakeroot.&lt;package&gt;&quot;</code> files
+     to a single <code>&quot;_fakeroot.&lt;file system&gt;&quot;</code>
+     file and call fakeroot.</p>
+     <code>&quot;.fakeroot.&lt;package&gt;&quot;</code>
+     files are deleted as the last action of the Buildroot Makefile. </p>
+
+     <p>It needs to be evaluated if any further action for the 
+     file system binary build is needed. </p>
+
+     </ol>
+
     <h2><a name="using_toolchain" id="using_toolchain"></a>Using the
     uClibc toolchain</h2>
 
