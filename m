From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Dec 2012 15:42:29 +0100
Subject: [Buildroot] [PATCH 3/7] docs/manual: add details on toolchain
	configuration
In-Reply-To: <1356792153-24033-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1356792153-24033-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1356792153-24033-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a new section

 Working with Buildroot
  -> Details in configuration
    -> Cross-compilation toolchain

that gives a lot of details about our three toolchain backends. It
takes some elements that were previously later in the manual in
"Embedded basics" and in "External toolchain" and combines them with
more details about internal backend and Crosstool-NG backend.

The "Embedded basics" section becomes empty and is therefore
removed. A few elements have been lost in the process, but they were
considered to not be really useful, especially located so far in the
manual.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/advanced.txt           |    2 -
 docs/manual/configure.txt          |  277 ++++++++++++++++++++++++++++++++++++
 docs/manual/embedded-basics.txt    |  112 ---------------
 docs/manual/external-toolchain.txt |   88 ------------
 docs/manual/going-further.txt      |    2 -
 5 files changed, 277 insertions(+), 204 deletions(-)
 delete mode 100644 docs/manual/embedded-basics.txt
 delete mode 100644 docs/manual/external-toolchain.txt

diff --git a/docs/manual/advanced.txt b/docs/manual/advanced.txt
index ba6574c..314d300 100644
--- a/docs/manual/advanced.txt
+++ b/docs/manual/advanced.txt
@@ -5,8 +5,6 @@ Advanced usage
 
 include::using-buildroot-toolchain.txt[]
 
-include::external-toolchain.txt[]
-
 include::ccache-support.txt[]
 
 include::download-location.txt[]
diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 2c7987d..65e0eeb 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -9,6 +9,283 @@ providing details about the option. However, a number of topics
 require additional details that cannot easily be covered in the help
 text and are there covered in the following sections.
 
+Cross-compilation toolchain
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A compilation toolchain is the set of tools that allows you to compile
+code for your system. It consists of a compiler (in our case, +gcc+),
+binary utils like assembler and linker (in our case, +binutils+) and a
+C standard library (for example
+http://www.gnu.org/software/libc/libc.html[GNU Libc],
+http://www.uclibc.org/[uClibc]).
+
+The system installed on your development station certainly already has
+a compilation toolchain that you can use to compile an application
+that runs on your system. If you're using a PC, your compilation
+toolchain runs on an x86 processor and generates code for an x86
+processor. Under most Linux systems, the compilation toolchain uses
+the GNU libc (glibc) as the C standard library. This compilation
+toolchain is called the "host compilation toolchain". The machine on
+which it is running, and on which you're working, is called the "host
+system" footnote:[This terminology differs from what is used by GNU
+configure, where the host is the machine on which the application will
+run (which is usually the same as target)].
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
+Buildroot provides different solutions to build, or use existing
+cross-compilation toolchains:
+
+ * The *internal toolchain backend*, called +Buildroot toolchain+ in
+   the configuration interface.
+
+ * The *external toolchain backend*, called +External toolchain+ in
+   the configuration interface.
+
+ * The *Crosstool-NG toolchain backend*, called +Crosstool-NG
+   toolchain+ in the configuration interface.
+
+The choice between these three solutions is done using the +Toolchain
+Type+ option in the +Toolchain+ menu. Once one solution has been
+chosen, a number of configuration options appear, they are detailed in
+the following sections.
+
+Internal toolchain backend
+^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The _internal toolchain backend_ is the backend where Buildroot builds
+by itself a cross-compilation toolchain, before building the userspace
+applications and libraries for your target embedded system.
+
+This backend is the historical backend of Buildroot, and is limited to
+the usage of the http://www.uclibc.org[uClibc C library] (i.e, the
+_glibc_ and _eglibc_ C libraries are not supported by this backend,
+see the _External toolchain backend_ and _Crosstool-NG toolchain
+backend_ for solutions to use either _glibc_ or _eglibc_).
+
+Once you have selected this backend, a number of options appear. The
+most important ones allow to:
+
+ * Change the version of the Linux kernel headers used to build the
+   toolchain. This item deserves a few explanations. In the process of
+   building a cross-compilation toolchain, the C library is being
+   built. This library provides the interface between userspace
+   applications and the Linux kernel. In order to know how to "talk"
+   to the Linux kernel, the C library needs to have access to the
+   _Linux kernel headers_ (i.e, the +.h+ files from the kernel), which
+   define the interface between userspace and the kernel (system
+   calls, data structures, etc.). Since this interface is backward
+   compatible, the version of the Linux kernel headers used to build
+   your toolchain do not need to match _exactly_ the version of the
+   Linux kernel you intend to run on your embedded system. They only
+   need to have a version equal or older to the version of the Linux
+   kernel you intend to run. If you use kernel headers that are more
+   recent than the Linux kernel you run on your embedded system, then
+   the C library might be using interfaces that are not provided by
+   your Linux kernel.
+
+ * Change the version and the configuration of the uClibc C
+   library. The default options are usually fine. However, if you
+   really need to specifically customize the configuration of your
+   uClibc C library, you can pass a specific configuration file
+   here. Or alternatively, you can run the +make uclibc-menuconfig+
+   command to get access to uClibc's configuration interface. Note
+   that all packages in Buildroot are tested against the default
+   uClibc configuration bundled in Buildroot: if you deviate from this
+   configuration by removing features from uClibc, some packages may
+   no longer build.
+
+ * Change the version of the GCC compiler and binutils.
+
+ * Select a number of toolchain options: whether the toolchain should
+   have largefile support (i.e support for files larger than 2 GB on
+   32 bits systems), IPv6 support, RPC support (used mainly for NFS),
+   wide-char support, locale support (for internationalization), C++
+   support, thread support. Depending on which options you choose, the
+   number of userspace applications and libraries visible in Buildroot
+   menus will change: many applications and libraries require certain
+   toolchain options to be enabled. Most packages show a comment when
+   a certain toolchain option is required to be able to enable those
+   packages.
+
+It is worth noting that whenever one of those options is modified,
+then the entire toolchain and system must be rebuilt. See
+xref:full-rebuild[].
+
+Advantages of this backend:
+
+* Well integrated with Buildroot
+* Fast, only builds what's necessary
+
+Drawbacks of this backend:
+
+* Rebuilding the toolchain is needed when doing +make clean+, which
+  takes time. If you're trying to reduce your build time, consider
+  using the _External toolchain backend_.
+* Limited to the _uClibc_ C library.
+
+External toolchain backend
+^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The _external toolchain backend_ allows to use existing pre-built
+cross-compilation toolchains. Buildroot knows about a number of
+well-known cross-compilation toolchains (from
+http://www.linaro.org[Linaro] for ARM,
+http://www.mentor.com/embedded-software/sourcery-tools/sourcery-codebench/editions/lite-edition/[Sourcery
+CodeBench] for ARM, x86, x86-64, PowerPC, MIPS and SuperH,
+https://blackfin.uclinux.org/gf/project/toolchain[Blackfin toolchains
+from ADI], http://git.xilinx.com/[Xilinx toolchains for Microblaze],
+etc.) and is capable of downloading them automatically, or it can be
+pointed to a custom toolchain, either available for download or
+installed locally.
+
+Then, you have three solutions to use an external toolchain:
+
+* Use a predefined external toolchain profile, and let Buildroot
+  download, extract and install the toolchain. Buildroot already knows
+  about a few CodeSourcery, Linaro, Blackfin and Xilinx toolchains.
+  Just select the toolchain profile in +Toolchain+ from the
+  available ones. This is definitely the easiest solution.
+
+* Use a predefined external toolchain profile, but instead of having
+  Buildroot download and extract the toolchain, you can tell Buildroot
+  where your toolchain is already installed on your system. Just
+  select the toolchain profile in +Toolchain+ through the available
+  ones, unselect +Download toolchain automatically+, and fill the
+  +Toolchain path+ text entry with the path to your cross-compiling
+  toolchain.
+
+* Use a completely custom external toolchain. This is particularly
+  useful for toolchains generated using crosstool-NG. To do this,
+  select the +Custom toolchain+ solution in the +Toolchain+ list. You
+  need to fill the +Toolchain path+, +Toolchain prefix+ and +External
+  toolchain C library+ options. Then, you have to tell Buildroot what
+  your external toolchain supports. If your external toolchain uses
+  the 'glibc' library, you only have to tell whether your toolchain
+  supports C\+\+ or not and whether it has built-in RPC support. If
+  your external toolchain uses the 'uClibc'
+  library, then you have to tell Buildroot if it supports largefile,
+  IPv6, RPC, wide-char, locale, program invocation, threads and
+  C++. At the beginning of the execution, Buildroot will tell you if
+  the selected options do not match the toolchain configuration.
+
+Our external toolchain support has been tested with toolchains from
+CodeSourcery and Linaro, toolchains generated by
+http://crosstool-ng.org[crosstool-NG], and toolchains generated by
+Buildroot itself. In general, all toolchains that support the
+'sysroot' feature should work. If not, do not hesitate to contact the
+developers.
+
+We do not support toolchains from the
+http://www.denx.de/wiki/DULG/ELDK[ELDK] of Denx, for two reasons:
+
+* The ELDK does not contain a pure toolchain (i.e just the compiler,
+  binutils, the C and C++ libraries), but a toolchain that comes with
+  a very large set of pre-compiled libraries and programs. Therefore,
+  Buildroot cannot import the 'sysroot' of the toolchain, as it would
+  contain hundreds of megabytes of pre-compiled libraries that are
+  normally built by Buildroot.
+
+* The ELDK toolchains have a completely non-standard custom mechanism
+  to handle multiple library variants. Instead of using the standard
+  GCC 'multilib' mechanism, the ARM ELDK uses different symbolic links
+  to the compiler to differentiate between library variants (for ARM
+  soft-float and ARM VFP), and the PowerPC ELDK compiler uses a
+  +CROSS_COMPILE+ environment variable. This non-standard behaviour
+  makes it difficult to support ELDK in Buildroot.
+
+We also do not support using the distribution toolchain (i.e the
+gcc/binutils/C library installed by your distribution) as the
+toolchain to build software for the target. This is because your
+distribution toolchain is not a "pure" toolchain (i.e only with the
+C/C++ library), so we cannot import it properly into the Buildroot
+build environment. So even if you are building a system for a x86 or
+x86_64 target, you have to generate a cross-compilation toolchain with
+Buildroot or crosstool-NG.
+
+If you want to generate a custom toolchain for your project, that can
+be used as an external toolchain in Buildroot, our recommandation is
+definitely to build it with http://crosstool-ng.org[crosstool-NG]. We
+recommend to build the toolchain separately from Buildroot, and then
+_import_ it in Buildroot using the external toolchain backend.
+
+Advantages of this backend:
+
+* Allows to use well-known and well-tested cross-compilation
+  toolchains.
+
+* Avoids the build time of the cross-compilation toolchain, which is
+  often very significant in the overall build time of an embedded
+  Linux system.
+
+* Not limited to uClibc: glibc and eglibc toolchains are supported.
+
+Drawbacks of this backend:
+
+* If your pre-built external toolchain has a bug, may be hard to get a
+  fix from the toolchain vendor, unless you build your external
+  toolchain by yourself using Crosstool-NG.
+
+Crosstool-NG toolchain backend
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The _Crosstool-NG toolchain backend_ integrates the
+http://crosstool-ng.org[Crosstool-NG] project with
+Buildroot. Crosstool-NG is a highly-configurable, versatile and
+well-maintained tool to build cross-compilation toolchains.
+
+If you select the +Crosstool-NG toolchain+ option in +Toolchain Type+,
+then you will be offered to:
+
+ * Choose which C library you want to use. Crosstool-NG supports the
+   three most important C libraries used in Linux systems: glibc,
+   eglibc and uClibc
+
+ * Choose a custom Crosstool-NG configuration file. Buildroot has its
+   own default configuration file (one per C library choice), but you
+   can provide your own. Another option is to run +make
+   ctng-menuconfig+ to get access to the Crosstool-NG configuration
+   interface. However, note that all Buildroot packages have only been
+   tested with the default Crosstool-NG configurations.
+
+ * Choose a number of toolchain options (rather limited if glibc or
+   eglibc are used, or numerous if uClibc is used)
+
+When you will start the Buildroot build process, Buildroot will
+download and install the Crosstool-NG tool, build and install its
+required dependencies, and then run Crosstool-NG with the provided
+configuration.
+
+Advantages of this backend:
+
+* Not limited to uClibc: glibc and eglibc are supported.
+
+* Vast possibilities of toolchain configuration.
+
+Drawbacks of this backend:
+
+* Crosstool-NG is not perfectly integrated with Buildroot. For
+  example, Crosstool-NG has its own download infrastructure, not
+  integrated with the one in Buildroot (for example a Buildroot +make
+  source+ will not download all the source code tarballs needed by
+  Crosstool-NG).
+
+* The toolchain is completely rebuilt from scratch if you do a +make
+  clean+.
+
 /dev management
 ~~~~~~~~~~~~~~~
 
diff --git a/docs/manual/embedded-basics.txt b/docs/manual/embedded-basics.txt
deleted file mode 100644
index fdadf62..0000000
--- a/docs/manual/embedded-basics.txt
+++ /dev/null
@@ -1,112 +0,0 @@
-// -*- mode:doc; -*-
-
-Embedded system basics
-----------------------
-
-When developing an embedded system, there are a number of choices to
-address:
-
-* the cross-toolchain: target architecture/C library/...
-* the bootloader
-* kernel options
-* the device management
-* the init system
-* the package selection (busybox vs. "real" programs, ...)
-* ...
-
-Some of these may be influenced by the target hardware.
-
-Some of the choices may also add some constraints when you develop the
-final application for which your target is designed (e.g. some
-functions may be provided by some C libraries and missing in some
-others, ...). So, these choices should be carefully made.
-
-Buildroot allows you to set most of these options to fit your needs.
-
-Moreover, Buildroot provides an infrastructure for reproducing the
-build process of your kernel, cross-toolchain, and embedded root
-filesystem. Being able to reproduce the build process will be useful
-when a component needs to be patched or updated or when another person
-is supposed to take over the project.
-
-[[cross-compilation-and-cross-toolchain]]
-Cross-compilation & cross-toolchain
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-A compilation toolchain is the set of tools that allows you to compile
-code for your system. It consists of a compiler (in our case, +gcc+),
-binary utils like assembler and linker (in our case, +binutils+) and a
-C standard library (for example
-http://www.gnu.org/software/libc/libc.html[GNU Libc],
-http://www.uclibc.org/[uClibc] or
-http://www.fefe.de/dietlibc/[dietlibc]).
-
-The system installed on your development station certainly already has
-a compilation toolchain that you can use to compile an application
-that runs on your system. If you're using a PC, your compilation
-toolchain runs on an x86 processor and generates code for an x86
-processor. Under most Linux systems, the compilation toolchain uses
-the GNU libc (glibc) as the C standard library. This compilation
-toolchain is called the "host compilation toolchain". The machine on
-which it is running, and on which you're working, is called the "host
-system" footnote:[This terminology differs from what is used by GNU
-configure, where the host is the machine on which the application will
-run (which is usually the same as target)].
-
-The compilation toolchain is provided by your distribution, and
-Buildroot has nothing to do with it (other than using it to build a
-cross-compilation toolchain and other tools that are run on the
-development host).
-
-As said above, the compilation toolchain that comes with your system
-runs on and generates code for the processor in your host system. As
-your embedded system has a different processor, you need a
-cross-compilation toolchain - a compilation toolchain that runs on
-your _host system_ but generates code for your _target system_ (and
-target processor). For example, if your host system uses x86 and your
-target system uses ARM, the regular compilation toolchain on your host
-runs on x86 and generates code for x86, while the cross-compilation
-toolchain runs on x86 and generates code for ARM.
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
-so is possible, but dealing with all of the configure options and
-problems of every +gcc+ or +binutils+ version is very time-consuming
-and uninteresting.  Buildroot automates this process through the use
-of Makefiles and has a collection of patches for each +gcc+ and
-+binutils+ version to make them work on most architectures.
-
-Buildroot offers a number of options and settings that can be tuned
-when defining the cross-toolchain (refer to xref:toolchain-custom[]).
-
-[[bootloader]]
-Bootloader
-~~~~~~~~~~
-
-TODO
-
-[[device-management]]
-Device management
-~~~~~~~~~~~~~~~~~
-
-TODO
-
-[[init-system]]
-Init system
-~~~~~~~~~~~
-
-TODO
diff --git a/docs/manual/external-toolchain.txt b/docs/manual/external-toolchain.txt
deleted file mode 100644
index 6124fe4..0000000
--- a/docs/manual/external-toolchain.txt
+++ /dev/null
@@ -1,88 +0,0 @@
-// -*- mode:doc -*- ;
-
-[[external-toolchain]]
-Using an external toolchain
-~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Using an already existing toolchain is useful for different
-reasons:
-
-* you already have a toolchain that is known to work for your specific
-  CPU
-
-* you want to speed up the Buildroot build process by skipping the
-  long toolchain build part
-
-* the toolchain generation feature of Buildroot is not sufficiently
-  flexible for you (for example if you need to generate a system with
-  'glibc' instead of 'uClibc')
-
-Buildroot supports using existing toolchains through a mechanism
-called 'external toolchain'. The external toolchain mechanism is
-enabled in the +Toolchain+ menu, by selecting +External toolchain+ in
-+Toolchain type+.
-
-Then, you have three solutions to use an external toolchain:
-
-* Use a predefined external toolchain profile, and let Buildroot
-  download, extract and install the toolchain. Buildroot already knows
-  about a few CodeSourcery, Linaro, Blackfin and Xilinx toolchains.
-  Just select the toolchain profile in +Toolchain+ from the
-  available ones. This is definitely the easiest solution.
-
-* Use a predefined external toolchain profile, but instead of having
-  Buildroot download and extract the toolchain, you can tell Buildroot
-  where your toolchain is already installed on your system. Just
-  select the toolchain profile in +Toolchain+ through the available
-  ones, unselect +Download toolchain automatically+, and fill the
-  +Toolchain path+ text entry with the path to your cross-compiling
-  toolchain.
-
-* Use a completely custom external toolchain. This is particularly
-  useful for toolchains generated using crosstool-NG. To do this,
-  select the +Custom toolchain+ solution in the +Toolchain+ list. You
-  need to fill the +Toolchain path+, +Toolchain prefix+ and +External
-  toolchain C library+ options. Then, you have to tell Buildroot what
-  your external toolchain supports. If your external toolchain uses
-  the 'glibc' library, you only have to tell whether your toolchain
-  supports C\+\+ or not and whether it has built-in RPC support. If
-  your external toolchain uses the 'uClibc'
-  library, then you have to tell Buildroot if it supports largefile,
-  IPv6, RPC, wide-char, locale, program invocation, threads and
-  C++. At the beginning of the execution, Buildroot will tell you if
-  the selected options do not match the toolchain configuration.
-
-
-Our external toolchain support has been tested with toolchains from
-CodeSourcery and Linaro, toolchains generated by
-http://crosstool-ng.org[crosstool-NG], and toolchains generated by
-Buildroot itself. In general, all toolchains that support the
-'sysroot' feature should work. If not, do not hesitate to contact the
-developers.
-
-We do not support toolchains from the
-http://www.denx.de/wiki/DULG/ELDK[ELDK] of Denx, for two reasons:
-
-* The ELDK does not contain a pure toolchain (i.e just the compiler,
-  binutils, the C and C++ libraries), but a toolchain that comes with
-  a very large set of pre-compiled libraries and programs. Therefore,
-  Buildroot cannot import the 'sysroot' of the toolchain, as it would
-  contain hundreds of megabytes of pre-compiled libraries that are
-  normally built by Buildroot.
-
-* The ELDK toolchains have a completely non-standard custom mechanism
-  to handle multiple library variants. Instead of using the standard
-  GCC 'multilib' mechanism, the ARM ELDK uses different symbolic links
-  to the compiler to differentiate between library variants (for ARM
-  soft-float and ARM VFP), and the PowerPC ELDK compiler uses a
-  +CROSS_COMPILE+ environment variable. This non-standard behaviour
-  makes it difficult to support ELDK in Buildroot.
-
-We also do not support using the distribution toolchain (i.e the
-gcc/binutils/C library installed by your distribution) as the
-toolchain to build software for the target. This is because your
-distribution toolchain is not a "pure" toolchain (i.e only with the
-C/C++ library), so we cannot import it properly into the Buildroot
-build environment. So even if you are building a system for a x86 or
-x86_64 target, you have to generate a cross-compilation toolchain with
-Buildroot or crosstool-NG.
diff --git a/docs/manual/going-further.txt b/docs/manual/going-further.txt
index 15324c4..070e0a3 100644
--- a/docs/manual/going-further.txt
+++ b/docs/manual/going-further.txt
@@ -3,8 +3,6 @@
 Going further in Buildroot's innards
 ====================================
 
-include::embedded-basics.txt[]
-
 include::how-buildroot-works.txt[]
 
 include::advanced.txt[]
-- 
1.7.9.5
