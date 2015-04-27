From: Marcin Bis <marcin@bis.org.pl>
Date: Mon, 27 Apr 2015 21:46:26 +0200
Subject: [Buildroot] [PATCH] cc-tool: new package
In-Reply-To: <20150427173126.23797992@free-electrons.com>
References: <1430142129-32750-1-git-send-email-marcin@bis.org.pl>
 <20150427173126.23797992@free-electrons.com>
Message-ID: <553E9212.4090805@bis.org.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thank you for comments.

On 04/27/2015 05:31 PM, Thomas Petazzoni wrote:
> Dear Marcin Bis,
>
> Thanks for this contribution! See some comment sbelow.
>
> On Mon, 27 Apr 2015 15:42:09 +0200, Marcin Bis wrote:
>> cc-tool provides support for Texas Instruments CC Debugger
>>
>> Signed-off-by: Marcin Bis <marcin@bis.org.pl>
>
> It is not entirely clear: is it a tool you run on your target device,
> or on your host/development machine?
>
> Your package is for the target, but I would intuitively expect a
> debugger to run on the host/development machine. How does it work?

cc-tool is used for interacting with Texas Instrument's Debugger and 
Programmer for RF System-on-Chips.
http://www.ti.com/tool/cc-debugger

The device is used for programming (and debugging) firmware on various 
TI Low Power RF System-on-Chips (based on 8051 microcontrolers).

I am using it for re-flashing such chips from ARM-based embedded devices 
(running Buildroot generated os) - so I put it under "tools for target" 
category.

TI chips do not have sufficient resources to run Linux on them, so 
adding cc-tool as a host tools in Buildroot does not make sense (in my 
opinion) - the tool has no use on Buildroot generated images.

>> diff --git a/package/cc-tool/Config.in b/package/cc-tool/Config.in
>> new file mode 100644
>> index 0000000..f62200d
>> --- /dev/null
>> +++ b/package/cc-tool/Config.in
>> @@ -0,0 +1,21 @@
>> +config BR2_PACKAGE_CC_TOOL
>> +	bool "cc-tool"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>> +	depends on BR2_LARGEFILE
>> +	select BR2_PACKAGE_LIBUSB
>> +	select BR2_PACKAGE_BOOST
>> +	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
>> +	select BR2_PACKAGE_BOOST_SYSTEM
>> +	select BR2_PACKAGE_BOOST_REGEX
>> +	select BR2_PACKAGE_BOOST_FILESYSTEM
>> +	select BR2_PACKAGE_BOOST_SIGNALS
>
> So you're selecting libusb and boost here.
>
>> +	help
>> +	  cc-tool provides support for Texas Instruments CC Debugger
>> +	  for Linux OS in order to program 8051-based System-On-Chip
>> +	  devices: CC254x CC253x CC243x CC251x CC111x
>> +
>> +	  http://sourceforge.net/projects/cctool/
>> +
>> +comment "cc-tool needs a toolchain w/ C++, largefile, threads"
>> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
>> diff --git a/package/cc-tool/cc-tool.hash b/package/cc-tool/cc-tool.hash
>> new file mode 100644
>> index 0000000..81844ee
>> --- /dev/null
>> +++ b/package/cc-tool/cc-tool.hash
>> @@ -0,0 +1,3 @@
>> +# From http://sourceforge.net/projects/cctool/files/
>> +sha1 f313e55f019ea5338438633f5b5e689b699343e1  cc-tool-0.26-src.tgz
>> +md5 26960676f3e6264e612c299fbf8ec5ea  cc-tool-0.26-src.tgz
>> diff --git a/package/cc-tool/cc-tool.mk b/package/cc-tool/cc-tool.mk
>> new file mode 100644
>> index 0000000..9a6ee6e
>> --- /dev/null
>> +++ b/package/cc-tool/cc-tool.mk
>> @@ -0,0 +1,13 @@
>> +################################################################################
>> +#
>> +# cc-tool
>> +#
>> +################################################################################
>> +
>> +CC_TOOL_VERSION = 0.26
>> +CC_TOOL_SITE = http://downloads.sourceforge.net/project/cctool
>> +CC_TOOL_SOURCE = cc-tool-$(CC_TOOL_VERSION)-src.tgz
>> +CC_TOOL_LICENSE = GPLv2
>> +CC_TOOL_LICENSE_FILES = COPYING
>
> But you don't depend on them anywhere here. So you are not guaranteed
> that they will be built before cc-tool.

Fixing this.

>> +
>> +$(eval $(autotools-package))
>
> Other than that, looks good. I've checked the license info, it looks
> good to me. The configure script doesn't provide any option for
> optional things, so it looks alright.
>
> Thanks!
>
> Thomas
>

-- 
   Marcin Bis
