From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 15 Aug 2018 20:06:27 +0200
Subject: [Buildroot] [RFC PATCH 1/2] perl-template-toolkit: new package
In-Reply-To: <CALURroTkML0n-QzKh-nNsLC6h9Qje=txZo6qy9UBHqy1UF7ZFA@mail.gmail.com>
References: <20180813175645.11088-1-chrismcc@gmail.com>
 <20180813175645.11088-2-chrismcc@gmail.com>
 <CAB0FRste31CaZoHAOhgNY3Ho8_4QRrjBVOZWKqbmW9a4XyUy-Q@mail.gmail.com>
 <CALURroTkML0n-QzKh-nNsLC6h9Qje=txZo6qy9UBHqy1UF7ZFA@mail.gmail.com>
Message-ID: <CAB0FRsvXvNu_8RgvUrUz7LHhV6tHymRT9BDMBtSZok0W6q7JHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-08-15 14:03 GMT+02:00 Christopher McCrory <chrismcc@gmail.com>:

> hello
>
> On Mon, Aug 13, 2018 at 9:21 PM, Fran?ois Perrad <francois.perrad@gadz.org
> > wrote:
>
>>
>>
>> 2018-08-13 19:56 GMT+02:00 Christopher McCrory <chrismcc@gmail.com>:
>>
>>> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
>>> ---
>>>
>>>
> <snip>
>
>
>> +# There has got to be a better way... :(
>>> +# Some arguments to Makefile.PL do not get propagated to subdirectories
>>> +# similar to:
>>> +# https://rt.cpan.org/Public/Bug/Display.html?id=28632
>>> +define PERL_TEMPLATE_TOOLKIT_POST_CONFIGURE_SED
>>> +        $(SED) "s:^AR = .*:AR = $(TARGET_AR):g" $(@D)/xs/Makefile
>>> +        $(SED) "s:^FULL_AR = .*:FULL_AR = $(TARGET_AR):g"
>>> $(@D)/xs/Makefile
>>> +        $(SED) "s:^CC = .*:CC = $(TARGET_CC):g" $(@D)/xs/Makefile
>>> +        $(SED) "s:^CCFLAGS = .*:CCFLAGS = $(TARGET_CFLAGS):g"
>>> $(@D)/xs/Makefile
>>> +        $(SED) "s:^LD = .*:LD = $(TARGET_CC):g" $(@D)/xs/Makefile
>>> +        $(SED) "s:^LDDLFLAGS = .*:LDDLFLAGS = -shared
>>> $(TARGET_LDFLAGS):g" $(@D)/xs/Makefile
>>> +        $(SED) "s:^LDLFLAGS = .*:LDLFLAGS = $(TARGET_LDFLAGS):g"
>>> $(@D)/xs/Makefile
>>> +        $(SED) "s:^DESTDIR = .*:DESTDIR = $(TARGET_DIR):g"
>>> $(@D)/xs/Makefile
>>> +endef
>>>
>>
>> If you put this block of code in a function (in pkg-perl.mk) with the
>> filename as parameter,
>> you could just call it, in each module
>>     define PERL_TEMPLATE_TOOLKIT_POST_CONFIGURE_SED
>>          $(call,foo,$(@D)/xs/Makefile)
>>     endef
>>
>>
> My makefile skills aren't good enough to handle the subtleties of the
> entire buildroot process.  Is that something you want to handle?  Or use
> these as is until someone has some time to work on the pkg-perl.mk bits?
> Or other?
>
>
It is just like that :

define patch_sub_makefile
    $(SED) "s:^AR = .*:AR = $(TARGET_AR):g" $(1)
    $(SED) "s:^FULL_AR = .*:FULL_AR = $(TARGET_AR):g" $(1)
    $(SED) "s:^CC = .*:CC = $(TARGET_CC):g" $(1)
    $(SED) "s:^CCFLAGS = .*:CCFLAGS = $(TARGET_CFLAGS):g" $(1)
    $(SED) "s:^LD = .*:LD = $(TARGET_CC):g" $(1)
    $(SED) "s:^LDDLFLAGS = .*:LDDLFLAGS = -shared $(TARGET_LDFLAGS):g" $(1)
    $(SED) "s:^LDLFLAGS = .*:LDLFLAGS = $(TARGET_LDFLAGS):g" $(1)
    $(SED) "s:^DESTDIR = .*:DESTDIR = $(TARGET_DIR):g" $(1)
endef

define PERL_TEMPLATE_TOOLKIT_POST_CONFIGURE_SED
    $(call patch_sub_makefile,$(@D)/xs/Makefile)
endef

Fran?ois



> Thanks for looking at all these packages I sent.
>
>
>> Fran?ois
>>
>>
>>> +
>>> +PERL_TEMPLATE_TOOLKIT_POST_CONFIGURE_HOOKS +=
>>> PERL_TEMPLATE_TOOLKIT_POST_CONFIGURE_SED
>>> +
>>> +
>>> +$(eval $(perl-package))
>>> --
>>> 2.14.4
>>>
>>>
>>
>
>
> --
> Christopher McCrory
> To the optimist, the glass is half full.
> To the pessimist, the glass is half empty.
> To the engineer, the glass is twice as big as it needs to be.
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180815/f15391c5/attachment.html>
