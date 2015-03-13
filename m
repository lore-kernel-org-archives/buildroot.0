From: ir. Tjeerd Pinkert <t.j.pinkert@vu.nl>
Date: Fri, 13 Mar 2015 18:08:31 +0100
Subject: [Buildroot] trying to add python-smbus-cffi, but installing fails
Message-ID: <5503198F.6070804@vu.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I was trying to install the python smbus-cffi as a package (currently in 
my BR2_EXTERNAL directory) but installation fails.

It looks like the package is trying to load itself to register, but of 
course it fails because I think the host python loads this, and can not 
load the _cffi_backend.so compiled for the target?

Anyone an idea how to get solve this chicken egg problem?

This is the part where the install script fails:
Installed 
/local/opt/freescale/buildroot/output/build/python-smbus-cffi-0.4.1/pycparser-2.10-py2.7.egg
Traceback (most recent call last):
   File "setup.py", line 7, in <module>
     import smbus
   File 
"/local/opt/freescale/buildroot/output/build/python-smbus-cffi-0.4.1/smbus/__init__.py", 
line 1, in <module>
     from .smbus import ffi
   File 
"/local/opt/freescale/buildroot/output/build/python-smbus-cffi-0.4.1/smbus/smbus.py", 
line 40, in <module>
     ffi = FFI()
   File 
"/opt/freescale/buildroot/output/target/usr/lib/python2.7/site-packages/cffi/api.py", 
line 56, in __init__
     import _cffi_backend as backend
ImportError: 
/opt/freescale/buildroot/output/target/usr/lib/python2.7/site-packages/_cffi_backend.so: 
wrong ELF class: ELFCLASS32
make: *** 
[/opt/freescale/buildroot/output/build/python-smbus-cffi-0.4.1/.stamp_built] 
Error 1

I include here the Buildroot scripts for installation, which should make 
it easy to test for others. (I think the 
PYTHON_SMBUS_CFFI_INSTALL_TARGET_OPTS = install is not needed, but it 
also fails without this)



Best regards,


Tjeerd Pinkert
-------------- next part --------------
config BR2_PACKAGE_PYTHON_SMBUS_CFFI
	bool "python-smbus-cffi"
	depends on BR2_PACKAGE_PYTHON_CFFI
	help
	  This Python module allows SMBus access through the I2C /dev interface
	  on Linux hosts. The host kernel must have I2C support, I2C device
	  interface support, and a bus adapter driver.

	  This module is a cffi-based python reimplementation of the
	  python-smbus C-extension (http://www.lm-sensors.org/browser
	  /i2c-tools/trunk/py-smbus/) and works on PyPy and CPython (2.6
	  and up).

	  https://pypi.python.org/pypi/smbus-cffi/
-------------- next part --------------
################################################################################
#
# python-smbus-cffi
#
################################################################################

PYTHON_SMBUS_CFFI_VERSION = 0.4.1
PYTHON_SMBUS_CFFI_SOURCE = smbus-cffi-$(PYTHON_SMBUS_CFFI_VERSION).tar.gz
PYTHON_SMBUS_CFFI_SITE = https://pypi.python.org/packages/source/s/smbus-cffi
PYTHON_SMBUS_CFFI_SETUP_TYPE = setuptools
PYTHON_SMBUS_CFFI_INSTALL_TARGET_OPTS = install
PYTHON_SMBUS_CFFI_DEPENDENCIES = host-pkgconf libffi python-cffi
PYTHON_SMBUS_CFFI_LICENSE = GPLv2
PYTHON_SMBUS_CFFI_LICENSE_FILES = LICENSE

$(eval $(python-package))
