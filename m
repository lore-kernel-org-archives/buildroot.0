From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Wed, 09 Jul 2008 09:54:43 +0200
Subject: [Buildroot] uClibc missing limits.h
In-Reply-To: <20080703080557.GA29943@mx.loc>
References: <485F9581.2040204@cetrtapot.si> <486B4357.8060908@cetrtapot.si>
	<3E421C7434714D94B87F0D1F52CDEA8D@aeglos>
	<486C7A22.8000604@cetrtapot.si> <20080703080557.GA29943@mx.loc>
Message-ID: <48746EC3.2020008@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Thu, Jul 03, 2008 at 09:05:06AM +0200, Hinko Kocevar wrote:
>> Ulf Samuelsson wrote:
>>>
>>>> Hinko Kocevar wrote:
>>>>> Bernhard Fischer wrote:
>>>>>> On Mon, Jun 23, 2008 at 02:22:25PM +0200, Hinko Kocevar wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> I've found a way for uClibc to find headers that are not in the
>>>>>>> $(shell $CC -print-file-name=include), but in $(shell $CC
>>>>>>> -print-file-name=include)-fixed.
>>>>>>> According to
>>>>>>> http://sourceware.org/ml/libc-alpha/2007-03/msg00017.html LIBC
>>>>>>> should also look in other gcc provided header directories (eg.
>>>>>>> include-fixed) instead only relying on 'include' to contain all
>>>>>>> correct headers.
>>>>>>>
>>>>>>> Below is uClibc patch for this (tested on cris).
>>>>>> Well, that's not really correct since the default search path already
>>>>>> should to be
>>>>>> $target_triple/$ver/include \
>>>>>> $target_triple/$ver/include-fixed \
>>>>>>
>>> Removing "-nostdinc" from CFLAGS in "uClibc-0.9.29/Rules.mak"
>>> allows the ARM compilation to continue,
>> But is this OK?
> 
> no.

Looking at the gcc manual "-nostdinc" causes compiler to omit the standard include directories:
-nostdinc
    Do not search the standard system directories for header files. Only the directories you have specified with -I options (and the directory of the current file, if appropriate) are searched.

IMHO, only when compiling uClibc we need to worry about the "-nostdinc" flag hence we should add -I directive to the compiler flags as suggested by the manual and solve the missing limits.h problem.

Or we could use "-isystem" flag:

-isystem dir
    Search dir for header files, after all directories specified by -I but before the standard system directories. Mark it as a system directory, so that it gets the same special treatment as is applied to the standard system directories. If dir begins with =, then the = will be replaced by the sysroot prefix; see --sysroot and -isysroot. 

Best regards,
Hinko

PS.: Now I know what -I=dir stands for :)

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
