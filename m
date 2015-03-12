From: =?UTF-8?B?0JDQu9C10LrRgdC10Lkg0JHRgNC+0LTQutC40L0=?= <alexey.brodkin@gmail.com>
Date: Thu, 12 Mar 2015 17:07:47 +0300
Subject: [Buildroot] [PATCH v4] linux-headers: allow use of headers from
 kernel "package" selected
In-Reply-To: <20150304233716.14233828@free-electrons.com>
References: <1425230275-127768-1-git-send-email-kaszak@gmail.com>
 <20150304233716.14233828@free-electrons.com>
Message-ID: <CAML3pwUy9N3QFsfhS16MvOViO6SDvRKYAoj2m3Jvgs2v6G4Nzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2015-03-05 1:37 GMT+03:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Karoly Kasza,
>
> On Sun,  1 Mar 2015 18:17:55 +0100, Karoly Kasza wrote:
>> diff --git a/linux/linux.mk b/linux/linux.mk
>> index 0b8c912..29d93db 100644
>> --- a/linux/linux.mk
>> +++ b/linux/linux.mk
>> @@ -8,6 +8,9 @@ LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
>>  LINUX_LICENSE = GPLv2
>>  LINUX_LICENSE_FILES = COPYING
>>
>> +# Compute variables as a function, so linux-headers can call it when needed
>> +define BR2_LINUX_COMPUTE_VARS
>> +
>>  # Compute LINUX_SOURCE and LINUX_SITE from the configuration
>>  ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
>>  LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
>> @@ -40,6 +43,10 @@ LINUX_SITE := $(LINUX_SITE)/testing/
>>  endif # -rc
>>  endif
>>
>> +endef
>> +
>> +$(eval $(BR2_LINUX_COMPUTE_VARS))
>
> I know this is not going to be a very useful answer, but I must say I
> don't really like this <foo>_COMPUTE_VARS solution :-/
>
> I unfortunately don't have many solutions to offer to solve this
> problem.

But why not? I mean this change looks very small and clean, it doesn't
introduce a lot of code and new unclear logic.

As long as it works I'm all for getting it applied finally.

I do understand that this is rarely needed functionality because ABI
changes not that often (and ABI is the only reason we need headers),
but I may understand corner-cases especially during kernel development
and especially on upstreaming process that we [ARC] were recently
through.

There was a period of time we had 3 ABIs in use. If of any interest
please refer to this article -
https://github.com/foss-for-synopsys-dwc-arc-processors/linux/wiki/ARC-Linux-Syscall-ABI-Compatibility

So you may imagine how helpful it could be to have proposed option in
some situations :)

-Alexey
