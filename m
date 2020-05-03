From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 3 May 2020 21:12:57 +0300
Subject: [Buildroot] [PATCH 1/1] Added new package - python-pybind11 - a
 small header-only c++ to python binding library.
In-Reply-To: <20200502123749.20861-1-eyalroyee@gmail.com>
References: <20200502123749.20861-1-eyalroyee@gmail.com>
Message-ID: <CALFsTFXcxLdinWKFpBsLROvqFSjiBkk+sTJAyRj7-bMVoJPK9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eyal,

Thanks for this commit. Actually, you're not the first one to send a
patch for this package.
A general question before - what is the reason to use the CMake build
system for this package?
The only thing this package does is installing headers for other
packages, which can be done by the pkg-python infrastructure.

Other than that, see my comments below.

On Sat, May 2, 2020 at 3:37 PM Eyal Royee <eyalroyee@gmail.com> wrote:
>
> From: Eyal Royee <eyalroyee@gmail.com>
>
> Signed-off-by: Eyal Royee <eyalroyee@gmail.com>

The title of your commit message should be "package/python-pybind11:
new package".
You can read about it in the documentation:
https://buildroot.org/downloads/manual/manual.html#_contributing_to_buildroot

> ---
>  package/Config.in                             |  1 +
>  ...-to-execute-python-code-to-extract-i.patch | 79 +++++++++++++++++++
>  package/python-pybind11/Config.in             | 11 +++
>  package/python-pybind11/python-pybind11.hash  |  1 +
>  package/python-pybind11/python-pybind11.mk    | 39 +++++++++
>  5 files changed, 131 insertions(+)
>  create mode 100644 package/python-pybind11/0001-This-finder-used-to-execute-python-code-to-extract-i.patch
>  create mode 100644 package/python-pybind11/Config.in
>  create mode 100644 package/python-pybind11/python-pybind11.hash
>  create mode 100644 package/python-pybind11/python-pybind11.mk

When adding a new package, you should add an entry in the DEVELOPERS
file in order to get notified when the build of this package fails.

>
> diff --git a/package/Config.in b/package/Config.in
> index c12676d859..28d8dec049 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1887,6 +1887,7 @@ endif
>         source "package/poco/Config.in"
>         source "package/protobuf/Config.in"
>         source "package/protobuf-c/Config.in"
> +       source "package/python-pybind11/Config.in"
>         source "package/qhull/Config.in"
>         source "package/qlibc/Config.in"
>         source "package/riemann-c-client/Config.in"
> diff --git a/package/python-pybind11/0001-This-finder-used-to-execute-python-code-to-extract-i.patch b/package/python-pybind11/0001-This-finder-used-to-execute-python-code-to-extract-i.patch
> new file mode 100644
> index 0000000000..2ad730befd
> --- /dev/null
> +++ b/package/python-pybind11/0001-This-finder-used-to-execute-python-code-to-extract-i.patch
> @@ -0,0 +1,79 @@
> +From a70be99980ff5e2bbabaf8df68d1bcdc096d89e2 Mon Sep 17 00:00:00 2001
> +From: Eyal Royee <eyalroyee@gmail.com>
> +Date: Sat, 25 Apr 2020 16:14:29 +0300
> +Subject: [PATCH] This finder used to execute python code to extract
> + information about the system from distutils.sysconfig, however it requires
> + the target's python executable since the host is irrelent in this case.
> + Therefor this finder tries to execute the target's python interpreter which
> + might have a different architecture than the host... Instead of retrieving
> + those pieces of information from the output of a command executaion just let
> + buildroot supply those constants.
> +
> +---
> + tools/FindPythonLibsNew.cmake | 50 -----------------------------------
> + 1 file changed, 50 deletions(-)
> +
> +diff --git a/tools/FindPythonLibsNew.cmake b/tools/FindPythonLibsNew.cmake
> +index 9ea6036..807c68b 100644
> +--- a/tools/FindPythonLibsNew.cmake
> ++++ b/tools/FindPythonLibsNew.cmake
> +@@ -68,56 +68,6 @@ if(NOT PYTHONINTERP_FOUND)
> +     return()
> + endif()
> +
> +-# According to http://stackoverflow.com/questions/646518/python-how-to-detect-debug-interpreter
> +-# testing whether sys has the gettotalrefcount function is a reliable, cross-platform
> +-# way to detect a CPython debug interpreter.
> +-#
> +-# The library suffix is from the config var LDVERSION sometimes, otherwise
> +-# VERSION. VERSION will typically be like "2.7" on unix, and "27" on windows.
> +-execute_process(COMMAND "${PYTHON_EXECUTABLE}" "-c"
> +-    "from distutils import sysconfig as s;import sys;import struct;
> +-print('.'.join(str(v) for v in sys.version_info));
> +-print(sys.prefix);
> +-print(s.get_python_inc(plat_specific=True));
> +-print(s.get_python_lib(plat_specific=True));
> +-print(s.get_config_var('SO'));
> +-print(hasattr(sys, 'gettotalrefcount')+0);
> +-print(struct.calcsize('@P'));
> +-print(s.get_config_var('LDVERSION') or s.get_config_var('VERSION'));
> +-print(s.get_config_var('LIBDIR') or '');
> +-print(s.get_config_var('MULTIARCH') or '');
> +-"
> +-    RESULT_VARIABLE _PYTHON_SUCCESS
> +-    OUTPUT_VARIABLE _PYTHON_VALUES
> +-    ERROR_VARIABLE _PYTHON_ERROR_VALUE)
> +-
> +-if(NOT _PYTHON_SUCCESS MATCHES 0)
> +-    if(PythonLibsNew_FIND_REQUIRED)
> +-        message(FATAL_ERROR
> +-            "Python config failure:\n${_PYTHON_ERROR_VALUE}")
> +-    endif()
> +-    set(PYTHONLIBS_FOUND FALSE)
> +-    set(PythonLibsNew_FOUND FALSE)
> +-    return()
> +-endif()
> +-
> +-# Convert the process output into a list
> +-if(WIN32)
> +-    string(REGEX REPLACE "\\\\" "/" _PYTHON_VALUES ${_PYTHON_VALUES})
> +-endif()
> +-string(REGEX REPLACE ";" "\\\\;" _PYTHON_VALUES ${_PYTHON_VALUES})
> +-string(REGEX REPLACE "\n" ";" _PYTHON_VALUES ${_PYTHON_VALUES})
> +-list(GET _PYTHON_VALUES 0 _PYTHON_VERSION_LIST)
> +-list(GET _PYTHON_VALUES 1 PYTHON_PREFIX)
> +-list(GET _PYTHON_VALUES 2 PYTHON_INCLUDE_DIR)
> +-list(GET _PYTHON_VALUES 3 PYTHON_SITE_PACKAGES)
> +-list(GET _PYTHON_VALUES 4 PYTHON_MODULE_EXTENSION)
> +-list(GET _PYTHON_VALUES 5 PYTHON_IS_DEBUG)
> +-list(GET _PYTHON_VALUES 6 PYTHON_SIZEOF_VOID_P)
> +-list(GET _PYTHON_VALUES 7 PYTHON_LIBRARY_SUFFIX)
> +-list(GET _PYTHON_VALUES 8 PYTHON_LIBDIR)
> +-list(GET _PYTHON_VALUES 9 PYTHON_MULTIARCH)
> +-
> + # Make sure the Python has the same pointer-size as the chosen compiler
> + # Skip if CMAKE_SIZEOF_VOID_P is not defined
> + if(CMAKE_SIZEOF_VOID_P AND (NOT "${PYTHON_SIZEOF_VOID_P}" STREQUAL "${CMAKE_SIZEOF_VOID_P}"))
> +--
> +2.25.1
> +
> diff --git a/package/python-pybind11/Config.in b/package/python-pybind11/Config.in
> new file mode 100644
> index 0000000000..0bd3c794ef
> --- /dev/null
> +++ b/package/python-pybind11/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_PYBIND11
> +       bool "python-pybind11"
> +       depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> +       help
> +         pybind11 - Seamless operability between C++11 and Python.
> +
> +         pybind11 is a lightweight header-only library that exposes C++ types in Python
> +         and vice versa, mainly to create Python bindings of existing C++ code.
> +         Its goals and syntax are similar to the excellent Boost.Python library
> +         by David Abrahams: to minimize boilerplate code in traditional extension modules by
> +         inferring type information using compile-time introspection.

Please run the check-package tool (under utils directory) in order to
be consistent with the standard of the other Buildroot packages.

> diff --git a/package/python-pybind11/python-pybind11.hash b/package/python-pybind11/python-pybind11.hash
> new file mode 100644
> index 0000000000..ff1c08e667
> --- /dev/null
> +++ b/package/python-pybind11/python-pybind11.hash
> @@ -0,0 +1 @@
> +sha256 97504db65640570f32d3fdf701c25a340c8643037c3b69aec469c10c93dc8504  python-pybind11-2.5.0.tar.gz

Please add an entry for the license file too.

> diff --git a/package/python-pybind11/python-pybind11.mk b/package/python-pybind11/python-pybind11.mk
> new file mode 100644
> index 0000000000..8498e46b49
> --- /dev/null
> +++ b/package/python-pybind11/python-pybind11.mk
> @@ -0,0 +1,39 @@
> +################################################################################
> +#
> +# python-pybind11
> +#
> +################################################################################
> +
> +PYTHON_PYBIND11_VERSION = 2.5.0
> +PYTHON_PYBIND11_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND11_VERSION))
> +PYTHON_PYBIND11_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python)
> +PYTHON_PYBIND11_LICENSE_FILES = LICENSE

You should also add PYTHON_PYBIND11_LICENSE and state the type of the
license file.

> +PYTHON_PYBIND11_INSTALL_STAGING = YES

Since the package just installs headers for other packages, there's no
need to install it on the target.
This can be done with:
PYTHON_PYBIND11_INSTALL_TARGET = NO

> +#
> +# same as defined in pkg-python.mk
> +PYTHON_PYBIND11_PYTHON_INTERPRETER = $(TARGET_DIR)/bin/python
> +PYTHON_PYBIND11_PYTHON_VERSION = $(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_VERSION),$(PYTHON_VERSION))
> +PYTHON_PYBIND11_PYTHON_VERSION_MAJOR = $(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_VERSION_MAJOR),$(PYTHON_VERSION_MAJOR))

Some of the logic here is very similar to what we have in pkg-python.
As I wrote above, I think using the pkg-python infrastructure would be better.

> +
> +ifeq ($(BR2_ARCH_IS_64),y)
> +PYTHON_PYBIND11_SIZEOF_VOID_P=8
> +else
> +PYTHON_PYBIND11_SIZEOF_VOID_P=4
> +endif
> +
> +PYTHON_PYBIND11_MULTIARCH = $(shell $(HOSTCC) --print-multiarch 2>/dev/null | sed -E 's/-linux-(musl|uclibc)*$$/-linux-gnu/')
> +
> +PYTHON_PYBIND11_CONF_OPTS = -DPYBIND11_TEST=OFF \
> +                     -DPYTHON_EXECUTABLE=$(PYTHON_PYBIND11_PYTHON_INTERPRETER) \
> +                     -D_PYTHON_VERSION_LIST=$(PYTHON_PYBIND11_PYTHON_VERSION) \
> +                     -DPYTHON_PREFIX=/usr \
> +                     -DPYTHON_INCLUDE_DIR=$(STAGING_DIR)/usr/include/python$(PYTHON_PYBIND11_PYTHON_VERSION_MAJOR) \
> +                     -DPYTHON_SITE_PACKAGES=$(TARGET_DIR)/usr/lib/python$(PYTHON_PYBIND11_PYTHON_VERSION_MAJOR)/site-packages \
> +                     -DPYTHON_MODULE_EXTENSION=.so \
> +                     -DPYTHON_IS_DEBUG=0 \
> +                     -DPYTHON_SIZEOF_VOID_P=$(PYTHON_PYBIND11_SIZEOF_VOID_P) \
> +                     -DPYTHON_LIBRARY_SUFFIX=$(PYTHON_PYBIND11_PYTHON_VERSION_MAJOR) \
> +                     -DPYTHON_LIBDIR=$(STAGING_DIR)/usr/lib \
> +                     -DPYTHON_MULTIARCH=$(PYTHON_PYBIND11_MULTIARCH)
> +
> +$(eval $(cmake-package))
> --
> 2.25.1
>

Thanks,
Asaf.
