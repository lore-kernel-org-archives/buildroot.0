From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Tue, 28 Apr 2009 20:58:58 +0000 (UTC)
Subject: [Buildroot] svn commit: [26233] trunk/buildroot/docs
Message-ID: <20090428205858.41B687644D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2009-04-28 20:58:57 +0000 (Tue, 28 Apr 2009)
New Revision: 26233

Log:
Documentation cleanups

 * Add the section describing the project feature to the table of
   contents
 * Change the formatting of titles in the section on the project
   feature
 * Mention that the section on project feature is obsolete since the
   feature has now been implemented
 * Remove the duplication about two different sections documenting
   basically the same thing : how to use the Buildroot toolchain.



Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2009-04-28 18:43:06 UTC (rev 26232)
+++ trunk/buildroot/docs/buildroot.html	2009-04-28 20:58:57 UTC (rev 26233)
@@ -32,9 +32,10 @@
       <li><a href="#custom_uclibc">Customizing the uClibc
       configuration</a></li>
       <li><a href="#buildroot_innards">How Buildroot works</a></li>
-      <li><a href="#using_toolchain">Using the uClibc toolchain</a></li>
-      <li><a href="#toolchain_standalone">Using the uClibc toolchain
-      outside of Buildroot</a></li>
+      <li><a href="#multi_project"Building several projects in the
+      same buildroot source tree</a></li>
+      <li><a href="#using_toolchain">Using the uClibc toolchain
+      outside Buildroot</a></li>
       <li><a href="#downloaded_packages">Location of downloaded packages</a>
       </li>
       <li><a href="#add_software">Extending Buildroot with more
@@ -524,8 +525,11 @@
     <h2><a name="multi_project" id="multi_project"></a>Building several
       projects in the same buildroot source tree</h2>
 
-    <p><b>BACKGROUND</b></p>
+    <p><i>Note: the contents of this section are obsolete since this
+    feature has been implemented.</i></p>
 
+    <h3>Background</h3>
+
     <p>Buildroot has always supported building several projects in the same
     tree if each project was for a different architecture. </p>
 
@@ -560,9 +564,8 @@
     was also duplicated, so each </code>package</code> would also
     be rebuilt once per project, resulting in even longer build times.</p>
 
+    <h3>Project to share toolchain and package builds</h3>
 
-    <p><b>PROJECT TO SHARE TOOLCHAIN AND PACKAGE BUILDS</b></p>
-
     <p>Work has started on a project which will allow the user to build
     multiple root file systems for the same architecture in the same tree.
     The toolchain and the package build directory will be shared, but each
@@ -591,7 +594,7 @@
     <p>Only packages, not used by the first project, will have to go
     through the normal extract-configure-compile flow. </p>
 
-    <p><b>IMPLEMENTATION</b></p>
+    <h3>Implementation</h3>
 
     <p>The core of the solution is the introduction
     of two new directories: </p>
@@ -646,7 +649,7 @@
     <p>The resulting binaries for all architectures are stored in the
     <code>&quot;$(BINARIES_DIR)&quot;</code> directory. <p>
 
-    <p><b>SUMMARY</b></p>
+    <h3>Summary</h3>
 
     <p>The project will share directories which can be share without
     conflicts, but will use unique build directories, where the user
@@ -693,7 +696,7 @@
 	defaults to "make menuconfig".
      </p>
 
-    <h2><a name="Todo" id="Todo"></a>Todo</h2>
+    <h3>Todo</h3>
     <ol>
 
      <li>Configurable packages</li>
@@ -763,7 +766,7 @@
      </ol>
 
     <h2><a name="using_toolchain" id="using_toolchain"></a>Using the
-    uClibc toolchain</h2>
+    uClibc toolchain outside Buildroot</h2>
 
     <p>You may want to compile your own programs or other software
     that are not packaged in Buildroot. In order to do this, you can
@@ -791,33 +794,20 @@
 mips-linux-gcc -o foo foo.c
 </pre>
 
-    <p><b>Important</b> : do not try to move a gcc-3.x toolchain to an other
-    directory, it won't work. There are some hardcoded paths in the
-    <i>gcc</i> configuration. If the default toolchain directory
-    doesn't suit your needs, please refer to the <a
-    href="#toolchain_standalone">Using the uClibc toolchain outside of
-    buildroot</a> section. </p>
-    <p>If you are using a current gcc-4.x, then use --sysroot and -isysroot
-    since these toolchains have fully functional sysroot support. No
-    hardcoded paths do exist in these configurations. </p>
+     <p><b>Important</b> : do not try to move a gcc-3.x toolchain to an other
+     directory, it won't work. There are some hardcoded paths in the
+     <i>gcc</i> configuration. If you are using a current gcc-4.x, it
+     is possible to relocate the toolchain, but then
+     <code>--sysroot</code> must be passed every time the compiler is
+     called to tell where the libraries and header files are, which
+     might be cumbersome.</p>
 
-    <h2><a name="toolchain_standalone" id="toolchain_standalone"></a>Using the
-    uClibc toolchain outside of buildroot</h2>
+     <p>It is also possible to generate the Buildroot toolchain in
+     another directory than <code>build_ARCH/staging_dir</code> using
+     the <code>Build options -&gt; Toolchain and header file
+     location</code> option. This could be useful if the toolchain
+     must be shared with other users.</p>
 
-    <p>By default, the cross-compilation toolchain is generated inside
-    <code>build_ARCH/staging_dir/</code>. But sometimes, it may be useful to
-    install it somewhere else, so that it can be used to compile other programs
-    or by other users. Moving the <code>build_ARCH/staging_dir/</code>
-    directory elsewhere is <b>not possible if using gcc-3.x</b>, because there
-    are some hardcoded paths in the toolchain configuration. This works, thanks
-    to sysroot support, with current, stable gcc-4.x toolchains, of course. </p>
-
-    <p>If you want to use the generated gcc-3.x toolchain for other purposes,
-    you can configure Buildroot to generate it elsewhere using the
-    option of the configuration tool : <code>Build options -&gt;
-    Toolchain and header file location</code>, which defaults to
-    <code>$(BUILD_DIR)/staging_dir/</code>. </p>
-
     <h2><a name="downloaded_packages"
     id="downloaded_packages"></a>Location of downloaded packages</h2>
 
@@ -1173,13 +1163,12 @@
       <li><a href="http://www.uclibc.org/">http://www.uclibc.org/</a></li>
       <li><a href="http://www.busybox.net/">http://www.busybox.net/</a></li>
     </ul>
-
   </div>
 <!--
-	<a href="http://validator.w3.org/check?uri=referer"><img
-	border="0" height="31" width="88"
-	src="images/valid-html401.png"
-	alt="Valid HTML"></img></a>
+       <a href="http://validator.w3.org/check?uri=referer"><img
+       border="0" height="31" width="88"
+       src="images/valid-html401.png"
+       alt="Valid HTML"></img></a>
 -->
 
 </body>
