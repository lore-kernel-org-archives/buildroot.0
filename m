From: Martin Bark <martin@barkynet.com>
Date: Tue, 05 Aug 2014 21:51:10 +0100
Subject: [Buildroot] [PATCH 2/3] caps: new package
In-Reply-To: <20140804222855.6cb14837@free-electrons.com>
References: <1398374384-8814-1-git-send-email-martin@barkynet.com>	<1398374384-8814-2-git-send-email-martin@barkynet.com>
 <20140804222855.6cb14837@free-electrons.com>
Message-ID: <53E143BE.3050401@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thanks for the feedback


On 04/08/14 21:28, Thomas Petazzoni wrote:
> Dear Martin Bark,
>
> Thanks for your contribution, and sorry for the slow feedback. Some
> comments below.
>
> On Thu, 24 Apr 2014 22:19:43 +0100, Martin Bark wrote:
>
>> diff --git a/package/Config.in b/package/Config.in
>> index 5956154..33d16ac 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -491,6 +491,7 @@ menu "Libraries"
>>   menu "Audio/Sound"
>>   source "package/alsa-lib/Config.in"
>>   source "package/audiofile/Config.in"
>> +source "package/caps/Config.in"
>
> This will have to be rebased on top of the latest master.

will do

>
>> new file mode 100644
>> index 0000000..28ff332
>> --- /dev/null
>> +++ b/package/caps/Config.in
>> @@ -0,0 +1,12 @@
>> +config BR2_PACKAGE_CAPS
>> +	bool "caps"
>
> Missing dependency on C++ in toolchain. Also, this package uses
> ladspa.h, so surely it should select BR2_PACKAGE_LADSPA_SDK, no?

I'll fix the c++ dependency issue.  As per my other email caps includes 
a copy of the ladsp-sdk header hence it's not a dependency.

>
>> diff --git a/package/caps/caps-01-cross-compile-fix.patch b/package/caps/caps-01-cross-compile-fix.patch
>> new file mode 100644
>> index 0000000..4667191
>> --- /dev/null
>> +++ b/package/caps/caps-01-cross-compile-fix.patch
>
> Missing description + Signed-off-by line.
>
>> diff --git a/package/caps/caps.mk b/package/caps/caps.mk
>> new file mode 100644
>> index 0000000..d642bc8
>> --- /dev/null
>> +++ b/package/caps/caps.mk
>> @@ -0,0 +1,21 @@
>> +################################################################################
>> +#
>> +# caps
>> +#
>> +################################################################################
>> +
>> +CAPS_VERSION = 0.9.23
>> +CAPS_SOURCE = caps_$(CAPS_VERSION).tar.bz2
>> +CAPS_SITE = http://quitte.de/dsp/
>> +CAPS_LICENSE = GPLv3
>> +CAPS_LICENSE_FILES = COPYING
>
> CAPS_DEPENDENCIES = ladspa-sdk
>
> maybe ?

As above

>
>> +
>> +define CAPS_BUILD_CMDS
>> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
>
> We normally try to pass $(TARGET_CONFIGURE_OPTS) on the right hand side
> of $(MAKE), and we pass $(TARGET_MAKE_ENV) on the left hand side of
> make.

I'll fix that

>
>> +define CAPS_INSTALL_TARGET_CMDS
>> +	$(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
>
> $(TARGET_MAKE_ENV) on the left hand side, and DESTDIR passed before
> 'install' would be preferred here.

I'll fix that too

>
> Otherwise, looks good.
>
> Thanks,
>
> Thomas
>

Thanks

Martin
