From: daniel.sangue at sangue.ch <daniel.sangue@sangue.ch>
Date: Thu, 02 Oct 2014 09:52:10 +0200
Subject: [Buildroot] [PATCH 1/1] libFTDI major version update 1. This
 version can coexists beside the 0.x version (libftdi.so, libftdi1.so).
Message-ID: <2.c5a9d6940ebdbeb712d0@polarstar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

Well im new to buildroot and git and also to linux. I am at the buttom of the learning curve related to this topics. Thank you for your time and feedback.


---- OriginalMessage ----
>From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
>To: "Daniel Sangue" <daniel.sangue@sangue.ch>
>CC: buildroot at buildroot.org
>Sent: Wed, Oct 01, 2014, 04:26 PM
>Subject: Re: [Buildroot] [PATCH 1/1] libFTDI major version update 1. This version can coexists beside the 0.x version (libftdi.so, libftdi1.so).
>
>Dear Daniel Sangue,
>
>Thanks for getting back with a proper patch for libftdi1. Definitely
>looking much better!
>
>One first nit: the way your commit log is formatted. See
>http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html.
>Your commit log should look like:
>
>"""
>libftdi1: new package
>
>This commit adds libftdi1 as a new package. This version should (and
>can) co-exist besides the 0.x version already packaged as libftdi,
>because they use different library names and a different API.
>
>Signed-off-by: ...
>"""
>
>The most important thing is that the first line should be short, and be
>an overall summary of what the patch is doing. Then one blank line, and
>one or several paragraphs of additional details, then one blank line,
>and the Signed-off-by line.
>

Ok, i hope i got it. Give it a try next time. Yes this 50/72 principle makes sense.


>On Wed,  1 Oct 2014 16:18:21 +0200, Daniel Sangue wrote:
>> diff --git a/package/libftdi1/Config.in b/package/libftdi1/Config.in
>> new file mode 100644
>> index 0000000..d896fc0
>> --- /dev/null
>> +++ b/package/libftdi1/Config.in
>> @@ -0,0 +1,24 @@
>> +config BR2_PACKAGE_LIBFTDI1
>> +	bool "libftdi1"
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
>> +	select BR2_PACKAGE_LIBUSB
>> +	select BR2_PACKAGE_LIBUSB_COMPAT
>> +	select BR2_PACKAGE_LIBCONFUSE
>> +	help
>> +	  Userspace access to FTDI USB interface chips (version 1.x)
>> +
>> +	  http://www.intra2net.com/en/developer/libftdi/index.php
>> +
>> +if BR2_PACKAGE_LIBFTDI1
>> +
>> +config BR2_PACKAGE_LIBTFDI1_CPP
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	bool "C++ bindings"
>> +	help
>> +	  C++ bindings for libftdi
>
>According to your libftdi1.mk file comments, it looks like C++ support
>can be autodetected. So maybe it's not really worth the effort having
>an option for that: we could just enable C++ support when available,
>and that's it.
>

ok, i removed the additional c++ binding option. I admit that i just copy pasted it from the existing libftdi(0) package.


>> +
>> +endif # BR2_PACKAGE_LIBFTDI1
>> +
>> +comment "libftdi1 needs a toolchain w/ threads"
>> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
>> +
>> diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
>> new file mode 100644
>> index 0000000..abe0dc7
>> --- /dev/null
>> +++ b/package/libftdi1/libftdi1.mk
>> @@ -0,0 +1,22 @@
>> +################################################################################
>> +#
>> +# libftdi1
>> +#
>> +################################################################################
>> +
>> +LIBFTDI1_VERSION = 1.1
>> +LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
>> +LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download/
>
>Please add LIBFTDI1_LICENSE and LIBFTDI1_LICENSE_FILES.

ok, i have added:
IBFTDI1_LICENSE = LGPL2.1 GPL2
LIBFTDI1_LICENSE_FILES = COPYING


>
>> +LIBFTDI1_INSTALL_STAGING = YES
>> +LIBFDTI1_CONF_OPT = --without-examples
>> +LIBFTDI1_DEPENDENCIES = libusb-compat libusb libconfuse
>> +
>> +# configure detect it automaticaly so we need to force it
>> +ifeq ($(BR2_PACKAGE_LIBTFDI1_CPP),y)
>
>If you remove the option for C++ support, you could use:
>
>ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
>
>here. It will make sure C++ bindings are automatically built when the
>toolchain has C++ support.
>
>> +LIBFDTI_CONF_OPT += --enable-libftdipp
>> +else
>> +LIBFDTI_CONF_OPT += --disable-libftdipp
>> +endif
>> +
>> +$(eval $(cmake-package))
>
>Are you sure --{enable,disable}-libftdipp options are working for
>CMake? It doesn't look like the usual way of passing CMake
>configuration options, but maybe I'm missing something here.

No, i am not sure. I just can refere to the buildroot cmake example in the manual where LIBFOO_CONF_OPT is used:
http://buildroot.uclibc.org/downloads/manual/manual.html#_infrastructure_for_cmake_based_packages

yes, ifeq ($(BR2_INSTALL_LIBSTDCPP),y) is good..

>
>Thanks,
>
>Thomas
>-- 
>Thomas Petazzoni, CTO, Free Electrons
>Embedded Linux, Kernel and Android engineering
>http://free-electrons.com
>

Give me some time because i havent a working smtp-server connection at work. And i can not do an incremental patch - because i have deleted the copy of the repo where the patch was based on. I only can create a new patch and take your proposed git message for it. Is this ok for you or what should i do now?


Greets Dani
