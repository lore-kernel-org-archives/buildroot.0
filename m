From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Sep 2013 17:34:26 +0200
Subject: [Buildroot] [PATCH] Add pyside + shiboken packages
In-Reply-To: <523ACBFA.2070401@wanadoo.fr>
References: <523ACBFA.2070401@wanadoo.fr>
Message-ID: <20130919173426.47c2bba8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

Thanks for this contribution!

On Thu, 19 Sep 2013 12:03:38 +0200, Thierry Bultel wrote:
> Signed-off-by: Thierry Bultel <thierry.bultel@wanadoo.fr>
> ---
> Adds support for pyside, pyside-tools and shiboken
> Shiboken is also built for the host, else the target version
> would need a configured qemu + binfmt_misc to run
> the generator.

Thanks. This should be three patches, one per package. Also, your patch
is badly line-wrapped, so it's hard to review, and impossible to apply.
Can you either fix your mailer, or even better, use 'git send-email' to
send your patches?

> ---
> diff --git a/package/Config.in b/package/Config.in
> index 779e9da..c1927dc 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -399,6 +399,9 @@ source "package/python-pyro/Config.in"
>   source "package/python-pyzmq/Config.in"
>   source "package/python-serial/Config.in"
>   source "package/python-setuptools/Config.in"
> +source "package/shiboken/Config.in"
> +source "package/pyside/Config.in"
> +source "package/pyside-tools/Config.in"
>   source "package/python-thrift/Config.in"
>   endmenu
>   endif
> diff --git a/package/pyside-tools/Config.in 
> b/package/pyside-tools/Config.in
> new file mode 100644
> index 0000000..2e5d8d2
> --- /dev/null
> +++ b/package/pyside-tools/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_PYSIDE_TOOLS
> +        bool "pyside-tools"
> +    depends on BR2_PACKAGE_PYSIDE
> +        help
> +          PySide tools

The indentation is completely funky, throughout the patch. Also, the
description should be better than that, and should include the
upstream URL of the project. Please see
http://buildroot.org/downloads/manual/manual.html#writing-rules-config-in.

> diff --git a/package/pyside-tools/pyside-tools.mk 
> b/package/pyside-tools/pyside-tools.mk
> new file mode 100644
> index 0000000..0b696dc
> --- /dev/null
> +++ b/package/pyside-tools/pyside-tools.mk
> @@ -0,0 +1,62 @@
> +############################
> +#
> +#    pyside-tools
> +#
> +#############################

See http://buildroot.org/downloads/manual/manual.html#writing-rules-mk
for the right format of the header.

> +PYSIDE_TOOLS_VERSION=0.2.15
> +PYSIDE_TOOLS_SITE=https://github.com/PySide/Tools/archive/
> +PYSIDE_TOOLS_SOURCE=$(PYSIDE_TOOLS_VERSION).tar.gz
> +PYSIDE_TOOLS_INSTALL_STAGING=YES
> +PYSIDE_TOOLS_DEPENDENCIES=pyside

Spaces around '=' (to be fixed globally).

> +PYSIDESANDBOXPATH=$(STAGING_DIR)

Why not use STAGING_DIR directly? It's actually shorter than your new
variable.

> +
> +PYSIDE_TOOLS_CONF_OPT+=-DCMAKE_INSTALL_PREFIX=$(PYSIDESANDBOXPATH)
> +PYSIDE_TOOLS_CONF_OPT+=-DENABLE_ICECC=0

You're using generic-package, but you should be using cmake-package.
And if you use cmake-package, then the CMAKE_INSTALL_PREFIX is already
passed.

> +
> +PYSIDE_TOOLS_CONF_ENV+=PYTHONPATH=$(PYSIDESANDBOXPATH)/lib/python2.6/site-packages:$$PYTHONPATH 
> 
> +PYSIDE_TOOLS_CONF_ENV+=LD_LIBRARY_PATH=$(PYSIDESANDBOXPATH)/lib:$$LD_LIBRARY_PATH 
> 
> +PYSIDE_TOOLS_CONF_ENV+=PKG_CONFIG_PATH=$(PYSIDESANDBOXPATH)/lib/pkgconfig:$$PKG_CONFIG_PATH 

None of those variables are needed. They are already part of the
environment if you use cmake-package.

> 
> +
> +#PYSIDE_MAKE_ENV+=VERBOSE=1

To be removed.

> +PYSIDE_TOOLS_CMAKE_INSTALL_CMAKE=            \
> +cmake_install.cmake                    \
> +tests/cmake_install.cmake                \
> +tests/rcc/cmake_install.cmake                \
> +pyrcc/cmake_install.cmake                \
> +pylupdate/cmake_install.cmake

Ok, but it looks ugly, please fix it as below:

PYSIDE_TOOLS_CMAKE_INSTALL_CMAKE = \
	cmake_install.cmake \
	test/cmake_install.cmake \
	tests/rcc/cmake_install.cmake \
	...

Generally, how your backslashes are placed is not really nice. You
should try to follow the style used in other packages.

> +
> +define PYSIDE_TOOLS_CONFIGURE_CMDS
> +    (                                        \
> +    cd $(@D) &&                                     \
> +    mkdir -p build && cd build &&             \
> +    rm -f CMakeCache.txt &&                             \
> +    $(PYSIDE_TOOLS_CONF_ENV) $(HOST_DIR)/usr/bin/cmake .. \
> + 
> -DCMAKE_TOOLCHAIN_FILE="$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" 
>      \
> +    -DCMAKE_INSTALL_PREFIX="/usr"                             \
> +    $(PYSIDE_TOOLS_CONF_OPT)                             \
> +    )
> +endef

This is already done by the CMake package infrastructure, so it can be
removed completely. Please read
http://buildroot.org/downloads/manual/manual.html#_infrastructure_for_cmake_based_packages.

> +define PYSIDE_TOOLS_BUILD_CMDS
> +    $(TARGET_MAKE_ENV) $(PYSIDE_TOOLS_MAKE_ENV) $(MAKE) 
> $(PYSIDE_TOOLS_MAKE_OPT) -C $(@D)/build
> +endef

Same thing.

> +
> +
> +define PYSIDE_TOOLS_INSTALL_STAGING_CMDS
> +    (                                                \
> +    cd  $(@D)/build &&     \
> +    for ins in $(PYSIDE_TOOLS_CMAKE_INSTALL_CMAKE); do             \
> +       cat $$ins | sed -e 's|sysroot|sysroot/usr|g' > $${ins}2 ;        
>              \
> +    done;                                                \
> +    sed -i -e 's/cmake_install.cmake/cmake_install.cmake2/g' 
> cmake_install.cmake2;            \
> +    sed -i -e 's/cmake_install.cmake/cmake_install.cmake2/g' 
> tests/cmake_install.cmake2;        \

Huh? What is happening here?

> +    $(HOST_DIR)/usr/bin/cmake -DCMAKE_INSTALL_PREFIX=$(STAGING_DIR)/usr 
> -P cmake_install.cmake2;    \

That's normally done by default by the cmake-package infrastructure.

> +    echo "pyside-tools staging install OK";         \

Don't display custom messages, Buildroot already has some before each
step of the package build process.

> +    )
> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))

You're having a host variant of a generic-package, but there is no
definition of HOST_PYSIDE_BUILD_CMDS or HOST_PYSIDE_CONFIGURE_CMDS,
which means that your host variant cannot work.

> diff --git a/package/pyside/Config.in b/package/pyside/Config.in
> new file mode 100644
> index 0000000..61618b7
> --- /dev/null
> +++ b/package/pyside/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYSIDE
> +        bool "pyside"
> +    select BR2_PACKAGE_SHIBOKEN
> +    depends on BR2_PACKAGE_QT

In "pyside", I see "py", so I believe some Python dependency is most
likely needed somewhere.

> +        help
> +          PySide

Please fix the indentation, and add a proper description.

> diff --git a/package/pyside/pyside.mk b/package/pyside/pyside.mk
> new file mode 100644
> index 0000000..70c26b6
> --- /dev/null
> +++ b/package/pyside/pyside.mk
> @@ -0,0 +1,121 @@
> +############################
> +#
> +#    Pyside
> +#
> +#############################

Header to be fixed.

> +
> +PYSIDE_VERSION=1.2.1
> +PYSIDE_SITE=https://distfiles.macports.org/py-pyside
> +PYSIDE_SOURCE=pyside-qt4.8+$(PYSIDE_VERSION).tar.bz2
> +PYSIDE_INSTALL_STAGING=YES
> +PYSIDE_DEPENDENCIES=python qt shiboken host-cmake

Spaces around '='.

Ah, we have the python dependency now. It should also be in the
Config.in.

host-cmake dependency not needed: please convert your package to the
cmake-package infrastructure.

> +PYSIDESANDBOXPATH=$(STAGING_DIR)
> +
> +PYSIDE_CONF_OPT+=-DCMAKE_INSTALL_PREFIX=$(PYSIDESANDBOXPATH)
> +PYSIDE_CONF_OPT+=-DENABLE_ICECC=0
> +
> +PYSIDE_CONF_ENV+=PYTHONPATH=$(PYSIDESANDBOXPATH)/lib/python2.6/site-packages:$$PYTHONPATH 
> 
> +PYSIDE_CONF_ENV+=LD_LIBRARY_PATH=$(PYSIDESANDBOXPATH)/lib:$$LD_LIBRARY_PATH 
> 
> +PYSIDE_CONF_ENV+=PKG_CONFIG_PATH=$(PYSIDESANDBOXPATH)/lib/pkgconfig:$$PKG_CONFIG_PATH 
> 
> +
> +# Uncomment next line to attempt to understand something in what CMake 
> does
> +#PYSIDE_MAKE_ENV+=VERBOSE=1
> +
> +define PYSIDE_CONFIGURE_CMDS
> +    (                                        \
> +    cd $(@D) &&                                     \
> +    mkdir -p build && cd build &&             \
> +    rm -f CMakeCache.txt &&                             \
> +    $(PYSIDE_CONF_ENV) $(HOST_DIR)/usr/bin/cmake .. \
> + 
> -DCMAKE_TOOLCHAIN_FILE="$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" 
>      \
> +    -DCMAKE_INSTALL_PREFIX="/usr"                             \
> +    $(PYSIDE_CONF_OPT)                                 \
> +    )
> +endef
> +
> +
> +define PYSIDE_BUILD_CMDS
> +    $(TARGET_MAKE_ENV) $(PYSIDE_MAKE_ENV) $(MAKE) $(PYSIDE_MAKE_OPT) -C 
> $(@D)/build
> +endef
> +
> +PYSIDE_CMAKE_INSTALL_CMAKE=        \
> +libpyside/cmake_install.cmake         \
> +PySide/cmake_install.cmake        \
> +PySide/QtTest/cmake_install.cmake    \
> +PySide/QtCore/cmake_install.cmake    \
> +tests/cmake_install.cmake        \
> +tests/QtTest/cmake_install.cmake    \
> +tests/QtCore/cmake_install.cmake    \
> +tests/pysidetest/cmake_install.cmake    \
> +tests/signals/cmake_install.cmake
> +
> +ifneq ($(BR2_PACKAGE_QT_GUI_MODULE),)
> +PYSIDE_CMAKE_INSTALL_CMAKE+=PySide/QtGui/cmake_install.cmake
> +PYSIDE_CMAKE_INSTALL_CMAKE+=tests/QtGui/cmake_install.cmake
> +endif
> +
> +ifneq ($(BR2_PACKAGE_QT_NETWORK),)
> +PYSIDE_CMAKE_INSTALL_CMAKE+=PySide/QtNetwork/cmake_install.cmake
> +PYSIDE_CMAKE_INSTALL_CMAKE+=tests/QtNetwork/cmake_install.cmake
> +endif
> +
> +ifneq ($(BR2_PACKAGE_QT_OPENGL_ES),)
> +PYSIDE_CMAKE_INSTALL_CMAKE+=PySide/QtOpenGL/cmake_install.cmake
> +PYSIDE_CMAKE_INSTALL_CMAKE+=tests/QtOpenGL/cmake_install.cmake
> +endif
> +
> +ifneq ($(BR2_PACKAGE_QT_SQL_MODULE),)
> +PYSIDE_CMAKE_INSTALL_CMAKE+=PySide/QtSql/cmake_install.cmake
> +PYSIDE_CMAKE_INSTALL_CMAKE+=tests/QtSql/cmake_install.cmake
> +endif
> +
> +ifneq ($(BR2_PACKAGE_QT_SVG),)
> +PYSIDE_CMAKE_INSTALL_CMAKE+=PySide/QtSvg/cmake_install.cmake
> +PYSIDE_CMAKE_INSTALL_CMAKE+=tests/QtSvg/cmake_install.cmake
> +endif
> +
> +ifneq ($(BR2_PACKAGE_QT_XML),)
> +PYSIDE_CMAKE_INSTALL_CMAKE+=PySide/QtXml/cmake_install.cmake
> +PYSIDE_CMAKE_INSTALL_CMAKE+=tests/QtXml/cmake_install.cmake
> +endif
> +
> +ifneq ($(BR2_PACKAGE_QT_SCRIPT),)
> +PYSIDE_CMAKE_INSTALL_CMAKE+=PySide/QtScript/cmake_install.cmake
> +PYSIDE_CMAKE_INSTALL_CMAKE+=tests/QtScript/cmake_install.cmake
> +endif
> +
> +
> +define PYSIDE_INSTALL_TARGET_CMDS
> +    (                                                    \
> +    cd  $(@D)/build &&         \
> +    for ins in $(PYSIDE_CMAKE_INSTALL_CMAKE); do \
> +       cat $$ins | sed -e 's|$(STAGING_DIR)|$(TARGET_DIR)/usr|g' > 
> $${ins}2 ;                \
> +    done;                                                    \
> +    cat cmake_install.cmake | sed -e 
> 's/cmake_install.cmake/cmake_install.cmake2/g' > cmake_install.cmake2;    \
> +    sed -i -e 's/cmake_install.cmake/cmake_install.cmake2/g' 
> PySide/cmake_install.cmake2;            \
> +    sed -i -e 's/cmake_install.cmake/cmake_install.cmake2/g' 
> tests/cmake_install.cmake2;            \
> +    $(HOST_DIR)/usr/bin/cmake -DCMAKE_INSTALL_PREFIX=$(TARGET_DIR)/usr 
> -P cmake_install.cmake2;     \
> +    echo "PySide target OK"; \
> +    rm -rf $(TARGET_DIR)/include/PySide;         \
> +    )
> +endef
> +
> +
> +define PYSIDE_INSTALL_STAGING_CMDS
> +    (                                                    \
> +    cd  $(@D)/build &&         \
> +    echo "Replace $(STAGING_DIR) by $(STAGING_DIR)/usr";                 \
> +    for ins in $(PYSIDE_CMAKE_INSTALL_CMAKE); do \
> +       cat $$ins | sed -e 's|sysroot/lib|sysroot/usr/lib|g' > $${ins}2 
> ;                    \
> +    done;                                                    \
> +    sed -i -e 's|sysroot/lib|sysroot/usr/lib|g' 
> libpyside/PySideConfig.cmake;                \
> +    cat cmake_install.cmake | sed -e 
> 's/cmake_install.cmake/cmake_install.cmake2/g' > cmake_install.cmake2;    \
> +    sed -i -e 's/cmake_install.cmake/cmake_install.cmake2/g' 
> PySide/cmake_install.cmake2;            \
> +    sed -i -e 's/cmake_install.cmake/cmake_install.cmake2/g' 
> tests/cmake_install.cmake2;            \
> +    $(HOST_DIR)/usr/bin/cmake -DCMAKE_INSTALL_PREFIX=$(STAGING_DIR)/usr 
> -P cmake_install.cmake2;        \
> +    echo "PySide staging install OK";         \
> +    )
> +endef
> +
> +$(eval $(generic-package))

Same comments: please convert to cmake-package infrastructure first.

> diff --git a/package/python/Config.in b/package/python/Config.in
> index cfe73db..bebe36b 100644
> --- a/package/python/Config.in
> +++ b/package/python/Config.in
> @@ -22,9 +22,11 @@ choice
> 
>   config BR2_PACKAGE_PYTHON_PY_ONLY
>       bool ".py sources only"
> +    depends on !BR2_PACKAGE_PYSIDE
> 
>   config BR2_PACKAGE_PYTHON_PYC_ONLY
>       bool ".pyc compiled sources only"
> +    depends on !BR2_PACKAGE_PYSIDE

Why? This certainly needs more explanations, but it looks suspicious.

>   config BR2_PACKAGE_PYTHON_PY_PYC
>       bool ".py sources and .pyc compiled"
> diff --git a/package/shiboken/Config.in b/package/shiboken/Config.in
> new file mode 100644
> index 0000000..f13eb7c
> --- /dev/null
> +++ b/package/shiboken/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_SHIBOKEN
> +        bool "shiboken"
> +    select BR2_PACKAGE_QT_STL

shiboken is selected by pyside, but shiboken forgets to depends on Qt.
If you give us more details on exactly which package needs Qt, we can
probably help you to sort out how to express the dependencies.

> +        help
> +          Shiboken for PySide

Better description needed.

> diff --git a/package/shiboken/shiboken.mk b/package/shiboken/shiboken.mk
> new file mode 100644
> index 0000000..cfb87bb
> --- /dev/null
> +++ b/package/shiboken/shiboken.mk
> @@ -0,0 +1,115 @@
> +############################
> +#
> +#    Shiboken
> +#
> +#############################

Header to be fixed.

> +SHIBOKEN_VERSION=1.2.1
> +SHIBOKEN_SITE=https://distfiles.macports.org/py-shiboken
> +SHIBOKEN_SOURCE=shiboken-$(SHIBOKEN_VERSION).tar.bz2
> +SHIBOKEN_INSTALL_STAGING=YES
> +SHIBOKEN_DEPENDENCIES=python qt host-cmake host-shiboken
> +HOST_SHIBOKEN_DEPENDENCIES=

Spaces around '='. Not need for host-cmake, you should convert your
package to cmake-package.

> +
> +PYSIDESANDBOXPATH=$(STAGING_DIR)
> +
> +SHIBOKEN_CONF_OPT+=-DCMAKE_INSTALL_PREFIX=$(PYSIDESANDBOXPATH)
> +SHIBOKEN_CONF_OPT+=-DENABLE_ICECC=0
> +
> +SHIBOKEN_CONF_ENV+=PYTHONPATH=$(PYSIDESANDBOXPATH)/lib/python2.6/site-packages:$$PYTHONPATH 
> 
> +SHIBOKEN_CONF_ENV+=LD_LIBRARY_PATH=$(PYSIDESANDBOXPATH)/lib:$$LD_LIBRARY_PATH 
> 
> +SHIBOKEN_CONF_ENV+=PKG_CONFIG_PATH=$(PYSIDESANDBOXPATH)/lib/pkgconfig:$$PKG_CONFIG_PATH 
> 
> +
> +#SHIBOKEN_MAKE_ENV+=VERBOSE=1
> +
> +# HOST
> +
> +define HOST_SHIBOKEN_CONFIGURE_CMDS
> +    (                                        \
> +    cd $(@D) &&                                     \
> +    mkdir -p build && cd build &&             \
> +     $(HOST_DIR)/usr/bin/cmake ..                            \
> +    -DCMAKE_INSTALL_PREFIX="$(HOST_DIR)/usr"                    \
> +    )
> +endef
> +
> +define HOST_SHIBOKEN_BUILD_CMDS
> +    $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/build
> +endef
> +
> +define HOST_SHIBOKEN_INSTALL_CMDS
> +    $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/build install
> +    rm -rf $(HOST_DIR)/usr/lib/cmake/Shiboken*
> +endef
> +
> +# TARGET
> +SHIBOKEN_TESTS_CMAKE=                \
> +$(@D)/tests/samplebinding/CMakeLists.txt    \
> +$(@D)/tests/otherbinding/CMakeLists.txt        \
> +$(@D)/tests/minimalbinding/CMakeLists.txt
> +
> +define SHIBOKEN_PRE_CONFIGURE_GENERATOR_PATH
> +    sed -i  -e 
> 's|$${shibokengenerator_BINARY_DIR}/shiboken|$(HOST_DIR)/usr/bin/shiboken|g' 
>      \
> +        -e 's/Running generator/Running HOST generator/g' 
> $(@D)/shibokenmodule/CMakeLists.txt
> +    for cmakelist in $(SHIBOKEN_TESTS_CMAKE) ; do             \
> +        sed -i -e 's|COMMAND shiboken|COMMAND 
> $(HOST_DIR)/usr/bin/shiboken|g'            \
> +            -e 's/Running generator/Running HOST generator/g' 
> $$cmakelist;            \
> +    done;
> +endef
> +
> +SHIBOKEN_PRE_CONFIGURE_HOOKS+=SHIBOKEN_PRE_CONFIGURE_GENERATOR_PATH
> +
> +define SHIBOKEN_CONFIGURE_CMDS
> +    echo "HERE ! SHIBOKEN_CONFIGURE_CMDS"
> +    (                                        \
> +    cd $(@D) &&                                     \
> +    mkdir -p build && cd build &&             \
> +    rm -f CMakeCache.txt &&                             \
> +    $(SHIBOKEN_CONF_ENV) $(HOST_DIR)/usr/bin/cmake ..     \
> + 
> -DCMAKE_TOOLCHAIN_FILE="$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" 
>      \
> +    -DCMAKE_INSTALL_PREFIX="/usr"                             \
> +    $(SHIBOKEN_CONF_OPT)                                 \
> +    )
> +endef
> +
> +define SHIBOKEN_BUILD_CMDS
> +    $(TARGET_MAKE_ENV) $(SHIBOKEN_MAKE_ENV) $(MAKE) 
> $(SHIBOKEN_MAKE_OPT) -C $(@D)/build
> +endef
> +
> +SHIBOKEN_CMAKE_INSTALL_CMAKE=                \
> +data/cmake_install.cmake                \
> +doc/cmake_install.cmake                    \
> +generator/cmake_install.cmake                \
> +libshiboken/cmake_install.cmake                \
> +shibokenmodule/cmake_install.cmake             \
> +ApiExtractor/cmake_install.cmake            \
> +tests/cmake_install.cmake                \
> +
> +
> +SHIBOKEN_CMAKE_CONF=$(STAGING_DIR)/lib/cmake/Shiboken-1.2.1/ShibokenConfig-python2.7.cmake 
> 
> +
> +define SHIBOKEN_INSTALL_TARGET_CMDS
> +    (                                                        \
> +    cd  $(@D)/build &&             \
> +    for ins in $(SHIBOKEN_CMAKE_INSTALL_CMAKE); do                     \
> +       cat $$ins | sed -e 's|$(STAGING_DIR)|$(TARGET_DIR)/usr|g' > 
> $${ins}2 ;                    \
> +    done; \
> +    cat cmake_install.cmake | sed -e 
> 's/cmake_install.cmake/cmake_install.cmake2/g' > cmake_install.cmake2 
> ;    \
> +    $(HOST_DIR)/usr/bin/cmake -DCMAKE_INSTALL_PREFIX=$(TARGET_DIR)/usr 
> -P cmake_install.cmake2;         \
> +    )
> +    sed -i -e '/SHIBOKEN_BINARY/d' 
> $(STAGING_DIR)/lib/cmake/Shiboken-1.2.1/ShibokenConfig-python2.7.cmake
> +    echo 'set(SHIBOKEN_BINARY "$(HOST_DIR)/usr/bin/shiboken")' >> 
> $(STAGING_DIR)/lib/cmake/Shiboken-1.2.1/ShibokenConfig-python2.7.cmake
> +    rm -rf $(TARGET_DIR)/include/shiboken
> +    rm -rf $(TARGET_DIR)/usr/bin/shiboken
> +    rm -rf $(TARGET_DIR)/usr/lib/cmake/Shiboken*
> +    rm -rf $(TARGET_DIR)//usr/lib/pkgconfig/shiboken.pc
> +    echo "shiboken target OK";
> +endef
> +
> +
> +define SHIBOKEN_INSTALL_STAGING_CMDS
> +    $(TARGET_MAKE_ENV) $(SHIBOKEN_MAKE_ENV) $(MAKE) 
> $(SHIBOKEN_MAKE_OPT) -C $(@D)/build install
> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))

Ok, same thing: convert to cmake-package. With this work done, and a
split of your patch in at least 3 patches (one per package), maybe 4
(for the change in package/python/Config.in), we should be able to do a
more detailed review and sort out the remaining problems.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
