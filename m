From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 25 May 2019 19:03:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/mono: add libunwind optional
 dependency
In-Reply-To: <20190518224052.42fdd3c5@windsurf>
References: <20190515204721.18722-1-fontaine.fabrice@gmail.com>
 <20190515204721.18722-2-fontaine.fabrice@gmail.com>
 <20190516082910.5ed9ab2c@windsurf>
 <CAPi7W82iu7AYsC0NzXHTiMFvR-4Q6+rfpzPHy_ZLHMn=hZZf0g@mail.gmail.com>
 <20190518224052.42fdd3c5@windsurf>
Message-ID: <9814a7ec-8dc1-b146-01b8-c48f5f1437f7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/05/2019 22:40, Thomas Petazzoni wrote:
> Hello,
> 
> +Arnout in case he has some background knowledge on libunwind.
> 
> On Thu, 16 May 2019 21:43:20 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>>> Did you make some further research to understand what is
>>> _Unwind_GetIP ? Or was your analysis just based on "mono needs
>>> _Unwind_GetIP, it's provided by libunwind, let's link with it" ?  
>> My analysis was based on the fact that the build failures occured only
>> when libunwind was built before mono.
>> I traced back this error to the installation of unwind.h by libunwind
>> which contains the following definition of _Unwind_GetIP:
>> extern unsigned long _Unwind_GetIP (struct _Unwind_Context *);
>>
>> However, libunwind implements _Unwind_GetIP in src/unwind/GetIP.c only
>> if --enable-cxx-exceptions is defined.
>>
>> On his side, mono includes unwind.h if it's available:
>> #ifdef HAVE_UNWIND_H
>> #include <unwind.h>
>> #endif

 But mini-exceptions.c calls _Unwind_GetIP independently of that define. It's
called depending on  MONO_ARCH_HAVE_UNWIND_BACKTRACE, which is set for linux on
arm and amd64 (but strangely enough not on arm64).

 Also, AFAICS gcc will always install unwind.h. So HAVE_UNWIND_H should be set
even if libunwind is not built. The real problem is that libunwind and libgcc
have different definitions of _Unwind_GetIP() on arm: libgcc defines it as a
macro instead of a function.

 So I would say that libunwind is the real problem: it replaces gcc's unwind.h
with its own version, which is not compatible. (It doesn't really replace it; it
just puts another unwind.h earlier in the include path.) Thus, it forces any
package that expects to link with libgcc's unwind to instead link with libunwind.

>> unwind.h and _Unwind_GetIP can also be provided by glibc but that's
>> not the cause of this build failure on musl.
> 
> Hm, did you notice that mono has its own libunwind library, which
> provides _Unwind_GetIP ?
> 
> See:
> 
> external/corert/src/Native/libunwind/src/UnwindLevel1-gcc-ext.c:_LIBUNWIND_EXPORT uintptr_t _Unwind_GetIPInfo(struct _Unwind_Context *context,
> external/corert/src/Native/libunwind/src/UnwindLevel1-gcc-ext.c:  _LIBUNWIND_TRACE_API("_Unwind_GetIPInfo(context=%p)", (void *)context);
> external/corert/src/Native/libunwind/src/UnwindLevel1-gcc-ext.c:  return _Unwind_GetIP(context);
> external/corert/src/Native/libunwind/src/Unwind-EHABI.cpp:    uintptr_t pc = _Unwind_GetIP(context);
> external/corert/src/Native/libunwind/src/Unwind-sjlj.c:_LIBUNWIND_EXPORT uintptr_t _Unwind_GetIP(struct _Unwind_Context *context) {
> external/corert/src/Native/libunwind/src/Unwind-sjlj.c:  _LIBUNWIND_TRACE_API("_Unwind_GetIP(context=%p) => 0x%lX", context,
> external/corert/src/Native/libunwind/src/Unwind-sjlj.c:_LIBUNWIND_EXPORT uintptr_t _Unwind_GetIPInfo(struct _Unwind_Context *context,
> external/corert/src/Native/libunwind/src/Unwind-sjlj.c:  _LIBUNWIND_TRACE_API("_Unwind_GetIPInfo(context=%p, %p) => 0x%lX",
> external/corert/src/Native/libunwind/src/UnwindCursor.hpp:  // This matches the behaviour of _Unwind_GetIP on arm.
> external/corert/src/Native/libunwind/src/UnwindLevel1.c:_LIBUNWIND_EXPORT uintptr_t _Unwind_GetIP(struct _Unwind_Context *context) {
> external/corert/src/Native/libunwind/src/UnwindLevel1.c:  _LIBUNWIND_TRACE_API("_Unwind_GetIP(context=%p) => 0x%" PRIx64,
> external/corert/src/Native/libunwind/src/Unwind_AppleExtras.cpp:NOT_HERE_BEFORE_10_6(_Unwind_GetIP)
> external/corert/src/Native/libunwind/src/Unwind_AppleExtras.cpp:NOT_HERE_BEFORE_10_6(_Unwind_GetIPInfo)
> external/corert/src/Native/libunwind/src/Unwind_AppleExtras.cpp:NOT_HERE_BEFORE_5_0(_Unwind_GetIP)
> external/corert/src/Native/libunwind/src/Unwind_AppleExtras.cpp:NOT_HERE_BEFORE_5_0(_Unwind_GetIPInfo)

 This is a (partial?) copy of LLVM, but it is not actually built. The only files
that are built are Unwind-EHABI.cpp and libunwind.cpp. And AppleExtras on Darwin.

> external/corert/src/Native/libunwind/include/unwind.h:extern uintptr_t _Unwind_GetIP(struct _Unwind_Context *context);
> external/corert/src/Native/libunwind/include/unwind.h:uintptr_t _Unwind_GetIP(struct _Unwind_Context *context) {
> external/corert/src/Native/libunwind/include/unwind.h:// _Unwind_GetIPInfo is a gcc extension that can be called from within a
> external/corert/src/Native/libunwind/include/unwind.h:// personality handler.  Similar to _Unwind_GetIP() but also returns in
> external/corert/src/Native/libunwind/include/unwind.h:extern uintptr_t _Unwind_GetIPInfo(struct _Unwind_Context *context,

 The headers, on the other hand, do get added to the include path.

 Always a good idea to include a header file but not build all of the
corresponding sources...

> 
> Also
> http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic.html#LIBGCC-SMAN
> says _Unwind_GetIP() is supposed to be provided by libgcc_s.
> 
> On the other hand, glibc and uclibc provide a _Unwind_GetIP macro, but

 It's a mystery why they do if gcc already provides the same...

> only for ARM. uClibc libubacktrace also contains this:
> 
> static void backtrace_init (void)
> {
>         void *handle = dlopen (LIBGCC_S_SO, RTLD_LAZY);
> 
>         if (handle == NULL
>                 || ((unwind_backtrace = dlsym (handle, "_Unwind_Backtrace")) == NULL)
>                 || ((unwind_getip = dlsym (handle, "_Unwind_GetIP")) == NULL)) {
>                 printf(LIBGCC_S_SO " must be installed for backtrace to work\n");
>                 abort();
>         }
> }
> 
> So it looks for _Unwind_GetIP in libgcc.
> 
> So, I'm really confused by what is supposed to provide _Unwind_GetIP(),
> and I don't feel comfortable with just saying "libunwind has it, let's
> use it".

 To me it feels similar to -latomic (which I also don't completely understand):
stuff that gets included through some headers that may come from various
sources, and you may or may not need to link with some library depending on what
happens the be the actual source.

 Regards,
 Arnout
