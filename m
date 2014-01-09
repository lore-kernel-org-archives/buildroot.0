From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 09 Jan 2014 08:00:21 +0100
Subject: [Buildroot] Untypical situation - python-smbus which is also a
 part of i2c-tools.
In-Reply-To: <CAMduVEehZnpUyUbdY-CY1xo=yABivLkrFdxa1atK537NYE9huA@mail.gmail.com>
References: <CAMduVEehZnpUyUbdY-CY1xo=yABivLkrFdxa1atK537NYE9huA@mail.gmail.com>
Message-ID: <52CE4905.4070102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Wojciech,

  [I'm catching up on old mail...]

On 24/12/13 22:33, Wojciech Zabolotny wrote:
> I needed to assure access to i2c peripherals from Python programs in
> my buildroot based embedded system.
> There is a py-smbus module, which is available as a part of i2c-tools,
> but which is not compiled during compilation of this package, and uses
> other tools for compilation.
>
> Simple addition of EXTRA="py-smbus" when executing make (as described
> in original README) doesn't help as it was discussed in a thread:
> http://lists.busybox.net/pipermail/buildroot/2013-June/074037.html
>
> After some review of some packages which use python components, I have
> got the attached mk file, which works, but is not a clean solution.
> I don't know if there is a cleaner way to achieve that?

  For me, the solution you propose is not that bad. We have several 
packages (kernel-headers and u-boot-tools are the most important ones) 
that share their source with another package.

  One small thing though: it should use $(PYTHON_SMBUS_VERSION) instead 
of $(I2C_TOOLS_VERSION). And of course it should now use the generic 
python package infrastructure. FYI I've attached an example of these changes.


> The ideal solution would be probably to allow selection of the
> python-smbus as a part of the i2c-tools package.
> How should it be done?

  That is also an acceptable option, but then you can't use the generic 
python package infrastructure anymore (except by using 
PKG_PYTHON_DISTUTILS_ENV). You can add the PYTHON_SMBUS_BUILD_CMDS to 
I2C_TOOLS_POST_BUILD_HOOKS.

  However, I'm not convinced that's it's cleaner, because it offers no 
way to build py-smbus without the rest of the i2c-tools. Of course, this 
additional 100K won't matter when you have python installed, but in 
principle we try to keep things as small as possible.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
################################################################################
#
# python-smbus
#
################################################################################

PYTHON_SMBUS_VERSION = 3.1.0
PYTHON_SMBUS_SOURCE = i2c-tools-$(PYTHON_SMBUS_VERSION).tar.bz2
PYTHON_SMBUS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
PYTHON_SMBUS_SETUP_TYPE = distutils
PYTHON_SMBUS_SUBDIR = py-smbus
PYTHON_SMBUS_ENV = CPPFLAGS="$(TARGET_CPPFLAGS) -I../include"

PYTHON_SMBUS_LICENSE = MIT

$(eval $(python-package))
