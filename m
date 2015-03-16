From: ir. Tjeerd Pinkert <t.j.pinkert@vu.nl>
Date: Mon, 16 Mar 2015 19:43:26 +0100
Subject: [Buildroot] trying to add python-smbus-cffi,
	but installing fails
In-Reply-To: <CAGm1_kuCMhPbFWXdtHSOnGf6ryi2baW59iMEJUrtHA1OW_94JA@mail.gmail.com>
References: <5503198F.6070804@vu.nl>
 <CAGm1_kuM-ZPCdjcSpd_wK-20WZ2+hYOro2DjRZ3dNibTsbLHPg@mail.gmail.com>
 <CAGm1_kuCMhPbFWXdtHSOnGf6ryi2baW59iMEJUrtHA1OW_94JA@mail.gmail.com>
Message-ID: <5507244E.2080009@vu.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since I'm quite new to Buildroot, I am trying to understand how to do 
things and how this thing works by reading the manual and source code.

I have been trying further on the python-smbus-cffi today, but 
python-cffi seems to be fundamentally broken according to the internet. 
Since my host machine does not yet have the python-cffi package (Debian 
Stable), I could not pursue that path further.

Next I tried to get the py-smbus from the i2c-tools package compiled. 
Unfortunately unsuccessful. To compile the py-smbus package one normally 
adds the EXTRA=py-smbus to the make command. I did that by adding an 
option to the configuration menu and then trying to compile via a 
modified makefile, but that goes wrong.

I figured I needed a python-package makefile. Simply adding one to the 
package directory then seems to be logical, but somehow does not work 
because

1. I need to call 'make' from the subdirectory py-smbus.
2. I get a funny error, probably I don't understand the make system good 
enough yet.

I get the following compilation error, I attached the scripts to this 
email, but, what would be the correct approach for this type of 
(sub)package compilation? Help is highly appreciated.

error:
package/i2c-tools/i2c-tools-python.mk:17: *** "I2C_TOOLS_SETUP_TYPE must 
be set".  Stop.

Best regards,


Tjeerd Pinkert




On 13-03-15 18:34, Yegor Yefremov wrote:
> On Fri, Mar 13, 2015 at 6:22 PM, Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
>> On Fri, Mar 13, 2015 at 6:08 PM, ir. Tjeerd Pinkert <t.j.pinkert@vu.nl> wrote:
>>> Hi,
>>>
>>> I was trying to install the python smbus-cffi as a package (currently in my
>>> BR2_EXTERNAL directory) but installation fails.
>>>
>>> It looks like the package is trying to load itself to register, but of
>>> course it fails because I think the host python loads this, and can not load
>>> the _cffi_backend.so compiled for the target?
>>>
>>> Anyone an idea how to get solve this chicken egg problem?
>>>
>>> This is the part where the install script fails:
>>> Installed
>>> /local/opt/freescale/buildroot/output/build/python-smbus-cffi-0.4.1/pycparser-2.10-py2.7.egg
>>> Traceback (most recent call last):
>>>    File "setup.py", line 7, in <module>
>>>      import smbus
>>>    File
>>> "/local/opt/freescale/buildroot/output/build/python-smbus-cffi-0.4.1/smbus/__init__.py",
>>> line 1, in <module>
>>>      from .smbus import ffi
>>>    File
>>> "/local/opt/freescale/buildroot/output/build/python-smbus-cffi-0.4.1/smbus/smbus.py",
>>> line 40, in <module>
>>>      ffi = FFI()
>>>    File
>>> "/opt/freescale/buildroot/output/target/usr/lib/python2.7/site-packages/cffi/api.py",
>>> line 56, in __init__
>>>      import _cffi_backend as backend
>>> ImportError:
>>> /opt/freescale/buildroot/output/target/usr/lib/python2.7/site-packages/_cffi_backend.so:
>>> wrong ELF class: ELFCLASS32
>>> make: ***
>>> [/opt/freescale/buildroot/output/build/python-smbus-cffi-0.4.1/.stamp_built]
>>> Error 1
>>>
>>> I include here the Buildroot scripts for installation, which should make it
>>> easy to test for others. (I think the PYTHON_SMBUS_CFFI_INSTALL_TARGET_OPTS
>>> = install is not needed, but it also fails without this)
>>
>> Looks like the problem with python-cryptography:
>> https://github.com/pyca/cryptography/issues/1325 See the last post.
>
> In this thread someone mentions a dirty workaround via installing cffi
> on host: https://github.com/pyca/bcrypt/issues/34
>
> Will try it, if I have enough time.
>
-------------- next part --------------
config BR2_PACKAGE_I2C_TOOLS
	bool "i2c-tools"
	help
	  Heterogeneous set of I2C tools for Linux

	  This package contains a heterogeneous set of I2C tools for Linux:
	  a bus probing tool, a chip dumper, register-level access helpers,
	  EEPROM decoding scripts, and more.

	  http://www.lm-sensors.org/wiki/I2CTools

if BR2_PACKAGE_I2C_TOOLS
	config BR2_PACKAGE_I2C_TOOLS_PYTHON
	bool "Python bindings for the i2c-tools, py-smbus"
	select BR2_PACKAGE_PYTHON
	help
	  Python bindings for the i2c-tools package. This is the
	  python-smbus extention.
endif
-------------- next part --------------
################################################################################
#
# i2c-tools
#
################################################################################

I2C_TOOLS_VERSION = 3.1.1
I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
I2C_TOOLS_LICENSE = GPLv2+, GPLv2 (py-smbus)
I2C_TOOLS_LICENSE_FILES = COPYING

I2C_TOOLS_EXTRA =
#ifeq ($(BR2_PACKAGE_I2C_TOOLS_PYTHON),y)
#I2C_TOOLS_EXTRA = py-smbus
#I2C_TOOLS_DEPENDENCIES += python
#endif

define I2C_TOOLS_BUILD_CMDS
	$(MAKE) EXTRA=$(I2C_TOOLS_EXTRA) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define I2C_TOOLS_INSTALL_TARGET_CMDS
	for i in i2cdump i2cget i2cset i2cdetect; \
	do \
		$(INSTALL) -m 755 -D $(@D)/tools/$$i $(TARGET_DIR)/usr/bin/$$i; \
	done
endef

$(eval $(generic-package))
-------------- next part --------------
################################################################################
#
# py-smbus (i2c-tools python bindings)
#
################################################################################

ifeq ($(BR2_PACKAGE_I2C_TOOLS_PYTHON),y)

PYTHON_I2C_TOOLS_VERSION = 3.1.1
PYTHON_I2C_TOOLS_SOURCE = i2c-tools-$(PYTHON_I2C_TOOLS_VERSION).tar.bz2
PYTHON_I2C_TOOLS_SITE = http://downloads.sourceforge.net/project/pyalsaaudio
PYTHON_I2C_TOOLS_SETUP_TYPE = distutils
PYTHON_I2C_TOOLS_LICENSE = GPLv2
PYTHON_I2C_TOOLS_LICENSE_FILES = COPYING
PYTHON_I2C_TOOLS_DEPENDENCIES = i2c-tools

$(eval $(python-package))

endif
