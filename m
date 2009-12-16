From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] documentation: update about new
	package infrastructures
Message-ID: <20091216153101.9516277738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=16c1549fd22af9a5fedd98d173a4c229b909af4c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Document the new generic package infrastructure, and how target/host
packages are handled, both for the generic package infrastructure and
the autotools package infrastructure.

This documentation replaces the documentation that used to be present
at the top of Makefile.autotools.in. Both tutorial and reference
documentation are provided.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |  692 ++++++++++++++++++++++++++++++++++++++++++++-------
 1 files changed, 603 insertions(+), 89 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 0d254b6..dfa69e0 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -36,10 +36,8 @@
       <li><a href="#using_toolchain">Using the uClibc toolchain
       outside Buildroot</a></li>
       <li><a href="#external_toolchain">Use an external toolchain</a></li>
-      <li><a href="#downloaded_packages">Location of downloaded packages</a>
-      </li>
-      <li><a href="#add_software">Extending Buildroot with more
-      Software</a></li>
+      <li><a href="#downloaded_packages">Location of downloaded packages</a></li>
+      <li><a href="#add_packages">Adding new packages to Buildroot</a></li>
       <li><a href="#board_support">Creating your own board support</a></li>
       <li><a href="#links">Resources</a></li>
     </ul>
@@ -221,7 +219,9 @@
       directory is <i>not</i> intended to be the root filesystem for
       the target: it contains a lot of development files, unstripped
       binaries and libraries that make it far too big for an embedded
-      system.</li>
+      system. These development files are used to compile libraries
+      and applications for the target that depend on other
+      libraries.</li>
 
       <li><code>target/</code> which contains <i>almost</i> the root
       filesystem for the target: everything needed is present except
@@ -474,9 +474,9 @@ $ export BUILDROOT_COPYTO=/tftpboot
     uniformely named and handled by the different packages, so some
     understanding of the particular package is needed.</p>
 
-    <p>For packages relying on the <i>autotools</i> Buildroot
-    infrastructure (see <a href="#add_software">this section</a> for
-    details), the following stamp files are relevent:</p>
+    <p>For packages relying on Buildroot packages infrastructures (see
+    <a href="#add_packages">this section</a> for details), the
+    following stamp files are relevent:</p>
 
     <ul>
 
@@ -493,7 +493,8 @@ $ export BUILDROOT_COPYTO=/tftpboot
 
     <p>For other packages, an analysis of the specific
     <i>package.mk</i> file is needed. For example, the zlib Makefile
-    looks like:</p>
+    used to look like this (before it was converted to the generic
+    package infrastructure):</p>
 
     <pre>
 $(ZLIB_DIR)/.configured: $(ZLIB_DIR)/.patched
@@ -512,6 +513,10 @@ $(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
     you want to trigger only the recompilation, you need to remove
     <code>output/build/zlib-version/libz.a</code>.</p>
 
+    <p>Note that most packages, if not all, will progressively be
+    ported over the generic or the autotools infrastructure, making it
+    much easier to rebuild individual packages.</p>
+
     <h2><a name="buildroot_innards" id="buildroot_innards"></a>How Buildroot
     works</h2>
 
@@ -522,7 +527,7 @@ $(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
     <code>uClibc</code>). </p>
 
     <p>There is basically one Makefile per software package, and they are named with
-    the <code>.mk</code> extension. Makefiles are split into four
+    the <code>.mk</code> extension. Makefiles are split into three main
     sections:</p>
 
     <ul>
@@ -779,124 +784,633 @@ It allows generating toolchains based on <i>uClibc</i>, <i>glibc</i>
 and <i>eglibc</i> for a wide range of architectures and has good
 community support.</p>
 
-    <h2><a name="add_software" id="add_software"></a>Extending Buildroot with
-    more software</h2>
+    <h2><a name="add_packages" id="add_packages"></a>Adding new
+    packages to Buildroot</h2>
 
-    <p>This section will only consider the case in which you want to
-    add user-space software. </p>
+    <p>This section covers how new packages (userspace libraries or
+    applications) can be integrated into Buildroot. It also allows to
+    understand how existing packages are integrated, which is needed
+    to fix issues or tune their configuration.</p>
 
-    <h3>Package directory</h3>
+    <ul>
+      <li><a href="#package-directory">Package directory</a></li>
+      <li><a href="#config-in-file"><code>Config.in</code> file</a></li>
+      <li><a href="#mk-file">The <code>.mk</code> file</a>
+      <ul>
+	<li><a href="#generic-tutorial">Makefile for generic
+	packages : tutorial</a></li>
+	<li><a href="#generic-reference">Makefile for
+	generic packages : reference</a></li>
+	<li><a href="#autotools-tutorial">Makefile for autotools-based
+	packages : tutorial</a></li>
+	<li><a href="#autotools-reference">Makefile for autotools-based
+	packages : reference</a></li>
+	<li><a href="#manual-tutorial">Manual Makefile : tutorial</a></li>
+      </ul>
+      </li>
+    </ul>
+
+    <h3><a name="package-directory"></a>Package directory</h3>
 
     <p>First of all, create a directory under the <code>package</code>
     directory for your software, for example <code>foo</code>. </p>
 
-    <h3><code>Config.in</code> file</h3>
+    <p>Some packages have been grouped by topic in a sub-directory:
+    <code>multimedia</code>, <code>java</code>,
+    <code>databases</code>, <code>editors</code>, <code>x11r7</code>,
+    <code>games</code>. If your package fits in one of these
+    categories, then create your package directory in these.</p>
+
+    <h3><a name="config-in-file"></a><code>Config.in</code> file</h3>
 
     <p>Then, create a file named <code>Config.in</code>. This file
     will contain the option descriptions related to our
-    <code>foo</code> software that will be used and displayed in the
-    configuration tool. It should basically contain:</p>
+    <code>libfoo</code> software that will be used and displayed in the
+    configuration tool. It should basically contain :</p>
 
 <pre>
-config BR2_PACKAGE_FOO
-        bool "foo"
+config BR2_PACKAGE_LIBFOO
+        bool "libfoo"
         help
-	  This is a comment that explains what foo is.
+	  This is a comment that explains what libfoo is.
 
-	  http://foosoftware.org/foo/
+	  http://foosoftware.org/libfoo/
 </pre>
 
     <p>Of course, you can add other options to configure particular
-    things in your software. </p>
-    <p>Finally you have to add your new <code>foo/Config.in</code> to
-    <code>package/Config.in</code>. The files included there are
-    <em>sorted alphabetically</em> per category and are <em>NOT</em>
-    supposed to contain anything but the <em>bare</em> name of the package.</p>
+    things in your software. You can look at examples in other
+    packages. The syntax of the Config.in file is the same as the one
+    for the kernel Kconfig file. The documentation for this syntax is
+    available at <a
+    href="http://lxr.free-electrons.com/source/Documentation/kbuild/kconfig-language.txt">http://lxr.free-electrons.com/source/Documentation/kbuild/kconfig-language.txt</a></p>
+
+    <p>Finally you have to add your new <code>libfoo/Config.in</code> to
+    <code>package/Config.in</code> (or in a category subdirectory if
+    you decided to put your package in one of the existing
+    categories). The files included there are <em>sorted
+    alphabetically</em> per category and are <em>NOT</em> supposed to
+    contain anything but the <em>bare</em> name of the package.</p>
 <pre>
-source "package/procps/Config.in"
+source "package/libfoo/Config.in"
 </pre>
-   <p><strong>Note:</strong><br>
-   Generally all packages should live <em>directly</em> in the
-   <code>package</code> directory to make it easier to find them.
-   </p>
-   <h3>The real Makefile</h3>
+
+   <h3><a name="mk-file"></a>The <code>.mk</code> file</h3>
 
    <p>Finally, here's the hardest part. Create a file named
-   <code>foo.mk</code>. It will contain the Makefile rules that
-   are in charge of downloading, configuring, compiling and installing
-   the software.</p>
+   <code>foo.mk</code>. It describes how the package should be
+   downloaded, configured, built, installed, etc.</p>
 
-   <p>Two types of Makefiles can be written&nbsp;:</p>
+   <p>Depending on the package type, the <code>.mk</code> file must be
+   written in a different way, using different infrastructures:</p>
 
    <ul>
-    <li>Makefiles for autotools-based (autoconf, automake, etc.)
-    software are very easy to write thanks to the infrastructure
-    available in <code>package/Makefile.autotools.in</code>.</li>
-    <li>Makefiles for other types of packages are a little bit more
-    complex to write.</li>
+
+     <li>Makefiles for generic packages (not using autotools), based
+     on an infrastructure similar to the one used for autotools-based
+     packages, but which requires a little more work from the
+     developer : specify what should be done at for the configuration,
+     compilation, installation and cleanup of the package. This
+     infrastructure must be used for all packages that do not use the
+     autotools as their build system. In the future, other specialized
+     infrastructures might be written for other build systems.<br/>We
+     cover them through a <a
+     href="#generic-tutorial">tutorial</a> and a <a
+     href="#generic-reference">reference</a>.</li>
+
+     <li>Makefiles for autotools-based (autoconf, automake, etc.)
+     softwares. We provide a dedicated infrastructure for such
+     packages, since autotools is a very common build system. This
+     infrastructure <i>must</i> be used for new packages that rely on
+     the autotools as their build system.<br/>We cover them through a
+     <a href="#autotools-tutorial">tutorial</a> and a <a
+     href="#autotools-reference">reference</a>.</li>
+
+     <li>Manual Makefiles. These are currently obsolete and no new
+     manual Makefiles should be added. However, since there are still
+     many of them in the tree and because the , we keep them documented in a <a
+     href="#manual-tutorial">tutorial</a>.</li>
+
    </ul>
 
-   <p>First, let's see how to write a Makefile for an
-   autotools-based package, with an example&nbsp;:</p>
+   <h4><a name="generic-tutorial"></a>Makefile for generic packages :
+   tutorial</h4>
+
+   <pre><tt><span style="color: #000000">01:</span> <span style="font-style: italic"><span style="color: #9A1900">#############################################################</span></span>
+<span style="color: #000000">02:</span> <span style="font-style: italic"><span style="color: #9A1900">#</span></span>
+<span style="color: #000000">03:</span> <span style="font-style: italic"><span style="color: #9A1900"># libfoo</span></span>
+<span style="color: #000000">04:</span> <span style="font-style: italic"><span style="color: #9A1900">#</span></span>
+<span style="color: #000000">05:</span> <span style="font-style: italic"><span style="color: #9A1900">#############################################################</span></span>
+<span style="color: #000000">06:</span> <span style="color: #990000">LIBFOO_VERSION:=</span>1.0
+<span style="color: #000000">07:</span> <span style="color: #990000">LIBFOO_SOURCE:=</span>libfoo-<span style="color: #009900">$(LIBFOO_VERSION)</span>.tar.gz
+<span style="color: #000000">08:</span> <span style="color: #990000">LIBFOO_SITE:=</span>http<span style="color: #990000">:</span>//www.foosoftware.org/download
+<span style="color: #000000">09:</span> <span style="color: #009900">LIBFOO_INSTALL_STAGING=</span>YES
+<span style="color: #000000">10:</span> <span style="color: #009900">LIBFOO_DEPENDENCIES =</span> host-libaaa libbbb
+<span style="color: #000000">11:</span> 
+<span style="color: #000000">12:</span> define LIBFOO_BUILD_CMDS
+<span style="color: #000000">13:</span>         <span style="color: #009900">$(MAKE)</span> <span style="color: #009900">CC</span><span style="color: #990000">=</span><span style="color: #009900">$(TARGET_CC)</span> <span style="color: #009900">LD</span><span style="color: #990000">=</span><span style="color: #009900">$(TARGET_LD)</span> -C <span style="color: #009900">$(@D)</span> all
+<span style="color: #000000">14:</span> endef
+<span style="color: #000000">15:</span> 
+<span style="color: #000000">16:</span> define LIBFOO_INSTALL_STAGING_CMDS
+<span style="color: #000000">17:</span>         <span style="color: #009900">$(INSTALL)</span> -D <span style="color: #009900">$(@D)</span>/libfoo.a <span style="color: #009900">$(STAGING_DIR)</span>/usr/lib/libfoo.a
+<span style="color: #000000">18:</span>         <span style="color: #009900">$(INSTALL)</span> -D <span style="color: #009900">$(@D)</span>/foo.h <span style="color: #009900">$(STAGING_DIR)</span>/usr/include/foo.h
+<span style="color: #000000">19:</span>         cp -dpf <span style="color: #009900">$(@D)</span>/libfoo.so<span style="color: #990000">*</span> <span style="color: #009900">$(STAGING_DIR)</span>/usr/lib
+<span style="color: #000000">20:</span> endef
+<span style="color: #000000">21:</span> 
+<span style="color: #000000">22:</span> define LIBFOO_INSTALL_TARGET_CMDS
+<span style="color: #000000">23:</span>         cp -dpf <span style="color: #009900">$(@D)</span>/libfoo.so<span style="color: #990000">*</span> <span style="color: #009900">$(TARGET_DIR)</span>/usr/lib
+<span style="color: #000000">24:</span>         -<span style="color: #009900">$(STRIPCMP)</span> <span style="color: #009900">$(STRIP_STRIP_UNNEEDED)</span> <span style="color: #009900">$(TARGET_DIR)</span>/isr/lib/libfoo.so<span style="color: #990000">*</span>
+<span style="color: #000000">25:</span> endef
+<span style="color: #000000">26:</span> 
+<span style="color: #000000">27:</span> <span style="color: #009900">$(</span><span style="font-weight: bold"><span style="color: #0000FF">eval</span></span> <span style="color: #009900">$(</span>call GENTARGETS<span style="color: #990000">,</span>package<span style="color: #990000">,</span>libfoo<span style="color: #990000">))</span></tt></pre>
+
+   <p>The Makefile begins on line 6 to 8 by metadata informations: the
+   version of the package (<code>LIBFOO_VERSION</code>), the name of
+   the tarball containing the package (<code>LIBFOO_SOURCE</code>) and
+   the Internet location at which the tarball can be downloaded
+   (<code>LIBFOO_SITE</code>). All variables must start with the same
+   prefix, <code>LIBFOO_</code> in this case. This prefix is always
+   the uppercased version of the package name (see below to understand
+   where the package name is defined).</p>
+
+   <p>On line 9, we specify that this package wants to install
+   something to the staging space. This is often needed for libraries
+   since they must install header files and other development files in
+   the staging space. This will ensure that the commands listed in the
+   <code>LIBFOO_INSTALL_STAGING_CMDS</code> variable will be
+   executed.</p>
+
+   <p>On line 10, we specify the list of dependencies this package
+   relies on. These dependencies are listed in terms of lower-case
+   package names, which can be packages for the target (without the
+   <code>host-</code> prefix) or packages for the host (with the
+   <code>host-</code>) prefix). Buildroot will ensure that all these
+   packages are built and installed <i>before</i> the current package
+   starts its configuration.</p>
+
+   <p>The rest of the Makefile defines what should be done at the
+   different steps of the package configuration, compilation and
+   installation. <code>LIBFOO_BUILD_CMDS</code> tells what steps
+   should be performed to build the
+   package. <code>LIBFOO_INSTALL_STAGING_CMDS</code> tells what steps
+   should be performed to install the package in the staging
+   space. <code>LIBFOO_INSTALL_TARGET_CMDS</code> tells what steps
+   should be performed to install the package in the target space.</p>
+
+   <p>All these steps rely on the <code>$(@D)</code> variable, which
+   contains the directory where the source code of the package has
+   been extracted.</p>
+
+   <p>Finally, on line 27, we call the <code>GENTARGETS</code> which
+   generates, according to the variables defined previously, all the
+   Makefile code necessary to make your package working.</p>
+
+   <h4><a name="generic-reference"></a>Makefile for generic packages :
+   reference</h4>
+
+   <p>The <code>GENTARGETS</code> macro takes three arguments:</p>
+
+   <ul>
+
+     <li>The first argument is the package directory prefix. If your
+     package is in <code>package/libfoo</code>, then the directory
+     prefix is <code>package</code>. If your package is in
+     <code>package/editors/foo</code>, then the directory prefix must
+     be <code>package/editors</code>.</li>
+
+     <li>The second argument is the lower-cased package name. It must
+     match the prefix of the variables in the <code>.mk</code> file
+     and must match the configuration option name in the
+     <code>Config.in</code> file. For example, if the package name is
+     <code>libfoo</code>, so the variables in the <code>.mk</code>
+     must start with <code>LIBFOO_</code> and the configuration option
+     in the <code>Config.in</code> file must be
+     <code>BR2_PACKAGE_LIBFOO</code>.</li>
+
+     <li>The third argument is optional. It can be used to tell if the
+     package if a target package (cross-compiled for the target) or a
+     host package (natively compiled for the host). If unspecified, it
+     is assumed that it is a target package. See below for
+     details.</li>
+
+   </ul>
+
+   <p>For a given package, in a single <code>.mk</code> file, it is
+   possible to call GENTARGETS twice, once to create the rules to
+   generate a target package and once to create the rules to generate
+   a host package:</p>
+
+<pre>
+$(eval $(call GENTARGETS,package,libfoo))
+$(eval $(call GENTARGETS,package,libfoo,host))
+</pre>
+
+   <p>This might be useful if the compilation of the target package
+   requires some tools to be installed on the host. If the package
+   name is <code>libfoo</code>, then the name of the package for the
+   target is also <code>libfoo</code>, while the name of the package
+   for the host is <code>host-libfoo</code>. These names should be
+   used in the DEPENDENCIES variables of other packages if they depend
+   on <code>libfoo</code> or <code>host-libfoo</code>.</p>
+
+   <p>The call to the <code>GENTARGETS</code> macro <b>must</b> be at
+   the end of the <code>.mk</code> file, after all variable
+   definitions.</p>
+
+   <p>For the target package, the <code>GENTARGETS</code> uses the
+   variables defined by the .mk file and prefixed by the uppercased
+   package name: <code>LIBFOO_*</code>. For target package, it uses
+   the <code>HOST_LIBFOO_*</code>. For <i>some</i> variables, if the
+   <code>HOST_LIBFOO_</code> prefixed variable doesn't exist, the
+   package infrastructure uses the corresponding variable prefixed by
+   <code>LIBFOO_</code>. This is done for variables that are likely to
+   have the same value for both the target and host packages. See
+   below for details.</p>
+
+   <p>The list of variables that can be set in a <code>.mk</code> file
+   to give metadata informations is (assuming the package name is
+   <code>libfoo</code>) :</p>
+
+   <ul>
+
+     <li><code>LIBFOO_VERSION</code>, mandatory, must contain the
+     version of the package. Note that if
+     <code>HOST_LIBFOO_VERSION</code> doesn't exist, it is assumed to
+     be the same as <code>LIBFOO_VERSION</code>.<br/>Example:
+     <code>LIBFOO_VERSION=0.1.2</code></li>
+
+     <li><code>LIBFOO_SOURCE</code> may contain the name of the
+     tarball of the package. If <code>HOST_LIBFOO_SOURCE</code> is not
+     specified, it defaults to <code>LIBFOO_VERSION</code>. If none
+     are specified, then the value is assumed to be
+     <code>packagename-$(LIBFOO_VERSION).tar.gz</code>.<br/>Example:
+     <code>LIBFOO_SOURCE =
+     foobar-$(LIBFOO_VERSION).tar.bz2</code></li>
+
+     <li><code>LIBFOO_PATCH</code> may contain the name of a patch,
+     that will be downloaded from the same location as the tarball
+     indicated in <code>LIBFOO_SOURCE</code>. If
+     <code>HOST_LIBFOO_PATCH</code> is not specified, it defaults to
+     <code>LIBFOO_PATCH</code>. Also note that another mechanism is
+     available to patch a package: all files of the form
+     <code>packagename-packageversion-description.patch</code> present
+     in the package directory inside Buildroot will be applied to the
+     package after extraction.</li>
+
+     <li><code>LIBFOO_SITE</code> may contain the Internet location of
+     the tarball of the package. If <code>HOST_LIBFOO_SITE</code> is
+     not specified, it defaults to <code>LIBFOO_SITE</code>. If none
+     are specified, then the location is assumed to be
+     <code>http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/packagename</code>.<br/>Example:
+     <code>LIBFOO_SITE=http://www.foosoftware.org/libfoo</code>.</li>
+
+     <li><code>LIBFOO_DEPENDENCIES</code> lists the dependencies (in
+     terms of package name) that are required for the current target
+     package to compile. These dependencies are guaranteed to be
+     compiled and installed before the configuration of the current
+     package starts. In a similar way,
+     <code>HOST_LIBFOO_DEPENDENCIES</code> lists the dependency for
+     the current host package.</li>
+
+     <li><code>LIBFOO_INSTALL_STAGING</code> can be set to
+     <code>YES</code> or <code>NO</code> (default). If set to
+     <code>YES</code>, then the commands in the
+     <code>LIBFOO_INSTALL_STAGING_CMDS</code> variables are executed
+     to install the package into the staging directory.</p>
+
+     <li><code>LIBFOO_INSTALL_TARGET</code> can be set to
+     <code>YES</code> (default) or <code>NO</code>. If set to
+     <code>YES</code>, then the commands in the
+     <code>LIBFOO_INSTALL_TARGET_CMDS</code> variables are executed
+     to install the package into the target directory.</p>
+
+     </ul>
+
+     <p>The recommended way to define these variables is to use the
+     following syntax:</p>
 
 <pre>
-     <a name="ex1line1" id="ex1line1">1</a>  #############################################################
-     <a name="ex1line2" id="ex1line2">2</a>  #
-     <a name="ex1line3" id="ex1line3">3</a>  # foo
-     <a name="ex1line4" id="ex1line4">4</a>  #
-     <a name="ex1line5" id="ex1line5">5</a>  #############################################################
-     <a name="ex1line6" id="ex1line6">6</a>  FOO_VERSION:=1.0
-     <a name="ex1line7" id="ex1line7">7</a>  FOO_SOURCE:=foo-$(FOO_VERSION).tar.gz
-     <a name="ex1line8" id="ex1line8">8</a>  FOO_SITE:=http://www.foosoftware.org/downloads
-     <a name="ex1line9" id="ex1line9">9</a>  FOO_INSTALL_STAGING = YES
-     <a name="ex1line10" id="ex1line10">10</a>  FOO_INSTALL_TARGET = YES
-     <a name="ex1line11" id="ex1line11">11</a>  FOO_CONF_OPT =  --enable-shared
-     <a name="ex1line12" id="ex1line12">12</a>  FOO_DEPENDENCIES = libglib2 host-pkgconfig
-     <a name="ex1line13" id="ex1line13">13</a>  $(eval $(call AUTOTARGETS,package,foo))
+LIBFOO_VERSION=2.32
 </pre>
 
-    <p>On <a href="#ex1line6">line 6</a>, we declare the version of
-    the package. On lines <a href="#ex1line7">7</a> and <a
-    href="#ex1line8">8</a>, we declare the name of the tarball and the
-    location of the tarball on the web. Buildroot will automatically
-    download the tarball from this location.</p>
-
-    <p>On <a href="#ex1line9">line 9</a>, we tell Buildroot to install
-    the application to the staging directory. The staging directory,
-    located in <code>output/staging/</code> is the directory
-    where all the packages are installed, including their
-    documentation, etc. By default, packages are installed in this
+     <p>Now, the variables that define what should be performed at the
+     different steps of the build process.</p>
+
+     <ul>
+
+       <li><code>LIBFOO_CONFIGURE_CMDS</code>, used to list the
+       actions to be performed to configure the package before its
+       compilation</li>
+
+       <li><code>LIBFOO_BUILD_CMDS</code>, used to list the actions to
+       be performed to compile the package</li>
+
+       <li><code>HOST_LIBFOO_INSTALL_CMDS</code>, used to list the
+       actions to be performed to install the package, when the
+       package is a host package. The package must install its files
+       to the directory given by <code>$(HOST_DIR)</code>. All files,
+       including development files such as headers should be
+       installed, since other packages might be compiled on top of
+       this package.</li>
+
+       <li><code>LIBFOO_INSTALL_TARGET_CMDS</code>, used to list the
+       actions to be performed to install the package to the target
+       directory, when the package is a target package. The package
+       must install its files to the directory given by
+       <code>$(TARGET_DIR)</code>. Only the files required for
+       <i>execution</i> of the package should be installed. Header
+       files and documentation should not be installed.</li>
+
+       <li><code>LIBFOO_INSTALL_STAGING_CMDS</code>, used to list the
+       actions to be performed to install the package to the staging
+       directory, when the package is a target package. The package
+       must install its files to the directory given by
+       <code>$(STAGING_DIR)</code>. All development files should be
+       installed, since they might be needed to compile other
+       packages.</li>
+
+       <li><code>LIBFOO_CLEAN_CMDS</code>, used to list the actions to
+       perform to clean up the build directory of the package.</li>
+
+       <li><code>LIBFOO_UNINSTALL_TARGET_CMDS</code>, used to list the
+       actions to uninstall the package from the target directory
+       <code>$(TARGET_DIR)</code></li>
+
+       <li><code>LIBFOO_UNINSTALL_STAGING_CMDS</code></li>, used to
+       list the actions to uninstall the package from the staging
+       directory <code>$(STAGING_DIR)</code>.</li>
+
+     </ul>
+
+     <p>The preferred way to define these variables is:</p>
+
+<pre>
+define LIBFOO_CONFIGURE_CMDS
+ action 1
+ action 2
+ action 3
+endef</pre>
+
+     <p>In the action definitions, you can use the following
+     variables:</p>
+
+     <ul>
+
+       <li><code>$(@D)</code>, which contains the directory in which
+       the package source code has been uncompressed.</li>
+
+       <li><code>$(TARGET_CC)</code>, <code>$(TARGET_LD)</code>,
+       etc. to get the target cross-compilation utilities</li>
+
+       <li><code>$(TARGET_CROSS)</code> to get the cross-compilation
+       toolchain prefix</li>
+
+       <li>Of course the <code>$(HOST_DIR)</code>,
+       <code>$(STAGING_DIR)</code> and <code>$(TARGET_DIR)</code>
+       variables to install the packages properly.</li>
+
+     </ul>
+
+
+     <p>The last feature of the generic infrastructure is the ability
+     to add hook more actions after existing steps. These hooks aren't
+     really useful for generic packages, since the <code>.mk</code>
+     file already has full control over the actions performed in each
+     step of the package construction. The hooks are more useful for
+     packages using the autotools infrastructure described below. But
+     since they are provided by the generic infrastructure, they are
+     documented here.</p>
+
+     <p>The following hook points are available:</p>
+
+     <ul>
+       <li><code>LIBFOO_POST_PATCH_HOOKS</code></li>
+       <li><code>LIBFOO_POST_CONFIGURE_HOOKS</code></li>
+       <li><code>LIBFOO_POST_BUILD_HOOKS</code></li>
+       <li><code>LIBFOO_POST_INSTALL_HOOKS</code> (for host packages only)</li>
+       <li><code>LIBFOO_POST_INSTALL_STAGING_HOOKS</code> (for target packages only)</li>
+       <li><code>LIBFOO_POST_INSTALL_TARGET_HOOKS</code> (for target packages only)</li>
+     </ul>
+
+     <p>This variables are <i>lists</i> of variable names containing
+     actions to be performed at this hook point. This allows several
+     hooks to be registered at a given hook point. Here is an
+     example:</p>
+
+     <pre>
+define LIBFOO_POST_PATCH_FIXUP
+  action1
+  action2
+endef
+
+LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
+</pre>
+
+   <h4><a name="autotools-tutorial"></a>Makefile for autotools-based
+   packages : tutorial</h4>
+
+   <p>First, let's see how to write a <code>.mk</code> file for an
+   autotools-based package, with an example&nbsp;:</p>
+
+<pre><tt><span style="color: #000000">01:</span> <span style="font-style: italic"><span style="color: #9A1900">#############################################################</span></span>
+<span style="color: #000000">02:</span> <span style="font-style: italic"><span style="color: #9A1900">#</span></span>
+<span style="color: #000000">03:</span> <span style="font-style: italic"><span style="color: #9A1900"># foo</span></span>
+<span style="color: #000000">04:</span> <span style="font-style: italic"><span style="color: #9A1900">#</span></span>
+<span style="color: #000000">05:</span> <span style="font-style: italic"><span style="color: #9A1900">#############################################################</span></span>
+<span style="color: #000000">06:</span> 
+<span style="color: #000000">07:</span> <span style="color: #990000">FOO_VERSION:=</span>1.0
+<span style="color: #000000">08:</span> <span style="color: #990000">FOO_SOURCE:=</span>foo-<span style="color: #009900">$(FOO_VERSION)</span>.tar.gz
+<span style="color: #000000">09:</span> <span style="color: #990000">FOO_SITE:=</span>http<span style="color: #990000">:</span>//www.foosoftware.org/downloads
+<span style="color: #000000">10:</span> <span style="color: #009900">FOO_INSTALL_STAGING =</span> YES
+<span style="color: #000000">11:</span> <span style="color: #009900">FOO_INSTALL_TARGET =</span> YES
+<span style="color: #000000">12:</span> <span style="color: #009900">FOO_CONF_OPT =</span>  --enable-shared
+<span style="color: #000000">13:</span> <span style="color: #009900">FOO_DEPENDENCIES =</span> libglib2 host-pkg-config
+<span style="color: #000000">14:</span> 
+<span style="color: #000000">15:</span> <span style="color: #009900">$(</span><span style="font-weight: bold"><span style="color: #0000FF">eval</span></span> <span style="color: #009900">$(</span>call AUTOTARGETS<span style="color: #990000">,</span>package<span style="color: #990000">,</span>foo<span style="color: #990000">))</span></tt></pre>
+
+    <p>On line 7, we declare the version of the package. On line 8 and
+    9, we declare the name of the tarball and the location of the
+    tarball on the Web. Buildroot will automatically download the
+    tarball from this location.</p>
+
+    <p>On line 10, we tell Buildroot to install the package to the
+    staging directory. The staging directory, located in
+    <code>output/staging/</code> is the directory where all the
+    packages are installed, including their development files, etc. By
+    default, packages are not installed to the staging directory,
+    since usually, only libraries need to be installed in the staging
+    directory: their development files are needed to compile other
+    libraries or applications depending on them. Also by default, when
+    staging installation is enabled, packages are installed in this
     location using the <code>make install</code> command.</p>
 
-    <p>On <a href="#ex1line10">line 10</a>, we tell Buildroot to also
-    install the application to the target directory. This directory
-    contains what will become the root filesystem running on the
-    target. Usually, we try to install stripped binaries and
-    to not install the documentation.  By default, packages are
+    <p>On line 11, we tell Buildroot to also install the package to
+    the target directory. This directory contains what will become the
+    root filesystem running on the target. Usually, we try not to
+    install the documentation and to install stripped versions of the
+    binary. By default, target installation is enabled, so in fact,
+    this line is not strictly necessary. Also by default, packages are
     installed in this location using the <code>make
     install-strip</code> command.</p>
 
-    <p>On <a href="#ex1line11">line 11</a>, we tell Buildroot to pass
-    a custom configure option to the
-    <code>./configure</code> script when configuring the
-    the package.</p>
+    <p>On line 12, we tell Buildroot to pass a custom configure
+    option, that will be passed to the <code>./configure</code> script
+    before configuring and building the package.</p>
+
+    <p>On line 13, we declare our dependencies, so that they are built
+    before the build process of our package starts.</p>
+
+    <p>Finally, on line line 14, we invoke the
+    <code>AUTOTARGETS</code> macro that generates all the Makefile
+    rules that actually allows the package to be built.</p>
+
+    <h4><a name="autotools-reference"></a>Makefile for autotools
+    packages : reference</h4>
+
+    <p>The main macro of the autotools package infrastructure is
+    <code>AUTOTARGETS</code>. It has the same number of arguments and
+    the same semantic as the <code>GENTARGETS</code> macro, which is
+    the main macro of the generic package infrastructure. For
+    autotools packages, the ability to have target and host packages
+    is also available (and is actually widely used).</p>
+
+    <p>Just like the generic infrastructure, the autotools
+    infrastructure works by defining a number of variables before
+    calling the <code>AUTOTARGETS</code> macro.</p>
+
+    <p>First, all the package meta-information variables that exist in
+    the generic infrastructure also exist in the autotools
+    infrastructure: <code>LIBFOO_VERSION</code>,
+    <code>LIBFOO_SOURCE</code>, <code>LIBFOO_PATCH</code>,
+    <code>LIBFOO_SITE</code>, <code>LIBFOO_SUBDIR</code>,
+    <code>LIBFOO_DEPENDENCIES</code>,
+    <code>LIBFOO_INSTALL_STAGING</code>,
+    <code>LIBFOO_INSTALL_TARGET</code>.</p>
+
+    <p>A few additional variables, specific to the autotools
+    infrastructure, can also be defined. Many of them are only useful
+    in very specific cases, typical packages will therefore only use a
+    few of them.</p>
+
+    <ul>
+
+      <li><code>LIBFOO_SUBDIR</code> may contain the name of a
+      subdirectory inside the package that contains the configure
+      script. This is useful, if for example, the main configure
+      script is not at the root of the tree extracted by the
+      tarball. If <code>HOST_LIBFOO_SUBDIR</code> is not specified, it
+      defaults to <code>LIBFOO_SUBDIR</code>.</li>
+
+      <li><code>LIBFOO_CONF_ENV</code>, to specify additional
+      environment variables to pass to the configure script. By
+      default, empty.</li>
+
+      <li><code>LIBFOO_CONF_OPT</code>, to specify additional
+      configure options to pass to the configure script. By default,
+      empty.</li>
+
+      <li><code>LIBFOO_MAKE</code>, to specify an
+      alternate <code>make</code> command. This is typically useful
+      when parallel make it enabled in the configuration
+      (using <code>BR2_JLEVEL</code>) but that this feature should be
+      disabled for the given package, for one reason or another. By
+      default, set to <code>$(MAKE)</code>. If parallel building is
+      not supported by the package, then it should
+      do <code>LIBFOO_MAKE=$(MAKE1)</code>.</li>
+
+      <li><code>LIBFOO_MAKE_ENV</code>, to specify additional
+      environment variables to pass to make in the build step. These
+      are passed before the <code>make</code> command. By default,
+      empty.</li>
+
+      <li><code>LIBFOO_MAKE_OPT</code>, to specify additional
+      variables to pass to make in the build step. These are passed
+      after the <code>make</code> command. By default, empty.</li>
+
+      <li><code>LIBFOO_AUTORECONF</code>, tells whether the package
+      should be autoreconfigured or not (i.e, if the configure script
+      and Makefile.in files should be re-generated by re-running
+      autoconf, automake, libtool, etc.). Valid values
+      are <code>YES</code> and <code>NO</code>. By default, the value
+      is <code>NO</code></li>
+
+      <li><code>LIBFOO_AUTORECONF_OPT</code> to specify additional
+      options passed to the <i>autoreconf</i> program
+      if <code>LIBFOO_AUTORECONF=YES</code>. By default, empty.</li>
+
+      <li><code>LIBFOO_LIBTOOL_PATCH</code> tells whether the
+      Buildroot patch to fix libtool cross-compilation issues should
+      be applied or not. Valid values are <code>YES</code>
+      and <code>NO</code>. By default, the value
+      is <code>YES</code></li>
+
+      <li><code>LIBFOO_USE_CONFIG_CACHE</code> tells whether the
+      configure script should really on a cache file that caches test
+      results from previous configure script. Usually, this variable
+      should be left to its default value. Only for specific packages
+      having issues with the configure cache can set this variable to
+      the <code>NO</code> value (but this is more a work-around than a
+      really fix)</li>
+
+      <li><code>LIBFOO_INSTALL_STAGING_OPT</code> contains the make
+      options used to install the package to the staging directory. By
+      default, the value is <code>DESTDIR=$$(STAGING_DIR)
+      install</code>, which is correct for most autotools packages. It
+      is still possible to override it.</li>
+
+      <li><code>LIBFOO_INSTALL_TARGET_OPT</code> contains the make
+      options used to install the package to the target directory. By
+      default, the value is <code>DESTDIR=$$(TARGET_DIR)
+      install-strip</code> if <code>BR2_ENABLE_DEBUG</code> is not
+      set, and <code>DESTDIR=$$(TARGET_DIR) install-exec</code>
+      if <code>BR2_ENABLE_DEBUG</code> is set. These default values
+      are correct for most autotools packages, but it is still
+      possible to override them if needed.</li>
+
+      <li><code>LIBFOO_CLEAN_OPT</code> contains the make options used
+      to clean the package. By default, the value
+      is <code>clean</code>.</li>
+
+      <li><code>LIBFOO_UNINSTALL_STAGING_OPT</code>, contains the make
+      options used to uninstall the package from the staging
+      directory. By default, the value is
+      <code>DESTDIR=$$(STAGING_DIR) uninstall</code>.</li>
+
+      <li><code>LIBFOO_UNINSTALL_TARGET_OPT</code>, contains the make
+      options used to uninstall the package from the target
+      directory. By default, the value is
+      <code>DESTDIR=$$(TARGET_DIR) uninstall</code>.</li>
+
+    </ul>
 
-    <p>On <a href="#ex1line12">line 12</a>, we declare our
-    dependencies so that they are built before the build process of
-    our package starts.</p>
+    <p>With the autotools infrastructure, all the steps required to
+    build and install the packages are already defined, and they
+    generally work well for most autotools-based packages. However,
+    when required, it is still possible to customize what is done in
+    particular step:</p>
 
-    <p>Finally, on line <a href="#ex1line13">line 13</a>, we invoke
-    the <code>package/Makefile.autotools.in</code> magic to get things
-    working.</p>
+    <ul>
+
+      <li>By adding a post-operation hook (after extract, patch,
+      configure, build or install). See the reference documentation of
+      the generic infrastructure for details.</li>
 
-    <p>For more details about the available variables and options, see
-    the comment at the top of
-    <code>package/Makefile.autotools.in</code> and the examples in all
-    the available packages.</p>
+      <li>By overriding one of the steps. For example, even if the
+      autotools infrastructure is used, if the package
+      <code>.mk</code> defines its own
+      <code>LIBFOO_CONFIGURE_CMDS</code> variable, it will be used
+      instead of the default autotools one. However, using this method
+      should be restricted to very specific cases. Do not use it in
+      the general case.</li>
+
+    </ul>
 
-    <p>The second solution, suitable for every type of package, looks
-    like this&nbsp;:</p>
+    <h4><a name="manual-tutorial"></a>Manual Makefile : tutorial</h4>
 
+    <p><b>NOTE: new manual makefiles should not be created, and
+    existing manual makefiles should be converted either to the
+    generic infrastructure or the autotools infrastructure. This
+    section is only kept to document the existing manual makefiles and
+    help understanding how they work.</b></p>
 
 <pre>
      <a name="ex2line1" id="ex2line1">1</a>  #############################################################
-- 
1.6.3.3
