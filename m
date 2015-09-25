From: =?utf-8?B?5bed5bO2IOa1qQ==?= <kei-k@ca2.so-net.ne.jp>
Date: Fri, 25 Sep 2015 18:28:48 +0900
Subject: [Buildroot] [PATCH v12 1/1] squeezelite: new package
In-Reply-To: <5605101A.3090102@imgtec.com>
References: <201509250304.t8P343dO012199@ms-omx03.plus.so-net.ne.jp>
 <5605101A.3090102@imgtec.com>
Message-ID: <E0E50949-0251-4E06-9CAA-B48E7EC46B23@ca2.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear, all.

>> Hmm...
>> I have been working on my cached source, so I did not realize it.
>> Yes, I can reproduce your problem with real clean buildroot tree.
>> Maybe something changed https://code.google.com/p/squeezelite repo
>> since my last fetch.
>> I'm considering to change SQUEEZELITE_SITE to github repo like:
>> https://github.com/sixeyed/squeezelite
>> Does this repo work for you too ?
> 
> the fact that it works or not is not the problem. The problem is that
> right now there isn't any official repository for that project, so that
> repository could disappear tomorrow. And I don't know if the owner of
> that repository has made any change to the source code or not.
> 
> Perhaps downloading the tarballs from Google Code and putting them in
> mirror.buildroot.org would be the best option. I have added Peter and
> Thomas on CC so they can tell their opinion about this issue.
> 

Of course, I know what is the essential problem, do not kidding me.

If buildroot can host it, I appreciate.

> Hiroshi, there is one more little comment below; keep scrolling down.
> 
>>>> I think I reflected all feedbacks except TARGET_CONFIGURE_OPTS issue.
>>>> I'm not sure the right way to fix this, so would anyone suggest me?
>>> 
>>> TARGET_CONFIGURE_OPTS is a variable which defines PATH, CC, LD and more
>>> things. You can have a look at it in package/Makefile.in, line #247.
>>> 
>>> Instead of passing CC="$(TARGET_CC)" LD="$(TARGET_LD) to the make
>>> command, you could just pass $(TARGET_CONFIGURE_OPTS).
>>> 
>>> There is a comment at the end where I show you how to use it.
>> 
>> [snip]
>> 
>>>> +define SQUEEZELITE_BUILD_CMDS
>>>> +	$(TARGET_MAKE_ENV) $(MAKE) OPTS="$(SQUEEZELITE_MAKE_OPTS)" \
>>>> +		CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
>>> 
>>> Here is where you could use the $(TARGET_CONFIGURE_OPTS) variable:
>>> 
>>> 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
>>> 		OPTS="$(SQUEEZELITE_MAKE_OPTS)" -C $(@D) all
>>> 
>>> Perhaps using $(TARGET_CONFIGURE_OPTS) as environment variable would
>>> work as well, and since it also defines PATH, then $(TARGET_MAKE_ENV)
>>> wouldn't be needed:
>>> 
>>> 	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
>>> 		OPTS="$(SQUEEZELITE_MAKE_OPTS)" -C $(@D) all
>> Yes, I know basic usage of TARGET_CONFIGURE_OPTS as you explained,
>> thanks.
>> But just changing like this does not work with squeezelite's Makefile.
>> I included squeezelite's Makefile in last of this e-mail.
>> It determines optional libraries to be linked, I choose libsoxr as
>> example like this:
>> ...
>> CFLAGS  ?= -Wall -fPIC -O2 $(OPTS)
>> LDFLAGS ?= -lasound -lpthread -lm -lrt
>> ...
>> OPT_RESAMPLE= -DRESAMPLE
>> ...
>> LINKALL_RESAMPLE = -lsoxr
>> ...
>> ifneq (,$(findstring $(OPT_RESAMPLE), $(CFLAGS)))
>>        LDFLAGS += $(LINKALL_RESAMPLE)
>> endif
>> ...
>> $(EXECUTABLE): $(OBJECTS)
>> 	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
>> ...
>> .c.o:
>> 	$(CC) $(CFLAGS) $(CPPFLAGS) $< -c -o $@
>> ...
>> 
>> But TARGET_CONFIGURE_OPTS override CFLAGS, LDFLAGS, etc.
>> It results original Makefile logic does not work.
>> Can you suggest me right way (of buildroot) how to solve this ?
>> How should I control final CFLAGS, LDFLAGS, etc from squeezelite.mk
>> file ?
> 
> Well, if it doesn't work, then I guess is fine doing it by passing
> CC="$(TARGET_CC)" and LD="$(TARGET_LD)" as you already do.

Really, you accept it ?
Anyway it is not so easy anyway that keeping consistency with toolchains.

Kawashima
