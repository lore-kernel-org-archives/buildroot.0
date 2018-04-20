From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 20 Apr 2018 00:23:13 -0300 (BRT)
Subject: [Buildroot] modem-manager: build issue
In-Reply-To: <1730967127.450971.1524062022318.JavaMail.zimbra@datacom.ind.br>
References: <CAGm1_kusSpWv2dmQyzerpouB+LUvf84jZAi6rBMyZdieUUosow@mail.gmail.com>
 <1730967127.450971.1524062022318.JavaMail.zimbra@datacom.ind.br>
Message-ID: <1847604074.751187.1524194593095.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Carlos Santos" <casantos@datacom.ind.br>
> To: "Yegor Yefremov" <yegorslists@googlemail.com>
> Cc: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, "Aleksander Morgado" <aleksander@aleksander.es>,
> "buildroot" <buildroot@buildroot.org>
> Sent: Wednesday, April 18, 2018 11:33:42 AM
> Subject: Re: [Buildroot] modem-manager: build issue

>> From: "Yegor Yefremov" <yegorslists@googlemail.com>
>> To: "buildroot" <buildroot@buildroot.org>
>> Cc: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, "Carlos Santos"
>> <casantos@datacom.ind.br>, "Aleksander
>> Morgado" <aleksander@aleksander.es>
>> Sent: Wednesday, April 18, 2018 9:32:06 AM
>> Subject: modem-manager: build issue
> 
>> Current mm 1.6.12 produces following errors both when compiling an ARM
>> or MIPS target:
>> 
>>  CC       ModemManager-mm-base-modem.o
>> mm-base-manager.c: In function ?handle_set_logging?:
>> mm-base-manager.c:680:15: error: assignment from incompatible pointer
>> type [-Werror=incompatible-pointer-types]
>>     ctx->self = g_object_ref (manager);
>>               ^
>> mm-base-manager.c: In function ?handle_scan_devices?:
>> mm-base-manager.c:736:15: error: assignment from incompatible pointer
>> type [-Werror=incompatible-pointer-types]
>>     ctx->self = g_object_ref (manager);
>>               ^
>> mm-device.c: In function ?mm_device_get_plugin?:
>> mm-device.c:628:12: error: return from incompatible pointer type
>> [-Werror=incompatible-pointer-types]
>>     return (self->priv->plugin ?
>> 
>> So far I've seen only one build failure in our autobuilders [0]. I can
>> reproduce this error building mm 1.6.12 locally with my host GCC. But
>> the master branch of mm compiles without any issue. We don't seem to
>> be the only ones who is affected [1], [2].
>> 
>> Any ideas?
>> 
>> [0]
>> http://autobuild.buildroot.net/results/5d9e299ff12726d07e8a584a213c1d2a2e419594/
>> [1]
>> https://fedorapeople.org/groups/risc-v/logs/ModemManager-1.6.12-3.fc28.src.rpm/build.log
>> [2]
>> https://www.linuxquestions.org/questions/slackware-14/slackware-from-scratch-and-x11-4175560702/page19.html
>> 
>> Yegor
> 
> I'm quite busy right now but will try to reproduce the error tonight.

There is a macro defined in build/libglib2-2.56.1/gobject/gobject.h which
leads to the assignment errors:

  511 /* Make reference APIs type safe with macros */
  512 #define g_object_ref(Obj)      ((__typeof__(Obj)) (g_object_ref) (Obj))

The problem can be easily reproduced with this sample code:

$ cat /tmp/test.c
extern void *g_object_ref(void *);

/* Make reference APIs type safe with macros */
#define g_object_ref(Obj)      ((__typeof__(Obj)) (g_object_ref) (Obj))

extern double *new_double(int *);

double *new_double(int *ip) {
  double *dp;
  dp = g_object_ref(ip);
  return dp;
}

$ gcc -Wall -Werror -c /tmp/test.c -o /tmp/test.o
/tmp/test.c: In function ?new_context?:
/tmp/test.c:19:13: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
   ctx->self = g_object_ref(om);
             ^
cc1: all warnings being treated as errors

So in order to fix the build of ModemManager it would be necessary to either
compile it without -Werror (with the risk of letting undesired assignments
happen) or fix all the occurrences of the offending assignments.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
