From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  3 Jul 2012 00:07:53 +0200
Subject: [Buildroot] [PATCH v3 5/5] Clean up naming of old GENTARGETS
	infrastructure
In-Reply-To: <1341266746-15301-1-git-send-email-arnout@mind.be>
References: <1341266746-15301-1-git-send-email-arnout@mind.be>
Message-ID: <1341266873-18680-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the renaming of XXXTARGETS to xxx-package, the names of the
pkg-xxx.mk files is inconsistent, as well as some internal names in
the documentation.  These inconsistencies are cleaned up here.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 docs/manual/adding-packages-autotools.txt |  169 +++++++++++
 docs/manual/adding-packages-cmake.txt     |  141 +++++++++
 docs/manual/adding-packages-directory.txt |   12 +-
 docs/manual/adding-packages-generic.txt   |  348 ++++++++++++++++++++++
 docs/manual/adding-packages.txt           |    6 +-
 package/Makefile.in                       |    6 +-
 package/pkg-autotools.mk                  |  307 ++++++++++++++++++++
 package/pkg-cmake.mk                      |  214 ++++++++++++++
 package/pkg-generic.mk                    |  449 +++++++++++++++++++++++++++++
 9 files changed, 1640 insertions(+), 12 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
new file mode 100644
index 0000000..a9653ce
--- /dev/null
+++ b/docs/manual/adding-packages-autotools.txt
@@ -0,0 +1,169 @@
+Infrastructure for autotools-based packages
+-------------------------------------------
+
+[[autotools-package-tutorial]]
+
++autotools-package+ tutorial
+~~~~~~~~~~~~~~~~~~~~~~
+
+First, let's see how to write a +.mk+ file for an autotools-based
+package, with an example :
+
+------------------------
+01: #############################################################
+02: #
+03: # libfoo
+04: #
+05: #############################################################
+06: LIBFOO_VERSION = 1.0
+07: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
+08: LIBFOO_SITE = http://www.foosoftware.org/download
+09: LIBFOO_INSTALL_STAGING = YES
+10: LIBFOO_INSTALL_TARGET = YES
+11: LIBFOO_CONF_OPT = --enable-shared
+12: LIBFOO_DEPENDENCIES = libglib2 host-pkg-config
+13:
+14: $(eval $(autotools-package))
+------------------------
+
+On line 6, we declare the version of the package.
+
+On line 7 and 8, we declare the name of the tarball and the location
+of the tarball on the Web. Buildroot will automatically download the
+tarball from this location.
+
+On line 9, we tell Buildroot to install the package to the staging
+directory. The staging directory, located in +output/staging/+
+is the directory where all the packages are installed, including their
+development files, etc. By default, packages are not installed to the
+staging directory, since usually, only libraries need to be installed in
+the staging directory: their development files are needed to compile
+other libraries or applications depending on them. Also by default, when
+staging installation is enabled, packages are installed in this location
+using the +make install+ command.
+
+On line 10, we tell Buildroot to also install the package to the
+target directory. This directory contains what will become the root
+filesystem running on the target. Usually, we try not to install header
+files and to install stripped versions of the binary. By default, target
+installation is enabled, so in fact, this line is not strictly
+necessary. Also by default, packages are installed in this location
+using the +make install+ command.
+
+On line 11, we tell Buildroot to pass a custom configure option, that
+will be passed to the +./configure+ script before configuring
+and building the package.
+
+On line 12, we declare our dependencies, so that they are built
+before the build process of our package starts.
+
+Finally, on line line 14, we invoke the +autotools-package+
+macro that generates all the Makefile rules that actually allows the
+package to be built.
+
+[[autotools-package-reference]]
+
++autotools-package+ reference
+~~~~~~~~~~~~~~~~~~~~~~~
+
+The main macro of the autotools package infrastructure is
++autotools-package+. It is similar to the +generic-package+ macro. The ability to
+have target and host packages is also available, with the
++host-autotools-package+ macro.
+
+Just like the generic infrastructure, the autotools infrastructure
+works by defining a number of variables before calling the
++autotools-package+ macro.
+
+First, all the package metadata information variables that exist in the
+generic infrastructure also exist in the autotools infrastructure:
++LIBFOO_VERSION+, +LIBFOO_SOURCE+,
++LIBFOO_PATCH+, +LIBFOO_SITE+,
++LIBFOO_SUBDIR+, +LIBFOO_DEPENDENCIES+,
++LIBFOO_INSTALL_STAGING+, +LIBFOO_INSTALL_TARGET+.
+
+A few additional variables, specific to the autotools infrastructure,
+can also be defined. Many of them are only useful in very specific
+cases, typical packages will therefore only use a few of them.
+
+* +LIBFOO_SUBDIR+ may contain the name of a subdirectory
+  inside the package that contains the configure script. This is useful,
+  if for example, the main configure script is not at the root of the
+  tree extracted by the tarball. If +HOST_LIBFOO_SUBDIR+ is
+  not specified, it defaults to +LIBFOO_SUBDIR+.
+
+* +LIBFOO_CONF_ENV+, to specify additional environment
+  variables to pass to the configure script. By default, empty.
+
+* +LIBFOO_CONF_OPT+, to specify additional configure
+  options to pass to the configure script. By default, empty.
+
+* +LIBFOO_MAKE+, to specify an alternate +make+
+  command. This is typically useful when parallel make is enabled in
+  the configuration (using +BR2_JLEVEL+) but that this
+  feature should be disabled for the given package, for one reason or
+  another. By default, set to +$(MAKE)+. If parallel building
+  is not supported by the package, then it should be set to
+  +LIBFOO_MAKE=$(MAKE1)+.
+
+* +LIBFOO_MAKE_ENV+, to specify additional environment
+  variables to pass to make in the build step. These are passed before
+  the +make+ command. By default, empty.
+
+* +LIBFOO_MAKE_OPT+, to specify additional variables to
+  pass to make in the build step. These are passed after the
+  +make+ command. By default, empty.
+
+* +LIBFOO_AUTORECONF+, tells whether the package should
+  be autoreconfigured or not (i.e, if the configure script and
+  Makefile.in files should be re-generated by re-running autoconf,
+  automake, libtool, etc.). Valid values are +YES+ and
+  +NO+. By default, the value is +NO+
+
+* +LIBFOO_AUTORECONF_OPT+ to specify additional options
+  passed to the 'autoreconf' program if
+  +LIBFOO_AUTORECONF=YES+. By default, empty.
+
+* +LIBFOO_LIBTOOL_PATCH+ tells whether the Buildroot
+  patch to fix libtool cross-compilation issues should be applied or
+  not. Valid values are +YES+ and +NO+. By
+  default, the value is +YES+
+
+* +LIBFOO_INSTALL_STAGING_OPT+ contains the make options
+  used to install the package to the staging directory. By default, the
+  value is +DESTDIR=$$(STAGING_DIR) install+, which is
+  correct for most autotools packages. It is still possible to override
+  it.
+
+* +LIBFOO_INSTALL_TARGET_OPT+ contains the make options
+  used to install the package to the target directory. By default, the
+  value is +DESTDIR=$$(TARGET_DIR) install+. The default
+  value is correct for most autotools packages, but it is still possible
+  to override it if needed.
+
+* +LIBFOO_CLEAN_OPT+ contains the make options used to
+  clean the package. By default, the value is +clean+.
+
+* +LIBFOO_UNINSTALL_STAGING_OPT+, contains the make
+  options used to uninstall the package from the staging directory. By
+  default, the value is +DESTDIR=$$(STAGING_DIR) uninstall+.
+
+* +LIBFOO_UNINSTALL_TARGET_OPT+, contains the make
+  options used to uninstall the package from the target directory. By
+  default, the value is +DESTDIR=$$(TARGET_DIR) uninstall+.
+
+With the autotools infrastructure, all the steps required to build
+and install the packages are already defined, and they generally work
+well for most autotools-based packages. However, when required, it is
+still possible to customize what is done in any particular step:
+
+* By adding a post-operation hook (after extract, patch, configure,
+  build or install). See the reference documentation of the generic
+  infrastructure for details.
+
+* By overriding one of the steps. For example, even if the autotools
+  infrastructure is used, if the package +.mk+ file defines its
+  own +LIBFOO_CONFIGURE_CMDS+ variable, it will be used
+  instead of the default autotools one. However, using this method
+  should be restricted to very specific cases. Do not use it in the
+  general case.
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
new file mode 100644
index 0000000..d1489bd
--- /dev/null
+++ b/docs/manual/adding-packages-cmake.txt
@@ -0,0 +1,141 @@
+Infrastructure for CMake-based packages
+---------------------------------------
+
+[[cmake-package-tutorial]]
+
++cmake-package+ tutorial
+~~~~~~~~~~~~~~~~~~~~~~~
+
+First, let's see how to write a +.mk+ file for a CMake-based package,
+with an example :
+
+------------------------
+01: #############################################################
+02: #
+03: # libfoo
+04: #
+05: #############################################################
+06: LIBFOO_VERSION = 1.0
+07: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
+08: LIBFOO_SITE = http://www.foosoftware.org/download
+09: LIBFOO_INSTALL_STAGING = YES
+10: LIBFOO_INSTALL_TARGET = YES
+11: LIBFOO_CONF_OPT = -DBUILD_DEMOS=ON
+12: LIBFOO_DEPENDENCIES = libglib2 host-pkg-config
+13:
+14: $(eval $(cmake-package))
+------------------------
+
+On line 6, we declare the version of the package.
+
+On line 7 and 8, we declare the name of the tarball and the location
+of the tarball on the Web. Buildroot will automatically download the
+tarball from this location.
+
+On line 9, we tell Buildroot to install the package to the staging
+directory. The staging directory, located in +output/staging/+
+is the directory where all the packages are installed, including their
+development files, etc. By default, packages are not installed to the
+staging directory, since usually, only libraries need to be installed in
+the staging directory: their development files are needed to compile
+other libraries or applications depending on them. Also by default, when
+staging installation is enabled, packages are installed in this location
+using the +make install+ command.
+
+On line 10, we tell Buildroot to also install the package to the
+target directory. This directory contains what will become the root
+filesystem running on the target. Usually, we try not to install header
+files and to install stripped versions of the binary. By default, target
+installation is enabled, so in fact, this line is not strictly
+necessary. Also by default, packages are installed in this location
+using the +make install+ command.
+
+On line 11, we tell Buildroot to pass custom options to CMake when it is
+configuring the package.
+
+On line 12, we declare our dependencies, so that they are built
+before the build process of our package starts.
+
+Finally, on line line 14, we invoke the +cmake-package+
+macro that generates all the Makefile rules that actually allows the
+package to be built.
+
+[[cmake-package-reference]]
+
++cmake-package+ reference
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+The main macro of the CMake package infrastructure is
++cmake-package+. It is similar to the +generic-package+ macro. The ability to
+have target and host packages is also available, with the
++host-cmake-package+ macro.
+
+Just like the generic infrastructure, the CMake infrastructure works
+by defining a number of variables before calling the +cmake-package+
+macro.
+
+First, all the package metadata information variables that exist in
+the generic infrastructure also exist in the CMake infrastructure:
++LIBFOO_VERSION+, +LIBFOO_SOURCE+, +LIBFOO_PATCH+, +LIBFOO_SITE+,
++LIBFOO_SUBDIR+, +LIBFOO_DEPENDENCIES+, +LIBFOO_INSTALL_STAGING+,
++LIBFOO_INSTALL_TARGET+.
+
+A few additional variables, specific to the CMake infrastructure, can
+also be defined. Many of them are only useful in very specific cases,
+typical packages will therefore only use a few of them.
+
+* +LIBFOO_SUBDIR+ may contain the name of a subdirectory inside the
+  package that contains the main CMakeLists.txt file. This is useful,
+  if for example, the main CMakeLists.txt file is not at the root of
+  the tree extracted by the tarball. If +HOST_LIBFOO_SUBDIR+ is not
+  specified, it defaults to +LIBFOO_SUBDIR+.
+
+* +LIBFOO_CONF_ENV+, to specify additional environment variables to
+  pass to CMake. By default, empty.
+
+* +LIBFOO_CONF_OPT+, to specify additional configure options to pass
+  to CMake. By default, empty.
+
+* +LIBFOO_MAKE+, to specify an alternate +make+ command. This is
+  typically useful when parallel make is enabled in the configuration
+  (using +BR2_JLEVEL+) but that this feature should be disabled for
+  the given package, for one reason or another. By default, set to
+  +$(MAKE)+. If parallel building is not supported by the package,
+  then it should be set to +LIBFOO_MAKE=$(MAKE1)+.
+
+* +LIBFOO_MAKE_ENV+, to specify additional environment variables to
+  pass to make in the build step. These are passed before the +make+
+  command. By default, empty.
+
+* +LIBFOO_MAKE_OPT+, to specify additional variables to pass to make
+  in the build step. These are passed after the +make+ command. By
+  default, empty.
+
+* +LIBFOO_INSTALL_STAGING_OPT+ contains the make options used to
+  install the package to the staging directory. By default, the value
+  is +DESTDIR=$$(STAGING_DIR) install+, which is correct for most
+  CMake packages. It is still possible to override it.
+
+* +LIBFOO_INSTALL_TARGET_OPT+ contains the make options used to
+  install the package to the target directory. By default, the value
+  is +DESTDIR=$$(TARGET_DIR) install+. The default value is correct
+  for most CMake packages, but it is still possible to override it if
+  needed.
+
+* +LIBFOO_CLEAN_OPT+ contains the make options used to clean the
+  package. By default, the value is +clean+.
+
+With the CMake infrastructure, all the steps required to build and
+install the packages are already defined, and they generally work well
+for most CMake-based packages. However, when required, it is still
+possible to customize what is done in any particular step:
+
+* By adding a post-operation hook (after extract, patch, configure,
+  build or install). See the reference documentation of the generic
+  infrastructure for details.
+
+* By overriding one of the steps. For example, even if the CMake
+  infrastructure is used, if the package +.mk+ file defines its own
+  +LIBFOO_CONFIGURE_CMDS+ variable, it will be used instead of the
+  default CMake one. However, using this method should be restricted
+  to very specific cases. Do not use it in the general case.
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 2670f2f..4a96415 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -163,22 +163,22 @@ different way, using different infrastructures:
   infrastructure must be used for all packages that do not use the
   autotools as their build system. In the future, other specialized
   infrastructures might be written for other build systems.  We cover
-  them through in a xref:gentargets-tutorial[tutorial] and a
-  xref:gentargets-reference[reference].
+  them through in a xref:generic-package-tutorial[tutorial] and a
+  xref:generic-package-reference[reference].
 
 * *Makefiles for autotools-based software* (autoconf, automake, etc.):
   We provide a dedicated infrastructure for such packages, since
   autotools is a very common build system. This infrastructure 'must'
   be used for new packages that rely on the autotools as their build
-  system. We cover them through a xref:autotargets-tutorial[tutorial]
-  and xref:autotargets-reference[reference].
+  system. We cover them through a xref:autotools-package-tutorial[tutorial]
+  and xref:autotools-package-reference[reference].
 
 * *Makefiles for cmake-based software*: We provide a dedicated
    infrastructure for such packages, as CMake is a more and more
    commonly used build system and has a standardized behaviour. This
    infrastructure 'must' be used for new packages that rely on
-   CMake. We cover them through a xref:cmaketargets-tutorial[tutorial]
-   and xref:cmaketargets-reference[reference].
+   CMake. We cover them through a xref:cmake-package-tutorial[tutorial]
+   and xref:cmake-package-reference[reference].
 
 * *Hand-written Makefiles:* These are currently obsolete, and no new
   manual Makefiles should be added. However, since there are still
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
new file mode 100644
index 0000000..4348bb9
--- /dev/null
+++ b/docs/manual/adding-packages-generic.txt
@@ -0,0 +1,348 @@
+Infrastructure for packages with specific build systems
+-------------------------------------------------------
+
+By 'packages with specific build systems' we mean all the packages
+whose build system is not one of the standard ones, such as
+'autotools' or 'CMake'. This typically includes packages whose build
+system is based on hand-written Makefiles or shell scripts.
+
+[[generic-package-tutorial]]
+
++generic-package+ Tutorial
+~~~~~~~~~~~~~~~~~~~~~
+
+------------------------------
+01: #############################################################
+02: #
+03: # libfoo
+04: #
+05: #############################################################
+06: LIBFOO_VERSION = 1.0
+07: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
+08: LIBFOO_SITE = http://www.foosoftware.org/download
+09: LIBFOO_INSTALL_STAGING = YES
+10: LIBFOO_DEPENDENCIES = host-libaaa libbbb
+11:
+12: define LIBFOO_BUILD_CMDS
+13: 	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
+14: endef
+15:
+16: define LIBFOO_INSTALL_STAGING_CMDS
+17: 	$(INSTALL) -D -m 0755 $(@D)/libfoo.a $(STAGING_DIR)/usr/lib/libfoo.a
+18: 	$(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
+19: 	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(STAGING_DIR)/usr/lib
+20: endef
+21:
+22: define LIBFOO_INSTALL_TARGET_CMDS
+23: 	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(TARGET_DIR)/usr/lib
+24: 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
+25: endef
+26:
+27: define LIBFOO_DEVICES
+28: 	/dev/foo  c  666  0  0  42  0  -  -  -
+29: endef
+30:
+31: define LIBFOO_PERMISSIONS
+32: 	/bin/foo  f  4755  0  0  -  -  -  -  -
+33: endef
+34:
+35: $(eval $(generic-package))
+--------------------------------
+
+The Makefile begins on line 6 to 8 with metadata information: the
+version of the package (+LIBFOO_VERSION+), the name of the
+tarball containing the package (+LIBFOO_SOURCE+) and the
+Internet location at which the tarball can be downloaded
+(+LIBFOO_SITE+). All variables must start with the same prefix,
++LIBFOO_+ in this case. This prefix is always the uppercased
+version of the package name (see below to understand where the package
+name is defined).
+
+On line 9, we specify that this package wants to install something to
+the staging space. This is often needed for libraries, since they must
+install header files and other development files in the staging space.
+This will ensure that the commands listed in the
++LIBFOO_INSTALL_STAGING_CMDS+ variable will be executed.
+
+On line 10, we specify the list of dependencies this package relies
+on. These dependencies are listed in terms of lower-case package names,
+which can be packages for the target (without the +host-+
+prefix) or packages for the host (with the +host-+) prefix).
+Buildroot will ensure that all these packages are built and installed
+'before' the current package starts its configuration.
+
+The rest of the Makefile defines what should be done at the different
+steps of the package configuration, compilation and installation.
++LIBFOO_BUILD_CMDS+ tells what steps should be performed to
+build the package. +LIBFOO_INSTALL_STAGING_CMDS+ tells what
+steps should be performed to install the package in the staging space.
++LIBFOO_INSTALL_TARGET_CMDS+ tells what steps should be
+performed to install the package in the target space.
+
+All these steps rely on the +$(@D)+ variable, which
+contains the directory where the source code of the package has been
+extracted.
+
+Finally, on line 35, we call the +generic-package+ which
+generates, according to the variables defined previously, all the
+Makefile code necessary to make your package working.
+
+[[generic-package-reference]]
+
++generic-package+ Reference
+~~~~~~~~~~~~~~~~~~~~~~
+
+There are two variants of the generic target. The +generic-package+ macro is
+used for packages to be cross-compiled for the target.  The
++host-generic-package+ macro is used for host packages, natively compiled
+for the host.  It is possible to call both of them in a single +.mk+
+file: once to create the rules to generate a target
+package and once to create the rules to generate a host package:
+
+----------------------
+$(eval $(generic-package))
+$(eval $(host-generic-package))
+----------------------
+
+This might be useful if the compilation of the target package requires
+some tools to be installed on the host. If the package name is
++libfoo+, then the name of the package for the target is also
++libfoo+, while the name of the package for the host is
++host-libfoo+. These names should be used in the DEPENDENCIES
+variables of other packages, if they depend on +libfoo+ or
++host-libfoo+.
+
+The call to the +generic-package+ and/or +host-generic-package+ macro *must* be
+at the end of the +.mk+ file, after all variable definitions.
+
+For the target package, the +generic-package+ uses the variables defined by
+the .mk file and prefixed by the uppercased package name:
++LIBFOO_*+. +host-generic-package+ uses the +HOST_LIBFOO_*+ variables. For
+'some' variables, if the +HOST_LIBFOO_+ prefixed variable doesn't
+exist, the package infrastructure uses the corresponding variable
+prefixed by +LIBFOO_+. This is done for variables that are likely to
+have the same value for both the target and host packages. See below
+for details.
+
+The list of variables that can be set in a +.mk+ file to give metadata
+information is (assuming the package name is +libfoo+) :
+
+* +LIBFOO_VERSION+, mandatory, must contain the version of the
+  package. Note that if +HOST_LIBFOO_VERSION+ doesn't exist, it is
+  assumed to be the same as +LIBFOO_VERSION+. It can also be a
+  revision number, branch or tag for packages that are fetched
+  directly from their revision control system. +
+  Examples: +
+    +LIBFOO_VERSION = 0.1.2+ +
+    +LIBFOO_VERSION = cb9d6aa9429e838f0e54faa3d455bcbab5eef057+ +
+    +LIBFOO_VERSION = stable+
+
+* +LIBFOO_SOURCE+ may contain the name of the tarball of
+  the package. If +HOST_LIBFOO_SOURCE+ is not specified, it
+  defaults to +LIBFOO_SOURCE+. If none are specified, then
+  the value is assumed to be
+  +packagename-$(LIBFOO_VERSION).tar.gz+. +
+  Example: +LIBFOO_SOURCE = foobar-$(LIBFOO_VERSION).tar.bz2+
+
+* +LIBFOO_PATCH+ may contain the name of a patch, that will be
+  downloaded from the same location as the tarball indicated in
+  +LIBFOO_SOURCE+. If +HOST_LIBFOO_PATCH+ is not specified, it
+  defaults to +LIBFOO_PATCH+. Also note that another mechanism is
+  available to patch a package: all files of the form
+  +packagename-packageversion-description.patch+ present in the
+  package directory inside Buildroot will be applied to the package
+  after extraction.
+
+* +LIBFOO_SITE+ provides the location of the package, which can be a
+  URL or a local filesystem path. HTTP, FTP and SCP are supported URL
+  types for retrieving package tarballs. Git, Subversion, Mercurial,
+  and Bazaar are supported URL types for retrieving packages directly
+  from source code management systems. A filesystem path may be used
+  to specify either a tarball or a directory containing the package
+  source code. See +LIBFOO_SITE_METHOD+ below for more details on how
+  retrieval works. +
+  Note that SCP URLs should be of the form
+  +scp://[user@]host:filepath+, and that filepath is relative to the
+  user's home directory, so you may want to prepend the path with a
+  slash for absolute paths:
+  +scp://[user@]host:/absolutepath+. +
+  If +HOST_LIBFOO_SITE+ is not specified, it defaults to
+  +LIBFOO_SITE+. If none are specified, then the location is assumed
+  to be
+  +http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/packagename+. +
+  Examples: +
+    +LIBFOO_SITE=http://www.libfoosoftware.org/libfoo+ +
+    +LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor/+ +
+    +LIBFOO_SITE=git://github.com/kergoth/tslib.git+
+    +LIBFOO_SITE=/opt/software/libfoo.tar.gz+
+    +LIBFOO_SITE=$(TOPDIR)/../src/libfoo/+
+
+* +LIBFOO_SITE_METHOD+ determines the method used to fetch or copy the
+  package source code. In many cases, Buildroot guesses the method
+  from the contents of +LIBFOO_SITE+ and setting +LIBFOO_SITE_METHOD+
+  is unnecessary. When +HOST_LIBFOO_SITE_METHOD+ is not specified, it
+  defaults to the value of +LIBFOO_SITE_METHOD+. +
+  The possible values of +LIBFOO_SITE_METHOD+ are:
+  ** +wget+ for normal FTP/HTTP downloads of tarballs.  Used by
+     default when +LIBFOO_SITE+ begins with +http://+, +https://+ or
+     +ftp://+.
+  ** +scp+ for downloads of tarballs over SSH with scp.  Used by
+     default when +LIBFOO_SITE+ begins with +scp://+.
+  ** +svn+ for retrieving source code from a Subversion repository.
+     Used by default when +LIBFOO_SITE+ begins with +svn://+.  When a
+     +http://+ Subversion repository URL is specified in
+     +LIBFOO_SITE+, one 'must' specify +LIBFOO_SITE_METHOD=svn+.
+     Buildroot performs a checkout which is preserved as a tarball in
+     the download cache; subsequent builds use the tarball instead of
+     performing another checkout.
+  ** +git+ for retrieving source code from a Git repository.  Used by
+     default when +LIBFOO_SITE+ begins with +git://+. The downloaded
+     source code is cached as with the +svn+
+     method.
+  ** +hg+ for retrieving source code from a Mercurial repository. One
+     'must' specify +LIBFOO_SITE_METHOD=hg+ when +LIBFOO_SITE+
+     contains a Mercurial repository URL. The downloaded source code
+     is cached as with the +svn+ method.
+  ** +bzr+ for retrieving source code from a Bazaar repository. Used
+     by default when +LIBFOO_SITE+ begins with +bzr://+. The
+     downloaded source code is cached as with the +svn+ method.
+  ** +file+ for a local tarball.  One should use this when
+     +LIBFOO_SITE+ specifies a package tarball as a local filename.
+     Useful for software that isn't available publicly or in version
+     control.
+  ** +local+ for a local source code directory.  One should use this
+     when +LIBFOO_SITE+ specifies a local directory path containing
+     the package source code.  Buildroot copies the contents of the
+     source directory into the package's build directory.
+
+* +LIBFOO_DEPENDENCIES+ lists the dependencies (in terms of package
+  name) that are required for the current target package to
+  compile. These dependencies are guaranteed to be compiled and
+  installed before the configuration of the current package starts. In
+  a similar way, +HOST_LIBFOO_DEPENDENCIES+ lists the dependency for
+  the current host package.
+
+* +LIBFOO_INSTALL_STAGING+ can be set to +YES+ or +NO+ (default). If
+  set to +YES+, then the commands in the +LIBFOO_INSTALL_STAGING_CMDS+
+  variables are executed to install the package into the staging
+  directory.
+
+* +LIBFOO_INSTALL_TARGET+ can be set to +YES+ (default) or +NO+. If
+  set to +YES+, then the commands in the +LIBFOO_INSTALL_TARGET_CMDS+
+  variables are executed to install the package into the target
+  directory.
+
+* +LIBFOO_DEVICES+ lists the device files to be created by Buildroot
+  when using the static device table. The syntax to use is the
+  makedevs one. You can find some documentation for this syntax in the
+  xref:makedev-syntax[]. This variable is optional.
+
+* +LIBFOO_PERMISSIONS+ lists the changes of permissions to be done at
+  the end of the build process. The syntax is once again the makedevs one.
+  You can find some documentation for this syntax in the xref:makedev-syntax[].
+  This variable is optional.
+
+The recommended way to define these variables is to use the following
+syntax:
+
+----------------------
+LIBFOO_VERSION = 2.32
+----------------------
+
+Now, the variables that define what should be performed at the
+different steps of the build process.
+
+* +LIBFOO_CONFIGURE_CMDS+, used to list the actions to be performed to
+  configure the package before its compilation
+
+* +LIBFOO_BUILD_CMDS+, used to list the actions to be performed to
+  compile the package
+
+* +HOST_LIBFOO_INSTALL_CMDS+, used to list the actions to be performed
+  to install the package, when the package is a host package. The
+  package must install its files to the directory given by
+  +$(HOST_DIR)+. All files, including development files such as
+  headers should be installed, since other packages might be compiled
+  on top of this package.
+
+* +LIBFOO_INSTALL_TARGET_CMDS+, used to list the actions to be
+  performed to install the package to the target directory, when the
+  package is a target package. The package must install its files to
+  the directory given by +$(TARGET_DIR)+. Only the files required for
+  'documentation' and 'execution' of the package should be
+  installed. Header files should not be installed, they will be copied
+  to the target, if the +development files in target filesystem+
+  option is selected.
+
+* +LIBFOO_INSTALL_STAGING_CMDS+, used to list the actions to be
+  performed to install the package to the staging directory, when the
+  package is a target package. The package must install its files to
+  the directory given by +$(STAGING_DIR)+. All development files
+  should be installed, since they might be needed to compile other
+  packages.
+
+* +LIBFOO_CLEAN_CMDS+, used to list the actions to perform to clean up
+  the build directory of the package.
+
+* +LIBFOO_UNINSTALL_TARGET_CMDS+, used to list the actions to
+  uninstall the package from the target directory +$(TARGET_DIR)+
+
+* +LIBFOO_UNINSTALL_STAGING_CMDS+, used to list the actions to
+  uninstall the package from the staging directory +$(STAGING_DIR)+.
+
+The preferred way to define these variables is:
+
+----------------------
+define LIBFOO_CONFIGURE_CMDS
+	action 1
+	action 2
+	action 3
+endef
+----------------------
+
+In the action definitions, you can use the following variables:
+
+* +$(@D)+, which contains the directory in which the package source
+  code has been uncompressed.
+
+* +$(TARGET_CC)+, +$(TARGET_LD)+, etc. to get the target
+  cross-compilation utilities
+
+* +$(TARGET_CROSS)+ to get the cross-compilation toolchain prefix
+
+* Of course the +$(HOST_DIR)+, +$(STAGING_DIR)+ and +$(TARGET_DIR)+
+  variables to install the packages properly.
+
+The last feature of the generic infrastructure is the ability to add
+hooks. These define further actions to perform after existing steps.
+Most hooks aren't really useful for generic packages, since the +.mk+
+file already has full control over the actions performed in each step
+of the package construction. The hooks are more useful for packages
+using the autotools infrastructure described below.  However, since
+they are provided by the generic infrastructure, they are documented
+here. The exception is +LIBFOO_POST_PATCH_HOOKS+.  Patching the
+package is not user definable, so +LIBFOO_POST_PATCH_HOOKS+ will be
+userful for generic packages.
+
+The following hook points are available:
+
+* +LIBFOO_POST_PATCH_HOOKS+
+* +LIBFOO_PRE_CONFIGURE_HOOKS+
+* +LIBFOO_POST_CONFIGURE_HOOKS+
+* +LIBFOO_POST_BUILD_HOOKS+
+* +LIBFOO_POST_INSTALL_HOOKS+ (for host packages only)
+* +LIBFOO_POST_INSTALL_STAGING_HOOKS+ (for target packages only)
+* +LIBFOO_POST_INSTALL_TARGET_HOOKS+ (for target packages only)
+
+These variables are 'lists' of variable names containing actions to be
+performed at this hook point. This allows several hooks to be
+registered at a given hook point. Here is an example:
+
+----------------------
+define LIBFOO_POST_PATCH_FIXUP
+	action1
+	action2
+endef
+
+LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
+----------------------
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index 0217e9f..acbde0c 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -8,11 +8,11 @@ tuning their configuration.
 
 include::adding-packages-directory.txt[]
 
-include::adding-packages-gentargets.txt[]
+include::adding-packages-generic.txt[]
 
-include::adding-packages-autotargets.txt[]
+include::adding-packages-autotools.txt[]
 
-include::adding-packages-cmaketargets.txt[]
+include::adding-packages-cmake.txt[]
 
 include::adding-packages-handwritten.txt[]
 
diff --git a/package/Makefile.in b/package/Makefile.in
index c5ad00a..7996418 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -312,6 +312,6 @@ endif
 
 include package/pkg-utils.mk
 include package/pkg-download.mk
-include package/pkg-autotargets.mk
-include package/pkg-cmaketargets.mk
-include package/pkg-gentargets.mk
+include package/pkg-autotools.mk
+include package/pkg-cmake.mk
+include package/pkg-generic.mk
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
new file mode 100644
index 0000000..a8d962d
--- /dev/null
+++ b/package/pkg-autotools.mk
@@ -0,0 +1,307 @@
+################################################################################
+# Autotools package infrastructure
+#
+# This file implements an infrastructure that eases development of
+# package .mk files for autotools packages. It should be used for all
+# packages that use the autotools as their build system.
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+# In terms of implementation, this autotools infrastructure requires
+# the .mk file to only specify metadata informations about the
+# package: name, version, download URL, etc.
+#
+# We still allow the package .mk file to override what the different
+# steps are doing, if needed. For example, if <PKG>_BUILD_CMDS is
+# already defined, it is used as the list of commands to perform to
+# build the package, instead of the default autotools behaviour. The
+# package can also define some post operation hooks.
+#
+################################################################################
+
+
+#
+# Utility function to upgrade config.sub and config.guess files
+#
+# argument 1 : directory into which config.guess and config.sub need
+# to be updated. Note that config.sub and config.guess are searched
+# recursively in this directory.
+#
+define CONFIG_UPDATE
+	for file in config.guess config.sub; do \
+		for i in $$(find $(1) -name $$file); do \
+			cp support/gnuconfig/$$file $$i; \
+		done; \
+	done
+endef
+
+################################################################################
+# inner-autotools-package -- defines how the configuration, compilation and
+# installation of an autotools package should be done, implements a
+# few hooks to tune the build process for autotools specifities and
+# calls the generic package infrastructure to generate the necessary
+# make targets
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including an HOST_ prefix
+#             for host packages
+#  argument 3 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 4 is the package directory prefix
+#  argument 5 is the type (target or host)
+################################################################################
+
+define inner-autotools-package
+
+# define package-specific variables to default values
+ifndef $(2)_SUBDIR
+ ifdef $(3)_SUBDIR
+  $(2)_SUBDIR = $($(3)_SUBDIR)
+ else
+  $(2)_SUBDIR ?=
+ endif
+endif
+
+ifndef $(2)_LIBTOOL_PATCH
+ ifdef $(3)_LIBTOOL_PATCH
+  $(2)_LIBTOOL_PATCH = $($(3)_LIBTOOL_PATCH)
+ else
+  $(2)_LIBTOOL_PATCH ?= YES
+ endif
+endif
+
+ifndef $(2)_MAKE
+ ifdef $(3)_MAKE
+  $(2)_MAKE = $($(3)_MAKE)
+ else
+  $(2)_MAKE ?= $(MAKE)
+ endif
+endif
+
+$(2)_CONF_ENV			?=
+$(2)_CONF_OPT			?=
+$(2)_MAKE_ENV			?=
+$(2)_MAKE_OPT			?=
+$(2)_AUTORECONF			?= NO
+$(2)_AUTORECONF_OPT		?=
+$(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
+$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
+$(2)_CLEAN_OPT			?= clean
+$(2)_UNINSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) uninstall
+$(2)_UNINSTALL_TARGET_OPT	?= DESTDIR=$$(TARGET_DIR)  uninstall
+
+$(2)_SRCDIR                     = $$($(2)_DIR)/$$($(2)_SUBDIR)
+
+#
+# Configure step. Only define it if not already defined by the package
+# .mk file. And take care of the differences between host and target
+# packages.
+#
+ifndef $(2)_CONFIGURE_CMDS
+ifeq ($(5),target)
+
+# Configure package for target
+define $(2)_CONFIGURE_CMDS
+	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache && \
+	$$(TARGET_CONFIGURE_OPTS) \
+	$$(TARGET_CONFIGURE_ARGS) \
+	$$($$(PKG)_CONF_ENV) \
+	./configure \
+		--target=$$(GNU_TARGET_NAME) \
+		--host=$$(GNU_TARGET_NAME) \
+		--build=$$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--sysconfdir=/etc \
+		--program-prefix="" \
+		$$(DISABLE_DOCUMENTATION) \
+		$$(DISABLE_NLS) \
+		$$(DISABLE_LARGEFILE) \
+		$$(DISABLE_IPV6) \
+		$$(SHARED_STATIC_LIBS_OPTS) \
+		$$(QUIET) $$($$(PKG)_CONF_OPT) \
+	)
+endef
+else
+
+# Configure package for host
+define $(2)_CONFIGURE_CMDS
+	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache; \
+	        $$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$$(HOST_CFLAGS)" \
+		LDFLAGS="$$(HOST_LDFLAGS)" \
+                $$($$(PKG)_CONF_ENV) \
+		./configure \
+		--prefix="$$(HOST_DIR)/usr" \
+		--sysconfdir="$$(HOST_DIR)/etc" \
+		--enable-shared --disable-static \
+		$$($$(PKG)_CONF_OPT) \
+	)
+endef
+endif
+endif
+
+#
+# Hook to update config.sub and config.guess if needed
+#
+define UPDATE_CONFIG_HOOK
+       @$$(call MESSAGE, "Updating config.sub and config.guess")
+       $$(call CONFIG_UPDATE,$$(@D))
+endef
+
+$(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
+
+#
+# Hook to patch libtool to make it work properly for cross-compilation
+#
+define LIBTOOL_PATCH_HOOK
+	@$$(call MESSAGE,"Patching libtool")
+	$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES" \
+		-a "$$($$(PKG)_AUTORECONF)" != "YES"; then \
+		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
+			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
+			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
+			if test $$$${ltmain_version} = '1.5'; then \
+				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
+			elif test $$$${ltmain_version} = "2.2"; then\
+				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
+			elif test $$$${ltmain_version} = "2.4"; then\
+				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
+			fi \
+		done \
+	fi
+endef
+
+# default values are not evaluated yet, so don't rely on this defaulting to YES
+ifneq ($$($(2)_LIBTOOL_PATCH),NO)
+$(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
+endif
+
+#
+# Hook to autoreconf the package if needed
+#
+define AUTORECONF_HOOK
+	@$$(call MESSAGE,"Autoreconfiguring")
+	$(Q)cd $$($$(PKG)_SRCDIR) && $(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
+	$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
+		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
+			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | sed 's/\([0-9].[0-9]*\).*/\1/'`; \
+			if test $$$${ltmain_version} = "1.5"; then \
+				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
+			elif test $$$${ltmain_version} = "2.2"; then\
+				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
+			elif test $$$${ltmain_version} = "2.4"; then\
+				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
+			fi \
+		done \
+	fi
+endef
+
+# This must be repeated from inner-generic-package, otherwise we get an empty
+# _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
+# away from the non-host rule
+$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool,\
+    $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+
+
+ifeq ($$($(2)_AUTORECONF),YES)
+$(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
+$(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
+endif
+
+#
+# Build step. Only define it if not already defined by the package .mk
+# file.
+#
+ifndef $(2)_BUILD_CMDS
+ifeq ($(5),target)
+define $(2)_BUILD_CMDS
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
+endef
+else
+define $(2)_BUILD_CMDS
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
+endef
+endif
+endif
+
+#
+# Host installation step. Only define it if not already defined by the
+# package .mk file.
+#
+ifndef $(2)_INSTALL_CMDS
+define $(2)_INSTALL_CMDS
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -C $$($$(PKG)_SRCDIR) install
+endef
+endif
+
+#
+# Staging installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_STAGING_CMDS
+define $(2)_INSTALL_STAGING_CMDS
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
+	for i in $$$$(find $(STAGING_DIR)/usr/lib* -name "*.la"); do \
+		cp -f $$$$i $$$$i~; \
+		$$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
+	done
+endef
+endif
+
+#
+# Target installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
+endef
+endif
+
+#
+# Clean step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_CLEAN_CMDS
+define $(2)_CLEAN_CMDS
+	-$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)  $$($$(PKG)_CLEAN_OPT) -C $$($$(PKG)_SRCDIR)
+endef
+endif
+
+#
+# Uninstall from staging step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_UNINSTALL_STAGING_CMDS
+define $(2)_UNINSTALL_STAGING_CMDS
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_UNINSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
+endef
+endif
+
+#
+# Uninstall from target step. Only define it if not already defined
+# by the package .mk file.
+# Autotools Makefiles do uninstall with ( cd ...; rm -f ... )
+# Since we remove a lot of directories in target-finalize, this is likely
+# to fail.  Therefore add -k flag.
+#
+ifndef $(2)_UNINSTALL_TARGET_CMDS
+define $(2)_UNINSTALL_TARGET_CMDS
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -k $$($$(PKG)_UNINSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
+endef
+endif
+
+# Call the generic package infrastructure to generate the necessary
+# make targets
+$(call inner-generic-package,$(1),$(2),$(3),$(4),$(5))
+
+endef
+
+################################################################################
+# autotools-package -- the target generator macro for autotools packages
+################################################################################
+
+autotools-package = $(call inner-autotools-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+host-autotools-package = $(call inner-autotools-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
new file mode 100644
index 0000000..b4df773
--- /dev/null
+++ b/package/pkg-cmake.mk
@@ -0,0 +1,214 @@
+################################################################################
+# CMake package infrastructure
+#
+# This file implements an infrastructure that eases development of
+# package .mk files for CMake packages. It should be used for all
+# packages that use CMake as their build system.
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+# In terms of implementation, this CMake infrastructure requires
+# the .mk file to only specify metadata informations about the
+# package: name, version, download URL, etc.
+#
+# We still allow the package .mk file to override what the different
+# steps are doing, if needed. For example, if <PKG>_BUILD_CMDS is
+# already defined, it is used as the list of commands to perform to
+# build the package, instead of the default CMake behaviour. The
+# package can also define some post operation hooks.
+#
+################################################################################
+
+################################################################################
+# inner-cmake-package -- defines how the configuration, compilation and
+# installation of a CMake package should be done, implements a few hooks to
+# tune the build process and calls the generic package infrastructure to
+# generate the necessary make targets
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including an HOST_ prefix
+#             for host packages
+#  argument 3 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 4 is the package directory prefix
+#  argument 5 is the type (target or host)
+################################################################################
+
+define inner-cmake-package
+
+# define package-specific variables to default values
+ifndef $(2)_SUBDIR
+ ifdef $(3)_SUBDIR
+  $(2)_SUBDIR = $($(3)_SUBDIR)
+ else
+  $(2)_SUBDIR ?=
+ endif
+endif
+
+$(2)_CONF_ENV			?=
+$(2)_CONF_OPT			?=
+$(2)_MAKE			?= $(MAKE)
+$(2)_MAKE_ENV			?=
+$(2)_MAKE_OPT			?=
+$(2)_INSTALL_HOST_OPT		?= install
+$(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
+$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR) install
+$(2)_CLEAN_OPT			?= clean
+
+$(2)_SRCDIR			= $$($(2)_DIR)/$($(2)_SUBDIR)
+$(2)_BUILDDIR			= $$($(2)_SRCDIR)
+
+#
+# Configure step. Only define it if not already defined by the package
+# .mk file. And take care of the differences between host and target
+# packages.
+#
+ifndef $(2)_CONFIGURE_CMDS
+ifeq ($(5),target)
+
+# Configure package for target
+define $(2)_CONFIGURE_CMDS
+	(cd $$($$(PKG)_BUILDDIR) && \
+	rm -f CMakeCache.txt && \
+	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
+		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
+		-DCMAKE_INSTALL_PREFIX="/usr" \
+		$$($$(PKG)_CONF_OPT) \
+	)
+endef
+else
+
+# Configure package for host
+define $(2)_CONFIGURE_CMDS
+	(cd $$($$(PKG)_BUILDDIR) && \
+	rm -f CMakeCache.txt && \
+	$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
+		-DCMAKE_INSTALL_SO_NO_EXE=0 \
+		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
+		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
+		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" \
+		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
+		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)/usr" \
+		$$($$(PKG)_CONF_OPT) \
+	)
+endef
+endif
+endif
+
+# This must be repeated from inner-generic-package, otherwise we only get
+# host-cmake in _DEPENDENCIES because of the following line
+$(2)_DEPENDENCIES ?= $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES)))
+
+$(2)_DEPENDENCIES += host-cmake
+
+#
+# Build step. Only define it if not already defined by the package .mk
+# file.
+#
+ifndef $(2)_BUILD_CMDS
+ifeq ($(5),target)
+define $(2)_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
+endef
+else
+define $(2)_BUILD_CMDS
+	$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
+endef
+endif
+endif
+
+#
+# Host installation step. Only define it if not already defined by the
+# package .mk file.
+#
+ifndef $(2)_INSTALL_CMDS
+define $(2)_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_HOST_OPT) -C $$($$(PKG)_BUILDDIR)
+endef
+endif
+
+#
+# Staging installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_STAGING_CMDS
+define $(2)_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_BUILDDIR)
+endef
+endif
+
+#
+# Target installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_BUILDDIR)
+endef
+endif
+
+#
+# Clean step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_CLEAN_CMDS
+define $(2)_CLEAN_CMDS
+	-$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_CLEAN_OPT) -C $$($$(PKG)_BUILDDIR)
+endef
+endif
+
+#
+# Uninstall from staging step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_UNINSTALL_STAGING_CMDS
+define $(2)_UNINSTALL_STAGING_CMDS
+	(cd $$($$(PKG)_BUILDDIR) && sed "s:\(.*\):$$(STAGING_DIR)\1:" install_manifest.txt | xargs rm -f)
+endef
+endif
+
+#
+# Uninstall from target step. Only define it if not already defined
+# by the package .mk file.
+#
+ifndef $(2)_UNINSTALL_TARGET_CMDS
+define $(2)_UNINSTALL_TARGET_CMDS
+	(cd $$($$(PKG)_BUILDDIR) && sed "s:\(.*\):$$(TARGET_DIR)\1:" install_manifest.txt | xargs rm -f)
+endef
+endif
+
+# Call the generic package infrastructure to generate the necessary
+# make targets
+$(call inner-generic-package,$(1),$(2),$(3),$(4),$(5))
+
+endef
+
+################################################################################
+# cmake-package -- the target generator macro for CMake packages
+################################################################################
+
+cmake-package = $(call inner-cmake-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+host-cmake-package = $(call inner-cmake-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+
+################################################################################
+# Generation of the CMake toolchain file
+################################################################################
+
+$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
+	@mkdir -p $(@D)
+	@echo -en "\
+	set(CMAKE_SYSTEM_NAME Linux)\n\
+	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
+	set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
+	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
+	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
+	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
+	set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
+	set(CMAKE_FIND_ROOT_PATH \"$(STAGING_DIR)\")\n\
+	set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
+	set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
+	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
+	set(ENV{PKG_CONFIG_SYSROOT_DIR} \"$(STAGING_DIR)\")\n\
+	" > $@
+
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
new file mode 100644
index 0000000..3af936c
--- /dev/null
+++ b/package/pkg-generic.mk
@@ -0,0 +1,449 @@
+################################################################################
+# Generic package infrastructure
+#
+# This file implements an infrastructure that eases development of
+# package .mk files. It should be used for packages that do not rely
+# on a well-known build system for which Buildroot has a dedicated
+# infrastructure (so far, Buildroot has special support for
+# autotools-based and CMake-based packages).
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+# In terms of implementation, this generic infrastructure requires the
+# .mk file to specify:
+#
+#   1. Metadata informations about the package: name, version,
+#      download URL, etc.
+#
+#   2. Description of the commands to be executed to configure, build
+#      and install the package
+################################################################################
+
+################################################################################
+# Implicit targets -- produce a stamp file for each step of a package build
+################################################################################
+
+# Retrieve the archive
+$(BUILD_DIR)/%/.stamp_downloaded:
+ifeq ($(DL_MODE),DOWNLOAD)
+# Only show the download message if it isn't already downloaded
+	$(Q)(test -e $(DL_DIR)/$($(PKG)_SOURCE) && \
+		(test -z $($(PKG)_PATCH) || test -e $(DL_DIR)$($(PKG)_PATCH))) || \
+		$(call MESSAGE,"Downloading")
+endif
+	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_SOURCE)))
+	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_PATCH)))
+	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
+ifeq ($(DL_MODE),DOWNLOAD)
+	$(Q)mkdir -p $(@D)
+	$(Q)touch $@
+endif
+
+# Unpack the archive
+$(BUILD_DIR)/%/.stamp_extracted:
+	@$(call MESSAGE,"Extracting")
+	$(Q)mkdir -p $(@D)
+	$($(PKG)_EXTRACT_CMDS)
+# some packages have messed up permissions inside
+	$(Q)chmod -R +rw $(@D)
+	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
+	$(Q)touch $@
+
+# Rsync the source directory if the <pkg>_OVERRIDE_SRCDIR feature is
+# used.
+$(BUILD_DIR)/%/.stamp_rsynced:
+	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
+	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
+	rsync -au $(SRCDIR)/ $(@D)
+	$(Q)touch $@
+
+# Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for rsynced
+# packages
+$(BUILD_DIR)/%/.stamp_rsync_sourced:
+ifeq ($(DL_MODE),SOURCE_CHECK)
+	test -d $(SRCDIR)
+else ifeq ($(DL_MODE),SHOW_EXTERNAL_DEPS)
+	echo "file://$(SRCDIR)"
+else
+	@true # Nothing to do to source a local package
+endif
+
+# Patch
+#
+# The RAWNAME variable is the lowercased package name, which allows to
+# find the package directory (typically package/<pkgname>) and the
+# prefix of the patches
+$(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
+$(BUILD_DIR)/%/.stamp_patched:
+	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
+	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
+	$(if $($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
+	$(Q)( \
+	if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME); then \
+	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER)*.patch*)"; then \
+	    support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
+	  else \
+	    support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(RAWNAME)\*.patch $(RAWNAME)\*.patch.$(ARCH) || exit 1; \
+	    if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER); then \
+	      support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH) || exit 1; \
+	    fi; \
+	  fi; \
+	fi; \
+	)
+	$(foreach hook,$($(PKG)_POST_PATCH_HOOKS),$(call $(hook))$(sep))
+	$(Q)touch $@
+
+# Configure
+$(BUILD_DIR)/%/.stamp_configured:
+	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
+	@$(call MESSAGE,"Configuring")
+	$($(PKG)_CONFIGURE_CMDS)
+	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
+	$(Q)touch $@
+
+# Build
+$(BUILD_DIR)/%/.stamp_built::
+	@$(call MESSAGE,"Building")
+	$($(PKG)_BUILD_CMDS)
+	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
+	$(Q)touch $@
+
+# Install to host dir
+$(BUILD_DIR)/%/.stamp_host_installed:
+	@$(call MESSAGE,"Installing to host directory")
+	$($(PKG)_INSTALL_CMDS)
+	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
+	$(Q)touch $@
+
+# Install to staging dir
+$(BUILD_DIR)/%/.stamp_staging_installed:
+	@$(call MESSAGE,"Installing to staging directory")
+	$($(PKG)_INSTALL_STAGING_CMDS)
+	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
+	$(Q)touch $@
+
+# Install to images dir
+$(BUILD_DIR)/%/.stamp_images_installed:
+	@$(call MESSAGE,"Installing to images directory")
+	$($(PKG)_INSTALL_IMAGES_CMDS)
+	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
+	$(Q)touch $@
+
+# Install to target dir
+$(BUILD_DIR)/%/.stamp_target_installed:
+	@$(call MESSAGE,"Installing to target")
+	$($(PKG)_INSTALL_TARGET_CMDS)
+	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
+	$(Q)touch $@
+
+# Clean package
+$(BUILD_DIR)/%/.stamp_cleaned:
+	@$(call MESSAGE,"Cleaning up")
+	$($(PKG)_CLEAN_CMDS)
+	rm -f $(@D)/.stamp_built
+
+# Uninstall package from target and staging
+# Uninstall commands tend to fail, so remove the stamp files first
+$(BUILD_DIR)/%/.stamp_uninstalled:
+	@$(call MESSAGE,"Uninstalling")
+	rm -f $($(PKG)_TARGET_INSTALL_STAGING)
+	rm -f $($(PKG)_TARGET_INSTALL_TARGET)
+	$($(PKG)_UNINSTALL_STAGING_CMDS)
+	$($(PKG)_UNINSTALL_TARGET_CMDS)
+
+# Remove package sources
+$(BUILD_DIR)/%/.stamp_dircleaned:
+	rm -Rf $(@D)
+
+################################################################################
+# inner-generic-package -- generates the make targets needed to build a
+# generic package
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including an HOST_ prefix
+#             for host packages
+#  argument 3 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 4 is the package directory prefix
+#  argument 5 is the type (target or host)
+################################################################################
+
+define inner-generic-package
+
+# Define default values for various package-related variables, if not
+# already defined. For some variables (version, source, site and
+# subdir), if they are undefined, we try to see if a variable without
+# the HOST_ prefix is defined. If so, we use such a variable, so that
+# these informations have only to be specified once, for both the
+# target and host packages of a given .mk file.
+
+$(2)_TYPE                       =  $(5)
+$(2)_NAME			=  $(1)
+
+# Keep the package version that may contain forward slashes in the _DL_VERSION
+# variable, then replace all forward slashes ('/') by underscores ('_') to
+# sanitize the package version that is used in paths, directory and file names.
+# Forward slashes may appear in the package's version when pointing to a
+# version control system branch or tag, for example remotes/origin/1_10_stable.
+ifndef $(2)_VERSION
+ ifdef $(3)_VERSION
+  $(2)_DL_VERSION = $($(3)_VERSION)
+  $(2)_VERSION = $(subst /,_,$($(3)_VERSION))
+ else
+  $(2)_VERSION = undefined
+  $(2)_DL_VERSION = undefined
+ endif
+else
+  $(2)_DL_VERSION = $($(2)_VERSION)
+  $(2)_VERSION = $(subst /,_,$($(2)_VERSION))
+endif
+
+$(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
+$(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
+$(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
+
+ifneq ($$($(2)_OVERRIDE_SRCDIR),)
+$(2)_VERSION = custom
+endif
+
+ifndef $(2)_SOURCE
+ ifdef $(3)_SOURCE
+  $(2)_SOURCE = $($(3)_SOURCE)
+ else
+  $(2)_SOURCE			?= $$($(2)_BASE_NAME).tar.gz
+ endif
+endif
+
+ifndef $(2)_PATCH
+ ifdef $(3)_PATCH
+  $(2)_PATCH = $($(3)_PATCH)
+ endif
+endif
+
+ifndef $(2)_SITE
+ ifdef $(3)_SITE
+  $(2)_SITE = $($(3)_SITE)
+ else
+  $(2)_SITE			?= \
+	http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/$(1)
+ endif
+endif
+
+ifndef $(2)_SITE_METHOD
+ ifdef $(3)_SITE_METHOD
+  $(2)_SITE_METHOD = $($(3)_SITE_METHOD)
+ else
+	# Try automatic detection using the scheme part of the URI
+	$(2)_SITE_METHOD = $(firstword $(subst ://, ,$(call qstrip,$($(2)_SITE))))
+ endif
+endif
+
+ifeq ($$($(2)_SITE_METHOD),local)
+ifeq ($$($(2)_OVERRIDE_SRCDIR),)
+$(2)_OVERRIDE_SRCDIR = $($(2)_SITE)
+endif
+endif
+
+$(2)_DEPENDENCIES ?= $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES)))
+
+$(2)_INSTALL_STAGING		?= NO
+$(2)_INSTALL_IMAGES		?= NO
+$(2)_INSTALL_TARGET		?= YES
+$(2)_DIR_PREFIX			= $(if $(4),$(4),$(TOP_SRCDIR)/package)
+
+# define sub-target stamps
+$(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
+$(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
+$(2)_TARGET_INSTALL_IMAGES =	$$($(2)_DIR)/.stamp_images_installed
+$(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
+$(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
+$(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
+$(2)_TARGET_RSYNC =	        $$($(2)_DIR)/.stamp_rsynced
+$(2)_TARGET_RSYNC_SOURCE =      $$($(2)_DIR)/.stamp_rsync_sourced
+$(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
+$(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
+$(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
+$(2)_TARGET_UNINSTALL =		$$($(2)_DIR)/.stamp_uninstalled
+$(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
+$(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
+
+# default extract command
+$(2)_EXTRACT_CMDS ?= \
+	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $(DL_DIR)/$$($(2)_SOURCE) | \
+	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)
+
+# post-steps hooks
+$(2)_POST_DOWNLOAD_HOOKS        ?=
+$(2)_POST_EXTRACT_HOOKS         ?=
+$(2)_PRE_PATCH_HOOKS            ?=
+$(2)_POST_PATCH_HOOKS           ?=
+$(2)_PRE_CONFIGURE_HOOKS        ?=
+$(2)_POST_CONFIGURE_HOOKS       ?=
+$(2)_POST_BUILD_HOOKS           ?=
+$(2)_POST_INSTALL_HOOKS         ?=
+$(2)_POST_INSTALL_STAGING_HOOKS ?=
+$(2)_POST_INSTALL_TARGET_HOOKS  ?=
+$(2)_POST_INSTALL_IMAGES_HOOKS  ?=
+
+# human-friendly targets and target sequencing
+$(1):			$(1)-install
+
+ifeq ($$($(2)_TYPE),host)
+$(1)-install:	        $(1)-install-host
+else
+$(1)-install:		$(1)-install-staging $(1)-install-target $(1)-install-images
+endif
+
+ifeq ($$($(2)_INSTALL_TARGET),YES)
+$(1)-install-target:	$(1)-build \
+			$$($(2)_TARGET_INSTALL_TARGET)
+else
+$(1)-install-target:
+endif
+
+ifeq ($$($(2)_INSTALL_STAGING),YES)
+$(1)-install-staging:	$(1)-build \
+			$$($(2)_TARGET_INSTALL_STAGING)
+else
+$(1)-install-staging:
+endif
+
+ifeq ($$($(2)_INSTALL_IMAGES),YES)
+$(1)-install-images:	$(1)-build \
+			$$($(2)_TARGET_INSTALL_IMAGES)
+else
+$(1)-install-images:
+endif
+
+$(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
+
+$(1)-build:		$(1)-configure \
+			$$($(2)_TARGET_BUILD)
+
+ifeq ($$($(2)_OVERRIDE_SRCDIR),)
+# In the normal case (no package override), the sequence of steps is
+#  source, by downloading
+#  depends
+#  extract
+#  patch
+#  configure
+$(1)-configure:		$(1)-patch $(1)-depends \
+			$$($(2)_TARGET_CONFIGURE)
+
+$(1)-patch:		$(1)-extract $$($(2)_TARGET_PATCH)
+
+$(1)-extract:		$(1)-source \
+			$$($(2)_TARGET_EXTRACT)
+
+$(1)-depends:		$$($(2)_DEPENDENCIES)
+
+$(1)-source:		$$($(2)_TARGET_SOURCE)
+else
+# In the package override case, the sequence of steps
+#  source, by rsyncing
+#  depends
+#  configure
+$(1)-configure:		$(1)-depends \
+			$$($(2)_TARGET_CONFIGURE)
+
+$(1)-depends:		$(1)-rsync $$($(2)_DEPENDENCIES)
+
+$(1)-rsync:		$$($(2)_TARGET_RSYNC)
+
+$(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
+endif
+
+$(1)-show-depends:
+			@echo $$($(2)_DEPENDENCIES)
+
+$(1)-uninstall:		$(1)-configure $$($(2)_TARGET_UNINSTALL)
+
+$(1)-clean:		$(1)-uninstall \
+			$$($(2)_TARGET_CLEAN)
+
+$(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
+
+$(1)-clean-for-rebuild:
+ifneq ($$($(2)_OVERRIDE_SRCDIR),)
+			rm -f $$($(2)_TARGET_RSYNC)
+endif
+			rm -f $$($(2)_TARGET_BUILD)
+			rm -f $$($(2)_TARGET_INSTALL_STAGING)
+			rm -f $$($(2)_TARGET_INSTALL_TARGET)
+			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
+			rm -f $$($(2)_TARGET_INSTALL_HOST)
+
+$(1)-rebuild:		$(1)-clean-for-rebuild all
+
+$(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
+			rm -f $$($(2)_TARGET_CONFIGURE)
+
+$(1)-reconfigure:	$(1)-clean-for-reconfigure all
+
+# define the PKG variable for all targets, containing the
+# uppercase package variable prefix
+$$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
+$$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
+$$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
+$$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
+$$($(2)_TARGET_BUILD):			PKG=$(2)
+$$($(2)_TARGET_CONFIGURE):		PKG=$(2)
+$$($(2)_TARGET_RSYNC):                  SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
+$$($(2)_TARGET_RSYNC):                  PKG=$(2)
+$$($(2)_TARGET_RSYNC_SOURCE):		SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
+$$($(2)_TARGET_RSYNC_SOURCE):		PKG=$(2)
+$$($(2)_TARGET_PATCH):			PKG=$(2)
+$$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
+$$($(2)_TARGET_EXTRACT):		PKG=$(2)
+$$($(2)_TARGET_SOURCE):			PKG=$(2)
+$$($(2)_TARGET_UNINSTALL):		PKG=$(2)
+$$($(2)_TARGET_CLEAN):			PKG=$(2)
+$$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
+
+# Compute the name of the Kconfig option that correspond to the
+# package being enabled. We handle three cases: the special Linux
+# kernel case, the bootloaders case, and the normal packages case.
+ifeq ($(1),linux)
+$(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
+else ifeq ($(4),boot/)
+$(2)_KCONFIG_VAR = BR2_TARGET_$(2)
+else
+$(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
+endif
+
+# add package to the general list of targets if requested by the buildroot
+# configuration
+ifeq ($$($$($(2)_KCONFIG_VAR)),y)
+
+TARGETS += $(1)
+PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
+PACKAGES_DEVICES_TABLE += $$($(2)_DEVICES)$$(sep)
+
+ifeq ($$($(2)_SITE_METHOD),svn)
+DL_TOOLS_DEPENDENCIES += svn
+else ifeq ($$($(2)_SITE_METHOD),git)
+DL_TOOLS_DEPENDENCIES += git
+else ifeq ($$($(2)_SITE_METHOD),bzr)
+DL_TOOLS_DEPENDENCIES += bzr
+else ifeq ($$($(2)_SITE_METHOD),scp)
+DL_TOOLS_DEPENDENCIES += scp ssh
+else ifeq ($$($(2)_SITE_METHOD),hg)
+DL_TOOLS_DEPENDENCIES += hg
+endif # SITE_METHOD
+
+DL_TOOLS_DEPENDENCIES += $(firstword $(INFLATE$(suffix $($(2)_SOURCE))))
+
+endif # $(2)_KCONFIG_VAR
+endef # inner-generic-package
+
+################################################################################
+# generic-package -- the target generator macro for generic packages
+################################################################################
+
+# In the case of target packages, keep the package name "pkg"
+generic-package = $(call inner-generic-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+# In the case of host packages, turn the package name "pkg" into "host-pkg"
+host-generic-package = $(call inner-generic-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+
+# :mode=makefile:
-- 
tg: (91bca58..) t/gentargets-rename (depends on: t/gentargets_nohost_mk)
