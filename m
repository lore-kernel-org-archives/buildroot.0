From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 11 Nov 2012 14:14:50 +0100
Subject: [Buildroot] [PATCH 12/23] manual: faq.txt: rework and update
In-Reply-To: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1352639701-27829-13-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also rename faq.txt -> faq-troubleshooting.txt

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 create mode 100644 docs/manual/faq-troubleshooting.txt
 delete mode 100644 docs/manual/faq.txt

diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
new file mode 100644
index 0000000..6911c55
--- /dev/null
+++ b/docs/manual/faq-troubleshooting.txt
@@ -0,0 +1,134 @@
+// -*- mode:doc; -*-
+
+Frequently Asked Questions & Troubleshooting
+============================================
+
+[[faq-boot-hang-after-starting]]
+The boot hangs after 'Starting network...'
+------------------------------------------
+
+If the boot process seems to hand after the following messages
+(messages not necessarily exactly similar, depending on the list of
+packages selected):
+
+------------------------
+Freeing init memory: 3972K
+Initializing random number generator... done.
+Starting network...
+Starting dropbear sshd: generating rsa key... generating dsa key... OK
+------------------------
+
+then it means that your system is running, but didn't start a shell on
+the serial console. In order to have the system start a shell on your
+serial console, you have to go in the Buildroot configuration, +System
+configuration+, and modify +Port to run a getty (login prompt) on+ and
++Baudrate to use+ as appropriate. This will automatically tune the
++/etc/inittab+ file of the generated system so that a shell starts on
+the correct serial port.
+
+[[faq-module-init-tool-build-failure]]
+module-init-tools fails to build with 'cannot find -lc'
+-------------------------------------------------------
+
+If the build of +module-init-tools+ for the host fails with:
+
+------------------------
+/usr/bin/ld: cannot find -lc
+------------------------
+
+then probably you are running a Fedora (or similar) distribution, and
+you should install the +glibc-static+ package. This is because the
++module-init-tools+ build process wants to link statically against the
+C library.
+
+[[faq-no-compiler-on-target]]
+Why there is no compiler on the target?
+---------------------------------------
+
+It has been decided that the support of the _native compiler for the
+target_ would be stopped since the Buildroot-2012.11 release because:
+
+* this feature was not maintained nor tested and often broken;
+* this feature was only available for Buildroot toolchains;
+* Buildroot mostly targets _small_ or _very small_ target hardware
+  with limited resource onboard (CPU, ram, mass-storage), on which
+  compiling does not make much sense.
+
+If you need a compiler on your target anyway, then Buildroot is not
+suitable for your purpose. In such case, you need a _real
+distribution_ and you should for something like:
+
+* http://www.openembedded.org[openembedded]
+* https://www.yoctoproject.org[yocto]
+* http://www.emdebian.org[emdebian]
+* https://fedoraproject.org/wiki/Architectures[Fedora]
+* http://en.opensuse.org/Portal:ARM[openSUSE ARM]
+* http://archlinuxarm.org[Arch Linux ARM]
+* ...
+
+[[faq-no-dev-files-on-target]]
+Why there is no development files on the target?
+------------------------------------------------
+
+Since there is no compiler available on the target (see
+xref:faq-no-compiler-on-target[]), it does not make sense to waste
+space with headers or static libraries.
+
+Therefore, those files are always removed from the target since the
+Buildroot-2012.11 release.
+
+[[faq-no-doc-on-target]]
+Why there is no documentation on the target?
+--------------------------------------------
+
+Because Buildroot mostly targets _small_ or _very small_ target
+hardware with limited resource onboard (CPU, ram, mass-storage), it
+does not make sense to waste space with the documentation data.
+
+If you need documentation data on your target anyway, then Buildroot
+is not suitable for your purpose, and you should look for a _real
+distribution_ (see: xref:faq-no-compiler-on-target[]).
+
+[[faq-depends-on-vs-select]]
++Config.in+: _depends on_ vs _select_
+-------------------------------------
+
+When adding a new package to Buildroot, you will most likely have to
+deal with expressing the dependencies of this package.
+
+In the +Config.in+ file, dependencies may be expressed following two
+semantics.
+See xref:depends-on-vs-select[].
+
+[[faq-why-not-visible-package]]
+Why some packages are not visible in the Buildroot config menu?
+---------------------------------------------------------------
+
+If a package exists in the Buildroot tree and does not appears in the
+config menu, this most likely means that some of the package's
+dependencies are not met.
+
+To know more about the dependencies of a package, search the package
+symbol using in teh config menu (see xref:make-tips[]).
+
+Then, you may have to recursively enable several options (which
+correspond to the unmeet dependencies) to finally be able to select
+the package.
+
+If the package is not visible due to some unmeet toolchain options,
+then you should certainly run a full rebuild (see xref:make-tips[] for
+more explanations).
+
+[[faq-why-not-use-target-as-chroot]]
+Why not use the target directory as a chroot directory?
+-------------------------------------------------------
+
+There are plenty of reason to *not* use the target directory a chroot
+one, among these:
+
+* files' owners, modes and permissions are not correctly set in the
+  target directory;
+* devices nodes are not created in the target directory.
+
+Because of that, commands run in through chroot, using the target
+directory as new root, will fail.
diff --git a/docs/manual/faq.txt b/docs/manual/faq.txt
deleted file mode 100644
index 97a754b..0000000
--- a/docs/manual/faq.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-Frequently Asked Questions
-==========================
-
-The boot hangs after 'Starting network...'
-------------------------------------------
-
-If the boot process seems to hand after the following messages
-(messages not necessarily exactly similar, depending on the list of
-packages selected):
-
-------------------------
-Freeing init memory: 3972K
-Initializing random number generator... done.
-Starting network...
-Starting dropbear sshd: generating rsa key... generating dsa key... OK
-------------------------
-
-then it means that your system is running, but didn't start a shell on
-the serial console. In order to have the system start a shell on your
-serial console, you have to go in the Buildroot configuration, +System
-configuration+, and modify +Port to run a getty (login prompt) on+ and
-+Baudrate to use+ as appropriate. This will automatically tune the
-+/etc/inittab+ file of the generated system so that a shell starts on
-the correct serial port.
-
-module-init-tools fails to build with 'cannot find -lc'
--------------------------------------------------------
-
-If the build of +module-init-tools+ for the host fails with:
-
-------------------------
-/usr/bin/ld: cannot find -lc
-------------------------
-
-then probably you are running a Fedora (or similar) distribution, and
-you should install the +glibc-static+ package. This is because the
-+module-init-tools+ build process wants to link statically against the
-C library.
-
-How to add package from github
-------------------------------
-
-If the package has no release version, or its version cannot be
-identified using tag, then the sha1 of the particular commit should be
-used to identify the version (the first 7 characters of the sha1 are
-enough):
-
-------------------------
-FOO_VERSION = 1234567
-FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>
-------------------------
-
-If the package version matches a tag, then this tag should be used to
-identify the version:
-
-------------------------
-FOO_VERSION = v1.0
-FOO_SITE = http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
-------------------------
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 00bd037..4df1657 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -17,10 +17,10 @@ include::starting-up.txt[]
 
 include::working-with.txt[]
 
+include::faq-troubleshooting.txt[]
+
 include::going-further.txt[]
 
 include::developer-guide.txt[]
 
-include::faq.txt[]
-
 include::appendix.txt[]
-- 
1.8.0
