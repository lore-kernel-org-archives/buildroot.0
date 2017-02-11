From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 11 Feb 2017 14:50:36 +0100
Subject: [Buildroot] [PATCH v3] gtest/gmock: bump to version 1.8.0
In-Reply-To: <d1de7bdeff46897e58c8737f6a0c646aff1571b6.1486812639.git.casantos@datacom.ind.br>
References: <1473290219-27701-1-git-send-email-casantos@datacom.ind.br>
 <d1de7bdeff46897e58c8737f6a0c646aff1571b6.1486812639.git.casantos@datacom.ind.br>
Message-ID: <834158db-5881-a7bc-3fd4-8ba7b9430fa5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

Thanks for this new version, I hope it will merged soon.

Le 11/02/2017 ? 12:32, Carlos Santos a ?crit :
> GTest version 1.8.0 includes gmock so merge both packages inside gtest
> 
> In this merge:
> 
> - Add gmock as a suboption of gtest (BR2_PACKAGE_GTEST_GMOCK)
>   following advice from Arnout Vandecappelle
> - Add BR2_PACKAGE_GMOCK as a legacy entry, selecting BR2_PACKAGE_GTEST
>   and BR2_PACKAGE_GTEST_GMOCK.
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
> - Remove the gmock entry from DEVELOPERS
> 
> Notice that any external package that depends on gmock will cause an
> immediate build termination because make doesn't know how to build
> gmock. Since the user has just removed gmock from the legacy menu, it
> should be quite obvious what needs to be done.
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
> Version history:
> 
> v1 (Fabrice Fontaine)
>   - Add gmock as a suboption
>   - Use cmake to install
>   - Remove patch on Python
>   - Add the correct license
>   - Fix URL of gtest project
> 
> v1->v2 (Carlos Santos)
>   - Add gmock a virtual package (yeah, yeah, big mistake)
> 
> v2->v3 (Carlos Santos)
>   - Got rid of the gmock virtual package (yeah, BIG mistake)
>   - Use $(PYTHON3_VERSION_MAJOR) to choose the Python version
>   - Several fixes, as suggested by Arnout Vandecappelle
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  Config.in.legacy                           |  7 ++++
>  DEVELOPERS                                 |  1 -
>  package/Config.in                          |  1 -
>  package/gmock/0001-force-use-python2.patch | 20 ----------
>  package/gmock/Config.in                    | 32 ---------------
>  package/gmock/gmock.hash                   |  2 -
>  package/gmock/gmock.mk                     | 64 ------------------------------
>  package/gtest/Config.in                    | 29 +++++++++++++-
>  package/{gmock => gtest}/gmock.pc          |  2 +-
>  package/gtest/gtest.hash                   |  2 +-
>  package/gtest/gtest.mk                     | 59 ++++++++++++++++++++++-----
>  package/gtest/gtest.pc                     |  2 +-
>  12 files changed, 87 insertions(+), 134 deletions(-)
>  delete mode 100644 package/gmock/0001-force-use-python2.patch
>  delete mode 100644 package/gmock/Config.in
>  delete mode 100644 package/gmock/gmock.hash
>  delete mode 100644 package/gmock/gmock.mk
>  rename package/{gmock => gtest}/gmock.pc (93%)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 20445b8..23184e8 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,13 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2017.02"
>  
> +config BR2_PACKAGE_GMOCK
> +	bool "gmock removed"
> +	select BR2_PACKAGE_GTEST
> +	select BR2_PACKAGE_GTEST_GMOCK

missing select BR2_LEGACY

> +	help
> +	  GMock is now a suboption of GTest
> +
>  config BR2_PACKAGE_PERL_DB_FILE
>  	bool "perl-db-file removed"
>  	select BR2_LEGACY
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 94f6804..5ff6223 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -286,7 +286,6 @@ N:	Carlo Caione <carlo.caione@gmail.com>
>  F:	package/sunxi-boards/
>  
>  N:	Carlos Santos <casantos@datacom.ind.br>
> -F:	package/gmock/
>  F:	package/gtest/
>  F:	package/libpam-radius-auth/
>  F:	package/libpam-tacplus/
> diff --git a/package/Config.in b/package/Config.in
> index deff0fe..70e3fff 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1325,7 +1325,6 @@ menu "Other"
>  	source "package/gflags/Config.in"
>  	source "package/glibmm/Config.in"
>  	source "package/glm/Config.in"
> -	source "package/gmock/Config.in"
>  	source "package/gmp/Config.in"
>  	source "package/gsl/Config.in"
>  	source "package/gtest/Config.in"

[...]

> diff --git a/package/gtest/Config.in b/package/gtest/Config.in
> index 355b736..9f514da 100644
> --- a/package/gtest/Config.in
> +++ b/package/gtest/Config.in
> @@ -21,6 +21,33 @@ config BR2_PACKAGE_GTEST
>  
>  	  https://github.com/google/googletest
>  
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

"The help text should be wrapped to fit 72 columns." see [1]

Note: one Tab count as 8 characters.

[1] http://nightly.buildroot.org/#writing-rules-config-in

> +
> +endif # BR2_PACKAGE_GTEST
> +
>  comment "gtest needs a toolchain w/ C++, wchar, threads"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_INSTALL_LIBSTDCPP
> diff --git a/package/gmock/gmock.pc b/package/gtest/gmock.pc
> similarity index 93%
> rename from package/gmock/gmock.pc
> rename to package/gtest/gmock.pc
> index 2f90068..4c72354 100644
> --- a/package/gmock/gmock.pc
> +++ b/package/gtest/gmock.pc
> @@ -5,7 +5,7 @@ includedir=${prefix}/include
>  
>  Name: gmock
>  Description: Google C++ Mocking Framework
> -Version: 1.7.0
> +Version: 1.8.0
>  Libs: -L${libdir} -lgmock
>  Libs.private: -lpthread
>  Cflags: -I${includedir}
> diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
> index 79e31e4..854ace8 100644
> --- a/package/gtest/gtest.hash
> +++ b/package/gtest/gtest.hash
> @@ -1,2 +1,2 @@
>  # Locally computed:
> -sha256	f73a6546fdf9fce9ff93a5015e0333a8af3062a152a9ad6bcb772c96687016cc	gtest-release-1.7.0.tar.gz
> +sha256	58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8	gtest-1.8.0.tar.gz
> diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
> index eb30905..fac1ab7 100644
> --- a/package/gtest/gtest.mk
> +++ b/package/gtest/gtest.mk
> @@ -4,13 +4,30 @@
>  #
>  ################################################################################
>  
> -# Make sure this remains the same version as the gmock one
> -GTEST_VERSION = release-1.7.0
> -GTEST_SITE = $(call github,google,googletest,$(GTEST_VERSION))
> +GTEST_VERSION = 1.8.0
> +GTEST_VERSION_TAG = release-$(GTEST_VERSION)

Why are you adding GTEST_VERSION_TAG ?
It seems ok to use "GTEST_VERSION = release-1.8.0" no ?

> +GTEST_SITE = $(call github,google,googletest,$(GTEST_VERSION_TAG))
>  GTEST_INSTALL_STAGING = YES
>  GTEST_INSTALL_TARGET = NO
>  GTEST_LICENSE = BSD-3c
> -GTEST_LICENSE_FILES = LICENSE
> +GTEST_LICENSE_FILES = googletest/LICENSE
> +
> +ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
> +GTEST_DEPENDENCIES = host-gtest
> +endif
> +
> +HOST_GTEST_LICENSE = Apache-2.0
> +HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +HOST_GTEST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
> +HOST_GTEST_DEPENDENCIES = host-python3
> +else
> +HOST_GTEST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
> +HOST_GTEST_DEPENDENCIES = host-python
> +endif
> +
> +HOST_GTEST_GMOCK_PYTHONPATH = \
> +        $(HOST_DIR)/usr/lib/python$(HOST_GTEST_PYTHON_VERSION)/site-packages

Indent with one Tab.

>  
>  # While it is possible to build gtest as shared library, using this gtest shared
>  # library requires to set some special configure option in the project using
> @@ -21,11 +38,12 @@ GTEST_LICENSE_FILES = LICENSE
>  # the gtest sources.
>  GTEST_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
>  
> -define GTEST_INSTALL_STAGING_CMDS
> -	$(INSTALL) -D -m 0755 $(@D)/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
> -	$(INSTALL) -D -m 0755 $(@D)/libgtest_main.a $(STAGING_DIR)/usr/lib/libgtest_main.a
> -	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/
> -	cp -rp $(@D)/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
> +# By default, build gmock and gtest
> +ifneq ($(BR2_PACKAGE_GTEST_GMOCK),y)

Try using the "positive" logic:
ifeq ($(BR2_PACKAGE_GTEST_GMOCK),)

> +GTEST_CONF_OPTS = -DBUILD_GTEST=ON -DBUILD_GMOCK=OFF
> +endif
> +
> +define GTEST_INSTALL_MISSING_FILES
>  	$(INSTALL) -D -m 0644 package/gtest/gtest.pc \
>  		$(STAGING_DIR)/usr/lib/pkgconfig/gtest.pc
>  	# Generate the gtest-config script manually, since the CMake
> @@ -39,9 +57,30 @@ define GTEST_INSTALL_STAGING_CMDS
>  		s%@bindir@%$(STAGING_DIR)/usr/bin%;\
>  		s%@PTHREAD_CFLAGS@%%;\
>  		s%@PTHREAD_LIBS@%-lpthread%;' \
> -		$(@D)/scripts/gtest-config.in \
> +		$(@D)/googletest/scripts/gtest-config.in \
>  		> $(STAGING_DIR)/usr/bin/gtest-config
>  	chmod +x $(STAGING_DIR)/usr/bin/gtest-config
>  endef
>  
> +define GTEST_GMOCK_INSTALL_MISSING_FILE
> +	$(INSTALL) -D -m 0755 package/gtest/gmock.pc \

Use -m 0644, we don't need gmock.pc to be executable.

> +		$(STAGING_DIR)/usr/lib/pkgconfig/gmock.pc
> +endef
> +
> +GTEST_POST_INSTALL_STAGING_HOOKS += GTEST_INSTALL_MISSING_FILES
> +ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
> +GTEST_POST_INSTALL_STAGING_HOOKS += GTEST_GMOCK_INSTALL_MISSING_FILE
> +endif
> +
> +define HOST_GTEST_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \

Same for gmock_gen.py.

Otherwise:
  Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> +		$(HOST_DIR)/usr/bin/gmock_gen.py
> +	ln -sf gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen
> +	cp -rp $(@D)/googlemock/scripts/generator/cpp \
> +		$(HOST_GTEST_GMOCK_PYTHONPATH)
> +endef
> +
>  $(eval $(cmake-package))
> +# The host package does not build anything, just installs gmock_gen stuff, so
> +# it does not need to be a host-cmake-package.
> +$(eval $(host-generic-package))
> diff --git a/package/gtest/gtest.pc b/package/gtest/gtest.pc
> index b7a8aa4..594e79d 100644
> --- a/package/gtest/gtest.pc
> +++ b/package/gtest/gtest.pc
> @@ -5,7 +5,7 @@ includedir=${prefix}/include
>  
>  Name: gtest
>  Description: Google C++ Testing Framework
> -Version: 1.7.0
> +Version: 1.8.0
>  Libs: -L${libdir} -lgtest
>  Libs.private: -lpthread
>  Cflags: -I${includedir}
> 
