From: Laurent Charpentier <laurent_pubs@yahoo.com>
Date: Mon, 29 Jan 2018 12:47:55 +0000 (UTC)
Subject: [Buildroot] missing dlfcn.h
In-Reply-To: <20180129113510.3id25hgvvw7quigw@sapphire.tkos.co.il>
References: <1543869406.2474659.1517222386735.ref@mail.yahoo.com>
 <1543869406.2474659.1517222386735@mail.yahoo.com>
 <20180129113510.3id25hgvvw7quigw@sapphire.tkos.co.il>
Message-ID: <1496840252.2526366.1517230075169@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,
Thank you very much for your answer.I've just sent a patch to fix the error (enforce dynamic linking usage).
Best Regards,Laurent

      From: Baruch Siach <baruch@tkos.co.il>
 To: Laurent Charpentier <laurent_pubs@yahoo.com> 
Cc: Buildroot <buildroot@buildroot.org>
 Sent: Monday, January 29, 2018 12:35 PM
 Subject: Re: [Buildroot] missing dlfcn.h
   
Hi Laurent,

On Mon, Jan 29, 2018 at 10:39:46AM +0000, Laurent Charpentier wrote:
> The non-regression builds show the following error for the "open-lldp" 
> package for 2 toolchains (br-arm-full-static, br-m68k-5208-full):
> 
> weak_readline.c:30:19: fatal error: dlfcn.h: No such file or directory
>? #include <dlfcn.h>
>? ? ? ? ? ? ? ? ? ? ^
> compilation terminated.
> 
> The "dlfcn.h" file is located under <toolchain>/sysroot/usr/include/dlfcn.h 
> for all toolchains except for the br-arm-full-static and br-m68k-5208-full 
> toolchains where the file does not exist.

That is because these toolchain can only produce static executables. The C 
library in these toolchain does not provide the dynamic linking interface 
(dlsym, dlopen, etc.). So the dlfcn.h header is not present.

> Other projects includes this file ("iproute2" in file iplink.c for example) 
> and do not report the problem.

iproute2 provides a local header in include/dlfcn.h. The toolchain dlfnc.h 
header is only included when shared library support is enabled:

#ifndef NO_SHARED_LIBS
#include_next <dlfcn.h>
#else
...

> Question: how to fix this error? is it a toolchain issue?

If there is an easy way to make open-lldp support static build, that would be 
best. Otherwise, the fix is to make open-lldp depend on !BR2_STATIC_LIBS, like 
many other packages in Buildroot.

baruch

-- 
? ? http://baruch.siach.name/blog/ ? ? ? ? ? ? ? ? ~. .~? Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
? - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot


   
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180129/4487dccd/attachment.html>
