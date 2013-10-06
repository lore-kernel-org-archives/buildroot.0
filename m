From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 20:53:58 +0200
Subject: [Buildroot] [git commit] docs: update manual after Crosstool-NG
	backend removal
Message-ID: <20131006194411.5F9659B8FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d191c916272fcbac2fd12c4a064530743139dfe5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: remove a few more ctng references in customize-store.txt]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/configure.txt           |   60 ++--------------------------------
 docs/manual/customize-store.txt     |   22 ++++++-------
 docs/manual/customize-toolchain.txt |   12 -------
 docs/manual/make-tips.txt           |    2 -
 docs/manual/rebuilding-packages.txt |    2 -
 5 files changed, 14 insertions(+), 84 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 56b0469..8912a81 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -47,8 +47,7 @@ target system uses ARM, the regular compilation toolchain on your host
 runs on x86 and generates code for x86, while the cross-compilation
 toolchain runs on x86 and generates code for ARM.
 
-Buildroot provides different solutions to build, or use existing
-cross-compilation toolchains:
+Buildroot provides two solutions for the cross-compilation toolchain:
 
  * The *internal toolchain backend*, called +Buildroot toolchain+ in
    the configuration interface.
@@ -56,10 +55,7 @@ cross-compilation toolchains:
  * The *external toolchain backend*, called +External toolchain+ in
    the configuration interface.
 
- * The *Crosstool-NG toolchain backend*, called +Crosstool-NG
-   toolchain+ in the configuration interface.
-
-The choice between these three solutions is done using the +Toolchain
+The choice between these two solutions is done using the +Toolchain
 Type+ option in the +Toolchain+ menu. Once one solution has been
 chosen, a number of configuration options appear, they are detailed in
 the following sections.
@@ -76,8 +72,8 @@ This backend is the historical backend of Buildroot, and has been
 limited for a long time to the usage of the
 http://www.uclibc.org[uClibc C library]. Support for the _eglibc_ C
 library has been added in 2013 and is at this point considered
-experimental. See the _External toolchain backend_ and _Crosstool-NG
-toolchain backend_ for other solutions to use _glibc_ or _eglibc_.
+experimental. See the _External toolchain backend_ for another
+solution to use _glibc_ or _eglibc_.
 
 Once you have selected this backend, a number of options appear. The
 most important ones allow to:
@@ -242,54 +238,6 @@ Drawbacks of this backend:
   fix from the toolchain vendor, unless you build your external
   toolchain by yourself using Crosstool-NG.
 
-[[crosstool-ng-toolchain-backend]]
-Crosstool-NG toolchain backend
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-
-The _Crosstool-NG toolchain backend_ integrates the
-http://crosstool-ng.org[Crosstool-NG] project with
-Buildroot. Crosstool-NG is a highly-configurable, versatile and
-well-maintained tool to build cross-compilation toolchains.
-
-If you select the +Crosstool-NG toolchain+ option in +Toolchain Type+,
-then you will be offered to:
-
- * Choose which C library you want to use. Crosstool-NG supports the
-   three most important C libraries used in Linux systems: glibc,
-   eglibc and uClibc
-
- * Choose a custom Crosstool-NG configuration file. Buildroot has its
-   own default configuration file (one per C library choice), but you
-   can provide your own. Another option is to run +make
-   ctng-menuconfig+ to get access to the Crosstool-NG configuration
-   interface. However, note that all Buildroot packages have only been
-   tested with the default Crosstool-NG configurations.
-
- * Choose a number of toolchain options (rather limited if glibc or
-   eglibc are used, or numerous if uClibc is used)
-
-When you will start the Buildroot build process, Buildroot will
-download and install the Crosstool-NG tool, build and install its
-required dependencies, and then run Crosstool-NG with the provided
-configuration.
-
-Advantages of this backend:
-
-* Not limited to uClibc: glibc and eglibc are supported.
-
-* Vast possibilities of toolchain configuration.
-
-Drawbacks of this backend:
-
-* Crosstool-NG is not perfectly integrated with Buildroot. For
-  example, Crosstool-NG has its own download infrastructure, not
-  integrated with the one in Buildroot (for example a Buildroot +make
-  source+ will not download all the source code tarballs needed by
-  Crosstool-NG).
-
-* The toolchain is completely rebuilt from scratch if you do a +make
-  clean+.
-
 /dev management
 ~~~~~~~~~~~~~~~
 
diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
index 5083339..8fb5b57 100644
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -42,13 +42,14 @@ Alternatively, you can copy the file to any other place and rebuild with
 Other package configuration
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-The configuration files for busybox, the linux kernel, barebox, uClibc and
-crosstool-NG should be stored as well if changed. For each of these, a
-buildroot configuration option exists to point to an input configuration
-file, e.g. +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+.  To save their
-configuration, set those configuration options to a path outside
-your output directory, e.g. +board/<manufacturer>/<boardname>/linux.config+.
-Then, copy the configuration files to that path.
+The configuration files for busybox, the linux kernel, barebox and
+uClibc should be stored as well if changed. For each of these, a
+buildroot configuration option exists to point to an input
+configuration file, e.g. +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+.  To
+save their configuration, set those configuration options to a path
+outside your output directory,
+e.g. +board/<manufacturer>/<boardname>/linux.config+.  Then, copy the
+configuration files to that path.
 
 Make sure that you create a configuration file 'before' changing
 the +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+ etc. options.  Otherwise,
@@ -70,9 +71,8 @@ configuration files easier.
   path specified by +BR2_UCLIBC_CONFIG+.
 * +make barebox-update-defconfig+ saves the barebox configuration to the
   path specified by +BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE+.
-* For crosstool-NG and at91bootstrap3, no helper exists so you
-  have to copy the config file manually to +BR2_TOOLCHAIN_CTNG_CONFIG+,
-  resp. +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+.
+* For at91bootstrap3, no helper exists so you have to copy the config
+  file manually to +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+.
 
 
 [[customize-store-board-support]]
@@ -130,14 +130,12 @@ you can skip the steps that are not relevant for your use case.
    (as far as they are relevant):
    * +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+
    * +BR2_PACKAGE_BUSYBOX_CONFIG+
-   * +BR2_TOOLCHAIN_CTNG_CONFIG+
    * +BR2_UCLIBC_CONFIG+
    * +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+
    * +BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE+
 1. Write the configuration files:
    * +make linux-update-defconfig+
    * +make busybox-update-config+
-   * +cp <output>/build/build-toolchain/.config board/<manufacturer>/<boardname>/ctng.config+
    * +make uclibc-update-config+
    * +cp <output>/build/at91bootstrap3-*/.config board/<manufacturer>/<boardname>/at91bootstrap3.config+
    * +make barebox-update-defconfig+
diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
index 82ecc28..841dbfd 100644
--- a/docs/manual/customize-toolchain.txt
+++ b/docs/manual/customize-toolchain.txt
@@ -44,15 +44,3 @@ However, it allows to tune major settings, such as:
 
 These settings are available after selecting the +Buildroot toolchain+ type in
 the menu +Toolchain+.
-
-Using the Crosstool-NG backend
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-
-The http://crosstool-ng.org[crosstool-NG] toolchain backend enables a rather
-limited set of settings under the Buildroot +Toolchain+ menu:
-
-* The http://crosstool-ng.org[crosstool-NG] configuration file
-
-* Gdb and some toolchain options
-
-Then, the toolchain can be fine-tuned by invoking +make ctng-menuconfig+.
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index c3fd155..31a88bf 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -36,8 +36,6 @@ some settings in the +.config+ file may hide some targets:
   +linux+ is enabled;
 * +uclibc-menuconfig+ is only available when the
   Buildroot internal toolchain backend is used;
-* +ctng-menuconfig+ is only available when the
-  crosstool-NG backend is used;
 * +barebox-menuconfig+ and +barebox-savedefconfig+ only work when the
   +barebox+ bootloader is enabled.
 
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index 044c908..88d6670 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -17,8 +17,6 @@ In some cases, a full rebuild is mandatory:
 
 ** after changing any toolchain option under the _Toolchain_ menu (if
    the internal Buildroot backend is used);
-** after running +make ctng-menuconfig+ (if the crosstool-NG backend
-   is used);
 ** after running +make uclibc-menuconfig+.
 
 * after removing some libraries from the package selection.
