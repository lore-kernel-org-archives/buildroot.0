From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Thu, 03 Jul 2008 09:05:06 +0200
Subject: [Buildroot] uClibc missing limits.h
In-Reply-To: <3E421C7434714D94B87F0D1F52CDEA8D@aeglos>
References: <485F9581.2040204@cetrtapot.si>
	<20080623131648.GE8920@mx.loc><4860D71A.4060104@cetrtapot.si>
	<486B4357.8060908@cetrtapot.si>
	<3E421C7434714D94B87F0D1F52CDEA8D@aeglos>
Message-ID: <486C7A22.8000604@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
> 
> 
>> Hinko Kocevar wrote:
>>> Bernhard Fischer wrote:
>>>> On Mon, Jun 23, 2008 at 02:22:25PM +0200, Hinko Kocevar wrote:
>>>>> Hi,
>>>>>
>>>>> I've found a way for uClibc to find headers that are not in the
>>>>> $(shell $CC -print-file-name=include), but in $(shell $CC
>>>>> -print-file-name=include)-fixed.
>>>>> According to
>>>>> http://sourceware.org/ml/libc-alpha/2007-03/msg00017.html LIBC
>>>>> should also look in other gcc provided header directories (eg.
>>>>> include-fixed) instead only relying on 'include' to contain all
>>>>> correct headers.
>>>>>
>>>>> Below is uClibc patch for this (tested on cris).
>>>> Well, that's not really correct since the default search path already
>>>> should to be
>>>> $target_triple/$ver/include \
>>>> $target_triple/$ver/include-fixed \
>>>>
> 
> Removing "-nostdinc" from CFLAGS in "uClibc-0.9.29/Rules.mak"
> allows the ARM compilation to continue,

But is this OK?

> but it again bombs since the function "testandset" has multiple
> definitions.
> Detected in libc_pthread_init.c and rpc_thread.c.
> It is "first defined" in "forward.c"

I guess this would be the problem in uClibc-0.9.29/libpthread/linuxthreads.old/sysdeps/arm/pt-machine.h.

Dirty hack (works on cris arch), change:
# define PT_EI extern inline

to

# define PT_EI static inline


Regards,
Hinko


-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
