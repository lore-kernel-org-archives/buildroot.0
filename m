From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Dec 2018 19:37:45 +0100
Subject: [Buildroot] Having a trouble with installing h5py
In-Reply-To: <8a6daa16bc9296d8e93160e8052ab13b$8470e874@mail3.nate.com>
References: <8a6daa16bc9296d8e93160e8052ab13b$8470e874@mail3.nate.com>
Message-ID: <ef45f07f-4ae1-86d3-2c2c-465c201d39d7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/11/2018 08:58, ??? wrote:
> ?Hi
> 
> I'm trying to install h5py to my image for installing keras. I made
> 2?directories which names are 'libhdf5-dev', 'python-h5py'. but I got?a error
> message, when my machine built?'python-h5py'.
> 
> here is my 'python-h5py.mk' file.
> 
>     ################################################################################
>     #
>     # python-h5py
>     #
>     ################################################################################
> 
>     PYTHON_H5PY_VERSION = 2.8.0
>     PYTHON_H5PY_SOURCE = h5py-$(PYTHON_H5PY_VERSION).tar.gz
>     PYTHON_H5PY_SITE =
>     https://files.pythonhosted.org/packages/74/5d/6f11a5fffc3d8884bb8d6c06abbee0b3d7c8c81bde9819979208ba823a47
>     PYTHON_H5PY_SETUP_TYPE = setuptools
>     PYTHON_H5PY_LICENSE = THG
> 
>     $(eval $(python-package))
> 
> 
> here is my 'Config.in' file
> 
>     config BR2_PACKAGE_PYTHON_H5PY
>     ? ? ? ? bool "python-h5py"
>     ? ? ? ? depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>     ? ? ? ? depends on BR2_INSTALL_LIBSTDCPP
>     ? ? ? ? depends on BR2_USE_WCHAR
> 
> 
> 
> 
> and here is error message which I got.
> 
>     Download error on https://pypi.python.org/simple/pkgconfig/: unknown url
>     type: https -- Some packages may not be found!
>     Couldn't find index page for 'pkgconfig' (maybe misspelled?)
>     Download error on https://pypi.python.org/simple/: unknown url type: https
>     -- Some packages may not be found!
>     No local packages or working download links found for pkgconfig
>     Traceback (most recent call last):
>     ? File "setup.py", line 168, in <module>
>     ? ? cmdclass = CMDCLASS,
>     ? File
>     "/home/keti/buildroot-opencv/output/target/usr/lib/python3.6/distutils/core.py",
>     line 108, in setup
>     ? ? _setup_distribution = dist = klass(attrs)
>     ? File "build/bdist.linux-x86_64/egg/setuptools/dist.py", line 320, in __init__
>     ? File "build/bdist.linux-x86_64/egg/setuptools/dist.py", line 377, in
>     fetch_build_eggs
>     ? File "build/bdist.linux-x86_64/egg/pkg_resources/__init__.py", line 852,
>     in resolve
>     ? File "build/bdist.linux-x86_64/egg/pkg_resources/__init__.py", line 1124,
>     in best_match
>     ? File "build/bdist.linux-x86_64/egg/pkg_resources/__init__.py", line 1136,
>     in obtain
>     ? File "build/bdist.linux-x86_64/egg/setuptools/dist.py", line 445, in
>     fetch_build_egg
>     ? File "build/bdist.linux-x86_64/egg/setuptools/command/easy_install.py",
>     line 667, in easy_install
>     distutils.errors.DistutilsError: Could not find suitable distribution for
>     Requirement.parse('pkgconfig')

 It looks like you need to add

 PYTHON_H5PY_DEPENDENCIES = host-pkgconf

 And you probably also have to add the dependency on libhdf5 if the python
package uses that.


 Regards,
 Arnout

>     package/pkg-generic.mk:227: recipe for target
>     '/home/keti/buildroot-opencv/output/build/python-h5py-2.8.0/.stamp_built' failed
>     make[1]: ***
>     [/home/keti/buildroot-opencv/output/build/python-h5py-2.8.0/.stamp_built]
>     Error 1
>     Makefile:79: recipe for target '_all' failed
>     make: *** [_all] Error 2
> 
> 
> Thanks in advance for your help.
> 
> Best Regards,
> Sanghun Kim
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
