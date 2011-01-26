From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 26 Jan 2011 23:22:32 +0100
Subject: [Buildroot] [git commit master 1/1] doc: add CMAKETARGETS
	documentation
Message-ID: <20110126222431.82B818D23E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5bd96726f37f56d66f82538a7cd470a920bfba18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |  151 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 files changed, 147 insertions(+), 4 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 9d6e835..a5444cc 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -756,6 +756,8 @@ $(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
           <li><a href="#generic-reference">Makefile for generic packages : reference</a></li>
           <li><a href="#autotools-tutorial">Makefile for autotools-based packages : tutorial</a></li>
           <li><a href="#autotools-reference">Makefile for autotools-based packages : reference</a></li>
+          <li><a href="#cmake-tutorial">Makefile for CMake-based packages : tutorial</a></li>
+          <li><a href="#cmake-reference">Makefile for CMake-based packages : reference</a></li>
           <li><a href="#manual-tutorial">Manual Makefile : tutorial</a></li>
         </ul>
       </li>
@@ -1331,13 +1333,154 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
       general case.</li>
     </ul>
 
+    <h4 id="cmake-tutorial">Makefile for CMake-based packages : tutorial</h4>
+
+    <p>First, let's see how to write a <code>.mk</code> file for a CMake-based
+    package, with an example :</p>
+
+<pre>
+<span style="color: #000000">01:</span><span style="font-style: italic; color: #9A1900"> #############################################################</span>
+<span style="color: #000000">02:</span><span style="font-style: italic; color: #9A1900"> #</span>
+<span style="color: #000000">03:</span><span style="font-style: italic; color: #9A1900"> # libfoo</span>
+<span style="color: #000000">04:</span><span style="font-style: italic; color: #9A1900"> #</span>
+<span style="color: #000000">05:</span><span style="font-style: italic; color: #9A1900"> #############################################################</span>
+<span style="color: #000000">06:</span><span style="color: #009900"> LIBFOO_VERSION</span> = 1.0
+<span style="color: #000000">07:</span><span style="color: #009900"> LIBFOO_SOURCE</span> = libfoo-<span style="color: #009900">$(LIBFOO_VERSION)</span>.tar.gz
+<span style="color: #000000">08:</span><span style="color: #009900"> LIBFOO_SITE</span> = http://www.foosoftware.org/download
+<span style="color: #000000">09:</span><span style="color: #009900"> LIBFOO_INSTALL_STAGING</span> = YES
+<span style="color: #000000">10:</span><span style="color: #009900"> LIBFOO_INSTALL_TARGET</span> = YES
+<span style="color: #000000">11:</span><span style="color: #009900"> LIBFOO_CONF_OPT</span> = -DBUILD_DEMOS=ON
+<span style="color: #000000">12:</span><span style="color: #009900"> LIBFOO_DEPENDENCIES</span> = libglib2 host-pkg-config
+<span style="color: #000000">13:</span>
+<span style="color: #000000">14:</span><span style="color: #009900"> $(eval $(call CMAKETARGETS,package,libfoo))</span>
+</pre>
+
+    <p>On line 6, we declare the version of the package.</p>
+
+    <p>On line 7 and 8, we declare the name of the tarball and the location
+    of the tarball on the Web. Buildroot will automatically download the
+    tarball from this location.</p>
+
+    <p>On line 9, we tell Buildroot to install the package to the staging
+    directory. The staging directory, located in <code>output/staging/</code>
+    is the directory where all the packages are installed, including their
+    development files, etc. By default, packages are not installed to the
+    staging directory, since usually, only libraries need to be installed in
+    the staging directory: their development files are needed to compile
+    other libraries or applications depending on them. Also by default, when
+    staging installation is enabled, packages are installed in this location
+    using the <code>make install</code> command.</p>
+
+    <p>On line 10, we tell Buildroot to also install the package to the
+    target directory. This directory contains what will become the root
+    filesystem running on the target. Usually, we try not to install header
+    files and to install stripped versions of the binary. By default, target
+    installation is enabled, so in fact, this line is not strictly
+    necessary. Also by default, packages are installed in this location
+    using the <code>make install</code> command.</p>
+
+    <p>On line 11, we tell Buildroot to pass custom options to CMake when it is
+    configuring the package.</p>
+
+    <p>On line 12, we declare our dependencies, so that they are built
+    before the build process of our package starts.</p>
+
+    <p>Finally, on line line 14, we invoke the <code>CMAKETARGETS</code>
+    macro that generates all the Makefile rules that actually allows the
+    package to be built.</p>
+
+    <h4 id="cmake-reference">Makefile for CMake packages : reference</h4>
+
+    <p>The main macro of the CMake package infrastructure is
+    <code>CMAKETARGETS</code>. It has the same number of arguments and the
+    same semantic as the <code>GENTARGETS</code> macro, which is the main
+    macro of the generic package infrastructure. For CMake packages, the
+    ability to have target and host packages is also available.</p>
+
+    <p>Just like the generic infrastructure, the CMake infrastructure
+    works by defining a number of variables before calling the
+    <code>CMAKETARGETS</code> macro.</p>
+
+    <p>First, all the package metadata information variables that exist in the
+    generic infrastructure also exist in the CMake infrastructure:
+    <code>LIBFOO_VERSION</code>, <code>LIBFOO_SOURCE</code>,
+    <code>LIBFOO_PATCH</code>, <code>LIBFOO_SITE</code>,
+    <code>LIBFOO_SUBDIR</code>, <code>LIBFOO_DEPENDENCIES</code>,
+    <code>LIBFOO_INSTALL_STAGING</code>, <code>LIBFOO_INSTALL_TARGET</code>.</p>
+
+    <p>A few additional variables, specific to the CMake infrastructure,
+    can also be defined. Many of them are only useful in very specific
+    cases, typical packages will therefore only use a few of them.</p>
+
+    <ul>
+      <li><code>LIBFOO_SUBDIR</code> may contain the name of a subdirectory
+      inside the package that contains the main CMakeLists.txt file. This is
+      useful, if for example, the main CMakeLists.txt file is not at the root
+      of the tree extracted by the tarball. If <code>HOST_LIBFOO_SUBDIR</code>
+      is not specified, it defaults to <code>LIBFOO_SUBDIR</code>.</li>
+
+      <li><code>LIBFOO_CONF_ENV</code>, to specify additional environment
+      variables to pass to CMake. By default, empty.</li>
+
+      <li><code>LIBFOO_CONF_OPT</code>, to specify additional configure
+      options to pass to CMake. By default, empty.</li>
+
+      <li><code>LIBFOO_MAKE</code>, to specify an alternate <code>make</code>
+      command. This is typically useful when parallel make is enabled in
+      the configuration (using <code>BR2_JLEVEL</code>) but that this
+      feature should be disabled for the given package, for one reason or
+      another. By default, set to <code>$(MAKE)</code>. If parallel building
+      is not supported by the package, then it should be set to
+      <code>LIBFOO_MAKE=$(MAKE1)</code>.</li>
+
+      <li><code>LIBFOO_MAKE_ENV</code>, to specify additional environment
+      variables to pass to make in the build step. These are passed before
+      the <code>make</code> command. By default, empty.</li>
+
+      <li><code>LIBFOO_MAKE_OPT</code>, to specify additional variables to
+      pass to make in the build step. These are passed after the
+      <code>make</code> command. By default, empty.</li>
+
+      <li><code>LIBFOO_INSTALL_STAGING_OPT</code> contains the make options
+      used to install the package to the staging directory. By default, the
+      value is <code>DESTDIR=$$(STAGING_DIR) install</code>, which is
+      correct for most CMake packages. It is still possible to override
+      it.</li>
+
+      <li><code>LIBFOO_INSTALL_TARGET_OPT</code> contains the make options
+      used to install the package to the target directory. By default, the
+      value is <code>DESTDIR=$$(TARGET_DIR) install</code>. The default
+      value is correct for most CMake packages, but it is still possible
+      to override it if needed.</li>
+
+      <li><code>LIBFOO_CLEAN_OPT</code> contains the make options used to
+      clean the package. By default, the value is <code>clean</code>.</li>
+    </ul>
+
+    <p>With the CMake infrastructure, all the steps required to build
+    and install the packages are already defined, and they generally work
+    well for most CMake-based packages. However, when required, it is
+    still possible to customize what is done in any particular step:</p>
+
+    <ul>
+      <li>By adding a post-operation hook (after extract, patch, configure,
+      build or install). See the reference documentation of the generic
+      infrastructure for details.</li>
+
+      <li>By overriding one of the steps. For example, even if the CMake
+      infrastructure is used, if the package <code>.mk</code> file defines its
+      own <code>LIBFOO_CONFIGURE_CMDS</code> variable, it will be used
+      instead of the default CMake one. However, using this method
+      should be restricted to very specific cases. Do not use it in the
+      general case.</li>
+    </ul>
+
     <h4 id ="manual-tutorial">Manual Makefile : tutorial</h4>
 
     <p><b>NOTE: new manual makefiles should not be created, and existing
-    manual makefiles should be converted either to the generic
-    infrastructure or the autotools infrastructure. This section is only
-    kept to document the existing manual makefiles and to help understand
-    how they work.</b></p>
+    manual makefiles should be converted either to the generic, autotools
+    or cmake infrastructure. This section is only kept to document the existing
+    manual makefiles and to help understand how they work.</b></p>
 
 <pre>
 01: #############################################################
-- 
1.7.3.4
