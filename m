From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 7 Sep 2016 12:19:31 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/1] gtest: bump to version 1.8.0
In-Reply-To: <1473259185-23987-1-git-send-email-fabrice.fontaine@orange.com>
References: <1473259185-23987-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <488124409.3686806.1473261571007.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
> To: buildroot at buildroot.org
> Cc: "Fabrice Fontaine" <fabrice.fontaine@orange.com>
> Sent: Wednesday, September 7, 2016 11:39:45 AM
> Subject: [Buildroot] [PATCH 1/1] gtest: bump to version 1.8.0

> Version 1.8.0 now includes gmock so merge gmock package inside gtest
> In this merge:
> - Add gmock as a suboption of gtest (BR2_PACKAGE_GTEST_GMOCK)
>   following advice from Arnout Vandecappelle
> - Use cmake to install libraries and headers and add missing files
>   (gtest.pc, gtest-config, gmock.pc) in
>   GTEST_POST_INSTALL_STAGING_HOOKS instead of redefining
>   GTEST_INSTALL_STAGING_CMDS
> - Remove patch on Python as gmock/gtest now supports python 3.0
>   (commit 456fc2b5c4e9ebf05a5987dfe1ff0ac9ffeb53cc)
> - Add the correct license in HOST_GTEST_LICENSE as all python code in
>   googlemock/scripts/generator is licensed under Apache-2.0 and not
>   BSD-3c
> - Fix URL of gtest project in Config.in
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
> package/Config.in                          |  1 -
> package/gmock/0001-force-use-python2.patch | 20 ----------
> package/gmock/Config.in                    | 32 ---------------
> package/gmock/gmock.hash                   |  2 -
> package/gmock/gmock.mk                     | 64 ------------------------------
> package/gtest/Config.in                    | 31 ++++++++++++++-
> package/{gmock => gtest}/gmock.pc          |  2 +-
> package/gtest/gtest.hash                   |  2 +-
> package/gtest/gtest.mk                     | 52 +++++++++++++++++++-----
> package/gtest/gtest.pc                     |  2 +-
> 10 files changed, 75 insertions(+), 133 deletions(-)
> delete mode 100644 package/gmock/0001-force-use-python2.patch
> delete mode 100644 package/gmock/Config.in
> delete mode 100644 package/gmock/gmock.hash
> delete mode 100644 package/gmock/gmock.mk
> rename package/{gmock => gtest}/gmock.pc (93%)
> 
> diff --git a/package/Config.in b/package/Config.in
> index add6052..a70aaca 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1269,7 +1269,6 @@ menu "Other"
> 	source "package/gflags/Config.in"
> 	source "package/glibmm/Config.in"
> 	source "package/glm/Config.in"
> -	source "package/gmock/Config.in"
> 	source "package/gmp/Config.in"
> 	source "package/gsl/Config.in"
> 	source "package/gtest/Config.in"
> diff --git a/package/gmock/0001-force-use-python2.patch
> b/package/gmock/0001-force-use-python2.patch
> deleted file mode 100644
> index 5dcb231..0000000
> --- a/package/gmock/0001-force-use-python2.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Force use of Python 2 even when Python 3 is the default Python interpreter.
> -
> -Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> -
> ---- ./gtest/scripts/fuse_gtest_files.py.orig	2013-09-18 14:48:30.000000000
> -0300
> -+++ ./gtest/scripts/fuse_gtest_files.py	2015-07-22 15:42:53.291591205 -0300
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python2
> - #
> - # Copyright 2009, Google Inc.
> - # All rights reserved.
> ---- ./scripts/generator/gmock_gen.py.orig	2013-09-18 14:50:15.000000000 -0300
> -+++ ./scripts/generator/gmock_gen.py	2015-07-22 17:06:51.071815634 -0300
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python2
> - #
> - # Copyright 2008 Google Inc. All Rights Reserved.
> - #
> diff --git a/package/gmock/Config.in b/package/gmock/Config.in
> deleted file mode 100644
> index ec3eb92..0000000
> --- a/package/gmock/Config.in
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -config BR2_PACKAGE_GMOCK
> -	bool "gmock"
> -	select BR2_PACKAGE_GTEST
> -	depends on BR2_USE_WCHAR
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_USE_MMU # fork()
> -	help
> -	  Inspired by jMock, EasyMock, and Hamcrest, and designed with C++'s
> -	  specifics in mind, Google C++ Mocking Framework (or Google Mock for
> -	  short) is a library for writing and using C++ mock classes.
> -
> -	  Google Mock:
> -
> -	    * lets you create mock classes trivially using simple macros,
> -	    * supports a rich set of matchers and actions,
> -	    * handles unordered, partially ordered, or completely ordered
> -	      expectations,
> -	    * is extensible by users, and
> -	    * works on Linux, Mac OS X, Windows, Windows Mobile, minGW, and
> -	      Symbian.
> -
> -	    http://code.google.com/p/googlemock/
> -
> -	  There are both host and target packages. The target one has include
> -	  files required to compile the tests and the static libraries required
> -	  to link/run them. The host package installs gmock_gen, a Python script
> -	  used to generate code mocks.
> -
> -comment "gmock needs a toolchain w/ C++, wchar, threads"
> -	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS ||
> !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/gmock/gmock.hash b/package/gmock/gmock.hash
> deleted file mode 100644
> index 2b71739..0000000
> --- a/package/gmock/gmock.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Locally computed
> -sha256 26fcbb5925b74ad5fc8c26b0495dfc96353f4d553492eb97e85a8a6d2f43095b
> gmock-1.7.0.zip
> diff --git a/package/gmock/gmock.mk b/package/gmock/gmock.mk
> deleted file mode 100644
> index 4f04422..0000000
> --- a/package/gmock/gmock.mk
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -################################################################################
> -#
> -# gmock
> -#
> -################################################################################
> -
> -# Make sure this remains the same version as the gtest one
> -GMOCK_VERSION = 1.7.0
> -GMOCK_SOURCE = gmock-$(GMOCK_VERSION).zip
> -GMOCK_SITE = http://googlemock.googlecode.com/files
> -GMOCK_INSTALL_STAGING = YES
> -GMOCK_INSTALL_TARGET = NO
> -GMOCK_LICENSE = BSD-3c
> -GMOCK_LICENSE_FILES = LICENSE
> -GMOCK_DEPENDENCIES = gtest host-gmock
> -
> -# GMock 1.7.0 relies on Python 2.7 syntax which is NOT compatible with Python3.
> -HOST_GMOCK_DEPENDENCIES = host-python
> -HOST_GMOCK_PYTHONPATH=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
> -
> -# Static linking is required in order to keep the GMock package completely
> -# separated from GTest. According to GMock's README file:
> -#
> -#   "Google Mock can be used as a DLL, but the same DLL must contain Google
> -#    Test as well.  See Google Test's README file for instructions on how to
> -#    set up necessary compiler settings".
> -GMOCK_CONF_OPTS = --enable-static --disable-shared
> -
> -define GMOCK_EXTRACT_CMDS
> -	$(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(BUILD_DIR)
> -endef
> -
> -# We can't use the default rule for autotools-package staging because it fails
> -# because it tries to rebuild/install gtest stuff and fails after this error:
> -#    "'make install' is dangerous and not supported. Instead, see README for
> -#      how to integrate Google Test into your build system."
> -define GMOCK_INSTALL_STAGING_CMDS
> -	$(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock.a
> $(STAGING_DIR)/usr/lib/libgmock.a
> -	$(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock_main.a
> $(STAGING_DIR)/usr/lib/libgmock_main.a
> -	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gmock/
> -	cp -rp $(@D)/include/gmock/* $(STAGING_DIR)/usr/include/gmock/
> -	$(INSTALL) -D -m 0755 package/gmock/gmock.pc \
> -		$(STAGING_DIR)/usr/lib/pkgconfig/gmock.pc
> -endef
> -
> -# Unzipping inside $(@D) and moving everything from the created subdirectory is
> -# required because unzipping directly in $(BUILD_DIR) would cause host-gmock to
> -# overwrite the gmock subdir instead of unzipping in a host-gmock subdir.
> -define HOST_GMOCK_EXTRACT_CMDS
> -	$(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(@D)
> -	mv $(@D)/gmock-$(GMOCK_VERSION)/* $(@D)
> -	rmdir $(@D)/gmock-$(GMOCK_VERSION)
> -endef
> -
> -define HOST_GMOCK_INSTALL_CMDS
> -	$(INSTALL) -D -m 0755 $(@D)/scripts/generator/gmock_gen.py
> $(HOST_DIR)/usr/bin/gmock_gen.py
> -	ln -sf gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen
> -	cp -rp $(@D)/scripts/generator/cpp $(HOST_GMOCK_PYTHONPATH)
> -endef
> -
> -$(eval $(autotools-package))
> -# The host package does not build anything, just installs gmock_gen stuff, so
> -# it does not need to be a host-autotools-package.
> -$(eval $(host-generic-package))
> diff --git a/package/gtest/Config.in b/package/gtest/Config.in
> index c07f13b..9f514da 100644
> --- a/package/gtest/Config.in
> +++ b/package/gtest/Config.in
> @@ -19,8 +19,35 @@ config BR2_PACKAGE_GTEST
> 	  This package allows running testsuites on the target which
> 	  might be advantageous in certain cases.
> 
> -	  http://code.google.com/p/googletest/
> +	  https://github.com/google/googletest
> +
> +if BR2_PACKAGE_GTEST
> +
> +config BR2_PACKAGE_GTEST_GMOCK
> +	bool "gmock"
> +	help
> +	  Inspired by jMock, EasyMock, and Hamcrest, and designed with C++'s
> +	  specifics in mind, Google C++ Mocking Framework (or Google Mock for
> +	  short) is a library for writing and using C++ mock classes.
> +
> +	  Google Mock:
> +
> +	    * lets you create mock classes trivially using simple macros,
> +	    * supports a rich set of matchers and actions,
> +	    * handles unordered, partially ordered, or completely ordered
> +	      expectations,
> +	    * is extensible by users, and
> +	    * works on Linux, Mac OS X, Windows, Windows Mobile, minGW, and
> +	      Symbian.
> +
> +	  There are both host and target packages. The target one has include
> +	  files required to compile the tests and the static libraries required
> +	  to link/run them. The host package installs gmock_gen, a Python script
> +	  used to generate code mocks.
> +
> +endif # BR2_PACKAGE_GTEST

Here you are removing the "gmock" package and replacing it by an option that resembles a package. This breaks the build of any package declaring "gmock" in its dependency list because there is no such package. I think I have a solution for this problem but I will need some time to work on it this afternoon.

Carlos Santos (Casantos)
DATACOM, P&D
