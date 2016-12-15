From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 15 Dec 2016 19:51:23 +0100
Subject: [Buildroot] [musl] cortex-m support?
In-Reply-To: <7bfe2625-725d-d1bb-7177-f2d31ce09e9c@landley.net>
References: <04e5a294-719e-8029-704f-a57d1ec935b0@landley.net>
 <20161208211116.GO1555@brightrain.aerifal.cx>
 <7bfe2625-725d-d1bb-7177-f2d31ce09e9c@landley.net>
Message-ID: <20161215185123.GX15584@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Rob Landley wrote,

> On 12/08/2016 03:11 PM, Rich Felker wrote:
> > On Tue, Dec 06, 2016 at 11:52:29PM -0600, Rob Landley wrote:
> >> Index: src/setjmp/arm/setjmp.S
> >> ===================================================================
> >> --- src/setjmp/arm/setjmp.S	(revision 0)
> >> +++ src/setjmp/arm/setjmp.S	(revision 4920)
> >> @@ -0,0 +1,45 @@
> >> +.global __setjmp
> >> +.global _setjmp
> >> +.global setjmp
> >> +.type __setjmp,%function
> >> +.type _setjmp,%function
> >> +.type setjmp,%function
> >> +__setjmp:
> >> +_setjmp:
> >> +setjmp:
> >> +	mov ip,r0
> >> +#if defined(__thumb__)
> >> +	stmia ip!,{v1,v2,v3,v4,v5,v6,sl,fp,lr}
> >> +        str sp, [ip], #4
> >> +#else
> >> +	stmia ip!,{v1,v2,v3,v4,v5,v6,sl,fp,sp,lr}
> >> +#endif
> > 
> > My leaning is to just always use the version that works on thumb,
> 
> Presumaby there's a longjmp.S bit too because:
> 
>         ldmia ip!, {v1,v2,v3,v4,v5,v6,sl,fp,sp,lr}
> 
> Make sure you're aware of erratum 752419:
> 
>   https://sourceware.org/ml/binutils/2011-05/msg00087.html
> 
> On a board with a lot of serial traffic, it takes about 3 minutes for
> uClibc (yes, including the current -ng) to crash (by loading the link
> register into the stack pointer and stomping code before the setjmp).
> 
> The emcraft guys fixed this in their cortex-m uClibc fork way back when
> (http://www.emcraft.com/som/building-uclibc), and of _course_ never
> bothered to send it upstream. (Or put it on github with their kernel and
> uboot.) But the source is in their distro tarball, and their patch to
> uClibc's __longjmp.S is basically:
> 
> --- uclibc-1.0.17/libc/sysdeps/linux/arm/__longjmp.S
> +++ emcraft/libc/sysdeps/linux/arm/__longjmp.S
> @@ -56,9 +60,15 @@
>  #if defined(__thumb2__)
>  	/* Thumb-2 does not allow loading sp with ldm.  */
>  	ldmia	ip!,	{v1-v6, sl, fp}
> +#if 0
>  	ldr	sp, [ip], #4
>  	ldr	lr, [ip], #4
>  #else
> +	ldr	sp, [ip, #0]
> +	ldr	lr, [ip, #4]
> +	add	ip, #8
> +#endif
> +#else
>  	ldmia	ip!,	{v1-v6, sl, fp, sp, lr}
>  #endif
> 
> 
> (Dunno why the "add ip, #8" because it's a scratch register and this is
> the last use in the function, but maybe they just made it do exactly
> what the #else case does?)
> 
> cc-ing buildroot because this is still broken in their november release.

I am wondering why you don't cc me or any uclibc related list? 

You still believe uClibc projects should die?

It is really cool and very nice that the communication between Rich
and me is always fruitful. I always report any bugs I find while
testing musl on new or old platforms (mostly via IRC channel) and I
always take care that bugfixes for musl targets end up in buildroot.
(mipsr6 support, binutils microblaze problems, ..)

I really would like to see a similar open communication between the 
nommu community, you and me. 

Just ignoring uClibc-ng does not will make it die.

As a good starting point, a nice bug report and/or test application
which allows me to reproduce the problem would be really
appreciated.

best regards
 Waldemar
