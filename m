From: kei <kei-k@ca2.so-net.ne.jp>
Date: Sat, 26 Sep 2015 00:11:55 +0900
Subject: [Buildroot] [PATCH v12 1/1] squeezelite: new package
In-Reply-To: <6D94AAE5-54B4-437F-AB2F-24140A70E2D2@ca2.so-net.ne.jp>
References: <201509250304.t8P343dO012199@ms-omx03.plus.so-net.ne.jp>
 <5605101A.3090102@imgtec.com>
 <E0E50949-0251-4E06-9CAA-B48E7EC46B23@ca2.so-net.ne.jp>
 <6D94AAE5-54B4-437F-AB2F-24140A70E2D2@ca2.so-net.ne.jp>
Message-ID: <29D58222-45CC-4D6C-B6FF-7A9A54E5B935@ca2.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, s/root build/buildroot/

On 2015/09/26, at 0:07, kei <kei-k@ca2.so-net.ne.jp> wrote:

> Dear, Thomas.
> 
> I deeply appreciate if you can technically suggest me about following.
> (from the view point of right root build way).
> 
> Regards,
> Kawashima
> 
> 
>>> Hiroshi, there is one more little comment below; keep scrolling down.
>>> 
>>>>>> I think I reflected all feedbacks except TARGET_CONFIGURE_OPTS issue.
>>>>>> I'm not sure the right way to fix this, so would anyone suggest me?
>>>>> 
>>>>> TARGET_CONFIGURE_OPTS is a variable which defines PATH, CC, LD and more
>>>>> things. You can have a look at it in package/Makefile.in, line #247.
>>>>> 
>>>>> Instead of passing CC="$(TARGET_CC)" LD="$(TARGET_LD) to the make
>>>>> command, you could just pass $(TARGET_CONFIGURE_OPTS).
>>>>> 
>>>>> There is a comment at the end where I show you how to use it.
>>>> 
>>>> [snip]
>>>> 
>>>>>> +define SQUEEZELITE_BUILD_CMDS
>>>>>> +	$(TARGET_MAKE_ENV) $(MAKE) OPTS="$(SQUEEZELITE_MAKE_OPTS)" \
>>>>>> +		CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
>>>>> 
>>>>> Here is where you could use the $(TARGET_CONFIGURE_OPTS) variable:
>>>>> 
>>>>> 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
>>>>> 		OPTS="$(SQUEEZELITE_MAKE_OPTS)" -C $(@D) all
>>>>> 
>>>>> Perhaps using $(TARGET_CONFIGURE_OPTS) as environment variable would
>>>>> work as well, and since it also defines PATH, then $(TARGET_MAKE_ENV)
>>>>> wouldn't be needed:
>>>>> 
>>>>> 	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
>>>>> 		OPTS="$(SQUEEZELITE_MAKE_OPTS)" -C $(@D) all
>>>> Yes, I know basic usage of TARGET_CONFIGURE_OPTS as you explained,
>>>> thanks.
>>>> But just changing like this does not work with squeezelite's Makefile.
>>>> I included squeezelite's Makefile in last of this e-mail.
>>>> It determines optional libraries to be linked, I choose libsoxr as
>>>> example like this:
>>>> ...
>>>> CFLAGS  ?= -Wall -fPIC -O2 $(OPTS)
>>>> LDFLAGS ?= -lasound -lpthread -lm -lrt
>>>> ...
>>>> OPT_RESAMPLE= -DRESAMPLE
>>>> ...
>>>> LINKALL_RESAMPLE = -lsoxr
>>>> ...
>>>> ifneq (,$(findstring $(OPT_RESAMPLE), $(CFLAGS)))
>>>>      LDFLAGS += $(LINKALL_RESAMPLE)
>>>> endif
>>>> ...
>>>> $(EXECUTABLE): $(OBJECTS)
>>>> 	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
>>>> ...
>>>> .c.o:
>>>> 	$(CC) $(CFLAGS) $(CPPFLAGS) $< -c -o $@
>>>> ...
>>>> 
>>>> But TARGET_CONFIGURE_OPTS override CFLAGS, LDFLAGS, etc.
>>>> It results original Makefile logic does not work.
>>>> Can you suggest me right way (of buildroot) how to solve this ?
>>>> How should I control final CFLAGS, LDFLAGS, etc from squeezelite.mk
>>>> file ?
>>> 
>>> Well, if it doesn't work, then I guess is fine doing it by passing
>>> CC="$(TARGET_CC)" and LD="$(TARGET_LD)" as you already do.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
