From: Brendan Heading <brendanheading@gmail.com>
Date: Sat, 22 Aug 2015 22:45:24 +0100
Subject: [Buildroot] [PATCH] package/canfestival: fix build with musl
In-Reply-To: <20150822213815.GA3861@free.fr>
References: <1440279318-19132-1-git-send-email-yann.morin.1998@free.fr>
 <20150822213815.GA3861@free.fr>
Message-ID: <CA+BsyQ5AaMkDCb7Ldnu5u9ZArNe0swiAhKwxsRgES6RdrxTVoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

I submitted a patch similar to this about a week ago. Not sure if you
spotted it or not.

When signal() is being used (as it will be when __UCLIBC__ is defined)
the handler should take an int as a parameter, not a sigval_t.

I was going to take this up with the developers as I can't see a good
reason why the behaviour is different for uclibc and non-uclibc
environments, and in any case CLOCK_REALTIME is almost certainly not
what they want. But I haven't had a spare moment to write a test case
to prove that the timer code used in the non-uclibc version would work
just as well under uclibc.

regards

Brendan



On 22 August 2015 at 22:38, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Hello All!
>
> On 2015-08-22 23:35 +0200, Yann E. MORIN spake thusly:
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Damn, I forgot the autobuilder refs:
>
> Fixes:
>     http://autobuild.buildroot.org/results/8eb/8ebb38f4b1ab4d1eadf7139e3467ed59ccb10646/
>     http://autobuild.buildroot.org/results/0da/0dac4c0639d75540e004d0fdd0ac6cd9fb9c7ef0/
>     http://autobuild.buildroot.org/results/75a/75aa6e7e4f3dcd74e4b65496060328ec7bd0e747/
>     ...
>
> Regards,
> Yann E. MORIN.
>
>> ---
>>  package/canfestival/0003-sigval-musl.patch | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>  create mode 100644 package/canfestival/0003-sigval-musl.patch
>>
>> diff --git a/package/canfestival/0003-sigval-musl.patch b/package/canfestival/0003-sigval-musl.patch
>> new file mode 100644
>> index 0000000..7a4dadf
>> --- /dev/null
>> +++ b/package/canfestival/0003-sigval-musl.patch
>> @@ -0,0 +1,20 @@
>> +timers/unix: fix build with musl
>> +
>> +sigval_t is a glibcism, which is not defined in musl.
>> +
>> +Use the union instead.
>> +
>> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> +
>> +diff -durN a/drivers/timers_unix/timers_unix.c b/drivers/timers_unix/timers_unix.c
>> +--- a/drivers/timers_unix/timers_unix.c      2014-06-12 14:07:16.000000000 +0200
>> ++++ b/drivers/timers_unix/timers_unix.c      2015-08-22 23:12:26.921455179 +0200
>> +@@ -33,7 +33,7 @@
>> +     }
>> + }
>> +
>> +-void timer_notify(sigval_t val)
>> ++void timer_notify(union sigval val)
>> + {
>> +     if(gettimeofday(&last_sig,NULL)) {
>> +             perror("gettimeofday()");
>> --
>> 1.9.1
>>
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
