From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Thu, 19 Jun 2014 17:44:34 +0200
Subject: [Buildroot] [PATCH 0/3] Bump packages before adding libgtk3
In-Reply-To: <20140619143704.14a3fa8e@free-electrons.com>
References: <1403108345-12404-1-git-send-email-hadrien.boutteville@gmail.com>	<20140619080247.GA10736@pc-eric>
 <20140619143704.14a3fa8e@free-electrons.com>
Message-ID: <53A30562.3050005@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric, Thomas,

On Thu, 19 Jun 2014 14:37:04 +0200, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
> 
> On Thu, 19 Jun 2014 10:02:49 +0200, Eric Le Bihan wrote:
> 
>> I also have a WIP packaging for libgtk3 [1]
> 
> Aah, ok. Then please sync with Hadrien on how to upstream this and
> avoid duplicated work.

Great! I'm looking at your branch. You can find mine here:
https://github.com/Eksel/buildroot/tree/libgtk3
(warning, WIP, there are ugly commits and there will be some rebase soon
;-) ).

Apparently we did several things differently, like how to handle the
host-libgtk3 build (I just adapted the patch from libgtk2).

>> , but I have not sent the
>> patch because libgtk3 depends on at-spi2-core. This package performs
>> some non-cross-compilable checks in its configure script via this m4
>> macro, defined in acinclude.m4:
>>
>>   DBIND_CHECK_ALIGNOF(dbus_bool_t)
>>
>> It fails when cross-compiling because it relies on AC_TRY_RUN() [2].
>>
>> The only (ugly) solution I found was hardcoding some values depending
>> on the architecture [3]:
>>
>>   ifeq ($(BR2_i386), y)
>>   AT_SPI2_CORE_CONF_ENV = ac_cv_alignof_char=1 \
>>   	ac_cv_alignof_double=4 \
>>   	ac_cv_alignof_dbind_pointer=4 \
>>   	ac_cv_alignof_dbind_struct=1 \
>>   	ac_cv_alignof_dbus_bool_t=4 \
>>   	ac_cv_alignof_dbus_int16_t=2 \
>>   	ac_cv_alignof_dbus_int32_t=4 \
>>   	ac_cv_alignof_dbus_int64_t=4
>>   endif
>>
>> How do you deal with this problem?
> 
> AC_CHECK_ALIGNOF() ?

Well, I didn't find (yet) the at-spi2-core dependency, so I don't have
this problem for now. I'm still resolving some configure errors.
It's a bit weird, there is no references to at-spi2-* neither in the
documentation nor in the configure.

Best regards,

Hadrien
