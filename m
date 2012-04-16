From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 16 Apr 2012 23:19:30 +0200
Subject: [Buildroot] [RFC v2 16/31] linux: define license
In-Reply-To: <CAAXf6LX8JkXWzHAkYV8J74sYDhsFPRJ=OdYxiB4+6PxRswx3MA@mail.gmail.com>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
 <1331153911-22277-17-git-send-email-luca@lucaceresoli.net>
 <201203072249.40319.yann.morin.1998@free.fr>
 <4F5A2E6C.9030202@lucaceresoli.net>
 <CAAXf6LX8JkXWzHAkYV8J74sYDhsFPRJ=OdYxiB4+6PxRswx3MA@mail.gmail.com>
Message-ID: <4F8C8CE2.3000702@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire wrote:

> On Fri, Mar 9, 2012 at 5:23 PM, Luca Ceresoli<luca@lucaceresoli.net>  wrote:
>> Yann E. MORIN wrote:
>>> Lucas, All,
>>>
>>> On Wednesday 07 March 2012 21:58:16 Luca Ceresoli wrote:
>>>> Signed-off-by: Luca Ceresoli<luca@lucaceresoli.net>
>>>> ---
>>>>   linux/linux.mk |    2 ++
>>>>   1 files changed, 2 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/linux/linux.mk b/linux/linux.mk
>>>> index ae236d4..e6f2388 100644
>>>> --- a/linux/linux.mk
>>>> +++ b/linux/linux.mk
>>>> @@ -4,6 +4,8 @@
>>>>   #
>>>>
>>>>   ###############################################################################
>>>>   LINUX_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
>>>> +LINUX_LICENSE = GPLv2-ONLY
>>> What's the point of giving the version 'v2' and stating 'only'?
>>> I would rather see:
>>>    values        meaning
>>>    -------------------------------
>>>    GPLv2         GPLv2 only
>>>    GPLv2+        GPLv2 or later
>>>    LGPLv2.1      LGPLv2.1 only
>>>    LGPLv2.1+     LGPLv2.1 or later
>>>    ...           ...
>> When a project is GPL-licensed, it usually means it uses "either version X
>> of
>> the License, or (at your option) any later version". There are rare cases
>> (Linux, Busybox, any other?) chose to use a specific version, no later
>> version.
>>
>> So the "default" meaning of "GPLvX" is "GPL version X or later". Those rare
>> cases that allow no upgrade are distinguished by adding "only".
> I'm not sure this is correct. According to me, if the license file
> just specifies GPL version 2, then it really is only version 2.
> Only if the license file specifies the text 'or any later version, at
> your option', then it is GPLv2+.
>
> I think the distinction GPLv2 / GPLv2+ / GPLv3 / GPLv3+ etc. is
> common, and can be reused.
> So I agree with Yann here.
Ouch, you're right guys. And so I went back to read the original licenses once
more...

This is what the GPLv2 states (LGPLv2.0 is substantially equal):
>  Each version is given a distinguishing version number.  If the Program
>  specifies a version number of this License which applies to it and "any
>  later version", you have the option of following the terms and conditions
>  either of that version or of any later version published by the Free
>  Software Foundation.  If the Program does not specify a version number of
>  this License, you may choose any version ever published by the Free Software
>  Foundation.

So there are indeed three cases:
  1. the Program specifies a version ->  GPLv2 only
  2. the Program specifies a version or "any later version" ->  GPLv2+
  3. the Program does not specify a version ->  how to name this, simply GPL?

Let's take a real case: tslib.

The source files in src/ state:
>   * This file is placed under the LGPL.  Please see the file
>   * COPYING for more details.
and the COPYING file in the root tslib directory contains an LGPL v2.0
license. The Program does not explicitly specify a version, but a specific
version is present in COPYING. Is this case 1 or case 3? I think the comment
in the source file rules, but it's only a feeling.

OTOH, most source files in tests/ state:
>   * This file is placed under the GPL.  Please see the file
>   * COPYING for more details.
and there is no COPYING file carrying any GPL in the whole tslib distribution!
So this must be case 3 (and we must assume that GPL means GNU General Public
License, although a good lawyer may certainly prove it means any other thing
from http://en.wikipedia.org/wiki/GPL_%28disambiguation%29).

This should be taken into account by Buildroot, which builds and installs both
the library and the test programs.

Another example: busybox.

This is a messy as well. The LICENSE file carries this heading:
>  --- A note on GPL versions
>
>  BusyBox is distributed under version 2 of the General Public License (included
>  in its entirety, below).  Version 2 is the only version of this license which
>  this version of BusyBox (or modified versions derived from this one) may be
>  distributed under.
>
>  ------------------------------------------------------------------------
>  		GNU GENERAL PUBLIC LICENSE
>  		Version 2, June 1991

That looks clear, but many source files seem to disagree:
$ head coreutils/uname.c
>   * Licensed under GPLv2 or later, see file LICENSE in this source tree.

And this is not a lone spot:
$ grep  -irE 'GPLv2 or later' . |wc
     358    5000   34106
$ grep  -irwE 'GPLv2' . | grep -iv later|wc
     241    2797   20656
GPLv2+ beats GPLv2 (only)!

I checked four packages in detail, and two of them have an unclear choice of
GPL version. I can't stand any more headache tonight, and I'm not sure I'll
have more luck with other packages. This is so frustrating...

Luca
