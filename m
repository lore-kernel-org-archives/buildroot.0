From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 16 May 2012 18:47:59 +0200
Subject: [Buildroot] [PATCH v2 04/11] manual: rework using.txt and
	update common-usage.txt
In-Reply-To: <1336905501-9757-5-git-send-email-s.martin49@gmail.com>
References: <4FAEEFA8.2070005@mind.be>
 <1336905501-9757-1-git-send-email-s.martin49@gmail.com>
 <1336905501-9757-5-git-send-email-s.martin49@gmail.com>
Message-ID: <CAAXf6LURDqdVWYF=KBHuCdpCBgjpjy9jahePQYibcXdQMVfSVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 13, 2012 at 12:38 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> From: Samuel MARTIN <s.martin49@gmail.com>
>
> Consider the second chapter: "starting-up", as a tutorial.
> Assuming that, using.txt only contains the very first commands used to get
> configure and build its very first target system.
>
> So, the following subsection from using.txt have been to common-usage.txt:
> - Offline builds
> - Building out-of-tree
> - Environment variables
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
> index ff8543f..dde1ab0 100644
> --- a/docs/manual/common-usage.txt
> +++ b/docs/manual/common-usage.txt
> @@ -2,3 +2,80 @@ Daily use
> ?---------
>
> ?include::rebuilding-packages.txt[]
> +
> +Offline builds
> +~~~~~~~~~~~~~~
> +
> +If you intend to do an offline build and just want to download
> +all sources that you previously selected in the configurator
> +('menuconfig', 'xconfig' or 'gconfig'), then issue:
> +
> +--------------------
> + $ make source
> +--------------------
> +
> +You can now disconnect or copy the content of your +dl+
> +directory to the build-host.
> +
> +Building out-of-tree
> +~~~~~~~~~~~~~~~~~~~~
> +
> +Buildroot supports building out of tree with a syntax similar to the
> +Linux kernel. To use it, add +O=<directory>+ to the make command line:
> +
> +--------------------
> + $ make O=/tmp/build
> +--------------------
> +
> +Or:
> +
> +--------------------
> + $ cd /tmp/build; make O=$PWD -C path/to/buildroot
> +--------------------
> +
> +All the output files will be located under +/tmp/build+.

I would mention in this section that the default output directory is
'output' in the buildroot tree.

> +
> +When using out-of-tree builds, the Buildroot +.config+ and temporary
> +files are also stored in the output directory. This means that you can
> +safely run multiple builds in parallel using the same source tree as
> +long as they use unique output directories.
> +
> +For ease of use, Buildroot generates a Makefile wrapper in the output
> +directory - So after the first run, you no longer need to pass +O=..+
> +and +-C ..+, simply run (in the output directory):
> +
> +--------------------
> + $ make <target>
> +--------------------
> +
> +[[env-vars]]
> +
> +Environment variables
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +Buildroot also honors some environment variables, when they are passed
> +to +make+ or set in the environment:
> +
> +* +HOSTCXX+, the host C++ compiler to use
> +* +HOSTCC+, the host C compiler to use
> +* +UCLIBC_CONFIG_FILE=<path/to/.config>+, path to
> + ?the uClibc configuration file, used to compile uClibc, if an
> + ?internal toolchain is being built
> +* +BUSYBOX_CONFIG_FILE=<path/to/.config>+, path to
> + ?the Busybox configuration file
> +* +BUILDROOT_DL_DIR+ to override the directory in which
> + ?Buildroot stores/retrieves downloaded files
> +
> +An example that uses config files located in the toplevel directory and
> +in your $HOME:
> +
> +--------------------
> + $ make UCLIBC_CONFIG_FILE=uClibc.config BUSYBOX_CONFIG_FILE=$HOME/bb.config
> +--------------------

I would mention here that the recommended usage is to specify these
config files in the buildroot .config file instead.

> +
> +If you want to use a compiler other than the default +gcc+
> +or +g+++ for building helper-binaries on your host, then do
> +
> +--------------------
> + $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
> +--------------------
> diff --git a/docs/manual/using.txt b/docs/manual/using.txt
> index 88dc58c..2945098 100644
> --- a/docs/manual/using.txt
> +++ b/docs/manual/using.txt
> @@ -3,8 +3,8 @@ Using Buildroot
>
> ?Buildroot has a nice configuration tool similar to the one you can
> ?find in the http://www.kernel.org/[Linux kernel] or in
> -http://www.busybox.net/[Busybox]. Note that you can (and should) build
> -everything as a normal user. There is no need to be root to configure
> +http://www.busybox.net/[Busybox]. Note that you can *and should build
> +everything as a normal user*. There is no need to be root to configure
> ?and use Buildroot. The first step is to run the configuration
> ?assistant:
>
> @@ -27,12 +27,11 @@ or
> ?to run the Qt or GTK-based configurators.
>
> ?All of these "make" commands will need to build a configuration
> -utility, so you may need to install "development" packages for
> -relevant libraries used by the configuration utilities. On Debian-like
> -systems, the +libncurses5-dev+ package is required to use the
> -'menuconfig' interface, +libqt4-dev+ is required to use the 'xconfig'
> -interface, and +libglib2.0-dev, libgtk2.0-dev and libglade2-dev+ are
> -needed to use the 'gconfig' interface.
> +utility (including the interface), so you may need to install
> +"development" packages for relevant libraries used by the
> +configuration utilities. Check the xref:requirement[] to know what
> +Buildroot needs, and specifically the xref:requirement-optional[system requirements]
> +to get the dependencies of favourite interface.

s/favourite/favorite/
as we generally use American style words (as you did before with honor, ...)

>
> ?For each menu entry in the configuration tool, you can find associated
> ?help that describes the purpose of the entry.
> @@ -54,9 +53,9 @@ tell Buildroot to run each package compilation with +make -jN+.
> ?This command will generally perform the following steps:
>
> ?* Download source files (as required)
> -* Configure, build and install the cross-compiling toolchain if an
> - ?internal toolchain is used, or import a toolchain if an external
> - ?toolchain is used
> +* Configure, build and install the cross-compiling toolchain using the
> + ?appropiate toolchain backend is used, or simply import a toolchain
> + ?if an external toolchain is used

s/appropiate/appropriate/
s/is used//


> ?* Build/install selected target packages
> ?* Build a kernel image, if selected
> ?* Build a bootloader image, if selected
> @@ -103,78 +102,9 @@ This directory contains several subdirectories:
> ?* +toolchain/+ contains the build directories for the various
> ? components of the cross-compilation toolchain.
>
> -Offline builds
> ---------------
> +These commands, +make menuconfig|gconfig|xconfig+ and +make+, are the
> +basic ones that allow to easily and quickly generate images fitting
> +your needs, with all the supports and applications you enabled.
>
> -If you intend to do an offline build and just want to download
> -all sources that you previously selected in the configurator
> -('menuconfig', 'xconfig' or 'gconfig'), then issue:
> -
> ---------------------
> - $ make source
> ---------------------
> -
> -You can now disconnect or copy the content of your +dl+
> -directory to the build-host.
> -
> -Building out-of-tree
> ---------------------
> -
> -Buildroot supports building out of tree with a syntax similar to the
> -Linux kernel. To use it, add +O=<directory>+ to the make command line:
> -
> ---------------------
> - $ make O=/tmp/build
> ---------------------
> -
> -Or:
> -
> ---------------------
> - $ cd /tmp/build; make O=$PWD -C path/to/buildroot
> ---------------------
> -
> -All the output files will be located under +/tmp/build+.
> -
> -When using out-of-tree builds, the Buildroot +.config+ and temporary
> -files are also stored in the output directory. This means that you can
> -safely run multiple builds in parallel using the same source tree as
> -long as they use unique output directories.
> -
> -For ease of use, Buildroot generates a Makefile wrapper in the output
> -directory - So after the first run, you no longer need to pass +O=..+
> -and +-C ..+, simply run (in the output directory):
> -
> ---------------------
> - $ make <target>
> ---------------------
> -
> -Environment variables
> ----------------------
> -[[env-vars]]
> -
> -Buildroot also honors some environment variables, when they are passed
> -to +make+ or set in the environment:
> -
> -* +HOSTCXX+, the host C++ compiler to use
> -* +HOSTCC+, the host C compiler to use
> -* +UCLIBC_CONFIG_FILE=<path/to/.config>+, path to
> - ?the uClibc configuration file, used to compile uClibc, if an
> - ?internal toolchain is being built
> -* +BUSYBOX_CONFIG_FILE=<path/to/.config>+, path to
> - ?the Busybox configuration file
> -* +BUILDROOT_DL_DIR+ to override the directory in which
> - ?Buildroot stores/retrieves downloaded files
> -
> -An example that uses config files located in the toplevel directory and
> -in your $HOME:
> -
> ---------------------
> - $ make UCLIBC_CONFIG_FILE=uClibc.config BUSYBOX_CONFIG_FILE=$HOME/bb.config
> ---------------------
> -
> -If you want to use a compiler other than the default +gcc+
> -or +g+++ for building helper-binaries on your host, then do
> -
> ---------------------
> - $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
> ---------------------
> +More details about the "make" command usages are given in
> +xref:make-tips[].

Is it common to talk about 'command usages' ? I would have put 'command usage'.

> --
> 1.7.10.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
