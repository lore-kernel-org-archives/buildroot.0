From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2009 14:47:35 +0200
Subject: [Buildroot] [git commit master] documentation: update after major
	changes
Message-ID: <20090919152750.1B0AE77737@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=84a8eafd4cbd103e89194ed1768cc43760ecde3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 * Remove the huge section describing the design of the removed
   "project" feature

 * Update all references to the output directory hierarchy to match
   the new one

 * Add new sections on how to rebuild single packages and how to
   create board support

 * Other updates, clarifications, reorganizations

 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |  669 ++++++++++++++++++++-------------------------------
 1 files changed, 265 insertions(+), 404 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 8cd705d..45876d7 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -24,32 +24,30 @@
       <li><a href="#about">About Buildroot</a></li>
       <li><a href="#download">Obtaining Buildroot</a></li>
       <li><a href="#using">Using Buildroot</a></li>
-      <li><a href="#custom_targetfs">Customizing the target filesystem</a></li>
+      <li><a href="#custom_targetfs">Customizing the generated target filesystem</a></li>
       <li><a href="#custom_busybox">Customizing the Busybox
       configuration</a></li>
       <li><a href="#custom_uclibc">Customizing the uClibc
       configuration</a></li>
+      <li><a href="#rebuilding_packages">Understanding how to rebuild packages</a></li>
       <li><a href="#buildroot_innards">How Buildroot works</a></li>
-      <li><a href="#multi_project">Building several projects in the
-      same buildroot source tree</a></li>
       <li><a href="#using_toolchain">Using the uClibc toolchain
       outside Buildroot</a></li>
       <li><a href="#external_toolchain">Use an external toolchain</a></li>
       <li><a href="#downloaded_packages">Location of downloaded packages</a>
       </li>
-      <li><a href="#adapting_rootfs">Adapting the rootfs for own binaries</a></li>
       <li><a href="#add_software">Extending Buildroot with more
       Software</a></li>
+      <li><a href="#board_support">Creating your own board support</a></li>
       <li><a href="#links">Resources</a></li>
     </ul>
 
     <h2><a name="about" id="about"></a>About Buildroot</h2>
 
-    <p>Buildroot is a set of Makefiles and patches that allow to easily
-    generate both a cross-compilation toolchain and a root filesystem for your
-    target. The cross-compilation toolchain uses uClibc (<a href=
-    "http://www.uclibc.org/">http://www.uclibc.org/</a>), a tiny C standard
-    library. </p>
+    <p>Buildroot is a set of Makefiles and patches that allow to
+    easily generate a cross-compilation toolchain, a root filesystem
+    and a Linux kernel image for your target. Buildroot can be used
+    for either one, two or all of these options, independently.</p>
 
     <p>Buildroot is useful mainly for people working with embedded systems.
     Embedded systems often use processors that are not the regular x86
@@ -169,10 +167,6 @@
     <p>For each entry of the configuration tool, you can find associated help
     that describes the purpose of the entry. </p>
 
-    <p>One of the key configuration items is the <code>PROJECT</code> which
-    determines where some board specific packages are built and where the
-    results are stored. </p>
-
     <p>Once everything is configured, the configuration tool has generated a
     <code>.config</code> file that contains the description of your
     configuration. It will be used by the Makefiles to do what's needed. </p>
@@ -184,48 +178,51 @@
  $ make
 </pre>
 
-    <p>This command will download, configure and compile all the selected
-    tools, and finally generate a target filesystem. The target filesystem will
-    be named <code>root_fs_ARCH.EXT</code> where <code>ARCH</code> is your
-    architecture and <code>EXT</code> depends on the type of target filesystem
-    selected in the <code>Target options</code> section of the configuration
-    tool.
-    The file is stored in the "binaries/<code>$(PROJECT)</code>/" directory</p>
-
-    <h3><a name="local_board_support" id="local_board_support"></a>
-    Creating your own board support</h3>
-
-    <p>Once a package has been unpacked, it is possible to manually update
-    configuration files. Buildroot can automatically save the configuration
-    of buildroot, linux, busybox, uclibc and u-boot in "local/$(PROJECT) by
-    using the command:
-    </p>
-
-<pre>
- $ make saveconfig
-</pre>
+    <p>This command will download, configure and compile all the
+    selected tools, and finally generate a toolchain, a root
+    filesystem image and a kernel image (or only one of these
+    elements, depending on the configuration).</p>
 
-     <p>Once a buildroot configuration has been created by saveconfig,
-     the default "$(TOPDIR)/.config" file can be overridden by</p>
+    <p>Buildroot output is stored in a single directory,
+    <code>output/</code>. This directory contains several
+    subdirectories:</p>
 
-<pre>
- $ make BOARD=&lt;project&gt;
-</pre>
-
-    <p>Buildroot will then use "local/&lt;project&gt;/&lt;project&gt;.config"
-    instead of ".config". </p>
-
-    <p>If you want to modify your board, you can copy the project configuration
-     file to ".config" by using the command:</p>
-
-<pre>
- $ make BOARD=&lt;project&gt; getconfig
-</pre>
+    <ul>
 
-    <p>You can share your custom board support directory between several buildroot trees
-    by setting the environment variable <code>BUILDROOT_LOCAL</code> to this directory,
-    </p>
+      <li><code>images/</code> where all the images (kernel image,
+      bootloader and root filesystem images) are stored.</li>
+
+      <li><code>build/</code> where all the components are built
+      (tools needed to run Buildroot on the host and packages compiled
+      for the target). The <code>build/</code> directory contains one
+      subdirectory for each of these components. The toolchain
+      components are however built in a separate directory.</li>
+
+      <li><code>staging/</code> which contains a hierarchy similar to
+      a root filesystem hierarchy. This directory contains the
+      installation of cross-compilation toolchain and all the
+      userspace packages selected for the target. However, this
+      directory is <i>not</i> intended to be the root filesystem for
+      the target: it contains a lot of development files, unstripped
+      binaries and libraries, that make it far too big for an embedded
+      system.</li>
+
+      <li><code>target/<code> which contains the root filesystem for
+      the target. Only the necessary files to run the libraries and
+      applications are installed in this directory. However,
+      <code>target/dev/</code> doesn't contain the device files, as
+      creating device files requires the root access. The device files
+      only exist in the root filesystem image produced by
+      Buildroot.</li>
+
+      <li><code>host/</code> contains the installation of tools
+      compiled for the host that are needed for the proper execution
+      of Buildroot.</li>
+
+      <li><code>toolchain/</code> contains the build directories for
+      the various components of the cross-compilation toolchain.</li>
 
+    </ul>
 
     <h3><a name="offline_builds" id="offline_builds"></a>
     Offline builds</h3>
@@ -259,13 +256,18 @@
     <p>Buildroot optionally honors some environment variables that are passed
     to <code>make</code> :</p>
     <ul>
-    <li>HOSTCXX</li>
-    <li>HOSTCC</li>
-    <li>UCLIBC_CONFIG_FILE=&lt;path/to/.config&gt;</li>
-    <li>BUSYBOX_CONFIG_FILE=&lt;path/to/.config&gt;</li>
-    <li>BUILDROOT_COPYTO</li>
-    <li>BUILDROOT_DL_DIR</li>
-    <li>BUILDROOT_LOCAL</li>
+    <li><code>HOSTCXX</code>, the host C++ compiler to use</li>
+    <li><code>HOSTCC</code>, the host C compiler to use</li>
+    <li><code>UCLIBC_CONFIG_FILE=&lt;path/to/.config&gt;</code>, path
+    to the uClibc configuration file to use to compile uClibc if an
+    internal toolchain is selected</li>
+    <li><code>BUSYBOX_CONFIG_FILE=&lt;path/to/.config&gt;</code>, path
+    to the Busybox configuration file</li>
+    <li><code>BUILDROOT_COPYTO</code>, an additional location at which
+    the binary images of the root filesystem, kernel, etc. built by
+    Buildroot are copied</li>
+    <li><code>BUILDROOT_DL_DIR</code> to override the directory in
+    which Buildroot stores/retrieves downloaded files</li>
     </ul>
 
     <p>An example that uses config files located in the toplevel directory and
@@ -289,43 +291,14 @@ $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
 $ export BUILDROOT_COPYTO=/tftpboot
 </pre>
 
-
-    <h3><a name="helper_completion" id="helper_completion"></a>
-    Using auto-completion</h3>
-
-    <p>If you are lazy enough that you don't want to type the entire <i>make
-    menuconfig</i> command line, you can enable auto-completion in your shell.
-    Here is how you can do that using <i>bash</i>:</p>
-<pre>
-$ complete -W menuconfig make
-</pre>
-
-    <p>Then just enter the beginning of the line, and ask <i>bash</i> to
-    complete it for you by pressing the <i>TAB</i> key:</p>
-<pre>
-$ make me&lt;TAB&gt;
-</pre>
-
-    <p>will result in <i>bash</i> to append <i>nuconfig</i> for you!</p>
-
-    <p>Alternatively, some distributions (of which Debian and Mandriva are but
-    an example) have more powerful make completion. Depending on you
-    distribution, you may have to install a package to enable completion. Under
-    Mandriva, this is <i>bash-completion</i>, while Debian ships it as part of
-    the <i>bash</i> package.</p>
-
-    <p>Other shells, such as <i>zsh</i>, also have completion facilities. See
-    the documentation for your shell.</p>
-
     <h2><a name="custom_targetfs" id="custom_targetfs"></a>Customizing the
-    target filesystem</h2>
+    generated target filesystem</h2>
 
     <p>There are a few ways to customize the resulting target filesystem:</p>
 
     <ul>
       <li>Customize the target filesystem directly, and rebuild the image. The
-      target filesystem is available under <code>project_build_ARCH/root/</code>
-      where <code>ARCH</code> is the chosen target architecture.
+      target filesystem is available under <code>output/target/</code>.
       You can simply make your changes here, and run make afterwards, which will
       rebuild the target filesystem image. This method allows to do everything
       on the target filesystem, but if you decide to completely rebuild your
@@ -347,14 +320,31 @@ $ make me&lt;TAB&gt;
       inside the skeleton because it contains symlinks that would be broken
       otherwise. <br />
       These customizations are deployed into
-      <code>project_build_ARCH/root/</code> just before the actual image
+      <code>output/target/</code> just before the actual image
       is made. So simply rebuilding the image by running
       make should propagate any new changes to the image. </li>
 
-      <li>When configuring the build system, using <code>make
-      menuconfig</code> or <code>make xconfig</code>, you can specify
-      the contents of the /etc/hostname and /etc/issue (the welcome
-      banner) in the <code>PROJECT</code> section</li>
+      <li>Add support for your own target in Buildroot so that you
+      have your own target skeleton, see <a href="#board_support">this
+      section</a> for details</li>
+
+      <li>In Buildroot configuration, you can specify the path to a
+      post-build script that gets called <i>after</i> Buildroot built
+      all the selected software, but <i>before</i> the the rootfs
+      packages are assembled. The destination root filesystem folder
+      is given as first argument to this script, and this script can
+      then be used to copy programs, static data or any other needed
+      file to your target filesystem.<br/>You should, however, use
+      that feature with care. Whenever you find that a certain package
+      generates wrong or unneeded files, you should rather fix than
+      package than working around it with a cleanup script.</li>
+
+      <li>A special package, <i>customize</i>, stored in
+      <code>package/customize</code> can be used. You can put all the
+      files that you want to see in the final target root filesystem
+      in <code>package/customize/source</code>, and then enable this
+      special package from the configuration system.</li>
+
     </ul>
 
     <h2><a name="custom_busybox" id="custom_busybox"></a>Customizing the
@@ -423,6 +413,73 @@ $ make me&lt;TAB&gt;
     <p>If you want to use an existing config file for uclibc, then see
     section <a href="#environment_variables">environment variables</a>. </p>
 
+    <h2><a name="#rebuilding_packages"
+    id="rebuilding_packages">Understanding how to rebuild
+    packages</a></h2>
+
+    <p>One of the most common question and issue about Buildroot
+    encountered by users is how to rebuild a given package or how to
+    remove a package without rebuilding everything from scratch.</p>
+
+    <p>Removing a package is currently unsupported by Buildroot
+    without rebuilding from scratch. This is because Buildroot doesn't
+    keep track of which package installs what files in the
+    <code>output/staging</code> and <code>output/target</code>
+    directories. However, implement clean package removal is on the
+    TODO-list of Buildroot developers.</p>
+
+    <p>To rebuild a single package from scratch, the easiest way is to
+    remove its build directory in <code>output/build</code>. Buildroot
+    will then re-extract, re-configure, re-compile and re-install this
+    package from scratch.</p>
+
+    <p>However, if you don't want to rebuild the package completely
+    from scratch, a better understanding of the Buildroot internals is
+    needed. Internally, to keep track of which steps have been done
+    and which steps remains to be done, Buildroot maintains stamps
+    files (i.e, empty files that just tell whether this or this action
+    has been done). The problem is that these stamps files are not
+    uniformely named and handled by the different packages, so some
+    understanding of the particular package is needed.</p>
+
+    <p>For packages relying on the <i>autotools</i> Buildroot
+    infrastructure (see <a href="#add_software">this section</a> for
+    details), the following stamps files are interesting:</p>
+
+    <ul>
+
+      <li><code>output/build/packagename-version/.stamp_configured</code>. If
+      removed, Buildroot will trigger the recompilation of the package
+      from the configuration step (execution of
+      <code>./configure</code>)</li>
+
+      <li><code>output/build/packagename-version/.stamp_built</code>. If
+      removed, Buildroot will trigger the recompilation of the package
+      from the compilation step (execution of <code>make</code>)</li>
+
+    </ul>
+
+    <p>For other packages, an analysis of the specific
+    <i>package.mk</i> file is needed. For example, the zlib Makefile
+    looks like:</p>
+
+    <pre>
+$(ZLIB_DIR)/.configured: $(ZLIB_DIR)/.patched
+        (cd $(ZLIB_DIR); rm -rf config.cache; \
+                        [...]
+        )
+        touch $@
+
+$(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
+        $(MAKE) -C $(ZLIB_DIR) all libz.a
+        touch -c $@
+    </pre>
+
+    <p>So, if you want to trigger the reconfiguration, you need to
+    remove <code>output/build/zlib-version/.configured</code> and if
+    you want to trigger only the recompilation, you need to remove
+    <code>output/build/zlib-version/libz.a</code>.</p>
+
     <h2><a name="buildroot_innards" id="buildroot_innards"></a>How Buildroot
     works</h2>
 
@@ -477,334 +534,154 @@ $ make me&lt;TAB&gt;
     configuration is done) :</p>
 
     <ol>
-      <li>Create the download directory (<code>dl/</code> by default). This is
-      where the tarballs will be downloaded. It is interesting to know that the
-      tarballs are in this directory because it may be useful to save them
-      somewhere to avoid further downloads. </li>
-
-      <li>Create the shared build directory (<code>build_ARCH/</code> by
-      default, where <code>ARCH</code> is your architecture). This is where all
-      non configurable user-space tools will be compiled.When building two or
-      more targets using the same architecture, the first build will go through
-      the full download, configure, make process, but the second and later
-      builds will only copy the result from the first build to its project
-      specific target directory significantly speeding up the build process</li>
-
-      <li>Create the project specific build directory
-      (<code>project_build_ARCH/$(PROJECT)</code> by default, where
-      <code>ARCH</code> is your architecture). This is where all configurable
-      user-space tools will be compiled. The project specific build directory
-      is neccessary, if two different targets needs to use a specific package,
-      but the packages have different configuration for both targets. Some
-      examples of packages built in this directory are busybox and linux.
-      </li>
 
-      <li>Create the project specific result directory
-      (<code>binaries/$(PROJECT)</code> by default, where <code>ARCH</code>
-      is your architecture). This is where the root filesystem images are
-      stored, It is also used to store the linux kernel image and any
-      utilities, boot-loaders etc. needed for a target.
-      </li>
+      <li>Create all the output directories: <code>staging</code>,
+      <code>target</code>, <code>build</code>, <code>stamps</code>,
+      etc. in the output directory (<code>output/</code> by default,
+      another value can be specified using <code>O=</code>)</li>
+
+      <li>Generate all the targets listed in the
+      <code>BASE_TARGETS</code> variable. When an internal toolchain
+      is used, it means generating the cross-compilation
+      toolchain. When an external toolchain is used, it means checking
+      the features of the external toolchain and importing it into the
+      Buildroot environment.</li>
+
+      <li>Generate all the targets listed in the <code>TARGETS</code>
+      variable. This variable is filled by all the individual
+      components Makefiles. So, generating all these targets will
+      trigger the compilation of the userspace packages (libraries,
+      programs), the kernel, the bootloader and the generation of the
+      root filesystem images, depending on the configuration.</li>
 
-      <li>Create the toolchain build directory
-      (<code>toolchain_build_ARCH/</code> by default, where <code>ARCH</code>
-      is your architecture). This is where the cross compilation toolchain will
-      be compiled. </li>
-
-      <li>Setup the staging directory (<code>build_ARCH/staging_dir/</code> by
-      default). This is where the cross-compilation toolchain will be
-      installed. If you want to use the same cross-compilation toolchain for
-      other purposes, such as compiling third-party applications, you can add
-      <code>build_ARCH/staging_dir/usr/bin</code> to your PATH, and then use
-      <code>arch-linux-gcc</code> to compile your application. In order to
-      setup this staging directory, it first removes it, and then it creates
-      various subdirectories and symlinks inside it. </li>
-
-      <li>Create the target directory (<code>project_build_ARCH/root/</code> by
-      default) and the target filesystem skeleton. This directory will contain
-      the final root filesystem. To setup it up, it first deletes it, then it
-      uncompress the <code>target/generic/skel.tar.gz</code> file to create the
-      main subdirectories and symlinks, copies the skeleton available in
-      <code>target/generic/target_skeleton</code> and then removes useless
-      <code>.svn/CVS</code> directories. </li>
-
-      <li>Add the <code>TARGETS</code> dependency. This should generally check
-      if the configuration option for this package is enabled, and if so then
-      &quot;subscribe&quot; this package to be compiled by adding it to the
-      TARGETS global variable. </li>
     </ol>
 
-    <h2><a name="multi_project" id="multi_project"></a>Building several
-      projects in the same buildroot source tree</h2>
-
-    <p><i>Note: the contents of this section are obsolete since this
-    feature has been implemented.</i></p>
-
-    <h3>Background</h3>
-
-    <p>Buildroot has always supported building several projects in the same
-    tree if each project was for a different architecture. </p>
+    <h2><a name="board_support" id="board_support"></a>
+    Creating your own board support</h2>
 
-    <p>The root file system has been created in the
-    <code>&quot;build_&lt;ARCH&gt;/root&quot;</code>
-    directory which is unique for each architecture.
-    Toolchains have been built in
-    <code>&quot;toolchain_build_&lt;ARCH&gt;&quot;</code>. </p>
+    <p>Creating your own board support in Buildroot allows you to have
+    a convenient place to store the Busybox, uClibc, kernel
+    configurations, your target filesystem skeleton, and a Buildroot
+    configuration that match your project.</p>
 
-    <p> It the user wanted to build several root file systems for the same
-    architecture, a prefix or suffix could be added in the configuration file
-    so the root file system would be built in
-    <code>&quot;&lt;PREFIX&gt;_build_&lt;ARCH&gt;_&lt;SUFFIX&gt;/root&quot;</code>
-    By supplying <u>unique</u> combinations of
-    <code>&quot;&lt;PREFIX&gt;&quot;</code> and
-    <code>&quot;&lt;SUFFIX&gt;&quot;</code>
-    each project would get a <u>unique</u> root file system tree. </p>
+    <p>Follow these steps to integrate your board in Buildroot:</p>
 
-    <p>The disadvantage of this approach is that a new toolchain was
-    built for each project,  adding considerable time to the build
-    process, even if it was two projects for the same chip. </p>
-
-    <p>This drawback has been somewhat lessened with
-    <code>gcc-4.x.y</code> which allows buildroot to use an external
-    toolchain. Certain packages requires special
-    features in the toolchain, and if an external toolchain is selected,
-    this may lack the neccessary features to complete the build of the root
-     file system.</p>
-
-    <p>A bigger problem was that the
-    <code>&quot;build_&lt;ARCH&gt;&quot;</code> tree
-    was also duplicated, so each </code>package</code> would also
-    be rebuilt once per project, resulting in even longer build times.</p>
-
-    <h3>Project to share toolchain and package builds</h3>
-
-    <p>Work has started on a project which will allow the user to build
-    multiple root file systems for the same architecture in the same tree.
-    The toolchain and the package build directory will be shared, but each
-    project will have a dedicated directory tree for project specific
-    builds. </p>
-
-    <p>With this approach, most, if not all packages will be compiled
-    when the first project is built.
-    The process is almost identical to the original process.
-    Packages are downloaded and extracted to the shared
-    <code>&quot;build_&lt;ARCH&gt;/&lt;package&gt;&quot;</code>
-    directory. They are configured and compiled. </p>
-
-    <p>Package libraries and headers are installed in the shared $(STAGING_DIR),
-    and then the project specific root file system &quot;$(TARGET_DIR)&quot;
-    is populated. </p>
-
-    <p>At the end of the build, the root file system will be used
-    to generate the resulting root file system binaries. </p>
-
-    <p>Once the first project has been built, building other projects will
-    typically involve populating the new project's root file system directory
-    from the existing binaries generated in the shared
-    <code>&quot;build_&lt;ARCH&gt;/&lt;&gt;&quot;</code> directory. </p>
-
-    <p>Only packages, not used by the first project, will have to go
-    through the normal extract-configure-compile flow. </p>
-
-    <h3>Implementation</h3>
-
-    <p>The core of the solution is the introduction
-    of two new directories: </p>
-
-    <ul>
-    <li><code>project_build_&lt;ARCH&gt;</code></li>
+    <ol>
 
-    <li><code>binaries;</code></li>
-    </ul>
+      <li>Create a new directory in <code>target/device/</code>, named
+      after your company or organization</li>
 
-    <p>Each of the directories contain one subdirectory per project.
-    The name of the subdirectory is configured by the user in the
-    normal buildroot configuration, using the value of: </p>
+      <li>Add a line <code>source
+      "target/device/yourcompany/Config.in"</code> in
+      <code>target/device/Config.in</code> so that your board appears
+      in the configuration system</li>
 
-    <p><code>Project Options ---> Project name</code></p>
+      <li>In <code>target/device/yourcompany/</code>, create a
+      directory for your project. This way, you'll be able to store
+      several projects of your company/organization inside
+      Buildroot.</li>
 
-    <p>The configuration defines the $(PROJECT) variable.</p>
+      <li>Create a <code>target/device/yourcompany/Config.in</code>
+      file that looks like the following:
 
-    <p>The default project name is <code>&quot;uclibc&quot;</code>.</p>
+      <pre>
+menuconfig BR2_TARGET_COMPANY
+       bool "Company projects"
 
-    <p><code>&quot;package/Makefile.in&quot;</code> defines:
-    <pre>
-    <code>PROJECT_BUILD_DIR:=project_build_$(ARCH)/$(PROJECT)</code>
-    <code>BINARIES_DIR:=binaries/$(PROJECT)</code>
-    </pre>
-    </p>
-
-    <p>It also defines the location for the target root file system:
-    <pre>
-    <code>TARGET_DIR:=$(PROJECT_BUILD_DIR)/$(PROJECT)/root</code>
-    </pre>
-    </p>
+if BR2_TARGET_COMPANY
 
-    <p>I.E: If the user has choosen
-    <code>&quot;myproject&quot;</code>
-    as the $(PROJECT) name:
+config BR2_TARGET_COMPANY_PROJECT_FOOBAR
+       bool "Support for Company project Foobar"
+       help
+         This option enables support for Company project Foobar
 
-    <ul>
-    <li><code>&quot;project_build_&lt;ARCH&gt;/myproject&quot;</code></li>
-    <li><code>&quot;binaries/myproject&quot;</code></li>
-    </ul>
-
-    <p>will be created. </p>
-
-    <p>Currently, the <u>root file system</u>, <u>busybox</u> and an Atmel
-    customized version of
-    <u><code>U-Boot</code></u>, as well as some Atmel specific
-    bootloaders like <u>at91-bootstrap</u> and <u>dataflashboot.bin</u>
-    are built in
-    <code>&quot;$(PROJECT_BUILD_DIR)&quot;</code>
-
-    <p>The resulting binaries for all architectures are stored in the
-    <code>&quot;$(BINARIES_DIR)&quot;</code> directory. <p>
-
-    <h3>Summary</h3>
+endif
+      </pre>
 
-    <p>The project will share directories which can be share without
-    conflicts, but will use unique build directories, where the user
-    can configure the build. </p>
+      Of course, customize the different values to match your
+      company/organization and your project. This file will create a
+      menu entry that contains the different projects of your
+      company/organization.</li>
 
-    <h2><a name="Linux" id="Linux"></a>Linux</h2>
+      <li>Create a <code>target/device/yourcompany/Makefile.in</code>
+      file that looks like the following:
 
-     <p>The user can select from three different Linux strategies:
+      <pre>
+ifeq ($(BR2_TARGET_COMPANY_PROJECT_FOOBAR),y)
+include target/device/yourcompany/project-foobar/Makefile.in
+endif
+      </pre>
+      </li>
 
-     <ul>
-     <li>Legacy: Only use version supported by the kernel headers</li>
-     <li>Advanced: Allow any 2.6.X.Y combination.
-	(Minimum 2.6.19)</li>
-     <li>Power-User Strategy: Allow
-     <code>&quot;-git&quot;</code>, or
-     <code>&quot;-mm&quot;</code>, or user downloadable kernels</li>
-     </ul>
+      <li>Now, create the
+      <code>target/device/yourcompany/project-foobar/Makefile.in</code>
+      file. It is first recommended to define a
+      <code>BOARD_PATH</code> variable set to
+      <code>target/device/yourcompany/project-foobar</code>, as it
+      will simplify further definitions. Then, the file might define
+      one or several of the following variables:
+
+      <ul>
+
+	<li><code>TARGET_SKELETON</code> to a directory that contains
+	the target skeleton for your project. If this variable is
+	defined, this target skeleton will be used instead of the
+	default one. If defined, the convention is to define it to
+	<code>$(BOARD_PATH)/target_skeleton</code>, so that the target
+	skeletonn is stored in the board specific directory.</li>
+
+	<li><code>TARGET_DEVICE_TABLE</code> to a file that contains
+	the target device table, i.e the list of device files (in
+	<code>/dev/</code>) created by the root filesystem building
+	procedure. If this variable is defined, the given device table
+	will be used instead of the default one. If defined, the
+	convention is to define it to
+	<code>$(BOARD_PATH)/target_device_table.txt</code>. See
+	<code>target/generic/device_table.txt</code> for an example
+	file.</li>
+
+      </ul>
 
-     <p>The current kernel patches can be applied to the
-     linux source tree even if the version differs from the
-     kernel header version. </p>
+      </li>
 
-     <p>Since the user can select any kernel-patch
-     he/she will be able to select a non-working combination.
-     If the patch fails, the user will have to generate a new
-     proprietary kernel-patch or decide to not apply the kernel
-     patches</p>
+      <li>Then, in the
+      <code>target/device/yourcompany/project-foobar/</code>
+      directory, you can store different files:
 
-     <p>There is also support for <u>board specific</u> and
-     <u>architecture specific</u> patches. </p>
+      <ul>
 
-     <p>There will also be a way for the user to supply absolute
-     or relative paths to patches, possibly outside the main tree.
-     This can be used to apply custom kernel-header-patches, if
-     the versions available in buildroot cannot be applied to the
-     specific linux version used</p>
+	<li>One or more Buildroot configurations, under file named
+	<code>something_defconfig</code>. Your users will then be able
+	to run <code>make something_defconfig</code> and get the right
+	configuration for your project</li>
 
-     <p>Maybe, there will also be a possibility to supply an
-     <code>&quot;URL&quot;</code> to a patch available on Internet. </p>
+	<li>Configuration files for the kernel, for Busybox or
+	uClibc. These files can then be referenced by the Buildroot
+	configuration described above</li>
 
-     <p>
-	If there is no linux config file available,
-	buildroot starts the linux configuration system, which
-	defaults to "make menuconfig".
-     </p>
+      </ul>
 
-    <h3>Todo</h3>
-    <ol>
+      </li>
 
-     <li>Configurable packages</li>
-     <p>Many packages can, on top of the simple
-     &quot;enable/disable build&quot;,
-     be further configured using Kconfig.
-     Currently these packages will be compiled using the
-     configuration specified in the
-     <code>&quot;.config&quot;</code> file of the <u>first</u>
-     project demanding the build of the package.</p>
-
-     <p>If <u>another</u> project uses the same packages, but with
-     a different configuration,these packages will <u>not</u> be rebuilt,
-     and the root file system for the new project will be populated
-     with files from the build of the <u>first</u> project</p>
-
-     <p>If multiple project are built, and a specific package
-     needs two different configuration, then the user must
-     delete the package from the
-     <code>&quot;build_&lt;ARCH&gt;&quot;</code> directory
-     before rebuilding the new project.<p>
-
-     <p>A long term solution is to edit the package makefile and move
-     the build of the configurable packages from
-     <code>&quot;build_&lt;ARCH&gt;&quot;</code> to
-     <code>&quot;project_build_&lt;ARCH&gt;/&lt;project name&gt;&quot;</code>
-     and send a patch to the buildroot mailing list.
-
-     <li>Naming conventions</li>
-
-     <p>Names of resulting binaries should reflect the
-     &quot;project name&quot;
-
-     <li>Generating File System binaries</li>
-     <p>
-     Packages which needs to be installed with the &quot;root&quot;
-     as owner, will generate a
-     <code>&quot;.fakeroot.&lt;package&gt;&quot;</code> file
-     which will be used for the final build of the root file system binary. </p>
-
-     <p>This was previously located in the
-     <code>&quot;$(STAGING_DIR)&quot;</code> directory, but was
-     recently moved to the
-     <code>&quot;$(PROJECT_BUILD_DIR)&quot;</code> directory. </p>
-
-     <p>Currently only three packages:
-     <code>&quot;at&quot;</code>,
-     <code>&quot;ltp-testsuite&quot;</code> and
-     <code>&quot;nfs-utils&quot;</code>
-     requests fakeroot. <p>
-
-     <p>The makefile fragments for each file system type like
-     <code>&quot;ext2&quot;</code>,
-     <code>&quot;jffs2&quot;</code> or
-     <code>&quot;squashfs&quot;</code>
-     will, when the file system binary is generated,
-     collect all present
-     <code>&quot;.fakeroot.&lt;package&gt;&quot;</code> files
-     to a single <code>&quot;_fakeroot.&lt;file system&gt;&quot;</code>
-     file and call fakeroot.</p>
-     <code>&quot;.fakeroot.&lt;package&gt;&quot;</code>
-     files are deleted as the last action of the Buildroot Makefile. </p>
-
-     <p>It needs to be evaluated if any further action for the
-     file system binary build is needed. </p>
-
-     </ol>
+    </ol>
 
     <h2><a name="using_toolchain" id="using_toolchain"></a>Using the
-    uClibc toolchain outside Buildroot</h2>
+    generated toolchain outside Buildroot</h2>
 
     <p>You may want to compile your own programs or other software
     that are not packaged in Buildroot. In order to do this, you can
     use the toolchain that was generated by Buildroot. </p>
 
     <p>The toolchain generated by Buildroot by default is located in
-    <code>build_ARCH/staging_dir/</code>. The simplest way to use it
-    is to add <code>build_ARCH/staging_dir/usr/bin/</code> to your PATH
+    <code>output/staging/</code>. The simplest way to use it
+    is to add <code>output/staging/usr/bin/</code> to your PATH
     environnement variable, and then to use
-    <code>arch-linux-gcc</code>, <code>arch-linux-objdump</code>,
-    <code>arch-linux-ld</code>, etc. </p>
-
-    <p>For example, you may add the following to your
-    <code>.bashrc</code> (considering you're building for the MIPS
-    architecture and that Buildroot is located in
-    <code>~/buildroot/</code>) :</p>
-
-<pre>
-export PATH=&quot;$PATH:~/buildroot/build_mips/staging_dir/usr/bin/&quot;
-</pre>
+    <code>ARCH-linux-gcc</code>, <code>ARCH-linux-objdump</code>,
+    <code>ARCH-linux-ld</code>, etc. </p>
 
-    <p>Then you can simply do :</p>
-
-<pre>
-mips-linux-gcc -o foo foo.c
-</pre>
+    <p>The easiest way is of course to add the
+    <code>output/staging/usr/bin/</code> directory to your PATH
+    environment variable.</p>
 
      <p><b>Important</b> : do not try to move a gcc-3.x toolchain to an other
      directory, it won't work. There are some hardcoded paths in the
@@ -815,8 +692,8 @@ mips-linux-gcc -o foo foo.c
      might be cumbersome.</p>
 
      <p>It is also possible to generate the Buildroot toolchain in
-     another directory than <code>build_ARCH/staging_dir</code> using
-     the <code>Build options -&gt; Toolchain and header file
+     another directory than <code>build/staging</code> using the
+     <code>Build options -&gt; Toolchain and header file
      location</code> option. This could be useful if the toolchain
      must be shared with other users.</p>
 
@@ -890,22 +767,6 @@ It allows to generate toolchains based on <i>uClibc</i>, <i>glibc</i>
 and <i>eglibc</i> for a wide range of architectures, and has good
 community support.</p>
 
-      <h2><a name="adapting_rootfs" id="adapting_rootfs">Adapting the rootfs
-      for own binaries</h2>
-
-      <p>When using BR2 in an environment where own software binaries or
-      static data should be part of the generated rootfs package, the
-      <code>BR2_ROOTFS_POST_BUILD_SCRIPT</code> feature might interest
-      you. You can specify a command here which is called <i>after</i> BR2
-      built all the selected software, but <i>before</i> the the rootfs
-      packages are assembled. The destination rootfs folder is given as
-      first argument. You can add own components here, change
-      default configurations and remove unwanted files.</p>
-      <p>You should, however, use that feature with care. Whenever you
-      find that a certain package generates wrong or unneeded files, you
-      should rather fix than package than working around it with a
-      cleanup script.</p>
-
     <h2><a name="add_software" id="add_software"></a>Extending Buildroot with
     more software</h2>
 
@@ -992,7 +853,7 @@ endif
 
     <p>On <a href="#ex1line9">line 9</a>, we tell Buildroot to install
     the application to the staging directory. The staging directory,
-    located in <code>build_ARCH/staging_dir/</code> is the directory
+    located in <code>output/staging/</code> is the directory
     where all the packages are installed, including their
     documentation, etc. By default, packages are installed in this
     location using the <code>make install</code> command.</p>
-- 
1.6.3.3
