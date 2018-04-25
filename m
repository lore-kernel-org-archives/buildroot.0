From: Maik.Brenke at continental-corporation.com <Maik.Brenke@continental-corporation.com>
Date: Wed, 25 Apr 2018 15:57:45 +0200
Subject: [Buildroot] Antwort: Re: implement of linux-gpib package for
 version 4.1.0
In-Reply-To: <20180419084836.GB30285@scaer>
References: <20180419084836.GB30285@scaer>,
 <OFF17987C3.31AB9F37-ONC1258274.002690A6-C1258274.002BECEF@continental-corporation.com>
Message-ID: <OF7FCB19BA.B8DA7B1F-ONC125827A.004BEEDE-C125827A.004CB2C8@continental-corporation.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi Yann, All,

I was able to cross compile and execute the programs on my target beside buildroot with the configuration from [1]. I than tried to port this into my buildroot package but ended up with Linux flag errors (see [3], full log in the attachment).

What is the right way to let buildroot cross compile the sources? 


[1]:
export PATH="/usr/local/arm/fs-toolchain-5.2.0-armv7ahf/bin/:$PATH"
export CROSS_COMPILE="/usr/local/arm/fs-toolchain-5.2.0-armv7ahf/bin/arm-fs-linux-gnueabihf-"
export ARCH=arm

./configure --host=arm-fs-linux-gnueabihf \
??? --with-linux-srcdir=/home/brenkem/git/DD_TEST/output/build/linux-custom/ \
??? --prefix=/tmp/ \
??? --disable-guile-binding \
??? --disable-perl-binding \
??? --disable-php-binding \
??? --disable-python-binding \
??? --disable-tcl-binding


[2]:
################################################################################
#
# linux-gpib
#
################################################################################

LINUX_GPIB_VERSION = 4.1.0
LINUX_GPIB_SITE  =  http://downloads.sourceforge.net/project/linux-gpib/linux-gpib%20for%203.x.x%20and%202.6.x%20kernels/$(LINUX_GPIB_VERSION)
LINUX_GPIB_SOURCE = linux-gpib-$(LINUX_GPIB_VERSION).tar.gz
LINUX_GPIB_LICENSE = GPLv2
LINUX_GPIB_LICENSE_FILES = COPYING
LINUX_GPIB_INSTALL_STAGING = YES
LINUX_GPIB_AUTORECONF = YES

LINUX_GPIB_CONF_OPTS = \
??????? --host=arm-fs-linux-gnueabihf \
??????? --with-linux-srcdir=$(LINUX_DIR)/ \
??????? --prefix=$(TARGET_DIR)/ \
??????? --disable-guile-binding \
??????? --disable-perl-binding \
??????? --disable-php-binding \
??????? --disable-python-binding \
??????? --disable-tcl-binding \
??????? --disable-python-binding \
??????? --disable-isa

$(eval $(autotools-package))
---------------


[3]:
checking Linux kernel compile flags... arm-linux-gcc: error: unrecognized command line option '-m64'
arm-linux-gcc: error: unrecognized command line option '-mno-red-zone'
arm-linux-gcc: error: unrecognized command line option '-mcmodel=kernel'
arm-linux-gcc: error: unrecognized command line option '-mno-sse'
arm-linux-gcc: error: unrecognized command line option '-mno-mmx'
arm-linux-gcc: error: unrecognized command line option '-mno-sse2'
arm-linux-gcc: error: unrecognized command line option '-mno-3dnow'
make[2]: *** [/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/util/linux_flags/fake.o] Error 1
make[1]: *** [_module_/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/util/linux_flags] Error 2
configure: WARNING: Failed to get compile flags from Linux kernel directory.
ok
-----------------

Mit freundlichen Gr??en / Best regards

Maik Brenke
Embedded Software Engineer
BU ADAS

Continental
Division Chassis & Safety
Ringlerstrasse 17, 85057 Ingolstadt
Germany

Phone: 	+49-841-881-12401

-----"buildroot" <buildroot-bounces@busybox.net> schrieb: -----
An: Maik.Brenke at continental-corporation.com
Von: "Yann E. MORIN" 
Gesendet von: "buildroot" 
Datum: 19.04.2018 10:49
Kopie: buildroot at buildroot.org
Betreff: Re: [Buildroot] implement of linux-gpib package for version 4.1.0

Mike, All,

On 2018-04-19 09:59 +0200, Maik.Brenke at continental-corporation.com spake thusly:
> Hello Ladys and Gentleman,
> 
> again the topic linux-gpib pops up. I so far checked the mailing list and see that there was quiet some work on version 4.0.3 (see
> [1]). Now I am trying to set up version 4.1.0.

The latest status I have on this topic is still available in my tree:

?? ?https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/linux-gpib

Not sure I had the python stuff working, but th kernel module would
indeed build (not sure it would work, I have no gpib hardware to test
with).

Getting up to 4.1.0 might need some rework, I have no idea what happened
in linux-gpib since I initially tried the packaging.

> I got all the information I can find from [1]. According to [1] I configured my packages like [2].
> Is there already a working implementation for linux-gpib? I noticed that " Yann E. MORIN-2" already worked on this topic (see [4]).
> But I was not able to contact him directly.

Weird, I have seen no mail from you on the list, and none to which I was
CC-ed either...

So, feel free to grab the two sommits, polish them for 4.1.0, and
resubmit to the list. If someone with real hardware, like you, can
actually test and confirm it is working, this has a better chance of
getting applied.

Regards,
Yann E. MORIN.

> By the way I use a imx6sx. I also attached the hole log as file.
> 
> [1]:
> http://buildroot-busybox.2317881.n4.nabble.com/help-please-td140488.html#a140606
> 
> [2]:
> ---------------
> $ cat linux-gpib.mk
> ################################################################################
> #
> # linux-gpib
> #
> ################################################################################
> 
> LINUX_GPIB_VERSION = 4.1.0
> LINUX_GPIB_SITE =
> http://downloads.sourceforge.net/project/linux-gpib/linux-gpib%20for%203.x.x%20and%202.6.x%20kernels/$(LINUX_GPIB_VERSION)
> LINUX_GPIB_SOURCE = linux-gpib-$(LINUX_GPIB_VERSION).tar.gz
> LINUX_GPIB_LICENSE = GPLv2
> LINUX_GPIB_LICENSE_FILES = COPYING
> LINUX_GPIB_INSTALL_STAGING = YES
> LINUX_GPIB_AUTORECONF = YES
> LINUX_GPIB_CONF_OPTS = --with-linux-srcdir=$(LINUX_DIR)/
> 
> $(eval $(autotools-package))
> 
> -----------
> $ cat Config.in
> config BR2_PACKAGE_LINUX_GPIB
> ? ? bool "linux-gpib"
> ? ? depends on BR2_LINUX_KERNEL
> ? ? help
> ? ? ? The Linux GPIB Package is a support package for GPIB
> ? ? ? (IEEE 488) hardware. The package contains kernel driver
> ? ? ? modules, and a C user-space library with Guile, Perl, PHP,
> ? ? ? Python and TCL bindings. The API of the C library is intended
> ? ? ? to be compatible with National Instrument's GPIB library.
> 
> ? ? ? http://linux-gpib.sourceforge.net
> 
> --------
> $ cat 0001-configure-scm_version.patch
> --- a/configure.ac ? ?2018-04-18 16:49:31.499095044 +0200
> +++ b/configure.ac ? ?2018-04-18 16:49:26.414918285 +0200
> @@ -30,9 +30,10 @@ AC_SUBST([GPIB_SO_VERSION])
> ?[ISODATE=`date +%Y-%m-%d`]
> ?AC_SUBST([ISODATE])
> 
> -AC_CHECK_FILE([util/.scm_version.tmp],
> - ?[SCM_VERSION=[$VERSION"\ [r"`cat util/.scm_version.tmp`"]"]],
> - ?[SCM_VERSION=$VERSION])
> +#AC_CHECK_FILE([util/.scm_version.tmp],
> +# ?[SCM_VERSION=[$VERSION"\ [r"`cat util/.scm_version.tmp`"]"]],
> +# ?[SCM_VERSION=$VERSION])
> +SCM_VERSION=4.1.0
> 
> ?AC_SUBST(SCM_VERSION)
> 
> [4]:
> http://buildroot-busybox.2317881.n4.nabble.com/PATCH-1-2-package-Makefile-in-should-grab-HOST-DIR-headers-using-isystem-instead-of-I-td141444.html#a141774
> 
> Mit freundlichen Gr??en / Best regards
> 
> Maik Brenke
> Embedded Software Engineer
> BU ADAS
> 
> Continental
> Division Chassis & Safety
> Ringlerstrasse 17, 85057 Ingolstadt
> Germany
> 
> Phone: +49-841-881-12401


> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
| ?Yann E. MORIN ?| Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software ?Designer | \ / CAMPAIGN ? ? | ?___ ? ? ? ? ? ? ? |
| +33 223 225 172 `------------.-------: ?X ?AGAINST ? ? ?| ?\e/ ?There is no ?|
| http://ymorin.is-a-geek.org/?| _/*\_ | / \ HTML MAIL ? ?| ? v ? conspiracy. ?|
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180425/5e9e4c00/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-gpib-build.log
Type: application/octet-stream
Size: 100165 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180425/5e9e4c00/attachment.obj>
