From: Mehdi.Trabelsi.Ajili-EXT at continental-corporation.com <Mehdi.Trabelsi.Ajili-EXT@continental-corporation.com>
Date: Fri, 23 Jun 2017 13:46:07 +0200
Subject: [Buildroot] Wrong ELF class when installing python-h5py module
Message-ID: <OFEF6204A4.C76464CA-ONC1258148.003F3263-C1258148.0040A617@continental-corporation.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I added the HDF5 package to buildroot using the patch  
https://patchwork.ozlabs.org/patch/425217/ and it worked. HDF5 was 
configured and installed correctly.
For my project I am using python to manipulate HDF files and I wanted to 
install the python h5py module. I added the following makefile:

################################################################################
#
# python-h5py
#
################################################################################

PYTHON_H5PY_VERSION = 2.7.0
PYTHON_H5PY_SOURCE = h5py-$(PYTHON_H5PY_VERSION).tar.gz
PYTHON_H5PY_SITE = 
https://pypi.python.org/packages/11/6b/32cee6f59e7a03ab7c60bb250caff63e2d20c33ebca47cf8c28f6a2d085c
PYTHON_H5PY_LICENSE = BSD
PYTHON_H5PY_LICENSE_FILES = LICENSE.txt COPYING.txt
PYTHON_H5PY_SETUP_TYPE = setuptools
PYTHON_H5PY_DEPENDENCIES = hdf5 python-six python-numpy python-pkgconfig 
python-cython 

$(eval $(python-package))



All dependencies were configured and installed, when h5py starts building 
the following error appears:
ImportError: 
/home/user/build/buildroot-2016.05/output/target/usr/lib/python3.4/site-packages/Cython/Compiler/Scanning.cpython-34m.so: 
wrong ELF class: ELFCLASS32

This is the whole message:

>>> python-h5py 2.7.0 Building
(cd /home/user/build/buildroot-2016.05/output/build/python-h5py-2.7.0//; 
PATH="/home/user/build/buildroot-2016.05/output/host/bin:/home/user/build/buildroot-2016.05/output/host/sbin:/home/user/build/buildroot-2016.05/output/host/usr/bin:/home/user/build/buildroot-2016.05/output/host/usr/sbin:/home/user/bin:/home/user/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/arm/fs-toolchain-5.2.0-armv7ahf/bin" 
PYTHONPATH="/home/user/build/buildroot-2016.05/output/target/usr/lib/python3.4/sysconfigdata/:/home/user/build/buildroot-2016.05/output/target/usr/lib/python3.4/site-packages/" 
_python_sysroot=/home/user/build/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot 
_python_prefix=/usr _python_exec_prefix=/usr 
/home/user/build/buildroot-2016.05/output/host/usr/bin/python setup.py 
build  )
running build
running build_py
running build_ext
Traceback (most recent call last):
  File "setup.py", line 165, in <module>
    cmdclass = CMDCLASS,
  File 
"/home/user/build/buildroot-2016.05/output/host/usr/lib/python3.4/distutils/core.py", 
line 148, in setup
    dist.run_commands()
  File 
"/home/user/build/buildroot-2016.05/output/host/usr/lib/python3.4/distutils/dist.py", 
line 955, in run_commands
    self.run_command(cmd)
  File 
"/home/user/build/buildroot-2016.05/output/host/usr/lib/python3.4/distutils/dist.py", 
line 974, in run_command
    cmd_obj.run()
  File 
"/home/user/build/buildroot-2016.05/output/host/usr/lib/python3.4/distutils/command/build.py", 
line 126, in run
    self.run_command(cmd_name)
  File 
"/home/user/build/buildroot-2016.05/output/host/usr/lib/python3.4/distutils/cmd.py", 
line 313, in run_command
    self.distribution.run_command(command)
  File 
"/home/user/build/buildroot-2016.05/output/host/usr/lib/python3.4/distutils/dist.py", 
line 974, in run_command
    cmd_obj.run()
  File 
"/home/user/build/buildroot-2016.05/output/build/python-h5py-2.7.0/setup_build.py", 
line 149, in run
    from Cython.Build import cythonize
  File 
"/home/user/build/buildroot-2016.05/output/target/usr/lib/python3.4/site-packages/Cython/Build/__init__.py", 
line 1, in <module>
    from .Dependencies import cythonize
  File 
"/home/user/build/buildroot-2016.05/output/target/usr/lib/python3.4/site-packages/Cython/Build/Dependencies.py", 
line 51, in <module>
    from ..Compiler.Main import Context, CompilationOptions, 
default_options
  File 
"/home/user/build/buildroot-2016.05/output/target/usr/lib/python3.4/site-packages/Cython/Compiler/Main.py", 
line 28, in <module>
    from .Scanning import PyrexScanner, FileSourceDescriptor
ImportError: 
/home/user/build/buildroot-2016.05/output/target/usr/lib/python3.4/site-packages/Cython/Compiler/Scanning.cpython-34m.so: 
wrong ELF class: ELFCLASS32
package/pkg-generic.mk:195: recipe for target 
'/home/user/build/buildroot-2016.05/output/build/python-h5py-2.7.0/.stamp_built' 
failed
make[1]: *** 
[/home/user/build/buildroot-2016.05/output/build/python-h5py-2.7.0/.stamp_built] 
Error 1
Makefile:36: recipe for target '_all' failed
make: *** [_all] Error 2

Did anyone worked on this library and encountred a similar problem?

Thanks,

Mehdi
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170623/a3d090f2/attachment.html>
