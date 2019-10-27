From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Oct 2019 19:26:57 +0100
Subject: [Buildroot] [PATCH 2/2] package/mono: add libunwind optional
 dependency
In-Reply-To: <CAPi7W80Zm1xJGZjJ8O+25ftKAa-=E9096G8Baf71qp_7NCm9qg@mail.gmail.com>
References: <20190515204721.18722-1-fontaine.fabrice@gmail.com>
 <20190515204721.18722-2-fontaine.fabrice@gmail.com>
 <20190516082910.5ed9ab2c@windsurf>
 <CAPi7W82iu7AYsC0NzXHTiMFvR-4Q6+rfpzPHy_ZLHMn=hZZf0g@mail.gmail.com>
 <20190518224052.42fdd3c5@windsurf>
 <9814a7ec-8dc1-b146-01b8-c48f5f1437f7@mind.be>
 <CA+_SqVasDvmpOpHfYYkbOumhz9tTecnFiMKHqN18ORB+GKCHdA@mail.gmail.com>
 <CAPi7W80Zm1xJGZjJ8O+25ftKAa-=E9096G8Baf71qp_7NCm9qg@mail.gmail.com>
Message-ID: <ffa09f24-23ae-798f-dcf0-83edc7524017@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

 Thomas and I spent a couple of more hours to get to the bottom of this, and it
gets even weirder...

On 16/08/2019 10:34, Fabrice Fontaine wrote:
> Dear Angelo,
> 
> Le ven. 16 ao?t 2019 ? 09:22, Angelo Compagnucci
> <angelo@amarulasolutions.com> a ?crit :
>>
>> Hi All,
>>
>> On Sat, May 25, 2019 at 7:03 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>>
>>>
>>>
>>> On 18/05/2019 22:40, Thomas Petazzoni wrote:
>>>> Hello,
>>>>
>>>> +Arnout in case he has some background knowledge on libunwind.
>>>>
>>>> On Thu, 16 May 2019 21:43:20 +0200
>>>> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>>>>
>>>>>> Did you make some further research to understand what is
>>>>>> _Unwind_GetIP ? Or was your analysis just based on "mono needs
>>>>>> _Unwind_GetIP, it's provided by libunwind, let's link with it" ?
>>>>> My analysis was based on the fact that the build failures occured only
>>>>> when libunwind was built before mono.
>>>>> I traced back this error to the installation of unwind.h by libunwind
>>>>> which contains the following definition of _Unwind_GetIP:
>>>>> extern unsigned long _Unwind_GetIP (struct _Unwind_Context *);
>>>>>
>>>>> However, libunwind implements _Unwind_GetIP in src/unwind/GetIP.c only
>>>>> if --enable-cxx-exceptions is defined.
>>>>>
>>>>> On his side, mono includes unwind.h if it's available:
>>>>> #ifdef HAVE_UNWIND_H
>>>>> #include <unwind.h>
>>>>> #endif
>>>
>>>  But mini-exceptions.c calls _Unwind_GetIP independently of that define. It's
>>> called depending on  MONO_ARCH_HAVE_UNWIND_BACKTRACE, which is set for linux on
>>> arm and amd64 (but strangely enough not on arm64).
>>>
>>>  Also, AFAICS gcc will always install unwind.h. So HAVE_UNWIND_H should be set
>>> even if libunwind is not built. The real problem is that libunwind and libgcc
>>> have different definitions of _Unwind_GetIP() on arm: libgcc defines it as a
>>> macro instead of a function.

 Indeed, gcc installs a copy of unwind.h, but in a different location. What
happens is that normally the unwind.h of gcc is used, because the default search
path is

GCCDIR/include
GCCDIR/../../../../arm-buildroot-linux-gnueabihf/include
STAGING_DIR/usr/include

(GCCDIR is where cc1 etc. are installed; the second include is where the
libstdc++ headers get installed). Because of this order, the unwind.h from gcc
is used, and all is well.

 *However*, in the specific case of a musl toolchain, it is

GCCDIR/../../../../arm-buildroot-linux-gnueabihf/include
STAGING_DIR/usr/include
GCCDIR/include


 And because this is not yet weird enough: when you move the toolchain to a
different location (e.g. when you use it as an external toolchain), the search
path of a musl toolchain becomes

GCCDIR/../../../../arm-buildroot-linux-gnueabihf/include
GCCDIR/include
STAGING_DIR/usr/include


 Therefore, the problem with mono libunwind only occurs for an internal musl
toolchain, not for an external one...


 This is where we gave up...


>>>  So I would say that libunwind is the real problem: it replaces gcc's unwind.h
>>> with its own version, which is not compatible. (It doesn't really replace it; it
>>> just puts another unwind.h earlier in the include path.) Thus, it forces any
>>> package that expects to link with libgcc's unwind to instead link with libunwind.
>>
>> This patch looks right to me. If BR2_PACKAGE_LIBUNWIND is somewhat
>> selected, it should be built before mono else mono will fail to
>> compile.
[snip]
>>>  To me it feels similar to -latomic (which I also don't completely understand):
>>> stuff that gets included through some headers that may come from various
>>> sources, and you may or may not need to link with some library depending on what
>>> happens the be the actual source.

 In conclusion, the most practical solution is to do this, because it is
basically sane: there is an unwind header installed by libunwind, so it makes
sense to also link with it.

 Therefore, I've applied both patches, thanks.

 Regards,
 Arnout
