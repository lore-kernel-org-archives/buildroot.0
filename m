From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Tue, 17 Mar 2015 12:37:16 +0100
Subject: [Buildroot] [Patch] Added package python-smbus
In-Reply-To: <55080BF0.1020108@vu.nl>
References: <5503198F.6070804@vu.nl>
 <CAGm1_kuM-ZPCdjcSpd_wK-20WZ2+hYOro2DjRZ3dNibTsbLHPg@mail.gmail.com>
 <CAGm1_kuCMhPbFWXdtHSOnGf6ryi2baW59iMEJUrtHA1OW_94JA@mail.gmail.com>
 <5507244E.2080009@vu.nl> <55080BF0.1020108@vu.nl>
Message-ID: <550811EC.1010908@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dear Tjeerd,

sorry, i didn't spot your thread yesterday, actually I just posted a
python-smbus patch a couple of weeks back, see here:
http://patchwork.ozlabs.org/patch/435345/

Right now i can't test your patch, but for first sight it seems to be
OK. I also considered to integrate it into the i2c-tools package, but
imho it's reasonable to handle it as an external python module, as you
did as well.

Regards
zgyarmati

On 17.03.2015 12:11, ir. Tjeerd Pinkert wrote:
> Hi all,
> 
> I managed to add a package python-smbus that installs the
> i2c-tools py-smbus extension so that i2c can be used under python.
> 
> Most probably it is better to integrate this somehow into the
> i2c-tools scripts but this is the first onset of getting it
> working. Hints on how to best integrate, if regarded necessary, are
> welcome.
> 
> Best regards,
> 
> 
> Tjeerd Pinkert
> 
> 
> buildroot$ git diff 6bf057b0f2ba188397a691f74877a4a30aaea3f9 -- 
> diff --git a/package/Config.in b/package/Config.in index
> 262a7fb..7ef7149 100644 --- a/package/Config.in +++
> b/package/Config.in @@ -525,6 +525,7 @@ menu "external python
> modules" source "package/python-flup/Config.in" source
> "package/python-gobject/Config.in" source
> "package/python-httplib2/Config.in" +       source
> "package/python-smbus/Config.in" source
> "package/python-id3/Config.in" source
> "package/python-ipaddr/Config.in" source
> "package/python-ipy/Config.in" diff --git
> a/package/python-smbus/Config.in b/package/python-smbus/Config.in 
> new file mode 100644 index 0000000..d53b0af --- /dev/null +++
> b/package/python-smbus/Config.in @@ -0,0 +1,9 @@ +config
> BR2_PACKAGE_PYTHON_SMBUS +       bool "python-smbus" +
> depends on BR2_PACKAGE_I2C_TOOLS +       help +         Python
> bindings to smbus from the i2c-tools package + +
> http://www.lm-sensors.org/wiki/I2CTools + +         pyhton-smbus
> needs i2c-tools diff --git a/package/python-smbus/python-smbus.mk 
> b/package/python-smbus/python-smbus.mk new file mode 100644 index
> 0000000..1673e6a --- /dev/null +++
> b/package/python-smbus/python-smbus.mk @@ -0,0 +1,18 @@ 
> +################################################################################
>
>  +# +# python-smbus (i2c-tools python bindings) +# 
> +################################################################################
>
>  + +PYTHON_SMBUS_VERSION = 3.1.1 +PYTHON_SMBUS_SOURCE =
> i2c-tools-$(PYTHON_SMBUS_VERSION).tar.bz2 +PYTHON_SMBUS_SITE =
> http://dl.lm-sensors.org/i2c-tools/releases 
> +PYTHON_SMBUS_SETUP_TYPE = distutils +PYTHON_SMBUS_LICENSE = GPLv2 
> +PYTHON_SMBUS_LICENSE_FILES = COPYING +PYTHON_SMBUS_DEPENDENCIES =
> i2c-tools +PYTHON_SMBUS_SUBDIR=py-smbus + +TARGET_CFLAGS +=
> -I../include + +$(eval $(python-package))
> 
> 
> 
> 
> On 16-03-15 19:43, ir. Tjeerd Pinkert wrote:
>> Since I'm quite new to Buildroot, I am trying to understand how
>> to do things and how this thing works by reading the manual and
>> source code.
>> 
>> I have been trying further on the python-smbus-cffi today, but 
>> python-cffi seems to be fundamentally broken according to the
>> internet. Since my host machine does not yet have the python-cffi
>> package (Debian Stable), I could not pursue that path further.
>> 
>> Next I tried to get the py-smbus from the i2c-tools package
>> compiled. Unfortunately unsuccessful. To compile the py-smbus
>> package one normally adds the EXTRA=py-smbus to the make command.
>> I did that by adding an option to the configuration menu and then
>> trying to compile via a modified makefile, but that goes wrong.
>> 
>> I figured I needed a python-package makefile. Simply adding one
>> to the package directory then seems to be logical, but somehow
>> does not work because
>> 
>> 1. I need to call 'make' from the subdirectory py-smbus. 2. I get
>> a funny error, probably I don't understand the make system good 
>> enough yet.
>> 
>> I get the following compilation error, I attached the scripts to
>> this email, but, what would be the correct approach for this type
>> of (sub)package compilation? Help is highly appreciated.
>> 
>> error: package/i2c-tools/i2c-tools-python.mk:17: ***
>> "I2C_TOOLS_SETUP_TYPE must be set".  Stop.
>> 
>> Best regards,
>> 
>> 
>> Tjeerd Pinkert
> _______________________________________________ buildroot mailing
> list buildroot at busybox.net 
> http://lists.busybox.net/mailman/listinfo/buildroot

- -- 
Bests,
Zoltan Gyarmati
IRC freenode: zgyarmati
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVCBHsAAoJEAGmEeeR8iVhbEMH/0VVl37kKph96e5fdErI7ssF
trBbexvhSNMeLCsaD41k6s02p3rHxRsoU7/YNXyTZYBWatPfdvtWHhbxkakP8h1x
8cLvjyp4BanZLHrIPFeM/wRVWRd7mAV8DNnl58EfyE7NdGco4krQreXhi22y+eYz
zmLcAd7gQsvuR7hm/8wp89U9ORVTfQN9YXH8U5SaiL5gKxtwH19v/egkW1d0M033
kQE6qvIP+zvcB8ROjrybkTnP0lS4PliKEmaR8uqjHPy405nl6nfOLCCQNIVxNDVy
HpXzFz14brfYAFMrsz8qBgeyy/Sl4ZMw9shzuXCHPYrAwxr3I4loQd4V1Lgt9hg=
=xzEs
-----END PGP SIGNATURE-----
