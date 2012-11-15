From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 23:58:44 +0100
Subject: [Buildroot] [git commit] manual: rework introduction.txt and add
	embedded-basics.txt
Message-ID: <20121115230537.71E1799E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0119ef3778e33d71020d6c812c967d87e42d959a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Split and rephrasing of introduction.txt.

Cross-toolchain explainations moved from introduction.txt into
embedded-basics.txt.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/embedded-basics.txt |  110 +++++++++++++++++++++++++++++++++++++++
 docs/manual/going-further.txt   |    4 ++
 docs/manual/introduction.txt    |   72 ++++---------------------
 3 files changed, 126 insertions(+), 60 deletions(-)

diff --git a/docs/manual/embedded-basics.txt b/docs/manual/embedded-basics.txt
new file mode 100644
index 0000000..27dda37
--- /dev/null
+++ b/docs/manual/embedded-basics.txt
@@ -0,0 +1,110 @@
+// -*- mode:doc; -*-
+
+Embedded system basics
+----------------------
+
+When developing an embedded system, there are a number of choices to
+do:
+
+* the cross-toolchain: target architecture/C library/...
+* the bootloader
+* kernel options
+* the device management
+* the init system
+* the package selection (busybox vs. "real" programs, ...)
+* ...
+
+Some of them may be influenced by the target hardware.
+
+Some of them may also add some constraints when you will develop the
+final application for what your target is designed (e.g. some
+functions may be provided by soem C libraries and missing in some
+others, ...). So, these choices should be carefully done.
+
+Buildroot allows to set most of these options to fit your needs.
+
+Moreover, Buildroot provides an infrastructure for reproducing the
+build process of your kernel, cross-toolchain, and embedded root
+filesystem. Being able to reproduce the build process will be useful
+when a component needs to be patched or updated or when another person
+is supposed to take over the project.
+
+[[cross-compilation-and-cross-toolchain]]
+Cross-compilation & cross-toolchain
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A compilation toolchain is the set of tools that allows you to compile
+code for your system. It consists of a compiler (in our case, +gcc+),
+binary utils like assembler and linker (in our case, +binutils+) and a
+C standard library (for example
+http://www.gnu.org/software/libc/libc.html[GNU Libc],
+http://www.uclibc.org/[uClibc] or
+http://www.fefe.de/dietlibc/[dietlibc]).
+
+The system installed on your development station certainly already has
+a compilation toolchain that you can use to compile an application
+that runs on your system. If you're using a PC, your compilation
+toolchain runs on an x86 processor and generates code for an x86
+processor. Under most Linux systems, the compilation toolchain uses
+the GNU libc (glibc) as the C standard library. This compilation
+toolchain is called the "host compilation toolchain". The machine on
+which it is running, and on which you're working, is called the "host
+system".
+
+The compilation toolchain is provided by your distribution, and
+Buildroot has nothing to do with it (other than using it to build a
+cross-compilation toolchain and other tools that are run on the
+development host).
+
+As said above, the compilation toolchain that comes with your system
+runs on and generates code for the processor in your host system. As
+your embedded system has a different processor, you need a
+cross-compilation toolchain - a compilation toolchain that runs on
+your _host system_ but generates code for your _target system_ (and
+target processor). For example, if your host system uses x86 and your
+target system uses ARM, the regular compilation toolchain on your host
+runs on x86 and generates code for x86, while the cross-compilation
+toolchain runs on x86 and generates code for ARM.
+
+Even if your embedded system uses an x86 processor, you might be
+interested in Buildroot for two reasons:
+
+* The compilation toolchain on your host certainly uses the GNU Libc
+  which is a complete but huge C standard library. Instead of using
+  GNU Libc on your target system, you can use uClibc which is a tiny C
+  standard library. If you want to use this C library, then you need a
+  compilation toolchain to generate binaries linked with it. Buildroot
+  can do that for you.
+
+* Buildroot automates the building of a root filesystem with all
+  needed tools like busybox. That makes it much easier than doing it
+  by hand.
+
+You might wonder why such a tool is needed when you can compile +gcc+,
++binutils+, +uClibc+ and all the other tools by hand. Of course doing
+so is possible but, dealing with all of the configure options and
+problems of every +gcc+ or +binutils+ version is very time-consuming
+and uninteresting.  Buildroot automates this process through the use
+of Makefiles and has a collection of patches for each +gcc+ and
++binutils+ version to make them work on most architectures.
+
+Buildroot offers a number of options and settings that can be tuned
+when defining the cross-toolchain (refer to xref:toolchain-custom[]).
+
+[[bootloader]]
+Bootloader
+~~~~~~~~~~
+
+TODO
+
+[[device-management]]
+Device management
+~~~~~~~~~~~~~~~~~
+
+TODO
+
+[[init-system]]
+Init system
+~~~~~~~~~~~
+
+TODO
diff --git a/docs/manual/going-further.txt b/docs/manual/going-further.txt
index 6f3cd6e..15324c4 100644
--- a/docs/manual/going-further.txt
+++ b/docs/manual/going-further.txt
@@ -1,6 +1,10 @@
+// -*- mode:doc; -*-
+
 Going further in Buildroot's innards
 ====================================
 
+include::embedded-basics.txt[]
+
 include::how-buildroot-works.txt[]
 
 include::advanced.txt[]
diff --git a/docs/manual/introduction.txt b/docs/manual/introduction.txt
index 476ce25..91ecb04 100644
--- a/docs/manual/introduction.txt
+++ b/docs/manual/introduction.txt
@@ -1,69 +1,21 @@
+// -*- mode:doc; -*-
+
 About Buildroot
 ===============
 
-Buildroot is a set of Makefiles and patches that allows you to easily
-generate a cross-compilation toolchain, a root filesystem and a Linux
-kernel image for your target. Buildroot can be used for one, two or
-all of these options, independently.
+Buildroot provides a full featured environment for cross-development.
+Buildroot is able to generate a cross-compilation toolchain, a root
+filesystem, a Linux kernel image and a bootloader for your target.
+Buildroot can be used for any combinaison of these options,
+independently.
 
 Buildroot is useful mainly for people working with embedded systems.
 Embedded systems often use processors that are not the regular x86
 processors everyone is used to having in his PC. They can be PowerPC
 processors, MIPS processors, ARM processors, etc.
 
-A compilation toolchain is the set of tools that allows you to compile
-code for your system. It consists of a compiler (in our case, +gcc+),
-binary utils like assembler and linker (in our case, +binutils+) and a
-C standard library (for example
-http://www.gnu.org/software/libc/libc.html[GNU Libc],
-http://www.uclibc.org/[uClibc] or
-http://www.fefe.de/dietlibc/[dietlibc]). The system installed on your
-development station certainly already has a compilation toolchain that
-you can use to compile an application that runs on your system. If
-you're using a PC, your compilation toolchain runs on an x86 processor
-and generates code for an x86 processor. Under most Linux systems, the
-compilation toolchain uses the GNU libc (glibc) as the C standard
-library.  This compilation toolchain is called the "host compilation
-toolchain". The machine on which it is running, and on which you're
-working, is called the "host system". The compilation toolchain is
-provided by your distribution, and Buildroot has nothing to do with it
-(other than using it to build a cross-compilation toolchain and other
-tools that are run on the development host).
-
-As said above, the compilation toolchain that comes with your system
-runs on and generates code for the processor in your host system. As
-your embedded system has a different processor, you need a
-cross-compilation toolchain - a compilation toolchain that runs on
-your host system but generates code for your target system (and target
-processor). For example, if your host system uses x86 and your target
-system uses ARM, the regular compilation toolchain on your host runs on
-x86 and generates code for x86, while the cross-compilation toolchain
-runs on x86 and generates code for ARM.
-
-Even if your embedded system uses an x86 processor, you might be
-interested in Buildroot for two reasons:
-
-* The compilation toolchain on your host certainly uses the GNU Libc
-  which is a complete but huge C standard library. Instead of using
-  GNU Libc on your target system, you can use uClibc which is a tiny C
-  standard library. If you want to use this C library, then you need a
-  compilation toolchain to generate binaries linked with it. Buildroot
-  can do that for you.
-
-* Buildroot automates the building of a root filesystem with all
-  needed tools like busybox. That makes it much easier than doing it
-  by hand.
-
-You might wonder why such a tool is needed when you can compile +gcc+,
-+binutils+, +uClibc+ and all the other tools by hand. Of course doing
-so is possible but, dealing with all of the configure options and
-problems of every +gcc+ or +binutils+ version is very time-consuming
-and uninteresting.  Buildroot automates this process through the use
-of Makefiles and has a collection of patches for each +gcc+ and
-+binutils+ version to make them work on most architectures.
-
-Moreover, Buildroot provides an infrastructure for reproducing the
-build process of your kernel, cross-toolchain, and embedded root
-filesystem. Being able to reproduce the build process will be useful
-when a component needs to be patched or updated or when another person
-is supposed to take over the project.
+Buildroot supports numerous processors and their variants; it also
+comes with default configuration for several boards available
+off-the-shelf. Besides, a number of third-party projects are based on
+or develop their BSP footnote:[BSP: Board Software Package] or
+SDK footnote:[SDK: Standard Development Kit] on top of Buildroot.
