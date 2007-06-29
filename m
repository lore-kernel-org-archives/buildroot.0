From: Tom <fivemiletom@gmail.com>
Date: Thu, 28 Jun 2007 18:00:30 -0700
Subject: [Buildroot] ARM EABI builds
In-Reply-To: <20070628230131.GJ4096@aon.at>
References: <002a01c7b9be$22a79000$7100a8c0@SDW> <20070628230131.GJ4096@aon.at>
Message-ID: <468459AE.40807@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




Bernhard Fischer wrote:
> On Thu, Jun 28, 2007 at 03:54:22PM -0400, Stuart Wood wrote:
>> Just a note on what Tom said about user land application. I've already 
> 
> Just as a note on what everybody seems to say about configuring GCC:
> It is very amusing that you guys seem to be excited about _not_ setting
> a config option -- CONFIG_BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS -- which
> is specifically exported to you, to spell out specific requirements put
> upon gcc (other toolchain parts of course also provide said means for
> hand-crafted  options, mind you).

Speaking for myself, I am not excited about any particular option. Also 
I don't need a doctor for this anymore, as for my part it works. Now.

However, as the combination EABI and ARM9 seems to be popular, I thought 
it would be nice to save others some of this trouble that they are bound 
to run into (*), either by just mentioning the option or by setting it 
automatically in buildroot. If you are saying that 
CONFIG_BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS is better suited for the 
required target CPU option than BR2_EXTRA_GCC_CONFIG_OPTIONS, that could 
very well be.

(*) This is the error I got after kernel boot on ARM920T/EABI default 
config, w/o the required CPU option:
init (1): undefined instruction: pc=00008c60
This error with buildroot and busybox configurations have been mailed to 
this group, please let me know if you would like me to attach this to a bug.


> 
>> found that I had to add -march=armv4t to properly build my application, Just
> 
> doh!
> 
>> because gcc was not using the right load register code for the data 
> 
> well, if you don't tell it to do and _do not help in improving the
> generic situation_ how should we guess what you are trying to achieve?
> 
> Get real. (yes, i'm in a bad mood and i'm fond of stupid whining about
> 'Doctor, it hurts when i..'
> 
> Q:
> Dear X-mas whatever. I want this and that. Now. Immediately. No, i have
> no idea how to implement 'this' 'now', but it has to be done. What? Nah,
> no idea what 'this' nor 'that' nor 'now' is supposed to do, i'd have
> provided a guidance otherwise.
> A: alright. At your service.
> 
>> size I wanted to read. It would use ldrw instead of ldrh. So, It would 
>> help avoid those errors.
> 
> Try searching the archives for CPU selection (from memory, so may not be
> accurate) for further details.
>> Stuart
> 
> See below.
>> Tom wrote:
>>> I did think about adding -mcpu=<cpu> to the build CFLAGS, but that is
>>> not going to help with the problem that libgcc is not going to be 
>>> compiled correctly.
>>>
>> Why not? The kernel image, built with the same "incorrect" toolchain, 
>> must have used only ARMv4 instructions. If it hadn't, I would have never 
>> gotten far enough to even execute vprintf, libc. I would suspect that 
>> the kernel does a better job of setting -mcpu, -mtune. Thus these 
>> options should work for libc too. What makes you think that it wouldn't 
>> work for libc, have you tried? (PS: Even if it did, bug #1406 is 
>> probably the better fix, in particular as buildroot users might use its 
> 
> bug #1406 is completely crap. Let me cite:
> <quote>
>  Reporter  	 bjdooks
>  Summary  	 0001403: printf and anything using vfprintf() hangs
>  system
>  Description 	Any function using vfprintf, such as printf and snprintf
>  cause the system to stop. A test program shows that stdout is
>  functional, as fwrite() to stdout will display messages on the console
>  Additional Information 	uclibc 0.9.29
>  gcc 4.1.2 (arm-linux-uclibcgnueabi)
>  binutils 2.17.50.0.16
>  configure for ARM920T, EABI
> ---
> (0002514)
> bjdooks
> 06-25-07 17:26
> 
> 	The bug is still present in the development snapshot 
> ---
> (0002517)
> bjdooks
> 06-26-07 05:03
> 
> 	Building gcc 4.1.2 for OABI (patches will be sent in seperate
> 	report) does not work either.
> </quote>
>> toolchain to build their own code w/o always setting these options)
> 
> - No actual error shown.
> - no code/arch/toolchain hints to reproduce.
> This is one of the 'Doctor, it hurts'.. goto above;
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
