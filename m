From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Feb 2017 12:06:16 +0100
Subject: [Buildroot] [PATCH 3/3] gstreamer1: drop unused configure time
 unaligned access handling logic
In-Reply-To: <87a89ju5r1.fsf@dell.be.48ers.dk>
References: <20170218092550.29810-1-peter@korsgaard.com>
 <20170218092550.29810-3-peter@korsgaard.com>
 <20170218094242.GA3632@free.fr> <87a89ju5r1.fsf@dell.be.48ers.dk>
Message-ID: <20170218110616.GC3632@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-02-18 11:56 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Peter, All,
>  > On 2017-02-18 10:25 +0100, Peter Korsgaard spake thusly:
>  >> gstreamer has moved to build time unaligned access support detection using
>  >> ifdefs in gstconfig.h since 1.9.2:
>  >> 
>  >> commit 6ef601367e0f5adb7a8b02cec94dec04fccf701a
>  >> Author: Nirbheek Chauhan <nirbheek@centricular.com>
>  >> Date:   Tue Jun 21 18:59:49 2016 +0530
>  >> 
>  >> gstconfig.h: Detect unaligned access support at compile-time
>  >> 
>  >> This makes gstconfig.h completely arch-independent. Should cover all
>  >> compilers that gstreamer is known to build on, and all architectures
>  >> that I could find information on. People are encouraged to file bugs if
>  >> their platform/arch is missing.
>  >> 
>  >> So ac_cv_unaligned_access is no longer used and our logic can be removed.
> 
>  > In the previous patch, you add the or1k conditions to the if-block, but
>  > it is unused and you remove it here.
> 
>  > So I think this patch should come before you fix or1k, i.e. swap patches
>  > 2 and 3, no?
> 
> No, I think you are mixing up gstreamer and gstreamer1.

No, I don't think so...

> Patch 1 fixes gstreamer by adding or1k to the configure handling
> Patch 2 fixes gstreamer1 by adding a patch fixing gst/gstconfig.h

Here you patch package/gstreamer1/gstreamer1/gstreamer1.mk to also
apply the as_cv_unaligned_access=no in the or1k case, but...

> Patch 3 cleans up gstreamer1 by removing the unused configure handling

... you remove it right here, in patch 3, since that passing
as_cv_unaligned_access=no no longer works anyway.

So I question the fact that patch 2 is wrong (at least partly useless)
in passing as_cv_unaligned_access=no when it is not used.

So, I would argue that we should do:

Patch 1 fixes gstreamer by adding or1k to the configure handling
Patch 3 cleans up gstreamer1 by removing the unused configure handling
Patch 2 fixes gstreamer1 by adding a patch fixing gst/gstconfig.h

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
