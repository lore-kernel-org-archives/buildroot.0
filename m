From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 23:58:48 +0100
Subject: [Buildroot] [git commit] manual: rework using.txt and update
	common-usage.txt
Message-ID: <20121115230537.A863199E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a90382616cfa02f784c24c8bc540c21e64c2c449
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Consider the second chapter: "starting-up", as a tutorial.
Assuming that, using.txt only contains the very first commands used to get
configure and build its very first target system.

So, the following subsection from using.txt have been to common-usage.txt:
- Offline builds
- Building out-of-tree
- Environment variables

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/common-usage.txt |   95 +++++++++++++++++++++++++++++++++++++++
 docs/manual/using.txt        |  100 ++++++-----------------------------------
 2 files changed, 110 insertions(+), 85 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index b343606..c08c10e 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -4,3 +4,98 @@ Daily use
 ---------
 
 include::rebuilding-packages.txt[]
+
+Offline builds
+~~~~~~~~~~~~~~
+
+If you intend to do an offline build and just want to download
+all sources that you previously selected in the configurator
+('menuconfig', 'xconfig' or 'gconfig'), then issue:
+
+--------------------
+ $ make source
+--------------------
+
+You can now disconnect or copy the content of your +dl+
+directory to the build-host.
+
+Building out-of-tree
+~~~~~~~~~~~~~~~~~~~~
+
+As default, everything built by Buildroot is stored in the directory
++output+ in the buildroot tree.
+
+Buildroot also supports building out of tree with a syntax similar to
+the Linux kernel. To use it, add +O=<directory>+ to the make command
+line:
+
+--------------------
+ $ make O=/tmp/build
+--------------------
+
+Or:
+
+--------------------
+ $ cd /tmp/build; make O=$PWD -C path/to/buildroot
+--------------------
+
+All the output files will be located under +/tmp/build+.
+
+When using out-of-tree builds, the Buildroot +.config+ and temporary
+files are also stored in the output directory. This means that you can
+safely run multiple builds in parallel using the same source tree as
+long as they use unique output directories.
+
+For ease of use, Buildroot generates a Makefile wrapper in the output
+directory - So after the first run, you no longer need to pass +O=..+
+and +-C ..+, simply run (in the output directory):
+
+--------------------
+ $ make <target>
+--------------------
+
+[[env-vars]]
+
+Environment variables
+~~~~~~~~~~~~~~~~~~~~~
+
+Buildroot also honors some environment variables, when they are passed
+to +make+ or set in the environment:
+
+* +HOSTCXX+, the host C++ compiler to use
+* +HOSTCC+, the host C compiler to use
+* +UCLIBC_CONFIG_FILE=<path/to/.config>+, path to
+  the uClibc configuration file, used to compile uClibc, if an
+  internal toolchain is being built.
+  +
+  Note that the uClibc configuration file can also be set from the
+  configuration interface, so through the Buildroot .config file; this
+  the actual recommended way of setting it.
+  +
+* +BUSYBOX_CONFIG_FILE=<path/to/.config>+, path to
+  the Busybox configuration file.
+  +
+  Note that the Busybox configuration file can also be set from the
+  configuration interface, so through the Buildroot .config file; this
+  the actual recommended way of setting it.
+  +
+* +BUILDROOT_DL_DIR+ to override the directory in which
+  Buildroot stores/retrieves downloaded files
+  +
+  Note that the Buildroot download directory can also be set from the
+  configuration interface, so through the Buildroot .config file; this
+  the actual recommended way of setting it.
+
+An example that uses config files located in the toplevel directory and
+in your $HOME:
+
+--------------------
+ $ make UCLIBC_CONFIG_FILE=uClibc.config BUSYBOX_CONFIG_FILE=$HOME/bb.config
+--------------------
+
+If you want to use a compiler other than the default +gcc+
+or +g+++ for building helper-binaries on your host, then do
+
+--------------------
+ $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
+--------------------
diff --git a/docs/manual/using.txt b/docs/manual/using.txt
index 5741473..56ed23b 100644
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -5,8 +5,8 @@ Using Buildroot
 
 Buildroot has a nice configuration tool similar to the one you can
 find in the http://www.kernel.org/[Linux kernel] or in
-http://www.busybox.net/[Busybox]. Note that you can (and should) build
-everything as a normal user. There is no need to be root to configure
+http://www.busybox.net/[Busybox]. Note that you can *and should build
+everything as a normal user*. There is no need to be root to configure
 and use Buildroot. The first step is to run the configuration
 assistant:
 
@@ -29,12 +29,11 @@ or
 to run the Qt or GTK-based configurators.
 
 All of these "make" commands will need to build a configuration
-utility, so you may need to install "development" packages for
-relevant libraries used by the configuration utilities. On Debian-like
-systems, the +libncurses5-dev+ package is required to use the
-'menuconfig' interface, +libqt4-dev+ is required to use the 'xconfig'
-interface, and +libglib2.0-dev, libgtk2.0-dev and libglade2-dev+ are
-needed to use the 'gconfig' interface.
+utility (including the interface), so you may need to install
+"development" packages for relevant libraries used by the
+configuration utilities. Check the xref:requirement[] to know what
+Buildroot needs, and specifically the xref:requirement-optional[system requirements]
+to get the dependencies of favorite interface.
 
 For each menu entry in the configuration tool, you can find associated
 help that describes the purpose of the entry.
@@ -56,9 +55,9 @@ tell Buildroot to run each package compilation with +make -jN+.
 This command will generally perform the following steps:
 
 * Download source files (as required)
-* Configure, build and install the cross-compiling toolchain if an
-  internal toolchain is used, or import a toolchain if an external
-  toolchain is used
+* Configure, build and install the cross-compiling toolchain using the
+  appropriate toolchain backend is used, or simply import a toolchain
+  if an external toolchain
 * Build/install selected target packages
 * Build a kernel image, if selected
 * Build a bootloader image, if selected
@@ -105,81 +104,12 @@ This directory contains several subdirectories:
 * +toolchain/+ contains the build directories for the various
   components of the cross-compilation toolchain.
 
-Offline builds
---------------
+These commands, +make menuconfig|gconfig|xconfig+ and +make+, are the
+basic ones that allow to easily and quickly generate images fitting
+your needs, with all the supports and applications you enabled.
 
-If you intend to do an offline build and just want to download
-all sources that you previously selected in the configurator
-('menuconfig', 'xconfig' or 'gconfig'), then issue:
-
---------------------
- $ make source
---------------------
-
-You can now disconnect or copy the content of your +dl+
-directory to the build-host.
-
-Building out-of-tree
---------------------
-
-Buildroot supports building out of tree with a syntax similar to the
-Linux kernel. To use it, add +O=<directory>+ to the make command line:
-
---------------------
- $ make O=/tmp/build
---------------------
-
-Or:
-
---------------------
- $ cd /tmp/build; make O=$PWD -C path/to/buildroot
---------------------
-
-All the output files will be located under +/tmp/build+.
-
-When using out-of-tree builds, the Buildroot +.config+ and temporary
-files are also stored in the output directory. This means that you can
-safely run multiple builds in parallel using the same source tree as
-long as they use unique output directories.
-
-For ease of use, Buildroot generates a Makefile wrapper in the output
-directory - So after the first run, you no longer need to pass +O=..+
-and +-C ..+, simply run (in the output directory):
-
---------------------
- $ make <target>
---------------------
-
-Environment variables
----------------------
-[[env-vars]]
-
-Buildroot also honors some environment variables, when they are passed
-to +make+ or set in the environment:
-
-* +HOSTCXX+, the host C++ compiler to use
-* +HOSTCC+, the host C compiler to use
-* +UCLIBC_CONFIG_FILE=<path/to/.config>+, path to
-  the uClibc configuration file, used to compile uClibc, if an
-  internal toolchain is being built
-* +BUSYBOX_CONFIG_FILE=<path/to/.config>+, path to
-  the Busybox configuration file
-* +BUILDROOT_DL_DIR+ to override the directory in which
-  Buildroot stores/retrieves downloaded files
-
-An example that uses config files located in the toplevel directory and
-in your $HOME:
-
---------------------
- $ make UCLIBC_CONFIG_FILE=uClibc.config BUSYBOX_CONFIG_FILE=$HOME/bb.config
---------------------
-
-If you want to use a compiler other than the default +gcc+
-or +g+++ for building helper-binaries on your host, then do
-
---------------------
- $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
---------------------
+More details about the "make" command usage are given in
+xref:make-tips[].
 
 Complying with opensource licenses
 ----------------------------------
