From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:09:52 +0200
Subject: [Buildroot] [git commit] manual/getting started: rework 'Using
	Buildroot' section
Message-ID: <20140817191116.1D80B9D427@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=607bd1a1bd1a5842bcd78e069ef903a14e92854d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch does some general rewording of the 'Using buildroot' section
of the manual.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/using.txt |   59 +++++++++++++++++++++++++++---------------------
 1 files changed, 33 insertions(+), 26 deletions(-)

diff --git a/docs/manual/using.txt b/docs/manual/using.txt
index 292349d..ed155c9 100644
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -3,67 +3,73 @@
 
 == Using Buildroot
 
+*Important*: you can and should *build everything as a normal user*. There
+is no need to be root to configure and use Buildroot. By running all
+commands as a regular user, you protect your system against packages
+behaving badly during compilation and installation.
+
+The first step when using Buildroot is to create a configuration.
 Buildroot has a nice configuration tool similar to the one you can
 find in the http://www.kernel.org/[Linux kernel] or in
-http://www.busybox.net/[BusyBox]. Note that you can *and should build
-everything as a normal user*. There is no need to be root to configure
-and use Buildroot. The first step is to run the configuration
-assistant:
+http://www.busybox.net/[BusyBox].
+
+From the buildroot directory, run
 
 --------------------
  $ make menuconfig
 --------------------
 
-or
+for the original curses-based configurator, or
 
 --------------------
  $ make nconfig
 --------------------
 
-to run the old or new curses-based configurator, or
+for the new curses-based configurator, or
 
 --------------------
  $ make xconfig
 --------------------
 
-or
+for the Qt-based configurator, or
 
 --------------------
  $ make gconfig
 --------------------
 
-to run the Qt or GTK-based configurators.
+for the GTK-based configurator.
 
 All of these "make" commands will need to build a configuration
 utility (including the interface), so you may need to install
 "development" packages for relevant libraries used by the
-configuration utilities. Check xref:requirement[] to know what
-Buildroot needs, and specifically the xref:requirement-optional[optional requirements]
+configuration utilities. Refer to xref:requirement[] for more details,
+specifically the xref:requirement-optional[optional requirements]
 to get the dependencies of your favorite interface.
 
 For each menu entry in the configuration tool, you can find associated
 help that describes the purpose of the entry.
 
 Once everything is configured, the configuration tool generates a
-+.config+ file that contains the description of your
-configuration. It will be used by the Makefiles to do what's needed.
++.config+ file that contains the entire configuration. This file will be
+read by the top-level Makefile.
 
-Let's go:
+To start the build process, simply run:
 
 --------------------
  $ make
 --------------------
 
-You *should never* use +make -jN+ with Buildroot: it does not support
-'top-level parallel make'. Instead, use the +BR2_JLEVEL+ option to
-tell Buildroot to run each package compilation with +make -jN+.
+You *should never* use +make -jN+ with Buildroot: top-level parallel
+make is currently not supported. Instead, use the +BR2_JLEVEL+ option
+to tell Buildroot to run the compilation of each individual package
+with +make -jN+.
 
 The `make` command will generally perform the following steps:
 
 * download source files (as required);
-* configure, build and install the cross-compiling toolchain using the
-  appropriate toolchain backend, or simply import an external toolchain;
-* build/install selected target packages;
+* configure, build and install the cross-compilation toolchain, or
+  simply import an external toolchain;
+* configure, build and install selected target packages;
 * build a kernel image, if selected;
 * build a bootloader image, if selected;
 * create a root filesystem in selected formats.
@@ -72,15 +78,16 @@ Buildroot output is stored in a single directory, +output/+.
 This directory contains several subdirectories:
 
 * +images/+ where all the images (kernel image, bootloader and root
-  filesystem images) are stored.
+  filesystem images) are stored. These are the files you need to put
+  on your target system.
 
-* +build/+ where all the components are built
-  (this includes tools needed to run Buildroot on
-  the host and packages compiled for the target). The +build/+
-  directory contains one subdirectory for each of these components.
+* +build/+ where all the components are built (this includes tools
+  needed by Buildroot on the host and packages compiled for the
+  target). This directory contains one subdirectory for each of these
+  components.
 
 * +staging/+ which contains a hierarchy similar to a root filesystem
-  hierarchy. This directory contains the installation of the
+  hierarchy. This directory contains the headers and libraries of the
   cross-compilation toolchain and all the userspace packages selected
   for the target. However, this directory is 'not' intended to be
   the root filesystem for the target: it contains a lot of development
@@ -109,7 +116,7 @@ This directory contains several subdirectories:
 
 These commands, +make menuconfig|nconfig|gconfig|xconfig+ and +make+, are the
 basic ones that allow to easily and quickly generate images fitting
-your needs, with all the supports and applications you enabled.
+your needs, with all the features and applications you enabled.
 
 More details about the "make" command usage are given in
 xref:make-tips[].
