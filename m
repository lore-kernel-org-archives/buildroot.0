From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 02 Feb 2014 13:11:16 +0100
Subject: [Buildroot] [PATCH 1 of 9] manual: split information about
 Config.in dependencies to a separate file
In-Reply-To: <patchbomb.1391343075@argentina>
References: <patchbomb.1391343075@argentina>
Message-ID: <2267e0a51f62ee4cf4fb.1391343076@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The information about expressing dependencies in Config.in files is becoming
larger, and is more easily maintained from a separate file than from the
current file 'adding-packages-directory.txt'.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-dependencies.txt |  235 ++++++++++++++++++++++
 docs/manual/adding-packages-directory.txt    |  236 +----------------------
 2 files changed, 236 insertions(+), 235 deletions(-)

diff --git a/docs/manual/adding-packages-dependencies.txt b/docs/manual/adding-packages-dependencies.txt
new file mode 100644
--- /dev/null
+++ b/docs/manual/adding-packages-dependencies.txt
@@ -0,0 +1,235 @@
+[[depends-on-vs-select]]
+Choosing +depends on+ or +select+
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The +Config.in+ file of your package must also ensure that
+dependencies are enabled. Typically, Buildroot uses the following
+rules:
+
+* Use a +select+ type of dependency for dependencies on
+  libraries. These dependencies are generally not obvious and it
+  therefore make sense to have the kconfig system ensure that the
+  dependencies are selected. For example, the _libgtk2_ package uses
+  +select BR2_PACKAGE_LIBGLIB2+ to make sure this library is also
+  enabled.
+  The +select+ keyword expresses the dependency with a backward
+  semantic.
+
+* Use a +depends on+ type of dependency when the user really needs to
+  be aware of the dependency. Typically, Buildroot uses this type of
+  dependency for dependencies on target architecture, MMU support and
+  toolchain options (see xref:dependencies-target-toolchain-options[]),
+  or for dependencies on "big" things, such as the X.org system.
+  The +depends on+ keyword expresses the dependency with a forward
+  semantic.
+
+.Note
+The current problem with the _kconfig_ language is that these two
+dependency semantics are not internally linked. Therefore, it may be
+possible to select a package, whom one of its dependencies/requirement
+is not met.
+
+An example illustrates both the usage of +select+ and +depends on+.
+
+--------------------------
+config BR2_PACKAGE_ACL
+        bool "acl"
+        select BR2_PACKAGE_ATTR
+        depends on BR2_LARGEFILE
+        help
+          POSIX Access Control Lists, which are used to define more
+          fine-grained discretionary access rights for files and
+          directories.
+          This package also provides libacl.
+
+          http://savannah.nongnu.org/projects/acl
+
+comment "acl needs a toolchain w/ largefile"
+        depends on !BR2_LARGEFILE
+--------------------------
+
+
+Note that these two dependency types are only transitive with the
+dependencies of the same kind.
+
+This means, in the following example:
+
+--------------------------
+config BR2_PACKAGE_A
+        bool "Package A"
+
+config BR2_PACKAGE_B
+        bool "Package B"
+        depends on BR2_PACKAGE_A
+
+config BR2_PACKAGE_C
+        bool "Package C"
+        depends on BR2_PACKAGE_B
+
+config BR2_PACKAGE_D
+        bool "Package D"
+        select BR2_PACKAGE_B
+
+config BR2_PACKAGE_E
+        bool "Package E"
+        select BR2_PACKAGE_D
+--------------------------
+
+* Selecting +Package C+ will be visible if +Package B+ has been
+  selected, which in turn is only visible if +Package A+ has been
+  selected.
+
+* Selecting +Package E+ will select +Package D+, which will select
+  +Package B+, it will not check for the dependencies of +Package B+,
+  so it will not select +Package A+.
+
+* Since +Package B+ is selected but +Package A+ is not, this violates
+  the dependency of +Package B+ on +Package A+.  Therefore, in such a
+  situation, the transitive dependency has to be added explicitly:
+
+--------------------------
+config BR2_PACKAGE_D
+	bool "Package D"
+	select BR2_PACKAGE_B
+	depends on BR2_PACKAGE_A
+
+config BR2_PACKAGE_E
+	bool "Package E"
+	select BR2_PACKAGE_D
+	depends on BR2_PACKAGE_A
+--------------------------
+
+Overall, for package library dependencies, +select+ should be
+preferred.
+
+Note that such dependencies will ensure that the dependency option
+is also enabled, but not necessarily built before your package. To do
+so, the dependency also needs to be expressed in the +.mk+ file of the
+package.
+
+Further formatting details: see xref:writing-rules-config-in[the
+coding style].
+
+[[dependencies-target-toolchain-options]]
+Dependencies on target and toolchain options
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+Many packages depend on certain options of the toolchain: the choice of
+C library, C++ support, largefile support, thread support, RPC support,
+IPv6 support, wchar support, or dynamic library support. Some packages
+can only be built on certain target architectures, or if an MMU is
+available in the processor.
+
+These dependencies have to be expressed with the appropriate 'depends
+on' statements in the Config.in file. Additionally, for dependencies on
+toolchain options, a +comment+ should be displayed when the option is
+not enabled, so that the user knows why the package is not available.
+Dependencies on target architecture or MMU support should not be
+made visible in a comment: since it is unlikely that the user can
+freely choose another target, it makes little sense to show these
+dependencies explicitly.
+
+The +comment+ should only be visible if the +config+ option itself would
+be visible when the toolchain option dependencies are met. This means
+that all other dependencies of the package (including dependencies on
+target architecture and MMU support) have to be repeated on the
++comment+ definition. To keep it clear, the +depends on+ statement for
+these non-toolchain option should be kept separate from the +depends on+
+statement for the toolchain options.
+If there is a dependency on a config option in that same file (typically
+the main package) it is preferable to have a global +if ... endif+
+construct rather than repeating the +depends on+ statement on the
+comment and other config options.
+
+The general format of a dependency +comment+ for package foo is:
+--------------------------
+foo needs a toolchain w/ featA, featB, featC
+--------------------------
+
+for example:
+--------------------------
+aircrack-ng needs a toolchain w/ largefile, threads
+--------------------------
+
+Note that this text is kept brief on purpose, so that it will fit on a
+80-character terminal.
+
+The rest of this section enumerates the different target and toolchain
+options, the corresponding config symbols to depend on, and the text to
+use in the comment.
+
+* Target architecture
+** Dependency symbol: +BR2_powerpc+, +BR2_mips+, ... (see +arch/Config.in+)
+** Comment string: no comment to be added
+
+* MMU support
+** Dependency symbol: +BR2_USE_MMU+
+** Comment string: no comment to be added
+
+* C library
+** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
++BR2_TOOLCHAIN_USES_UCLIBC+
+** Comment string: for the C library, a slightly different comment text
+   is used: +foo needs an (e)glibc toolchain+, or `foo needs an (e)glibc
+   toolchain w/ C++ support`
+
+* C++ support
+** Dependency symbol: +BR2_INSTALL_LIBSTDCPP+
+** Comment string: `C++`
+
+* largefile support
+** Dependency symbol: +BR2_LARGEFILE+
+** Comment string: +largefile+
+
+* thread support
+** Dependency symbol: +BR2_TOOLCHAIN_HAS_THREADS+
+** Comment string: +threads+
+
+* RPC support
+** Dependency symbol: +BR2_TOOLCHAIN_HAS_NATIVE_RPC+
+** Comment string: +RPC+
+
+* IPv6 support
+** Dependency symbol: +BR2_INET_IPV6+
+** Comment string: +IPv6+ (lowercase v)
+
+* wchar support
+** Dependency symbol: +BR2_USE_WCHAR+
+** Comment string: +wchar+
+
+* dynamic library
+** Dependency symbol: +!BR2_PREFER_STATIC_LIB+
+** Comment string: +dynamic library+
+
+Dependencies on a Linux kernel built by buildroot
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+Some packages need a Linux kernel to be built by buildroot. These are
+typically kernel modules or firmware. A comment should be added in the
+Config.in file to express this dependency, similar to dependencies on
+toolchain options. The general format is:
+
+--------------------------
+foo needs a Linux kernel to be built
+--------------------------
+
+If there is a dependency on both toolchain options and the Linux
+kernel, use this format:
+--------------------------
+foo needs a toolchain w/ featA, featB, featC and a Linux kernel to be built
+--------------------------
+
+Dependencies on udev /dev management
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+If a package needs udev /dev management, it should depend on symbol
++BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV+, and the following comment
+should be added:
+
+--------------------------
+foo needs udev /dev management
+--------------------------
+
+If there is a dependency on both toolchain options and udev /dev
+management, use this format:
+
+--------------------------
+foo needs udev /dev management and a toolchain w/ featA, featB, featC
+--------------------------
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -51,241 +51,7 @@ supposed to contain anything but the 'ba
 source "package/libfoo/Config.in"
 --------------------------
 
-[[depends-on-vs-select]]
-Choosing +depends on+ or +select+
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-
-The +Config.in+ file of your package must also ensure that
-dependencies are enabled. Typically, Buildroot uses the following
-rules:
-
-* Use a +select+ type of dependency for dependencies on
-  libraries. These dependencies are generally not obvious and it
-  therefore make sense to have the kconfig system ensure that the
-  dependencies are selected. For example, the _libgtk2_ package uses
-  +select BR2_PACKAGE_LIBGLIB2+ to make sure this library is also
-  enabled.
-  The +select+ keyword expresses the dependency with a backward
-  semantic.
-
-* Use a +depends on+ type of dependency when the user really needs to
-  be aware of the dependency. Typically, Buildroot uses this type of
-  dependency for dependencies on target architecture, MMU support and
-  toolchain options (see xref:dependencies-target-toolchain-options[]),
-  or for dependencies on "big" things, such as the X.org system.
-  The +depends on+ keyword expresses the dependency with a forward
-  semantic.
-
-.Note
-The current problem with the _kconfig_ language is that these two
-dependency semantics are not internally linked. Therefore, it may be
-possible to select a package, whom one of its dependencies/requirement
-is not met.
-
-An example illustrates both the usage of +select+ and +depends on+.
-
---------------------------
-config BR2_PACKAGE_ACL
-        bool "acl"
-        select BR2_PACKAGE_ATTR
-        depends on BR2_LARGEFILE
-        help
-          POSIX Access Control Lists, which are used to define more
-          fine-grained discretionary access rights for files and
-          directories.
-          This package also provides libacl.
-
-          http://savannah.nongnu.org/projects/acl
-
-comment "acl needs a toolchain w/ largefile"
-        depends on !BR2_LARGEFILE
---------------------------
-
-
-Note that these two dependency types are only transitive with the
-dependencies of the same kind.
-
-This means, in the following example:
-
---------------------------
-config BR2_PACKAGE_A
-        bool "Package A"
-
-config BR2_PACKAGE_B
-        bool "Package B"
-        depends on BR2_PACKAGE_A
-
-config BR2_PACKAGE_C
-        bool "Package C"
-        depends on BR2_PACKAGE_B
-
-config BR2_PACKAGE_D
-        bool "Package D"
-        select BR2_PACKAGE_B
-
-config BR2_PACKAGE_E
-        bool "Package E"
-        select BR2_PACKAGE_D
---------------------------
-
-* Selecting +Package C+ will be visible if +Package B+ has been
-  selected, which in turn is only visible if +Package A+ has been
-  selected.
-
-* Selecting +Package E+ will select +Package D+, which will select
-  +Package B+, it will not check for the dependencies of +Package B+,
-  so it will not select +Package A+.
-
-* Since +Package B+ is selected but +Package A+ is not, this violates
-  the dependency of +Package B+ on +Package A+.  Therefore, in such a
-  situation, the transitive dependency has to be added explicitly:
-
---------------------------
-config BR2_PACKAGE_D
-	bool "Package D"
-	select BR2_PACKAGE_B
-	depends on BR2_PACKAGE_A
-
-config BR2_PACKAGE_E
-	bool "Package E"
-	select BR2_PACKAGE_D
-	depends on BR2_PACKAGE_A
---------------------------
-
-Overall, for package library dependencies, +select+ should be
-preferred.
-
-Note that such dependencies will ensure that the dependency option
-is also enabled, but not necessarily built before your package. To do
-so, the dependency also needs to be expressed in the +.mk+ file of the
-package.
-
-Further formatting details: see xref:writing-rules-config-in[the
-coding style].
-
-[[dependencies-target-toolchain-options]]
-Dependencies on target and toolchain options
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-Many packages depend on certain options of the toolchain: the choice of
-C library, C++ support, largefile support, thread support, RPC support,
-IPv6 support, wchar support, or dynamic library support. Some packages
-can only be built on certain target architectures, or if an MMU is
-available in the processor.
-
-These dependencies have to be expressed with the appropriate 'depends
-on' statements in the Config.in file. Additionally, for dependencies on
-toolchain options, a +comment+ should be displayed when the option is
-not enabled, so that the user knows why the package is not available.
-Dependencies on target architecture or MMU support should not be
-made visible in a comment: since it is unlikely that the user can
-freely choose another target, it makes little sense to show these
-dependencies explicitly.
-
-The +comment+ should only be visible if the +config+ option itself would
-be visible when the toolchain option dependencies are met. This means
-that all other dependencies of the package (including dependencies on
-target architecture and MMU support) have to be repeated on the
-+comment+ definition. To keep it clear, the +depends on+ statement for
-these non-toolchain option should be kept separate from the +depends on+
-statement for the toolchain options.
-If there is a dependency on a config option in that same file (typically
-the main package) it is preferable to have a global +if ... endif+
-construct rather than repeating the +depends on+ statement on the
-comment and other config options.
-
-The general format of a dependency +comment+ for package foo is:
---------------------------
-foo needs a toolchain w/ featA, featB, featC
---------------------------
-
-for example:
---------------------------
-aircrack-ng needs a toolchain w/ largefile, threads
---------------------------
-
-Note that this text is kept brief on purpose, so that it will fit on a
-80-character terminal.
-
-The rest of this section enumerates the different target and toolchain
-options, the corresponding config symbols to depend on, and the text to
-use in the comment.
-
-* Target architecture
-** Dependency symbol: +BR2_powerpc+, +BR2_mips+, ... (see +arch/Config.in+)
-** Comment string: no comment to be added
-
-* MMU support
-** Dependency symbol: +BR2_USE_MMU+
-** Comment string: no comment to be added
-
-* C library
-** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
-+BR2_TOOLCHAIN_USES_UCLIBC+
-** Comment string: for the C library, a slightly different comment text
-   is used: +foo needs an (e)glibc toolchain+, or `foo needs an (e)glibc
-   toolchain w/ C++ support`
-
-* C++ support
-** Dependency symbol: +BR2_INSTALL_LIBSTDCPP+
-** Comment string: `C++`
-
-* largefile support
-** Dependency symbol: +BR2_LARGEFILE+
-** Comment string: +largefile+
-
-* thread support
-** Dependency symbol: +BR2_TOOLCHAIN_HAS_THREADS+
-** Comment string: +threads+
-
-* RPC support
-** Dependency symbol: +BR2_TOOLCHAIN_HAS_NATIVE_RPC+
-** Comment string: +RPC+
-
-* IPv6 support
-** Dependency symbol: +BR2_INET_IPV6+
-** Comment string: +IPv6+ (lowercase v)
-
-* wchar support
-** Dependency symbol: +BR2_USE_WCHAR+
-** Comment string: +wchar+
-
-* dynamic library
-** Dependency symbol: +!BR2_PREFER_STATIC_LIB+
-** Comment string: +dynamic library+
-
-Dependencies on a Linux kernel built by buildroot
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-Some packages need a Linux kernel to be built by buildroot. These are
-typically kernel modules or firmware. A comment should be added in the
-Config.in file to express this dependency, similar to dependencies on
-toolchain options. The general format is:
-
---------------------------
-foo needs a Linux kernel to be built
---------------------------
-
-If there is a dependency on both toolchain options and the Linux
-kernel, use this format:
---------------------------
-foo needs a toolchain w/ featA, featB, featC and a Linux kernel to be built
---------------------------
-
-Dependencies on udev /dev management
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-If a package needs udev /dev management, it should depend on symbol
-+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV+, and the following comment
-should be added:
-
---------------------------
-foo needs udev /dev management
---------------------------
-
-If there is a dependency on both toolchain options and udev /dev
-management, use this format:
-
---------------------------
-foo needs udev /dev management and a toolchain w/ featA, featB, featC
---------------------------
+include::adding-packages-dependencies.txt[]
 
 The +.mk+ file
 ~~~~~~~~~~~~~~
