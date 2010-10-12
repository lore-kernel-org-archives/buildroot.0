From: Martin Banky <martin.banky@gmail.com>
Date: Tue, 12 Oct 2010 15:17:53 -0700
Subject: [Buildroot] [PATCH 2/4] buildroot.html: html code clean-up and
	other issues - Part1
In-Reply-To: <1286921875-32681-1-git-send-email-Martin.Banky@gmail.com>
References: <1286921875-32681-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286921875-32681-3-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current DocType declaration was incorrect. It is neither xhtml strict nor
xhtml transitional. So, instead of dealing with that issue, converted it to
validated Html5.

Fixed white-space errors.
Removed validator html4.01 code.
Color corrected the code sections.
Removed redundant or useless html code.
Changed foo to libfoo, for consistency.
Changed page bookmarking to use header id's.
Re-flowed paragraphs to line break at 80 characters.
Re-formatted the code sections for consistency and correctness.
Kept all list items, headings, and href's on a single line (where possible).

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 docs/buildroot.html | 2138 ++++++++++++++++++++++++---------------------------
 1 files changed, 1009 insertions(+), 1129 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index fc754e5..5eff1ba 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1,12 +1,10 @@
-<?xml version="1.0" encoding="iso-8859-1"?>
-<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
-    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
+<!DOCTYPE html>
+<html lang="en">
 
-<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
   <title>Buildroot - Usage and documentation</title>
-  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
-  <link rel="stylesheet" type="text/css" href="stylesheet.css" />
+  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
+  <link rel="stylesheet" href="stylesheet.css">
 </head>
 
 <body>
@@ -15,26 +13,21 @@
       <h1>Buildroot</h1>
     </div>
 
-    <p><a href="http://buildroot.net/">Buildroot</a>
-    usage and documentation by Thomas Petazzoni. Contributions from
-    Karsten Kruse, Ned Ludd, Martin Herren and others. </p>
+    <p><a href="http://buildroot.net/">Buildroot</a> usage and documentation 
+    by Thomas Petazzoni. Contributions from Karsten Kruse, Ned Ludd, Martin 
+    Herren and others.</p>
 
     <ul>
-
       <li><a href="#about">About Buildroot</a></li>
       <li><a href="#download">Obtaining Buildroot</a></li>
       <li><a href="#using">Using Buildroot</a></li>
       <li><a href="#custom_targetfs">Customizing the generated target filesystem</a></li>
-      <li><a href="#custom_busybox">Customizing the Busybox
-      configuration</a></li>
-      <li><a href="#custom_uclibc">Customizing the uClibc
-      configuration</a></li>
-      <li><a href="#custom_linux26">Customizing the Linux kernel
-      configuration</a></li>
+      <li><a href="#custom_busybox">Customizing the Busybox configuration</a></li>
+      <li><a href="#custom_uclibc">Customizing the uClibc configuration</a></li>
+      <li><a href="#custom_linux26">Customizing the Linux kernel configuration</a></li>
       <li><a href="#rebuilding_packages">Understanding how to rebuild packages</a></li>
       <li><a href="#buildroot_innards">How Buildroot works</a></li>
-      <li><a href="#using_toolchain">Using the uClibc toolchain
-      outside Buildroot</a></li>
+      <li><a href="#using_toolchain">Using the uClibc toolchain outside Buildroot</a></li>
       <li><a href="#external_toolchain">Use an external toolchain</a></li>
       <li><a href="#downloaded_packages">Location of downloaded packages</a></li>
       <li><a href="#add_packages">Adding new packages to Buildroot</a></li>
@@ -42,126 +35,124 @@
       <li><a href="#links">Resources</a></li>
     </ul>
 
-    <h2><a name="about" id="about"></a>About Buildroot</h2>
-
-    <p>Buildroot is a set of Makefiles and patches that allows you to
-    easily generate a cross-compilation toolchain, a root filesystem
-    and a Linux kernel image for your target. Buildroot can be used
-    for one, two or all of these options, independently.</p>
-
-    <p>Buildroot is useful mainly for people working with embedded systems.
-    Embedded systems often use processors that are not the regular x86
-    processors everyone is used to having in his PC. They can be PowerPC
-    processors, MIPS processors, ARM processors, etc. </p>
-
-    <p>A compilation toolchain is the set of tools that allows you to
-    compile code for your system. It consists of a compiler (in our
-    case, <code>gcc</code>), binary utils like assembler and linker
-    (in our case, <code>binutils</code>) and a C standard library (for
-    example <a href="http://www.gnu.org/software/libc/libc.html">GNU
-    Libc</a>, <a href="http://www.uclibc.org/">uClibc</a> or <a
-    href="http://www.fefe.de/dietlibc/">dietlibc</a>). The system
-    installed on your development station certainly already has a
-    compilation toolchain that you can use to compile an application that
-    runs on your system. If you're using a PC, your compilation
-    toolchain runs on an x86 processor and generates code for an x86
-    processor. Under most Linux systems, the compilation toolchain
-    uses the GNU libc (glibc) as the C standard library.  This compilation
-    toolchain is called the &quot;host compilation toolchain&quot;.
-    The machine on which it is running, and on which you're
-    working, is called the &quot;host system&quot;. The compilation toolchain
-    is provided by your distribution, and Buildroot has nothing to do
-    with it (other than using it to build a cross-compilation toolchain
-    and other tools that are run on the development host). </p>
-
-    <p>As said above, the compilation toolchain that comes with your system
-    runs on and generates code for the processor in your host system. As your
-    embedded system has a different processor, you need a cross-compilation
-    toolchain &mdash; a compilation toolchain that runs on your host system but
-    generates code for your target system (and target processor). For
-    example, if your host system uses x86 and your target system uses ARM, the
-    regular compilation toolchain on your host runs on x86 and generates code
-    for x86, while the cross-compilation toolchain runs on x86 and generates
-    code for ARM. </p>
-
-    <p>Even if your embedded system uses an x86 processor, you might be interested
-    in Buildroot for two reasons:</p>
+    <h2 id="about">About Buildroot</h2>
+
+    <p>Buildroot is a set of Makefiles and patches that allows you to easily 
+    generate a cross-compilation toolchain, a root filesystem and a Linux 
+    kernel image for your target. Buildroot can be used for one, two or all 
+    of these options, independently.</p>
+
+    <p>Buildroot is useful mainly for people working with embedded systems. 
+    Embedded systems often use processors that are not the regular x86 
+    processors everyone is used to having in his PC. They can be PowerPC 
+    processors, MIPS processors, ARM processors, etc.</p>
+
+    <p>A compilation toolchain is the set of tools that allows you to 
+    compile code for your system. It consists of a compiler (in our case, 
+    <code>gcc</code>), binary utils like assembler and linker (in our case, 
+    <code>binutils</code>) and a C standard library (for example 
+    <a href="http://www.gnu.org/software/libc/libc.html">GNU Libc</a>, 
+    <a href="http://www.uclibc.org/">uClibc</a> or 
+    <a href="http://www.fefe.de/dietlibc/">dietlibc</a>). The system installed 
+    on your development station certainly already has a compilation 
+    toolchain that you can use to compile an application that runs on your 
+    system. If you're using a PC, your compilation toolchain runs on an x86 
+    processor and generates code for an x86 processor. Under most Linux 
+    systems, the compilation toolchain uses the GNU libc (glibc) as the C 
+    standard library.  This compilation toolchain is called the &quot;host 
+    compilation toolchain&quot;. The machine on which it is running, and on 
+    which you're working, is called the &quot;host system&quot;. The 
+    compilation toolchain is provided by your distribution, and Buildroot 
+    has nothing to do with it (other than using it to build a 
+    cross-compilation toolchain and other tools that are run on the 
+    development host).</p>
+
+    <p>As said above, the compilation toolchain that comes with your system 
+    runs on and generates code for the processor in your host system. As 
+    your embedded system has a different processor, you need a 
+    cross-compilation toolchain &mdash; a compilation toolchain that runs on 
+    your host system but generates code for your target system (and target 
+    processor). For example, if your host system uses x86 and your target 
+    system uses ARM, the regular compilation toolchain on your host runs on 
+    x86 and generates code for x86, while the cross-compilation toolchain 
+    runs on x86 and generates code for ARM.</p>
+
+    <p>Even if your embedded system uses an x86 processor, you might be 
+    interested in Buildroot for two reasons:</p>
 
     <ul>
-      <li>The compilation toolchain on your host certainly uses the GNU Libc
-      which is a complete but huge C standard library. Instead of using GNU
-      Libc on your target system, you can use uClibc which is a tiny C standard
-      library. If you want to use this C library, then you need a compilation
-      toolchain to generate binaries linked with it. Buildroot can do that for
-      you. </li>
+      <li>The compilation toolchain on your host certainly uses the GNU Libc 
+      which is a complete but huge C standard library. Instead of using GNU 
+      Libc on your target system, you can use uClibc which is a tiny C 
+      standard library. If you want to use this C library, then you need a 
+      compilation toolchain to generate binaries linked with it. Buildroot 
+      can do that for you.</li>
 
       <li>Buildroot automates the building of a root filesystem with all needed
-      tools like busybox. That makes it much easier than doing it by hand. </li>
+      tools like busybox. That makes it much easier than doing it by hand.</li>
     </ul>
 
     <p>You might wonder why such a tool is needed when you can compile
     <code>gcc</code>, <code>binutils</code>, <code>uClibc</code> and all
-    the other tools by hand.
-    Of course doing so is possible. But, dealing with all of the configure options
-    and problems of every <code>gcc</code> or <code>binutils</code>
-    version is very time-consuming and uninteresting. Buildroot automates this
-    process through the use of Makefiles and has a collection of patches for
-    each <code>gcc</code> and <code>binutils</code> version to make them work
-    on most architectures. </p>
+    the other tools by hand. Of course doing so is possible. But, dealing with 
+    all of the configure options and problems of every <code>gcc</code> or 
+    <code>binutils</code> version is very time-consuming and uninteresting. 
+    Buildroot automates this process through the use of Makefiles and has a 
+    collection of patches for each <code>gcc</code> and <code>binutils</code> 
+    version to make them work on most architectures.</p>
 
     <p>Moreover, Buildroot provides an infrastructure for reproducing
-    the build process of your kernel, cross-toolchain, and embedded root filesystem. Being able to
-    reproduce the build process will be useful when a component needs
-    to be patched or updated or when another person is supposed to
-    take over the project.</p>
+    the build process of your kernel, cross-toolchain, and embedded root 
+    filesystem. Being able to reproduce the build process will be useful when a 
+    component needs to be patched or updated or when another person is supposed 
+    to take over the project.</p>
 
-    <h2><a name="download" id="download"></a>Obtaining Buildroot</h2>
+    <h2 id="download">Obtaining Buildroot</h2>
 
     <p>Buildroot releases are made approximately every 3
     months. Direct Git access and daily snapshots are also
     available if you want more bleeding edge.</p>
 
-    <p>Releases are available at <a
-    href="http://buildroot.net/downloads/">http://buildroot.net/downloads/</a>.</p>
+    <p>Releases are available at 
+    <a href="http://buildroot.net/downloads/">http://buildroot.net/downloads/</a>.</p>
 
-    <p>The latest snapshot is always available at <a
-    href="http://buildroot.net/downloads/snapshots/buildroot-snapshot.tar.bz2">http://buildroot.net/downloads/snapshots/buildroot-snapshot.tar.bz2</a>,
-    and previous snapshots are also available at <a
-    href="http://buildroot.net/downloads/snapshots/">http://buildroot.net/downloads/snapshots/</a>. </p>
+    <p>The latest snapshot is always available at 
+    <a href="http://buildroot.net/downloads/snapshots/buildroot-snapshot.tar.bz2">http://buildroot.net/downloads/snapshots/buildroot-snapshot.tar.bz2</a>,
+    and previous snapshots are also available at 
+    <a href="http://buildroot.net/downloads/snapshots/">http://buildroot.net/downloads/snapshots/</a>.</p>
 
     <p>To download Buildroot using Git you can simply follow
-    the rules described on the &quot;Accessing Git&quot; page (<a href=
-    "http://buildroot.net/git.html">http://buildroot.net/git.html</a>)
-    of the Buildroot website (<a href=
-    "http://buildroot.net">http://buildroot.net</a>).
-    For the impatient, here's a quick
-    recipe:</p>
-
- <pre>
+    the rules described on the &quot;Accessing Git&quot; page 
+    (<a href= "http://buildroot.net/git.html">http://buildroot.net/git.html</a>)
+    of the Buildroot website 
+    (<a href="http://buildroot.net">http://buildroot.net</a>).
+    For the impatient, here's a quick recipe:</p>
+
+<pre>
  $ git clone git://git.buildroot.net/buildroot
 </pre>
 
-    <h2><a name="using" id="using"></a>Using Buildroot</h2>
+    <h2 id="using">Using Buildroot</h2>
 
     <p>Buildroot has a nice configuration tool similar to the one you can find
-    in the Linux kernel (<a href=
-    "http://www.kernel.org/">http://www.kernel.org/</a>) or in Busybox
+    in the Linux kernel 
+    (<a href="http://www.kernel.org/">http://www.kernel.org/</a>) or in Busybox
     (<a href="http://www.busybox.org/">http://www.busybox.org/</a>). Note that
-    you can (and should) build everything as a normal user. There is no need to be root to
-    configure and use Buildroot. The first step is to run the configuration
-    assistant:</p>
+    you can (and should) build everything as a normal user. There is no need to 
+    be root to configure and use Buildroot. The first step is to run the 
+    configuration assistant:</p>
 
 <pre>
  $ make menuconfig
 </pre>
 
-<p>to run the curses-based configurator, or</p>
+    <p>to run the curses-based configurator, or</p>
 
 <pre>
  $ make xconfig
 </pre>
 
-or
+    <p>or</p>
 
 <pre>
  $ make gconfig
@@ -169,22 +160,20 @@ or
 
     <p>to run the Qt3 or GTK-based configurators.</p>
 
-    <p>All of these "make" commands will need to build a configuration
-    utility, so you may need to install "development" packages for
-    relevant libraries used by the configuration utilities.
-    On Debian-like systems, the
-    <code>libncurses5-dev</code> package is required to use the
-    <i>menuconfig</i> interface, <code>libqt3-mt-dev</code> is
-    required to use the <i>xconfig</i> interface, and
-    <code>libglib2.0-dev, libgtk2.0-dev and libglade2-dev</code> are
-    needed to used the <i>gconfig</i> interface.</p>
+    <p>All of these "make" commands will need to build a configuration 
+    utility, so you may need to install "development" packages for relevant 
+    libraries used by the configuration utilities. On Debian-like systems, 
+    the <code>libncurses5-dev</code> package is required to use the <i>
+    menuconfig</i> interface, <code>libqt3-mt-dev</code> is required to use 
+    the <i>xconfig</i> interface, and <code>libglib2.0-dev, libgtk2.0-dev 
+    and libglade2-dev</code> are needed to used the <i>gconfig</i> interface.</p>
 
-    <p>For each menu entry in the configuration tool, you can find associated help
-    that describes the purpose of the entry. </p>
+    <p>For each menu entry in the configuration tool, you can find associated 
+    help that describes the purpose of the entry.</p>
 
     <p>Once everything is configured, the configuration tool generates a
     <code>.config</code> file that contains the description of your
-    configuration. It will be used by the Makefiles to do what's needed. </p>
+    configuration. It will be used by the Makefiles to do what's needed.</p>
 
 
     <p>Let's go:</p>
@@ -192,6 +181,7 @@ or
 <pre>
  $ make
 </pre>
+
     <p>This command will generally perform the following steps:</p>
     <ul>
       <li>Download source files (as required)</li>
@@ -203,76 +193,71 @@ or
     </ul>
     <p>Some of the above steps might not be performed if they are not
     selected in the Buildroot configuration.
-    </p>
+   </p>
 
-    <p>Buildroot output is stored in a single directory,
-    <code>output/</code>. This directory contains several
-    subdirectories:</p>
+    <p>Buildroot output is stored in a single directory, <code>output/</code>. 
+    This directory contains several subdirectories:</p>
 
     <ul>
-
-      <li><code>images/</code> where all the images (kernel image,
+      <li><code>images/</code> where all the images (kernel image, 
       bootloader and root filesystem images) are stored.</li>
 
-      <li><code>build/</code> where all the components except for the
-      cross-compilation toolchain are built
-      (this includes tools needed to run Buildroot on the host and packages compiled
-      for the target). The <code>build/</code> directory contains one
-      subdirectory for each of these components.</li>
-
-      <li><code>staging/</code> which contains a hierarchy similar to
-      a root filesystem hierarchy. This directory contains the
-      installation of the cross-compilation toolchain and all the
-      userspace packages selected for the target. However, this
-      directory is <i>not</i> intended to be the root filesystem for
-      the target: it contains a lot of development files, unstripped
-      binaries and libraries that make it far too big for an embedded
-      system. These development files are used to compile libraries
-      and applications for the target that depend on other
+      <li><code>build/</code> where all the components except for the 
+      cross-compilation toolchain are built (this includes tools needed to 
+      run Buildroot on the host and packages compiled for the target). The 
+      <code>build/</code> directory contains one subdirectory for each of 
+      these components.</li>
+
+      <li><code>staging/</code> which contains a hierarchy similar to a root 
+      filesystem hierarchy. This directory contains the installation of the 
+      cross-compilation toolchain and all the userspace packages selected 
+      for the target. However, this directory is <i>not</i> intended to be 
+      the root filesystem for the target: it contains a lot of development 
+      files, unstripped binaries and libraries that make it far too big for 
+      an embedded system. These development files are used to compile 
+      libraries and applications for the target that depend on other 
       libraries.</li>
 
-      <li><code>target/</code> which contains <i>almost</i> the root
-      filesystem for the target: everything needed is present except
-      the device files in <code>/dev/</code> (Buildroot can't create
-      them because Buildroot doesn't run as root and does not want to
-      run as root). Therefore, this directory <b>should not be used on
-      your target</b>. Instead, you should use one of the images
-      built in the <code>images/</code> directory. If you need an
-      extracted image of the root filesystem for booting over NFS,
-      then use the tarball image generated in <code>images/</code> and
-      extract it as root.<br/>Compared to <code>staging/</code>,
-      <code>target/</code> contains only the files and libraries needed
-      to run the selected target applications: the development files
-      (headers, etc.) are not present.</li>
-
-      <li><code>host/</code> contains the installation of tools
-      compiled for the host that are needed for the proper execution
-      of Buildroot except for the cross-compilation toolchain which is
-      installed under <code>staging/</code>.</li>
-
-      <li><code>toolchain/</code> contains the build directories for
-      the various components of the cross-compilation toolchain.</li>
-
+      <li><code>target/</code> which contains <i>almost</i> the root 
+      filesystem for the target: everything needed is present except the 
+      device files in <code>/dev/</code> (Buildroot can't create them 
+      because Buildroot doesn't run as root and does not want to run as 
+      root). Therefore, this directory <b>should not be used on your target</b>.
+      Instead, you should use one of the images built in the 
+      <code>images/</code> directory. If you need an extracted image of the 
+      root filesystem for booting over NFS, then use the tarball image 
+      generated in <code>images/</code> and extract it as root.<br/>Compared 
+      to <code>staging/</code>, <code>target/</code> contains only the 
+      files and libraries needed to run the selected target applications: 
+      the development files (headers, etc.) are not present.</li>
+
+      <li><code>host/</code> contains the installation of tools compiled for 
+      the host that are needed for the proper execution of Buildroot except 
+      for the cross-compilation toolchain which is installed under 
+      <code>staging/</code>.</li>
+
+      <li><code>toolchain/</code> contains the build directories for the 
+      various components of the cross-compilation toolchain.</li>
     </ul>
 
-    <h3><a name="offline_builds" id="offline_builds"></a>
-    Offline builds</h3>
+    <h3 id="offline_builds">Offline builds</h3>
 
     <p>If you intend to do an offline build and just want to download
     all sources that you previously selected in the configurator
     (<i>menuconfig</i>, <i>xconfig</i> or <i>gconfig</i>), then issue:</p>
+
 <pre>
  $ make source
 </pre>
+
     <p>You can now disconnect or copy the content of your <code>dl</code>
-    directory to the build-host. </p>
+    directory to the build-host.</p>
 
-    <h3><a name="building_out_of_tree" id="building_out_of_tree"></a>
-    Building out-of-tree</h3>
+    <h3 id="building_out_of_tree">Building out-of-tree</h3>
 
-    <p>Buildroot supports building out of tree with a syntax similar
-    to the Linux kernel. To use it, add O=&lt;directory&gt; to the
-    make command line:</p>
+    <p>Buildroot supports building out of tree with a syntax similar to the 
+    Linux kernel. To use it, add O=&lt;directory&gt; to the make command 
+    line:</p>
 
 <pre>
  $ make O=/tmp/build
@@ -284,172 +269,164 @@ or
  $ cd /tmp/build; make O=$PWD -C path/to/buildroot
 </pre>
 
-    <p>All the output files will be located under
-    <code>/tmp/build</code>.</p>
+    <p>All the output files will be located under <code>/tmp/build</code>.</p>
 
-    <p>When using out-of-tree builds, the Buildroot
-    <code>.config</code> and temporary files are also stored in the
-    output directory. This means that you can safely run multiple
-    builds in parallel using the same source tree as long as they use
-    unique output directories.</p>
+    <p>When using out-of-tree builds, the Buildroot <code>.config</code> and 
+    temporary files are also stored in the output directory. This means that 
+    you can safely run multiple builds in parallel using the same source 
+    tree as long as they use unique output directories.</p>
 
-    <p>For ease of use, Buildroot generates a Makefile wrapper in the
-    output directory - So after the first run, you no longer need to
-    pass <code>O=..</code> and <code>-C ..</code>, simply run (in the
-    output directory):</p>
+    <p>For ease of use, Buildroot generates a Makefile wrapper in the output 
+    directory - So after the first run, you no longer need to pass 
+    <code>O=..</code> and <code>-C ..</code>, simply run (in the output 
+    directory):</p>
 
 <pre>
  $ make &lt;target&gt;
 </pre>
 
-    <h3><a name="environment_variables" id="environment_variables"></a>
-    Environment variables</h3>
+    <h3 id="environment_variables">Environment variables</h3>
 
     <p>Buildroot also honors some environment variables when they are passed
     to <code>make</code> or set in the environment:</p>
     <ul>
-    <li><code>HOSTCXX</code>, the host C++ compiler to use</li>
-    <li><code>HOSTCC</code>, the host C compiler to use</li>
-    <li><code>UCLIBC_CONFIG_FILE=&lt;path/to/.config&gt;</code>, path
-    to the uClibc configuration file to use to compile uClibc if an
-    internal toolchain is being built</li>
-    <li><code>BUSYBOX_CONFIG_FILE=&lt;path/to/.config&gt;</code>, path
-    to the Busybox configuration file</li>
-    <li><code>BUILDROOT_DL_DIR</code> to override the directory in
-    which Buildroot stores/retrieves downloaded files</li>
+      <li><code>HOSTCXX</code>, the host C++ compiler to use</li>
+      <li><code>HOSTCC</code>, the host C compiler to use</li>
+      <li><code>UCLIBC_CONFIG_FILE=&lt;path/to/.config&gt;</code>, path to 
+      the uClibc configuration file to use to compile uClibc if an 
+      internal toolchain is being built</li>
+      <li><code>BUSYBOX_CONFIG_FILE=&lt;path/to/.config&gt;</code>, path to 
+      the Busybox configuration file</li>
+      <li><code>BUILDROOT_DL_DIR</code> to override the directory in which 
+      Buildroot stores/retrieves downloaded files</li>
     </ul>
 
     <p>An example that uses config files located in the toplevel directory and
     in your $HOME:</p>
+
 <pre>
 $ make UCLIBC_CONFIG_FILE=uClibc.config BUSYBOX_CONFIG_FILE=$HOME/bb.config
 </pre>
 
     <p>If you want to use a compiler other than the default <code>gcc</code>
     or <code>g++</code> for building helper-binaries on your host, then do</p>
+
 <pre>
 $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
 </pre>
 
-    <h2><a name="custom_targetfs" id="custom_targetfs"></a>Customizing the
-    generated target filesystem</h2>
+	<h2 id="custom_targetfs">Customizing the generated target filesystem</h2>
 
     <p>There are a few ways to customize the resulting target filesystem:</p>
 
     <ul>
-      <li>Customize the target filesystem directly and rebuild the image. The
-      target filesystem is available under <code>output/target/</code>.
-      You can simply make your changes here and run make afterwards &mdash; this will
-      rebuild the target filesystem image. This method allows you to do anything
-      to the target filesystem, but if you decide to completely rebuild your
-      toolchain and tools, these changes will be lost. </li>
-
-      <li>Customize the target filesystem skeleton available under
-      <code>fs/skeleton/</code>. You can customize
-      configuration files or other stuff here. However, the full file hierarchy
-      is not yet present because it's created during the compilation process.
-      Therefore, you can't do everything on this target filesystem skeleton, but
-      changes to it do remain even if you completely rebuild the cross-compilation
-      toolchain and the tools. <br />
-      You can also customize the <code>target/generic/device_table.txt</code>
-      file which is used by the tools that generate the target filesystem image
-      to properly set permissions and create device nodes.<br />
-      These customizations are deployed into
-      <code>output/target/</code> just before the actual image
-      is made. Simply rebuilding the image by running
-      make should propagate any new changes to the image. </li>
+      <li>Customize the target filesystem directly and rebuild the image. 
+      The target filesystem is available under <code>output/target/</code>. 
+      You can simply make your changes here and run make afterwards &mdash; 
+      this will rebuild the target filesystem image. This method allows you 
+      to do anything to the target filesystem, but if you decide to 
+      completely rebuild your toolchain and tools, these changes will be 
+      lost.</li>
+
+      <li>Customize the target filesystem skeleton available under <code>
+      fs/skeleton/</code>. You can customize configuration files or other 
+      stuff here. However, the full file hierarchy is not yet present 
+      because it's created during the compilation process. Therefore, you 
+      can't do everything on this target filesystem skeleton, but changes to 
+      it do remain even if you completely rebuild the cross-compilation 
+      toolchain and the tools. <br /> You can also customize the <code>
+      target/generic/device_table.txt</code> file which is used by the 
+      tools that generate the target filesystem image to properly set 
+      permissions and create device nodes.<br /> These customizations are 
+      deployed into <code>output/target/</code> just before the actual image 
+      is made. Simply rebuilding the image by running make should propagate 
+      any new changes to the image.</li>
 
       <li>Add support for your own target in Buildroot so that you
       have your own target skeleton (see <a href="#board_support">this
       section</a> for details).</li>
 
-      <li>In the Buildroot configuration, you can specify the path to a
-      post-build script that gets called <i>after</i> Buildroot builds
-      all the selected software but <i>before</i> the the rootfs
-      packages are assembled. The destination root filesystem folder
-      is given as the first argument to this script, and this script can
-      then be used to copy programs, static data or any other needed
-      file to your target filesystem.<br/>You should, however, use
-      this feature with care. Whenever you find that a certain package
-      generates wrong or unneeded files, you should fix that
-      package rather than work around it with a post-build cleanup script.</li>
+      <li>In the Buildroot configuration, you can specify the path to a 
+      post-build script that gets called <i>after</i> Buildroot builds all 
+      the selected software but <i>before</i> the the rootfs packages are 
+      assembled. The destination root filesystem folder is given as the 
+      first argument to this script, and this script can then be used to 
+      copy programs, static data or any other needed file to your target 
+      filesystem.<br/>You should, however, use this feature with care. 
+      Whenever you find that a certain package generates wrong or unneeded 
+      files, you should fix that package rather than work around it with a 
+      post-build cleanup script.</li>
 
       <li>A special package, <i>customize</i>, stored in
       <code>package/customize</code> can be used. You can put all the
       files that you want to see in the final target root filesystem
       in <code>package/customize/source</code> and then enable this
       special package in the configuration system.</li>
-
     </ul>
 
-    <h2><a name="custom_busybox" id="custom_busybox"></a>Customizing the
-    Busybox configuration</h2>
+    <h2 id="custom_busybox">Customizing the Busybox configuration</h2>
 
-    <p><a href="http://www.busybox.net/">Busybox</a> is very configurable, and
-    you may want to customize it. You can
-    follow these simple steps to do so. This method isn't optimal, but it's
-    simple and it works:</p>
+    <p><a href="http://www.busybox.net/">Busybox</a> is very configurable, 
+    and you may want to customize it. You can follow these simple steps to 
+    do so. This method isn't optimal, but it's simple and it works:</p>
 
     <ol>
-      <li>Do an initial compilation of Buildroot with busybox without trying to
-      customize it. </li>
+      <li>Do an initial compilation of Buildroot with busybox without 
+      trying to customize it.</li>
 
       <li>Invoke <code>make busybox-menuconfig</code>.
       The nice configuration tool appears, and you can
-      customize everything. </li>
+      customize everything.</li>
 
-      <li>Run the compilation of Buildroot again. </li>
+      <li>Run the compilation of Buildroot again.</li>
     </ol>
 
     <p>Otherwise, you can simply change the
     <code>package/busybox/busybox-&lt;version&gt;.config</code> file if you
     know the options you want to change without using the configuration tool.
     </p>
+    
     <p>If you want to use an existing config file for busybox, then see
-    section <a href="#environment_variables">environment variables</a>. </p>
+    section <a href="#environment_variables">environment variables</a>.</p>
 
-    <h2><a name="custom_uclibc" id="custom_uclibc"></a>Customizing the uClibc
-    configuration</h2>
+    <h2 id="custom_uclibc">Customizing the uClibc configuration</h2>
 
     <p>Just like <a href="#custom_busybox">BusyBox</a>, <a
     href="http://www.uclibc.org/">uClibc</a> offers a lot of
     configuration options. They allow you to select various
-    functionalities depending on your needs and limitations. </p>
+    functionalities depending on your needs and limitations.</p>
 
     <p>The easiest way to modify the configuration of uClibc is to
     follow these steps:</p>
 
     <ol>
-
       <li>Do an initial compilation of Buildroot without trying to
-      customize uClibc. </li>
+      customize uClibc.</li>
 
       <li>Invoke <code>make uclibc-menuconfig</code>.
       The nice configuration assistant, similar to
       the one used in the Linux kernel or Buildroot, appears. Make
-      your configuration changes as appropriate. </li>
+      your configuration changes as appropriate.</li>
 
       <li>Copy the <code>.config</code> file to
       <code>toolchain/uClibc/uClibc.config</code> or
       <code>toolchain/uClibc/uClibc.config-locale</code>. The former
       is used if you haven't selected locale support in Buildroot
       configuration, and the latter is used if you have selected
-      locale support. </li>
+      locale support.</li>
 
       <li>Run the compilation of Buildroot again.</li>
-
     </ol>
 
     <p>Otherwise, you can simply change
     <code>toolchain/uClibc/uClibc.config</code> or
     <code>toolchain/uClibc/uClibc.config-locale</code> without running
-    the configuration assistant. </p>
+    the configuration assistant.</p>
 
     <p>If you want to use an existing config file for uclibc, then see
-    section <a href="#environment_variables">environment variables</a>. </p>
+    section <a href="#environment_variables">environment variables</a>.</p>
 
-    <h2><a name="custom_linux26" id="custom_linux26"></a>Customizing
-    the Linux kernel configuration</h2>
+    <h2 id="custom_linux26">Customizing the Linux kernel configuration</h2>
 
     <p>The Linux kernel configuration can be customized just like <a
     href="#custom_busybox">BusyBox</a> and <a href="#custom_uclibc">uClibc</a>
@@ -460,9 +437,7 @@ $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
     <p>If you want to use an existing config file for Linux, then see
     section <a href="#environment_variables">environment variables</a>.</p>
 
-    <h2><a name="#rebuilding_packages"
-    id="rebuilding_packages">Understanding how to rebuild
-    packages</a></h2>
+    <h2 id="rebuilding_packages">Understanding how to rebuild packages</h2>
 
     <p>One of the most common questions asked by Buildroot
     users is how to rebuild a given package or how to
@@ -494,7 +469,6 @@ $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
     following stamp files are relevant:</p>
 
     <ul>
-
       <li><code>output/build/packagename-version/.stamp_configured</code>. If
       removed, Buildroot will trigger the recompilation of the package
       from the configuration step (execution of
@@ -503,25 +477,23 @@ $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
       <li><code>output/build/packagename-version/.stamp_built</code>. If
       removed, Buildroot will trigger the recompilation of the package
       from the compilation step (execution of <code>make</code>).</li>
-
     </ul>
 
-    <p>For other packages, an analysis of the specific
-    <i>package.mk</i> file is needed. For example, the zlib Makefile
-    used to look like this (before it was converted to the generic
-    package infrastructure):</p>
+    <p>For other packages, an analysis of the specific <i>package.mk</i> 
+    file is needed. For example, the zlib Makefile used to look like this 
+    (before it was converted to the generic package infrastructure):</p>
 
-    <pre>
+<pre>
 $(ZLIB_DIR)/.configured: $(ZLIB_DIR)/.patched
-        (cd $(ZLIB_DIR); rm -rf config.cache; \
-                        [...]
-        )
-        touch $@
+	(cd $(ZLIB_DIR); rm -rf config.cache; \
+		[...]
+	)
+	touch $@
 
 $(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
-        $(MAKE) -C $(ZLIB_DIR) all libz.a
-        touch -c $@
-    </pre>
+	$(MAKE) -C $(ZLIB_DIR) all libz.a
+	touch -c $@
+</pre>
 
     <p>If you want to trigger the reconfiguration, you need to
     remove <code>output/build/zlib-version/.configured</code>. If
@@ -532,30 +504,29 @@ $(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
     ported over the generic or the autotools infrastructure, making it
     much easier to rebuild individual packages.</p>
 
-    <h2><a name="buildroot_innards" id="buildroot_innards"></a>How Buildroot
-    works</h2>
+    <h2 id="buildroot_innards">How Buildroot works</h2>
 
-    <p>As mentioned above, Buildroot is basically a set of Makefiles that downloads,
-    configures and compiles software with the correct options. It also includes
-    patches for various software packages &mdash;  mainly the ones involved in the
-    cross-compilation tool chain (<code>gcc</code>, <code>binutils</code> and
-    <code>uClibc</code>). </p>
+    <p>As mentioned above, Buildroot is basically a set of Makefiles that 
+    downloads, configures and compiles software with the correct options. It 
+    also includes patches for various software packages &mdash;  mainly the 
+    ones involved in the cross-compilation tool chain (<code>gcc</code>, 
+    <code>binutils</code> and <code>uClibc</code>).</p>
 
-    <p>There is basically one Makefile per software package, and they are named with
-    the <code>.mk</code> extension. Makefiles are split into three main
-    sections:</p>
+    <p>There is basically one Makefile per software package, and they are 
+    named with the <code>.mk</code> extension. Makefiles are split into 
+    three main sections:</p>
 
     <ul>
       <li><b>toolchain</b> (in the <code>toolchain/</code> directory) contains
       the Makefiles and associated files for all software related to the
       cross-compilation toolchain: <code>binutils</code>, <code>ccache</code>,
       <code>gcc</code>, <code>gdb</code>, <code>kernel-headers</code> and
-      <code>uClibc</code>. </li>
+      <code>uClibc</code>.</li>
 
       <li><b>package</b> (in the <code>package/</code> directory) contains the
       Makefiles and associated files for all user-space tools that Buildroot
       can compile and add to the target root filesystem. There is one
-      sub-directory per tool. </li>
+      sub-directory per tool.</li>
 
       <li><b>target</b> (in the <code>target</code> directory) contains the
       Makefiles and associated files for software related to the generation of
@@ -563,26 +534,24 @@ $(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
       ext2, jffs2, cramfs and squashfs. For each of them there is a
       sub-directory with the required files. There is also a
       <code>default/</code> directory that contains the target filesystem
-      skeleton. </li>
+      skeleton.</li>
     </ul>
 
     <p>Each directory contains at least 2 files:</p>
 
     <ul>
       <li><code>something.mk</code> is the Makefile that downloads, configures,
-      compiles and installs the package <code>something</code>. </li>
+      compiles and installs the package <code>something</code>.</li>
 
       <li><code>Config.in</code> is a part of the configuration tool
       description file. It describes the options related to the 
-      package. </li>
-
+      package.</li>
     </ul>
 
     <p>The main Makefile performs the following steps (once the
     configuration is done):</p>
 
     <ol>
-
       <li>Create all the output directories: <code>staging</code>,
       <code>target</code>, <code>build</code>, <code>stamps</code>,
       etc. in the output directory (<code>output/</code> by default,
@@ -601,11 +570,9 @@ $(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
       trigger the compilation of the userspace packages (libraries,
       programs), the kernel, the bootloader and the generation of the
       root filesystem images, depending on the configuration.</li>
-
     </ol>
 
-    <h2><a name="board_support" id="board_support"></a>
-    Creating your own board support</h2>
+    <h2 id="board_support"> Creating your own board support</h2>
 
     <p>Creating your own board support in Buildroot allows you to have
     a convenient place to store your project's target filesystem skeleton
@@ -614,7 +581,6 @@ $(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
     <p>Follow these steps to integrate your board in Buildroot:</p>
 
     <ol>
-
       <li>Create a new directory in <code>target/device/</code> named
       after your company or organization</li>
 
@@ -630,19 +596,19 @@ $(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
       <li>Create a <code>target/device/yourcompany/Config.in</code>
       file that looks like the following:
 
-      <pre>
+<pre>
 menuconfig BR2_TARGET_COMPANY
-       bool "Company projects"
+	bool "Company projects"
 
 if BR2_TARGET_COMPANY
 
 config BR2_TARGET_COMPANY_PROJECT_FOOBAR
-       bool "Support for Company project Foobar"
-       help
-         This option enables support for Company project Foobar
+	bool "Support for Company project Foobar"
+	help
+	  This option enables support for Company project Foobar
 
 endif
-      </pre>
+</pre>
 
       Of course, you should customize the different values to match your
       company/organization and your project. This file will create a
@@ -652,11 +618,12 @@ endif
       <li>Create a <code>target/device/yourcompany/Makefile.in</code>
       file that looks like the following:
 
-      <pre>
+<pre>
 ifeq ($(BR2_TARGET_COMPANY_PROJECT_FOOBAR),y)
 include target/device/yourcompany/project-foobar/Makefile.in
 endif
-      </pre>
+</pre>
+
       </li>
 
       <li>Create the
@@ -666,18 +633,14 @@ endif
       <code>target/device/yourcompany/project-foobar</code> as it
       will simplify further definitions. Then, the file might define
       one or several of the following variables:
-
-      <ul>
-
-	<li><code>TARGET_SKELETON</code> to a directory that contains
-	the target skeleton for your project. If this variable is
-	defined, this target skeleton will be used instead of the
-	default one. If defined, the convention is to define it to
-	<code>$(BOARD_PATH)/target_skeleton</code> so that the target
-	skeleton is stored in the board specific directory.</li>
-
-      </ul>
-
+        <ul>
+          <li><code>TARGET_SKELETON</code> to a directory that contains
+          the target skeleton for your project. If this variable is
+          defined, this target skeleton will be used instead of the
+          default one. If defined, the convention is to define it to
+          <code>$(BOARD_PATH)/target_skeleton</code> so that the target
+          skeleton is stored in the board specific directory.</li>
+        </ul>
       </li>
 
       <li>In the
@@ -691,51 +654,45 @@ endif
       <code>configs/</code> directory. Your users will then be able
       to run <code>make something_defconfig</code> and get the right
       configuration for your project</li>
-
     </ol>
 
-    <h2><a name="using_toolchain" id="using_toolchain"></a>Using the
-    generated toolchain outside Buildroot</h2>
+    <h2 id="using_toolchain">Using the generated toolchain outside Buildroot</h2>
 
-    <p>You may want to compile for your target your own programs or other software
-    that are not packaged in Buildroot. In order to do this you can
-    use the toolchain that was generated by Buildroot. </p>
+    <p>You may want to compile for your target your own programs or other 
+    software that are not packaged in Buildroot. In order to do this you can 
+    use the toolchain that was generated by Buildroot.</p>
 
-    <p>The toolchain generated by Buildroot is located by default in
-    <code>output/staging/</code>. The simplest way to use it
-    is to add <code>output/staging/usr/bin/</code> to your PATH
-    environment variable and then to use
-    <code>ARCH-linux-gcc</code>, <code>ARCH-linux-objdump</code>,
-    <code>ARCH-linux-ld</code>, etc. </p>
+    <p>The toolchain generated by Buildroot is located by default in 
+    <code>output/staging/</code>. The simplest way to use it is to add 
+    <code>output/staging/usr/bin/</code> to your PATH environment variable and 
+    then to use <code>ARCH-linux-gcc</code>, <code>ARCH-linux-objdump</code>, 
+    <code>ARCH-linux-ld</code>, etc.</p>
 
-    <p><b>Important</b>: do not try to move a gcc-3.x toolchain to another
-    directory &mdash; it won't work because there are some hardcoded paths in the
-    gcc-3.x configuration. If you are using a current gcc-4.x, it
-    is possible to relocate the toolchain &mdash; but then
-    <code>--sysroot</code> must be passed every time the compiler is
-    called to tell where the libraries and header files are.</p>
+    <p><b>Important</b>: do not try to move a gcc-3.x toolchain to another 
+    directory &mdash; it won't work because there are some hardcoded paths 
+    in the gcc-3.x configuration. If you are using a current gcc-4.x, it is 
+    possible to relocate the toolchain &mdash; but then <code>--sysroot</code> 
+    must be passed every time the compiler is called to tell where the 
+    libraries and header files are.</p>
 
-    <p>It is also possible to generate the Buildroot toolchain in
-    a directory other than <code>output/staging</code> by using the
-    <code>Build options -&gt; Toolchain and header file
-    location</code> options. This could be useful if the toolchain
-    must be shared with other users.</p>
+    <p>It is also possible to generate the Buildroot toolchain in a 
+    directory other than <code>output/staging</code> by using the <code>
+    Build options -&gt; Toolchain and header file location</code> options. 
+    This could be useful if the toolchain must be shared with other users.</p>
 
-    <h2><a name="downloaded_packages"
-    id="downloaded_packages"></a>Location of downloaded packages</h2>
+    <h2 id="downloaded_packages">Location of downloaded packages</h2>
 
     <p>It might be useful to know that the various tarballs that are
-    downloaded by the Makefiles are all stored in the
-    <code>DL_DIR</code> which by default is the <code>dl</code>
-    directory. It's useful, for example, if you want to keep a complete
-    version of Buildroot which is know to be working with the
-    associated tarballs. This will allow you to regenerate the
-    toolchain and the target filesystem with exactly the same
-    versions. </p>
-
-    <p>If you maintain several Buildroot trees, it might be better to have
-    a shared download location. This can be accessed by creating a symbolic link
-    from the <code>dl</code> directory to the shared download location: </p>
+    downloaded by the Makefiles are all stored in the <code>DL_DIR</code> 
+    which by default is the <code>dl</code> directory. It's useful, for 
+    example, if you want to keep a complete version of Buildroot which is 
+    know to be working with the associated tarballs. This will allow you to 
+    regenerate the toolchain and the target filesystem with exactly the same 
+    versions.</p>
+
+    <p>If you maintain several Buildroot trees, it might be better to have a 
+    shared download location. This can be accessed by creating a symbolic 
+    link from the <code>dl</code> directory to the shared download location:</p>
 
 <pre>
 ln -s &lt;shared download location&gt; dl
@@ -745,90 +702,83 @@ ln -s &lt;shared download location&gt; dl
     create the <code>BUILDROOT_DL_DIR</code> environment variable.
     If this is set, then the value of DL_DIR in the project is
     overridden. The following line should be added to
-    <code>&quot;~/.bashrc&quot;</code>. <p>
+    <code>&quot;~/.bashrc&quot;</code>.</p>
 
 <pre>
 export BUILDROOT_DL_DIR &lt;shared download location&gt;
 </pre>
 
-    <h2><a name="external_toolchain" id="external_toolchain"></a>Using
-    an external toolchain</h2>
-
-<p>It might be useful not to use the toolchain generated by
-Buildroot, for example if you already have a toolchain that is known
-to work for your specific CPU, or if the toolchain generation feature
-of Buildroot is not sufficiently flexible for you (for example if you
-need to generate a system with <i>glibc</i> instead of
-<i>uClibc</i>). Buildroot supports using an <i>external
-toolchain</i>.</p>
-
-<p>To enable the use of an external toolchain, go in the
-<code>Toolchain</code> menu, and&nbsp;:</p>
-
-<ul>
-  <li>Select the <code>External binary toolchain</code> toolchain
-  type</li>
-  <li>Adjust the <code>External toolchain path</code>
-  appropriately. It should be set to a path where a bin/ directory
-  contains your cross-compiling tools</li>
-  <li>Adjust the <code>External toolchain prefix</code> so that the
-  prefix, suffixed with <code>-gcc</code> or <code>-ld</code> will
-  correspond to your cross-compiling tools</li>
-</ul>
-
-<p>If you are using an external toolchain based on <i>uClibc</i>, the
-<code>Core C library from the external toolchain</code> and
-<code>Libraries to copy from the external toolchain</code> options
-should already have correct values. However, if your external
-toolchain is based on <i>glibc</i>, you'll have to change these values
-according to your cross-compiling toolchain.</p>
-
-<p>To generate external toolchains, we recommend using <a
-href="http://ymorin.is-a-geek.org/dokuwiki/projects/crosstool">Crosstool-NG</a>.
-It allows generating toolchains based on <i>uClibc</i>, <i>glibc</i>
-and <i>eglibc</i> for a wide range of architectures and has good
-community support.</p>
-
-    <h2><a name="add_packages" id="add_packages"></a>Adding new
-    packages to Buildroot</h2>
-
-    <p>This section covers how new packages (userspace libraries or
-    applications) can be integrated into Buildroot. It also allows to
-    understand how existing packages are integrated, which is needed
-    to fix issues or tune their configuration.</p>
+    <h2 id="external_toolchain">Using an external toolchain</h2>
+
+    <p>It might be useful not to use the toolchain generated by
+    Buildroot, for example if you already have a toolchain that is known
+    to work for your specific CPU, or if the toolchain generation feature
+    of Buildroot is not sufficiently flexible for you (for example if you
+    need to generate a system with <i>glibc</i> instead of
+    <i>uClibc</i>). Buildroot supports using an <i>external
+    toolchain</i>.</p>
+
+    <p>To enable the use of an external toolchain, go in the
+    <code>Toolchain</code> menu, and :</p>
+
+    <ul>
+      <li>Select the <code>External binary toolchain</code> toolchain
+      type</li>
+      <li>Adjust the <code>External toolchain path</code>
+      appropriately. It should be set to a path where a bin/ directory
+      contains your cross-compiling tools</li>
+      <li>Adjust the <code>External toolchain prefix</code> so that the
+      prefix, suffixed with <code>-gcc</code> or <code>-ld</code> will
+      correspond to your cross-compiling tools</li>
+    </ul>
+
+    <p>If you are using an external toolchain based on <i>uClibc</i>, the
+    <code>Core C library from the external toolchain</code> and
+    <code>Libraries to copy from the external toolchain</code> options
+    should already have correct values. However, if your external
+    toolchain is based on <i>glibc</i>, you'll have to change these values
+    according to your cross-compiling toolchain.</p>
+
+    <p>To generate external toolchains, we recommend using 
+    <a href="http://ymorin.is-a-geek.org/dokuwiki/projects/crosstool">Crosstool-NG</a>.
+    It allows generating toolchains based on <i>uClibc</i>, <i>glibc</i>
+    and <i>eglibc</i> for a wide range of architectures and has good
+    community support.</p>
+
+    <h2 id="add_packages">Adding new packages to Buildroot</h2>
+
+    <p>This section covers how new packages (userspace libraries or 
+    applications) can be integrated into Buildroot. It also allows to 
+    understand how existing packages are integrated, which is needed to fix 
+    issues or tune their configuration.</p>
 
     <ul>
       <li><a href="#package-directory">Package directory</a></li>
       <li><a href="#config-in-file"><code>Config.in</code> file</a></li>
       <li><a href="#mk-file">The <code>.mk</code> file</a>
-      <ul>
-	<li><a href="#generic-tutorial">Makefile for generic
-	packages : tutorial</a></li>
-	<li><a href="#generic-reference">Makefile for
-	generic packages : reference</a></li>
-	<li><a href="#autotools-tutorial">Makefile for autotools-based
-	packages : tutorial</a></li>
-	<li><a href="#autotools-reference">Makefile for autotools-based
-	packages : reference</a></li>
-	<li><a href="#manual-tutorial">Manual Makefile : tutorial</a></li>
-      </ul>
+        <ul>
+          <li><a href="#generic-tutorial">Makefile for generic packages : tutorial</a></li>
+          <li><a href="#generic-reference">Makefile for generic packages : reference</a></li>
+          <li><a href="#autotools-tutorial">Makefile for autotools-based packages : tutorial</a></li>
+          <li><a href="#autotools-reference">Makefile for autotools-based packages : reference</a></li>
+          <li><a href="#manual-tutorial">Manual Makefile : tutorial</a></li>
+        </ul>
       </li>
-      <li><a href="#gettext-integration">Gettext integration and
-      interaction with packages</a></li>
+      <li><a href="#gettext-integration">Gettext integration and interaction with packages</a></li>
     </ul>
 
-    <h3><a name="package-directory"></a>Package directory</h3>
+    <h3 id="package-directory">Package directory</h3>
 
     <p>First of all, create a directory under the <code>package</code>
-    directory for your software, for example <code>foo</code>. </p>
+    directory for your software, for example <code>foo</code>.</p>
 
     <p>Some packages have been grouped by topic in a sub-directory:
-    <code>multimedia</code>, <code>java</code>,
-    <code>databases</code>, <code>editors</code>, <code>x11r7</code>,
-    <code>games</code>. If your package fits in one of these
-    categories, then create your package directory in these.</p>
+    <code>multimedia</code>, <code>java</code>, <code>databases</code>,
+    <code>editors</code>, <code>x11r7</code>, <code>games</code>. If your 
+    package fits in one of these categories, then create your package 
+    directory in these.</p>
 
-    <h3><a name="config-in-file"></a><code>Config.in</code> file</h3>
+    <h3 id="config-in-file"><code>Config.in</code> file</h3>
 
     <p>Then, create a file named <code>Config.in</code>. This file
     will contain the option descriptions related to our
@@ -837,8 +787,8 @@ community support.</p>
 
 <pre>
 config BR2_PACKAGE_LIBFOO
-        bool "libfoo"
-        help
+	bool "libfoo"
+	help
 	  This is a comment that explains what libfoo is.
 
 	  http://foosoftware.org/libfoo/
@@ -848,8 +798,9 @@ config BR2_PACKAGE_LIBFOO
     things in your software. You can look at examples in other
     packages. The syntax of the Config.in file is the same as the one
     for the kernel Kconfig file. The documentation for this syntax is
-    available at <a
-    href="http://lxr.free-electrons.com/source/Documentation/kbuild/kconfig-language.txt">http://lxr.free-electrons.com/source/Documentation/kbuild/kconfig-language.txt</a></p>
+    available at 
+    <a href="http://lxr.free-electrons.com/source/Documentation/kbuild/kconfig-language.txt">http://lxr.free-electrons.com/source/Documentation/kbuild/kconfig-language.txt</a>
+    </p>
 
     <p>Finally you have to add your new <code>libfoo/Config.in</code> to
     <code>package/Config.in</code> (or in a category subdirectory if
-- 
1.7.3.1
